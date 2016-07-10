(define (triad n s)
  (filter (lambda (list) (= (accumulate + 0 list) s)) 
    (flatmap (lambda (i)
           (flatmap (lambda (j)
             (map (lambda (k)
               (list i j k))
               (enumerate-interval 1 n)))
             (enumerate-interval 1 n)))
           (enumerate-interval 1 n))
    ))

(triad 10 23)

