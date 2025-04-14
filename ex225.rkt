;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex225) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
(define (f n)
  (+ (/ n 3) 2))
; (f 2) "should be" 8/3

(define (f2 n)
  (+ (* n n)
     10))
(f2 2) "should be" 14
(f2 9) "should be" 91

(define (f3 n)
  (+ (* 1/2 n n) 20))
(f3 2) "should be" 22
(f3 9) "should be" 60.5

(define (f4 n)
  (- 2
     (/ 1 n)))
(f4 2) "should be" 1.5
(f4 9) "should be" 17/9
