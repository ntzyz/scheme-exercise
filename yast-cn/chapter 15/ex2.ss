; 编写用于从变量中减去一个数的宏decf。如果减量省略了，则从变量中减1。

(define-syntax decf!
  (syntax-rules ()
    ((_ i) (begin (set! i (- i 1)) i))
    ((_ i n) (begin (set! i (- i n)) i))))

(begin
  (define n 5)
  (decf! n) (display n) (newline)
  (decf! n 10) (display n) (newline))