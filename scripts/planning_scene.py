import rospy
from moveit_commander import PlanningSceneInterface
from moveit_msgs.msg import CollisionObject
from shape_msgs.msg import SolidPrimitive
from geometry_msgs.msg import Pose

class Scene:
    def __init__(self) -> None:
        self.scene = PlanningSceneInterface()
        self.object_ids = []

    def add_object(self, object=None):

        if object==None:
            object = CollisionObject()
            object.header.frame_id = 'world'
            object.id = 'box'+str(len(self.object_ids))
            self.object_ids.append(object.id)

            primitive = SolidPrimitive()
            primitive.type = primitive.BOX
            primitive.dimensions = (1, 2, 0.1)

            box_pose = Pose()
            box_pose.orientation.w = 1.0
            box_pose.position.x = 0.68
            box_pose.position.y = 0.0
            box_pose.position.z = 1.0

            object.primitives.append(primitive)
            object.primitive_poses.append(box_pose)
            object.operation = object.ADD

        self.scene.add_object(object)

    def lab_setup(self):
	############## table ##############
        table = CollisionObject()
        table.header.frame_id = 'world'
        table.id = 'box'+str(len(self.object_ids))
        self.object_ids.append(table.id)

        table_primitive = SolidPrimitive()
        table_primitive.type = table_primitive.BOX
        table_primitive.dimensions = (1, 8, 0.1)  # x and y are large so that the robot does not try to reach below 

        table_pose = Pose()
        table_pose.orientation.w = 1.0
        table_pose.position.x = 0.6
        table_pose.position.y = -2.7
        table_pose.position.z = 1.0

        table.primitives.append(table_primitive)
        table.primitive_poses.append(table_pose)
        table.operation = table.ADD

	############## wall ##############
        wall = CollisionObject()
        wall.header.frame_id = 'world'
        wall.id = 'box'+str(len(self.object_ids))
        self.object_ids.append(wall.id)

        wall_primitive = SolidPrimitive()
        wall_primitive.type = wall_primitive.BOX
        wall_primitive.dimensions = (0.1, 8, 8)

        wall_pose = Pose()
        wall_pose.orientation.z = 1.0
        wall_pose.position.x = -0.2
        wall_pose.position.y = -2.7
        wall_pose.position.z = 4.0

        wall.primitives.append(wall_primitive)
        wall.primitive_poses.append(wall_pose)
        wall.operation = wall.ADD

	############## board ##############
        board = CollisionObject()
        board.header.frame_id = 'world'
        board.id = 'box'+str(len(self.object_ids))
        self.object_ids.append(board.id)

        board_primitive = SolidPrimitive()
        board_primitive.type = board_primitive.BOX
        board_primitive.dimensions = (8, 0.1, 8)

        board_pose = Pose()
        board_pose.orientation.z = 1.0
        board_pose.position.x = 3.0
        board_pose.position.y = 1.3
        board_pose.position.z = 4.0

        board.primitives.append(board_primitive)
        board.primitive_poses.append(board_pose)
        board.operation = board.ADD

	############## comp ##############
        comp = CollisionObject()
        comp.header.frame_id = 'world'
        comp.id = 'box'+str(len(self.object_ids))
        self.object_ids.append(comp.id)

        comp_primitive = SolidPrimitive()
        comp_primitive.type = comp_primitive.BOX
        comp_primitive.dimensions = (0.5, 0.5, 1.3)

        comp_pose = Pose()
        comp_pose.orientation.w = 1.0
        comp_pose.position.x = -0.7
        comp_pose.position.y = -1.0
        comp_pose.position.z = 0.65

        comp.primitives.append(comp_primitive)
        comp.primitive_poses.append(comp_pose)
        comp.operation = comp.ADD

	#######################################

        self.scene.add_object(table)
        self.scene.add_object(wall)
        self.scene.add_object(board)
        self.scene.add_object(comp)




