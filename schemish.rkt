#lang racket

(define add
  (lambda (n m)
    (cond
      ((zero? m) n)
      (else (add1 (add n (sub1 m))))
    )
  )
)