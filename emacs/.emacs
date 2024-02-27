(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("cd4d1a0656fee24dc062b997f54d6f9b7da8f6dc8053ac858f15820f9a04a679" default))
 '(package-selected-packages '(neotree evil gruvbox-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
;(package-refresh-contents)

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

(unless (package-installed-p 'neotree)
  (package-install 'neotree))
;; Enable Evil
(require 'evil)
(evil-mode 1)

(require 'neotree)

(global-display-line-numbers-mode)
(setq inhibit-splash-screen t)

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(fringe-mode -1)
(tab-bar-mode)
(setq tab-bar-close-button-show nil)
(setq tab-bar-new-button-show nil)

(unless (package-installed-p 'evil)
  (package-install 'evil))

(unless (package-installed-p 'gruvbox-theme)
  (package-install 'gruvbox-theme))
(load-theme 'gruvbox t)

(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))
(+ 2 8)
(evil-set-leader 'motion (kbd "SPC"))
(evil-define-key 'motion 'global (kbd "<leader>n") 'tab-bar-new-tab)
(evil-define-key 'motion 'global (kbd "<leader>l") 'tab-bar-switch-to-next-tab)
(evil-define-key 'motion 'global (kbd "<leader>h") 'tab-bar-switch-to-prev-tab)
(evil-define-key 'motion 'global (kbd "C-k") 'evil-window-up)
(evil-define-key 'motion 'global (kbd "C-j") 'evil-window-down)
(evil-define-key 'motion 'global (kbd "C-h") 'evil-window-left)
(evil-define-key 'motion 'global (kbd "C-l") 'evil-window-right)

(evil-define-key 'motion 'global (kbd "k") 'evil-previous-visual-line)
(evil-define-key 'motion 'global (kbd "j") 'evil-next-visual-line)
(setq maximum-scroll-margin 0.35)
(setq scroll-margin 20)
(setq scroll-step 1)



(defun toggle-tree-view () (interactive)
  "Toggle a filedrawer-like window of dired"
  (evil-window-vsplit 30 "~")
  (dired-hide-details-mode 1)
)

(add-hook 'dired-mode-hook 'dired-hide-details-mode)

(evil-define-key 'motion 'global (kbd "<leader>t") 'neotree-toggle)

(evil-define-key 'motion 'global (kbd "<leader>f") 'fill-paragraph)


(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

(setq org-hide-leading-stars t)

(setq neo-smart-open t)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)

(defun neotree-enter-tab () (interactive)
  "Open a file in neotree in a new tab"
  (neo-buffer--execute nil
  (lambda (full-path arg)
    (tab-bar-new-tab)
    (find-file full-path)
  ) 
  (lambda (full-path arg)
    (tab-bar-new-tab)
    (find-file full-path)
  ))
)

(evil-define-key 'normal neotree-mode-map (kbd "t")
  'neotree-enter-tab)
(evil-define-key 'normal neotree-mode-map (kbd "o")
 'neotree-open-file-in-system-application)

(evil-define-key 'insert 'global (kbd "C-v") 'yank)

(set-face-attribute 'default nil :height 110)

(setq visible-bell t)
