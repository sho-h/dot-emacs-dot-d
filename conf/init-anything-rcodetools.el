; = ����
;
; anything-rcodetools.el ��ͭ���ˤ��롣
;
; = ����
;
; http://d.hatena.ne.jp/keyword/rcodetools
; http://www.emacswiki.org/cgi-bin/wiki/download/anything-rcodetools.el
;
; = �Ȥ���
;
; �ޤ��ϰʲ���¹Ԥ��� rcodetools �Υ��󥹥ȡ����Ԥ���rcodetools.el
; �� load �Ǥ���ѥ������֤��롣
;
;   $ sudo gem install rcodetools --no-rdoc --no-ri
;
; gem1.9.1 �ʤɤ�Ȥ��褦���ü�ʾ��ˤϡ�rcodetools.el �Ρ�ruby ...��
; ����ʬ��񤭴����롣
;
; ���˰ʲ���¹Ԥ��� auto-install �ǤΥ��󥹥ȡ����Ԥ���
;
;   M-x install-elisp-from-emacswiki anything-rcodetools.el
;
; ���Ȥϡ�M-C-i �� Ruby �Υ᥽�åɤ��䴰���Ǥ���褦�ˤʤ롣
;

(require 'anything)
(require 'anything-rcodetools)
(defun ruby-mode-hook-rcodetools ()
  (define-key ruby-mode-map "\M-\C-i" 'rct-complete-symbol))
(add-hook 'ruby-mode-hook 'ruby-mode-hook-rcodetools)