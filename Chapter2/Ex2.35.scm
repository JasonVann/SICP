(define (count-leaves x)
  (accumulate +
              0 (map (lambda (x) (cond ((null? x) 0)
                                        ((pair? x) (count-leaves x))
                                        (else 1)))
                       x)
              ))

(count-leaves (list (list 1 2) (list 3 4)))
(count-leaves (list (list 1 (list 2 3)) (list (list 4 5) (list 6 7))))

