;;; avendael-powerline.el --- Avendael's powerline customizations

;;; Commentary:
;;
;; Custom functions and altered variables
;;
;;; Code:

(require 'powerline)
(powerline-center-theme)

(defun avendael-powerline-dark ()
  "Use the dark theme for powerline."
  (interactive)
  (set-face-attribute 'powerline-active1
                      nil :inherit 'mode-line :background "#383838")
  (set-face-attribute 'powerline-active2 nil
                      :inherit 'mode-line :background "#5f5f5f" :foreground "gray80")
  (set-face-attribute 'powerline-inactive1 nil
                      :inherit 'mode-line-inactive :background "#4F4F4F")
  (set-face-attribute 'powerline-inactive2 nil
                      :inherit 'mode-line :background "#6f6f6f"))

(defun avendael-powerline-light ()
  "Use the dark theme for powerline."
  (interactive)
  (set-face-attribute 'powerline-active1
                      nil :inherit 'mode-line :background "#93a1a1" :foreground "#eee8d5")
  (set-face-attribute 'powerline-active2 nil
                      :inherit 'mode-line :background "#eee8d5" :foreground "#fdff6e3")
  (set-face-attribute 'powerline-inactive1 nil
                      :inherit 'mode-line-inactive :background "#93a1a1" :foreground "#cccec4")
  (set-face-attribute 'powerline-inactive2 nil
                      :inherit 'mode-line :background "#eee8d5"))

(defun avendael-powerline-theme ()
  "Setup a mode line that avendael likes."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          powerline-default-separator
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           powerline-default-separator
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list (powerline-raw "%*" nil 'l)
                                     (powerline-buffer-size nil 'l)
                                     (powerline-raw pyvenv-mode-line-indicator)
                                     (powerline-buffer-id nil 'l)
                                     (powerline-raw " ")
                                     (funcall separator-left mode-line face1)
                                     (powerline-narrow face1 'l)
                                     (powerline-vc face1)))
                          (rhs (list (powerline-raw global-mode-string face1 'r)
                                     (when (boundp 'erc-modified-channels-object)
                                       (powerline-raw erc-modified-channels-object face1 'l))
                                     (powerline-major-mode face1 'l)
                                     (powerline-process face1)
                                     (powerline-raw " :" face1)
                                     (powerline-minor-modes face1 'l)))
                          (center (list (powerline-raw " " face1)
                                        (funcall separator-left face1 face2)
                                        (powerline-raw "%4l" face2 'r)
                                        (powerline-raw ":" face2)
                                        (powerline-raw "%3c" face2 'r)
                                        (powerline-raw " " face2)
                                        (powerline-raw "%6p" face2 'r)
                                        (funcall separator-right face2 face1))))
                     (concat (powerline-render lhs)
                             (powerline-fill-center face1 (/ (powerline-width center) 2.0))
                             (powerline-render center)
                             (powerline-fill face1 (powerline-width rhs))
                             (powerline-render rhs)))))))

(avendael-powerline-dark)
(avendael-powerline-theme)

(provide 'avendael-powerline)
;;; avendael-powerline.el ends here
