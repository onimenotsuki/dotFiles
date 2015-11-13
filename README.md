# My Dotfiles
Those are my dotfiles. Welcome.

## Emacs
Remember when bootstrap configuration file in spacemacs, modify the part

    (add-hook 'yas-before-expand-snippet-hook (lambda ()
                                                  ;; If enabled, smartparens will mess snippets expanded by `hippie-expand`
                                                  (setq smartparens-enabled-initially smartparens-mode)
                                                  (smartparens-mode 1)))

## i3 Window Manager
Install i3-gaps-git instead of common package for the configuration file or comment next lines

    set $default_gaps_inner 5
    set $default_gaps_outer 10
    gaps inner $default_gaps_inner
    gaps outer $default_gaps_outer
