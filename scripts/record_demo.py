from ur10_interface_wTraj import UR10
import rospy
from sensor_msgs.msg import JointState
import sys
import signal
import tqdm

RATE = 100

"""
NOTE: Order of the joints when fetched via UR10 class:
        "shoulder_pan_joint",
        "shoulder_lift_joint",
        "elbow_joint",
        "wrist_1_joint",
        "wrist_2_joint",
        "wrist_3_joint"
"""

class UR10_jointstate_recorder:
    def __init__(self, robot):
        self.robot = robot
        self.joint_state_subs = rospy.Subscriber("/joint_states",
                                                 JointState,
                                                 self.record_joint_states
        )
        self.isRecording = False

    def start_recording(self, f):
        self.traj = []
        self.time_array = []
        self.f = f
        self.isRecording = True
        print("Recording...")

    def record_joint_states(self,msg):
        if not self.isRecording:
            return
        self.traj.append(msg.position)
        self.time_array.append(
            rospy.Time(msg.header.stamp.secs,
                       msg.header.stamp.nsecs
            )
        )
    def stop_and_save_recording(self):
        self.f.write(",".join([
            "time",
            "elbow_joint",
            "shoulder_lift_joint",
            "shoulder_pan_joint",
            "wrist_1_joint",
            "wrist_2_joint",
            "wrist_3_joint"
        ])+"\n")
        # Normalize the timestamps:
        t0 = self.time_array[0]
        normalized_time_array = [t-t0 for t in self.time_array]
        for t,x in tqdm.tqdm(zip(normalized_time_array, self.traj)):
            self.f.write(f'{t.to_sec():0.9f},{",".join(map(str,x))}\n')
        self.f.flush()
        self.f.close()
        self.f = None
        print("Finished with recording.")

if __name__=='__main__':
    rospy.init_node("ur10_demonstration")
    rosrate = rospy.Rate(RATE)
    robot = UR10(rate=RATE)
    recorder = UR10_jointstate_recorder(robot=robot)

    input("Press any key to start recording...")
    recorder.start_recording(
        open(sys.argv[1], "w")
    )
    def signal_handler(sig, frame):
        recorder.stop_and_save_recording()
        rospy.signal_shutdown(reason="User stopps the collection...")

    signal.signal(signal.SIGINT, signal_handler)
    while not rospy.is_shutdown():
        rosrate.sleep()

