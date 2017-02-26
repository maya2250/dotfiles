;; 左端(文字の前)ではインデント、それ以外はタブの挿入
(setq tab-always-indent nil)
(setq c-tab-always-indent nil)

;; C Coding style
(defun my-c-mode-init ()
  (hs-minor-mode 1)
  (setq c-auto-newline t)
  (c-set-style "bsd")
)

(defun my-sh-mode-init ()
  (hs-minor-mode 1)
  (setq c-tab-always-indent t)
  (setq c-auto-newline t)
)


; Scheme coding style
(defun my-scheme-mode-init ()
  (hs-minor-mode 1)
)

; Elisp coding style
(defun my-emacs-lisp-mode-init ()
  (hs-minor-mode 1)
)

; Lisp coding style
(defun my-lisp-mode-init ()
  (hs-minor-mode 1)
)

; Python coding style
(defun my-python-mode-init ()
  (hs-minor-mode 1)
)


;; (add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-hook 'my-c-mode-init)
(add-hook 'sh-mode-hook 'my-sh-mode-init)
(add-hook 'scheme-mode-hook 'my-scheme-mode-init)
(add-hook 'emacs-lisp-mode-hook 'my-emacs-lisp-mode-init)
(add-hook 'lisp-mode-hook 'my-lisp-mode-init)
(add-hook 'python-mode-hook 'my-python-mode-init)
