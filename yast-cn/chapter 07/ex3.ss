; 一个分别接受一个表ls和一个对象x的函数，该函数返回从
; ls中删除x后得到的表。

(define (remove-item ss target)
  (let loop((ss ss) (res '()))
    (if (null? ss)
      res
      (let ((head (car ss)))
        (loop
          (cdr ss)
          (if (= head target)
            res
            (cons head res)))))))

; 一个分别接受一个表ls和一个对象x的函数，该函数返回
; x在ls中首次出现的位置。索引从0开始。如果x不在ls中，
; 函数返回#f。

(define (index-of ss target)
  (let loop((ss ss) (idx 0))
    (if (null? ss)
      #f
      (if (= (car ss) target)
        idx
        (loop (cdr ss) (+ 1 idx))))))

; 用于翻转表元素顺序的my-reverse函数。（reverse函数是预定义函数）

(define (my-reverse ss)
  (let loop((ss ss) (res '()))
    (if (null? ss)
      res
      (loop (cdr ss) (cons (car ss) res)))))

; 求和由数构成的表。

(define (my-sum ss)
  (let loop((ss ss) (ans 0))
    (if (null? ss)
      ans
      (loop (cdr ss) (+ (car ss) ans)))))

; 将一个代表正整数的字符串转化为对应整数。
; 例如，"1232"会被转化为1232。不需要检查不合法的输入。
; 提示，字符到整数的转化是通过将字符#\0……#\9的ASCII减去48，
; 可以使用函数char->integer来获得字符的ASCII码。
; 函数string->list可以将字符串转化为由字符构成的表。

(define (atoi string)
  (let loop((ss (string->list string)) (res 0))
    (if (null? ss)
      res
      (loop (cdr ss) (+ (* res 10) (char->integer (car ss)) -48)))))

; range函数：返回一个从0到n的表（但不包含n）

(define (range n)
  (let loop((res '()) (current 0))
    (if (= current n)
      res
      (loop (cons (- n current 1) res) (+ current 1)))))