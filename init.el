; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;; ------------------------------------------------------------------------
;; @ pakage.el
;; ------------------------------------------------------------------------
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; ------------------------------------------------------------------------
;; @ init-loader.el
;; ------------------------------------------------------------------------
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/conf")

;; ------------------------------------------------------------------------
;; @ custom.el(original)
;; ------------------------------------------------------------------------
;; avoid to write 'package-selected-packages'
(load (setq custom-file (expand-file-name "custom.el" user-emacs-directory)))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
