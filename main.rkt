#lang racket/base

(require scribble/manual racket/format)
(provide (all-defined-out))

(define-syntax-rule (code/eval expr ...)
  (begin
    (racketblock expr ...)
    (begin expr ...)))

(define-syntax-rule (code/format format expr ...)
  (begin
    (racketblock expr ...)
    "⇒  "
    (code (format (begin expr ...)))))

(define-syntax-rule (code/display expr ...) (code/format ~a expr ...))
(define-syntax-rule (code/print expr ...) (code/format ~v expr ...))
(define-syntax-rule (code/write expr ...) (code/format ~s expr ...))
