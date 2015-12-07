;; Load stunnel
(setq mew-prog-ssl "/opt/local/bin/stunnel")

;; Basic settings
(setq mew-name "Takuya Okada") ;; full name
(setq mew-fcc "+fcc")          ;; 送信済みフォルダの指定
(setq mew-ask-send t)          ;; 送信確認
(setq mew-ask-subject t)       ;; subが空の時確認
(setq mew-use-cached-passwd t) ;; 20分間PWをキャッシュ
(setq mew-ssl-verify-level  0)

;; SMTP settings
(setq mew-use-smtp-auth t)
(setq mew-smtp-ssl-port "465")

;; Accounts
;; 何も設定がない項目はdefaultの項目が参照される．
(setq mew-config-alist
      '(
        (default ;; my private gmail is default mew mail account
          (user              "pitipitiunsyumikan")
          (imap-user         "pitipitiunsyumikan")
          (mail-domain       "gmail.com")
          (smtp-server       "smtp.googlemail.com")
          (smtp-user         "pitipitiunsyumikan")
          (proto             "%")
          (inbox-folder      "%inbox")     ;; IMAPではinboxフォルダに固定
          (setq mew-fcc      "%[Gmail]/送信済みメール") ;; 送信済みフォルダの指定
          (imap-server       "imap.gmail.com")
          (imap-ssl          t)
          (imap-ssl-port     993)
          (imap-delete       nil)
          (imap-auth         t)
          (imap-size         0)
          (imap-header-only  nil))

        ;; なぜかうまく設定できない．
        ;; (okadai ;; Okayama university's gmail
        ;;  (imap-user         "en422609")
        ;;  (mail-domain       "gmail.com")
        ;;  (ssl-verify-level  0)
        ;;  (proto             "%")
        ;;  (inbox-folder      "%inbox")     ;IMAPではinboxフォルダに固定
        ;;  (imap-server       "imap.googlemail.com")
        ;;  (imap-ssl          t)
        ;;  (imap-ssl-port     993)
        ;;  (imap-delete       nil)
        ;;  (imap-auth         t)
        ;;  (imap-size         0)
        ;;  (imap-header-only  nil))

        (oppapili ;; Yahoo mail
         (user              "oppapili_1")
         (imap-user         "oppapili_1")
         (mail-domain       "yahoo.co.jp")
         (smtp-server       "smtp.mail.yahoo.co.jp")
         (imap-server       "imap.mail.yahoo.co.jp")
         (setq mew-fcc      "%送信済み") ;; 送信済みフォルダの指定
         (imap-ssl          t)
         (imap-ssl-port     993)
         (imap-delete       nil)
         (imap-auth         t)
         (imap-size         0)
         (imap-header-only  nil))
        ))
