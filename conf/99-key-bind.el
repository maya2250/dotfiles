;; ------------------------------------------------------------------------
;; @ key bind
;; 直前の１文字を削除
;;(global-set-key (kbd "<C-h>")'delete-backward-char)
(keyboard-translate ?\C-h ?\C-?)

;; スクロールアップ
;; (global-set-key (kbd "<C-v>")'scroll-up-command)

;; メタキー（ESC）とoptionキーの入れ替え
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;; eval-buffer
;;(global-set-key (kbd "<C-M-e>")'eval-buffer)
