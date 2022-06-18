#! /usr/bin/env python3

import json
import math
import tf
import time
import numpy
import pathlib
import actionlib
import rospy
import moveit_commander
from actionlib_msgs.msg import *
from geometry_msgs.msg import Pose, Point, Quaternion
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from geometry_msgs.msg import Twist, PoseStamped
from object_manipulation.msg import PickUpPoseAction, PickUpPoseGoal, PickUpPoseResult
from enum import Enum
import tf
import tf2_ros
from tf2_geometry_msgs import do_transform_pose
from tf import transformations
from tf.transformations import quaternion_from_euler


class MoveItErrorCodes(Enum):
    SUCCESS = 1
    PLANNING_FAILED = -1
    INVALID_MOTION_PLAN = -2
    MOTION_PLAN_INVALIDATED_BY_ENVIRONMENT_CHANGE = -3
    CONTROL_FAILED = -4
    UNABLE_TO_AQUIRE_SENSOR_DATA = -5
    TIMED_OUT = -6
    PREEMPTED = -7

BASE_PATH = str(pathlib.Path(__file__).parent) + '/../../../../'

class manipuationServer(object):

    def __init__(self, name):
        self.tfBuffer = tf2_ros.Buffer()
        self.tf_l = tf2_ros.TransformListener(self.tfBuffer)

        # # Manipulation
        # rospy.loginfo("Waiting for /pickup_pose AS...")
        # self.pick_as = actionlib.SimpleActionClient('/pickup_pose', PickUpPoseAction)
        # self.pick_as.wait_for_server()
        # rospy.loginfo("Waiting for /place_pose AS...")
        # self.place_as = actionlib.SimpleActionClient('/place_pose', PickUpPoseAction)
        # self.place_as.wait_for_server()
        # self.pick_goal_publisher = rospy.Publisher("pose_pickup/goal", PoseStamped, queue_size=5)
        # self.place_goal_publisher = rospy.Publisher("pose_place/goal", PoseStamped, queue_size=5)
        rospy.loginfo("Loaded everything...")

        self.execute_cb()
    
    def execute_cb(self):
        poseGoal = rospy.wait_for_message("/test/objectpose", PoseStamped)
        poseGoal.pose.position.z -= 0.025
        arm_moveit = moveit_commander.MoveGroupCommander("arm")
        gripper_moveit = moveit_commander.MoveGroupCommander("gripper")
        scene = moveit_commander.PlanningSceneInterface()
        time.sleep(5)
        scene.add_box("box", poseGoal, (0.05, 0.05, 0.05))
        poseGoal.pose.position.z -= 0.06
        scene.add_box("table", poseGoal, (1, 1, 0.03))
        poseGoal.pose.position.z += 0.06

        time.sleep(5)
        
        # Open Gripper
        gripper_moveit.go([0.8, 0.8], wait=True)

        # Go Position
        poseGoal.pose.position.z += 0.05
        poseGoal.pose.orientation.z += 1.57
        arm_moveit.set_pose_target(poseGoal)
        arm_moveit.set_goal_tolerance(0.1)
        arm_moveit.go(wait=True)
        arm_moveit.stop()
        arm_moveit.clear_pose_targets()

        # Close Gripper
        gripper_moveit.go([0.15, 0.15], wait=True)

        # poseGoal = self.transformTo(poseGoal)
        # self.pick(poseGoal)
        return
        poseGoal.pose.position.x += 0.2
        self.place(poseGoal)

    def pick(self, obj_pose):
        class PickScope:
            error_code = 0
            allow_contact_with = []
            object_pose = obj_pose
            result_received = False
        
        def pick_feedback(feedback_msg):
            pass
        
        def pick_callback(state, result):
            PickScope.error_code = result.error_code
            PickScope.result_received = True
            rospy.loginfo("Pick Received")
            rospy.loginfo(PickScope.error_code)

        rospy.loginfo("Pick Action")
        self.pick_as.send_goal(PickUpPoseGoal(object_pose = PickScope.object_pose),
                    feedback_cb=pick_feedback,
                    done_cb=pick_callback)
        
        
        while not PickScope.result_received:
            pass

        return PickScope.error_code
    
    def place(self, obj_pose):
        class PlaceScope:
            error_code = 0
            allow_contact_with = []
            object_pose = obj_pose
            result_received = False
        
        def place_feedback(feedback_msg):
            pass
        
        def place_callback(state, result):
            PlaceScope.error_code = result.error_code
            PlaceScope.result_received = True
            rospy.loginfo("Place Received")
            rospy.loginfo(PlaceScope.error_code)

        rospy.loginfo("Place Action")
        self.place_as.send_goal(PickUpPoseGoal(object_pose = PlaceScope.object_pose),
                    feedback_cb=place_feedback,
                    done_cb=place_callback)
        
        while not PlaceScope.result_received:
            pass

        return PlaceScope.error_code
    
    def transformTo(self, poseStamped, frame_id="base_link"):
        rospy.loginfo("Transforming Pose from frame: " + poseStamped.header.frame_id + " to "+ frame_id)
        ps = PoseStamped()
        ps.pose = poseStamped.pose
        ps.header.stamp = self.tfBuffer.get_latest_common_time(frame_id, poseStamped.header.frame_id)
        ps.header.frame_id = poseStamped.header.frame_id
        transform_ok = False
        while not transform_ok and not rospy.is_shutdown():
            try:
                transform = self.tfBuffer.lookup_transform(frame_id, 
                                       ps.header.frame_id,
                                       rospy.Time(0))
                poseStampedTF = do_transform_pose(ps, transform)
                transform_ok = True
            except tf2_ros.ExtrapolationException as e:
                rospy.logwarn(
                    "Exception on transforming point... trying again \n(" +
                    str(e) + ")")
                rospy.sleep(0.01)
                ps.header.stamp = self.tfBuffer.get_latest_common_time(frame_id, poseStamped.header.frame_id)
        return poseStampedTF

if __name__ == '__main__':
    rospy.init_node('manipulationServer')
    server = manipuationServer(rospy.get_name())
    rospy.spin()