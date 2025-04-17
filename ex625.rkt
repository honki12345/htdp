;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex625) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
; clear-bulb: symbol -> true
; 입력받은 색깔로 색칠된 원을 지우고 새로운 원을 그린다
(define (clear-bulb color)
  (cond
    [(symbol=? color 'red)
     (and (clear-solid-disk (make-posn 25 30) 20)
          (draw-circle (make-posn 25 30) 20 'red))]
    [(symbol=? color 'yellow)
     (and (clear-solid-disk (make-posn 25 80) 20)
          (draw-circle (make-posn 25 80) 20 'yellow))]
    [(symbol=? color 'green)
     (and (clear-solid-disk (make-posn 25 130) 20)
          (draw-circle (make-posn 25 130) 20 'green))]))

; draw-bulb: symbol -> true
; 신호등에서 선택한 신호를 켠다
(define (draw-bulb color)
  (cond
    [(symbol=? color 'red)
     (draw-solid-disk (make-posn 25 30) 20 'red)]
    [(symbol=? color 'yellow)
     (draw-solid-disk (make-posn 25 80) 20 'yellow)]
    [(symbol=? color 'green)
     (draw-solid-disk (make-posn 25 130) 20 'green)]))

; switch: symbol symbol -> true
; 첫번째 신호를 끄고 두번째 신호를 켠다
(define (switch color1 color2)
  (and (clear-bulb color1) (draw-bulb color2)))

; next: symbol->symbol
; 현재 신호를 다음 신호로 바꾸고 변경된 색깔을 반환한다
(define (next current-color)
  (cond
    [(and (symbol=? current-color 'red) (switch 'red 'green)) 'green]
    [(and (symbol=? current-color 'yellow) (switch 'yellow 'red)) 'red]
    [(and (symbol=? current-color 'green) (switch 'green 'yellow)) 'yellow]))

; 신호등의 값 정의
(define WIDTH 50)
(define HEIGHT 160)
(define BULB-RADIUS 20)
(define BULB-DISTANCE 10)

; 각 신호의 위치
(define X-BULBS (quotient WIDTH 2))
(define Y-RED (+ BULB-DISTANCE BULB-RADIUS))
(define Y-YELLOW (+ Y-RED BULB-DISTANCE (* 2 BULB-RADIUS)))
(define Y-GREEN (+ Y-YELLOW BULB-DISTANCE (* 2 BULB-RADIUS)))

; 빨간 신호만 켜진 상태의 신호를 그림
(start WIDTH HEIGHT)
(draw-bulb 'red)
(next (next (next (next 'red))))