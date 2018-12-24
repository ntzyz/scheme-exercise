; 编写一个函数title-style，该函数用于将每个单词的首字母大写。

(define (split-string-by-space str)
  (let loop((ss (string->list str)) (current-word '()) (res '()))
    (if (null? ss)
      (reverse (cons (list->string (reverse current-word)) res))
      (if (char-whitespace? (car ss))
        (loop (cdr ss) '() (cons (list->string (reverse current-word)) res))
        (loop (cdr ss) (cons (car ss) current-word) res)))))

(define (upper-first-char str)
  (let ((ss (string->list str)))
    (list->string (cons (char-upcase (car ss)) (cdr ss)))))

(define (title-style str)
  (let ((splitted-str (split-string-by-space str)))
    (fold-left
      (lambda (res cur) (string-append res " " (upper-first-char cur)))
      (upper-first-char (car splitted-str))
      (cdr splitted-str))))

(title-style "the cathedral and the bazaar")