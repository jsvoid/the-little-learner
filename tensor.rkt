#lang racket

(require malt)

(define rank
  (lambda (t)
    (ranked t 0)))

; simple accumulator passing function
; 1. invocation of recursive function is unwrapped
; 2. at most one argument that doesn't change
; 3. an argument that changes towards a true base test
; 4. an argument that accumulates a result
(define ranked
  (lambda (t a)
    (cond
      ((scalar? t) a)
      (else (ranked (tref t 0) (add1 a))))))


(rank (tensor (tensor 1 2) (tensor 3 5)))

(define shape
  (lambda (t)
    (cond
      ((scalar? t) (list))
      (else (cons (tlen t) (shape (tref t 0)))))))

(shape (tensor (tensor 1 3) (tensor 2 4)))

; extended functions for tensor
; descending into the tensor
(+ 4 (tensor 1 2 3))

; sum1
(define sum1
  (lambda (t)
    (summed t (sub1 (tlen t)) 0)))

(define summed
  (lambda (t idx a)
    (cond
      ((< idx 0) a)
      (else (summed t (sub1 idx) (+ (tref t idx) a))))))

(sum1 (tensor 1 2 3 8.1))