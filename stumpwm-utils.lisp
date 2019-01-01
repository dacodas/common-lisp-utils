(in-package :utils)

(defun renumber-frames ()
  (let ((sorted-frames (stumpwm::sort1 (stumpwm::group-frames (stumpwm::current-group))
			                  (lambda (a b)
				                (let ((a-x (stumpwm::frame-x a))
				                      (a-y (stumpwm::frame-y a))
				                      (b-x (stumpwm::frame-x b))
				                      (b-y (stumpwm::frame-y b)))
				                  (cond ((< a-y b-y) t)
					                    ((eql a-y b-y) (< a-x b-x))
					                    (t nil))))))
	    (new-frame-number -1))

    (loop for frame in sorted-frames 
       do (setf (stumpwm::frame-number frame) (incf new-frame-number)))))
