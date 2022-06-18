# Install script for directory: /home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/src/crane_x7_ros/crane_x7_examples

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/crane_x7_examples/srv" TYPE FILE FILES "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/src/crane_x7_ros/crane_x7_examples/srv/ObstacleAvoidance.srv")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/crane_x7_examples/cmake" TYPE FILE FILES "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/build/crane_x7_ros/crane_x7_examples/catkin_generated/installspace/crane_x7_examples-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/devel/include/crane_x7_examples")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/devel/share/roseus/ros/crane_x7_examples")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/devel/share/common-lisp/ros/crane_x7_examples")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/devel/share/gennodejs/ros/crane_x7_examples")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/devel/lib/python3/dist-packages/crane_x7_examples")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/devel/lib/python3/dist-packages/crane_x7_examples")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/build/crane_x7_ros/crane_x7_examples/catkin_generated/installspace/crane_x7_examples.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/crane_x7_examples/cmake" TYPE FILE FILES "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/build/crane_x7_ros/crane_x7_examples/catkin_generated/installspace/crane_x7_examples-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/crane_x7_examples/cmake" TYPE FILE FILES
    "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/build/crane_x7_ros/crane_x7_examples/catkin_generated/installspace/crane_x7_examplesConfig.cmake"
    "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/build/crane_x7_ros/crane_x7_examples/catkin_generated/installspace/crane_x7_examplesConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/crane_x7_examples" TYPE FILE FILES "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/src/crane_x7_ros/crane_x7_examples/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/crane_x7_examples" TYPE DIRECTORY FILES "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/src/crane_x7_ros/crane_x7_examples/launch")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/crane_x7_examples" TYPE PROGRAM FILES "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/build/crane_x7_ros/crane_x7_examples/catkin_generated/installspace/cartesian_path_example.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/crane_x7_examples" TYPE PROGRAM FILES "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/build/crane_x7_ros/crane_x7_examples/catkin_generated/installspace/crane_x7_pick_and_place_demo.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/crane_x7_examples" TYPE PROGRAM FILES "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/build/crane_x7_ros/crane_x7_examples/catkin_generated/installspace/gripper_action_example.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/crane_x7_examples" TYPE PROGRAM FILES "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/build/crane_x7_ros/crane_x7_examples/catkin_generated/installspace/joint_values_example.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/crane_x7_examples" TYPE PROGRAM FILES "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/build/crane_x7_ros/crane_x7_examples/catkin_generated/installspace/joystick_example.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/crane_x7_examples" TYPE PROGRAM FILES "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/build/crane_x7_ros/crane_x7_examples/catkin_generated/installspace/obstacle_avoidance_example.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/crane_x7_examples" TYPE PROGRAM FILES "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/build/crane_x7_ros/crane_x7_examples/catkin_generated/installspace/obstacle_client.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/crane_x7_examples" TYPE PROGRAM FILES "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/build/crane_x7_ros/crane_x7_examples/catkin_generated/installspace/pick_and_place_in_gazebo_example.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/crane_x7_examples" TYPE PROGRAM FILES "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/build/crane_x7_ros/crane_x7_examples/catkin_generated/installspace/pose_groupstate_example.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/crane_x7_examples" TYPE PROGRAM FILES "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/build/crane_x7_ros/crane_x7_examples/catkin_generated/installspace/preset_pid_gain_example.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/crane_x7_examples" TYPE PROGRAM FILES "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/build/crane_x7_ros/crane_x7_examples/catkin_generated/installspace/servo_info_example.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/crane_x7_examples" TYPE PROGRAM FILES "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/build/crane_x7_ros/crane_x7_examples/catkin_generated/installspace/teaching_example.py")
endif()

