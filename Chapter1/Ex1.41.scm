(define (double f)
    (lambda (x) (f (f x))))

(((double (double double)) inc) 5)
; 21

; Explanation from Scheme wiki:
(((double (double double)) inc) 5) 
  
(((double (lambda (x) (double (double x)))) inc) 5) 
  
; ... similar expansion omitted 
  
((double (double (double (double inc)))) 5) 
  
((double (double (double (lambda (x) (inc (inc x)))))) 5) 
  
; ... similar expansion omitted 
  
(inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc 5)))))))))))))))) 
  
; ... reduction omitted 
  
;21 

