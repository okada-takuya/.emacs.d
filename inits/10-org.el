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

;; agenda 表示の対象ファイル
(setq org-agenda-files (list org-directory))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitch)

;; DONEの時刻を記録
(setq org-log-done 'time)

;; 独自に設定したTODOの状態の色指定
;; 色一覧は M-x list-colors-display
(setq org-todo-keyword-faces
      '(("STARTED" . "turquoise1")
        ("DOING" . "red")
        ("WAIT" . "SeaGreen1")
        ("POSTPONE" . "magenta")
        ("MAYBE" . "yellow")
        ("CANCELED" . "navajo white")
        ))

;; org-capture の設定
(setq org-capture-templates
      '(("t" "TODO" entry (file+headline todo-file "Inbox")
         "*** TODO %?\n    CAPTURED_AT: %a\n    %i")))

(setq org-agenda-custom-commands
      '(
        ("o" . "Original agenda view") ; description for "o" prefix
        ("oa" "ALL TODO"
         (
          (todo "TODO")
          (todo "STARTED")
          (todo "WAIT")
          (todo "POSTPONE")
          (todo "MAYBE")
          )
         )
        ("ot" todo "TODO")
        ("os" todo "STARTED")
        ("ow" todo "WAIT")
        ("op" todo "POSTPONE")
        ("om" todo "MAYBE")
        ("oS" tags-todo "@SHOPPING")
        ("oH" tags-todo "@HOME")
        ("oO" tags-todo "@OFFICE")
        ))
