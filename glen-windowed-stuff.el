;; this provides stuff that only should be initialized if we are using
;; emacs in windowed mode -- speed up nw stuff.

; Make new frames fullscreen by default. Note: this hook doesn't do
; anything to the initial frame if it's in your .emacs, since that
; file is read _after_ the initial frame is created.
(add-hook 'after-make-frame-functions 'toggle-fullscreen)
(tool-bar-mode 1)


(require 'glen-latex-stuff)
(require 'glen-org-stuff)


;;------------------------------
;; semantic and auto complete
;; (add-to-list 'load-path "/home/stark/.emacs.d/elpa/auto-complete-20130724.1750")
;; (add-to-list 'load-path "/home/stark/.emacs.d/elpa/popup-20130324.1305")
;; (require 'auto-complete)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
;; (require 'auto-complete-config)
;; (ac-config-default)
;; (add-hook 'c++-mode (lambda () (add-to-list 'ac-sources 'ac-source-semantic)))
;; (global-set-key (kbd "M-\\") 'ac-complete-semantic)
