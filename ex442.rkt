;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex442) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
; tax: number -> number
; 총 수입을 입력받아 내야할 세금의 양을 출력한다

; EXAMPLES
; 240달러에는 0달러
; 300달러에는 45달러
; 500달러에는 140

(define (tax total-revenue)
  (cond
    [(<= total-revenue 240) 0]
    [(<= total-revenue 480) (* total-revenue 15/100)]
    [else (* total-revenue 28/100)]))

; TESTS
(check-expect (tax 240) 0)
(check-expect (tax 300) 45)
(check-expect (tax 500) 140)

; wage: number -> number
; 일한 시간에 대한 총 급여를 구한다

; EXAMPLES
; 3시간 36달러

(define (wage h)
  (* 12 h))

; TESTS
(check-expect (wage 3) 36)

; netpay: number -> number
; 일한 시간에 대한 실질소득액을 구한다
; 실질소득액은 총 수입에서 세금을 제외한 금액이다

; EXAMPLES
; 20시간은 240달러

(define (netpay h)
  (- (wage h)
     (tax (wage h))))

; TESTS
(check-expect (netpay 20) 240)