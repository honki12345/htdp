;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex633) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp") (lib "guess.rkt" "teachpack" "htdp")) #f)))
; A jet-fighter is a structure:
; (make-jet-fighter symbol number number number)
(define-struct jet-fighter (designation acceleration top-speed range))

; within-range: jet-fighter number -> boolean
; jet-fighter가 d 거리를 갈 수 있는지 확인한다
(define (within-range jf d)
  (<= d (jet-fighter-range jf)))

; tests
(check-expect (within-range (make-jet-fighter 'f22 4 1000 600) 400) true)
(check-expect (within-range (make-jet-fighter 'mig22 10 800 300) 400) false)

; reduce-range: jet-fighter -> jet-fighter
; jet-fighter의 거리를 80프로 줄인 jet-fighter 를 만든다
(define (reduce-range jf)
  (make-jet-fighter (jet-fighter-designation jf)
                    (jet-fighter-acceleration jf)
                    (jet-fighter-top-speed jf)
                    (* .8 (jet-fighter-range jf))))

; tests
(check-expect (reduce-range (make-jet-fighter 'f22 4 1000 600)) (make-jet-fighter 'f22 4 1000 480))