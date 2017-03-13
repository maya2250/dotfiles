(require 'emmet-mode)
(define-key emmet-mode-keymap (kbd "C-c C-j") 'emmet-expand-line)
(define-key emmet-mode-keymap (kbd "C-j") nil)

;; Auto-start on any markup modes
(add-hook 'sgml-mode-hook 'emmet-mode)

;; enable Emmet's css abbreviation.
(add-hook 'css-mode-hook 'emmet-mode)

;; enable in web-mode
(add-hook 'web-mode-hook 'emmet-mode)


;; (setq emmet-move-cursor-between-quotes t) ;; default nil

;; (define-key emmet-mode-keymap (kbd "C-i") 'emmet-expand-line) ;; C-i で展開

