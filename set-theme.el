;; from https://gist.github.com/itoshkov/850c46746705e32e2039fb0112a75ec7 ;;
(defun set-emacs-frames (variant)
  (dolist (frame (frame-list))
    (let* ((window-id (frame-parameter frame 'outer-window-id))
	   (id (string-to-number window-id))
	   (cmd (format "xprop -id 0x%x -f _GTK_THEME_VARIANT 8u -set _GTK_THEME_VARIANT \"%s\""
			id variant)))
      (call-process-shell-command cmd))))

(defun set-emacs-theme-light ()
  (set-emacs-frames "light"))

(defun set-emacs-theme-dark ()
  (set-emacs-frames "dark"))
