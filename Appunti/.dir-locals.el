;;; Directory Local Variables
;;; For more information see (info "(emacs) Directory Variables")

((nil
  ;; disable tabs
  (indent-tabs-mode . nil)

  ;; place newline at end of document
  (require-final-newline . t)

  ;; remove trailing whitespace
  (eval . (add-hook 'before-save-hook 'delete-trailing-whitespace))))

