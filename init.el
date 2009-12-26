; load-path の設定を行う。
; http://github.com/aircastle/dot-emacs-dot-d
(defun add-to-load-path (&rest paths)
  (mapc '(lambda (path)
           (add-to-list 'load-path path))
        (mapcar 'expand-file-name paths)))
(add-to-load-path
  "~/.emacs.d/conf" "~/.emacs.d/elisp" "~/.emacs.d/auto-install")

(load "init-japanese")
(load "init-keybind")
(load "init-ruby")
(load "init-c")
(load "init-gpg")
(load "init-wl")
(load "init-eshell")
(load "init-auto-install")
(load "anything-startup")
(load "init-anything-rurema")
(load "init-desktop")
