;; ------------------------------------------------------------------------
;; @ key bind
;; ------------------------------------------------------------------------

;; C-hで１文字deleteする
(global-set-key (kbd "C-h") 'delete-backward-char)

;; C-?をhelpに割り当てたい
(global-set-key (kbd "C-?") 'help)

;; メタキー（ESC）とoptionキーの入れ替え
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;; eval-buffer
(global-set-key (kbd "C-s-x") 'eval-buffer)

;; describe-key
(global-set-key (kbd "C-c C-d C-k") 'describe-key)

;; describe-bindings
(global-set-key (kbd "C-c C-d C-b") 'describe-bindings)

;; describe-variable
(global-set-key (kbd "C-c C-d C-v") 'describe-variable)

;; describe-mode
(global-set-key (kbd "C-c C-d C-m") 'describe-mode)
