; = ����
;
; auto-complete.el ��ͭ���ˤ��롣
;
; = ����
;
; * Software Design 2010ǯ 1���
; * http://www.emacswiki.org/emacs/AutoComplete
; * http://github.com/m2ym/auto-complete/tree/v1.0
;

(when (require 'auto-complete nil t)
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/dict.auto-complete/")
  (require 'auto-complete-config)
  (ac-config-default)

  ; �����Х�� auto-complete ����Ѥ��롣
  (global-auto-complete-mode t)

  ; C-n��C-p �Ǽ������θ�������򤹤롣
  (define-key ac-completing-map (kbd "C-n") 'ac-next)
  (define-key ac-completing-map (kbd "C-p") 'ac-previous)

  ; TAB �������䴰��λ���롣
  (define-key ac-completing-map (kbd "TAB") 'ac-complete)

  ; ���䤬1�Ĥ����ʤ����˥��֥����������䴰��λ���롣
  ; �� / ���������������˥��֥����������䴰��λ���롣
  ; �䴰��˥�˥塼��ưŪ����ɽ���ˤ��롣
  (setq ac-dwim t)

  ; ���󸻤Ȥ��ưʲ������Ѥ��롣
  ; * ac-source-filename
  ; * ac-source-words-in-buffer
  (setq-default ac-sources '(ac-source-filename ac-source-words-in-buffer))

  ; ��ư�䴰��̵���ˤ��롣
  (setq ac-auto-start nil)

  ; 3ʸ���ܤ��鼫ư�䴰��ͭ���ˤ��롣
  (setq ac-auto-start 3)

  ; TODO: EmacsWiki �ˤ���ʲ���������ˤĤ��Ƴ�ǧ����ͭ���ˤ��뤫�ɤ�
  ; ������롣Software Design 2010ǯ 2���ǾҲ�ͽ��ʤΤ��⡣
  ;(require 'auto-complete-yasnippet)
  ;(require 'auto-complete-ruby)
  ;(require 'auto-complete-css)
)
