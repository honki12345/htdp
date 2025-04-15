;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex423) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
; equation1: number->boolean
; x가 x^2 + 2x + 1 = 0의 해인지 판별한다
(define (equation1 x)
  (= (+ (* x x) (+ (* 2 x) 1))
     0))

; equation2: number->boolean
; x가 4x + 2 = 62 의 해인지 판별한다
(define (equation2 x)
  (= (+ (* 4 x) 2)
     62))

; TESTS
(equation2 10) "is true?"
(equation2 12) "is true?"
(equation2 14) "is true?"

; equation3: number -> boolean
; x가 2 x n^2 = 120 의 해인지 판별한다
(define (equation3 x)
  (= (* 2 x x)
     102))

; TESTS
(equation3 10) "10 is true?"
(equation3 12) "12 is true?"
(equation3 14) "14 is true?"

; equation4: number -> boolean
; x가 4x^2 + 6x + 2 = 462 의 해인지 판별한다
(define (equation4 x)
  (= (+ (* 4 x x) (* 6 x) 2)
     462))

; TESTS
(equation4 10) "10 is true?"
(equation4 12) "12 is true?"
(equation4 14) "14 is true?"