;; Disable Splash screen
(setq inhibit-splash-screen t)

;; Disable menu-bar, scroll-bar and tool-bar
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; Better line-wrapping
(visual-line-mode 1)

;; Pressing RET should do newline-and-indent
(define-key global-map (kbd "RET") 'newline-and-indent)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; elsp-slime-navigator
(require 'elisp-slime-nav)
(defun my-lisp-hook ()
  (elisp-slime-nav-mode)
  (turn-on-eldoc-mode))
(add-hook 'emacs-lisp-mode-hook 'my-lisp-hook)

;; elpy : for Python
(elpy-enable)
(setq elpy-rpc-python-command "python3")
(elpy-use-ipython)

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
(evil-leader/set-key (kbd "v") 'split-window-right)
(evil-leader/set-key (kbd "e") 'pp-eval-last-sexp)
(evil-leader/set-key (kbd ",") 'other-window)
(evil-leader/set-key (kbd "b") 'ibuffer)

;; Evil-mode Keybindings for moving between windows
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

;; Better, Faster help on functions with evil-normal-mode K
(evil-define-key 'normal emacs-lisp-mode-map (kbd "K")
  'elisp-slime-nav-describe-elisp-thing-at-point)
