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

;; web-mode codign style
(defun my-web-mode-init ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  )
(add-hook 'web-mode-hook 'my-web-mode-init)

;; javascript coding style
(defun my-js-mode-init ()
  (setq js-indent-level 2)
  )
(add-hook 'js-mode-hook 'my-js-mode-init)

;; Elisp coding style
(defun my-emacs-lisp-mode-init ()
  (hs-minor-mode 1)
  )
(add-hook 'emacs-lisp-mode-hook 'my-emacs-lisp-mode-init)

;; Lisp coding style
(defun my-lisp-mode-init ()
  (hs-minor-mode 1)
  )
(add-hook 'lisp-mode-hook 'my-lisp-mode-init)

;; Python coding style
(defun my-python-mode-init ()
  (hs-minor-mode 1)
  )
(add-hook 'python-mode-hook 'my-python-mode-init)

;; scss style
(defun my-scss-mode-init ()
  (setq css-indent-offset 2)
  )
(add-hook 'scss-mode-hook 'my-scss-mode-init)

(setq ruby-insert-encoding-magic-comment nil)
