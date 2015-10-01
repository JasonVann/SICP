(define (same-parity x . y)
    (define (check-parity a b)
        (if (= (modulo a 2) (modulo b 2))
                #t
                #f))
    (define (parity-iter a rest result)
        (if (null? rest) result
            (if (check-parity a (car rest)) 
                    (cons (car rest) (parity-iter a (cdr rest)  result))
                    (parity-iter a (cdr rest) result))))
    (cons x (parity-iter x y nil)))
