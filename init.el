;; 何も考えず公式のREADMEからコピペすればいいコード
;; straight.el自身のインストールと初期設定を行ってくれる
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; use-packageをインストールする
(straight-use-package 'use-package)

;; オプションなしで自動的にuse-packageをstraight.elにフォールバックする
;; 本来は (use-package hoge :straight t) のように書く必要がある
(setq straight-use-package-by-default t)

(package-initialize)

;; Add repositories
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; init-loader
;; 設定ファイルをinits以下に集約する
;; 数字昇順にファイル読み込み
;; 環境依存設定読み込みは以下の通り
;; Mac    : cocoa-emacs-hoge.el
;; Windows: windows-hoge.el
;; Linux  : linux-hoge.el
(use-package init-loader)
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
