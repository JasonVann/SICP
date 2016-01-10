(define (make-interval a b) (cons a b))

; We assum that the lower-bound may not necessarily on the left
(define (lower-bound interval)
    (min (car interval) (cdr interval)))

(define (upper-bound interval)
    (max (car interval) (cdr interval)))

