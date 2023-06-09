import rospy
from sensor_msgs.msg import JointState
import sys
import time

rospy.init_node('gui', anonymous=True)

joint_order = [2, 1, 0, 3, 4, 5]

def get_current_state():
    current_state = rospy.wait_for_message("/joint_states", JointState)
    current_state_lst = [current_state.position[i] for i in joint_order]
    return current_state_lst

if __name__=='__main__':
    file_name = sys.argv[1]
    f = open(file_name, 'w')

    while True:
        t0=time.time()
        f.write(str(get_current_state()))
        f.write("\n")
        f.flush()
        #time.sleep(0.01)
        # rospy.sleep(0.005)
