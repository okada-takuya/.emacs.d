;; cask setup some packages.
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; init-loader
;; 設定ファイルをinits以下に集約する
;; 数字昇順にファイル読み込み
;; 環境依存設定読み込みは以下の通り
;; Mac    : cocoa-emacs-hoge.el
;; Windows: windows-hoge.el
;; Linux  : linux-hoge.el
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(jay-url localhost:3000)
 '(minimap-window-location (quote right))
 '(org2blog/wp-sourcecode-default-params nil)
 '(org2blog/wp-use-sourcecode-shortcode t)
 '(org2blog/wp-use-tags-as-categories t)
 '(yas-trigger-key "TAB"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
