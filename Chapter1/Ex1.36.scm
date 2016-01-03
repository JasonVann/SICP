(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display (se 'guess guess 'next next))
      (newline)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define sol (fixed-point (lambda (x) (/ (log 1000) (log x))) 10)
)

(define (average a b)
    (/ (+ a b) 2))

(define sol-damp (fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 10))
 
