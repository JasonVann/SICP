(define (cons x y)
    (lambda (m) (m x y)))

(define (car z)
    (z (lambda (p q) p)))

(defien (cdr z)
    (z (lambda (p q) q)))


