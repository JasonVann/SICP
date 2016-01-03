(define (filtered-accumulate combiner null-value term a next b pred)
    (if (> a b)
        null-value
        (combiner (if (pred a) (term a) null-value) (filtered-accumulate combiner null-value term (next a) next b pred)))  
)

(define (prime? n)
    (define (iter i)
        (if (= i n) #t
            (and (not (= (modulo n i) 0)) (iter (+ i 1)))))
    (iter 2)
)

(define (sum-sq-prime a b)
    (filtered-accumulate + 0 (lambda (x) (* x x)) a (lambda (x) (+ x 1)) b prime?))

(define (rel-prime? x y)
    (= (gcd x y) 1)
)

(define (prod-of-some-numbers n)
    (define (rel-prime2? x)
        (rel-prime? n x))
    (filtered-accumulate * 1 term 1 (lambda (x) (+ x 1)) b rel-prime2?))

