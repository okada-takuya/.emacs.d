;;
;; YaTeX
;;
(add-to-list 'load-path "~/.emacs.d/site-lisp/yatex")
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq auto-mode-alist
      (append '(("\\.tex$" . yatex-mode)
                ("\\.ltx$" . yatex-mode)
                ("\\.cls$" . yatex-mode)
                ("\\.sty$" . yatex-mode)
                ("\\.clo$" . yatex-mode)
                ("\\.bbl$" . yatex-mode)) auto-mode-alist))
(setq YaTeX-inhibit-prefix-letter t)
(setq YaTeX-kanji-code nil)
(setq YaTeX-use-LaTeX2e t)
(setq YaTeX-use-AMS-LaTeX t)
(setq YaTeX-dvi2-command-ext-alist
      '(("TeXworks\\|SumatraPDF\\|evince\\|okular\\|firefox\\|chrome\\|AcroRd32\\|pdfopen" . ".pdf")))
(setq tex-command "powershell -Command \"& {$b = [System.IO.Path]::GetFileNameWithoutExtension($args);$texopt = [System.String]::Concat('\"\"\"','-kanji=utf8 -guess-input-enc -synctex=1 -sjis-terminal','\"\"\"');ptex2pdf -l -ot $texopt $b}\"")

(setq bibtex-command (cond ((string-match "uplatex\\|-u" tex-command) "upbibtex")
                           ((string-match "platex" tex-command) "pbibtex -kanji=utf8")
                           ((string-match "lualatex\\|luajitlatex\\|xelatex" tex-command) "bibtexu")
                           ((string-match "pdflatex\\|latex" tex-command) "bibtex")
                           (t "pbibtex -kanji=utf8")))
(setq makeindex-command (cond ((string-match "uplatex\\|-u" tex-command) "mendex -U")
                              ((string-match "platex" tex-command) "mendex -U")
                              ((string-match "lualatex\\|luajitlatex\\|xelatex" tex-command) "texindy")
                              ((string-match "pdflatex\\|latex" tex-command) "makeindex")
                              (t "mendex -U")))
(setq dvi2-command "texworks")

(setq dviprint-command-format "powershell -Command \"& {$r = Write-Output %s;$p = [System.String]::Concat('\"\"\"',[System.IO.Path]::GetFileNameWithoutExtension($r),'.pdf','\"\"\"');Start-Process pdfopen -ArgumentList ('--rxi','--file',$p)}\"")

(defun sumatrapdf-forward-search ()
  (interactive)
  (progn
    (process-kill-without-query
     (start-process
      "sumatrapdf"
      nil
      "rundll32"
      "shell32,ShellExec_RunDLL"
      "SumatraPDF"
      "-reuse-instance"
      (expand-file-name
       (concat (file-name-sans-extension (or YaTeX-parent-file
                                             (save-excursion
                                               (YaTeX-visit-main t)
                                               buffer-file-name)))
               ".pdf"))
      "-forward-search"
      (buffer-name)
      (number-to-string (save-restriction
                          (widen)
                          (count-lines (point-min) (point))))))))

(add-hook 'yatex-mode-hook
          '(lambda ()
             (define-key YaTeX-mode-map (kbd "C-c s") 'sumatrapdf-forward-search)))

(defun fwdsumatrapdf-forward-search ()
  (interactive)
  (progn
    (process-kill-without-query
     (start-process
      "fwdsumatrapdf"
      nil
      "fwdsumatrapdf"
      (expand-file-name
       (concat (file-name-sans-extension (or YaTeX-parent-file
                                             (save-excursion
                                               (YaTeX-visit-main t)
                                               buffer-file-name)))
               ".pdf"))
      (buffer-name)
      (number-to-string (save-restriction
                          (widen)
                          (count-lines (point-min) (point))))))))

(add-hook 'yatex-mode-hook
          '(lambda ()
             (define-key YaTeX-mode-map (kbd "C-c w") 'fwdsumatrapdf-forward-search)))

(add-hook 'yatex-mode-hook
          '(lambda ()
             (auto-fill-mode -1)))

;;
;; RefTeX with YaTeX
;;
;(add-hook 'yatex-mode-hook 'turn-on-reftex)
(add-hook 'yatex-mode-hook
          '(lambda ()
             (reftex-mode 1)
             (define-key reftex-mode-map (concat YaTeX-prefix ">") 'YaTeX-comment-region)
             (define-key reftex-mode-map (concat YaTeX-prefix "<") 'YaTeX-uncomment-region)))

;; Setting for outline-minor-mode
(defun latex-outline-level ()
  (interactive)
  (let ((str nil))
    (looking-at outline-regexp)
    (setq str (buffer-substring-no-properties (match-beginning 0) (match-end 0)))
    (cond ;; キーワード に 階層 を返す
     ((string-match "documentclass" str) 1)
     ((string-match "documentstyle" str) 1)
     ((string-match "part" str) 2)
     ((string-match "chapter" str) 3)
     ((string-match "appendix" str) 3)
     ((string-match "subsubsection" str) 6)
     ((string-match "subsection" str) 5)
     ((string-match "section" str) 4)
     (t (+ 6 (length str)))
     )))

(add-hook 'yatex-mode-hook
          '(lambda ()
             (setq outline-level 'latex-outline-level)
             (make-local-variable 'outline-regexp)
             (setq outline-regexp
                   (concat "[ \t]*\\\\\\(documentstyle\\|documentclass\\|"
                           "part\\|chapter\\|appendix\\|section\\|subsection\\|subsubsection\\)"
                           "\\*?[ \t]*[[{]"))
             (outline-minor-mode t)
             (define-key outline-minor-mode-map "\C-i" 'org-cycle)))
