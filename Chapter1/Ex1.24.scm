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

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (search-for-primes min)
    (cond ((< min 0) (error "Negative input"))
          ((fast-prime? min 3) (timed-prime-test min))
             (else (search-for-primes (+ min 1)))))

(search-for-primes 10000000000000)
;10000000000037 2155

