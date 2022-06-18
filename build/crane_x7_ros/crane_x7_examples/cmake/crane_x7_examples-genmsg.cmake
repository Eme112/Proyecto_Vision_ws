# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "crane_x7_examples: 0 messages, 1 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(crane_x7_examples_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/src/crane_x7_ros/crane_x7_examples/srv/ObstacleAvoidance.srv" NAME_WE)
add_custom_target(_crane_x7_examples_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "crane_x7_examples" "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/src/crane_x7_ros/crane_x7_examples/srv/ObstacleAvoidance.srv" "geometry_msgs/Quaternion:geometry_msgs/Vector3:geometry_msgs/PoseStamped:std_msgs/Header:geometry_msgs/Point:geometry_msgs/Pose"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(crane_x7_examples
  "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/src/crane_x7_ros/crane_x7_examples/srv/ObstacleAvoidance.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crane_x7_examples
)

### Generating Module File
_generate_module_cpp(crane_x7_examples
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crane_x7_examples
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(crane_x7_examples_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(crane_x7_examples_generate_messages crane_x7_examples_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/src/crane_x7_ros/crane_x7_examples/srv/ObstacleAvoidance.srv" NAME_WE)
add_dependencies(crane_x7_examples_generate_messages_cpp _crane_x7_examples_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(crane_x7_examples_gencpp)
add_dependencies(crane_x7_examples_gencpp crane_x7_examples_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS crane_x7_examples_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(crane_x7_examples
  "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/src/crane_x7_ros/crane_x7_examples/srv/ObstacleAvoidance.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crane_x7_examples
)

### Generating Module File
_generate_module_eus(crane_x7_examples
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crane_x7_examples
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(crane_x7_examples_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(crane_x7_examples_generate_messages crane_x7_examples_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/src/crane_x7_ros/crane_x7_examples/srv/ObstacleAvoidance.srv" NAME_WE)
add_dependencies(crane_x7_examples_generate_messages_eus _crane_x7_examples_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(crane_x7_examples_geneus)
add_dependencies(crane_x7_examples_geneus crane_x7_examples_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS crane_x7_examples_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(crane_x7_examples
  "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/src/crane_x7_ros/crane_x7_examples/srv/ObstacleAvoidance.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crane_x7_examples
)

### Generating Module File
_generate_module_lisp(crane_x7_examples
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crane_x7_examples
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(crane_x7_examples_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(crane_x7_examples_generate_messages crane_x7_examples_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/src/crane_x7_ros/crane_x7_examples/srv/ObstacleAvoidance.srv" NAME_WE)
add_dependencies(crane_x7_examples_generate_messages_lisp _crane_x7_examples_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(crane_x7_examples_genlisp)
add_dependencies(crane_x7_examples_genlisp crane_x7_examples_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS crane_x7_examples_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(crane_x7_examples
  "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/src/crane_x7_ros/crane_x7_examples/srv/ObstacleAvoidance.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crane_x7_examples
)

### Generating Module File
_generate_module_nodejs(crane_x7_examples
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crane_x7_examples
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(crane_x7_examples_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(crane_x7_examples_generate_messages crane_x7_examples_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/src/crane_x7_ros/crane_x7_examples/srv/ObstacleAvoidance.srv" NAME_WE)
add_dependencies(crane_x7_examples_generate_messages_nodejs _crane_x7_examples_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(crane_x7_examples_gennodejs)
add_dependencies(crane_x7_examples_gennodejs crane_x7_examples_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS crane_x7_examples_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(crane_x7_examples
  "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/src/crane_x7_ros/crane_x7_examples/srv/ObstacleAvoidance.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crane_x7_examples
)

### Generating Module File
_generate_module_py(crane_x7_examples
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crane_x7_examples
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(crane_x7_examples_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(crane_x7_examples_generate_messages crane_x7_examples_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/emerico/Documents/ProyectoVision/ProyectoFinal_ws/src/crane_x7_ros/crane_x7_examples/srv/ObstacleAvoidance.srv" NAME_WE)
add_dependencies(crane_x7_examples_generate_messages_py _crane_x7_examples_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(crane_x7_examples_genpy)
add_dependencies(crane_x7_examples_genpy crane_x7_examples_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS crane_x7_examples_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crane_x7_examples)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/crane_x7_examples
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(crane_x7_examples_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(crane_x7_examples_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crane_x7_examples)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/crane_x7_examples
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(crane_x7_examples_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(crane_x7_examples_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crane_x7_examples)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/crane_x7_examples
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(crane_x7_examples_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(crane_x7_examples_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crane_x7_examples)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/crane_x7_examples
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(crane_x7_examples_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(crane_x7_examples_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crane_x7_examples)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crane_x7_examples\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/crane_x7_examples
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(crane_x7_examples_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(crane_x7_examples_generate_messages_py geometry_msgs_generate_messages_py)
endif()
