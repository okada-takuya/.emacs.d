(defun org-mode-hook()
 (when (require 'org-latex nil t)
    (setq org-latex-to-pdf-process '("sh ~/Dropbox/Nomlab/home/admin/mydocuments/Record/Kirokusyo-Machine %f")) 
    (add-to-list 'org-export-latex-classes
		 '("reportForm" 
		   "\\documentclass[fleqn, 12pt]{extarticle}
                    \\usepackage{reportForm}"
		   ("\\section{%s}" . "\\section*{%s}")
		   ("\\subsection{%s}" . "\\subsection*{%s}")
		   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
		   ))
))

(add-hook 'org-mode-hook 'org-mode-hook)
