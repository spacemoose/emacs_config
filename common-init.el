(setq inhibit-splash-screen t)
(setq vc-follow-symlinks t) ;; don't prompt me to follow symlinks

(show-paren-mode 1)
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

;;(nlinum-mode 1)
(put 'upcase-region 'disabled nil)

;; enable melpa packages.
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; Re-enable some stuff that's disabled.
(put 'downcase-region 'disabled nil)

;;--------------------
;; dired
;; Configure dired not to show hidden files.
(add-hook 'dired-load-hook
          (lambda ()
            (load "dired-x")
            ;; Set dired-x global variables here.  For example:
            ;; (setq dired-guess-shell-gnutar "gtar")
            ;; (setq dired-x-hands-off-my-keys nil)
            ))
(add-hook 'dired-mode-hook
          (lambda ()
            ;;Set dired-x buffer-local variables here.  For example:
            (dired-omit-mode 1)
            ))

;; -----------------------------------
;; BACKUPS
;;------------------------------------
; TODO This still needs work.  don't want .emacs saves everywhere I
; run emacs.
(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist '(("" . ".emacs-saves"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups


;; Where should this go?
(defun get-all-subdirectories(dir-list)
  "Returns a list of all recursive subdirectories of dir-list,
   ignoring directories with names that start with . (dot)"
  (split-string
   (shell-command-to-string
     (concat "find "
             (mapconcat 'identity dir-list " ")
             " -type d -not -regex \".*/\\\..*\""))))
