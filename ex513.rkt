;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex513) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))


; get-number: number number number -> number
; 1 10 100의 자릿수를 받아 합한 숫자를 계산한다

; EXAMPLES
; 4 8 0 is 84
; 4 8 2 is 284
; 0 2 1 is 120
(define (get-number ones tens hundreds)
  (+ ones
     (* 10 tens)
     (* 100 hundreds)))

; TESTS
(check-expect (get-number 4 8 0) 84)
(check-expect (get-number 4 8 2) 284)
(check-expect (get-number 0 2 1) 120)

; check-guess3 : number number number number -> symbol
; 1 10 100의 자릿수와 target를 받아 관계에 따라 symbol를 결정한다

; EXAMPLES
; 4 8 0 target 120 'TooSmall
; 4 8 2 target 120 'TooLarge
; 0 2 1 target 120 'Perfect

(define (check-guess3 ones tens hundreds target)
  (cond
    [(= (get-number ones tens hundreds) target) 'Perfect]
    [(< (get-number ones tens hundreds) target) 'TooSmall]
    [else 'TooLarge]))

; TESTS
(check-expect (check-guess3 4 8 0 120) 'TooSmall)
(check-expect (check-guess3 4 8 2 120) 'TooLarge)
(check-expect (check-guess3 0 2 1 120) 'Perfect)
  