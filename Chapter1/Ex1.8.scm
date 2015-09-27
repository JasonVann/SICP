
(define (cube-roott x)
  (define (good-enough? guess1 x)
    (< (abs (- (/ (* guess1 guess1 guess1) x) 1)) 0.001))
  (define (improve x y)
    (/ (+ (/ x (* y y)) (* 2 y)) 3))
  (define (cube-root-iter guess1 x)
    (if (good-enough? guess1 x)
        guess1
        (cube-root-iter (improve x guess1) x)))
  (cube-root-iter 1.0 x))
