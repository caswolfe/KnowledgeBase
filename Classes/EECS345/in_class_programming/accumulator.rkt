#lang racket

; accumulator passing style factorial function
(define factorial-acc
  (lambda (n acc)
    (if (zero? n)
        acc
        (factorial-acc (- n 1) (* n acc)))))

; continuation passing style factorial function
(define factorial-cps
  (lambda (n return)
    (if (zero? n)
        (return 1)
        (factorial-cps (- n 1) (lambda (v) (return (* n v)))))))

; remove the first matching (kim is big rude) element (in regards to the other input) of a list
(define my-remove
  (lambda (x lis)
    (cond
      [(null? lis) '()]
      [(eq? x (car lis)) (cdr lis)]
      [else (cons (car lis) (my-remove x (cdr lis)))])))

(define remove-cps
  (lambda (x lis return)
    (cond
      [(null? lis) (return '())]
      [(eq? x (car lis)) (return (cdr lis))]
      [else (remove-cps x (cdr lis) (lambda (v) (return (cons (car lis) v))))])))


; removeall
; myappend
; myreverse -> must be tail recursive with only one stack frame!!!!!!

(define removeall
  (lambda (a lis return)
    (cond
      [(null? lis) (return '())]
      [(eq? (car lis) a) (removeall a (cdr lis) return)]
      [else (removeall a (cdr lis) (lambda (v) (return (cons (car lis) v))))])))

(define myappend
  (lambda (lisa lisb return)
    (if (null? lisa)
        (return lisb)
        ;this aint it coach:
        ;(cons (car lisa) (myappend (cdr lisa) lisb return)))))
        (myappend (cdr lisa) lisb (lambda (v) (return (cons (car lisa) v)))))))

(define myreverse
  (lambda (lis return)
    (if (null? lis)
        (return '())
        ;again, aint it
        ;(myappend (myreverse (cdr lis) return) (cons  (car lis) '()) return))))
        (myreverse (cdr lis) (lambda (v) (myappend v (cons (car lis) '()) return))))))


; sumnumbers: takes a list of atoms and sums the atoms in the list
(define sumnumbers
  (lambda (lis)
    (cond
      [(null? lis) 0]
      [(number? (car lis)) (+ (car lis) (sumnumbers (cdr lis)))]
      [else (sumnumbers (cdr lis))])))

(define sumnumbers-cps
  (lambda (lis return)
    (cond
      [(null? lis) (return 0)]
      [(number? (car lis)) (sumnumbers-cps (cdr lis) (lambda (v) (return ( + v (car lis)))))]
      [else (sumnumbers-cps (cdr lis) return)])))

(define sumnumbers*
  (lambda (lis)
    (cond
      [(null? lis) 0]
      [(list? (car lis)) (+ (sumnumbers* (car lis)) (sumnumbers* (cdr lis)))]
      [(number? (car lis)) (+ (sumnumbers* (car lis)) (sumnumbers* (cdr lis)))]
      [else (sumnumbers* (cdr lis))])))

(define sumnumbers*-cps
  (lambda (lis return)
    (cond
      [(null? lis) (return 0)]
      [(list? (car lis)) (sumnumbers*-cps (car lis) (lambda (v1) (sumnumbers*-cps (cdr lis) (lambda (v2) (return (+ v1 v2))))))]
      [((number? (car lis)) (sumnumbers*-cps (cdr lis) (lambda (v) (return (+ v (car lis))))))]
      [else (sumnumbers*-cps (cdr lis))])))

(define removeall*-cps
  (lambda (lis a return)
    (cond
      [(null? lis) (return '())]
      [(eq? a (car lis)) (removeall*-cps (cdr lis) a return)]
      [(list? (car lis)) (removeall*-cps (car lis) a (lambda (v1) (removeall*-cps (cdr lis) a (lambda (v2) (return (cons v1 v2))))))]
      [else (removeall*-cps (cdr lis) a (lambda (v) (return (cons (car lis) v))))])))

(define multiply-cps
  (lambda (lis return break)
    (cond
      [(null? lis) (return 1)]
      [(zero? (car lis)) (break 0)]
      [else (multiply-cps (cdr lis) (lambda (v) (return (* v (car lis)))) break)])))

;
; Feb 17th, 2020
;

; (split '(a b c d e)) -> '(a c e) '(b d)
;(define split-cps
;  (lambda (lis return)
;    (cond
;      ((null? lis) (return '() '()))
;      ((null? (cdr lis)) (return lis '())))
;      (else (split-cps (cddr lis) (lambda (v1 v2) (return (cons (car lis) v1) (cons (cadr lis) v2)))))))

;(define factorial
;  (lambda (n)
;    (call/cc (lambda (k)
;               (if (zero? n)
;                   (begin (set! mycont k) 1)
;                   (* n (factorial (- n 1))))))))


(define multiply-break
  (lambda (lis break)
       (cond
         ((null? lis) 1)
         ((zero? (car lis)) (break 0))
         (else (* (car lis) (multiply-break (cdr lis) break))))))

(define multiply
  (lambda (lis)
    (call/cc (lambda (break) (multiply-break lis break)))))

(define indexof-break
  (lambda (x lis break)
    (cond
      ((null? lis) (break -1))
      ((eq? x (car lis)) 0)
      (else (+ 1 (indexof-break x (cdr lis) break))))))

(define indexof
  (lambda (x lis)
    (call/cc (lambda (break) (indexof-break x lis break)))))