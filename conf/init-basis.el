; = 概要
;
; Emacs の基本的な設定を行う。以下に分類して記述されている。
;
; * キーバインドに関連する設定
; * ウィンドウサイズなど、テキストの編集に関連しない設定
; * その他の設定
;
; 使い方や参考にしたソースはそれぞれに記述する。
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; == キーバインドに関連する設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; C-x C-cで Emacs を終了しない。
(global-unset-key "\C-x\C-c")
(defalias 'quit-emacs 'save-buffers-kill-emacs)

; C-z でのフレームをアイコン化を抑制する。
(global-unset-key "\C-z")

; C-x p で C-x o の逆順にフレーム移動する。
(global-set-key "\C-xp" (lambda () (interactive) (other-window -1)))

; C-h で backspace。
; c.f. http://www.fan.gr.jp/~ring/Meadow/meadow.html#back-space
(keyboard-translate ?\C-h ?\C-?)
(global-set-key "\C-h" nil)

; M-& で対応する括弧にカーソルを移動する。
(global-set-key "\M-&" 'match-paren)
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert &."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

; C-u でカーソル位置にある単語を元 man ページを開く。
(global-set-key "\C-u" nil)
(global-set-key "\C-u" (lambda () (interactive) (manual-entry (current-word))))

; M-/ で動的略称展開の際に候補の単語を強調表示する。
; http://www.namazu.org/~tsuchiya/elisp/dabbrev-highlight.el
(require 'dabbrev-highlight)

; dabbrev-highlight の漢字・平仮名を含む単語対応。
; c.f. http://www.namazu.org/~tsuchiya/elisp/dabbrev-ja.el
(load "dabbrev-ja")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; == ウィンドウサイズなど、テキストの編集に関連しない設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Emacs の起動後にフレームサイズ(縦の長さ)を最大にする。他の環境では48
; じゃないかも。
; c.f. Emacs 辞典
(add-hook 'window-setup-hook
	  (lambda () (set-frame-height (selected-frame) 48)) t)

; フレームの位置を左上の端にする。フックでやらなくても左上に移動する事
; ができるが、フレームの高さを変更した時にミニバッファが大きくなってし
; まうのを ad-hoc に対応している。
; c.f. Emacs 辞典
(add-hook 'window-setup-hook
  (lambda ()
    (set-frame-position (selected-frame) 1 1)
    (set-frame-position (selected-frame) 0 0)) t)

; 起動時のメッセージを表示しない。
(setq inhibit-startup-message t)

; ツールバーを表示しない。
(tool-bar-mode nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; == その他の設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; モードライン(ウィンドウの下の反転表示されている，黒い帯状の部分)に行頭
; からの文字数を追加
; c.f. http://homepage.mac.com/zenitani/elisp-j.html
(column-number-mode t)

; 対応する括弧を光らせる。
(show-paren-mode 1)

; 単語に強調を付ける。
(global-font-lock-mode t)

; マークした領域を強調表示する
; c.f. http://www.ayu.ics.keio.ac.jp/~mukai/tips/dot-emacs.html
(setq transient-mark-mode t)

; fringe(左側折り返し部分)でファイル末尾を表示する。
(setq-default indicate-empty-lines t)

; switch-to-buffer で存在しないバッファを指定した時に新しいバッファを作
; 成しない。
(defadvice switch-to-buffer (before existing-buffer activate compile)
  "When interactive, switch to existing buffers only,
   unless given a prefix argument."
  (interactive
   (list (read-buffer "Switch to buffer: "
                      (other-buffer)
                      (null current-prefix-arg)))))

; 同一ファイル名のバッファ名をユニークにする。
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]*")

; shebang の書かれているファイルの保存時に自動的に chmod +x する。
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

; diff の確認を行う時のオプションに -u を設定。
(setq diff-switches "-u")
