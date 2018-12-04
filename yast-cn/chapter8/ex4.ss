; 以sin(x)的大小升序排序；

(define (sort-by-sin ss)
  (sort ss (lambda (a b) (< (sin a) (sin b)))))

; 以表长度降序排序；
(define (sort-by-list-length ss)
  (letrec ((length (lambda (ss res)
            (if (null? ss)
              res
              (length (cdr ss) (+ 1 res))))))
    (sort ss (lambda (a b)
              (< (length a 0) (length b 0))))))

