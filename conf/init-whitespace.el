; = ����
;
; �����ζ���ʸ�����֤��ϥ��饤��ɽ���ˤ��롣��������w3-mode�ʤɤξ���
; �������롣
;
; = ����
;
; http://paste.lisp.org/display/4085

(when (>= emacs-major-version 21)
  (setq-default show-trailing-whitespace t)

  (defun turn-off-show-trailing-whitespace ()
    "Turn on the highlighting of trailing whitespace in this buffer."
    (interactive)
    (setq show-trailing-whitespace nil))

  (defun turn-on-show-trailing-whitespace ()
    "Turn off the highlighting of trailing whitespace in this buffer."
    (interactive)
    (setq show-trailing-whitespace t))

  (defun toggle-show-trailing-whitespace ()
    "Toggle the highlighting of trailing whitespace in this buffer."
    (interactive)
    (setq show-trailing-whitespace
          (not show-trailing-whitespace)))

  ;Turn off the whitespace highlighting in various modes.
  (let ((mode-hooks '(Buffer-menu-mode-hook mail-mode-hook
                                            eshell-mode-hook
                                            w3-mode-hook
                                            mime-view-mode-hook
                                            diff-mode-hook
                                            riece-channel-mode-hook
                                            riece-others-mode-hook)))

    (mapcar '(lambda (mode-hook)
               (add-hook mode-hook 'turn-off-show-trailing-whitespace))
            mode-hooks)))
