(import sdl-base)
(import chicken.random)

;; constraints
(define screen-width 200)
(define screen-height 200)
(define snake-body-size 10)
(define snake-head-color '(255 255 255))
(define snake-body-color '(192 192 192))
(define snake-food-color '(192   0   0))
(define snake-tick-interval 100)
(define user-input-tick-interval 10)

;; clean a surface (a.k.a fill with black)
(define (clean-surface surface)
  (sdl-fill-rect surface #f (sdl-map-rgb (sdl-surface-pixel-format surface) 0 0 0)))

;; draw a simple block (can be food, or snake head or body)
(define (draw-block x y color surface)
  (sdl-fill-rect
    surface
    (make-sdl-rect
      (* snake-body-size x)
      (* snake-body-size y)
      (- snake-body-size 1)
      (- snake-body-size 1))
    (sdl-map-rgb
      (sdl-surface-pixel-format surface)
      (car color)
      (car (cdr color))
      (car (cdr (cdr color))))))

;; draw the fruit
(define (draw-fruit fruit surface)
  (draw-block
    (car fruit)
    (car (cdr fruit))
    snake-food-color
    surface))

;; draw the head of snake
(define (draw-snake-head snake-head surface)
  (draw-block
    (car snake-head)
    (car (cdr snake-head))
    snake-head-color
    surface))

;; draw the body of snake
(define (draw-snake-body snake-body surface)
  (let loop((current-snake snake-body))
    (if (null? current-snake)
      #t
      (let ((current-body (car current-snake)))
        (begin
          (draw-block
            (car current-body)
            (car (cdr current-body))
            snake-body-color
            surface)
          (loop (cdr current-snake)))))))

;; draw a snake with two functions above
(define (draw-snake snake screen)
  (begin
    (draw-snake-head (car snake) screen)
    (draw-snake-body (cdr snake) screen)))

;; 
(define (get-head-position-next-tick current-head direction)
  (let ((x (car current-head)) (y (car (cdr current-head))))
    (cond
      ((eq? direction 'left ) (list (- x 1) y))
      ((eq? direction 'right) (list (+ x 1) y))
      ((eq? direction 'up   ) (list x (- y 1)))
      ((eq? direction 'down ) (list x (+ y 1))))))

;; remove last body
(define (remove-last-body snake)
  (reverse (cdr (reverse snake))))

;; get user input
(define (get-user-input input)
  (let loop((current-tick 0) (max-tick (/ snake-tick-interval user-input-tick-interval)) (event (make-sdl-event)) (user-input input))
    (if (sdl-poll-event! event)
      (begin
        (if (eq? (sdl-event-type event) SDL_QUIT) (exit 0))
        (if (eq? (sdl-event-type event) SDL_KEYDOWN)
          (begin
            (cond
              ((eq? (sdl-event-sym event) SDLK_ESCAPE) (exit 0))
              ((and (eq? (sdl-event-sym event) SDLK_UP   ) (not (eq? input 'down ))) (set! user-input 'up   ))
              ((and (eq? (sdl-event-sym event) SDLK_DOWN ) (not (eq? input 'up   ))) (set! user-input 'down ))
              ((and (eq? (sdl-event-sym event) SDLK_LEFT ) (not (eq? input 'right))) (set! user-input 'left ))
              ((and (eq? (sdl-event-sym event) SDLK_RIGHT) (not (eq? input 'left ))) (set! user-input 'right)))))
        (if (eq? current-tick max-tick)
          user-input
          (loop current-tick max-tick event user-input)))
      (begin
        (sdl-delay user-input-tick-interval)
        (if (eq? current-tick max-tick)
          user-input
          (loop (+ current-tick 1) max-tick event user-input))))))

;; check if our snake is alive
(define (check-alive snake)
  (let loop(
    (max-x (/ screen-width snake-body-size))
    (max-y (/ screen-height snake-body-size))
    (head-x (car (car snake)))
    (head-y (car (cdr (car snake))))
    (current-body (cdr snake)))
      (cond
        ((< head-x 0) #f)
        ((< head-y 0) #f)
        ((>= head-x max-x) #f)
        ((>= head-y max-y) #f)
        ((null? current-body) #t)
        ((and
          (eqv? head-x (car (car current-body)))
          (eqv? head-y (car (cdr (car current-body)))))
          #f)
        (else (loop max-x max-y head-x head-y (cdr current-body))))))

;; game loop
(define (game-loop snake direction fruit surface)
  (begin
    (if (not (check-alive snake))
      (begin
        (display "YOU DIED\n")
        (exit 0)))
    (clean-surface surface)     ; clean last frame
    (draw-snake snake surface)  ; draw the snake itself
    (draw-fruit fruit surface)  ; draw the fruit
    (sdl-flip surface)          ; flush display
    (let* ((new-directon (get-user-input direction)) (next-head (get-head-position-next-tick (car snake) new-directon)))
      (begin
        (if (equal? next-head fruit)
          (game-loop 
            (cons next-head snake)
            new-directon
            (list 
              (pseudo-random-integer (/ screen-width  snake-body-size))
              (pseudo-random-integer (/ screen-height snake-body-size)))
            surface)
          (game-loop (remove-last-body (cons next-head snake)) new-directon fruit surface))))))

(define (main)
  (begin
    (sdl-init SDL_INIT_VIDEO)
    (define screen (sdl-set-video-mode screen-width screen-height 32 SDL_HWSURFACE))
    (set-pseudo-random-seed! "asasdjdoikwqi1je")
    (game-loop
      '((6 0) (5 0) (4 0) (3 0) (2 0) (1 0) (0 0))
      'right
      (list 
        (pseudo-random-integer (/ screen-width  snake-body-size))
        (pseudo-random-integer (/ screen-height snake-body-size)))
      screen)
    (sdl-quit)))


(main)
