; 用于统计表中元素个数的my-length函数。（length是一个预定义函数）。
(define (my-length ss)
  (if (null? ss)
    0
    (+ 1 (my-length (cdr ss)))))

; 一个求和表中元素的函数。
(define (sum ss)
  (if (null? ss)
    0
    (+ (car ss) (sum (cdr ss)))))

; 一个分别接受一个表ls和一个对象x的函数，该函数返回从
; ls中删除x后得到的表。
(define (remove-item ss item)
  (if (null? ss)
    '()
    (if (eq? (car ss) item)
      (remove-item (cdr ss) item)
      (cons (car ss) (remove-item (cdr ss) item)))))

; 一个分别接受一个表ls和一个对象x的函数，该函数返回
; x在ls中首次出现的位置。索引从0开始。如果x不在ls中，
; 函数返回#f。

(define (foo ss target current)
  (if (null? ss)
    #f
    (if (= (car ss) target)
      current
      (foo (cdr ss) target (+ current 1)))))

(define (index-of ss target)
  (foo ss target 0))

