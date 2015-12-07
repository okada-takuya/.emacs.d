;; 言語設定
(set-language-environment 'Japanese)

;; UTF-8を使用
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)

;; ファイル名補完で大文字小文字を区別しない
(setq completion-ignore-case t)

;; バッファ自動読み込み
(global-auto-revert-mode 1)

;; 現在行ハイライト
(global-hl-line-mode)

;; 対応括弧ハイライト
(show-paren-mode t)

;; オープニングメッセージ消去
(setq inhibit-startup-message -1)

;; scratch buf メッセージ消去
(setq initial-scratch-message "")

;; カーソル位置の桁数をモードライン行に表示する
(column-number-mode 1)

;; カーソル位置の行数をモードライン行に表示する
(line-number-mode 1)

;; メニューバーを消す
(menu-bar-mode -1)

;; ツールバーを隠す
(tool-bar-mode -1)

;; 行番号表示
(global-linum-mode t)

;; beepの代わりに発光
(setq visible-bell t)

;; visible-bellで呼ぶ関数をなくす
(setq ring-bell-function 'ignore)

;; 透明度設定
(add-to-list 'default-frame-alist '(alpha . (100 90)))

;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)

;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)

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

;; 最後に改行を入れる。
(setq require-final-newline t)

;; set molokai theme
(load-theme 'molokai t)
(enable-theme 'molokai)
