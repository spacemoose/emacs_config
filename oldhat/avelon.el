;;-------------------------------------------------------
;;                   FORMATTING SETTINGS
;;-------------------------------------------------------



;;-------------------------------------------------------
;;                   String stuff
;;-------------------------------------------------------
(defun string-ends-with (s ending)
  "return non-nil if string S ends with ENDING."
  (let ((elength (length ending)))
    (string= (substring s (- 0 elength)) ending)))

(defun string-starts-with (s arg)
  "returns non-nil if string S starts with ARG.  Else nil."
  (cond ((>= (length s) (length arg))
         (string-equal (substring s 0 (length arg)) arg))
        (t nil)))

;;-------------------------------------------------------
;;                   CONVENIENCE STUFF
;;-------------------------------------------------------
;; cycle backwards through windows:
(global-set-key  "\C-xp"
                 '(lambda () "Previous" (interactive)(other-window -1) ));


(defun convert-include-type ()
  "This cleans up incorrect include types"
  (interactive)
  (save-excursion
    (setq beg (line-beginning-position))
    (setq end (line-end-position))
    (goto-char beg)
    (while (search-forward "<" end t)
      (replace-match "\""))(goto-char beg)
      (while (search-forward ">" end t)
        (replace-match "\""))
      ))

;; I help you reorder definition files.
;; I prompt you for a function name.  I will look for:
;;   * fun-name() *
;;   {
;;       *
;;   }
;; I will take that block, and move it to point.
;; I assume that if I find *fun-name(* with a { on the following line,
;; that I found the start of the function.
(defun move-function-here ( fname)
  "Find the definition block of the given function name, and yank it to point"
  (interactive "MFunction-name:")
  (save-excursion
    ( let
        (
         (insertion-point (point))
         (re-string (concat  "^[[:blank:]]*"  "[[:alnum:]>:<_]*" "[[:blank:]]*"
                             "[[:alnum:]:]*" fname "([[:alnum:], <>]*)[^;]*{" ))
         )
      (message re-string)
      (re-search-forward re-string)
      (backward-sentence)
      (message "fun starts @ %d" (point))
      (let (
            (beg (point))
            )
        (re-search-forward "{")
        (backward-char)
        (message "paren @ %d" (point))
        (forward-sexp)
        (message "end @ %d" (point))
        (message "%d %d %d " insertion-point beg (point) )
        (kill-region beg (point))
        )
      (goto-char insertion-point)
      (clipboard-yank)
      )
    ))

(defun commonify ()
  (interactive)
  "fixes an inccrect include of common lib"
  (save-excursion
    (setq beg (line-beginning-position))
    (setq end (line-end-position))
    (goto-char beg)
    (while (search-forward "\"" end t)
      (replace-match "\"common/"))
    ))

(defun beatify ()
  (interactive)
  "fixes an inccrect include of common lib"
  (save-excursion
    (setq beg (line-beginning-position))
    (setq end (line-end-position))
    (goto-char beg)
    (while (search-forward "\"" end t)
      (replace-match "\"beetle/"))
    ))

(defun avelon-insert-copyright ()
  "Insert the standard copyright header at the top of the current buffer"
  (interactive)
  (insert "// (C) " (format-time-string "%Y"))(insert " Avelon-Avedis.\n")
  (insert "//    All rights reserved\n")
  (insert "//\n")
  (insert "/// @author Glen\n")
  )

(defun avelon-insert-include-guard (namespace-list)
  "Insert an include guard made up of buffer name and namespaces."
  (let ( (guard-name (mapconcat  'concat namespace-list "_"))
         )
    (if (not(string-equal guard-name ""))
        (setq guard-name (concat guard-name "_"))
      )
    (setq guard-name (concat guard-name (replace-regexp-in-string "\\." "_" (buffer-name))))
    (setq guard-name (upcase guard-name))
    (insert "#ifndef " guard-name "\n")
    (insert "#define " guard-name "\n")
    )
  )


(defun avelon-insert-namespace (single-namespace)
  "For use with mapcar to insert a list of namespaces."
  (insert "namespace " single-namespace "{")
  )

;; should use a lambda here instead.
(defun avelon-insert-closing-parentheses (single-namespace)
  "cuz I suck at lisp, i made a function for something that should be a lambda"
  (insert "}")
  )

(defun get-namespace-list()
  "Prompt a user for namespaces. "
  (setq namespace-list nil)
  (setq namespace nil)
  (while (not (string-equal "" namespace))
    (setq namespace (read-from-minibuffer "add a namespace:" nil nil nil nil nil))
    (if (not (string-equal "" namespace))
        (add-to-list 'namespace-list namespace)
      )
    )
  (reverse namespace-list)
  )

;; need to make this behave differently for hpp and cpp files.
(defun avelon-make-boilerplate ()
  "Insert all the boilerplate crap, including copyright, include guards, and namespace directives."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (avelon-insert-copyright)
    (let ( (namespace-list (get-namespace-list)))
      (if (string-ends-with (buffer-name) ".hpp")
          (avelon-insert-include-guard namespace-list)
        )
      ;; go to end of comment block.
      (while (re-search-forward "#include .*" nil t))
      ;; insert namespace declarations
      (mapcar 'avelon-insert-namespace namespace-list)
      (goto-char (point-max))
      (insert "\n")
      (mapcar 'avelon-insert-closing-parentheses namespace-list)
      (insert " /// namespaces")
      (insert "\n#endif //include guard")
      )
    )
  )


(defun avelon-test-boilerplate (suite-name)
  "Make the boilerplate crap every boost unit test needs"
  (interactive "M(optional) module name: ")
  (goto-char (point-min))
  (avelon-insert-copyright)
  (insert "\n\n")
  (if (string-equal suite-name "")
      (insert "#define BOOST_TEST_MAIN\n")
    (insert "#define BOOST_TEST_MODULE " suite-name "\n")
    )
  (insert "#include <boost/test/unit_test.hpp>\n")
  )

;; @todo let this work if we have a range too.
(defun avelon-insert-pragmas (pragma-name)
  "Wrap the current line with a pragma to disable the warning."
  (interactive "MWarning to disable: ")
  (if (string= "" pragma-name)
      (message "ignoring empty pragma name")
    (move-beginning-of-line nil)
    (insert "#pragma GCC diagnostic ignored \"-W" pragma-name "\"\n")
    (move-end-of-line nil)
    (insert "\n#pragma GCC diagnostic warning \"-W" pragma-name "\"\n")
    )
  )


(provide 'avelon)
