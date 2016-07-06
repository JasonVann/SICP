; The set of all subsets of a set s is the union of all subsets of (car s) AND the con of (car s) and the sets in case 1
(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (rest) (cons (car s) rest)) rest)))))

(subsets (list 1 2 3))

