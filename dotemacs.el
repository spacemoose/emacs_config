;; Define my custom elisp location, and load the common init.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
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
