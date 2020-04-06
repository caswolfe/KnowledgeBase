#lang racket

; abstraction as it relates to recursion

(define factorial
  (lambda (n)
    (if (zero? n)
        1
        (* n (factorial (- n 1))))))

(define crash
  (lambda (n)
    (error 'crash)))

; unrole to make functions
(define fact1
  (lambda (n)
    (if (zero? n)
        1
        (* n ((lambda (n)
                (if (zero? n)
                    1
                    (* n (crash (- n 1)))))
              (- n 1))))))

; another version
(define fact2
  ((lambda (f)
     (lambda (n)
       (if (zero? n)
           1
           (* n (f (- n 1))))))
   ((lambda (f)
      (lambda (n)
        (if (zero? n)
            1
            (* n (f (- n 1))))))
   crash)))

; unrolls, so what scheme sees:
; if 6 == 0
;    return 6 *
;        if 5 == 0
;             return 5 * ...
; and it unrolls it from inside out, then coputes
(define fact3
  ((lambda (m)
     ; add m's to unroll
     (m (m (m crash))))
   (lambda (f)
      (lambda (n)
        (if (zero? n)
            1
            (* n (f (- n 1))))))))

;; final abstraction of recursion
(define fact4
  ((lambda (m)
     (m m))
   (lambda (f)
      (lambda (n)
        (if (zero? n)
            1
            (* n ((f f) (- n 1))))))))

; create append using exactly the same model
(define myappend
  ((lambda (m)
     (m m))
   (lambda (f)
     (lambda (lis1 lis2)
       (if (null? lis1)
           lis2
           (cons (car lis1) ((f f) (car lis1) lis2)))))))