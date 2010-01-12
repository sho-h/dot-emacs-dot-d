; load-path の設定を行う。
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

; 日本語のインクリメンタル検索を行う。
; migemo と一緒にインストールできる。
(load "migemo/migemo")

; PDF ファイルや PS ファイルを Emacs 上で読めるようにする。
; * M-x install-elisp-from-emacswiki doc-view.el
; * M-x doc-view して ファイル名を指定
; * n キー押下で次のページ
; * p キー押下で前のページ
(require 'doc-view)
