;; Time-stamp: "Fri Nov 22 22:51:33 JST 2013"
;; ロードパス
(setq load-path
      (append
       (list
        (expand-file-name "~/.emacs.d/")
        (expand-file-name "~/.emacs.d/elpa/")
	(expand-file-name "~/.emacs.d/elpa/init-loader/")
	(expand-file-name "~/.emacs.d/elpa/org-20130624/")
        (expand-file-name "~/.emacs.d/elpa/color-theme-6.6.0/")
        (expand-file-name "~/.emacs.d/elpa/emacs-smartchr/")
        (expand-file-name "~/.emacs.d/elpa/auto-complete/")
	(expand-file-name "~/.emacs.d/elpa/ruby-block/")
	(expand-file-name "~/.emacs.d/elpa/ruby-electric/")
	(expand-file-name "~/.emacs.d/elpa/modeline-git-branch/")
	(expand-file-name "~/.emacs.d/elpa/haskell-mode-2.8.0/")
	(expand-file-name "~/.emacs.d/elpa/yatex/")
        (expand-file-name "~/.emacs.d/elpa/eldoc-extension/")
	(expand-file-name "~/.emacs.d/elpa/yasnippet/")
        )
       load-path))

;; init-loader
;; 設定ファイルをinits以下に集約する
;; 数字昇順にファイル読み込み
;; 環境依存設定読み込みは以下の通り
;; Mac    : cocoa-emacs-hoge.el
;; Windows: windows-hoge.el
;; Linux  : linux-hoge.el
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")
