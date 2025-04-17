;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex652) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
; time is
; (make-time HOURS MINUTES SECONDS)
; SECONDS is a number
; MINUTES is a number
; HOURS is a number
(define-struct time (hours minutes seconds))

; time->seconds: time -> number
; 자정부터 time 구조체까지 경과한 초를 계산한다
(define (time->seconds time)
  (+ (* 60 60 (time-hours time))
     (* 60 (time-minutes time))
     (time-seconds time)))

; tests
(check-expect (time->seconds (make-time 12 30 2)) 45002)