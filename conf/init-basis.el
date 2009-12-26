;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; �����Х���ɤ˴�Ϣ��������
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

; M-/ ��ưŪά��Ÿ���κݤˤ�Ĵɽ�����롣
; http://www.namazu.org/~tsuchiya/elisp/dabbrev-highlight.el
(require 'dabbrev-highlight)

; dabbrev-highlight �δ�����ʿ��̾��ޤ�ñ���б���
; c.f. http://www.namazu.org/~tsuchiya/elisp/dabbrev-ja.el
(load "dabbrev-ja")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ������ɥ��������ʤɡ��ƥ����Ȥ��Խ��˴�Ϣ���ʤ�����
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Emacs �ε�ư��˥ե졼�ॵ����(�Ĥ�Ĺ��)�����ˤ��롣¾�δĶ��Ǥ�48
; ����ʤ����⡣
; c.f. Emacs ��ŵ
(add-hook 'window-setup-hook
	  (lambda () (set-frame-height (selected-frame) 48)) t)

; �ե졼��ΰ��֤򺸾��ü�ˤ��롣
; c.f. Emacs ��ŵ
(set-frame-position (selected-frame) 0 0)

; TODO: ��ư��˥�����ɥ���ꥵ����������˥ߥ˥Хåե����礭���ʤä�
; ���ޤ��Τ�ʤ�Ȥ����롣resize-minibuffer-mode ���ѻߤ���Ƥ��������
; �ա�

; ��ư���Υ�å�������ɽ�����ʤ���
(setq inhibit-startup-message t)

; �ġ���С���ɽ�����ʤ���
(tool-bar-mode nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ����¾������
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
