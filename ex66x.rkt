;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex66x) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
; DATA DEFINITION
; circle is struct
; (make-circle P R C)
; P는 원의 중심을 나타내는 posn
; R은 반지름을 나타내는 number
; C는 색깔을 나타내는 symbol
(define-struct circle (center radius color))

; DATA EXAMPLE
(make-circle (make-posn 3 2) 20 'red)

; TEMPLATE
;(define (fun-for-circle a-circle)
;  ... (circle-center a-circle) ...
;  ... (circle-radius a-circle) ...
;  ... (circle-color a-circle) ...)

; draw-a-circle: circle -> true
; circle 구조체를 입력받아 화면에 그린다
(define (draw-a-circle c)
  (draw-circle (circle-center c)
               (circle-radius c)
               (circle-color c)))

; distance-two-posn: posn posn -> number
; 두 점 사이의 거리를 계산한다
(define (distance-two-posn posn1 posn2)
  (sqrt (+ (sqr (- (posn-x posn1) (posn-x posn2)))
           (sqr (- (posn-y posn1) (posn-y posn2))))))

; tests
(check-expect (distance-two-posn (make-posn 3 3) (make-posn 1 3)) 2)

; in-circle?: circle posn -> boolean
; 주어진 점이 주어진 원 안에 있는지 결정한다
(define (in-circle? circle posn)
  (<= (distance-two-posn (circle-center circle) posn)
     (circle-radius circle)))

; tests
(check-expect (in-circle? (make-circle (make-posn 6 2)
                                       1
                                       'red)
                          (make-posn 6 1.5))
              true)
(check-expect (in-circle? (make-circle (make-posn 6 2)
                                       1
                                       'red)
                          (make-posn 8 6))
              false)

; translate-circle: circle number -> circle
; 주어진 원의 중심에서 오른쪽으로 delta 픽셀만큼 떨어진 곳에 있는 circle 구조체다
(define (translate-circle c delta)
  (make-circle (make-posn (+ (posn-x (circle-center c)) delta)
                          (posn-y (circle-center c)))
               (circle-radius c)
               (circle-color c)))

; tests
(check-expect (translate-circle (make-circle (make-posn 6 2) 1 'red)
                                1)
              (make-circle (make-posn 7 2) 1 'red))

; clear-a-circle: circle -> true
; circle 구조체를 입력받아 해당 원을 화면에서 지운다
(define (clear-a-circle c)
  (clear-circle (circle-center c)
                (circle-radius c)))

; draw-and-clear-circle: circle -> true
; 입력받은 원을 그리고 잠시 기다린 다음 삭제하고 true 를 반환한다
(define (draw-and-clear-circle c)
  (and (draw-a-circle c)
       (sleep-for-a-while 2)
       (clear-a-circle c)))


; move-circle: number circle -> circle
; 원을 그렸다가 지운 후에 이를 delta 픽셀만큼 이동함
(define (move-circle delta a-circle)
  (cond
    [(draw-and-clear-circle a-circle) (translate-circle a-circle delta)]
    [else a-circle]))

; tests
(start 300 300)
(draw-a-circle (make-circle (make-posn 20 20) 15 'red))

; clear-a-circle test
;(clear-a-circle (make-circle (make-posn 20 20) 15 'red))

(draw-and-clear-circle (make-circle (make-posn 20 20) 15 'red))
(draw-a-circle
 (move-circle 10
              (move-circle 10
                           (move-circle 10
                                        (move-circle 10
                                                     (make-circle (make-posn 20 20)
                                                                  15
                                                                  'red))))))