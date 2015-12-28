;;; personal -- personal customizations
;;;
;;; Commentary:
;;; Personal emacs configurations
;;;
;;; Code:

;; Required packages:
(prelude-require-packages '(evil neotree popwin perspective ensime slime))

;;; Additional package archives
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;; fallback for all fonts
(set-fontset-font "fontset-default" nil
                  (font-spec :name "Symbola"))

;;; Set some variables
(global-linum-mode 1)

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


;; Alter default modes
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.projectile\\'" . prog-mode))

(provide 'personal)
;;; personal.el ends here
