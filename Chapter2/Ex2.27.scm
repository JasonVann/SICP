(define (deep-reverse lst)
  (cond ((null? lst) '())
        ((not (pair? lst)) (list lst))
        (else (append (deep-reverse (cdr lst)) (deep-reverse (car lst))))
        ))

(define y (list (list 1 2) (list 3 4)))
(deep-reverse y)

(deep-reverse (list (list 1 2) (list 3 4) (list 5 6)))

