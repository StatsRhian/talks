(TeX-add-style-hook "stori_beamer"
 (lambda ()
    (LaTeX-add-labels
     "fig:cctv"
     "eq:40"
     "eq:57"
     "eq:4"
     "fig:sparse"
     "tab:gt"
     "fig:precrec"
     "fig:omp"
     "fig:sr"
     "eq:1"
     "eq:2")
    (TeX-run-style-hooks
     "algorithmic"
     "algorithm"
     "subcaption"
     "caption"
     "graphicx"
     "storitemplate"
     "latex2e"
     "beamer10"
     "beamer"
     "10pt")))

