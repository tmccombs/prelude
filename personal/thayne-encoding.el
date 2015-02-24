;;; thayne-encoding -- Set up encodings and input methods
;;; Commentary:
;;; Set up encodings to UTF-8
;;; and use a better input method
;;; Code:

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-input-method "latin-1-prefix")

(provide 'thayne-encoding)
;;; thayne-encoding.el ends here
