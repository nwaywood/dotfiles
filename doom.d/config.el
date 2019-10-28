;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; leader keybindings
(map! :leader
      :desc "Search Project" "a" #'+default/search-project
      :desc "Project sidebar" "e" #'+treemacs/toggle
      :desc "Search buffer" "l" #'swiper
      :desc "List errors" "d" #'flycheck-list-errors
      :desc "Find file in project" "f" #'projectile-find-file
      :desc "Jump to symbol" "s" #'imenu
      :desc "Save Buffer" "w" #'save-buffer
      :desc "Save and Quit" "x" #'evil-save-and-close
      :desc "Quit" "q" #'evil-quit
      "X" nil ; no org capture
      "SPC" nil ; replaced by <leader>f
      ":" nil ; replaced by cmd-shift-p
)

;; non leader keybindings
(map! 
      ;; Easier window movement
      :n "C-h" #'evil-window-left
      :n "C-j" #'evil-window-down
      :n "C-k" #'evil-window-up
      :n "C-l" #'evil-window-right
       (:map evil-treemacs-state-map
        "C-h" #'evil-window-left
        "C-l" #'evil-window-right)

       ;; scroll the viewport faster
       :m "C-e" (λ! (evil-scroll-line-down 3))
       :m "C-y" (λ! (evil-scroll-line-up 3))
       ;; splits
       :n "C-v" #'evil-window-vsplit
       :n "C-s" #'evil-window-split
       ;; command prompt
       :g "s-P" #'execute-extended-command)


;; enable soft wrapping (almost) everywhere
(setq-default visual-fill-column-width 120)
(global-visual-fill-column-mode 1)
(global-visual-line-mode 1)

(setq doom-font (font-spec :family "SF Mono" :size 15)
      ; +word-wrap-extra-indent 0
      ; NOTE: I may need this line below if stuff isn't aligned
      ; doom-themes-enable-bold nil
      )

;; launch doom in a maximised window
(add-hook 'window-setup-hook #'toggle-frame-maximized)

;; line text object
(use-package! evil-textobj-line
  :commands evil-a-line evil-inner-line
  :init (map! :textobj "l" #'evil-inner-line #'evil-a-line))

;; entire text object
(use-package! evil-textobj-entire
  :commands evil-entire-entire-buffer
  :init (map! :textobj "e" #'evil-entire-entire-buffer))

;; relative numbers for normal mode, absolute for insert
(setq-default display-line-numbers 'relative
              display-line-numbers-type 'relative
              ; display-line-numbers-widen t
              display-line-numbers-current-absolute t)

(defun noct:relative ()
  (setq-local display-line-numbers 'visual))

(defun noct:absolute ()
  (setq-local display-line-numbers t))

(add-hook 'evil-insert-state-entry-hook #'noct:absolute)
(add-hook 'evil-insert-state-exit-hook #'noct:relative)

