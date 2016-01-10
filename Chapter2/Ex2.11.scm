(define (make-interval a b) (cons a b))

(define (lower-bound interval)
  (min (car interval) (cdr interval)))

(define (upper-bound interval)
  (max (car interval) (cdr interval)))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (lo-lo x y)
    (* (lower-bound x) (lower-bound y)))
(define (lo-hi x y)
    (* (lower-bound x) (upper-bound y)))
(define (hi-lo x y)
    (* (upper-bound x) (lower-bound y)))
(define (hi-hi x y)
    (* (upper-bound x) (upper-bound y)))

(define (mul-interval2 x y)
    (cond ((<= (upper-bound x) 0) (cond ((<= (upper-bound y) 0) (make-interval (* (upper-bound x) (upper-bound y)) (* (lower-bound x) (lower-bound y))))
          ((>= (lower-bound y) 0) (make-interval (* (lower-bound x) (upper-bound y)) (* (upper-bound x) (lower-bound y))))
          (else (make-interval (lo-hi x y) (hi-lo x y)))))
          ((>= (lower-bound x) 0) (cond ((<= (upper-bound y) 0) (make-interval (lo-hi x y) (hi-lo x y)))
                ((>= (lower-bound y) 0) (make-interval (lo-lo x y) (hi-hi x y)))
                (else (make-interval (lo-hi x y) (hi-lo x y)))))
          (else (cond ((<= (upper-bound y) 0) (make-interval (lo-hi x y) (hi-lo x y)))
                      ((>= (lower-bound y) 0) (make-interval (lo-hi x y) (hi-hi x y))
                )(else (make-interval (min (lo-hi x y) (hi-lo x y)) (max (hi-hi x y) (lo-lo x y))))
        ))))
  
(define (div-interval x y)
  (if (and (>= (upper-bound y) 0
            ) (<= (lower-bound y) 0)
        ) (error "Spans over zero!")
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y))))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (width inv)
    (/ (- (upper-bound inv) (lower-bound inv)) 2))


