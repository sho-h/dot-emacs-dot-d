; = ����
;
; kill-summary ��ͭ���ˤ��� kill-ring ���� yank ����ʸ���������Ǥ���
; �褦�ˤ��롣
;
; = ����
;
; http://mibai.tec.u-ryukyu.ac.jp/~oshiro/Programs/elisp/kill-summary.el
;
; = �Ȥ���
;
; �ʲ���kill-summary.el ����Υ��ԥڡ�
;
; ��kill-ring �����ѥХåե����̥�����ɥ���ɽ��
; ��p,n (j,k) �����ȼ��θ�������򤷸��Խ��Хåե��إ��
;   C-p (previous-line),C-n (next-line) �ʤ������ư���������
;   SPC �Ǹ��߹Ԥ�����C-v (scroll-up) �ǥ�������
; ������ΰ�� yank-pop ���˼������ڤ��ؤ��
; ��yank-pop �Ȥ�����������ݡ�M-y �˳�����Ƥ�ФҤȤޤ�Ʊ���褦�˻�
;   ����ʤޤ����ư��ϤǤ��ʤ�...�ˡ�
; ��ɽ�����¾�����ϤǤ��ʤ���RET (newline) ��������ꡥ
;   ��� (q, C-g (keyboard-quit), C-xo (other-window)) ����
;   ����ΰ��õ�
; ��d �Ǹ��߹ԤΥ����󥰤�¨�¤˾õ�
; ��'.' �Ǹ��߹Ԥ��󥯥ݥ��󥿤�����
; ��t �ǳƥ���ιԿ�ɽ�����ڤ��ؤ�
; ��^,_ �ǥ��ޥ꡼�⤵���ѹ�

(autoload 'kill-summary "kill-summary" nil t)
(define-key global-map "\ey" 'kill-summary)
