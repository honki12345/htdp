;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex668) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
; rectangle is a structure
; (make-rectangle P W H C)
; P is a posn, 좌측 상단 위치
; W is a number, 너비
; H is a number, 높이
; C is a symbol, 색깔
(define-struct rectangle (nw-corner width height color))

; draw-a-rectangle: rectangle -> true
; rectangle을 입력받아 직사각형을 그린다
(define (draw-a-rectangle a-rectangle)
  (draw-solid-rect
   (rectangle-nw-corner a-rectangle)
   (rectangle-width a-rectangle)
   (rectangle-height a-rectangle)
   (rectangle-color a-rectangle)))

; in-rectangle?: rectangle posn -> boolean
; 주어진 픽셀이 주어진 직사각형 내부에 있는지 판별한다
(define (in-rectangle? a-rectangle posn)
  (and (> (- (posn-x posn) (posn-x (rectangle-nw-corner a-rectangle))) 0)
       (> (- (posn-y posn) (posn-y (rectangle-nw-corner a-rectangle))) 0)
       (< (- (posn-x posn) (posn-x (rectangle-nw-corner a-rectangle))) (rectangle-width a-rectangle))
       (< (- (posn-y posn) (posn-y (rectangle-nw-corner a-rectangle))) (rectangle-height a-rectangle))))

; translate-rectangle: rectangle number -> rectangle
; 주어진 rectangle의 좌측 상단 기준점 위치가 delta만큼 오른쪽으로 이동한 새로운 직사각형 구조체를 반환한다
(define (translate-rectangle a-rec delta)
  (make-rectangle (make-posn (+ delta
                                (posn-x (rectangle-nw-corner a-rec)))
                             (posn-y (rectangle-nw-corner a-rec)))
                  (rectangle-width a-rec)
                  (rectangle-height a-rec)
                  (rectangle-color a-rec)))

; clear-a-rectangle: rectangle -> true
; rectangle 구조체를 입력받아 화면에서 지운다
(define (clear-a-rectangle a-rec)
  (clear-solid-rect
   (rectangle-nw-corner a-rec)
   (rectangle-width a-rec)
   (rectangle-height a-rec)))

; draw-and-clear-rectangle: rectangle -> true
; 직사각형을 그렸다가 일정 시간 이후에 지운다
(define (draw-and-clear-rectangle a-rec)
  (and (draw-a-rectangle a-rec)
       (sleep-for-a-while 2)
       (clear-a-rectangle a-rec)))


; move-rectangle: number rectangle -> rectangle
; 직사각형을 그렸다가 지운 후에 이를 delta 픽셀만큼 이동함
(define (move-rectangle delta a-rec)
  (cond
    [(draw-and-clear-rectangle a-rec)
     (translate-rectangle a-rec delta)]
    [else a-rec]))

; test
(start 300 300)
(draw-a-rectangle (make-rectangle (make-posn 20 20) 260 260 'red))
(draw-a-rectangle (make-rectangle (make-posn 60 60) 180 180 'blue))
(clear-a-rectangle (make-rectangle (make-posn 20 20) 260 260 'red))
;(draw-a-rectangle (make-rectangle (make-posn 2 3) 3 2))
(draw-and-clear-rectangle (make-rectangle (make-posn 60 60) 180 180 'blue))
(move-rectangle 2
                (move-rectangle 2
                                (move-rectangle 2
                                                (move-rectangle 2
                                                                (make-rectangle (make-posn 20 20) 20 20 'red)))))

(check-expect (in-rectangle? (make-rectangle (make-posn 2 3) 3 2 'red)
                             (make-posn 4 4)) true)
(check-expect (in-rectangle? (make-rectangle (make-posn 2 3) 3 2 'red)
                             (make-posn 8 6)) false)
(check-expect (translate-rectangle (make-rectangle (make-posn 2 3) 3 2 'red) 1)
              (make-rectangle (make-posn 3 3) 3 2 'red))