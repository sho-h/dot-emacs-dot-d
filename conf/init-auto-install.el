; = ����
;
; ��Ӥ������󤬺������줿 auto-install.el ��ͭ���ˤ��롣
;
; = ����
;
; http://www.emacswiki.org/emacs/download/auto-install.el
;
; = �Ȥ���
;
; �ʲ��Τ褦�ˤ��ƻ��Ѥ��롣(��Ӥ��������ʸ�ϤΥ��ԥ�)
;
; * M-x install-elisp �� URL����ꤷ�ƥ��󥹥ȡ��뤹��
; * M-x install-elisp-from-emacswiki �� EmacsWiki�ˤ���EmacsLisp�򥤥󥹥ȡ���
; * M-x install-elisp-from-gist �� gistID����ꤷ�ƥ��󥹥ȡ���

(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)             ; �ߴ�������
