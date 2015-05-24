(defun end-of-include ()
  "moves to beg of line after last include"
  (beginning-of-buffer)
  (while (search-forward "#include" nil t))
  (beginning-of-line)
  (next-line)
  (point)
)

(defun start-of-include ()
  (beginning-of-buffer)
  (search-forward "#include" nil t)
  (beginning-of-line)
  (point)
)



(defun sort-includes ()
  "sort the include statements alphabetically"
  (let ( (p1 (start-of-include))
         (p2 (end-of-include))
         )
    (sort-lines nil p1 p2)
    )
)


(defun close-and-next ()
  "close the current buffer and open next error"
  (interactive)
  (kill-buffer)
  (next-error)
)



(defun doxy-group (group-name)
  "Create an \addtogroup groupname statement for everything in this file."
  (interactive "Mgroup-name: ")
  (beginning-of-buffer)
  (while (re-search-forward "^namespace" nil t) )
  (search-forward "{")
  (let ( (insertion-pos (point))
         )
    (backward-char)
    (forward-sexp)
    (backward-char)
    (insert "/** @} */\n")
    (goto-char insertion-pos)
    (forward-char)
    (insert "/** @addtogroup " group-name "\n*@{\n*/\n")
    )
  )

(defun save-and-close ()
  "save the current buffer, and close it."
  (interactive)
  (save-buffer)
  (kill-buffer)
  )

(defun fsc ()
  "fix the headers, save and close"
  (interactive)
  (fix-includes)
  (save-and-close)
)

(defun doxyfix-comment ()
  "take the nearest comment above, and turn it into a ///< style comment."
  (interactive)
  (save-excursion
	(let ( (beg-com (search-backward "/*" nil t))
		   (end-com (search-forward "*/")))
	  (replace-regexp "\\\\brief" "" nil beg-com end-com)
	  (setq end-com (search-forward "*/"))
	  (replace-regexp "^\\([\t\s]*\\)" " \\1//" nil beg-com end-com)
	  (setq end-com (search-forward "*/"))
	  (goto-char end-com)
	  (delete-line)
	  (goto-char beg-com)
	  (delete-line)
    )
    )
  )

(defun get-comment-bounds ()
  "remove the uneccesary \brief from the comment"
  (interactive)
  (save-excursion
	(cons (search-backward "/*" nil t)  (search-forward  "*/" nil t))
	)
  )
(defun delete-line()
  "deletes the current line"
  (interactive)
  (save-excursion
	(delete-region (progn (forward-line 0)(point))
				   (progn (forward-line 1)(point))
				   )
	))

(defun do-within-comment ()
)

(defun com-online ()
  " Take an ugly ass comment and make it into a one-liner"
  (interactive)
  (save-excursion)
  (search-backward "//-------")
  (delete-line)
  (search-forward "//-------")
  (delete-line)
  (replace-string (search-backward "\*") (search-forward "*/") "\brief" "")
  )

(defun doxy-convert-comment ()
  "take the current comment and convert it to c++ style"
  (interactive)
  (save-excursion
  (let ( (begp (search-backward "/*" nil ))
         (endp (search-forward "*/" nil ))
         )
	(replace-regexp "/\\*." "///" nil begp endp)
	(replace-regexp "\\\\brief" ""  nil  begp endp)
	(let ((endp (search-forward "*/" nil ))
		  (beg-waste (re-search-backward "[^*/\s]"))
		  )
	  (delete-region beg-waste endp)
	  (replace-regexp "^" " ///" nil begp beg-waste)
	  )
	(indent-region begp endp)
	)
  )
  )

(defun indent-buffer ()
  "indent the whole buffer"
  (interactive)
  (indent-region (point-min) (point-max))
)


(defun clean-me ()
  "clean up common problems in our bacntetd.  throwaway funciton"
  (interactive)
  (save-excursion
  (beginning-of-buffer)
  (while (re-search-forward "^[\s\t]*//--------------+$" nil t)
	(insert "found")
	(delete-line))
 (indent-buffer)
 (save-buffer)
  )
  )

(defun make-comment-block (blockname)
  "insert a comment block with the given text"
  (interactive "M block text: ")
  (let ( (block-width 51))
    (let ( (half-block-width (/ (- block-width 3) 2))
           (word-width (length blockname))
           (half-word-width (/ (length blockname) 2)) )
      (let(
           (num-spc-before (- half-block-width (+ half-word-width 2)))
           )

        (let(
             (num-spc-after (- block-width (+ 4 num-spc-before word-width)))
             )
          (insert "//") (insert-char ?=  (- block-width 1) ) (insert "\n")
          (insert "//=") (insert-char ?  (- block-width 3) ) (insert "=\n")
          (insert "//=") (insert-char ?  num-spc-before)  (insert blockname)
          (insert-char ?  num-spc-after)  (insert "=\n")
          (insert "//=") (insert-char ? (- block-width 3)  ) (insert "=\n")
          (insert "//") (insert-char ?= (- block-width 1)  ) (insert "\n")
          )
        )
      )
  )
)
