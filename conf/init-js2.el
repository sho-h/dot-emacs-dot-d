; = ����
;
; steve.yegge ���󤬺������줿 js2-mode ��ͭ���ˤ��롣
;
; = ����
;
; http://code.google.com/p/js2-mode/
; http://8-p.info/emacs-javascript.html

(setq-default c-basic-offset 2)

(when (load "js2" t)
  (defun indent-and-back-to-indentation ()
    (interactive)
    (indent-for-tab-command)
    (let ((point-of-indentation
           (save-excursion
             (back-to-indentation)
             (point))))
      (skip-chars-forward "\s " point-of-indentation)))
  (define-key js2-mode-map "\C-i" 'indent-and-back-to-indentation)

  (define-key js2-mode-map "\C-m" nil)

  (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode)))
