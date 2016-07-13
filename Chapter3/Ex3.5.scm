(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random  range))))

 (define (get-area lower-x lower-y upper-x upper-y) 
   (* (- upper-x lower-x) 
      (- upper-y lower-y))) 
  
 (define (estimate-integral pred lower-x lower-y upper-x upper-y trials) 
   (let ([area (get-area lower-x lower-y upper-x upper-y)] 
        ) 
     (* area (monte-carlo trials (lambda () (pred (random-in-range lower-x upper-x) 
                                      (random-in-range lower-y upper-y))))
        )))

 (estimate-integral (lambda (x y) (<= (+ (* x x) (* y y)) 1.0)) -1.0 -1.0 1.0 1.0 1000) 

