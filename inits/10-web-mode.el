(use-package web-mode)

;; indentation
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-current-column-highlight t)

;; auto tag closing
;; 0=no auto-closing
;; 1=auto-close with </
;; 2=auto-close with > and </
(setq web-mode-tag-auto-close-style 2)
