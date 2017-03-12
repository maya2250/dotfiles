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

;; ;; M-xをheml-M-xに割当
;; (global-set-key (kbd "M-x") 'helm-M-x)

;; ;; バッファ・最近開いたファイルから探す
;; (global-set-key (kbd "C-x b") 'helm-mini)

;; ;; ファイルを探す
;; (global-set-key (kbd "C-x C-f") 'helm-find-files)

;; ;; kill ring
;; (global-set-key (kbd "M-y") 'helm-show-kill-ring)


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
(setq sml/theme 'dark)
(setq sml/no-confirm-load-theme t)
(sml/setup)

;; ------------------------------------------------------------------------
;; @  web-mode
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\.twig\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; ------------------------------------------------------------------------
;; @  hiwin

;; hiwin-modeを有効化
(hiwin-activate)

;; 非アクティブウィンドウの背景色を設定
(set-face-background 'hiwin-face "gray32")

;; ------------------------------------------------------------------------
;; @  rainbow mode
(add-hook 'emacs-lisp-mode-hook 'rainbow-mode)
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'less-mode-hook 'rainbow-mode)
(add-hook 'web-mode-hook 'rainbow-mode)
(add-hook 'html-mode-hook 'rainbow-mode)


;; ------------------------------------------------------------------------
;; @  hl-line
(global-hl-line-mode t)
(custom-set-faces
'(hl-line ((t (:background "gray10"))))
)

;; ------------------------------------------------------------------------
;; @  scss mode
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

