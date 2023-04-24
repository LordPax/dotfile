(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(tab-line-mode 1)
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode)) 
(package-initialize)
; (package-refresh-contents)

; Download Evil
; (unless (package-installed-p 'evil)
;   (package-install 'evil))

; Enable Evil
; (require 'evil)
; (evil-mode 1)

(require 'powerline)
(powerline-default-theme)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(powerline-evil vscode-dark-plus-theme fzf evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; (use-package vscode-dark-plus-theme
;              :ensure t
;              :config
;              (load-theme 'vscode-dark-plus t))

; (use-package fzf
;              :bind     ;; Don't forget to set keybinds!
;              :config   (setq fzf/args "-x --color bw --print-query --margin=1,0 --no-hscroll"
;                              fzf/executable "fzf"
;                              fzf/git-grep-args "-i --line-number %s"
;                              ;; command used for `fzf-grep-*` functions
;                              ;; example usage for ripgrep:
;                              ;; fzf/grep-command "rg --no-heading -nH"
;                              fzf/grep-command "grep -nrH"
;                              ;; If nil, the fzf buffer will appear at the top of the window
;                              fzf/position-bottom t
;                              fzf/window-height 15))
