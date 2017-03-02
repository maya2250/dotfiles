;; ------------------------------------------------------------------------
;; @ general

;; common lisp
(require 'cl)

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
(set-face-attribute 'linum nil
                    :foreground v-line-number-color
                    :height 0.9)

;; 行番号フォーマット
(setq linum-format "%3d")

;; 括弧の範囲内を強調表示
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)

;; 括弧の範囲色
(set-face-background 'show-paren-match-face v-parenthesis-color)

;; 選択領域の色
(set-face-background 'region v-range-selection-color)

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

;; 最近使ったファイルをメニューに表示
;; (recentf-mode t)

;; 最近使ったファイルの表示数
;; (setq recentf-max-menu-items 10)

;; 最近開いたファイルの保存数を増やす
;; (setq recentf-max-saved-items 3000)

;; 行間
(setq-default line-spacing 0.01)

;; スクリーンの最大化
(set-frame-parameter nil 'fullscreen 'maximized)

;; 括弧の補完
(electric-pair-mode 1)

;; ¥の代わりにバックスラッシュを入力する
(define-key global-map [?¥] [?\\])

;; tab
(setq-default tab-width 4 indent-tabs-mode nil)

;; 警告音もフラッシュも全て無効
(setq ring-bell-function 'ignore)

;; collapse
(define-key global-map (kbd "C-#") 'hs-toggle-hiding)
(global-set-key (kbd "C-(") 'hs-hide-block)
(global-set-key (kbd "C-)") 'hs-show-block)
(global-set-key (kbd "C-M-(") 'hs-hide-all)
(global-set-key (kbd "C-M-)") 'hs-show-all)
