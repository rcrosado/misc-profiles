(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq TeX-save-query nil)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-reftex)   ; with Emacs latex mode

(defun turn-on-outline-minor-mode ()
(outline-minor-mode 1))

(add-hook 'LaTeX-mode-hook 'turn-on-outline-minor-mode)
(add-hook 'latex-mode-hook 'turn-on-outline-minor-mode)

(require 'ess-site)

;;
;; TeXcount setup for TeXcount version 2.3 and later
;;
(defun texcount ()
  (interactive)
  (let*
    ( (this-file (buffer-file-name))
      (enc-str (symbol-name buffer-file-coding-system))
      (enc-opt
        (cond
          ((string-match "utf-8" enc-str) "-utf8")
          ((string-match "latin" enc-str) "-latin1")
          ("-encoding=guess")
      ) )
      (word-count
        (with-output-to-string
          (with-current-buffer standard-output
            (call-process "texcount" nil t nil "-brief" enc-opt this-file)
    ) ) ) )
    (message word-count)
) )
(add-hook 'LaTeX-mode-hook (lambda () (define-key LaTeX-mode-map "\C-cw" 'texcount)))
(add-hook 'latex-mode-hook (lambda () (define-key latex-mode-map "\C-cw" 'texcount)))

(defun toggle-fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
)
(toggle-fullscreen)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(fill-column 80)
 '(outline-minor-mode-prefix "")
 '(tab-stop-list (quote (4 8 16 24 32 40 48 56 64 72 80 88 96 104 112 120))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
; set show-trailing-whitspaces in markdown-mode                                                     
(add-hook 'markdown-mode-hook 'show-ws-toggle-show-trailing-whitespace)
