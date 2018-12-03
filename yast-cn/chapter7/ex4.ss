; 用递归编写下面的函数。

; 用于翻转表元素顺序的my-reverse函数。（reverse函数是预定义函数）

(define (my-reverse ss)
  (letrec ((foo (lambda (ss res)
            (if (null? ss)
              res
              (foo (cdr ss) (cons (car ss) res))))))
    (foo ss '())))

; 求和由数构成的表。

(define (my-sum ss)
  (letrec ((foo (lambda (ss val) 
            (if (null? ss)
              val
              (foo (cdr ss) (+ val (car ss)))))))
    (foo ss 0)))

; 将一个代表正整数的字符串转化为对应整数。
; 例如，"1232"会被转化为1232。不需要检查不合法的输入。
; 提示，字符到整数的转化是通过将字符#\0……#\9的ASCII减去48，
; 可以使用函数char->integer来获得字符的ASCII码。
; 函数string->list可以将字符串转化为由字符构成的表。

(define (atoi string)
  (letrec ((foo (lambda (ss val)
            (if (null? ss)
              val
              (foo (cdr ss) (+ (* val 10) (- (char->integer (car ss)) 48)))))))
    (foo (string->list string) 0)))