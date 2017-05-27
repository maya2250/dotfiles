;; ------------------------------------------------------------------------
;; @ lang config
;; ------------------------------------------------------------------------

;; C Coding style
(defun my-c-mode-init ()
  (hs-minor-mode 1)
  (setq c-auto-newline t)
  (setq c-basic-offset 2)
  )
(add-hook 'c-mode-hook 'my-c-mode-init)

;; Shell Script style
(defun my-sh-mode-init ()
  (hs-minor-mode 1)
  (setq c-tab-always-indent t)
  (setq c-auto-newline t)
  )
(add-hook 'sh-mode-hook 'my-sh-mode-init)

;; web style
(defun my-web-mode-init ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  )
(add-hook 'web-mode-hook 'my-web-mode-init)

					; Scheme coding style
(defun my-scheme-mode-init ()
  (hs-minor-mode 1)
  )
(add-hook 'scheme-mode-hook 'my-scheme-mode-init)

					; Elisp coding style
(defun my-emacs-lisp-mode-init ()
  (hs-minor-mode 1)
  )
(add-hook 'emacs-lisp-mode-hook 'my-emacs-lisp-mode-init)

					; Lisp coding style
(defun my-lisp-mode-init ()
  (hs-minor-mode 1)
  )
(add-hook 'lisp-mode-hook 'my-lisp-mode-init)

					; Python coding style
(defun my-python-mode-init ()
  (hs-minor-mode 1)
  )
(add-hook 'python-mode-hook 'my-python-mode-init)

					; less style
(defun my-less-mode-init ()
  (setq-default indent-tabs-mode nil)
  (setq css-indent-offset 4)
  )
(add-hook 'less-css-mode-hook 'my-less-mode-init)

					; scss style
(defun my-scss-mode-init ()
  (setq-default indent-tabs-mode t)
  (setq css-indent-offset 2)
  )
(add-hook 'scss-mode-hook 'my-scss-mode-init)

