(require 'org)
(require 'ox-latex)
(setq org-latex-to-pdf-process '("sh ~/Dropbox/Nomlab/home/admin/mydocuments/Record/Kirokusyo-Machine/typeset4org.sh %f"))
(add-to-list 'org-latex-classes
             '("reportForm"
               "\\documentclass[fleqn, 14pt]{extarticle}
                    \\usepackage{reportForm}
                \\renewcommand{\refname}{参考文献}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ))
