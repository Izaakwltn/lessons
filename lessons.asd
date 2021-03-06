;;;;lessons.asd

(asdf:defsystem #:lessons
    :version "0.0.1"
    :author "Izaak Walton <izaakw@protonmail.com>"
    :license "GNU General Purpose License"
    :description "A tool for writing time-sheets/invoices of client appointments."
    :serial t
    :components ((:file "package")
		 (:file "timesheets")
		 (:file "database")
		 (:file "backup")
		 (:file "print")))
