;;;;timesheets.lisp

(in-package :lessons)

(defclass lesson ()
  ((month              :initarg :month
		       :accessor month)
   (day                :initarg :day
		       :accessor day)
   (year               :initarg :year
		       :accessor year)
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
		     (year year)
		     (last-name last-name)
		     (first-name first-name)
		     (duration duration)
		     (notes notes))
	obj
      (format stream "~a/~a/~a, ~a ~a, ~a min, ~a" month day year last-name first-name duration notes))))

(defun make-lesson (month day year last-name first-name duration notes)
  (make-instance 'lesson
		 :month month
		 :day day
		 :year year
		 :last-name last-name
		 :first-name first-name
		 :duration duration
		 :notes notes))

(defvar test-lesson (make-lesson 3 26 2022 "Walton" "Izaak" 45 "Arrived"))

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

(defvar month-chart '((1 "January")
		      (2 "February")
		      (3 "March")
		      (4 "April")
		      (5 "May")
		      (6 "June")
		      (7 "July")
		      (8 "August")
		      (9 "September")
		      (10 "October")
		      (11 "November")
		      (12 "December")))

;(defun find-lessons (month year)
 ; (loop for lesson in *lessons-list*
;	if (
;(defun make-month (month year)
 ; "Takes ints month and a year, searches for all matching items in *lessons-list*"
  ;(make-instance 'month :title (second (assoc month month-chart))
;		        :lessons 
		 
(defclass timesheet ()
  ((month  :initarg :month
	   :accessor month)
   (minutes :initarg :minutes
	    :accessor minutes)
   (total   :initarg :total
	    :accessor total)))
;;;;lesson class, timesheet class/template/macro- generate with a function that takes a month's lessons as input
;;;;print function that makes a txt file invoice

;;;;backup.db -> save lessons
;;;;make way to search backup.db in the repl, read, and edit entries

;;;;print.lisp

;;;;backup.lisp

;;;;
