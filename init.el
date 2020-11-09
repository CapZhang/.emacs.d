;;; .emacs.d ---  My Personal Emacs Configuration File

;; Author: KiteAB <kiteabpl@outlook.com>
;; Maintainer: KiteAB <kiteabpl@outlook.com>
;; Copyright (C) 2020, KiteAB, all rights reserved.
;; Last-Updated: 2020-10-20 21:25:34
;;           By: KiteAB
;; URL: http://github.com/KiteAB/.emacs.d
;; Keywords:
;; Compatibility: GNU Emacs 27.0.50
;;
;;; This file is NOT part of GNU Emacs

;;; License
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.

;;; TODO
;; Re-write this configuration file.
;;
;;


;;; Automatic Optimization
(setq gc-cons-threshold-original gc-cons-threshold)
(setq gc-cons-threshold (* 1024 1024 100))
(setq file-name-handler-alist-original file-name-handler-alist)
(setq inhibit-compacting-font-caches nil)
(setq file-name-handler-alist nil)
(run-with-idle-timer 5 nil (lambda ()
                             (setq gc-cons-threshold gc-cons-threshold-original)
                             (setq file-name-handler-alist file-name-handler-alist-original)
                             (makunbound 'gc-cons-threshold-original)
                             (makunbound 'file-name-handler-alist-original)))

;;;; Traverse Load Configuration Folder
(defun add-subdirs-to-load-path(dir)
  "Recursive add directories to `load-path`."
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))
(let ((gc-cons-threshold most-positive-fixnum)
      (file-name-handler-alist nil))
  (add-subdirs-to-load-path "~/.emacs.d/etc/"))

;;; Require Configuration Files
(require 'init-config)

;; 加密
(require 'ps-ccrypt)
;; (ps-ccrypt-install)

;; (require 'init-ccrypt)
;; (require 'epa-file)
;; (setq epa-file-select-keys 0)

;; 粘贴图片,需要
 ;; (require 'pasteex-mode)
;; (setq pasteex-executable-path "~/.emacs.d/site-lisp/PasteEx/PasteEx.exe")
 ;; (global-set-key (kbd "C-x p i") 'pasteex-image)

 (require 'snipastetool-mode)
 ;; (setq snipaste-executable-path " ~/.emacs.d/site-lisp/Snipaste/Snipaste.exe")
 (global-set-key (kbd "C-x p i") 'snipaste-image)
 (global-set-key (kbd "C-x p d") 'snipaste-delete-img-link-and-file-at-line)
(defun shk-fix-inline-images ()
  (when org-inline-image-overlays
    (org-redisplay-inline-images)))

(with-eval-after-load 'org
  (add-hook 'org-babel-after-execute-hook 'shk-fix-inline-images))
