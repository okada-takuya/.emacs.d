;;
;; Remap font size
;;
(global-set-key [(super ?+)] (lambda () (interactive) (text-scale-increase 1)))
(global-set-key [(super ?-)] (lambda () (interactive) (text-scale-increase -1)))
(global-set-key [(super ?0)] (lambda () (interactive) (text-scale-increase 0)))
(global-set-key [(super ?8)] (lambda () (interactive) (toggle-current-background-type)))

;; Control-h is BS
(load-library "term/bobcat")
(setq normal-erase-is-backspace nil) ;; for emacs 22 above
(terminal-init-bobcat)

;; For Emacs Server
(global-set-key "\C-x\C-c" 'delete-frame)