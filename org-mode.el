;; -------------
;; agenda stuff.
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(add-hook 'org-mode-hook 'auto-fill-mode)
(setq org-clock-into-drawer 1)
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
(setq org-log-done t)
(setq org-export-with-sub-superscripts nil)
(setq org-global-properties
      '((Effort 1 2)))


(setq org-columns-default-format "%50ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")
(setq org-agenda-columns-add-appointments-to-effort-sum t)


;;--------------------------------------------
;; org latex configuration:
;(require 'org-latex)
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))
(add-to-list 'org-export-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(setq org-todo-keywords
      '((sequence "TODO(t)" "ACTIVE(a)" "|" "DONE(d!)" )
		(sequence "IMPLEMENT" "TEST" "REVIEW" "|" "PUSHED")
		(sequence "INVESTIGATE" "PROPOSE" "IMPLEMENT" "|" "TASKED" "DONE")
		))

;;---------------------------
;; Code snippets and unicode:
;;---------------------------

(delete "inputenc" org-latex-default-packages-alist)
(delete "fontspec" org-latex-default-packages-alist)

;; minted for highlighting, fontspec for unicode fonts
(setq org-latex-packages-alist (quote (("" "minted" t) ("" "fontspec" nil))))

;; fontify code in code blocks
(setq org-src-fontify-natively t)

;; latex-export to use the minted package for syntax highlighting
(setq org-latex-listings 'minted)

;; minted needs xelated to use -shell-escape.  Dangerous!
(setq org-latex-pdf-process
	  '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; I want my catptions below.
(setq org-latex-table-caption-above nil)

;; workaround for tabs.
(setq org-src-preserve-indentation t)

(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

;;----
;; Effort estimates
(setq org-global-properties '(("Effort_ALL". "0:15 0:30 1:00 2:00 4:00 6:00 8:00 16:00 24:00")))

;;-------------------------
;; I want todo lists to show only UNSCHEDULED todo items:s
(setq org-agenda-todo-ignore-with-date t)

;; -------------------------
;; time reporting
(defun gas-clock-report (&optional arg)
  "Create a table containing a report about clocked time."
  (interactive)
  (push-mark)
  (insert "#+BEGIN: clocktable :maxlevel 5 :scope agenda  :block ")
  (insert (org-read-date))
  (insert " :link")
  (insert "\n#+END")
  (move-beginning-of-line nil)
  (org-dblock-update)
  )


;; -------------
;; Babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((gnuplot . t)
   (C . t)
   ))


;; fontify code in code blocks
(setq org-src-fontify-natively t)

;; org-export should use minted:
(setq org-latex-listings 'minted)

;; Let the exporter use the -shell-escape option to let latex
;; execute external programs.
;; This obviously and can be dangerous to activate!
(setq org-latex-pdf-process
      '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;;; Where I keep my org files.
(add-to-list 'org-agenda-files (expand-file-name "~/orgs"))

(provide 'glen-org-stuff)
