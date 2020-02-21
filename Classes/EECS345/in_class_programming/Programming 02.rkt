#lang racket

; repeat takes an atom and a number and creates a list w/ that many cpies of the atom
; ex: (repeat 'x 6) => '(x x x x x x)
(define repeat
  (lambda (a n)
    (if (zero? n)
        '()
        (cons a (repeat a (- n 1))))))

; myremove takes an atom and a list and returns the list (*) with the first copy of the atom removed
; ex: (myremove x '(a b x c x d)) => '(a b c x d)
(define myremove
  (lambda (a lis)
    (cond
      [(null? lis) '()]
      [(eq? (car lis) a) (cdr lis)]
      [else (cons (car lis) (myremove a (cdr lis)))])))

; myremoveall takes an atom and a list of atoms and removes all copies of the atom from the list of atom
(define myremoveall
  (lambda (a lis)
    (cond
      [(null? lis) '()]
      [(eq? (car lis) a) (myremoveall a (cdr lis))]
      [else (cons (car lis) (myremoveall a (cdr lis)))])))

; replaceall replaces all occurances of the first atom with the second atom in a list of atoms
(define replaceall
  (lambda (a b lis)
    (cond
      [(null? lis) '()]
      [(eq? (car lis) a) (cons b (replaceall a b (cdr lis)))]
      [else (cons (car lis) (replaceall a b (cdr lis)))])))

; squars takes a list of numbers and produces the square of those numbers
(define squars
  (lambda (lis)
    (if (null? lis)
        '()
        (cons (* (car lis) (car lis)) (squars (cdr lis))))))

; myappend takes two lists of atoms, appends the second list AFTER the first list
; assumes both lists are populated by atleast one atom
(define myappend
  (lambda (lisa lisb)
    (if (null? lisa)
        lisb
        (cons (car lisa) (myappend (cdr lisa) lisb)))))

; myreverse takes a list and reverses its contents
(define myreverse
  (lambda (lis)
    (if (null? lis)
        '()
        (myappend (myreverse (cdr lis)) (cons (car lis) '())))))