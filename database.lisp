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
	    "~%(add-to-lessons-list (make-lesson ~a ~a ~a ~a ~a ~a ~a))"
	    (write-to-string (month lesson))
	    (write-to-string (day lesson))
	    (write-to-string (year lesson))
	    (write-to-string (last-name lesson))
	    (write-to-string (first-name lesson))
	    (write-to-string (duration lesson))
	    (write-to-string (notes lesson)))))

(defun add-lesson (lesson)
  (add-to-lessons-list lesson)
  (update-backup lesson))

;;;;------------------------------------------------------------------------
;;;;Lesson entry interface
;;;;------------------------------------------------------------------------

(defun prompt-read (prompt)
  (format *query-io* "~a: " prompt)
  (force-output *query-io*)
  (read-line *query-io*))

(defun lesson-entry ()
  (add-lesson (make-lesson (parse-integer (prompt-read "Month"))
			   (parse-integer (prompt-read "Day"))
			   (parse-integer (prompt-read "Year"))
			   (prompt-read "Last Name")
			   (prompt-read "First Name")
			   (parse-integer (prompt-read "Duration"))
			   (prompt-read "Notes"))))

(Defun enter-lessons ()
  (loop (lesson-entry)
	(if (not (y-or-n-p "Would you like to add another? [y/n]: ")) (return))))
