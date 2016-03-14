;; Windows only settings
(if (string-equal system-type "windows-nt")
    (progn
      (setq default-directory (concat (getenv "HOME") "/"))
      (when (member "Monaco" (font-family-list))
        (set-face-attribute 'default nil :font "Monaco"))))
      
;; Disable Splash screen
(setq inhibit-splash-screen t)

;; Disable menu-bar, scroll-bar and tool-bar
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; Better line-wrapping
(visual-line-mode 1)

;; Use Space insted of TAB for indenting
(setq-default tab-width 4 indent-tabs-mode nil)

;; Do not Save Backup files
(setq make-backup-files nil)

;; Pressing RET should do newline-and-indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Black Theme - Wombat
(load-theme 'wombat)

;; Show matching parantheses
(show-paren-mode 1)

;; Packages Packages !!
(require 'package)
(package-initialize)
(setq package-enable-at-startup nil)
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Remember the cursor position of files when opening them
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)
(setq save-place-forget-unreadable-files nil)

;; elsp-slime-navigator
(use-package elisp-slime-nav
  :config
    (defun my-lisp-hook ()
      (elisp-slime-nav-mode)
      (turn-on-eldoc-mode))
    (add-hook 'emacs-lisp-mode-hook 'my-lisp-hook))
  
;; elpy for Python
(use-package elpy
  :config
  (elpy-enable)
  (if (string-equal system-type "windows-nt")
      (progn
        (setq
          elpy-rpc-python-command "C:/Python34/python.exe"
          python-shell-interpreter "C:/Python34/Scripts/ipython.exe"))
      (progn
        (setq
          elpy-rpc-python-command "/home/rrajan/utilities/bin/python3"
          python-shell-interpreter "/home/rrajan/utilities/bin/ipython3"))))

(require 'evil)
(evil-mode 1)
        
;; Evil mode
(require 'evil-leader)
(global-evil-leader-mode)
;(require 'evil)
;(evil-mode 1)

;; Set the leader keys
(evil-leader/set-leader (kbd ","))
;; Set some leader-key defined shortcuts
(evil-leader/set-key (kbd "w") 'save-buffer)
(evil-leader/set-key (kbd "q") 'kill-buffer-and-window)
(evil-leader/set-key (kbd "z") 'delete-other-windows)
(evil-leader/set-key (kbd "v") 'split-window-right)
(evil-leader/set-key (kbd "e") 'pp-eval-last-sexp)
(evil-leader/set-key (kbd ",") 'other-window)

;; Evil-mode Keybindings for moving between windows
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

;; Better, Faster help on functions with evil-normal-mode K
(evil-define-key 'normal emacs-lisp-mode-map (kbd "K")
  'elisp-slime-nav-describe-elisp-thing-at-point)

;; The GPS Setup
;; (load-file "~/emacs_setup")
;; (customize-set-variable 'initial-buffer-choice (shell))
;; (global-set-key "\C-^"    'enlarge-window)
;; 
;; 
;; (when (require 'undo-tree nil 'noerror)
;;   (global-undo-tree-mode)
;;   (global-set-key [(control ?\.)] 'undo-tree-redo)
;;   )
;; 
;; (setq large-file-warning-threshold 200000000)

;; March 13th
;; ****************
;; New packages installed
;; powerline
;; powerline-evil
;; helm-swoop
;; use-package
;; TODO
;; ********** 
;; Make evil mode work everywhere
;; helm-swoop clear

;; Powerline and evil-powerline settings
(require 'powerline)
(require 'powerline-evil)
(powerline-evil-vim-theme)

;; helm configurations
(require 'helm)
(require 'helm-config)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(evil-leader/set-key (kbd "x") 'helm-M-x)
(evil-leader/set-key (kbd "i") 'helm-swoop)
(evil-leader/set-key (kbd "b") 'helm-buffers-list)
(evil-leader/set-key (kbd "k") 'helm-show-kill-ring)
(evil-leader/set-key (kbd "f") 'helm-find-files)
