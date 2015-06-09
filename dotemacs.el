;; Define my custom elisp location, and load the common init.
(defvar personal-project-path "~/repos/personal_work/emacs")
(add-to-list 'load-path  personal-project-path )
(load "common-init.el")
(load "devel-stuff.el")
(load "org-mode.el")
(load "keybindings.el")
(load "refactoring.el")
(load "xentis.el")

(require 'semantic)
(require 'semantic/bovine/gcc)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
;(add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode)
(semantic-mode 1)
(global-ede-mode t)
(ede-enable-generic-projects)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(csv-separators (quote (";" "	")))
 '(custom-safe-themes
   (quote
	("1db337246ebc9c083be0d728f8d20913a0f46edc0a00277746ba411c149d7fe5" "d6e27431f8cafb4a9136aebb1d4061f895b120bf88d34ff60c390d9905bd4e36" "758da0cfc4ecb8447acb866fb3988f4a41cf2b8f9ca28de9b21d9a68ae61b181" "4eaad15465961fd26ef9eef3bee2f630a71d8a4b5b0a588dc851135302f69b16" "9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" default)))
 '(fci-rule-color "#383838")
 '(flycheck-clang-language-standard "c++11")
 '(org-confirm-babel-evaluate nil)
 '(org-src-xfontify-natively t)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
	((20 . "#BC8383")
	 (40 . "#CC9393")
	 (60 . "#DFAF8F")
	 (80 . "#D0BF8F")
	 (100 . "#E0CF9F")
	 (120 . "#F0DFAF")
	 (140 . "#5F7F5F")
	 (160 . "#7F9F7F")
	 (180 . "#8FB28F")
	 (200 . "#9FC59F")
	 (220 . "#AFD8AF")
	 (240 . "#BFEBBF")
	 (260 . "#93E0E3")
	 (280 . "#6CA0A3")
	 (300 . "#7CB8BB")
	 (320 . "#8CD0D3")
	 (340 . "#94BFF3")
	 (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :stipple nil :background "#eeeeec" :foreground "#2e3436" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 110 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
;;  '(font-lock-constant-face ((t (:foreground "#204a87" :weight bold :height 1.0))))
;;  '(font-lock-function-name-face ((t (:foreground "#a40000" :weight normal :height 1.3))))
;;  '(org-document-title ((t (:foreground "midnight blue" :weight bold :height 2.0))))
;;  '(org-level-1 ((t (:inherit outline-1 :height 1.25))))
;;  '(org-level-2 ((t (:inherit outline-2 :height 1.25)))))
