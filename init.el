; load-path �������Ԥ���
; http://github.com/aircastle/dot-emacs-dot-d
(defun add-to-load-path (&rest paths)
  (mapc '(lambda (path)
           (add-to-list 'load-path path))
        (mapcar 'expand-file-name paths)))
(add-to-load-path
  "~/.emacs.d/conf" "~/.emacs.d/elisp" "~/.emacs.d/auto-install")

(load "init-japanese")
(load "init-basis")
(load "init-c")
(load "init-ruby")
(load "init-js2")
(load "init-gpg")
(load "init-wl")
(load "init-eshell")
(load "init-svn")
(load "init-whitespace")
(load "init-auto-install")
(load "anything-startup")
(load "init-anything-rurema")
(load "init-desktop")
(load "dired-setup")

; ���֤����ѥ��ڡ����θ����ܤ�狼��䤹����Τˤ��롣
; c.f. http://homepage3.nifty.com/satomii/software/elisp.ja.html
(require 'jaspace)

; ���ܸ�Υ��󥯥��󥿥븡����Ԥ���
; migemo �Ȱ��˥��󥹥ȡ���Ǥ��롣
(load "migemo/migemo")
