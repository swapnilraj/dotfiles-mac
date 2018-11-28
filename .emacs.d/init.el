(package-initialize)
(require 'package)
(setq-default package-enable-at-startup nil)
(add-to-list 'package-archives
         '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(setq inhibit-startup-screen t)
(menu-bar-mode 0)
(tool-bar-mode 0)

(set-default-font "Operator Mono-18")
(load-theme 'dracula t)

(require 'evil)
(evil-mode 1)

(ivy-mode 1)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (ivy ## magit evil dracula-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
