;;============================================
;; This file contains customizations and extensions 
;; for working with LaTeX files.  
;; ============================================
;; Setup auctex use:
;; the wrapping up of the two loads make sure 
;; auctex is loaded only when editing tex files. 
(eval-after-load "tex-mode" '(progn
(load "auctex.el" nil t t)
(load "preview-latex.el" nil nil t))) 

;; ACUTeX replaces latex-mode-hook with LaTeX-mode-hook
(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (setq TeX-auto-save t)
	    (setq TeX-parse-self t) 
	    (setq TeX-newline-function reindent-then-newline-and-indent)
	    (setq visual-line-mode) 
	    (add-hook 'find-file-hook 'TeX-fold-buffer t)
	    
	    (setq-default TeX-master nil)
	    (reftex-mode t)
	    (TeX-fold-mode t))) 

;; reftex with auctex!:
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode

(defun gas-LaTeX-ol-view ()
  "Create an indirect view of the current (LaTeX)  buffer, and display
   and outline view thereof"
  (interactive)
  
)
(provide 'glen-latex-stuff)