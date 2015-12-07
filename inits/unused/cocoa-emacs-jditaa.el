;; orgで使うditaaのpath設定
(setq org-ditaa-jar-path
      "/opt/local/share/java/jditaa0_9.jar")
(defun bh/display-inline-images ()
(condition-case nil
(org-display-inline-images)
(error nil)))
(add-hook 'org-babel-after-execute-hook 'bh/display-inline-images 'append)

; Make babel results blocks lowercase
(setq org-babel-results-keyword "results")

(org-babel-do-load-languages
(quote org-babel-load-languages)
(quote ((emacs-lisp . t)
(dot . t)
(ditaa . t)
(R . t)
(python . t)
(ruby . t)
(gnuplot . t)
(clojure . t)
(sh . t)
(ledger . t)
(org . t)
(plantuml . t)
(latex . t))))

; Do not prompt to confirm evaluation
; This may be dangerous - make sure you understand the consequences
; of setting this -- see the docstring for details
(setq org-confirm-babel-evaluate nil)
