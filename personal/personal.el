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

;;; Slime setup
(setq slime-contribs '(slime-fancy ))

;;; Projectile customization
(defun projectile-direx ()
  "Open Direx buffer in the project directory."
  (interactive)
  (direx:find-directory (projectile-project-root)))

;;; Make direx window open with popwin
(require 'popwin)
(push '(direx:direx-mode :position left :width 25 :dedicated t)
      popwin:special-display-config)

;; Alter default modes
(push '("\\.m$" . octave-mode) auto-mode-alist)

(provide 'personal)
;;; personal.el ends here
