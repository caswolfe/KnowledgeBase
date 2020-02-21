#lang racket

; factorial as accumular passing style
; tail-recursive
(define fact-acc
  (lambda (x acc)
    (if (zero? x)
        acc
        (fact-acc (- x 1) (* acc x)))))

; length of a list using an accumulator


; factorial using a "continuation function" to make it tail recursive
; lets us replace the stack with an object in the heap
(define fact-cps
  (lambda (x return)
    (if (zero? x)
        (return 1)
        (fact-cps (- x 1) (lambda (v) (return (* x v)))))))