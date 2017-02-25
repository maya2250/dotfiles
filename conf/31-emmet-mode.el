(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

(setq emmet-move-cursor-between-quotes t) ;; default nil

;; (define-key emmet-mode-keymap (kbd "C-i") 'emmet-expand-line) ;; C-i で展開
(global-set-key (kbd "C-i") 'emmet-expand-line) ;; C-i で展開
