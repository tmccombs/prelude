;;; personal -- personal customizations
;;;
;;; Commentary:
;;; Personal emacs configurations
;;;
;;; Code:

;; Required packages:
(prelude-require-packages '(evil yasnippet neotree popwin perspective ensime slime))

;;; Additional package archives
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))


;;; Set some variables
(global-linum-mode 1)
(setq magit-last-seen-setup-instructions "1.4.0")

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

;;; Projectile customization
(projectile-global-mode)
(persp-mode)
(require 'persp-projectile)

;;; Smartparen customization
;; Don't pair "'" in some modes
(sp-local-pair '(octave-mode minibuffer-inactive-mode) "'" nil :actions nil)

;;; Ensime setup
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-mode)

;;; Add clear method for comint mode
(defun comint-clear ()
  "Clear the buffer for comint mode."
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))

;;; Enable horizontal scrolling with mouse
(global-set-key (kbd "<mouse-6>") (lambda ()
                                    (interactive)
                                    (scroll-right 5 t)))
(global-set-key (kbd "<mouse-7>") (lambda ()
                                    (interactive)
                                    (scroll-left 5 t)))

;; Alter default modes
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.projectile\\'" . prog-mode))

(provide 'personal)
;;; personal.el ends here
