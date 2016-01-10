(define zero 
    (lambda (f) (lambda (x) x)))

(define (add-1 n)
    (lambda (f) 
        (lambda (x)
            (f ((n f) x)))))
  
http://sicp.readthedocs.org/en/latest/chp2/6.html
