;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex224) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; convert3: number number number -> number
;; builds a three digit number from its digits

;; EXAMPLES
;; convert3 of 1, 2, and 3 produces 321
;; convert3 of 5, 3, and 9 produces 935

(define (convert3 ones tens hundreds)
  (+ ones
     (* 10 tens)
     (* 100 hundreds)))

;; EXAMPLES TURNED INTO TESTS
(convert3 1 2 3) "should be" 321
(convert3 5 3 9) "should be" 935