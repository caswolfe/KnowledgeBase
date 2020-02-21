#lang racket

; removing all instances of an atom from a list of atoms
(define removeall
  (lambda (a lis)
    (cond
      [(null? lis) '()]
      [(eq? a (car lis)) (removeall a (cdr lis))]
      [else (cons (car lis) (removeall a (cdr lis)))])))

; remove all instances of an atom from a list that can contain sublists and sublists etc
; (removeall* 'x '(a x b x (x x c ((((c x d)) x e))) f x))
(define removeall*
  (lambda (a lis)
    (cond
      [(null? lis) '()]
      ; this handls if were comparing an atom to a list (returns false)
      [(eq? a (car lis)) (removeall* a (cdr lis))]
      [(list? (car lis)) (cons (removeall* a (car lis)) (removeall* a (cdr lis)))]
      [else (cons (car lis) (removeall* a (cdr lis)))])))

; is an element in a list of atoms?
;(define member?
;  (lambda (a lis)
;    (cond
;      [(null? lis) #f]
;      [(eq? a (car lis)) #t]
;      [else (member? a (cdr lis))])))
(define member?
  (lambda (a lis)
    (if (null? lis)
        #f
        (or (eq? a (car lis)) (member? a (cdr lis))))))

; member*
(define member*?
  (lambda (a lis)
    (cond
      [(null? lis) #f]
      ; pair allows you to look for an empty list, use list? to prevent and limit to only an atom search
      [(pair? (car lis)) (or (member*? a (car lis)) (member*? a (cdr lis)))]
      [(eq? a (car lis)) #t]
      [else (member*? a (cdr lis))])))

; emptyall takes a list and removes every non-list atom in the list
; (emptyall '((a)(((b)c)))) => '(()((())))
(define emptyall
  (lambda (lis)
    (cond
      [(null? lis) '()]
      [(not (list? (car lis))) (emptyall (cdr lis))]
      [else (cons (emptyall (car lis)) (emptyall (cdr lis)))])))

;(removefirst* 'x '(a b (c (x d)e x))) => '(a b (c (d) e x))
;(removefirst* 'x '(a b (a b) (c (x d)e x))) =? '(a b (a b) (c (d) e x)))
(define removefirst*
  (lambda (a lis)
    (cond
      [(null? lis) '()]
      [(eq? a (car lis)) (cdr lis)]
      [(list? (car lis)) (cons (removefirst* a (car lis)) (cdr lis))]
      [else (cons (car lis) (removefirst* a (cdr lis)))])))

;(flatten '((a)(((b)c)))) => '(a b c)
(define flatten
  (lambda (lis)
    (cond
      [(null? lis) '()]
      [(list? (car lis)) (append (flatten (car lis)) (flatten (cdr lis)))]
      [ else (cons (car lis) (flatten (cdr lis)))])))