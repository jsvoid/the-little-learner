#lang racket

(require malt)

(define line
  (lambda (x)
    (lambda (theta)
      (+ (* (ref theta 0) x) (ref theta 1)))))

((line 8) (list 4 6))
