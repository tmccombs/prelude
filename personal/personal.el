;;; personal -- personal customizations
;;;
;;; Commentary:
;;; Personal emacs configurations
;;;
;;; Code:

;; Required packages:
(prelude-require-packages '(evil yasnippet direx popwin perspective ensime slime))

;;; Additional package archives
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;;; use utf-8
(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)

;;; Set some variables
(global-linum-mode 1)

;;; YASnippet
(require 'yasnippet)
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
(projectile-global-mode)
(persp-mode)
(require 'persp-projectile)
(defun projectile-direx ()
  "Open Direx buffer in the project directory."
  (interactive)
  (direx:find-directory (projectile-project-root)))

;;; Make direx window open with popwin
(require 'popwin)
(push '(direx:direx-mode :position left :width 25 :dedicated t)
      popwin:special-display-config)

;;; Ensime setup
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-mode)

;; Alter default modes
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))
(add-to-list 'auto-mode-alist '("\\.scala\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.projectile\\'" . prog-mode))

(provide 'personal)
;;; personal.el ends here
