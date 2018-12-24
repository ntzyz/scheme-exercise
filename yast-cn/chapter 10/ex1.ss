; 修改make-bank-account函数，使得如果取款超过余额则报错。提示：如果你的代码体中有多条 S-表达式，那么可以使用 begin 语句让它们成组。

(define (create-bank-account balance)
  (lambda (n)
    (begin
      (set! balance (+ balance n))
      (if (< balance 0)
        (begin
          (display "Error")
          (set! balance (- balance n)))))
    balance))

(define foobar-account (create-bank-account 10))

(foobar-account 50)

(foobar-account -90)

