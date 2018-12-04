; 用apply编写练习3中的函数。
; 编写一个将表中所有元素平方的函数，然后求取它们的和，最后求和的平方根。

(define (foo ss)
  (sqrt (apply + (map (lambda (x) (* x x)) ss))))