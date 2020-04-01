;; Define open files that be used often.
;; Default is Document.
(setq org-document-dir "~/Documents/org/")
(when (file-exists-p "~/Dropbox/org/")
  (setq org-document-dir "~/Dropbox/org/"))

;;; Search org-directory
(defun find-file-org-document-directory (filename)
  "ディレクトリ `org-document-dir' のファイルを開く"
  (interactive
   (list (read-file-name "Find files: " org-document-dir)))
  (find-file filename))

;;; Open TODO List.
(defun todo ()
  (interactive)
  (find-file (concat org-document-dir "TODO.org")))

;;; Open my memo file.
(defun note ()
  (interactive)
  (find-file (concat org-document-dir "NOTE.org")))

;;; Open my word-list file.
(defun word-list ()
  (interactive)
  (find-file (concat org-document-dir "WORD-LIST.org")))

;;; Open my KPT file
(defun kpt ()
  (interactive)
  (find-file (concat org-document-dir "KPT.org")))

;;; Open my clock table file
(defun clock-tables ()
  (interactive)
  (find-file (concat org-document-dir "clock-tables.org")))
