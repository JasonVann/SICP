(define (product term a next b)
    (if (> a b)
        1
        (* (term a) (product term (next a) next b)))
)

(define (product-iter term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (* (term a) result))))
    (iter a 1))

(define (factorial n)
    (product-iter * 1 (lambda (x) (+ x 1)) n)
)

; term: (f 2) = (2*4)/(3*3)
(define pi (* 4 (product (lambda (n) (/ (* n (+ n 2)) (* (+ 1 n) (+ 1 n)))) 2 (lambda (n) (+ n 2)) 1000)))


  
