; Melpa packages
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;add load path
(add-to-list 'load-path "~/.emacs.d/elpa/ac-js2-20140906.442ac-js2-20140906.442")

; python mode
(elpy-enable)

; Hide the splash and banner screen
; on startup
(setq inhibit-startup-message t
inhibit-startup-echo-area-message t) 

; Replace default buffer with ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

; Exec path from shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

; Pretty color for terminal :)
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

; paste in ansi-term
(add-hook 'term-mode-hook (lambda ()
                            (define-key term-raw-map (kbd "C-y") 'term-paste)))

; Show line numbers
(global-linum-mode t)
	
; Set tabs to 2 spaces
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)
;(setq-default js2-basic-offset 2)
(setq-default indent-tabs-mode nil)


; load theme
;(require 'birds-of-paradise-plus-theme)
(load-theme 'zenburn t)

; hippie expand
;; hippie expand - don't try to complete with file names
(setq hippie-expand-try-functions-list (delete 'try-complete-file-name hippie-expand-try-functions-list))
(setq hippie-expand-try-functions-list (delete 'try-complete-file-name-partially hippie-expand-try-functions-list))


; ido mode L33t stuff...
(setq ido-use-filename-at-point nil)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

; Hook for company mode
(add-hook 'after-init-hook 'global-company-mode)

(add-to-list 'load-path "/usr/local/lib/node_modules/tern/emacs/")
(autoload 'tern-mode "tern.el" nil t)

; js2mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-jsx-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . js2-jsx-mode))

; HTML mode-line
(add-to-list 'auto-mode-alist '("\\.ejs$" . html-mode))

; add hook to start tern
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))

; add hook for tern
(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-tern))

; electric pair mode enable
(electric-pair-mode 1)

; indent options
(setq js-indent-level 2)
(setq-default js2-basic-offset 2)

; prevent auto-save 
(setq auto-save-default nil)

; multi term 
(require 'multi-term)

; set zsh as terminal-coding-system
(setq multi-term-program "/bin/zsh")


(require 'tern)
; no port file for tern
(setq tern-command (append tern-command '("--no-port-file")))

; prevent backups 
(setq make-backup-files nil) 

; smooth scroll please
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

; expand region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

; iMessage hook
(add-to-list 'load-path "~/code/elisp/iMessage/")
(require 'imessage)

; magit! 
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

; windmoves
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;enable rainbow mode with 
(add-to-list 'auto-mode-alist '("\\.scss" . css-mode))
(add-to-list 'auto-mode-alist '("\\.stss" . css-mode))

;rainbow mode hook
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'js2-jsx-mode 'rainbow-mode)

;; Make windmove work in org-mode:
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

; pretty print
(defun json-format ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "python -m json.tool" (buffer-name) t)
    )
  )

;; Set your lisp system and, optionally, some contribs
(setq inferior-lisp-program "/opt/sbcl/bin/sbcl")
(slime-setup '(slime-fancy))
