(setq trx-keywords
	  '(
		("^001 10B6.*" . font-lock-constant-face)
		("^001 1083.*" . font-lock-comment-face)
		("" . font-lock-function-name-face)
		)
	  )

(define-derived-mode trx-mode fundamental-mode
  (setq font-lock-defaults '(trx-keywords))
  (setq mode-name "trx  mode")
)
