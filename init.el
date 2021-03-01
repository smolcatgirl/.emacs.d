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
    (web-mode php-mode elixir-mode treemacs-projectile treemacs use-package slime projectile haskell-mode dired-sidebar alchemist))))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package php-mode
  :ensure t)

(use-package web-mode
  :ensure t)

(use-package elixir-mode
  :ensure t
  :bind (("<f7>" . elixir-format))
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
  :disabled t
  :bind ("C-p" . projectile-mode-map)
  :init (projectile-global-mode))

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
