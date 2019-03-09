(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(load-theme 'misterioso' t)  ;; theme

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

(setq-default show-trailing-whitespace t)  ;; show useless whitespace at the end of a line
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
