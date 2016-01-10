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

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (width inv)
    (/ (- (upper-bound inv) (lower-bound inv)) 2))

; sum: (width (x + y)) = (((x2 + y2) - (x1 + y1)))/2
                    ;  = (x2 - x1) / 2 + (y2 - y1)/2

; mul: 
(define i (make-interval 2 7))
(define j (make-interval 8 3))
(width i)
; 2.5
(width j)
; 2.5
(define mul (mul-interval i j))
; (6 . 56)
(width mul)
; 50
(define i2 (make-interval -2 -7))
(define j2 (make-interval -8 -3))

(define mul2 (mul-interval i2 j2))
(width mul2)
; 25
; This is not equal to width mul

