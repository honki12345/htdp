;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex222) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; dollar->euro : number -> number
;; computes the value of d dollars in euros

;; EXAMPLES
;; one dollar is 1.17 euros
;; two dollar is 2.34 euros

(define (dollar->euro d)
  (* 1.17 d))

;; EXAMPLES TURNED INTO TESTS
(dollar->euro 1) "should be" 1.17
(dollar->euro 2) "should be" 2.34