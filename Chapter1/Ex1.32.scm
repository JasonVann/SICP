(define (accumulate combiner null-value term a next b)
    (if (> a b)
        null-value
        (combiner (term a) (accumulate combiner null-value term (next a) next b)))  
)

(define (sum-accum term a next b)
    (accumulate + 0 term a next b))

(define (product-accum term a next b)
    (accumulate * 1 term a next b))

(define (accumulate-iter combiner null-value term a next b)
    (define (iter a result)
        (if (> a b)
            (combiner null-value result)
            (iter (next a) (combiner (term a) result))))
    (iter a null-value))
