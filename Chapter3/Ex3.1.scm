(define (make-accumulator initial)
  (lambda (item)
    (begin (set! initial (+ initial item))
           initial)
    ))

(define A (make-accumulator 5))

(A 10)

(A 10)

