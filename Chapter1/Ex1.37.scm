(define (cont-frac n d k)
    (define (iter i)
        (if (= i k)
            (/ (n i) (D i))
            (/ (n i) (+ (d i) (iter (+ i 1))))
        ))
    (iter 1))

(define k 10)
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           k)

