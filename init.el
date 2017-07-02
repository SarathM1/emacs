;; @@@@@@@@@@@@@@@@@@@@@@@@@@@@
;;    Installing use-package
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)
;; @@@@@@@@@@@@@@@@@@@@@@@@@@@
;; Add all lines after this!!!

;; Evil-mode
;; Refer: [https://blog.aaronbieber.com/2016/01/23/living-in-evil.html]

;; Set defualt font
;;(set-frame-font "Inconsolata 17" nil t)
(set-face-attribute 'default nil
		    :family "Source Code Pro"
		    :height 160
		    :weight 'normal
		    :width 'normal)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))



(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  ;; More configuration goes here
  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode))

  ;(use-package evil-jumper
   ; :ensure t
    ;:config
    ;(global-evil-jumper-mode))

  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode))

  (use-package evil-indent-textobject
    :ensure t)
)


;

(use-package monokai-theme
:ensure t
:config
(load-theme 'monokai t))

;; Theming
;(use-package atom-one-dark-theme :ensure t :defer t)
;(use-package darkokai-theme      :ensure t :defer t)
;(use-package github-theme        :ensure t :defer t)
;(use-package paganini-theme      :ensure t :defer t)
;(use-package solarized-theme     :ensure t :defer t)
;(use-package sublime-themes      :ensure t :defer t)
;(use-package zenburn-theme :ensure t :defer t)

(global-linum-mode t)
(setq linum-format "%4d \u2502 ")

;; make both fringes 4 pixels wide
(fringe-mode 4)
