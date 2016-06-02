; Recursive version
(define (f-recur n)
    (if (< n 3)
        n
        (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

; Then the iterative version
(define (f n)
  (define (f-iter a b c n)
    (if (< n 3)
        a
    (f-iter (+ a (* 2 b) (* 3 c)) a b (- n 1))))
  (if (< n 3) 
       n 
       (f-iter 2 1 0 n)))

; Another iterative version
(define (f n)
  (define (f-iter a b c i n)
    (cond
          ((< n 3) n)
          ((= n i) a)
         (else (f-iter (+  a (* 2 b) (* 3 c)) a b (+ i 1) n))
        )
    )
  (f-iter 2 1 0 1 n)
  )
