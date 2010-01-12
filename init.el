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
(load "init-kill-summary")
(load "init-swbuff")
(load "init-auto-install")
(load "anything-startup")
(load "init-anything-rurema")
(load "init-anything-rcodetools")
(load "init-auto-complete")
(load "init-one-key")
(load "init-desktop")
(load "dired-setup")

; ���ܸ�Υ��󥯥��󥿥븡����Ԥ���
; migemo �Ȱ��˥��󥹥ȡ���Ǥ��롣
(load "migemo/migemo")

; PDF �ե������ PS �ե������ Emacs ����ɤ��褦�ˤ��롣
; * M-x install-elisp-from-emacswiki doc-view.el
; * M-x doc-view ���� �ե�����̾�����
; * n ���������Ǽ��Υڡ���
; * p �������������Υڡ���
(require 'doc-view)
