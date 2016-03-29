;;; sdlang-mode.el --- Major mode for editing sdl conf files
;;;
;;; Commentary:
;;;
;;; Major mode for editing sdl conf files (https://sdlang.org/)
;;;
;;; Code:

;;; TODO: make this its own emacs package

(defconst sdlang-mode-syntax-table
  (let ((syntax-table (make-syntax-table prog-mode-syntax-table)))
    (modify-syntax-entry ?\' "\"" syntax-table)
    (modify-syntax-entry ?\` "\"" syntax-table)
    (modify-syntax-entry ?\" "\"" syntax-table)
    (modify-syntax-entry ?\- "w 12" syntax-table)
    (modify-syntax-entry ?\. "w" syntax-table)
    (modify-syntax-entry ?\_ "w" syntax-table)
    (modify-syntax-entry ?:  "w" syntax-table)
    (modify-syntax-entry ?# "<" syntax-table)
    (modify-syntax-entry ?\n ">" syntax-table)
    (modify-syntax-entry ?/ ". 124" syntax-table)
    (modify-syntax-entry ?* ". 23b" syntax-table)

    (modify-syntax-entry ?\[ "|" syntax-table)
    (modify-syntax-entry ?\] "|" syntax-table)
    syntax-table)
  "Syntax table in use in `sdlang-mode' buffers.")

(defconst sdlang-constants-re
  (regexp-opt '("true" "false"
                "on" "off"
                "null")
              'words))
(defconst sdlang-literals-re
  (rx (seq word-start
           (? (or ?- ?+))
           (+ (or digit ?\.))
           (* (any "lLFdDbB"))
           (? ?- (= 3 (any "A-Z")))
           word-end)))
(defconst sdlang-tag-re "\\(^\\|;\\)[[:space:]]*\\w+")
(defconst sdlang-attribute-re "\\w+=")

(define-derived-mode sdlang-mode prog-mode "SDLANG"
  "Simple mode to edit SDL config files."
  :syntax-table sdlang-mode-syntax-table
  (setq-local comment-start "// ")
  (setq-local comment-start-skip (regexp-opt
                                  '("//+ *" "/\\*+ *"
                                    "#+ *" "--+ *")))
  (setq-local indent-line-function 'sdlang-indent)
  (setq font-lock-defaults '(sdlang-font-lock-defaults)))

;; Font-lock support



(defconst sdlang-font-lock-defaults
  `((,sdlang-constants-re . font-lock-keyword-face)
    (,sdlang-literals-re . font-lock-constant-face)
    (,sdlang-tag-re . font-lock-type-face)
    (,sdlang-attribute-re . font-lock-variable-name-face)))

;; Indentation

(defun sdlang-indent ()
  "Indent for sdlang."
  (interactive)
  (let ((savep (> (current-column) (current-indentation)))
        (indent (sdlang-compute-indent)))
    (if savep
        (save-excursion (indent-line-to indent))
      (indent-line-to indent))))

(defconst body-start-re ".*[{[]\\s-*$"
  "Regular expression for the first line of a body.")
(defun sdlang-compute-indent ()
  "Calculate where we should indent for sdlang."
  (save-excursion
    (beginning-of-line)
    (let ((body-close nil))
      (if (looking-at "\\s-*[]}]")
          (and
           (search-backward-regexp body-start-re nil t)
           (setq body-close t))
        (forward-line -1))
      (let ((ci (current-indentation)))
        (if (and (not body-close)
                 (looking-at body-start-re))
            (+ ci standard-indent)
          ci)))))

(add-to-list 'auto-mode-alist '("\\.sdl\\'" . sdlang-mode))

(provide 'sdlang-mode)
;;; sdlang-mode.el ends here
