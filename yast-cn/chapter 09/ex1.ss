; 编写函数(read-lines)，该函数返回一个由字符串构成的表，分别代表每一行的内容。
; 在Scheme中，换行符是由#\Linefeed表示。下面演示了将该函数用于"hello.txt"的结果。

(define (read-lines file-name)
  (with-input-from-file file-name (lambda ()
    (let loop((current '())  (res '()) (ch (read-char )))
      (cond
        ((eof-object? ch)
          (reverse (cons (list->string (reverse current)) res)))
        ((eqv? ch #\Linefeed)
          (loop '() (cons (list->string (reverse current)) res) (read-char )))
        (else
          (loop (cons ch current) res (read-char ))))))))

(read-lines "/home/ntzyz/test")
