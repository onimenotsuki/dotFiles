# My Dotfiles
Those are my dotfiles. Welcome.

## Notes
Remember when bootstrap configuration file in spacemacs, modify the part

    (add-hook 'yas-before-expand-snippet-hook (lambda ()
                                                  ;; If enabled, smartparens will mess snippets expanded by `hippie-expand`
                                                  (setq smartparens-enabled-initially smartparens-mode)
                                                  (smartparens-mode 1)))
