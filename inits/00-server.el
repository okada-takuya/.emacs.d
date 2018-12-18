;; For Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

(when (daemonp)
  (defalias 'exit 'save-buffers-kill-emacs)
  (global-set-key (kbd "C-x c") 'suspend-frame)
  (global-set-key (kbd "C-x C-c") '(lambda ()
                                     (interactive)
                                     (if current-prefix-arg
                                         (save-buffers-kill-emacs)
                                       (save-buffers-kill-terminal)))))
