(define (pascal row col)
    (cond ((< col 0) 0)
            ((and (= col 0) (= row 0)) 1)
            ((and (= col 0) (not (= row 0))) 1)
            ((= col row) 1)
            ((> col row) 0)
            (else (+ (pascal (- row 1) (- col 1)) (pascal (- row 1) col)))))

; another version
(define (pascal row col)
  (cond ((< col 0) 0)
        ((< row col) 0)
        ((and (= row 0) (= col 0)) 1)
        (else (+ (pascal (- row 1) (- col 1)) (pascal (- row 1) col))))
        )

