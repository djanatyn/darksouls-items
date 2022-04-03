#lang typed/racket

(require/typed csv-reading
  [csv->list (-> String (List (List String)))])

(require/typed racket
  [index-of (-> (List String) String Integer)])

(struct item
  ([name : String]
   [effect : String]
   [desc : String]))

(: data (List (List String)))
(define data (csv->list "Dark Souls - Accessories.csv"))

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

(for/list: : (List item)
  ([row : (List String) (rest data)])
    (parse-row row))
