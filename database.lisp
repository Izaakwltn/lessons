;;;;database.lisp

(in-package :lessons)

(defvar *lessons-list* nil)

(defun add-to-lessons-list (lesson)
  (push lesson *lessons-list*))

(defun update-backup (lesson)
  (with-open-file (out (asdf:system-relative-pathname "lessons" "backup.lisp")
		       :direction :output
		       :if-exists :append)
    (format out
	    "~%(add-to-lessons-list ~a ~a ~a ~a ~a ~a)"
	    (write-to-string (month lesson))
	    (write-to-string (day lesson))
	    (write-to-string (last-name lesson))
	    (write-to-string (first-name lesson))
	    (write-to-string (duration lesson))
	    (write-to-string (notes lesson)))))

(defun add-lesson (lesson)
  (add-to-lesson-list lesson)
  (update-backup lesson))

;;;;------------------------------------------------------------------------
;;;;Lesson entry interface
;;;;------------------------------------------------------------------------

(defun prompt-read (prompt)
  (format *query-io* "~a: " prompt)
  (force-output *query-io*)
  (read-line *query-io*))

(defun lesson-entry ()
  (add-lesson (make-lesson :month (prompt-read "Month")
			   :day   (prompt-read "Day")
			   :last-name (prompt-read "Last Name")
			   :first-name (prompt-read "First Name")
			   :duration   (prompt-read "Duration")
			   :notes      (prompt-read "Notes"))))

(Defun enter-lessons ()
  (loop (lesson-entry)
	(if (not (y-or-n-p "Would you like to add another? [y/n]: ")) (return))))
