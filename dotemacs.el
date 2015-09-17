;;; .emacs -- my .emacs

;;; Commentary:
;; Define my custom elisp location, and load the common init.

; this is added by package.el
(package-initialize)

(defvar personal-project-path "~/repos/glens_elisp")
(add-to-list 'load-path  personal-project-path )
(load "common-init.el")
(load "devel-stuff.el")
(load "org-mode.el")
(load "keybindings.el")
(load "refactoring.el")

;;  I share my emacs location among multiple machines.
;;  At work I need a certain configuration,
;;  I prefer a different one at home and on my private laptop.
;;  I currenlty find the simplest solution to maintain location
;;  specific stuff in a seprate file, and symbolically link it
;;  to "location_specific.el".
(load "location_specific.el")
