
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

(define (x-coord point) (car point))

(define (y-coord point) (cdr point))

; CCW
(define (make-rec point-A point-B point-C point-D)
    (list point-A point-B point-C point-D))

(define (get-width rec)
    (- (x-coord (list-ref rec 1)) (x-coord (list-ref rec 0))))

(define (get-height rec)
    (abs (- (y-coord (list-ref rec 2)) (y-coord (list-ref rec 1)))))

(define (cal-perimeter rec)
    (* 2 (+ (get-width rec) (get-height rec))))

(define (cal-area rec)
    (* (get-width rec) (get-height rec)))

; CCW |_
(define (make-rec2 segA segB)
    (cons segA segB))

(define (get-width2 rec)
    (abs (- (x-coord (end-segment (cdr rec))) (x-coord (start-segment (cdr rec2))))))

(define (get-height2 rec)
    (abs (- (y-coord (start-segment (car rec))) (y-coord (start-segment (cdr rec))))))

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



