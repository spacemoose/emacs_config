;; Gives us a  pretty good approximation of the crappy auto-formatter
;; that was set up in Eclipse.
;;
;; I didn't put in enforcement for the most awful crap the formatter
;; did.  I think there the solution is to fix the Eclipse settings.

(setq compile-command "ssh pdxenlin66 \"gmake -j16 ~/per_branch_clones/5.2.0/eamis/ | sed s/~//\"")
(setq c-default-style "linux")
(setq-default c-basic-offset 4
			  tab-width 4
			  indent-tabs-mode t)

(defun my-indent-setup ()
  (c-set-offset 'arglist-cont-nonempty '+) ; one indent level on contining long arglist.
  (c-set-offset 'innamespace 0)            ; don't indent in namespace.
  (c-set-offset 'inline-open 0)            ; don't indent inlined {'s
  (c-set-offset 'case-label '+)            ; indent cases in switch statement
  )

(add-hook 'c++-mode-hook 'my-indent-setup)

; All these should go in one c-mode common hook statement.
(add-hook 'c-mode-common-hook 'subword-mode) ; camel case support
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1) )))

(setq compile-command "ssh pdxenlin66 \"build500\"")

;; support our wierd extensions.
;(setq auto-mode-alist(cons '("\\.h$"   . c++-mode)  auto-mode-alist)) ;; .h are also c++
(add-to-list 'auto-mode-alist '("\\.h$"   . c++-mode))
(add-to-list 'auto-mode-alist '("\\.boh\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.boc\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.pc\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.ph\\'" . c++-mode))
