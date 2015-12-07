;;; file-reference-recorder.el --- Record files that emacs referred

;; Copyright (C) 2015 by Takuya Okada

;; Author: Takuya Okada <pitipitiunsyumikan@gmail.com>
;; URL: ***************************************************************
;; Version: 0.1
;; Package-Requires: **************************************************

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(setq debug-on-error t) ;; debug function

(defgroup file-reference-recorder nil
  "File reference recorder"
  :group 'text
  :prefix "frr:")

(defcustom frr:history-location (expand-file-name "~/.file-reference-history")
  "History file location"
  :type 'string
  :group 'file-reference-recorder)

(defstruct frr:recorder
  is-on
  title
  path
  start-stamp)

(defstruct frr:history
  title
  path
  start-stamp
  end-stamp)

(defvar frr:histories ())

;; file operation functions
(defun frr:init-histories-file ()
  "Initialize file storing history at frr:history-location"
  (with-temp-buffer (write-file frr:history-location)))

(defun frr:save-histories ()
  "save file reference histories to frr:history-location"
  (with-temp-buffer
    (insert (format "%s" frr:histories))
    (write-file frr:history-location)))

(defun frr:read-histories ()
  "read file reference histories from frr:history-location"
  (with-temp-buffer
    (insert-file-contents frr:history-location)
    (setq frr:histories (read (buffer-string)))))

; recording functions
(defun frr:stop-recording ()
  (cond ((not (frr:recorder-is-on recorder)))
        (t (push (make-frr:history :title       (frr:recorder-title       recorder)
                                   :path        (frr:recorder-path        recorder)
                                   :start-stamp (frr:recorder-start-stamp recorder)
                                   :end-stamp   (current-time-string))
                 frr:histories)
           (frr:save-histories)
           (setf (frr:recorder-is-on recorder) nil))))

(defun frr:start-recording ()
  (cond ((and (frr:recorder-is-on recorder) (eq (buffer-file-name) (frr:recorder-path recorder))))
        (t (message "Recording start at: %s" (current-time-string))
           (frr:stop-recording) ; record previous file
           (setf (frr:recorder-is-on       recorder) t)
           (setf (frr:recorder-title       recorder) (buffer-name))
           (setf (frr:recorder-path        recorder) (buffer-file-name))
           (setf (frr:recorder-start-stamp recorder) (current-time-string)))))

;; main
(cond ((file-exists-p frr:history-location))
      (t (frr:init-histories-file)))
(setf recorder (make-frr:recorder))
(frr:read-histories)
(frr:start-recording)

;; setup timers

;; add hooks for recording
(add-hook 'find-file-hooks         'frr:start-recording)
(add-hook 'focus-in-hook           'frr:start-recording)
(add-hook 'mouse-leave-buffer-hook 'frr:start-recording)
(add-hook 'post-command-hook       'frr:start-recording)

(add-hook 'focus-out-hook   'frr:stop-recording)
(add-hook 'kill-emacs-hooks 'frr:stop-recording)
