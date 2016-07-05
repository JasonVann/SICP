(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

(define mobile (make-mobile (make-branch 10 25)
                                  (make-branch 5 20)))

(right-branch mobile)

(define (total-weight-iter mobile res)
  (let ((has-sub-mobile?
    (lambda (mobile) (pair?  (right-branch mobile))))) 
  (cond ((null? mobile) res)
        ((has-sub-mobile? mobile) (+ res (total-weight (right-branch mobile))))
        (else (+ res (right-branch mobile))))
))

(define (total-weight mobile)
  (+ (total-weight-iter (left-branch mobile) 0) (total-weight-iter (right-branch mobile) 0))
  )

(define (branch-balanced? mobile)
  (let ((has-sub-mobile?
    (lambda (mobile) (pair?  (right-branch mobile))))) 
  (if (has-sub-mobile? mobile) (balanced? (branch-structure mobile))
        #t
             )))

(define (branch-weight structure)
  (total-weight-iter structure 0))

(define (torque structure)
  (* (branch-length structure) (branch-weight structure)))

(define (balanced? mobile)
  (and (branch-balanced? (left-branch mobile))
       (branch-balanced? (left-branch mobile))
       (equal? (torque (left-branch mobile))
                                 (torque (right-branch mobile))
                                 ))
       )

; Test cases
(total-weight mobile)

(define level-1-mobile (make-mobile (make-branch 2 1) 
                                     (make-branch 1 2))) 
 (define level-2-mobile (make-mobile (make-branch 3 level-1-mobile) 
                                     (make-branch 9 1))) 
 (define level-3-mobile (make-mobile (make-branch 4 level-2-mobile) 
                                     (make-branch 8 2))) 
  
 (total-weight level-1-mobile) 
 (total-weight level-2-mobile) 
 (total-weight level-3-mobile)

(define balance-mobile (make-mobile (make-branch 10 10)
                                          (make-branch 10 10)))

(balanced? balance-mobile)

(define unbalance-mobile (make-mobile (make-branch 0 0)
                                            (make-branch 10 10)))

(balanced? unbalance-mobile)

(define mobile-with-sub-mobile (make-mobile (make-branch 10 balance-mobile)
                                                  (make-branch 10 balance-mobile)))

(balanced? mobile-with-sub-mobile)


