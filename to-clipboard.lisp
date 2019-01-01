(in-package :utils)

(defun to-clipboard (target)
  (typecase target
    (string (to-clipboard* target))
    (t (to-clipboard* (format nil "~A" target)))))

;; Have to run 'xhost +localhost' in order for this to work, because
;; SBCL and Emacs are now started before X comes up
(defun to-clipboard* (string-to-copy)
  (let ((input-stream (make-string-input-stream string-to-copy)))
    (sb-ext:run-program "/usr/bin/xclip" '("-selection" "clipboard")
                        :input input-stream
                        :output *standard-output*
                        :env '((:DISPLAY . ":0.0"))
                        :wait nil)))
