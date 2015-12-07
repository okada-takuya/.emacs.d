;; load my jfm viewer
(setq load-path
      (cons "~/.emacs.d/elpa/emacs-realtime-jfm-viewer" load-path))

(require 'realtime-jfm-viewer)
(custom-set-variables '(jay-url localhost:3000))
