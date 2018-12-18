;; Define open files that be used often.
;; Default is Document.
(setq org-document-dir "~/Documents/org/")
(when (file-exists-p "~/Dropbox/org/")
  (setq org-document-dir "~/Dropbox/org/"))

;;; Open TODO List.
(defun todo ()
  (interactive)
  (find-file (concat org-document-dir "TODO.org")))

;;; Open my memo file.
(defun memo ()
  (interactive)
  (find-file (concat org-document-dir "MEMO.org")))
;;; Open my word-list file.
(defun word-list ()
  (interactive)
  (find-file (concat org-document-dir "WORD-LIST.org")))

;;; Open my task record file.
(defun task-record ()
  (interactive)
  (find-file (concat org-document-dir "TASK-RECORD.org")))

;;; Open my KPT file
(defun kpt ()
  (interactive)
  (find-file (concat org-document-dir "KPT.org")))
