;; Fonts
(cond ((member "Myrica M" (font-family-list))
       (let* ((size 12)
              (asciifont "Myrica M")
              (jpfont "Myrica M")
              (h (* size 10))
              (fontspec (font-spec :family asciifont))
              (jp-fontspec (font-spec :family jpfont)))
         (set-face-attribute 'default nil :family asciifont :height h)
         (set-fontset-font nil 'japanese-jisx0213.2004-1 jp-fontspec)
         (set-fontset-font nil 'japanese-jisx0213-2 jp-fontspec)
         (set-fontset-font nil 'katakana-jisx0201 jp-fontspec)
         (set-fontset-font nil '(#x0080 . #x024F) fontspec)
         (set-fontset-font nil '(#x0370 . #x03FF) fontspec)))
      (t
       (let* ((size 12)
              (asciifont "Consolas")
              (jpfont "MS Gothic")
              (h (* size 12))
              (fontspec (font-spec :family asciifont))
              (jp-fontspec (font-spec :family jpfont)))
         (set-face-attribute 'default nil :family asciifont :height h)
         (set-fontset-font nil 'japanese-jisx0213.2004-1 jp-fontspec)
         (set-fontset-font nil 'japanese-jisx0213-2 jp-fontspec)
         (set-fontset-font nil 'katakana-jisx0201 jp-fontspec)
         (set-fontset-font nil '(#x0080 . #x024F) fontspec)
         (set-fontset-font nil '(#x0370 . #x03FF) fontspec))))
