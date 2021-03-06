(define (reverse l)
  (define (reverse-iter lst result)
  (cond ((null? lst) result)
        ((null? (cdr l))
                (cons (car l) result))
        (else  (reverse-iter (cdr lst) (cons (car lst) result)))))
  (reverse-iter l '()))

; Alternatively
(define (reverse l)
    (foldl cons '() l)
)

