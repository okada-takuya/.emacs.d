(use-package js2-mode)

;; set indent
(add-hook 'js2-mode-hook
          (lambda ()
            (setq my-js-mode-indent-num 2)
            (setq js2-basic-offset my-js-mode-indent-num)
            (setq js-switch-indent-offset my-js-mode-indent-num)))
