;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex312) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; attendees : number -> number
;; 주어진 티켓 가격에 대해 관객 수를 계산
;; EXAMPLES
;; 티켓 가격이 3.00 달러일 때 420명 관객이 들어온다
;; 티켓 가격이 4.00 달러일 때 270명 관객이 들어온다
;; 티켓 가격이 5.00 달러일 때 120명 관객이 들어온다
(define (attendees ticket-price)
  (+ 120
     (* (- 5.00 ticket-price)
        150)))
;; EXAMPLES TUREND INTO TESTS
(attendees 3.00) "should be" 420
(attendees 4.00) "should be" 270
(attendees 5.00) "should be" 120

;; revenue : number -> number
;; 주어진 티켓 가격에 대해 이익을 계산
(define (revenue ticket-price)
  (* (attendees ticket-price) ticket-price))

;; cost : number -> number
;; 주어진 티켓 가격에 대해 비용을 계산
;; EXAMPLES
;; 티켓 가격이 3.00달러일 때 비용은 196.8
;; 티켓 가격이 4.00달러일 때 비용은 190.8
;; 티켓 가격이 5.00달러일 때 비용은 184.8
(define (cost ticket-price)
  (+ 180
     (* (attendees ticket-price) 0.04)))
;; EXAMPLES TURNED TO TESTS
(cost 3.00) "should be" 196.8
(cost 4.00) "should be" 190.8
(cost 5.00) "should be" 184.8

;; profit : number -> number
;; 주어진 티켓 가격에 대해 수입과 비용의 차를 통해 이익을 계산함
;; EXAMPLES
;; 티켓 가격이 3.00달러일 때 이익은 1063.2
;; 티켓 가격이 4.00달러일 때 이익은 889.2
;; 티켓 가격이 5.00달러일 때 이익은 415.2
(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))
;; EXAMPLES TURNED TO TESTS
(profit 3.00) "should be" 1063.2
(profit 4.00) "should be" 889.2
(profit 5.00) "should be" 415.2