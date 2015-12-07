;; load my MHC
(setq mhc-icon-path "~/Programs/mhc/icons")
(setq load-path
      (cons "~/Programs/mhc/emacs" load-path))
(autoload 'mhc "mhc" "Message Harmonized Calendar system." t)

(defun hide-trailing-whitespace ()
  (setq show-trailing-whitespace nil))

(defun fix-fontsize ()
  (setq show-trailing-whitespace nil))

(add-hook 'mhc-mode-hook 'hide-trailing-whitespace)

;; Display events with real calendar format
(defun open-calendar ()
  (interactive)
  (require 'calfw)
  (require 'mhc-calfw)
  (require 'calfw-org)
  (cfw:open-calendar-buffer
   :view 'month
   :contents-sources
   (list
    (cfw:mhc-create-source "holiday"  "red"    "Holiday")
    (cfw:mhc-create-source "birthday" "brown"  "Birthday")
    (cfw:mhc-create-source "all"      "white"  "!(Holiday || Birthday)"))))

;; auto-mode
(add-to-list 'auto-mode-alist '("\\.mhc$" . mhc-draft-mode))

;;
;; Calendar formatting
;;

(setq mhc-start-day-of-week 1) ;; WKST is Monday
(setq mhc-calendar-start-day-of-week 1) ;; for mini calendar
(setq mhc-use-month-separator t)
(setq mhc-use-wide-scope 'week)
(setq mhc-summary-line-format "%Y%/%M%/%D%S%W %b%e %c%i%s%r %p%l")
(setq mhc-summary-use-cw t)

;;
;; Icons
;;
(setq mhc-use-icon t)

;; for 14pt
(setq mhc-e21-icon-alist
  '(("Conflict"   . "Conflict.xpm.resized")
    ("Recurrence" . "Recurrence.xpm.resized")
    ("Private"    . "Private.xpm.resized")
    ("Party"      . "Party.xpm.resized")
    ("Melco"      . "Business.xpm.resized")
    ("Birthday"   . "Birthday.xpm.resized")
    ("Holiday"    . "Holiday.xpm.resized")
    ("Todo"       . "CheckBox.xpm.resized")
    ("Done"       . "CheckedBox.xpm.resized")
    ("Link"       . "Link.xpm.resized")))

;; for 16pt
;; (setq mhc-e21-icon-alist
;;   '(("Conflict"   . "Conflict.xpm")
;;     ("Recurrence" . "Recurrence.xpm")
;;     ("Private"    . "Private.xpm")
;;     ("Party"      . "Party.xpm")
;;     ("Melco"      . "Business.xpm")
;;     ("Birthday"   . "Birthday.xpm")
;;     ("Holiday"    . "Holiday.xpm")
;;     ("Todo"       . "CheckBox.xpm")
;;     ("Done"       . "CheckedBox.xpm")
;;     ("Link"       . "Link.xpm")))

;;
;; Faces
;; ("Category name" . (font "char color" "background color"))
(setq mhc-category-face-alist
       '(
         ("private"    . (nil  "gray70"      nil))
         ("swlab"      . (nil  "yellow"      nil))
         ("nomlab"     . (nil  "green"       nil))
         ("net-mgr"    . (nil  "DarkOrchid1" nil))
         ("camp-mgr"   . (nil  "DarkOrchid1" nil))
         ("gn"         . (nil  "SkyBlue1"    nil))
         ("melco"      . (nil  "Red"         nil))
         ))

(setq mhc-symbol-face-alist
  '((mhc-summary-face-location  . (nil "white"       "DeepSkyBlue1"))
    (mhc-summary-face-recurrence . (nil "white"      "green2"))))
