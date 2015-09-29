(define (make-point x y)
    (cons x y))

(define (x-point point)
    (car point))

(define (y-point point)
    (cdr point))

(define (make-segment point-A point-B)
    (cons point-A point-B))

(define (start-segment seg)
    (car seg))

(define (end-segment seg)
    (cdr seg))

(define (midpoint-segment seg)
    (make-point (/ (+ (x-point (start-segment seg)) (x-point (end-segment seg))) 2)
                (/ (+ (y-point (start-segment seg)) (y-point (end-segment seg))) 2)))

(define (print-point p)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")")
    (newline))



