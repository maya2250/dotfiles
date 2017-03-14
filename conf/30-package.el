;; ------------------------------------------------------------------------
;; @ Auto Complete
;; ------------------------------------------------------------------------
(ac-config-default)

;; ------------------------------------------------------------------------
;; @ undo-tree
;; ------------------------------------------------------------------------
;; undo-tree を起動時に有効にする
(global-undo-tree-mode t)

;; keybind 無効したい
;; (define-key undo-tree-map (kbd "C-/") nil)
;; (define-key undo-tree-map (kbd "C-?") nil)
;; (global-unset-key (kbd "C-/"))

;; ------------------------------------------------------------------------
;; @ neotree
;; ------------------------------------------------------------------------
;; (require 'neotree)
(global-set-key (kbd "C-~") 'neotree-toggle)

;; ------------------------------------------------------------------------
;; @ multiple-cursor
;; ------------------------------------------------------------------------
(global-set-key (kbd "C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-.") 'mc/mark-next-like-this-word)
(global-set-key (kbd "C-,") 'mc/mark-previous-like-this-word)
(global-set-key (kbd "C-<") 'mc/unmark-next-like-this)
(global-set-key (kbd "C->") 'mc/unmark-previous-like-this)

;; ------------------------------------------------------------------------
;; @ clang-format
;; ------------------------------------------------------------------------
(global-set-key [C-M-tab] 'clang-format-region)

;; ------------------------------------------------------------------------
;; @ ido-vertical-mode
;; ------------------------------------------------------------------------
(ido-mode 1)
(ido-everywhere 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(setq ido-use-faces t)
(set-face-attribute 'ido-vertical-first-match-face nil
                    :background nil
                    :foreground "orange")
(set-face-attribute 'ido-vertical-only-match-face nil
                    :background nil
                    :foreground nil)
(set-face-attribute 'ido-vertical-match-face nil
                    :foreground nil)

;; ------------------------------------------------------------------------
;; @ indent-guide
;; ------------------------------------------------------------------------
;; (setq indent-guide-char ":")
(indent-guide-global-mode)
;; ------------------------------------------------------------------------
;; @ smart-mode-line
;; (setq sml/theme 'dark)
;; (setq sml/no-confirm-load-theme t)
;; (sml/setup)

;; ------------------------------------------------------------------------
;; @ web-mode
;; ------------------------------------------------------------------------
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\.twig\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; ------------------------------------------------------------------------
;; @ hiwin
;; ------------------------------------------------------------------------
;; hiwin-modeを有効化
(hiwin-activate)

;; 非アクティブウィンドウの背景色を設定
(set-face-background 'hiwin-face "gray32")

;; ------------------------------------------------------------------------
;; @ rainbow mode
;; ------------------------------------------------------------------------
(add-hook 'emacs-lisp-mode-hook 'rainbow-mode)
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'less-mode-hook 'rainbow-mode)
(add-hook 'web-mode-hook 'rainbow-mode)
(add-hook 'html-mode-hook 'rainbow-mode)


;; ------------------------------------------------------------------------
;; @ hl-line
;; ------------------------------------------------------------------------
(global-hl-line-mode t)
(custom-set-faces
'(hl-line ((t (:background "gray10"))))
)

;; ------------------------------------------------------------------------
;; @ scss mode
;; ------------------------------------------------------------------------
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

;; ------------------------------------------------------------------------
;; @ nyan mode
;; ------------------------------------------------------------------------
(nyan-mode 1)

;; ------------------------------------------------------------------------
;; @ ruby-mode-electric
;; ------------------------------------------------------------------------
;; (eval-after-load "ruby-mode"
;;   '(add-hook 'ruby-mode-hook 'ruby-electric-mode))

;; ------------------------------------------------------------------------
;; @ yasnippets
;; ------------------------------------------------------------------------
(setq yas-snippet-dirs
      '("~/.emacs.d/mysnippets"         ;; personal snippets
	"~/.emacs.d/yasnippets"         ;; official snippets
        ))
(yas-global-mode t)


;; ------------------------------------------------------------------------
;; @ emmet-mode
;; ------------------------------------------------------------------------
(require 'emmet-mode)

(define-key emmet-mode-keymap (kbd "C-c C-j") 'emmet-expand-line)
(define-key emmet-mode-keymap (kbd "C-j") nil)

;; Auto-start on any markup modes
(add-hook 'sgml-mode-hook 'emmet-mode)

;; enable Emmet's css abbreviation.
(add-hook 'css-mode-hook 'emmet-mode)

;; enable in web-mode
(add-hook 'web-mode-hook 'emmet-mode)

;; ------------------------------------------------------------------------
;; @ processing-mode
;; ------------------------------------------------------------------------

;; (setq processing-location "/usr/bin/processing-java")
(setq processing-location "/usr/local/bin/processing-java")

(setq processing-application-dir "/Applications/Processing.app")

(setq processing-sketchbook-dir "~/dev/processing/")
