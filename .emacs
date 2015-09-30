;; Set the debug option to enable a backtrace when a
;; problem occurs.
(setq make-backup-files nil)
;; Do not use tabs to indent
(setq-default indent-tabs-mode nil)
;; default context folder
(setq default-directory "~/")
;; tab is 4 spaces 
(setq c-basic-offset 4)

;; hide toolbar as it only takes up space and i do not use it.
(tool-bar-mode -1)

;; save a list of open files in ~/.emacs.desktop
;; save the desktop file automatically if it already exists
(desktop-save-mode 1)

;; need to set this before loading everything. otherwise semantic complains
(setq semantic-load-turn-everything-on t)

;; Key bindings for changing the font size.
;; From sacha chua
(defun sacha/increase-font-size ()
  (interactive)
  (set-face-attribute 'default
                      nil
                      :height
                      (ceiling (* 1.10
                                  (face-attribute 'default :height)))))
(defun sacha/decrease-font-size ()
  (interactive)
  (set-face-attribute 'default
                      nil
                      :height
                      (floor (* 0.9
                                  (face-attribute 'default :height)))))

(global-set-key (kbd "C-+") 'sacha/increase-font-size)
(global-set-key (kbd "C--") 'sacha/decrease-font-size)

;; Defualt font size
(set-face-attribute 'default nil :height 100)

;; Global loadpath
(add-to-list 'load-path "~/.emacs-site")

;; start jdee
;;(add-to-list 'load-path (expand-file-name "/home/dimperial/.emacs-site/jde/lisp"))
;;(add-to-list 'load-path (expand-file-name "/home/dimperial/.emacs-site/cedet/common"))
;;(add-to-list 'load-path (expand-file-name "/home/dimperial/.emacs-site/elib"))

;;(load-file (expand-file-name "~/.emacs-site/cedet/common/cedet.el"))

;;(setq defer-loading-jde t)
;;(if defer-loading-jde
;;    (progn
;;      (autoload 'jde-mode "jde" "JDE mode." t)
;;      (setq auto-mode-alist
;;	    (append
;;	     '(("\\.java\\'" . jde-mode))
;;	     auto-mode-alist)))
;;  (require 'jde))

;;(setq jde-web-browser "firefox")

;;end jdee

;; php-mode
;;(add-to-list 'load-path (expand-file-name "/home/sg0208824/.emacs-site/groovy-mode"))
;;(setq auto-mode-alist (cons '("\.groovy$" . groovy-mode) auto-mode-alist))
;;(require 'groovy-mode)
;;(add-to-list 'load-path (expand-file-name "/home/dimperial/.emacs-site/php-mode"))
;;(setq defer-loading-php t)
;;(if defer-loading-php
;;    (progn
;;      (autoload 'php-mode "php-mode" "PHP mode." t)
;;      (setq auto-mode-alist
;;	    (append
;;             '(("\\.php\\'" . php-mode))
;;             auto-mode-alist)))
;;      (require 'php-mode))

;; semantic cache folder
;;(setq semanticdb-default-save-directory "~/.semantic.cache")

;; Syntax checker for PHP.
(require 'flymake)
;; Limit to checking 8 files in parallel to speed up startup when multiple PHP buffers are open.
(setq flymake-max-parallel-syntax-checks 8)
;; Where to save temporary copies of the files being checked.
(setq flymake-run-in-place nil)
(setq temporary-file-directory "/tmp/")
;; How many errors to show in the tooltip per line.
(setq flymake-number-of-errors-to-display 4)
;; Only on PHP files
(add-to-list 'flymake-allowed-file-name-masks '("\\.php$" flymake-php-init))
;; enable flymake minor mode when using php-mode
;; END PHP stuff


;; Auto load java mode for .java files
;;(setq auto-mode-alist (cons '("\.java$" . jde-mode) auto-mode-alist))
;;(require 'php-mode)
;;(setq auto-mode-alist (cons '("\.ctp$" . html-mode) auto-mode-alist))
;; Auto load perl mode for .php files
;; (setq auto-mode-alist (cons '("\.php$" . php-mode) auto-mode-alist))

;; Emmet mode for https://github.com/smihica/emmet-mode
;; For zen coding html
(require 'emmet-mode)

(defun zen-coding-on ()
  (interactive)
  (emmet-mode))

(defun zen-coding-off ()
  (interactive)
  (emmet-mode 0))

;; Web mode for all web type files.
(require 'web-mode)
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  ;; HTML indent
  (setq web-mode-markup-indent-offset 4)
  ;; CSS indent
  (setq web-mode-css-indent-offset 4)
  ;; Javascript, PHP, Java, etc. indent.
  (setq web-mode-code-indent-offset 4)

  ;; Turn on flymake minor mode if editing a php file
  (when (and (stringp buffer-file-name)
             (string-match "\\.php\\'" buffer-file-name))
    (flymake-mode)
    ))  

(add-hook 'web-mode-hook  'my-web-mode-hook)
(setq auto-mode-alist (cons '("\.php$" . web-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\.erb$" . web-mode) auto-mode-alist))


;; Use ruby mode for rake files.
(setq auto-mode-alist (cons '("\.rake$" . ruby-mode) auto-mode-alist))

;; Go lang
(require 'go-mode-autoloads)

;; Autocomplete
(add-to-list 'load-path "~/.emacs-site/auto-complete")
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs-site/auto-complete/ac-dict")
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

;; Tramp for remote file editing
;;(add-to-list 'load-path (expand-file-name "/home/dimperial/.emacs-site/tramp/lisp"))
;;(require 'tramp)
;;(setq tramp-default-method "scp")

;;(add-to-list 'load-path (expand-file-name "/home/dimperial/.emacs-site/psvn"))
;;(require 'psvn)

;; Spell check outgoing messages
;;(add-hook 'message-send-hook 'ispell-message)
;; Wrapper for sending mail via ssmtp
;;(defun smtps-smtpmail-send-it ()
;;  (let* ((smtpmail-smtp-server "mail.emailhost.com")
;;         (smtpmail-smtp-service 465)
;;         (user-mail-address "user@emailhost.com")
;;         (smtps-login "user@emailhost.com")
;;         (smtps-mail-password "password_here")
;;         (smtpmail-auth-credentials
;;          `((,smtpmail-smtp-server
;;             ,smtpmail-smtp-service
;;             ,smtps-login
;;             ,smtps-mail-password))
;;          ))
;;    (require 'tls)
;;    (flet ((open-network-stream
;;            (name buffer host service)
;;            (progn
;;              (let ((process (open-tls-stream name buffer host service)))
;;                (with-current-buffer (process-buffer process)
;;                  (goto-char (point-min))
;;                  ;; gnutls-cli puts text in the process buffer that
;;                  ;; confuses smtpmail-read-response, so delete
;;                  ;; everything up to what looks like an SMTP
;;                  ;; response.
;;                  (if (re-search-forward "^[0-9][0-9][0-9] " nil t)
;;                      (delete-region (point-min) (match-beginning 0))))
;;                process))))
;;      (smtpmail-send-it))))

;;(custom-set-variables
;;  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
;; '(jde-global-classpath (quote ("/home/dimperial/Source/projects/akonix/trunk/rover/9.0.0/gateway/src/main/java")))
;; '(jde-jdk (quote ("1.6.0_16")))
;; '(jde-jdk-registry (quote (("1.6.0_16" . "$JAVA_HOME")))))

;;(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
;; )

;;(put 'upcase-region 'disabled nil)

;; Indentation for org-mode
(setq org-startup-indented t)

;; Emacs-Eclim
;;(add-to-list 'load-path (expand-file-name "~/.emacs-site/emacs-eclim/"))
;; only add the vendor path when you want to use the libraries provided with emacs-eclim
;;
;;(add-to-list 'load-path (expand-file-name "~/.emacs-site/emacs-eclim/vendor"))
;;(require 'eclim)
;;(setq eclim-auto-save t)
;;(global-eclim-mode)

;; Lua mode
;;(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
;;(add-to-list 'auto-mode-alist '("\.lua$" . lua-mode))
;;(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;; Haskell mode
;;(load "~/.emacs-site/haskell-mode/haskell-site-file")
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-to-list 'auto-mode-alist '("\.hs$" . haskell-mode))

;; org-mode
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; global todo lists
(setq org-agenda-files (list "~/Documents/todos/work.org"
                             "~/Documents/todos/home.org"
                             "~/Documents/todos/improvement.org"
                             ))
;; Remote debugger.
(add-to-list 'load-path (expand-file-name "~/.emacs-site/geben"))
(require 'geben)

;; Emacs for clojure configuration pulled from https://github.com/flyingmachine/emacs-for-clojure
;; Define package repositories
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

;; The packages you want installed. You can also install these
;; manually with M-x package-install
;; Add in your own as you wish:
(defvar my-packages
  '(;; makes handling lisp expressions much, much easier
    ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
    paredit

    ;; key bindings and code colorization for Clojure
    ;; https://github.com/clojure-emacs/clojure-mode
    clojure-mode

    ;; extra syntax highlighting for clojure
    clojure-mode-extra-font-locking

    ;; integration with a Clojure REPL
    ;; https://github.com/clojure-emacs/cider
    cider

    ;; allow ido usage in as many contexts as possible. see
    ;; customizations/navigation.el line 23 for a description
    ;; of ido
    ido-ubiquitous

    ;; Enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    smex

    ;; project navigation
    projectile

    ;; colorful parenthesis matching
    rainbow-delimiters

    ;; edit html tags like sexps
    tagedit

    ;; git integration
    magit))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.el")

;; For editing lisps
(load "elisp-editing.el")

;; Langauage-specific
(load "setup-clojure.el")
(load "setup-js.el")
;; End emacs for clojure configuration

;; Python
(setq py-install-directory "~/.emacs-site/python-mode")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)

;; use IPython
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")
;; use the wx backend, for both mayavi and matplotlib
(setq py-python-command-args
  '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
(setq py-force-py-shell-name-p t)

;; switch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)
;; don't split windows
(setq py-split-windows-on-execute-p nil)
;; try to automagically figure out indentation
(setq py-smart-indentation t)

(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell)

;; For jinja template editing.
(require 'jinja2-mode)

;; Fonts and faces for emacs23
;;(custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file sh	ould contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;; )
;;(custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;; '(default ((t (:inherit nil :stipple nil :background "black" :foreground "grey" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

;; In emacs24 we use a theme instead of the above
(load-theme 'wombat t)

