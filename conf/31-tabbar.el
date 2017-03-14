;; ------------------------------------------------------------------------
;; @ tabbar
;; ------------------------------------------------------------------------
(tabbar-mode 1)

(tabbar-mwheel-mode nil)                  ;; マウスホイール無効
(setq tabbar-buffer-groups-function nil)  ;; グループ無効
(setq tabbar-use-images nil)              ;; 画像を使わない

;; 表示するバッファ
(defun my-tabbar-buffer-list ()
  (delq nil
        (mapcar #'(lambda (b)
                    (cond
                     ;; Always include the current buffer.
                     ((eq (current-buffer) b) b)
                     ((buffer-file-name b) b)
                     ((char-equal ?\  (aref (buffer-name b) 0)) nil)
                     ((char-equal ?* (aref (buffer-name b) 0)) nil) ; それ以外の * で始まるバッファは表示しない
                     ((buffer-live-p b) b)))
                (buffer-list))))
(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)

;; タブの長さ
(setq tabbar-separator '(0.2))

;; 左側のボタンを消す
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))

;; タブの幅調整(tabbar.elからコピー)
(defun tabbar-buffer-tab-label (tab)
  "Return a label for TAB.
That is, a string used to represent it on the tab bar."
  (let ((label  (if tabbar--buffer-show-groups
		    ;; ↓の""内でformat指定してるっぽい
                    (format "   [%s]   " (tabbar-tab-tabset tab))
                  (format "   %s   " (tabbar-tab-value tab)))))
    ;; Unless the tab bar auto scrolls to keep the selected tab
    ;; visible, shorten the tab label to keep as many tabs as possible
    ;; in the visible area of the tab bar.
    (if tabbar-auto-scroll-flag
        label
      (tabbar-shorten
       label (max 1 (/ (window-width)
                       (length (tabbar-view
                                (tabbar-current-tabset)))))))))

;; ------------------------------------------------------------------------
;; @ appearance
;; ------------------------------------------------------------------------

;; background color
(setq v-unmodifiedund-color "#34495E")
(setq v-modified-background-color "#565673")

;; font color
(setq v-unselected-font-color "Gray65")
(setq v-selected-font-color "Orange")

;; default setting
(set-face-attribute
 'tabbar-default nil
 :family "Hiragino Kaku Gothic ProN"  ;; font
 :background "#34495E"                ;; background color
 :height 1.2                          ;; font size
 :box nil                             ;; box border width
 )

;; 未選択 & 未修正
(set-face-attribute
 'tabbar-unselected nil
 :background v-unmodifiedund-color
 :foreground v-unselected-font-color
 :box nil
 )

;; 修正 & 未選択
(set-face-attribute
 'tabbar-modified nil
 :background v-modified-background-color
 :foreground v-unselected-font-color
 :box nil
 )

;; 未修正 & 選択
(set-face-attribute
 'tabbar-selected nil
 :background v-unmodifiedund-color
 :foreground v-selected-font-color
 :box nil
)

;; 修正 & 選択
(set-face-attribute
 'tabbar-selected-modified nil
 :background v-modified-background-color
 :foreground v-selected-font-color
 :box nil
)

(set-face-attribute
 'tabbar-button nil
 :box nil
)

;; C-tab, C-Shift-tabでタブの切替
(global-set-key (kbd "<C-tab>") 'tabbar-forward-tab)
(global-set-key (kbd "<C-S-tab>") 'tabbar-backward-tab)

