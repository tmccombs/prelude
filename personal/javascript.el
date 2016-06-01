;;; javascript -- javascript customizations
;;;
;;; Commentary:
;;; Javascript customizations
;;;
;;; Code:

(prelude-require-package 'tide)

(require 'tide)

(add-hook 'typescript-mode-hook
          (lambda ()
            (tide-setup)
            (flycheck-mode +1)
            (eldoc-mode +1)
            (company-mode-on)))

(setq tide-format-options '(:insertSpaceAfterFunctionKeywordAnonymousFunctions t :placeOpenBraceOnNewLineForFunctions nil))

(provide 'javascript-personal)
;;; javascript.el ends here
