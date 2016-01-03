(define dx 0.1)

(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(define (compose f g)
  (lambda (x) (f (g x))))
(define (repeated f n)
  (cond ((= n 1) (lambda (x) (f x)))
        ((= n 2) (compose f f))
        (else (compose f (repeated f (- n 1))))))

(define (smooth-n f n)
    ((repeated smooth n) f))

