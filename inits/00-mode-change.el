;; ruby-mode
;; file name
(add-to-list 'auto-mode-alist '("\\.watchr$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
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

;; org-mode
;; file name
(add-to-list 'auto-mode-alist '("\\.text$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.txt$" . org-mode))

;; scss-mode
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; web-mode
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.xml\\'" . web-mode))
