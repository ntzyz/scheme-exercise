; ("hi" . "everybody")
(cons "hi" "everybody")

; (0)
(cons 0 '())

; (1 10 . 100)
(cons 1 
  (cons 10 100))

; (1 10 100)
(cons 1
  (cons 10
    (cons 100 '())))

; (#\I "saw" 3 "girls")
(cons #\I
  (cons "saw"
    (cons 3 
      (cons "girls" '()))))

; ("Sum of" (1 2 3 4) "is" 10)
(cons "Sum of" 
  (cons 
    (cons 1 (cons 2 (cons 3 (cons 4 '())))) 
    (cons "is"
      (cons 10 '()))))
