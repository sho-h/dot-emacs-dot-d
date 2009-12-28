; = ����
;
; ruby-mode ���ѻ��ΰʲ��������Ԥ���
;
; * style ������
; * ��¸���˼�ư�� magic comment ���ɲ�
;
; �ʤ���ruby-mode ����Ѥ��뤿��ˤϡ��ʲ��Υ��ޥ�ɤ� elisp �򥤥󥹥ȡ�
; �뤷�Ƥ�����
;
; $ sudo aptitude install ruby-elisp
;

; ruby ��ȯ�� c-mode �����ꡣ
; http://pub.cozmixng.org/~the-rwiki/rw-cgi.rb?cmd=view;name=Emacs
(c-add-style
 "ruby"
 '("bsd"
   (c-basic-offset . 4)
   (c-offsets-alist
    (case-label . 2)
    (label . 2)
    (statement-case-intro . 2)
    (statement-case-open . 2)
    )))

; ��¸���˼�ư��Ruby 1.9��magic comment��Ĥ��롣
; c.f. http://d.hatena.ne.jp/rubikitch/20080307/magiccomment
(defun ruby-insert-magic-comment-if-needed ()
  "�Хåե���coding-system���Ȥ�magic comment��Ĥ��롣"
  (when (and (eq major-mode 'ruby-mode)
             (find-multibyte-characters (point-min) (point-max) 1))
    (save-excursion
      (goto-char 1)
      (when (looking-at "^#!")
        (forward-line 1))
      (if (re-search-forward "^#.+coding" (point-at-eol) t)
          (delete-region (point-at-bol) (point-at-eol))
        (open-line 1))
      (let* ((coding-system (symbol-name buffer-file-coding-system))
             (encoding (cond ((string-match "japanese-iso-8bit\\|euc-j" coding-system)
                              "euc-jp")
                             ((string-match "shift.jis\\|sjis\\|cp932" coding-system)
                              "shift_jis")
                             ((string-match "utf-8" coding-system)
                              "utf-8"))))
        (insert (format "# -*- coding: %s -*-" encoding))))))

(add-hook 'before-save-hook 'ruby-insert-magic-comment-if-needed)
