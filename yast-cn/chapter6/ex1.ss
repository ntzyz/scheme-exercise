(define (solution-ng begin-angel begin-speed)
  (let* (
    (pi (* 4 (atan 1.0)))
    (g 9.8)
    (rad (* begin-angel pi (/ 1 180))))
      (* 
        (* begin-speed (cos rad))
        (* 2 begin-speed (sin rad) (/ 1 g)))))

(solution-ng 30 40)