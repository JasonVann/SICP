(define (compose f g)
  (lambda (x) (f (g x))))
(define (repeated f n)
  (cond ((= n 1) (lambda (x) (f x)))
        ((= n 2) (compose f f))
        (else (compose f (repeated f (- n 1))))))

(define (root n x)
    
)

((repeated square 2) 5)
; 625

