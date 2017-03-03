;; 左端(文字の前)ではインデント、それ以外はタブの挿入
(setq tab-always-indent nil)
(setq c-tab-always-indent nil)

;; C Coding style
(defun my-c-mode-init ()
  (hs-minor-mode 1)
  (setq c-auto-newline t)
  (c-set-style "bsd")
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
  (setq web-mode-markup-indent-offset 4)
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
