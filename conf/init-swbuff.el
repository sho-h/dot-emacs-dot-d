; = ����
;
; swbuff.el ��ͭ���ˤ��롣
;
; = ����
;
; http://sourceforge.net/projects/emhacks/
;
; = �Ȥ���
;
; * C-x , �Ǽ��ΥХåե���ɽ������(����� C-F6)
; * C-x . �����ΥХåե���ɽ������(����� C-Shift-F6)
;
; C-x . ���񤭤����Τǡ�fill-prefix �����ѤǤ��ʤ��ʤäƤ��������ա�

(require 'swbuff)
(global-set-key "\C-x," 'swbuff-switch-to-next-buffer)
(global-set-key "\C-x." 'swbuff-switch-to-previous-buffer)
