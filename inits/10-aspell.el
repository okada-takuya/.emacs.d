(add-to-list 'exec-path "/opt/local/bin/aspell")
(setq-default ispell-program-name "aspell")
(add-hook 'yatex-mode-hook 'flyspell-mode)
