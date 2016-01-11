(define us-coins (list 50 25 10 5 1))

(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define no-more? (lambda (x) (null? x)))
(define except-first-denomination (lambda (x) (cdr x)))
(define first-denomination (lambda (x) (car x)))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

(cc 100 us-coins) ;292

(cc 100 uk-coins) ;104561
; The order doesn't affect result

