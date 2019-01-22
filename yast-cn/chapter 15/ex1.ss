; 编写一个宏，其语义为：当谓词求值为假时执行相应的表达式。（语义与when相反。）

(define-syntax unless
  (syntax-rules ()
    ((_ pred arg ...)
     (if (not pred) (begin arg ...)))))

(unless (= 1 2) (display "this should be printed") (newline))
(unless (= 1 1) (display "this should not be printed") (newline))
