(add-hook 'emacs-lisp-mode-hook
  (lambda ()
    ;; Use spaces, not tabs.
    (setq indent-tabs-mode nil)))


;; layout
(setq fit-window-to-buffer-horizontally t)
(setq window-resize-pixelwise t)

; deb key bindings
(global-set-key (kbd "C-c b") (lambda () (interactive) (switch-to-project-buffer)))
(global-set-key (kbd "C-c t") (lambda () (interactive) (shell)) )
(global-set-key (kbd "C-c M-r") (lambda () (interactive) (load "~/.emacs.d/init.el") ) )
(global-set-key (kbd "C-c r") (lambda () (interactive) (revert-buffer) ) )

; c x o works in term
;(add-hook 'term-mode-hook
;   (lambda ()
;     ;; C-x is the prefix command, rather than C-c
;     (term-set-escape-char ?\C-x)
;     (define-key term-raw-map "\M-y" 'yank-pop)
;     (define-key term-raw-map "\M-w" 'kill-ring-save)))

(setq gc-cons-threshold 100000000)

(setq menu-bar-select-buffer-function 'switch-to-buffer)

; hide mouse when writing
(setq qmouse-avoidance-mode 'banish)

; remove ugly bars
(menu-bar-mode -1)

(if window-system
    (tool-bar-mode -1)
  )

; Disable startup noise
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

; deb doesnt care for the welcome screen
(setq inhibit-startup-screen t)

; (speedbar 1)

(setq
   split-width-threshold 0
   split-height-threshold nil)

; y/n is better than yes/no
(fset 'yes-or-no-p 'y-or-n-p)

; Spaces not tabs
(setq-default indent-tabs-mode nil)

; Removes whitespace at end of lines
(setq-default truncate-lines t)

; Disable the bell sound on errors
(setq ring-bell-function #'ignore)

;; set likable colors
;(set-foreground-color "white")

(set-face-foreground 'mode-line "#ffaaff")
(set-face-background 'mode-line "#3b3b3e")
(set-face-foreground 'mode-line-inactive "#ffbbff")
(set-face-background 'mode-line-inactive "#3b3b3e")

(provide 'debmacs)
