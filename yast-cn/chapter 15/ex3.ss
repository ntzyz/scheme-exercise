; 改进[代码3]中的宏for，使得它可以接受一个参数作为步长。如果省略了步长，则默认为1。

(define-syntax my-for
  (syntax-rules ()
    ((_ (iter from to)) ())
    ()))