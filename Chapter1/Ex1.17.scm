(define (mul a b)
    (define (double a)
        (* a 2))
    (define (halve a)
        (/ a 2))
    (cond ((= b 1) a)
            ((even? b) (mul (double a) (halve b)))
            (else (+ a (mul a (- b 1))))))

