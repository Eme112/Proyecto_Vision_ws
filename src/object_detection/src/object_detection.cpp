#include <ObjectDetectionNode/camera.h>
#include "ros/ros.h"

int main(int argc, char **argv) {
  ros::init(argc, argv, "object_detector");
  ros::NodeHandle n;
  Camera cam(n);
  ros::spin();
  return 0;
}
