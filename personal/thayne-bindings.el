;;; bindings -- key binding customization
;;;
;;; Commentary:
;;; Set up the key bindings that I like.
;;;
;;; Code:


;;; Multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;;; Evil customization
;;Make insert state more like emacs state
(require 'evil)
(setq evil-insert-state-map (make-sparse-keymap))
;; Escape and Super-y return to the normal state
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(define-key evil-insert-state-map (kbd "s-n") 'evil-normal-state)
;; Still want to be able to switch to true emacs state
(define-key evil-insert-state-map (kbd evil-toggle-key) 'evil-emacs-state)

;;; Neotree setup
(require 'neotree)
(require 'projectile)
(global-set-key [f8] 'neotree-toggle)
;; Add keybinding for opening neotree for the project.
(define-key projectile-command-map (kbd "n") 'neotree-projectile-action)

(define-key sp-keymap (kbd "M-K") 'sp-kill-sexp)

;;; Comment/Uncomment key binding
(define-key prog-mode-map (kbd "C-%") 'comment-or-uncomment-region)

;;; Add key binding for projectile-persp-mode.
(global-set-key (kbd "C-c p <return>") 'projectile-persp-switch-project)

;;; Enable horizontal scrolling with mouse
(global-set-key (kbd "<mouse-6>") (lambda ()
                                    (interactive)
                                    (scroll-right 5 t)))
(global-set-key (kbd "<mouse-7>") (lambda ()
                                    (interactive)
                                    (scroll-left 5 t)))

(require 'magit)
(define-key magit-file-section-map "K" 'magit-discard)


(provide 'thayne-bindings)
;;; thayne-bindings.el ends here
