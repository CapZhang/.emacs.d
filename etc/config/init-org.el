
(use-package
  org
  :ensure t
  ;; ('org-mode . 'toggle-truncate-lines)
  :bind
  ;;("C-c c" . 'org-capture)
  ("C-c a" . 'org-agenda)
  ;;("M-H" . 'org-shiftmetaleft)
  ;;("M-L" . 'org-shiftmetaright)
  :custom
  (org-todo-keywords '((sequence "[学习](s!/@)" "[待办](t!/@)" "[等待](w!))" "|" "[完成](d!/@)" "[取消](c!@)")
                       (sequence "[BUG](b!/@)" "[新事件](i@)" "[已知问题](k!/@)" "[修改中](W!/@)" "|" "[已修复](f!)")))
  :config
  (setq org-todo-keyword-faces '(("[学习]" . (:foreground "white" :background "#2ECC71" :weight bold))
                                 ("[待办]" . (:foreground "white" :background "#F1C40F" :weight bold))
                                 ("[等待]" . (:foreground "white" :background "#3498DB" :weight bold))
                                 ("[完成]" . (:foreground "black" :background "snow " :weight bold))
                                 ("[取消]" . (:foreground "white" :background "#566573" :weight bold))
                                 ("[BUG]" . (:foreground "white" :background "#E74C3C" :weight bold))
                                 ("[新事件]" . (:foreground "white" :background "#D35400" :weight bold))
                                 ("[已知问题]" . (:foreground "white" :background "#17A589" :weight bold))
                                 ("[修改中]" . (:foreground "white" :background "#BB8FCE" :weight bold))
                                 ("[已修复]" . (:foreground "white" :background "#566573" :weight bold)))))

;; Org Babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((C . t)
   (emacs-lisp . t)
   (shell . t)))

;; GTD
(unless (file-exists-p "~/.emacs.d/gtd")
  (make-directory "~/.emacs.d/gtd"))
(setq org-agenda-files '("~/.emacs.d/gtd"))
(defvar org-agenda-dir "" "gtd org files location")
(setq-default org-agenda-dir "~/.emacs.d/gtd")
;; org-agenda-dir files
(setq org-agenda-file-note (expand-file-name "notes.org" org-agenda-dir))
(setq org-agenda-file-insp (expand-file-name "insps.org" org-agenda-dir))
(setq org-agenda-file-task (expand-file-name "tasks.org" org-agenda-dir))
(setq org-capture-templates
      '(("t" "Task")
        ("tw" "Work Task" entry (file+headline org-agenda-file-task "Work")
         "* TODO %T - %^{Work Mainly Content} %^g\n  %?" :clock-in t :clock-keep t)
        ("ts" "Study Task" entry (file+headline org-agenda-file-task "Study")
         "* STUDY %T - %^{Study Mainly Content} %^g\n  %?" :clock-in t :clock-keep t)
        ("i" "inspiration" entry (file+headline org-agenda-file-insp "Inspiration")
         "* %^{Inspiration Mainly Content} \n  %?")
        ("n" "Note" entry (file+headline org-agenda-file-note "Note")
         "* %^{Note Mainly Content} \n  %?")))

;; PDF & Latex
(setq org-latex-pdf-process '("xelatex -file-line-error -interaction nonstopmode %f"
                              "bibtex %b"
                              "xelatex -file-line-error -interaction nonstopmode %f"
                              "xelatex -file-line-error -interaction nonstopmode %f"))
(setq org-latex-logfiles-extensions
      '("lof" "lot" "tex" "aux" "idx" "log" "out" "toc" "nav" "snm" "vrb" "dvi" "fdb_latexmk" "blg""brf" "fls" "entoc" "ps" "spl" "bbl" "xdv"))
(setq org-image-actual-width '(300))
(setq org-export-with-sub-superscripts nil)

;;; Org Bullets
(require 'org-bullets)
(add-hook 'org-mode-hook #'org-bullets-mode)
(setq org-bullets-bullet-list '("①" "②" "③"
                                    "④" "⑤" "⑥" "⑦"
                                    "⑧" "⑨" "⑩" "⑪"
                                    "⑫" "⑬" "⑭"
                                    "⑮" "⑯" "⑰"
                                    "⑱" "⑲" "⑳"))

(provide 'init-org)
