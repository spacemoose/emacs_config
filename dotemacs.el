;;; .emacs -- my .emacs

;;; Commentary:
;; Define my custom elisp location, and load the common init.

(package-initialize)

(defvar personal-project-path "~/repos/glens_elisp")
(add-to-list 'load-path  personal-project-path )
(load "common-init.el")
(load "devel-stuff.el")
(load "org-mode.el")
(load "keybindings.el")
(load "refactoring.el")
(load "xentis.el")

;(require 'semantic)
;(require 'semantic/bovine/gcc)
;; (add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)
;; ;
(semantic-mode 1)
;(global-ede-mode t)
;(ede-enable-generic-projects)


(define-fringe-bitmap 'custom-hollow-right-arrow [128 192 96 48 24 48 96 192 128] 15 8 'center)

(put 'overlay-arrow-position 'overlay-arrow-bitmap 'custom-hollow-right-arrow)

(provide 'dotemacs)
;;; dotemacs.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("c3e6b52caa77cb09c049d3c973798bc64b5c43cc437d449eacf35b3e776bf85c" "1db337246ebc9c083be0d728f8d20913a0f46edc0a00277746ba411c149d7fe5" "70f5a47eb08fe7a4ccb88e2550d377ce085fedce81cf30c56e3077f95a2909f2" "0155b3b94f6d5bce0275a15bc662be4f6f9f3284f9e469ca4ab1bd67ff9b5222" "acca0c2fbc4cb3b9f19d976c3547cbb99691b5fd402788589162b367f0814b08" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-function-name-face ((t (:weight bold :height 1.25)))))
