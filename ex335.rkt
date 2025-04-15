;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex335) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; height: number number -> number
;; 주어진 시간과 가속도로 어느 높이에 도달했는지 계산한다
;; TESTS
;; g=9.8, t=5 일 때 높이는 122.5
;; g=20, t=3 일 때 높이는 90
(define (height g t)
  (* 1/2 g t t))
(height 9.8 5) "should be" 122.5
(height 20 3) "should be" 90