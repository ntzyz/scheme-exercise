; 滤取（Filtering Out）出一个表中的偶数；
(define (filtering-even ss)
  (keep-matching-items ss even?))

; 滤取出不满足10 ≤ x ≤ 100的数；
(define (my-filter ss)
  (keep-matching-items ss (lambda (x) (not (<= 10 x 100)))))
