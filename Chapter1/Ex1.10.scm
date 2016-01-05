; Ackermann's function
(define (A x y)
    (cond ((= y 0) 0)
          ((= x 0) 0)
          ((= y 1) 2)
          (else (A (- x 1)
                (A x (- y 1))))))

(define (f n) (A 0 n))
; 2*n

(define (g n) (A 1 n))
; (A 0 (A 1 (- n 1)))
; (* 2 (A 0 (A 1 (- n 2))))
; (* 2 2 (A 1 (- n 2)))
; (* 2 2 2 (A 1 (- n 3)))
; 2^n

(define (h n) (A 2 n))
; (A 2 n)
; (A 1 (A 2 (- n 1)))
; (A 0 (A 1 (- (A 2 (- n 1)) 1)))
; (* 2 (A 0 (- (- (A 2 (- n 1)) 1) 1) ))
; (* 2 2 (- (- (A 
; (A 0 (- (A 2 (- n 1)) 1))
; (* 2 (- (A 1 (A 2 (- n 2)) 

(define (k n) (* 5 n n)
; 5*n^2
