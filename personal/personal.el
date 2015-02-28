;;; personal -- personal customizations
;;;
;;; Commentary:
;;; Personal emacs configurations
;;;
;;; Code:

;; Required packages:
(prelude-require-packages '(evil yasnippet neotree popwin perspective ensime slime))

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
;; Turn off YASnippet in terminal modes so that
;; tab-completion works.
(add-hook 'term-mode-hook (lambda ()
                            (yas-minor-mode -1)))

;; Fix doc-view
(defun disable-linum-mode ()
  "Turn off linum mode for the current buffer."
  (linum-mode -1))
(add-hook 'doc-view-mode-hook 'disable-linum-mode)
(add-hook 'image-mode-hook 'disable-linum-mode)
;;; Slime setup
(setq slime-contribs '(slime-fancy ))

;;; Projectile customization
(projectile-global-mode)
(persp-mode)
(require 'persp-projectile)



;;; Ensime setup
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-mode)

;;; Add clear method for comint mode
(defun comint-clear ()
  "Clear the buffer for comint mode."
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))

;; Alter default modes
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.projectile\\'" . prog-mode))

(provide 'personal)
;;; personal.el ends here
