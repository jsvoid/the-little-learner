#lang racket

(require malt)

(define line-xs (tensor 2.0 1.0 4.0 3.0))
(define line-ys (tensor 1.8 1.2 4.2 3.3))

(define l2-loss
  (lambda (target)
    (lambda (xs ys)
      (lambda (theta)
        (let ((pred-ys ((target xs) theta)))
          (sum (sqr (- ys pred-ys))))))))

; expectant function
(l2-loss line)

; objective function
((l2-loss line) line-xs line-ys)


(((l2-loss line) line-xs line-ys) (list 0.6263 0.0))