#lang racket

; a function that has a var it must capture in its closure
; this is a function which returns a function
(define whatdoido
  (lambda ()
    (let ((y 0))
      (lambda (x)
        (begin
          (set! y (+ 1 y))
          (+ x 1))))))

; observe:
;(whatdoido)
;(define f (whatdoido))
;(f 3)