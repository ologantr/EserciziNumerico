# Appunti

## Dipendenze

* Su Debian/Ubuntu

  * `pandoc`
  * `make`
  * `texlive`
  * `texlive-latex-extra`
  * `texlive-lang-italian`

* Su ArchLinux

  * `pandoc`
  * `make`
  * `texlive-core`
  * `texlive-latexextra`
  * `texlive-fontsextra`

Opzionalmente si può installare il Gem Ruby `mdl` per eseguire il lint
del documento Markdown.

## Compilazione

* `make main.pdf` genera un file pdf
* `make main.html` genera un file html
* `make all` (o `make`) genera entrambi
* `make clean` rimuove i file generati
* `make lint` esegue il lint del sorgente
