(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))

(define m (list (list 1 2 3 4)
                      (list 4 5 6 6)
                      (list 6 7 8 9)))

(define v (list 1 2 3 4))

(matrix-*-vector m v)

(define (transpose mat)
  (accumulate-n cons '() mat))

(transpose m)

(define (matrix-*-matrix m n)
  (let ((trans-n (transpose n)))
        (map (lambda (col-of-m)
                (matrix-*-vector trans-n col-of-m))
                m)))

(matrix-*-matrix m (transpose m))

