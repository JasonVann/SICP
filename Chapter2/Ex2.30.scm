 (define (square-tree tree)
   (cond ((null? tree) nil)
         ((not (pair? tree)) (* tree tree))
         (else (cons (square-tree (car tree))
                     (square-tree (cdr tree))
                     ))))

; Or using higher-order proc
(define (square-tree2 tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree) (square-tree2 sub-tree)
         (* sub-tree sub-tree)
             ))
       tree))

(square-tree2
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))

