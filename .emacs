;; -----------------------------------------------
;; $HOME/.emacs from Thinkpad T60p - Debian Buster
;; GNU Emacs 26.1 - emacs-nox      1:26.1+1-3.2+deb10u1
;; -----------------------------------------------

;; -----------------------------------------------
;; Some defaults
(setq inhibit-startup-message t)
(setq default-major-mode 'text-mode)
(menu-bar-mode -1)
(setq bell-volume 100)
(setq visible-bell t)

;; -----------------------------------------------
;; Modeline customization
;; (display-time) ;; No need for this if you have a working clock somewhere
(setq line-number-mode t)
(setq column-number-mode t)

;; -----------------------------------------------
;; Keyboard shortcuts
(define-key global-map "\C-h" 'backward-delete-char)
(define-key global-map "\M-h" 'backward-kill-word)
(define-key global-map "\C-x\C-u" 'undo)
(global-set-key [f5] 'bury-buffer)

;; Esc + the arrow keys as a way to delete words
(define-key esc-map [right] 'kill-word)         ;; esc -> kill-word
(define-key esc-map [left] 'backward-kill-word) ;; esc <- backward-kill-word

;; -----------------------------------------------
;; Backups
;; -----------------------------------------------
;; Non-versioning:
;; --------------
;; (defun make-backup-file-name (file-name)
;;   "Create the non-numeric backup file name for `file-name'."
;;   (require 'dired)
;;   (if (file-exists-p "~/Emacs/Backups")
;;       (concat (expand-file-name "~/Emacs/Backups/")
;;       (dired-replace-in-string "/" "|" file-name))
;;       (concat file-name "~")))

;; Versioning:
;; ----------
;; Save all the backups on one place and also make versioned (numbered) backup copies
;; Use this on non SSD setups
;; https://emacs.stackexchange.com/questions/13993/version-control-using-the-usual-backup-system-of-emacs
(setq backup-directory-alist '(("." . "~/Emacs/Backups"))
      version-control 'numbered
      make-backup-files t
      delete-old-versions 'never)

;; -----------------------------------------------
;; Insert timestamp
(defvar insert-time-format "%T")

(defvar insert-date-format "%d %m %Y"
  "*Format for \\[insert-date] (c.f. 'format-time-string' for how to format).")

(defun iTime ()
  (interactive "*")
  (insert (format-time-string insert-time-format
                                    (current-time))))
(defun iDate ()
  (interactive "*")
  (insert (format-time-string insert-date-format
                                    (current-time))))
(defun iDate ()
  (interactive "*")
  (insert (format-time-string insert-date-format
                                    (current-time))))
(defun iDateTotal ()
  (interactive "*")
  (progn
    (iDate)
    (insert " ")
    (iTime)))

;; -----------------------------------------------
;; Abreviaciones
(setq-default abbrev-mode t)
(read-abbrev-file "~/Emacs/Defs_Abrevs.txt")
(setq save-abbrevs t)

;; Returns the cursor point to the beggining of the abrev
;; De: http://arstechnica.infopop.net/OpenTopic/page?a=tpc&s=50009562&f=96509133&m=1050920535
(defun abr-back ()
   "move abbrev cursor position back to [/"
   (search-backward "[/")
   (put no-self-insert t)
)

;; -----------------------------------------------
;; Turn on color syntax ;;
(global-font-lock-mode t)

;; -----------------------------------------------
;; Loads the path to the installed lisp programs ;;
(setq load-path (cons  "~/Emacs/Lisp/" load-path))

;; Higlight the whole line where the cursor is
;; (global-hl-line-mode t)

(blink-cursor-mode 0)
(setq visible-cursor nil)

;; Artist.el - Allows to draw using ASCII art
(autoload 'artist-mode "artist" "Enter artist-mode" t)

;; Setnu - Adds line numbering
(autoload 'setnu-mode  "setnu" "Buffer Line Numbering" t)
(defun turn-on-setnu-mode ())

;; IOS mode - Useful to edit Cisco configuration files
;; http://nibrahim.net.in/software/
(autoload 'ios-config-mode "ios-config-mode" "Enter IOS-mode" t)

;; HTML Helper mode
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.htm$" . html-helper-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.php$" . html-helper-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.vxml$" . html-helper-mode) auto-mode-alist))

;; Adds an HTML template
(setq html-helper-build-new-buffer t)

;; Adds HTML syntax color, uses "html-font.el"
(add-hook 'html-helper-load-hook '(lambda () (require 'html-font)))
(add-hook 'html-helper-mode-hook '(lambda () (font-lock-mode 1)))

(setq html-helper-do-write-file-hooks t)

;; -----------------------------------------------
;; Themes:
;; (The *.el files are stored on the ~/Emacs/Lisp/ directory)
;; -----------------------------------------------

;; Lab Burn works Ok with only this line:
;; (require 'labburn-theme)

;; Tronesque needs this two lines:
(require 'tronesque-theme)
(tronesque-mode-line)

;; -----------------------------------------------

;; EoF ;;
