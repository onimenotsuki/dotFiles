;;; packages.el --- HTML Layer packages File for Spacemacs
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

(setq web-packages
      '(
        company
        company-web
        css-mode
        emmet-mode
        evil-matchit
        flycheck
        haml-mode
        helm-css-scss
        jade-mode
        less-css-mode
        rainbow-delimiters
        sass-mode
        scss-mode
        slim-mode
        smartparens
        tagedit
        web-mode
        yasnippet
        ))

(when (configuration-layer/layer-usedp 'auto-completion)
  ;;TODO: whenever company-web makes a backend for haml-mode it should be added here. -- @robbyoconnor
  (defun web/post-init-company ()
    (spacemacs|add-company-hook css-mode)
    (spacemacs|add-company-hook jade-mode)
    (spacemacs|add-company-hook slim-mode)
    (spacemacs|add-company-hook web-mode))

  (defun web/init-company-web ()
    (use-package company-web)))

(defun web/init-css-mode ()
  (use-package css-mode
    :defer t
    :init
    (progn
      (push 'company-css company-backends-css-mode)

      (defun css-expand-statement ()
        "Expand CSS block"
        (interactive)
        (save-excursion
          (end-of-line)
          (search-backward "{")
          (forward-char 1)
          (while (or (eobp) (not (looking-at "}")))
            (let ((beg (point)))
              (newline)
              (search-forward ";")
              (indent-region beg (point))
              ))
          (newline)))

      (defun css-contract-statement ()
        "Contract CSS block"
        (interactive)
        (end-of-line)
        (search-backward "{")
        (while (not (looking-at "}"))
          (join-line -1)))

      (evil-leader/set-key-for-mode 'css-mode
        "mzc" 'css-contract-statement
        "mzo" 'css-expand-statement))))

(defun web/init-emmet-mode ()
  (use-package emmet-mode
    :defer t
    :init (spacemacs/add-to-hooks 'emmet-mode '(css-mode-hook
                                                html-mode-hook
                                                web-mode-hook))
    :config
    (progn
      (evil-define-key 'insert emmet-mode-keymap (kbd "TAB") 'emmet-expand-yas)
      (evil-define-key 'insert emmet-mode-keymap (kbd "<tab>") 'emmet-expand-yas)
      (evil-define-key 'emacs emmet-mode-keymap (kbd "TAB") 'emmet-expand-yas)
      (evil-define-key 'emacs emmet-mode-keymap (kbd "<tab>") 'emmet-expand-yas)
      (spacemacs|hide-lighter emmet-mode))))

(defun web/post-init-evil-matchit ()
  (add-hook 'web-mode-hook 'evil-matchit-mode))

(defun web/post-init-flycheck ()
  (spacemacs/add-to-hooks 'flycheck-mode '(haml-mode-hook
                                           jade-mode-hook
                                           less-mode-hook
                                           sass-mode-hook
                                           scss-mode-hook
                                           slim-mode-hook
                                           web-mode-hook)))

(defun web/init-haml-mode ()
  (use-package haml-mode
    :defer t))

(defun web/init-helm-css-scss ()
  (use-package helm-css-scss
    :defer t
    :init
    (dolist (mode '(css-mode scss-mode))
      (evil-leader/set-key-for-mode mode "mgh" 'helm-css-scss))))

(defun web/init-jade-mode ()
  (use-package jade-mode
    :defer t))

(defun web/init-less-css-mode ()
  (use-package less-css-mode
    :defer t
    :mode ("\\.less\\'" . less-css-mode)))

(defun web/init-sass-mode ()
  (use-package sass-mode
    :defer t
    :mode ("\\.sass\\'" . sass-mode)))

(defun web/init-scss-mode ()
  (use-package scss-mode
    :defer t
    :mode ("\\.scss\\'" . scss-mode)))

(defun web/init-slim-mode ()
  (use-package slim-mode
    :defer t))

(defun web/post-init-smartparens ()
  (spacemacs/add-to-hooks
   (if dotspacemacs-smartparens-strict-mode
       'smartparens-strict-mode
     'smartparens-mode)
   '(css-mode-hook scss-mode-hook sass-mode-hook less-css-mode-hook))

  ;; Only use smartparens in web-mode
  (spacemacs|use-package-add-hook web-mode
    :post-config
    (progn
      (setq web-mode-enable-auto-pairing nil)

      ;; Web mode customization
      (setq web-mode-css-indent-offset 2)
      (setq web-mode-markup-indent-offset 2)
      (setq web-mode-code-indent-offset 2)
      (setq web-mode-indent-style 2)
      (setq web-mode-enable-css-colorization 1)

      (sp-local-pair 'web-mode "<% " " %>")
      (sp-local-pair 'web-mode "{ " " }")
      (sp-local-pair 'web-mode "<%= "  " %>")
      (sp-local-pair 'web-mode "<%# "  " %>")
      (sp-local-pair 'web-mode "<%$ "  " %>")
      (sp-local-pair 'web-mode "<%@ "  " %>")
      (sp-local-pair 'web-mode "<%: "  " %>")
      (sp-local-pair 'web-mode "{{ "  " }}")
      (sp-local-pair 'web-mode "{% "  " %}")
      (sp-local-pair 'web-mode "{%- "  " %}")
      (sp-local-pair 'web-mode "{# "  " #}"))))

(defun web/init-tagedit ()
  (use-package tagedit
    :defer t
    :config
    (progn
      (tagedit-add-experimental-features)
      (add-hook 'html-mode-hook (lambda () (tagedit-mode 1)))
      (spacemacs|diminish tagedit-mode " Ⓣ" " T"))))

(defun web/post-init-rainbow-delimiters ()
  (spacemacs/add-to-hooks 'rainbow-delimiters-mode '(haml-mode-hook
                                                     jade-mode-hook
                                                     less-css-mode-hook
                                                     scss-mode-hook
                                                     slim-mode-hook)))

(defun web/init-web-mode ()
  (use-package web-mode
    :defer t
    :init
    (push 'company-web-html company-backends-web-mode)
    :config
    (progn
      (evil-leader/set-key-for-mode 'web-mode
        "meh" 'web-mode-dom-errors-show
        "mgb" 'web-mode-element-beginning
        "mgc" 'web-mode-element-child
        "mgp" 'web-mode-element-parent
        "mgs" 'web-mode-element-sibling-next
        "mhp" 'web-mode-dom-xpath
        "mrc" 'web-mode-element-clone
        "mrd" 'web-mode-element-vanish
        "mrk" 'web-mode-element-kill
        "mrr" 'web-mode-element-rename
        "mrw" 'web-mode-element-wrap
        "mz" 'web-mode-fold-or-unfold
        ;; TODO element close would be nice but broken with evil.
        )

      (defvar spacemacs--web-mode-ms-doc-toggle 0
        "Display a short doc when nil, full doc otherwise.")

      (defun spacemacs//web-mode-ms-doc ()
        (if (equal 0 spacemacs--web-mode-ms-doc-toggle)
            "[?] for help"
          "
[?] display this help
[k] previous [j] next   [K] previous sibling [J] next sibling
[h] parent   [l] child  [c] clone [d] delete [D] kill [r] rename
[w] wrap     [p] xpath
[q] quit"))

(defun spacemacs//web-mode-ms-toggle-doc ()
  (interactive)
  (setq spacemacs--web-mode-ms-doc-toggle
        (logxor spacemacs--web-mode-ms-doc-toggle 1)))

(spacemacs|define-micro-state web-mode
  :doc (spacemacs//web-mode-ms-doc)
  :persistent t
  :evil-leader-for-mode (web-mode . "m.")
  :bindings
  ("<escape>" nil :exit t)
  ("?" spacemacs//web-mode-ms-toggle-doc)
  ("c" web-mode-element-clone)
  ("d" web-mode-element-vanish)
  ("D" web-mode-element-kill)
  ("j" web-mode-element-next)
  ("J" web-mode-element-sibling-next)
  ("gj" web-mode-element-sibling-next)
  ("k" web-mode-element-previous)
  ("K" web-mode-element-sibling-previous)
  ("gk" web-mode-element-sibling-previous)
  ("h" web-mode-element-parent)
  ("l" web-mode-element-child)
  ("p" web-mode-dom-xpath)
  ("r" web-mode-element-rename :exit t)
  ("q" nil :exit t)
  ("w" web-mode-element-wrap)))

:mode
(("\\.phtml\\'"      . web-mode)
 ("\\.tpl\\.php\\'"  . web-mode)
 ("\\.twig\\'"       . web-mode)
 ("\\.html\\'"       . web-mode)
 ("\\.htm\\'"        . web-mode)
 ("\\.[gj]sp\\'"     . web-mode)
 ("\\.as[cp]x?\\'"   . web-mode)
 ("\\.eex\\'"        . web-mode)
 ("\\.erb\\'"        . web-mode)
 ("\\.mustache\\'"   . web-mode)
 ("\\.handlebars\\'" . web-mode)
 ("\\.hbs\\'"        . web-mode)
 ("\\.eco\\'"        . web-mode)
 ("\\.jsx\\'"        . web-mode)
 ("\\.ejs\\'"        . web-mode)
 ("\\.djhtml\\'"     . web-mode))))

(defun web/post-init-yasnippet ()
  (spacemacs/add-to-hooks 'spacemacs/load-yasnippet '(css-mode-hook
                                                      jade-mode
                                                      slim-mode)))
