; 1. 编写一个将角的单位由度转换为弧度的函数。180度即π弧度。
;    π可以通过下面的式子定义： (define pi (* 4 (atan 1.0)))。
; 2. 编写一个用于计算按照一个常量速度（水平分速度）运动的
;    物体，t秒内的位移的函数。
; 3. 编写一个用于计算物体落地前的飞行时间的函数，参数是垂直
;    分速度。忽略空气阻力并取重力加速度g为9.8m/s^2。
;    提示：设落地时瞬时竖直分速度为-Vy，有如下关系。
;    2 * Vy = g * t此处t为落地时的时间。
；
;     使用问题1-3中定义的函数编写一个用于计算一个以初速度v和角度theta掷出的小球的飞行距离。
; 计算一个初速度为40m/s、与水平方向呈30°的小球飞行距离。这个差不多就是一个臂力强劲的职
; 业棒球手的投掷距离。
;     提示：首先，将角度的单位转换为弧度（假定转换后的角度为theta1）。初始水平、竖直分速
; 度分别表示为：v*cos(theta1)和v*sin(theta1)。落地时间可以通过问题3中定义的函数计算。由
; 于水平分速度不会改变，因此可以利用问题2中的函数计算距离。

(define pi (* 4 (atan 1.0)))

(define (deg-to-rad deg)
  (* deg pi (/ 1 180)))

(define (distance speed time)
  (* speed time))

(define g 9.8)

(define (duration-time speed)
  (* 2 speed (/ 1 g)))

(define (solution begin-angel begin-speed)
  (distance
    (* begin-speed (cos (deg-to-rad begin-angel)))
    (duration-time 
      (* begin-speed (sin (deg-to-rad begin-angel))))))

