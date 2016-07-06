(define (square-tree3 tree)
  (tree-map square tree))

(define (tree-map f tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree) (tree-map f sub-tree)
             (f sub-tree)
             ))
       tree)
  )

(square-tree3
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))

