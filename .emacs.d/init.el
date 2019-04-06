(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; https://www.reddit.com/r/emacs/comments/53zpv9/how_do_i_get_emacs_to_stop_adding_custom_fields/
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(package-initialize)

;; install package-selected-packages defined in custom.el
(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)

(load-theme 'tango-dark' t)  ;; theme

(setq inhibit-startup-screen t)  ;; disable startup screen
(setq initial-scratch-message "")  ;; set empty message to scratch
(tool-bar-mode -1)  ;; disable Toolbar
(menu-bar-mode -1)  ;; disable Menubar
(set-scroll-bar-mode nil)  ;; disable the display of scroll bars
(setq frame-title-format (format "%%f" (system-name)))  ;; show current buffer file path
(global-display-line-numbers-mode)  ;; display line number

(global-hl-line-mode t)  ;; highlight current line
(custom-set-faces
 '(hl-line ((t (:background "black")))))

(show-paren-mode t)  ;; show the matching parenthesis
(setq show-paren-style 'expression)
(setq show-paren-delay 0)
(set-face-attribute 'show-paren-match nil
		    :background nil :underline "gray50")

(electric-pair-mode 1)  ;; complete parentesis

;; set cursor style and color
(add-to-list 'default-frame-alist '(cursor-type . bar))
(add-to-list 'default-frame-alist '(cursor-color . "#ff9200"))

;; font
(when (member "Ricty" (font-family-list))
  (add-to-list 'default-frame-alist '(font . "Ricty 11")))

(setq-default line-spacing 3)

;; show useless whitespace at the end of a line
(defun my/show-trailing-whitespace-hook ()
  (setq show-trailing-whitespace t))
(add-hook 'prog-mode-hook 'my/show-trailing-whitespace-hook)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq make-backup-files nil)  ;; disable to create backup~ files
(setq auto-save-default nil)  ;; disable to create #autosave# files
(setq create-lockfiles nil)  ;; disable to create .#lock files

(global-auto-revert-mode 1)
(set-frame-parameter nil 'fullscreen 'maximized)
(setq ring-bell-function 'ignore)

(setq-default indent-tabs-mode nil)

;; keymap
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-?") 'help)

;; ref: https://www.emacswiki.org/emacs/WindMove
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;; packages
(eval-when-compile
  (require 'use-package))

(use-package yasnippet
  :init (yas-global-mode t))

(use-package hiwin
  :init
  (hiwin-activate)
  (set-face-background 'hiwin-face "gray32"))

(use-package company
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(use-package ido
  :init
  (ido-mode t)
  (ido-everywhere t)
  (ido-vertical-mode t)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only)
  (set-face-attribute 'ido-vertical-first-match-face nil
                      :foreground "orange")
  (set-face-attribute 'ido-subdir nil
                      :foreground "deep sky blue"))

(use-package smex
  :bind
  ("M-x" . smex)
  ("M-X" . smex-major-mode-commands)
  ("C-c C-c M-x" . execute-extended-command)
  :init
  (smex-initialize)
  (defun smex-prepare-ido-bindings ()
    (define-key ido-completion-map (kbd "C-h") 'delete-backward-char)))

(use-package flycheck
  :bind
  ("C-c n" . flycheck-next-error)
  ("C-c p" . flycheck-previous-error)
  :init
  (global-flycheck-mode)
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

(use-package mozc
  :init
  (setq default-input-method "japanese-mozc"))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))
