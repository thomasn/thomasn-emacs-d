;; Tell Custom not to mess with .emacs:
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; Never use tabs:
(setq indent-tabs-mode nil)

(require 'recentf)
(recentf-mode)

(require 'misc)

;; ========== Custom key bindings ==========

(defun close-current()
"Close current window, kill buffer"
(interactive)
(kill-buffer (current-buffer))
)
(global-set-key (kbd "<f11>") 'close-current)
(global-set-key (kbd "<C-f4>") 'close-current)
(global-set-key (kbd "<S-f11>") 'close-current)
;;; C-F12 repeats last macro -- same as C-x e:
(global-set-key (kbd "<f12>") 'kmacro-end-and-call-macro)
(global-set-key (kbd "<S-f12>") 'kmacro-end-and-call-macro)
;; Prompt for a line and go to it when hitting C-x g
(global-set-key "\C-xg" 'goto-line)

;; My custom bindings are C-c C-v ...
(global-set-key "\C-c\C-vfb" 'font-lock-fontify-buffer)
(global-set-key "\C-c\C-vbb" 'bury-buffer)
(global-set-key [f6] 'copy-from-above-command)


;; ========== Ruby config ==========

;; From http://www.hyperionreactor.net/node/43
;;
;; Assorted Lisp Files I Embrace
(add-to-list 'load-path "~/.emacs.d/plugins/alfie")
;;; (require 'pabbrev)

;; Ruby Mode
(add-to-list 'load-path "~/.emacs.d/plugins/ruby-mode")

(require 'ruby-mode)
(require 'ruby-electric)

(defun ruby-eval-buffer () (interactive)
"Evaluate the buffer with ruby."
(shell-command-on-region (point-min) (point-max) "ruby"))

(defun my-ruby-mode-hook ()
(font-lock-mode t)
(font-lock-fontify-buffer)
(setq standard-indent 2)
;;; (pabbrev-mode t)
;;; (ruby-electric-mode t)
(define-key ruby-mode-map "\C-c\C-a" 'ruby-eval-buffer))
(add-hook 'ruby-mode-hook 'my-ruby-mode-hook)

(setq auto-mode-alist (cons '("\\.rb\\'" . ruby-mode) auto-mode-alist))

;; Rinari Mode (Rails)
;;;(add-to-list 'load-path "~/.emacs.d/plugins/rinari")
;;;(add-to-list 'load-path "~/.emacs.d/plugins/rinari/rhtml")
;;;(require 'rinari)
;;;(setq auto-mode-alist (cons '("\\.rhtml\\'" . html-mode) auto-mode-alist))


;; ======== Markdown mode ========
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
  (setq auto-mode-alist
    (cons '("\\.md$" . markdown-mode) auto-mode-alist))
  (setq auto-mode-alist
    (cons '("\\.markdown$" . markdown-mode) auto-mode-alist))
  (setq auto-mode-alist
    (cons '("\\.nb$" . markdown-mode) auto-mode-alist))

;; ======== emacs-rails ========

(add-to-list 'load-path "~/.emacs.d/plugins/emacs-rails")
  (require 'rails)


;; ======== nxml-mode ========

;;; (load "~/.emacs.d/plugins/nxml-mode-20041004/rng-auto.el")
  (setq auto-mode-alist
        (cons '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\)\\'" . nxml-mode)
	      auto-mode-alist))


;; ==== misc ====

(require 'toggle-case)

;; ==== fuzzy-find ====

(add-to-list 'load-path "~/.emacs.d/plugins/fuzzy-find-in-project")
(require 'fuzzy-find-in-project)
(fuzzy-find-project-root "~/dev/corr/hive/master")


;; ==== anything ====

(require 'anything)
(require 'anything-config)
(require 'anything-dabbrev-expand)
(global-set-key "\M-/" 'anything-dabbrev-expand)
(define-key anything-dabbrev-map "\M-/" 'anything-dabbrev-find-all-buffers)
(add-to-list 'load-path "/usr/lib/ruby/gems/1.8/gems/rcodetools-0.8.5.0")

(require 'anything-rcodetools)
;; Command to get all RI entries.
(setq rct-get-all-methods-command "PAGER=cat fri -l")
(define-key anything-map "\C-z" 'anything-execute-persistent-action)


;; ==== http://www.20seven.org/journal/ ====

;; full screen toggle using command+[RET]
(defun toggle-fullscreen () 
  (interactive) 
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen) 
                                           nil 
                                           'fullboth)))
(global-set-key [(meta return)] 'toggle-fullscreen)

;; YASnippet
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)


(display-time)

(server-start)
