from ur10_interface_wTraj import UR10
import rospy
from sensor_msgs.msg import JointState
import sys
import signal
import tqdm
from trajectory_msgs.msg import JointTrajectory, JointTrajectoryPoint
from control_msgs.msg import FollowJointTrajectoryActionGoal

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

class UR10_jointstate_player:
    def __init__(self, robot):
        self.robot = robot
        self.joint_state_subs = rospy.Subscriber("/joint_states",
                                                 JointState,
                                                 self.record_joint_states
        )
        self.isRecording = False

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


def prepare_joint_trajectory(headers, data, direction):
    # check for direction argument values
    assert direction in ["forward","reverse"]

    # prepare time vector
    dts = []
    for i in range(len(data)-1):
        dts.append(
            data[i+1][0]-data[i][0]
        )


    msg = JointTrajectory()
    msg.header.stamp = rospy.Time.now()
    joint_names = headers[:]
    joint_names.remove("time")
    msg.joint_names = joint_names 

    points = []
    if direction =="forward":
        dts.insert(0, dts[0]) # just for length compatibility, practically no meaning.
        for i in range(len(data)-1):
            point = JointTrajectoryPoint()
            point.positions = data[i][1:]
            point.time_from_start = dts[i]
    else:
        dts.insert(-1)

    # if 


if __name__=='__main__':
    rospy.init_node("ur10_demonstration")
    rosrate = rospy.Rate(RATE)
    robot = UR10(rate=RATE)
    player = UR10_jointstate_player(robot=robot)

    input("Press any key to start playing...")
    f = open(sys.argv[1],"r")
    lines = f.readlines()
    # check if headers are OK:
    headers = lines[0].strip("\n").split(",")
    assert set(headers) == set(["time","elbow_joint","shoulder_lift_joint","shoulder_pan_joint","wrist_1_joint","wrist_2_joint","wrist_3_joint"])
    # ---

    # prepare the joint trajectory. but first, move it backward to get to initial pose.
    traj_data = lines[1:]
    traj_follow_goal = prepare_joint_trajectory_goal(
        headers=headers,
        data=traj_data,
        direction = "backward"
    )

    def signal_handler(sig, frame):
        rospy.signal_shutdown(reason="User stopps the collection...")
        signal.signal(signal.SIGINT, signal_handler)
    
    while not rospy.is_shutdown():
        rosrate.sleep()
