(define (make-rat n d)
    (cond ((> (* n d) 0) (cons (abs n) (abs d)))
          (else (cons (0 - (abs n)) (abs d)))))

