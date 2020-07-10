;;; package --- Summary: init file
;;; Commentary:
;;; Code:

;; set packages
(require 'package)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-archives
   (quote
    (("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (elixir-mode treemacs-projectile treemacs use-package slime projectile haskell-mode dired-sidebar alchemist))))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(defun use-project-mix-formatter ()
  (if (and (package-installed-p 'projectile) (projectile-project-p))
      (setq elixir-format-arguments
            (list "--dot-formatter"
                  (concat (locate-dominating-file buffer-file-name ".formatter.exs") ".formatter.exs")))
    (setq elixir-format-arguments nil)))

(use-package elixir-mode
  :ensure t
  :bind (("<f7>" . elixir-format))
  ;:hook ((elixir-format . use-project-mix-formatter)
  ;       (before-save . elixir-format))
  :mode
  (("\\.exs$" . elixir-mode)
   ("\\.ex$" . elixir-mode)))

(use-package alchemist
  :ensure t )

(use-package haskell-mode
  :ensure t )

(use-package slime
  :ensure t
  :init
  (setq inferior-lisp-program "sbcl"))

(use-package company
  :ensure t
  :hook (after-init . global-company-mode))

;(use-package dired-sidebar
;  :ensure t
;  :commands (dired-sidebar-toggle-sidebar)
;  :bind ("<f3>" . dired-sidebar-toggle-sidebar))

(use-package treemacs
  :ensure t
  :init
  (setq treemacs-no-png-images t)
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package projectile
  :ensure t
  :init
  (setq projectile-project-search-path "~/code")
  :bind (("C-c p" . projectile-command-map)))

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)


(use-package debmacs
  :load-path "~/.emacs.d/plugins/")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
