; To install the latest org mode
;git clone git://orgmode.org/org-mode.git (in emacs.d folder)
;make autoloads
; Refer http://orgmode.org/manual/Installation.html
(require 'cl)
(setq load-path (remove-if (lambda (x) (string-match-p "org$" x)) load-path))
(add-to-list 'load-path "~/.emacs.d/org-mode/lisp")
;; @@@@@@@@@@@@@@@@@@@@@@@@@@@@
;;    Installing use-package

;; Basic UI changes
(setq inhibit-splash-screen t
            inhibit-startup-echo-area-message t
	    inhibit-startup-message t)

;; For proper display of unicode in term mode
(set-terminal-coding-system 'utf-8-unix)

(setq frame-title-format "emacs")
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-hl-line-mode)

;;Org
;; PDFs visited in Org-mode are opened in Evince (and not in the default choice) https://stackoverflow.com/a/8836108/789593
(add-hook 'org-mode-hook
      '(lambda ()
         (delete '("\\.pdf\\'" . default) org-file-apps)
         (add-to-list 'org-file-apps '("\\.pdf\\'" . "xreader %s"))))

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
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

(use-package org-bullets
  :ensure t
  :commands (org-bullets-mode)
  :init (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; Clone latest org-reveal in emacs.d
(add-to-list 'load-path "~/.emacs.d/org-reveal")
(require 'ox-reveal)

(setq userPath (file-truename "~/.emacs.d/reveal.js"))
(concat "file://" userPath)

(setq org-reveal-root (concat "file://" userPath))
(setq org-reveal-mathjax t)

(use-package htmlize
  :ensure t)

(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x f" . helm-recentf)
         ("C-SPC" . helm-dabbrev)
         ("M-y" . helm-show-kill-ring)
         ;("C-x b" . helm-buffers-list))
         ("C-x b" . helm-mini))
  :bind (:map helm-map
	      ("M-i" . helm-previous-line)
	      ("M-k" . helm-next-line)
	      ("M-I" . helm-previous-page)
	      ("M-K" . helm-next-page)
	      ("M-h" . helm-beginning-of-buffer)
	      ("M-H" . helm-end-of-buffer))
  :config (progn
	    (helm-mode 1)))

