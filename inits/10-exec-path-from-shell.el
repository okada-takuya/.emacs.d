(let ((envs '("PATH" "VIRTUAL_ENV" "GOROOT" "GOPATH")))
  (exec-path-from-shell-copy-envs envs))
