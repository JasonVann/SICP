#lang racket

(require berkeley)
(provide (all-defined-out))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-milliseconds)))

(define (next n)
    (if (= n 2) 3
        (+ n 2)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (current-milliseconds) start-time))
      #f))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (square n) (* n n))

(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor )))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (search-for-primes min)
    (cond ((< min 0) (error "Negative input"))
          ((prime? min) (timed-prime-test min))
             (else (search-for-primes (+ min 1)))))

(search-for-primes 10000000000000)
;10000000000037 2470

