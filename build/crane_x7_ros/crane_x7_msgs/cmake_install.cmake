# Install script for directory: /home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/src/crane_x7_ros/crane_x7_msgs

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/crane_x7_msgs" TYPE FILE FILES "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/devel/include/crane_x7_msgs/ServoParameterConfig.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages/crane_x7_msgs" TYPE FILE FILES "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/devel/lib/python3/dist-packages/crane_x7_msgs/__init__.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/devel/lib/python3/dist-packages/crane_x7_msgs/cfg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages/crane_x7_msgs" TYPE DIRECTORY FILES "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/devel/lib/python3/dist-packages/crane_x7_msgs/cfg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/build/crane_x7_ros/crane_x7_msgs/catkin_generated/installspace/crane_x7_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/crane_x7_msgs/cmake" TYPE FILE FILES
    "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/build/crane_x7_ros/crane_x7_msgs/catkin_generated/installspace/crane_x7_msgsConfig.cmake"
    "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/build/crane_x7_ros/crane_x7_msgs/catkin_generated/installspace/crane_x7_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/crane_x7_msgs" TYPE FILE FILES "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/src/crane_x7_ros/crane_x7_msgs/package.xml")
endif()

