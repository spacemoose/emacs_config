;; ---
;; building
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
	      (ggtags-mode 1))))
(setq compile-command "ssh pdxenlin66 \"build500\"")



(add-hook 'c-mode-common-hook 'hs-minor-mode) ;hideshow enabled for all C/C++
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'prog-mode-hook 'nlinum-mode)


;;-------------------------------------------------------
;;        HIDESHOW
(global-set-key [C-tab] 'hs-toggle-hiding) ; ctl-tab hides/shows a block


;; @todo need to get this working again, but using helmf
;(global-set-key (kbd "C-c C-h")  '(lambda () (interactive)(ff-find-other-file -1) ))



;; we want hideshow to be able to hide comments
(defun hs-hide-all-comments ()
  "Hide all top level blocks, if they are comments, displaying only first line.
Move point to the beginning of the line, and run the normal hook
`hs-hide-hook'.  See documentation for `run-hooks'."
  (interactive)
  (hs-life-goes-on
   (save-excursion
     (unless hs-allow-nesting
       (hs-discard-overlays (point-min) (point-max)))
     (goto-char (point-min))
     (let ((spew (make-progress-reporter "Hiding all comment blocks..."
                                         (point-min) (point-max)))
           (re (concat "\\(" hs-c-start-regexp "\\)")))
       (while (re-search-forward re (point-max) t)
         (if (match-beginning 1)
             ;; found a comment, probably
             (let ((c-reg (hs-inside-comment-p)))
               (when (and c-reg (car c-reg))
                 (if (> (count-lines (car c-reg) (nth 1 c-reg)) 1)
                     (hs-hide-block-at-point t c-reg)
                   (goto-char (nth 1 c-reg))))))
         (progress-reporter-update spew (point)))
       (progress-reporter-done spew)))
   (beginning-of-line)
   (run-hooks 'hs-hide-hook)))

(global-set-key (kbd "C-?") 'hs-hide-all-comments)
(global-set-key (kbd "C->") 'hs-show-all)


; use context line break in c modea
(defun my-c-initialization-hook ()
  (define-key c-mode-base-map "\C-m" 'c-context-line-break))
(add-hook 'c-initialization-hook 'my-c-initialization-hook)


;; useful for viewing dat files (exported from db).
(defun dat-mode ()
  "Setup csv mode to work with an exported .dat file from Xentis"
  (interactive)
 (csv-mode)
 (csv-align-fields nil 1 12217)
 (toggle-truncate-lines nil)
)
