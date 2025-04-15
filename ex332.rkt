;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex332) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; volume-cylinder: number number -> number
;; 밑변 반지름과 높이를 입력받아 원기둥의 부피를 계산한다
;; TESTS
;; radius=3, height=5 일 때 부피는 141.37
;; radius=2, height=4 일 때 부피는 50.27
(define (volume-cylinder radius height)
  (* pi radius radius height))
(volume-cylinder 3 5) "should be" 141.37
(volume-cylinder 2 4) "should be" 50.27