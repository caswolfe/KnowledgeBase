#lang racket
; M_value (<value1> + <value2>, state) = M_value(<value1>, state) + M_value(<value2>, state)
(define Mvalue
  (lambda (expression state)
    (cond
      [(null? expression) (error "parser should have caught this")]
      [(number? expression) expression]
      [(eq? '+ (car (cdr expression))) (+ (Mvalue (car expression) state) (Mvalue(car (cdr (cdr expression))) state))]
      [(eq? '- (car (cdr expression))) (- (Mvalue (car expression) state) (Mvalue(car (cdr (cdr expression))) state))]
      [(eq? '* (car (cdr expression))) (* (Mvalue (car expression) state) (Mvalue(car (cdr (cdr expression))) state))]
      [(eq? '/ (car (cdr expression))) (quotient (Mvalue (car expression) state) (Mvalue(car (cdr (cdr expression))) state))]
      [(eq? '% (car (cdr expression))) (modulo (Mvalue (car expression) state) (Mvalue(car (cdr (cdr expression))) state))]
      [else (error 'badop "The operator is not known")])))