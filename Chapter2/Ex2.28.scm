(define (fringe lst)
  (if (null? lst) nil
      (if (not (pair? lst)) (list lst)
         (append (fringe (car lst)) (fringe (cdr lst)))
         )))

(define x (list (list 1 2 3 ) (list 4 5 6)))
(fringe x)
(fringe (list x x))


