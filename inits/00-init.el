;; 言語設定
(set-language-environment 'Japanese)

;; UTF-8を使用
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)

;; バッファ自動読み込み
(global-auto-revert-mode 1)

;; 現在行ハイライト
(global-hl-line-mode)

;; 対応括弧ハイライト
(show-paren-mode t)

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

;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)

;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)

;; 最後に改行を入れる。
(setq require-final-newline t)

;; ファイル名補完で大文字小文字を区別しない
(setq completion-ignore-case t)

;; オープニングメッセージ消去
(setq inhibit-startup-message -1)

;; scratch buf メッセージ消去
(setq initial-scratch-message "")

;; 透明度設定
(add-to-list 'default-frame-alist '(alpha . (100 90)))
