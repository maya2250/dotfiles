;; C Coding style
(defun my-c-mode-init ()
  (hs-minor-mode 1)
  (setq c-tab-always-indent t)
  (setq c-auto-newline t)
)

(add-hook 'c-mode-hook 'my-c-mode-init)


;
; Scheme coding style
(add-hook 'scheme-mode-hook
          '(lambda ()
      (hs-minor-mode 1)))

;
; Elisp coding style
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
      (hs-minor-mode 1)))

;
; Lisp coding style
(add-hook 'lisp-mode-hook
          '(lambda ()
      (hs-minor-mode 1)))

;
; Python coding style
(add-hook 'python-mode-hook
          '(lambda ()
      (hs-minor-mode 1)))
