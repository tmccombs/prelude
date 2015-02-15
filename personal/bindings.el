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
(setcdr evil-insert-state-map nil) ;; clear evil keybindings
;; Escape and Super-y return to the normal state
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(define-key evil-insert-state-map (kbd "s-y") 'evil-normal-state)
;; Still want to be able to switch to true emacs state
(define-key evil-insert-state-map (kbd "s-e") 'evil-emacs-state)

;;; Direx setup
(require 'direx-project)
(define-key prog-mode-map (kbd "<f8>") 'direx-project:jump-to-project-root-other-bindings)
(global-set-key (kbd "M-<f8>") 'direx:find-directory)
(global-set-key (kbd "S-<f8>") 'direx:jump-to-directory-other-window)
;;TODO add key

;;; window.el ends here
