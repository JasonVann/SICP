(define (square-sum-larger a b c)
  (define (square num)
    (* num num))
  (cond ((and (> a c) (> b c)) (+ (square a) (square b))) 
        ((and (> a b) (> c b)) (+ (square a) (square c))) 
        ((and (> c a) (> b a)) (+ (square c) (square b)))
        ))
