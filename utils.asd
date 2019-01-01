;;;; utils.asd

(asdf:defsystem utils
  :description "Helper utilities" 
  :serial t
  :components ((:file "package")
               (:file "stumpwm-utils")
	           (:file "to-clipboard"))
  :depends-on (:stumpwm))
