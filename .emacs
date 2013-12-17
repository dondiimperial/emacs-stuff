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

;; Auto load java mode for .java files
;;(setq auto-mode-alist (cons '("\.java$" . jde-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\.ctp$" . html-mode) auto-mode-alist))
;; Auto load perl mode for .php files
(setq auto-mode-alist (cons '("\.php$" . php-mode) auto-mode-alist))

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
;; Fonts and faces for emacs23
;;(custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
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
