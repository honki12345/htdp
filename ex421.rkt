;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex421) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; interval-1: number -> boolean
;; n 이 (3, 7] 에 속하는지 결정한다

;; EXAMPLES
;; -1, 3, and 10 are outside
;; 5 and 7 are inside

(define (interval-1 n)
  (and (> n 3)
       (<= n 7)))

;; TESTS
(check-expect (interval-1 -1) false)
(check-expect (interval-1 3) false)
(check-expect (interval-1 10) false)
(check-expect (interval-1 5) true)
(check-expect (interval-1 7) true)
(check-expect (interval-1 5) true)

; interval-2: number -> boolean
; n이 [3, 7] 에 속하는지 결정한다
(define (interval-2 n)
  (and (>= n 3)
       (<= n 7)))

; TESTS
(check-expect (interval-2 1) false)
(check-expect (interval-2 3) true)
(check-expect (interval-2 6) true)
(check-expect (interval-2 9) false)

; interval-3: number -> boolean
; n이 [3, 9) 에 속하는지 결정한다
(define (interval-3 n)
  (and (>= n 3)
       (< n 9)))

; TESTS
(check-expect (interval-3 1) false)
(check-expect (interval-3 5) true)
(check-expect (interval-3 9) false)

; interval-4: number -> boolean
; n 이 (1, 3)과 (9, 11)에 속하는지 결정한다
(define (interval-4 n)
  (or (and (> n 1)
           (< n 3))
      (and (> n 9)
           (< n 11))))

; TESTS
(check-expect (interval-4 0) false)
(check-expect (interval-4 2) true)
(check-expect (interval-4 6) false)
(check-expect (interval-4 10) true)
(check-expect (interval-4 11) false)

; interval-5: number -> boolean
; n 이 [1, 3] 밖의 영역인지 결정한다
(define (interval-5 n)
  (not (and (>= n 1)
            (<= n 3))))

; TESTS
(check-expect (interval-5 1) false)
(check-expect (interval-5 0) true)
(check-expect (interval-5 3) false)
(check-expect (interval-5 9) true)