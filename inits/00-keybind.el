;;
;; Remap font size
;;
(cond ((eq system-type 'windows-nt)
       (global-set-key "\M-+" (lambda () (interactive) (text-scale-increase 1)))
       (global-set-key "\M--" (lambda () (interactive) (text-scale-increase -1)))
       (global-set-key "\M-0" (lambda () (interactive) (text-scale-increase 0))))
      ((eq system-type 'darwin)
       (global-set-key [(super ?+)] (lambda () (interactive) (text-scale-increase 1)))
       (global-set-key [(super ?-)] (lambda () (interactive) (text-scale-increase -1)))
       (global-set-key [(super ?0)] (lambda () (interactive) (text-scale-increase 0))))
      (t
       (print (format "Undefined key map for this system-type: %s" system-type))))

;; Control-h is BS
(load-library "term/bobcat")
(setq normal-erase-is-backspace nil) ;; for emacs 22 above
(terminal-init-bobcat)

;; For Emacs Server
(global-set-key "\C-x\C-c" 'delete-frame)

;; Disable minimize window
(global-unset-key "\C-z")
(global-set-key "\C-zh" 'help)
(global-set-key "\C-z\C-z" 'suspend-emacs)

;; toggle minimap
(global-set-key "\C-cm" 'minimap-toggle)

;; Undo Redo setting
(global-set-key "\C-z" 'undo)
