;; scroll setting for track pad
(defun scroll-down-with-lines ()
  "" (interactive) (scroll-down 3))
(defun scroll-up-with-lines ()
  "" (interactive) (scroll-up 3))
(global-set-key [wheel-up] 'scroll-down-with-lines)
(global-set-key [wheel-down] 'scroll-up-with-lines)
(global-set-key [double-wheel-up] 'scroll-down-with-lines)
(global-set-key [double-wheel-down] 'scroll-up-with-lines)
(global-set-key [triple-wheel-up] 'scroll-down-with-lines)
(global-set-key [triple-wheel-down] 'scroll-up-with-lines)

;; mouse wheel control

;; one line at a time
(setq mouse-wheel-scroll-amount '(2 ((shift) . 2)))

;; don't accelerate scrolling
(setq mouse-wheel-progressive-speed nil)

;; accelerate scrolling
;; (setq mouse-wheel-progressive-speed t)

;; keyboard scroll one line at a time
(setq scroll-step 1)
