#lang racket
; This is a comment. This function counts the number of elements in a list
(define len
  (lambda (lis)
    ; (if condition then-function else-function
    (if (null? lis)
        0
        (+ 1 (len (cdr lis))))))

; Determine if an atam is an element of a list of atoms
; Given an element x and a list lis
; case: the list is empty => #f
; case: list is not empty and the first element is x => #t
; case: list is not empty and the first element is not x => recurse
(define member?
  (lambda (x lis)
    (if (null? lis)
        #f
        ; 'eq?' checks the address
        (if (eq? x (car lis))
            #t
            (member? x (cdr lis))))))

; Another version of member using 'cond' (condition)
(define member2?
  (lambda (x lis)
    (cond
      [(null? lis) #f]
      [(eq? x (car lis)) #t]
      [else (member2? x (cdr lis))])))

; 'sumnumbers' takes a list of numbers and non-numbers and returns the sum of he numbers in the list
; ex: (sumnum '(a 3 b 6)) => 9
; 'number?' will help
(define sumnum
  (lambda (lis)
    (cond
      ((null? lis) 0)
      ((number? (car lis)) (+ (car lis) (sumnum (cdr lis))))
      (else (sumnum (cdr lis))))))

; factorial of a number
; zero? will help
(define factorial
  (lambda (x)
    (cond
      [(zero? x) 1]
      [else (* (factorial (- x 1)) x)])))