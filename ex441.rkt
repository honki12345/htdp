;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex441) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
; interest: number -> number
; 예금 총액을 이용해서 실제 이자액을 계산해라

; EXAMPLES
; 500달러 이자액은 20달러
; 2000달러 이자액은 90달러
; 10000달러 이자액은 500달러

(define (interest d)
  (cond
    [(<= d 1000) (* d 4/100)]
    [(<= d 5000) (* d 45/1000)]
    [(> d 5000) (* d 5/100)]))

; TESTS
(check-expect (interest 500) 20)
(check-expect (interest 2000) 90)
(check-expect (interest 10000) 500)