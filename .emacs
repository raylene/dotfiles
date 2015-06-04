;; -*- emacs-lisp -*-

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

;; COLORS!

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(setq large-file-warning-threshold 100000000)

(mouse-wheel-mode 1)
(setq make-mackup-files nil)
(setq auto-fill-mode 1)

;; Find emacs-packages
;;(add-to-list 'load-path (concat master-dir "/emacs-packages"))

;; Have highlighting all the time
(global-font-lock-mode 1)

;; Delete selection mode
(delete-selection-mode t)

;; use spaces, not tabs for indenting
(setq-default indent-tabs-mode nil)

;; automatic highlighting of opening/closing paren
(show-paren-mode t)
(setq show-paren-style 'mixed)

;; key mappings

;; Global key bindings
(global-set-key "\M-g"  'goto-line)
(global-set-key "\M-a"  'forward-paragraph)
(global-set-key "\M-z"  'backward-paragraph)
(global-set-key "\C-q"  'undo)
(global-set-key "\M-q"  'query-replace)

(global-set-key "\M-[5C" 'forward-word)
(global-set-key "\M-[5D" 'backward-word)

(global-set-key (kbd "M-SPC") 'set-mark-command)

(defun refresh-file ()
  (interactive)
  (revert-buffer t t t)
)

(global-set-key "\M-r" 'refresh-file)

;;(setq mac-command-modifier 'alt)

;; from eugenie

;; alias y to yes and n to no
(defalias 'yes-or-no-p 'y-or-n-p)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(custom-safe-themes (quote ("38c4fb6c8b2625f6307f3dde763d5c61d774d854ecee9c5eb9c5433350bc0bef" "e822f530adefa65cfcdb43a4d13ec216d3f65906a96b8d79482fa6fc1b6ffacf" "d458545cae758aa1eca413e603dc219596bdaa292919d629de723e4b6a64e68a" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
