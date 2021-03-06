(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (unique-pairs n)
    (flatmap (lambda (i)
                 (map (lambda (j) (list i j))
                      (enumerate-interval 1 (- i 1))))
             (enumerate-interval 1 n)))

(unique-pairs 10)

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
    (map make-pair-sum
         (filter prime-sum? (unique-pairs n))))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(prime-sum-pairs 6)

