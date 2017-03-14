;; ------------------------------------------------------------------------
;; @ variable
;; ------------------------------------------------------------------------
;; 色・数値を格納する変数定義
;; 変数の先頭にv-(variable)をつける


;; 行番号の色
(setq v-line-number-color "#0669a3")

;; 行番号の高さ
(setq v-line-number-height 0.9)

;; 括弧選択色
(setq v-parenthesis-color "#4F4FD9")

;; 範囲選択色
(setq v-range-selection-color "#304E5C")

;; 行末空白色
(setq v-line-end-space-color "#5A0A00")

;; cursor color
(setq v-cursor-color "#ff9200")

;; show parenthesis color
(setq v-show-paren-color "#ff9200")

;; line space
(setq v-line-space 0.01)


;; ------------------------------------------------------------------------
;; @ common lisp
;; ------------------------------------------------------------------------
;; (require 'cl)

;; ------------------------------------------------------------------------
;; @ theme
;; ------------------------------------------------------------------------
(load-theme 'misterioso' t)

;; フレームの透明度
(set-frame-parameter (selected-frame) 'alpha '(1.0))

;; ------------------------------------------------------------------------
;; @ appearance
;; ------------------------------------------------------------------------

;; スタートアップ非表示
(setq inhibit-startup-screen t)

;; scratchの初期メッセージ消去
(setq initial-scratch-message "")

;; ツールバー非表示
(tool-bar-mode -1)

;; メニューバーを非表示
(menu-bar-mode -1)

;; スクロールバー非表示
(set-scroll-bar-mode nil)

;; タイトルバーにファイルのフルパス表示
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))

;; 行番号表示
(global-linum-mode t)

;; 行番号色・高さ
(set-face-attribute 'linum nil
                    :foreground v-line-number-color
                    :height v-line-number-height)

;; 行番号フォーマットset
(setq linum-format "%4d")

;; 括弧を強調表示
(show-paren-mode t)

;; 括弧のみを強調
(setq show-paren-style 'parenthesis)

;; 括弧強調するまでの遅延(0:遅延なし)
(setq show-paren-delay 0)
(set-face-attribute 'show-paren-match-face nil
                    :background nil :foreground nil
                    :underline v-show-paren-color :weight 'extra-bold)

;; 括弧の補完
(electric-pair-mode 1)

;; 選択領域の色
(set-face-background 'region v-range-selection-color)

;; カーソル形状
(setq-default cursor-type 'bar)

;; カーソル色
(set-cursor-color v-cursor-color)

;; 行末の空白を強調表示
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace v-line-end-space-color)

;; yes or noをy or n
(fset 'yes-or-no-p 'y-or-n-p)

;; バックアップファイルを作らない
(setq make-backup-files nil)

;; 終了時にオートセーブファイルを消す
(setq auto-save-default nil)

;; ロックファイルを生成しない
 (setq create-lockfiles nil)

;; 行間
(setq-default line-spacing v-line-space)

;; full screen
;; (set-frame-parameter nil 'fullscreen 'fullboth)

;; maximize screen
(set-frame-parameter nil 'fullscreen 'maximized)

;; ¥の代わりにバックスラッシュを入力する
(define-key global-map [?¥] [?\\])

;; 警告音・フラッシュを無効
(setq ring-bell-function 'ignore)

;; collapse
;; (define-key global-map (kbd "C-#") 'hs-toggle-hiding)
;; (global-set-key (kbd "C-(") 'hs-hide-block)
;; (global-set-key (kbd "C-)") 'hs-show-block)
;; (global-set-key (kbd "C-M-(") 'hs-hide-all)
;; (global-set-key (kbd "C-M-)") 'hs-show-all)

;; auto reload buffer
(global-auto-revert-mode 1)
