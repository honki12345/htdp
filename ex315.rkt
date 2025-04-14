;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex315) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
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
;; EXAMPLE
;; 티켓 가격이 3달러일 때 이익은 1260
;; 티켓 가격이 4달러일 때 이익은 1080
;; 티켓 가격이 5달러일 때 이익은 600
(define (revenue ticket-price)
  (* (attendees ticket-price) ticket-price))

;; cost : number -> number
;; 주어진 티켓 가격에 대해 비용을 계산
;; EXAMPLES
;; 티켓 가격이 3.00달러일 때 비용은 630
;; 티켓 가격이 4.00달러일 때 비용은 405
;; 티켓 가격이 5.00달러일 때 비용은 180
(define (cost ticket-price)
  (* (attendees ticket-price) 1.50))
;; EXAMPLES TURNED TO TESTS
(cost 3.00) "should be" 196.8
(cost 4.00) "should be" 190.8
(cost 5.00) "should be" 184.8

;; profit : number -> number
;; 주어진 티켓 가격에 대해 수입과 비용의 차를 통해 이익을 계산함
;; EXAMPLES
;; 티켓 가격이 3.00달러일 때 이익은 630
;; 티켓 가격이 4.00달러일 때 이익은 675
;; 티켓 가격이 5.00달러일 때 이익은 420
(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))
;; EXAMPLES TURNED TO TESTS
(profit 3.00) "should be" 630
(profit 4.00) "should be" 675
(profit 5.00) "should be" 420