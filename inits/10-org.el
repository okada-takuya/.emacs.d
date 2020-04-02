(setq org-html-validation-link nil)
;; "<table border="2" cellspacing="0"
;; cellpadding="6" rules="groups" frame="hsides">"
(setq org-html-table-tag "<table>")
(setq org-html-head
"<style type=\"text/css\">
<!--/*--><![CDATA[/*><!--*/
html {
font-family:'ヒラギノ丸ゴ Pro','Hiragino Maru Gothic Pro','メイリオ',Meiryo,'ＭＳ Ｐゴシック',sans-serif;
font-size: 12pt;
}
pre {
border: 1pt solid #AEBDCC;
/* background-color: #F3F5F7; */
background-color: #F8F8F8;
padding: 5pt;
font-family: courier, monospace;
font-size: 90%;
overflow:auto;
}
table, th, td {
border: 1px #000000 solid;
border-collapse: collapse;
}
td, th {
vertical-align: top;
}
dt {
font-weight: bold;
color: green;
}
div.figure {
padding: 0.5em;
}
div.figure p {
text-align: center;
}
.linenr {
font-size: smaller;
}
.code-highlighted {
background-color:#ffff00;
}
/* my settings */
body {
color: black;
// background: #d1eeee;
color: black;
line-height: 1.5;
margin-top: 50px;
margin-right: 10%;
margin-left: 1em;
letter-spacing: 2px;
}
h1 {
text-align: center;
}
pre {
padding: 10px 10px 10px 10px;
margin: 0px 0px 0px 1em;
letter-spacing: 0px;
line-height: 1.2;
}
h2 {
margin-bottom: 2em;
border: solid;
padding: 0px 10px 2px 10px;
border-width: 0px 0px 3px 0.7em;
border-color: transparent transparent black black;
}
h3 {
margin-bottom: 2em;
border: solid;
padding: 0px 10px 2px 10px;
border-width: 0px 0px 1px 0.7em;
border-color: transparent transparent brown brown;
}
h4 {
border: solid;
padding: 0px 10px 2px 10px;
border-width: 0px 0px 1px 0.7em;
border-color: blue;
}
h5 {
border: solid;
padding: 0px 10px 2px 10px;
border-width: 0px 0px 1px 0.7em;
border-color: green;
color: green;
}
th {
font-weight: bold;
border: 1px solid #777777;
background-color: #8899FF;
padding: 3px;
border-bottom: 0px;
border-right: 0px;
}
td {
border-top: 1px solid #777777;
padding: 3px;
}
tr {
background-color: aliceblue;
}
table {
border-spacing: 0px;
empty-cells:show;
margin-bottom: 6px;
border: 1px solid #0000AA;
border-top: 0px;
}
table.layer {
text-align: center;
}
blockquote {
border: 1pt solid #AEBDCC;
background-color: #F3F5F7;
padding: 0px 0px 0px 1em;
}
td.byteorder {
text-align: center;
}
em {
color: red;
}
b {
color: green;
}
img {
border: 1pt solid #AEBDCC;
background-color: #F3F5F7;
}
/* postamble */
div#postamble {
width: 100%;
text-align: right;
font-size: smaller;
border-top: 2px solid #808080;
margin-top: 3em;
padding: 1em 0em;
}
div#postamble p {
margin: 0.2em 0em;
}
p.creator {
color: #a0a0a0;
}
/*]]>*/-->
</style>
<link rel=\"stylesheet\" type=\"text/css\" href=\"pub/css/text.css\">
")



;; Set to the location of Org files on my local system
(setq org-directory "~/Documents/org/")
(when (file-exists-p "~/Dropbox/org/")
  (setq org-directory "~/Dropbox/org/"))
(setq todo-file (concat org-directory "TODO.org"))
(setq org-default-notes-file (concat org-directory "refile.org"))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitch)

;; DONEの時刻を記録
(setq org-log-done 'time)

;; Org-modeのTODO状態定義
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))

;; TODO状態の色指定
;; 色一覧は M-x list-colors-display
;; DONE系は色を統一
(setq org-todo-keyword-faces
      '(("NEXT" . "turquoise1")
        ("DOING" . "red")
        ("WAITING" . "SeaGreen1")
        ("HOLD" . "magenta")
        ("DONE" . "forest green")
        ("CANCELLED" . "forest green")
        ("PHONE" . "forest green")
        ("MEETING" . "forest green")
        ))

;; TODO状態遷移時のタグ付け指定
;; t付きのtupleが記載されると、タグ付与。
(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

;; org-capture の設定
(setq org-capture-templates
      (quote (("t" "TODO: タスク" entry (file org-default-notes-file)
               "* TODO %?\n%U\n%a\n"
               :clock-in t :clock-resume t)
              ("r" "Response: メール返信" entry (file org-default-notes-file)
               "* NEXT メール返信: %?\nSCHEDULED: %t\n%U\n%a\n"
               :clock-in t :clock-resume t)
              ("n" "Note: メモ" entry (file org-default-notes-file)
               "* %? :NOTE:\n%U\n%a\n"
               :clock-in t :clock-resume t)
              ("m" "Meeting: 会議・相談" entry (file org-default-notes-file)
               "* MEETING with %? :MEETING:\n%U"
               :clock-in t :clock-resume t)
              ("p" "Phone call: 電話着信" entry (file org-default-notes-file)
               "* PHONE %? :PHONE:\n%U"
               :clock-in t :clock-resume t)
              ("h" "Habbit: 習慣化タスク" entry (file org-default-notes-file)
               "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n")
              ("w" "Word: 単語帳登録" entry (file (concat org-directory "WORD-LIST.org"))
               "* %?\n意味: \n%t\n%U\n%a\n")
              )))

;; Refile設定群
; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

; Use full outline paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path t)

; Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)

; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))

;; Helmを使うのでIDO(Emacsデフォルト検索エンジン)は基本使わない。
; Use IDO for both buffer and file completion and ido-everywhere to t
; (setq org-completion-use-ido t)
; (setq ido-everywhere t)
; (setq ido-max-directory-size 100000)
; (ido-mode (quote both))
; Use the current window when visiting files and buffers with ido
; (setq ido-default-file-method 'selected-window)
; (setq ido-default-buffer-method 'selected-window)
; Use the current window for indirect buffer display
(setq org-indirect-buffer-display 'current-window)

;;;; Refile settings
; Exclude DONE state tasks from refile targets
(defun bh/verify-refile-target ()
  "リファイル時、DONE状態のタスクを除外する。"
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))

(setq org-refile-target-verify-function 'bh/verify-refile-target)

;;;; agenda view customize
;; Do not dim blocked tasks
(setq org-agenda-dim-blocked-tasks nil)

;; Compact the block agenda view
(setq org-agenda-compact-blocks t)

;; デフォルトで1日のビューとする。
(setq org-agenda-span 'day)

;; agenda 表示の対象ファイル
(setq org-agenda-files (list org-directory))

;; Custom agenda command definitions
;; tags-todoは、タグ/TODO状態で検索条件を指定。!はDONEでないタスクに検索対象を限定する。
(setq org-agenda-custom-commands
      (quote (("N" "Notes: メモ一覧" tags "NOTE"
               ((org-agenda-overriding-header "Notes")
                (org-tags-match-list-sublevels t)))
              ("h" "Habits: 習慣タスク一覧" tags-todo "STYLE=\"habit\""
               ((org-agenda-overriding-header "Habits")
                (org-agenda-sorting-strategy
                 '(todo-state-down effort-up category-keep))))
              (" " "Agenda: 予定表"
               ((agenda "" nil)
                (tags "REFILE"
                      ((org-agenda-overriding-header "リファイル待ち")
                       (org-tags-match-list-sublevels nil)))
                (tags-todo "-CANCELLED/!NEXT"
                           ((org-agenda-overriding-header "NEXTタスク")
                            (org-tags-match-list-sublevels t)
                            (org-agenda-sorting-strategy
                             '(todo-state-down effort-up category-keep))))
                ;; TODO: 1か月以上スケジュールが先のタスクは出さない。
                ;; TODO: スケジュールが未設定のタスクを一覧する。
                (tags-todo "-HOLD-WAITING-CANCELLED/!-NEXT"
                           ((org-agenda-overriding-header "処理待ち(NEXT候補)")
                            (org-tags-match-list-sublevels 'indented)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-CANCELLED+WAITING|HOLD/!"
                           ((org-agenda-overriding-header "他者作業待ち・延期中")
                            (org-tags-match-list-sublevels nil)))
                ;; うまくアーカイブ対象の絞り込み条件を検討できるまで保留。
                ;; それまでは、セルフでアーカイブ対象を適宜C-x C-s
                ;; (tags "-REFILE-NOTE-ETC/"
                ;;       ((org-agenda-overriding-header "アーカイブ待ち")
                ;;        (org-tags-match-list-sublevels 'indented))))
               nil)))))

;;;; org-clock系設定
;; Resume clocking task when emacs is restarted
(org-clock-persistence-insinuate)
;;
;; Show lot of clocking history so it's easy to pick items off the C-F11 list
(setq org-clock-history-length 23)
;; Resume clocking task on clock-in if the clock is open
(setq org-clock-in-resume t)
;; Change tasks to NEXT when clocking in
;; (setq org-clock-in-switch-to-state 'clock-in-to-next)
;; Separate drawers for clocking and logs
(setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
;; Save clock data and state changes and notes in the LOGBOOK drawer
(setq org-clock-into-drawer t)
;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)
;; Clock out when moving task to a done state
(setq org-clock-out-when-done t)
;; Save the running clock and all clock history when exiting Emacs, load it on startup
(setq org-clock-persist t)
;; Do not prompt to resume an active clock
(setq org-clock-persist-query-resume nil)
;; Enable auto clock resolution for finding open clocks
(setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
;; Include current clocking task in clock reports
(setq org-clock-report-include-clocking-task t)

;; TODO: bugfix
;; (defun clock-in-to-next (kw)
;;   "clock-in時、TODOタスクをNEXTタスクに変更"
;;   (when (not (and (boundp 'org-capture-mode) org-capture-mode))
;;     (cond
;;      ((member (org-get-todo-state) (list "TODO")))
;;       "NEXT")
;;       ))
