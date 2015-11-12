;;; config.el --- Ruby Layer configuration File for Spacemacs
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

;; Variables

(spacemacs|defvar-company-backends enh-ruby-mode)

(defvar e-ruby-version-manager 'rvm
  "If non nil defines the Ruby version manager (i.e. rbenv, rvm)")

(defvar e-ruby-enable-ruby-on-rails-support t
  "If non nil we'll load support for Rails (haml, features, navigation)")
