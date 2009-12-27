; = ����
;
; Stefan Reichoer ���󤬺������줿 psvn ��ͭ���ˤ��롣
;
; = ����
;
; http://www.xsteve.at/prg/emacs/

(require 'psvn)

(add-to-list 'vc-handled-backends 'SVN)
(when (and (boundp 'vc-handled-backends)
           (file-exists-p "/usr/share/emacs/site-lisp/vc-svn.el"))
 (setq vc-handled-backends (append vc-handled-backends (list 'SVN))))

; n��p �����β����Ǿ岼�˰�ư���롣
(define-key svn-status-mode-map [?n] 'forward-line)
(define-key svn-status-mode-map [?p] 'previous-line)

; dired-mode �� V �����β������� svn-status ��¹Ԥ��롣
(add-hook 'dired-mode-hook
          '(lambda ()
             (require 'dired-x)
             (define-key dired-mode-map "V" 'svn-status)
             (turn-on-font-lock)
             ))

; svn status �����ѹ��Τʤ��ե������ɽ�����ʤ���
(setq svn-status-hide-unmodified t)

; psvn ���¹Ԥ��� svn ���ޥ�ɤ� LANG �� UTF-8 �ˤ��롣
(setq process-coding-system-alist
      (cons '("svn" . utf-8) process-coding-system-alist))
