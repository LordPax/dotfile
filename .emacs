(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(tab-line-mode 1)
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-safe-themes
   '("a7b1c34e6db1cc11a90ba0b9785a78c3c16e31c77213c4ec0329d241b1adda31" default))
 '(package-selected-packages '(vscode-dark-plus-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(load-theme 'vscode-dark-plus t)
