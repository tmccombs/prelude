;;; personal -- personal customizations
;;;
;;; Commentary:
;;; Personal emacs configurations
;;;
;;; Code:

;;; User customization
(setq user-mail-address "astrothayne@gmail.com")

;;; Additional package archives
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;;; use utf-8
(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)

;;; Set some variables
(global-linum-mode 1)
(show-paren-mode 1)
(menu-bar-mode 1)

;;; YASnippet
(setq yas-snippet-dirs '("~/.emacs.d/personal/snippets" yas-installed-snippets-dir))
(add-hook 'yas-minor-mode-hook
          (lambda ()
            (yas-activate-extra-mode 'fundamental-mode)))

;; Fix doc-view
(add-hook 'doc-view-mode-hook
          (lambda ()
            (linum-mode -1)))

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


;;; Slime setup
(setq slime-contribs '(slime-fancy ))

;; Alter default modes
(push '("\\.m$" . octave-mode) auto-mode-alist)

(provide 'personal)
;;; personal.el ends here
