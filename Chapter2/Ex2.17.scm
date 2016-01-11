(define (last-pair l)
  (cond ((null? l) nil)
        ((null? (cdr l))
            l)
      (else (last-pair (cdr l)))))

