;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq doom-font (font-spec :family "Iosevka" :weight 'light :size 16))

(setq tide-completion-ignore-case t) ; enable case insensitive completion

(setq completion-styles '(substring emacs22)) ; removed `basic` from first style

(load-theme 'base16-eighties t)
