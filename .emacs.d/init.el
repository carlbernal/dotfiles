;; Setup package.el
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
  '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Setup use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; UI Options
(setq ring-bell-function 'ignore)
(tool-bar-mode -1)
(blink-cursor-mode 0)
(setq show-paren-delay 0)
(show-paren-mode 1)

;; Spacing
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default standard-indent 4)
(add-hook 'python-mode-hook (lambda () (setq python-indent-offset 4)))
(add-hook 'js-mode-hook     (lambda () (setq js-indent-level 2)))
(add-hook 'emacs-lisp-mode-hook (lambda () (setq lisp-indent-offset 2)))

;; Scroll Options
(scroll-bar-mode -1)
(setq scroll-margin 4
  scroll-conservatively 101
  scroll-preserve-screen-position t
  auto-window-vscroll nil
  scroll-error-top-bottom nil)

;; Font Options
(set-face-attribute 'default nil
  :family "Menlo"
  :height 150
  :weight 'medium)
(setq-default line-spacing 3)

;; Evil Mode
(use-package evil
  :diminish undo-tree-mode
  :init
  (setq evil-want-integration t)
  :config
  (evil-mode 1))

;; Evil Plugins
(use-package evil-commentary
  :after evil
  :ensure t
  :config (evil-commentary-mode 1))
(use-package evil-surround
  :after evil
  :ensure t
  :config (global-evil-surround-mode 1))
(use-package evil-replace-with-register
  :after evil
  :ensure t
  :bind (:map evil-normal-state-map
          ("gr" . evil-replace-with-register)
          :map evil-visual-state-map
          ("gr" . evil-replace-with-register)))

;; Evil Keymaps
(define-key evil-normal-state-map (kbd "S-<return>") 'evil-scroll-line-to-top)
(global-set-key (kbd "C-l") 'evil-ex-nohighlight)

;; Parinfer
(use-package parinfer-rust-mode
  :hook ((emacs-lisp-mode scheme-mode) . parinfer-rust-mode)
  :init
  (setq parinfer-rust-auto-download t))

;; Scheme
(use-package geiser
  :ensure t)
(use-package geiser-guile
  :ensure t)
(setq geiser-active-implementations '(guile))
(setq scheme-program-name "guile")
