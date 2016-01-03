(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average a b)
    (/ (+ a b) 2))

(define phi1
    (fixed-point (lambda (x) (average x (+ 1 (/ 1 x)))) 1))

(define phi2
    (fixed-point (lambda (x) (average x (+ 1 (/ 1 x)))) -1.0))

