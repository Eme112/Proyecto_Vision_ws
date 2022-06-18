
(cl:in-package :asdf)

(defsystem "crane_x7_examples-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "ObstacleAvoidance" :depends-on ("_package_ObstacleAvoidance"))
    (:file "_package_ObstacleAvoidance" :depends-on ("_package"))
  ))