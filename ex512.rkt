;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex512) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
; check-guess: number number -> symbol
; guess와 target의 관계에 따라 기호를 결정한다

; EXAMPLES
; guess 1 target 1 'Perfect
; guess 1 target 2 'TooSmall
; guess 1 target 0 'TooLarge

(define (check-guess guess target)
  (cond
    [(= guess target) 'Perfect]
    [(< guess target) 'TooSmall]
    [(> guess target) 'TooLarge]))

(check-expect (check-guess 1 1) 'Perfect)
(check-expect (check-guess 1 2) 'TooSmall)
(check-expect (check-guess 1 0) 'TooLarge)

(guess-with-gui check-guess)