
(cl:in-package :asdf)

(defsystem "robotiq_3f_srvs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Activate" :depends-on ("_package_Activate"))
    (:file "_package_Activate" :depends-on ("_package"))
    (:file "GetMode" :depends-on ("_package_GetMode"))
    (:file "_package_GetMode" :depends-on ("_package"))
    (:file "GetPosition" :depends-on ("_package_GetPosition"))
    (:file "_package_GetPosition" :depends-on ("_package"))
    (:file "GetSpeed" :depends-on ("_package_GetSpeed"))
    (:file "_package_GetSpeed" :depends-on ("_package"))
    (:file "GetTorque" :depends-on ("_package_GetTorque"))
    (:file "_package_GetTorque" :depends-on ("_package"))
    (:file "Move" :depends-on ("_package_Move"))
    (:file "_package_Move" :depends-on ("_package"))
    (:file "Reset" :depends-on ("_package_Reset"))
    (:file "_package_Reset" :depends-on ("_package"))
    (:file "SetMode" :depends-on ("_package_SetMode"))
    (:file "_package_SetMode" :depends-on ("_package"))
    (:file "SetPosition" :depends-on ("_package_SetPosition"))
    (:file "_package_SetPosition" :depends-on ("_package"))
    (:file "SetSpeed" :depends-on ("_package_SetSpeed"))
    (:file "_package_SetSpeed" :depends-on ("_package"))
    (:file "SetTorque" :depends-on ("_package_SetTorque"))
    (:file "_package_SetTorque" :depends-on ("_package"))
  ))