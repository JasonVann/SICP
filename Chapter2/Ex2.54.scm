(define (equal? a b)
  (cond ((and (pair? a) (pair? b)) (and (equal? (car a) (car b)) (equal? (cdr a) (cdr b))))
        ((and (not (pair? a)) (not (pair? b))) (eq? a b))
        (else #f)
        ))

(equal? (list 3 4) (list 3 4) )
(equal? '(this is a list) '(this (is a) list))
(equal? '(this is a list) '(this is a list))

