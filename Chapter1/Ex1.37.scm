(define (cont-frac n d k)
    (define (iter i)
        (if (= i k)
            (/ (n i) (d i))
            (/ (n i) (+ (d i) (iter (+ i 1))))
        ))
    (iter 1))

(define k 10)
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           k)

; k >= 11 so that it's accurate to 4 decimal places

(define (cont-frac-iter n d k)
    (define (iter i result)
        (if (= i k)
            (        
