;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex321) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
(define COST-BASE 180)
(define COST-FACTOR 0.04)
(define ATTENDANCE-BASE 120)
(define ATTENDANCE-FACTOR (/ 15 .10))
(define ATTENDANCE-CAP 5.00)

(define (profit-left ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(define (revenue ticket-price)
  (* (attendees ticket-price) ticket-price))

(define (cost ticket-price)
  (+ COST-BASE
     (* COST-FACTOR (attendees ticket-price))))

(define (attendees ticket-price)
  (+ ATTENDANCE-BASE
     (* ATTENDANCE-FACTOR (- ATTENDANCE-CAP ticket-price))))