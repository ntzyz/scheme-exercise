; 自己实现keep-matching-items。

(define (my-keep-matching-items proc ss)
  (letrec ((foo (lambda (ss res)
            (if (null? ss)
              (letrec ((my-reverse (lambda (ss res)
                        (if (null? ss)
                          res
                          (my-reverse (cdr ss) (cons (car ss) res))))))
                (my-reverse res '()))
              (let ((head (car ss)))
                (if (proc head)
                  (foo (cdr ss) (cons head res))
                  (foo (cdr ss) res)))))))
    (foo ss '())))

; 自己实现map
; (my-map + '(1 2 3) '(10 20 30))

(define (my-map proc . ss)
  (letrec ((map-like-javascript (lambda (proc ss)
            (if (null? ss)
              '()
              (cons (proc (car ss)) (map-like-javascript proc (cdr ss))))))
            (foo (lambda (ss)
              (if (eqv? (car ss) '())
              '()
              (cons
                (apply proc (map-like-javascript car ss))
                (foo (map-like-javascript cdr ss)))))))
    (foo ss)))
