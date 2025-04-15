;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex333) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; area-cylinder: number number -> number
;; 반지름과 높이를 입력받아 원기둥의 표면적을 계산한다
;; TESTS
;; radius=3, height=5 일 때 표면적은 150.8
;; radius=4, height=10 일 때 표면적은 351.9
(define (area-cylinder radius height)
  (* 2 pi radius
     (+ radius height)))
(area-cylinder 3 5) "should be" 150.8
(area-cylinder 4 10) "should be" 351.9
(area-cylinder 2 3) "should be" (* 20 pi)