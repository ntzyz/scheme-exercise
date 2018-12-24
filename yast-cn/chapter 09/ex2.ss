; 编写函数(my-copy-file)实现文件的拷贝。

(define (my-copy-file source-name dest-name)
  (let  ((read-file (lambda (file-name)
          (with-input-from-file file-name (lambda ()
            (let loop((res '()) (ch (read-char )))
              (if (eof-object? ch)
                (reverse res)
                (loop (cons ch res) (read-char ))))))))
        (write-file (lambda (file-name data)
          (with-output-to-file file-name (lambda ()
            (let loop((ss data))
              (if (null? ss)
                #t
                (begin
                  (display (car ss))
                  (loop (cdr ss))))))))))
    (write-file dest-name (read-file source-name))))

(my-copy-file "/home/ntzyz/test" "/home/ntzyz/test2")
