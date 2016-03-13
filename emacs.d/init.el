;; Package Stuff
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))

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

;; Remember the cursor position of files when opening them
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

;; Pressing RET should do newline-and-indent
(define-key global-map (kbd "RET") 'newline-and-indent)

(require 'package)
(package-initialize)

;; elsp-slime-navigator
(require 'elisp-slime-nav)
(defun my-lisp-hook ()
  (elisp-slime-nav-mode)
  (turn-on-eldoc-mode))
(add-hook 'emacs-lisp-mode-hook 'my-lisp-hook)

;; elpy : for Python
(elpy-enable)
(if (string-equal system-type "windows-nt")
    (progn
      (setq
        elpy-rpc-python-command "C:/Python34/python.exe"
        python-shell-interpreter "C:/Python34/Scripts/ipython.exe"))
    (progn
      (setq
        elpy-rpc-python-command "/home/rrajan/utilities/bin/python3"
        python-shell-interpreter "/home/rrajan/utilities/bin/ipython3")))
  
;;(elpy-use-ipython)

;; Evil mode
(require 'evil-leader)
(global-evil-leader-mode)
(require 'evil)
(evil-mode 1)

;; Set the leader keys
(evil-leader/set-leader (kbd ","))
;; Set some leader-key defined shortcuts
(evil-leader/set-key (kbd "w") 'save-buffer)
(evil-leader/set-key (kbd "q") 'kill-buffer-and-window)
(evil-leader/set-key (kbd "z") 'delete-other-windows)
(evil-leader/set-key (kbd "v") 'split-window-right)
(evil-leader/set-key (kbd "e") 'pp-eval-last-sexp)
(evil-leader/set-key (kbd ",") 'other-window)
(evil-leader/set-key (kbd "b") 'ibuffer)
(evil-leader/set-key (kbd "x") 'helm-M-x)

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

(require 'powerline)
(require 'powerline-evil)
(powerline-evil-vim-theme)
