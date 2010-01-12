; = ����
;
; Emacs �δ���Ū�������Ԥ����ʲ���ʬ�ष�Ƶ��Ҥ���Ƥ��롣
;
; * �����Х���ɤ˴�Ϣ��������
; * ������ɥ��������ʤɡ��ƥ����Ȥ��Խ��˴�Ϣ���ʤ�����
; * ����¾������
;
; �Ȥ����仲�ͤˤ����������Ϥ��줾��˵��Ҥ��롣
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; == �����Х���ɤ˴�Ϣ��������
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; C-x C-c�� Emacs ��λ���ʤ���
(global-unset-key "\C-x\C-c")
(defalias 'quit-emacs 'save-buffers-kill-emacs)

; C-z �ǤΥե졼��򥢥����󲽤��������롣
(global-unset-key "\C-z")

; C-x p �� C-x o �εս�˥ե졼���ư���롣
(global-set-key "\C-xp" (lambda () (interactive) (other-window -1)))

; C-h �� backspace��
; c.f. http://www.fan.gr.jp/~ring/Meadow/meadow.html#back-space
(keyboard-translate ?\C-h ?\C-?)
(global-set-key "\C-h" nil)

; M-& ���б������̤˥���������ư���롣
(global-set-key "\M-&" 'match-paren)
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert &."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

; C-u �ǥ���������֤ˤ���ñ��� man �ڡ����򳫤���
(global-set-key "\C-u" nil)
(global-set-key "\C-u" (lambda () (interactive) (manual-entry (current-word))))

; M-/ ��ưŪά��Ÿ���κݤ˸����ñ���Ĵɽ�����롣
; http://www.namazu.org/~tsuchiya/elisp/dabbrev-highlight.el
(require 'dabbrev-highlight)

; dabbrev-highlight �δ�����ʿ��̾��ޤ�ñ���б���
; c.f. http://www.namazu.org/~tsuchiya/elisp/dabbrev-ja.el
(load "dabbrev-ja")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; == ������ɥ��������ʤɡ��ƥ����Ȥ��Խ��˴�Ϣ���ʤ�����
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Emacs �ε�ư��˥ե졼�ॵ����(�Ĥ�Ĺ��)�����ˤ��롣¾�δĶ��Ǥ�48
; ����ʤ����⡣
; c.f. Emacs ��ŵ
(add-hook 'window-setup-hook
	  (lambda () (set-frame-height (selected-frame) 48)) t)

; �ե졼��ΰ��֤򺸾��ü�ˤ��롣�եå��Ǥ��ʤ��Ƥ⺸��˰�ư�����
; ���Ǥ��뤬���ե졼��ι⤵���ѹ��������˥ߥ˥Хåե����礭���ʤäƤ�
; �ޤ��Τ� ad-hoc ���б����Ƥ��롣
; c.f. Emacs ��ŵ
(add-hook 'window-setup-hook
  (lambda ()
    (set-frame-position (selected-frame) 1 1)
    (set-frame-position (selected-frame) 0 0)) t)

; ��ư���Υ�å�������ɽ�����ʤ���
(setq inhibit-startup-message t)

; �ġ���С���ɽ�����ʤ���
(tool-bar-mode nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; == ����¾������
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; �⡼�ɥ饤��(������ɥ��β���ȿžɽ������Ƥ��롤�����Ӿ�����ʬ)�˹�Ƭ
; �����ʸ�������ɲ�
; c.f. http://homepage.mac.com/zenitani/elisp-j.html
(column-number-mode t)

; �б������̤���餻�롣
(show-paren-mode 1)

; ñ��˶�Ĵ���դ��롣
(global-font-lock-mode t)

; �ޡ��������ΰ��Ĵɽ������
; c.f. http://www.ayu.ics.keio.ac.jp/~mukai/tips/dot-emacs.html
(setq transient-mark-mode t)

; fringe(��¦�ޤ��֤���ʬ)�ǥե�����������ɽ�����롣
(setq-default indicate-empty-lines t)

; switch-to-buffer ��¸�ߤ��ʤ��Хåե�����ꤷ�����˿������Хåե����
; �����ʤ���
(defadvice switch-to-buffer (before existing-buffer activate compile)
  "When interactive, switch to existing buffers only,
   unless given a prefix argument."
  (interactive
   (list (read-buffer "Switch to buffer: "
                      (other-buffer)
                      (null current-prefix-arg)))))

; Ʊ��ե�����̾�ΥХåե�̾���ˡ����ˤ��롣
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]*")

; shebang �ν񤫤�Ƥ���ե��������¸���˼�ưŪ�� chmod +x ���롣
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

; diff �γ�ǧ��Ԥ����Υ��ץ����� -u �����ꡣ
(setq diff-switches "-u")

; rd-mode ��ͭ���ˤ��롣
(global-font-lock-mode 1 t)
(autoload 'rd-mode "rd-mode" "major mode for ruby document formatter RD" t)
(add-to-list 'auto-mode-alist '("\\.rd$" . rd-mode))

; ��ư�ǥ��ڥ�����å���Ԥ���
(setq ispell-personal-dictionary "~/.emacs.d/dict/ispell")
; TODO: �ʲ��Τ褦�ˤ��ơ�rd-mode �λ��Τߡ�flyspell-mode ��ͭ���ˤʤ�
; �褦�ˤ���������Emacs �ε�ư���٤��ʤ�ΤǤ�����н褹�롣
;(setq ispell-silently-savep t)
;(add-hook 'rd-mode-hook
;    '(lambda()
;       (flyspell-mode t)))

; 1�Ԥ��ޤ��֤���Ĺ�����ˤ⡢C-p �� C-n �Ǹ����ܤΤޤް�ư���롣
(global-set-key "\C-p" 'previous-window-line)
(global-set-key "\C-n" 'next-window-line)
(global-set-key [up] 'previous-window-line)
(global-set-key [down] 'next-window-line)
(defun previous-window-line (n)
  (interactive "p")
  (let ((cur-col (- (current-column)
    (save-excursion (vertical-motion 0) (current-column)))))
    (vertical-motion (- n))
    (move-to-column (+ (current-column) cur-col)))
  (run-hooks 'auto-line-hook))
(defun next-window-line (n)
  (interactive "p")
  (let ((cur-col (- (current-column)
    (save-excursion (vertical-motion 0) (current-column)))))
    (vertical-motion n)
    (move-to-column (+ (current-column) cur-col)))
  (run-hooks 'auto-line-hook))

; M-* �� kakasi ���ޥ�ɤ�Ȥäƥ���������֤ˤ���������ɤߤ�
; minibuffer ��ɽ�����롣
(defun display-ruby-on-minibuffer ()
  (interactive)
  (shell-command (concat "echo \"" (current-word) "\" | kakasi -JH")))
(global-set-key "\M-*" 'display-ruby-on-minibuffer)

; cc-mode��ruby-mode��rd-mode �ǥ��֤����ѥ��ڡ����θ����ܤ�狼��䤹
; ����Τˤ��롣
; c.f. http://homepage3.nifty.com/satomii/software/elisp.ja.html
(require 'jaspace)
(setq jaspace-modes '(cc-mode ruby-mode rd-mode text-mode))
