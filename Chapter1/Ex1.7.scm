(define (my-sqrt x)
  (define (good-enough? guess1 guess2)
    (< (abs (- (/ guess1 guess2) 1)) 0.001))
  (define (average x y)
    (/ (+ x y) 2))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess1 guess2)
    (if (good-enough? guess1 guess2)
        guess2
        (sqrt-iter guess2 (improve guess1))))
  (sqrt-iter 0.99 1))
