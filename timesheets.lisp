;;;;timesheets.lisp

(in-package :lessons)

(defclass lesson ()
  ((month              :initarg :month
		       :accessor month)
   (day                :initarg :day
		       :accessor day)
   (student-last-name  :initarg :last-name
		       :accessor last-name)
   (student-first-name :initarg :first-name
		       :accessor first-name)
   (duration           :initarg :duration
		       :accessor duration)
   (notes              :initarg :notes
		       :accessor notes)))

(defmethod print-object ((obj lesson) stream)
  (print-unreadable-object (obj stream :type t)
    (with-accessors ((month month)
		     (day day)
		     (last-name last-name)
		     (first-name first-name)
		     (duration duration)
		     (notes notes))
	obj
      (format stream "~a/~a, ~a ~a|~a|~a" month day last-name first-name duration notes))))

(defun make-lesson (month day last first duration notes)
  (make-instance 'lesson
		 :month month
		 :day day
		 :last last-name
		 :first first-name
		 :duration duration
		 :notes notes))

(defclass month ()
  ((title   :initarg :title
	    :accessor title)
   (lessons :initarg :lessons
	    :accessor lessons)
   (year    :initarg :year
	    :accessor year)))

(defmethod print-object ((obj lesson) stream)
  (print-unreadable-object (obj stream :type t)
    (with-accessors ((title title)
		     (lessons lessons)
		     (year year))
	obj
      (format stream "~a, ~a, ~{~%~a~}~%" title year lessons))))


(defclass timesheet ()
  ((month  :initarg :month
	   :accessor month)))
;;;;lesson class, timesheet class/template/macro- generate with a function that takes a month's lessons as input
;;;;print function that makes a txt file invoice

;;;;backup.db -> save lessons
;;;;make way to search backup.db in the repl, read, and edit entries

;;;;print.lisp

;;;;backup.lisp

;;;;
