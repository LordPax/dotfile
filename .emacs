(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
; (package-refresh-contents)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(yaml-mode nordic-night-theme editorconfig use-package markdown-mode linum-relative magit vscode-dark-plus-theme powerline-evil fzf airline-themes))
 '(send-mail-function 'mailclient-send-it))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; (setq inhibit-startup-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(linum-relative-global-mode)
(setq make-backup-files nil) ; stop creating ~ files
(setq linum-relative-current-symbol "")

(require 'evil)
(evil-mode 1)

(define-key evil-motion-state-map (kbd "j") 'evil-backward-char)
(define-key evil-motion-state-map (kbd "k") 'evil-next-line)
(define-key evil-motion-state-map (kbd "l") 'evil-previous-line)
(define-key evil-motion-state-map (kbd "m") 'evil-forward-char)
(define-key evil-normal-state-map (kbd "m") 'nil)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

; (require 'powerline)
; (powerline-default-theme)

; (use-package vscode-dark-plus-theme
;   :ensure t                        
;   :config                          
;   (load-theme 'vscode-dark-plus t))

(use-package nordic-night-theme
  :ensure t
  :config
  (load-theme 'nordic-night t))

; (use-package copilot
;   :quelpa (copilot :fetcher github
;                    :repo "zerolfx/copilot.el"
;                    :branch "main"
;                    :files ("dist" "*.el")))

;(use-package copilot
;  :straight (:host github :repo "zerolfx/copilot.el" :files ("dist" "*.el"))
;  :ensure t)
;; you can utilize :map :hook and :config to customize copilot
