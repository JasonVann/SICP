(cont-frac (lambda (n) 1) (lambda (d) 
    (cond
          ((= (2 (modulo d 3))) (+ 2 (* 2 (quotient d 3))))
          (else 1)))
    10)
 
