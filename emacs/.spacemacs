;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (colors :variables colors-enable-rainbow-indentifiers t)
     clojure
     chrome
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence nil
                      )
     better-defaults
     emacs-lisp
     git
     markdown
     org
     search-engine
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     syntax-checking
     version-control
     ibuffer
     spotify
     perspectives
     latex
     javascript

     ;; My custom layers
     mulc
     e-ruby
     snips
     web
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(latex-preview-pane)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supporteds
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed.
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(solarized-light)

   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.2)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; Default value is `cache'.
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f) is replaced.
   dotspacemacs-use-ido nil
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state nil
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar nil
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode t
   ;; Select a scope to highlight delimiters. Possible value is `all',
   ;; `current' or `nil'. Default is `all'
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   )
  ;; User initialization goes here
  )

(defun dotspacemacs/config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."

  ;; My custom configurations
  (setq browse-url-browser-function 'browse-url-generic
        engine/browser-function 'browse-url-generic
        browse-url-generic-program "chromium")

  ;; My custom functions
  (defun my/select-current-line ()
    "Select the current line to beggining of the text
identation"
    (interactive)
    (back-to-indentation) ; move to the end of line
    (set-mark (line-end-position))
    )

  (defun my/insert-line-before (times)
    "Inserts a newline(s) above the line containing the cursor."
    (interactive "p")                     ; Called from M-x
    (save-excursion                       ; Store position
      (move-beginning-of-line 1)
      (newline times)))                   ; Insert new line

  (defun my/insert-line-after (times)
    "Inserts a newline(s) down the line containing the cursor."
    (interactive "p")                     ; Called from M-x
    (save-excursion                       ; Store position
      (move-end-of-line 1)
      (open-line times)))                   ; Insert new line after

  (defun my/indent-whole-buffer ()
    "Indent complete buffer"
    (interactive)
    (indent-region (point-min) (point-max))
    (delete-trailing-whitespace))

  (defun my/new-line-and-indent ()
    "Inserts a newline and openline"
    (interactive)
    (save-excursion
      (newline-and-indent))
    (newline-and-indent))

  (defun my/new-line-and-indent-in-the-next ()
    "End of visual line and add a newline"
    (interactive)
    (end-of-visual-line)
    (newline-and-indent))

  (global-set-key (kbd "C-c C-i") 'my/indent-whole-buffer)
  (global-set-key (kbd "C-S-o") 'my/insert-line-before)
  (global-set-key (kbd "C-M-o") 'my/insert-line-after)
  (global-unset-key (kbd "C-S-l"))
  (global-set-key (kbd "C-S-l") 'my/select-current-line)
  (global-set-key (kbd "S-<return>") 'my/new-line-and-indent)
  (global-set-key (kbd "C-M-<return>") 'my/new-line-and-indent-in-the-next)

  ;; Duplicate line or region
  ;; Is not my own version
  ;; http://stackoverflow.com/questions/88399/how-do-i-duplicate-a-whole-line-in-emacs#answer-4717026
  (defun duplicate-line-or-region (&optional n)
    "Duplicate current line, or region if active.
With argument N, make N copies.
With negative N, comment out original line and use the absolute value."
    (interactive "*p")
    (let ((use-region (use-region-p)))
      (save-excursion
        (let ((text (if use-region ;Get region if active, otherwise line
                        (buffer-substring (region-beginning) (region-end))
                      (prog1 (thing-at-point 'line)
                        (end-of-line)
                        (if (< 0 (forward-line 1)) ;Go to beginning of next line, or make a new one
                            (newline))))))
          (dotimes (i (abs (or n 1))) ;Insert N times, or once if not specified
            (insert text))))
      (if use-region nil ;Only if we're working with a line (not a region)
        (let ((pos (- (point) (line-beginning-position)))) ;Save column
          (if (> 0 n) ;Comment out original with negative arg
              (comment-region (line-beginning-position) (line-end-position)))
          (forward-line 1)
          (forward-char pos)))))

  ;; Keybinding for duplicate line or region
  (global-set-key (kbd "C-c d") 'duplicate-line-or-region)

  ;; Ask for confirmation before quitting Emacs
  (add-hook 'kill-emacs-query-functions
            (lambda () (y-or-n-p "Do you really want to exit Emacs? "))
            'append)

  (defun sudo-edit (&optional arg)
    "Edit currently visited file as root.
With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
    (interactive "P")
    (if (or arg (not buffer-file-name))
        (find-file (concat "/sudo:root@localhost:"
                           (ido-read-file-name "Find file(as root): ")))
      (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

  (global-set-key (kbd "C-x C-r") 'sudo-edit)

  (setq ad-redefinition-action 'accept)
  (setq password-cache-expiry nil)

  ;; Shorcut for expand abbrev
  (global-set-key (kbd "C-M-ñ") 'dabbrev-expand)

  ;; Smartparens configuration and global mode enable
  (smartparens-global-mode)

  ;; Paredit bindings for smartparens
  (sp-use-paredit-bindings)

  (setq css-indent-offset 2)
  (setq scss-compile-at-save nil)
  (setq powerline-default-separator 'slant)

  ;; Eval RSpec Snippets after init rspec-mode
  (eval-after-load 'rspec-mode
    '(rspec-install-snippets))

  (eval-after-load "js2-mode"
    '(progn
       (setq js2-missing-semi-one-line-override t)
       (setq-default js2-basic-offset 2)))

  (setq js-indent-level 2)

  (setq json-reformat:indent-width 2)

  (setq frame-title-format "emacs -> %f")  ; Always include the buffer name

  ;; Show line numbers for default
  (global-linum-mode)

  ;; Username for emacs session
  (setq user-full-name "Edgar Talledos")
  (setq user-mail-address "edgar.talledos@gmail.com")

  (blink-cursor-mode t)

  ;; Expand region command for emacs style
  (global-set-key (kbd "C-=") 'er/expand-region)

  ;; Key bindings for region-bindings-mode
  (define-key region-bindings-mode-map "d" 'mc/mark-all-dwim)
  (define-key region-bindings-mode-map "a" 'mc/mark-all-like-this)
  (define-key region-bindings-mode-map "p" 'mc/mark-previous-like-this)
  (define-key region-bindings-mode-map "n" 'mc/mark-next-like-this)
  (define-key region-bindings-mode-map "m" 'mc/mark-more-like-this-extended)
  (define-key region-bindings-mode-map "s" 'mc/skip-to-next-like-this)
  (define-key region-bindings-mode-map "S" 'mc/skip-to-previous-like-this)
  (define-key region-bindings-mode-map "i" 'er/mark-inside-quotes)
  (define-key region-bindings-mode-map "o" 'er/mark-outside-quotes)
  (define-key region-bindings-mode-map "I" 'er/mark-inside-pairs)
  (define-key region-bindings-mode-map "O" 'er/mark-outside-pairs)
  (define-key region-bindings-mode-map "f" 'er/mark-defun)
  (define-key region-bindings-mode-map "ñ" 'er/mark-symbol)
  (define-key region-bindings-mode-map "Ñ" 'er/mark-symbol-with-prefix)
  (define-key region-bindings-mode-map "w" 'er/mark-word)
  (define-key region-bindings-mode-map "u" 'er/mark-url)
  (define-key region-bindings-mode-map "t" 'er/mark-text-sentence)

  ;; Shows colors in css-mode
  ;; CSS color values colored by themselves
  ;; http://news.ycombinator.com/item?id=873541
  (defvar hexcolor-keywords
    '(("#[abcdef[:digit:]]+"
       (0 (put-text-property
           (match-beginning 0)
           (match-end 0)
           'face (list :background
                       (match-string-no-properties 0)))))))

  (defun hexcolor-add-to-font-lock ()
    (font-lock-add-keywords nil hexcolor-keywords))

  (add-hook 'css-mode-hook 'hexcolor-add-to-font-lock)

  ;; Set global keybinding for ansi-term
  (global-set-key (kbd "C-x M-a") (lambda ()
                                    (interactive)
                                    (ansi-term "/bin/zsh")))

  (define-globalized-minor-mode global-highlight-parentheses-mode
    highlight-parentheses-mode
    (lambda ()
      (highlight-parentheses-mode t)))
  (global-highlight-parentheses-mode t)

  ;; Load yasnippets globally per default
  ;; (yas-global-mode 1)

  ;; Configurations for snippets
  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)
  (define-key yas-minor-mode-map (kbd "C-<tab>") 'yas-expand)
  ;; Disabled expand snippets in projectile
  (setq projectile-rails-expand-snippet nil)

  ;; Indent guide options
  (setq indent-guide-delay nil)

  ;; Direct binding for evil-scape
  (global-set-key (kbd "C-ñ") 'evil-escape)
  (setq google-translate-default-source-language "en")
  (setq google-translate-default-target-language "es")

  ;; Latex preview pane enabled
  (latex-preview-pane-enable)
  (load "preview-latex.el" nil t t)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(ring-bell-function (quote ignore) t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(fringe ((t (:background "#fdf6e3" :foreground "#D4CEBD"))))
 '(highlight-indentation-current-column-face ((t (:background "#E6D9C3"))))
 '(highlight-indentation-face ((t (:background "#E6D9C3"))))
 '(indent-guide-face ((t (:foreground "#E6D9C3")))))
