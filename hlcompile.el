  (defun my-recompile ()
    "Run compile and resize the compile window closing the old one if necessary"
    (interactive)
    (progn
      (if (get-buffer "*compilation*") ; If old compile window exists
  	(progn
  	  (delete-windows-on (get-buffer "*compilation*")) ; Delete the compilation windows
  	  (kill-buffer "*compilation*") ; and kill the buffers
  	  )
        )
      (call-interactively 'compile)
      (enlarge-window 20)
      )
  )
  (defun my-next-error ()
    "Move point to next error and highlight it"
    (interactive)
    (progn
      (next-error)
      (end-of-line-nomark)
      (beginning-of-line-mark)
      )
  )

  (defun my-previous-error ()
    "Move point to previous error and highlight it"
    (interactive)
    (progn
      (previous-error)
      (end-of-line-nomark)
      (beginning-of-line-mark)
      )
  )
  (global-set-key (kbd "C-n") 'my-next-error)
  (global-set-key (kbd "C-p") 'my-previous-error)

  (global-set-key [f5] 'my-recompile)
