(global-font-lock-mode t)
(normal-erase-is-backspace-mode 0)
(menu-bar-mode 0)
(transient-mark-mode 1)
(setq x-alt-keysym 'meta)
(setq x-meta-keysym 'alt)
;;(global-set-key [ (control *) ] 'goto-line)
(global-set-key "\C-cu" 'uncomment-region)
(global-set-key "\C-cc" 'comment-region)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-s" 'spell-word)
(defun yes-or-no-p (arg) (y-or-n-p arg))
;;(global-set-key "\C-M-5" 'query-replace-regexp)
;;(defun up-slightly () (interactive) (previous-line))
;;(defun up-slightly () (interactive) (previous-line) (previous-line) (previous-line) (previous-line) (previous-line))
;;(global-set-key "\M-z" 'bury-buffer)

(setq require-final-newline nil)
(setq bell-volume 0)
(setq sound-alist nil)

(put 'narrow-to-region 'disabled nil)
(setq dired-listing-switches "-lB")
;;(setq 'list-directory "-CFB")
;;(setq list-directory "-CFB")
;; (setq 'list-directory -CFB)
;; (setq list-directory -CFB)
;; (setq 'list-directory '-CFB')
;; (setq list-directory '-CFB')

;; (global-set-key "^[^[OA" 'up-slightly)                                                                                                                               
;; (global-set-key "^[^[OB" 'down-slightly)                                                                                                                             
;; (global-set-key "^[^[OC" 'forward-sentence)                                                                                                                          
;; (global-set-key "^[^[OD" 'backward-sentence)                                                                                                                       


(global-set-key "[5B" 'backward-paragraph)
(global-set-key "[5A" 'forward-paragraph)
(global-set-key "O5A" 'backward-paragraph)
(global-set-key "O5B" 'forward-paragraph)
(global-set-key "[1;5A" 'backward-paragraph)
(global-set-key "[1;5B" 'forward-paragraph)


(global-set-key "O5C" 'forward-word)
(global-set-key "O5D" 'backward-word)
(global-set-key "[5C" 'forward-word)
(global-set-key "[5D" 'backward-word)
(global-set-key "[1;5C" 'forward-word)
(global-set-key "[1;5D" 'backward-word)

(line-number-mode t)
(column-number-mode t)


;; (copy-face  'default 'font-lock-comment-face)
;; (set-face-foreground 'font-lock-comment-face "red")
;; (copy-face  'default 'font-lock-function-name-face)
;; (set-face-foreground 'font-lock-function-name-face "green")
;; (copy-face  'default 'font-lock-keyword-face)
;; (set-face-foreground 'font-lock-keyword-face "Orchid")
;; (copy-face  'default 'font-lock-reference-face)
;; (set-face-foreground 'font-lock-reference-face "VioletRed")
;; (copy-face  'default 'font-lock-string-face)
;; (set-face-foreground 'font-lock-string-face "Green")
;; (copy-face  'default 'font-lock-doc-string-face)
;; (set-face-foreground 'font-lock-doc-string-face "red")
;; (copy-face  'default 'font-lock-type-face)
;; (set-face-foreground 'font-lock-type-face "red")
;; (copy-face  'default 'font-lock-variable-name-face)
;; (set-face-foreground 'font-lock-variable-name-face "black")


;;This is for xml syntax coloring why we need all this jazz ??

;; load sgml-mode
(autoload 'sgml-mode "psgml" "Major mode to edit SGML files." t )
;; in sgml documents, parse dtd immediately to allow immediate
;; syntax coloring
(setq sgml-auto-activate-dtd t)
;; here we set the syntax color information for psgml
(setq-default sgml-set-face t)
;;
;; Faces.
;;
(make-face 'sgml-comment-face)
(make-face 'sgml-doctype-face)
(make-face 'sgml-end-tag-face)
(make-face 'sgml-entity-face)
(make-face 'sgml-ignored-face)
(make-face 'sgml-ms-end-face)
(make-face 'sgml-ms-start-face)
(make-face 'sgml-pi-face)
(make-face 'sgml-sgml-face)
(make-face 'sgml-short-ref-face)
(make-face 'sgml-start-tag-face)
(set-face-foreground 'sgml-comment-face "red")
(set-face-foreground 'sgml-doctype-face "dark turquoise")
(set-face-foreground 'sgml-end-tag-face "blue")
(set-face-foreground 'sgml-entity-face "magenta")
(set-face-foreground 'sgml-ignored-face "gray40")
(set-face-background 'sgml-ignored-face "gray60")
(set-face-foreground 'sgml-ms-end-face "green")
(set-face-foreground 'sgml-ms-start-face "yellow")
(set-face-foreground 'sgml-pi-face "lime green")
(set-face-foreground 'sgml-sgml-face "brown")
(set-face-foreground 'sgml-short-ref-face "deep sky blue")
(set-face-foreground 'sgml-start-tag-face "dark green")
(setq-default sgml-markup-faces'((comment . sgml-comment-face)
				 (doctype . sgml-doctype-face)
				 (end-tag . sgml-end-tag-face)
				 (entity . sgml-entity-face)
				 (ignored . sgml-ignored-face)
				 (ms-end . sgml-ms-end-face)
				 (ms-start . sgml-ms-start-face)
				 (pi . sgml-pi-face)
				 (sgml . sgml-sgml-face)
				 (short-ref . sgml-short-ref-face)
				 (start-tag . sgml-start-tag-face)))
;; load xml-mode 
(setq auto-mode-alist
      (append (list (cons "\\.xml\\'" 'xml-mode))auto-mode-alist))
(autoload 'xml-mode "psgml" nil t)
(setq sgml-xml-declaration "C:/Programs/jade/xml.dcl")      


;; define html mode
;;(or (assoc "\\.html$" auto-mode-alist)
;;    (setq auto-mode-alist 
;;  (cons '("\\.html$" . sgml-html-mode)auto-mode-alist)))
;;(or (assoc "\\.htm$" auto-mode-alist)
;;    (setq auto-mode-alist 
;;  (cons '("\\.htm$" . sgml-html-mode)auto-mode-alist)))
;;
;;(defun sgml-html-mode ()
;;  "This version of html mode is just a wrapper around sgml mode."
;;  (interactive)
;;  (sgml-mode)
;;  (make-local-variable 'sgml-declaration)
;;  (make-local-variable 'sgml-default-doctype-name)
;;  (setq 
;;   sgml-default-doctype-name    "html"
;;   sgml-declaration             "d:/usr/local/jade/pubtext/html.dcl"
;;   sgml-always-quote-attributes t
;;   sgml-indent-step             2
;;   sgml-indent-data             t
;;   sgml-minimize-attributes     nil
;;   sgml-omittag                 t
;;   sgml-shorttag                t))
;;
;;(setq-default sgml-indent-data t)
;;(setq 
;; sgml-always-quote-attributes   t
;; sgml-auto-insert-required-elements t
;; sgml-auto-activate-dtd         t
;; sgml-indent-data               t
;; sgml-indent-step               2
;; sgml-minimize-attributes       nil
;; sgml-omittag                   nil
;; sgml-shorttag                  nil)


;;----------------------------------------------------------------------------
;; DTD mode
;;(autoload 'dtd-mode "tdtd" "Major mode for SGML and XML DTDs." t)
;; Turn on font lock when in DTD mode
;;(add-hook 'dtd-mode-hooks
;;  'turn-on-font-lock)

;; Start DTD mode for editing SGML-DTDs
(autoload 'dtd-mode "tdtd" "Major mode for SGML and XML DTDs.")
(autoload 'dtd-etags "tdtd"
  "Execute etags on FILESPEC and match on DTD-specific regular expressions."t)
(autoload 'dtd-grep "tdtd" "Grep for PATTERN in files matching FILESPEC." t)
;; Turn on font lock when in DTD mode
(add-hook 'dtd-mode-hooks
	  'turn-on-font-lock)
(setq auto-mode-alist(
		      append(
			     list
			     '("\\.dcl$" . dtd-mode)
			     '("\\.dec$" . dtd-mode)
			     '("\\.dtd$" . dtd-mode)
			     '("\\.ele$" . dtd-mode)
			     '("\\.ent$" . dtd-mode)
			     '("\\.mod$" . dtd-mode)) 
		      auto-mode-alist))

(add-hook 'write-file-hooks 'time-stamp)



;; ;; cscope
;; (setq cscope-do-not-update-database t)
;; (require 'xcscope)
;; (load-file "/usr/share/emacs/site-lisp/xcscope.el")
;; ;;(load-file "/usr/share/emacs/site-lisp/xcscope.el")

;; ;;ctags
;; (require 'etags)

;;make commented regions red for mac
(custom-set-faces
  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(comint-highlight-prompt ((t (:foreground "blue" :weight bold :height 1.2))))
 '(custom-comment-tag-face ((((class color) (background light)) (:foreground "blue4" :weight bold :height 1.2))))
 '(font-lock-builtin-face ((((type tty) (class color)) (:foreground "blue" :weight bold :height 1.2))))
 '(font-lock-comment-face ((((class color) (background light)) :foreground "red")))
 '(gnus-summary-low-ancient-face ((t (:foreground "RoyalBlue" :slant italic :weight bold :height 1.2))))
 '(gnus-summary-normal-ancient-face ((((class color) (background light)) (:foreground "RoyalBlue" :weight bold :height 1.2))))
 '(message-header-cc-face ((((class color) (background light)) (:foreground "MidnightBlue" :weight bold :height 1.2))))
 '(message-header-xheader-face ((((class color) (background light)) (:foreground "blue" :weight bold :height 1.2))))
 '(sgml-end-tag-face ((t (:foreground "blue" :weight bold :height 1.2))))
 '(speedbar-directory-face ((((class color) (background light)) (:foreground "blue4" :weight bold :height 1.2)))))
(set-face-foreground 'minibuffer-prompt "white")



;; (load-file "/cluster/home/griffith/.linum.el")
;; (global-linum-mode t)
;; (custom-set-variables '(linum-format (quote "%3d ")))
;; (put 'upcase-region 'disabled nil)

(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 )
