; 返回一个实数绝对值的函数。

(define (abs num)
  (if (> num 0)
    num
    (- num)))

; 返回一个实数的倒数的函数。如果参数为0，则返回#f。

(define (inverse num)
  (if (= num 0)
    #f
    (/ 1 num)))

; 将一个整数转化为ASCII码字符的函数。只有在33~126
; 之间的ASCII码才能转换为可见的字符。使用
; integer->char可以将整数转化为字符。如果给定的整数
; 不能够转化为字符，那么就返回#f。

(define (to-char num)
  (if (< num 33)
    #f
    (if (> num 126)
      #f
      (integer->char num))))

