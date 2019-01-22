; 编写一个用于计算两向量内积的函数。

(define (dot-product vector-a vector-b)
  (let loop((offset 0) (res 0))
    (if (eq? (vector-length vector-a) offset)
      res
      (loop (+ 1 offset) (+ res (* (vector-ref vector-a offset) (vector-ref vector-b offset)))))))

(dot-product '#(1 2) '#(3 4))