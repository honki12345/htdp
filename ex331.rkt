;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex331) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
;; inches->cm: number ->  number
;; inches 값을 cm 값으로 변한한다
;; EXAMPLES
;; 1 inch는 2.54cm
;; 2 inches는 5.08cm
(define cm-per-inches 2.54)
(define (inches->cm inches)
  (* cm-per-inches inches))
;; EXAMPLES TURNED TO TESTS
(inches->cm 1) "should be" 2.54
(inches->cm 2) "should be" 5.08

;; feet->inches: number -> number
;; feet 값을 inches로 변환한다
;; EXAMPLES
;; 1 foot은 12
;; 2 feet은 24
(define inch-per-feet 12)
(define (feet->inches feet)
  (* inch-per-feet feet))
(feet->inches 1) "should be" 12
(feet->inches 2) "should be" 24

;; yards->feet: number -> number
;; yard 값을 feet 로 변한한다
;; EXAMPLES
;; 1 yard는 3 feet
;; 2 yard는 6 feet
(define feet-per-yard 3)
(define (yards->feet yards)
  (* feet-per-yard yards))
;; TESTS
(yards->feet 1) "should be" 3
(yards->feet 2) "should be" 6

;; rods->yards: number -> number
;; rods 값을 yards로 변환한다
;; EXAMPLES
;; 1 rod는 5 + 1/2 yards
;; 2 rod는 11 yards
(define yards-per-rods (+ 5 1/2))
(define (rods->yards rods)
  (* yards-per-rods rods))
;; TESTS
(rods->yards 1) "shoud be" 5.5
(rods->yards 2) "should be" 11

;; furlongs->rods: number -> number
;; furlongs 값을 rods로 변환한다
;; EXAMPLES
;; 1 furlong은 40 rods
;; 2 furlongs은 80 rods
(define rods-per-furlongs 40)
(define (furlongs->rods furlongs)
  (* rods-per-furlongs furlongs))
;; TESTS
(furlongs->rods 1) "should be" 40
(furlongs->rods 2) "should be" 80

;; miles->furlongs: number -> number
;; mile 값을 furlongs로 변환한다
;; EXAMPLES
;; 1 mile은 8 furlong
;; 2 mile은 16 furlongs
(define furlong-per-miles 8)
(define (miles->furlongs miles)
  (* furlong-per-miles miles))
;; TESTS
(miles->furlongs 1) "should be" 8
(miles->furlongs 2) "should be" 16

;; feet->cm: number -> number
;; feet 값을 cm 로 변한한다
;; EXAMPLE
;; 1 feet는 30.48
;; 2 feet는 60.96
(define (feet->cm feet)
  (inches->cm (feet->inches feet)))
(feet->cm 1) "should be" 30.48
(feet->cm 2) "should be" 60.96

;; yards->cm: number -> number
;; yards 값을 cm 으로 변환한다
;; EXAMPLE
;; 1 yard는 91.44
(define (yards->cm yards)
  (inches->cm (feet->inches (yards->feet yards))))
(yards->cm 1) "should be" 91.44