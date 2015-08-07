(global-set-key (kbd "C-\+") 'zoom-frm-in)
(global-set-key (kbd "C-\-") 'zoom-frm-out)
(global-set-key (kbd "C-x f") 'helm-projectile-find-file)
(global-set-key [\M-up] 'beginning-of-defun)
(global-set-key [\M-down] 'end-of-defun)


;(global-set-key (kbd "M-j") 'semantic-ia-fast-jump)

(global-set-key (kbd "M-n") 'flycheck-next-error)
(global-set-key (kbd "M-p") 'flycheck-previous-error)



;;-------------------
;; whack whitespace
(defun ww (arg)
  "Delete all white space from point to next world.  With arg, do across newlines."
  (interactive "P")
  (let ((regexp (if arg "[ \t\n]+" "[ \t\n]+")))
    (re-search-forward regexp nil t)
    (replace-match "" nil nil)))

(global-set-key [M-kp-decimal] 'whack-whitespace )
(global-set-key "\C-z" 'ww);; make minimize key whack whitespace instead.
