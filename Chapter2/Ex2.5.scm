(define (cons a b)
    (* (expt 2 a) (expt 3 b)))

(define (car z)
    (cond ((= z 0) 0)
    (else
        (if (= 0 (remainder z 2)) (+ 1 (car (/ z 2))) 0 ))))

(define (cdr z)
    (cond ((= z 0) 0)
    (else 
        (if (= 0 (remainder z 3)) (+ 1 (cdr (/ z 3))) 0 )))) 
