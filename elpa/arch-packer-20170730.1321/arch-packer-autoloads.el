;;; arch-packer-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "arch-packer" "arch-packer.el" (0 0 0 0))
;;; Generated autoloads from arch-packer.el

(autoload 'arch-packer-search-package "arch-packer" "\
Prompt user for search string. Display results in `arch-packer-search-mode-map'" t nil)

(autoload 'arch-packer-install-package "arch-packer" "\
Prompt user for a string containing packages to be installed." t nil)

(autoload 'arch-packer-list-packages "arch-packer" "\
Refresh package menu." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "arch-packer" '("arch-packer-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; arch-packer-autoloads.el ends here
