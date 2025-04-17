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
                          (make-posn 6 15))
              true)
(check-expect (in-circle? (make-circle (make-posn 6 2)
                                       1
                                       'red)
                          (make-posn 8 6))
              false)

; tests
(start 300 300)
(draw-a-circle (make-circle (make-posn 20 20) 15 'red))
