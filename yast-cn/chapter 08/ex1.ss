; 一个将表中所有元素翻倍的函数；

(define (double list)
  (map (lambda (x) (* x 2)) list))

; 一个将两个表中对应位置元素相减的函数；
(define (minus list1 list2)
  (map (lambda (a b) (- a b))
    list1 list2))