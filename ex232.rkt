;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex232) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; sum-coins: numbers numbers numbers numbers -> numbers
;; computes the value of p pennies, n nickels, d dimes and q quarters, in pennies

;; EXAMPLES
;; 1 penny should be worth 1 penny
;; 1 nickel should be worth 5 pennies
;; 1 dime should be worth 10 pennies
;; 1 quarter should be worth 25 pennies
;; 1 penny, 1 nickel, 1 dime and 1 quarter should be worth 41 pennies

(define (sum-coins p n d q)
  (+ p
     (* n 5)
     (* d 10)
     (* q 25)))
;; EXAMPLES TURNED IN TO TESTS
(sum-coins 1 0 0 0) "should be" 1
(sum-coins 0 1 0 0) "should be" 5
(sum-coins 0 0 1 0) "should be" 10
(sum-coins 0 0 0 1) "should be" 25
(sum-coins 1 1 1 1) "should be" 41