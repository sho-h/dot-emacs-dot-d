; = ����
;
; ��Ӥ������󤬺������줿 auto-install.el �Υ��åȥ��åפ�Ԥ���
;
; = ����
;
; http://www.emacswiki.org/emacs/download/auto-install.el
;
; = �Ȥ���
;
; * M-x install-elisp �� URL����ꤷ�ƥ��󥹥ȡ��뤹��
; * M-x install-elisp-from-emacswiki �� EmacsWiki�ˤ���EmacsLisp�򥤥󥹥ȡ���
; * M-x install-elisp-from-gist �� gistID����ꤷ�ƥ��󥹥ȡ���

(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)             ; �ߴ�������
