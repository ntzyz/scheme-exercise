; 编写函数(print-line)，该函数具有任意多的字符作为参数，并将它们输出至标准输出。输出的字符应该用新行分隔。

(define (print-line . lines)
  (let loop((ss lines))
    (if (not (null? ss))
      (begin
        (display (car ss))
        (newline )
        (loop (cdr ss))))))

(print-line "aaa" "bbbbb" "ccc")