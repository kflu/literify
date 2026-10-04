#lang info
(define collection "literify")
(define deps '("scribble-lib"
               "base"
               "rackunit-lib"))
(define build-deps '("scribble-lib" "racket-doc"))
(define scribblings '(("scribblings/literify.scrbl" ())))
(define pkg-desc "show and execute code in scribbles")
(define version "0.0")
(define pkg-authors '(kfl))
