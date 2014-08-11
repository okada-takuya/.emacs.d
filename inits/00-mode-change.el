;; ruby-mode
;; file name
(add-to-list 'auto-mode-alist '("\\.watchr$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile" . ruby-mode))
;; file contents
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

;; shell-script-mode
;; file name
(add-to-list 'auto-mode-alist '("\\.sh$" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.bash" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.zsh" . shell-script-mode))
;; file contents
(add-to-list 'interpreter-mode-alist '("bash" . shell-script-mode))
(add-to-list 'interpreter-mode-alist '("zsh" . shell-script-mode))
(add-to-list 'interpreter-mode-alist '("sh" . shell-script-mode))
