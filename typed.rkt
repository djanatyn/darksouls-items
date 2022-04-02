#lang typed/racket

(require/typed csv-reading
  [make-csv-reader (-> Any Any)]
  [csv->list (-> Any (List (List String)))])

(require/typed racket [index-of (-> (List Any) Any Integer)])

(struct item ([name : String] [effect : String] [desc : String]))

(define input (open-input-file "Dark Souls - Accessories.csv"))
(define reader (make-csv-reader input))

(define data (csv->list reader))

(: parse-row (-> (List String) item))
(define (parse-row row)
  (letrec ([header (first data)]
           [index-name (index-of header "English name")]
           [index-effect (index-of header "Effect description")]
           [index-desc (index-of header "English Description")])
    (item
     (list-ref row index-name)
     (list-ref row index-effect)
     (list-ref row index-desc))))

;; (for/list ([row (rest data)])
;;   (parse-row row))
