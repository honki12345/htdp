;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex515) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
; check-color: symbol symbol symbol symbol -> symbol
; targets symbol과 추측 symbol을 비교하여 symbol를 계산한다

; EXAMPLES
; targets 'red 'yellow 'red 'yellow -> 'Perfect
; 'red 'blue 'red 'yellow -> 'OneColorAtCorrectPosition
; 'red 'blue 'blue 'yellow -> 'OneColorOccurs
; 'red 'blue 'yellow 'black -> 'NothingCorrect

(define (check-color target1 target2 guess1 guess2)
  (cond
    [(and (symbol=? target1 guess1)
         (symbol=? target2 guess2)) 'Perfect]
    [(or (symbol=? target1 guess1)
         (symbol=? target2 guess2)) 'OneColorAtCorrectPosition]
    [(or (symbol=? target1 guess2)
         (symbol=? target2 guess1)) 'OneColorOccurs]
    [else 'NothingCorrect]))

; TESTS
(check-expect (check-color 'red 'yellow 'red 'yellow) 'Perfect)
(check-expect (check-color 'red 'blue 'red 'yellow) 'OneColorAtCorrectPosition)
(check-expect (check-color 'red 'blue 'blue 'yellow) 'OneColorOccurs)
(check-expect (check-color 'red 'blue 'yellow 'black) 'NothingCorrect)