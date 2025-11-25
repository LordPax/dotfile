(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(use-package copilot
  :vc (:url "https://github.com/copilot-emacs/copilot.el"
	    :rev :newest
	    :branch "main"))

(unless (package-installed-p 'evil) (package-install 'evil)) 
(unless (package-installed-p 'go-mode) (package-install 'go-mode))
(unless (package-installed-p 'magit) (package-install 'magit))
(unless (package-installed-p 'markdown-mode) (package-install 'markdown-mode))

(load-theme 'modus-vivendi t)
(evil-mode 1)
(line-number-mode t)
(column-number-mode t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'copilot-mode)

(setq copilot-log-output nil)
(setq make-backup-files nil) ; stop creating ~ files
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(setq display-line-numbers-type 'relative)

(define-key evil-motion-state-map (kbd "j") 'evil-backward-char)
(define-key evil-motion-state-map (kbd "k") 'evil-next-line)
(define-key evil-motion-state-map (kbd "l") 'evil-previous-line)
(define-key evil-motion-state-map (kbd "m") 'evil-forward-char)
(define-key evil-normal-state-map (kbd "m") 'nil)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

(define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)
(define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
(define-key copilot-completion-map (kbd "C-TAB") 'copilot-accept-completion-by-word)
(define-key copilot-completion-map (kbd "C-<tab>") 'copilot-accept-completion-by-word)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(copilot evil go-mode magit markdown-mode))
 '(package-vc-selected-packages
   '((copilot :url "https://github.com/copilot-emacs/copilot.el" :branch
			  "main"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
