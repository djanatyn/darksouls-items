#lang racket
(require csv-reading)
(require json)

;; a struct to represent item information
(struct item (name effect desc) #:transparent)

;; load csv
(define input (open-input-file "Dark Souls - Accessories.csv"))

;; read rows
(define reader (make-csv-reader input))

;; convert to list
(define data (csv->list reader))

;; parse rows, using header
(define (parse-row row)
  (letrec ([header (first data)]
           [index-name (index-of header "English name")]
           [index-effect (index-of header "Effect description")]
           [index-desc (index-of header "English Description")])
    (item
     (list-ref row index-name)
     (list-ref row index-effect)
     (list-ref row index-desc))))

;; render item as a hash
(define (render-item item)
  `#hash((name . ,(item-name item))
         (effect . ,(item-effect item))
         (desc . ,(item-desc item))))

;; parse all rows (skipping header)
(define all-items
  (for/list ([row (rest data)])
    (render-item (parse-row row))))

;; print as JSON
(display (jsexpr->string all-items))
