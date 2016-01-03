(define (iterative-improve good-enough? improve)
    (define (next guess)
        (improve guess))
    (lambda (guess) (if (good-enough? guess (improve guess)) (improve guess)
                    ((iterative-improve good-enough? improve) (improve guess) ))))

(define (my-sqrt x)
    ((iterative-improve (lambda (guess next) (< (abs (- next guess)) 0.0001)) (lambda (guess) (/ (+ guess (/ x guess)) 2))) 1.0))

(define (my-fixed-point f guess)
    ((iterative-improve (lambda (v1 v2) (< (abs (- v1 v2)) 0.0001)) (lambda (x) (f x))) guess))


