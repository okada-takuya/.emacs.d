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
;(setq tex-command "ptex2pdf -l -u -ot \"-kanji=utf8 -no-guess-input-enc -synctex=1\"")
;(setq tex-command "pdflatex -synctex=1")
;(setq tex-command "lualatex -synctex=1")
;(setq tex-command "luajitlatex -synctex=1")
;(setq tex-command "xelatex -synctex=1")
;(setq tex-command "latexmk")
;(setq tex-command "latexmk -e \"$latex=q/platex %O -kanji=utf8 -guess-input-enc -synctex=1 %S/\" -e \"$bibtex=q/pbibtex %O -kanji=utf8 %B/\" -e \"$makeindex=q/mendex %O -U -o %D %S/\" -e \"$dvipdf=q/dvipdfmx %O -o %D %S/\" -norc -gg -pdfdvi")
;(setq tex-command "latexmk -e \"$latex=q/platex %O -kanji=utf8 -guess-input-enc -synctex=1 %S/\" -e \"$bibtex=q/pbibtex %O -kanji=utf8 %B/\" -e \"$makeindex=q/mendex %O -U -o %D %S/\" -e \"$dvips=q/dvips %O -z -f %S | convbkmk -g > %D/\" -e \"$ps2pdf=q/ps2pdf.bat %O %S %D/\" -norc -gg -pdfps")
;(setq tex-command "latexmk -e \"$latex=q/uplatex %O -kanji=utf8 -no-guess-input-enc -synctex=1 %S/\" -e \"$bibtex=q/upbibtex %O %B/\" -e \"$makeindex=q/mendex %O -U -o %D %S/\" -e \"$dvipdf=q/dvipdfmx %O -o %D %S/\" -norc -gg -pdfdvi")
;(setq tex-command "latexmk -e \"$latex=q/uplatex %O -kanji=utf8 -no-guess-input-enc -synctex=1 %S/\" -e \"$bibtex=q/upbibtex %O %B/\" -e \"$makeindex=q/mendex %O -U -o %D %S/\" -e \"$dvips=q/dvips %O -z -f %S | convbkmk -u > %D/\" -e \"$ps2pdf=q/ps2pdf.bat %O %S %D/\" -norc -gg -pdfps")
;(setq tex-command "latexmk -e \"$pdflatex=q/pdflatex %O -synctex=1 %S/\" -e \"$bibtex=q/bibtex %O %B/\" -e \"$makeindex=q/makeindex %O -o %D %S/\" -norc -gg -pdf")
;(setq tex-command "latexmk -e \"$pdflatex=q/lualatex %O -synctex=1 %S/\" -e \"$bibtex=q/bibtexu %O %B/\" -e \"$makeindex=q/texindy %O -o %D %S/\" -norc -gg -lualatex")
;(setq tex-command "latexmk -e \"$pdflatex=q/luajitlatex %O -synctex=1 %S/\" -e \"$bibtex=q/bibtexu %O %B/\" -e \"$makeindex=q/texindy %O -o %D %S/\" -norc -gg -lualatex")
;(setq tex-command "latexmk -e \"$pdflatex=q/xelatex %O -synctex=1 %S/\" -e \"$bibtex=q/bibtexu %O %B/\" -e \"$makeindex=q/texindy %O -o %D %S/\" -norc -gg -xelatex")
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
;(setq dvi2-command "rundll32 shell32,ShellExec_RunDLL SumatraPDF -reuse-instance")
;(setq dvi2-command "powershell -Command \"& {$p = [System.String]::Concat('\"\"\"',[System.IO.Path]::GetFileName($args),'\"\"\"');Start-Process firefox -ArgumentList ('-new-window',$p)}\"")
;(setq dvi2-command "powershell -Command \"& {$p = [System.String]::Concat('\"\"\"',[System.IO.Path]::GetFullPath($args),'\"\"\"');Start-Process chrome -ArgumentList ('--new-window',$p)}\"")
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
