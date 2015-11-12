;;; packages.el --- multiple-cursors Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq mulc-packages
      '(
        multiple-cursors
        region-bindings-mode
        ))

(defun mulc/init-multiple-cursors ()
  (use-package multiple-cursors
    :config
    (progn
      (global-set-key (kbd "C-M-<mouse-1>") 'mc/add-cursor-on-click)
      (global-set-key (kbd "C-S-s C-S-b") 'mc/edit-beginnings-of-lines)
      (global-set-key (kbd "C-S-s C-S-e") 'mc/edit-ends-of-lines)
      (global-set-key (kbd "C-S-s C-S-i") 'mc/insert-numbers)
      (global-set-key (kbd "C-S-s C-S-n") 'mc/mark-next-like-this)
      (global-set-key (kbd "C-S-s C-S-p") 'mc/mark-previous-like-this)
      (global-set-key (kbd "C-S-s C-S-r") 'mc/reverse-regions)
      (global-set-key (kbd "C-S-s C-S-s") 'mc/sort-regions))))

(defun mulc/init-region-bindings-mode ()
  (use-package region-bindings-mode
    :config (region-bindings-mode-enable)))
