;; ------------------------------------------------------------------------
;; @ Auto Complete
;; auto-complete-config の設定ファイルを読み込む。
;; (require 'auto-complete-config)

(ac-config-default)

;; ;; auto-complete-mode を起動時に有効にする
;; (global-auto-complete-mode t)

;; ;; TABキーで自動補完を有効にする
(ac-set-trigger-key "TAB")

;; ------------------------------------------------------------------------
;; @ undo-tree
;; undo-tree を読み込む
;; (require 'undo-tree)
;; undo-tree を起動時に有効にする
(global-undo-tree-mode t)

;; ------------------------------------------------------------------------
;; @  color-theme.el

;; Emacsのカラーテーマ
;; http://code.google.com/p/gnuemacscolorthemetest/
;; (color-theme-initialize)

;; ------------------------------------------------------------------------
;; @  neotree
;; (require 'neotree)
(global-set-key (kbd "C-~") 'neotree-toggle)


;; ------------------------------------------------------------------------
;; @  multiple-cursor
(global-set-key (kbd "C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-.") 'mc/mark-next-like-this-word)
(global-set-key (kbd "C-,") 'mc/mark-previous-like-this-word)
(global-set-key (kbd "C-<") 'mc/unmark-next-like-this)
(global-set-key (kbd "C->") 'mc/unmark-previous-like-this)

;; ------------------------------------------------------------------------
;; @  clang-format
(global-set-key [C-M-tab] 'clang-format-region)

;; ------------------------------------------------------------------------
;; @  helm
;; (require 'helm-config)
;; (helm-mode 1)

;; ------------------------------------------------------------------------
;; @  ido
(ido-mode 1)
(ido-everywhere 1)

(setq ido-enable-flex-matching t) ;; 中間/あいまい一致


;; ------------------------------------------------------------------------
;; @  indent-guide
(indent-guide-global-mode)
;; (setq indent-guide-char ":")

;; ------------------------------------------------------------------------
;; @  smart-mode-line
(sml/setup)
(setq sml/theme 'powerline)

;; ------------------------------------------------------------------------
;; @ emmet-mode (for HTML)

;; (require 'emmet-mode)
;; (add-hook 'sgml-mode-hook 'emmet-mode) ;; マークアップ言語全部で使う
;; (add-hook 'css-mode-hook  'emmet-mode) ;; CSSにも使う
;; (add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2))) ;; indent はスペース2個
;; (eval-after-load "emmet-mode"
;;   '(define-key emmet-mode-keymap (kbd "C-j") nil)) ;; C-j は newline のままにしておく
;; (keyboard-translate ?\C-i ?\H-i) ;;C-i と Tabの被りを回避
;; (define-key emmet-mode-keymap (kbd "H-i") 'emmet-expand-line) ;; C-i で展開

