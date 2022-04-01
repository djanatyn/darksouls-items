# darksouls-items

## background

i'm setting up a [blog](https://github.com/djanatyn/djan.world). i need some placeholder content to test my rendering logic.

you can use [lorem ipusm](https://en.wikipedia.org/wiki/Lorem_ipsum), but i was looking for a distraction! i like dark souls.

item csv source:
* https://docs.google.com/spreadsheets/d/1KukblWL61We64-gNIyaAShga9h8RTXYmyFs98eQhY4E/edit#gid=1949985688

## usage

this code doesn't do much.

this is written in racket. i'm using:
* [`csv-reading`](https://docs.racket-lang.org/csv-reading/index.html)
* [`json`](https://docs.racket-lang.org/json/index.html)

to run: `$ racket parse.rkt | jq 'first'`

``` json
{
  "effect": "Boosts maximum equipment load",
  "name": "Havel's Ring",
  "desc": "This ring was named after Havel the Rock,\\nLord Gwyn's old battlefield compatriot.\\n\\nHavel's men wore the ring to express faith in\\ntheir leader and to carry a heavier load."
}
```
