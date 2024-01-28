;; The default is 800 kilobytes. Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

(defun mark/org-babel-tangle-config ()
  "Automatically tangle our Emacs.org config file when we save it. Credit to Emacs From Scratch for this one!"
  (when (string-equal (file-name-directory (buffer-file-name))
                      (expand-file-name user-emacs-directory))
    ;; Dynamic scoping to the rescue
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle))))

(add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'mark/org-babel-tangle-config)))

(require 'use-package-ensure) ;; This line is currenly needed, there is a bug with always-ensure, it doesn't get loaded if we just setq t
(setq use-package-always-ensure t) ;; Always ensures that a package is installed
(setq package-archives '(("melpa" . "https://melpa.org/packages/") ;; Sets default package repositories
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(use-package evil
  :init ;; Tweak evil's configuration before loading it
  (setq evil-want-keybinding nil) ;; Disable evil bindings in other modes (It's not consistent and not good)
  (setq evil-want-C-u-scroll t) ;; Set  C-u to scroll up
  (setq evil-want-C-i-jump nil) ;; Disables C-i jump
  (setq evil-undo-system 'undo-tree) ;; C-r to redo
  (setq org-return-follows-link  t) ;; Sets RETURN key in org-mode to follow links
  (evil-mode))
(use-package evil-collection
  :after evil
  :config
  ;; Setting where to use evil-collection
  (setq evil-collection-mode-list '(dired ibuffer flymake eglot magit diff-hl corfu ivy vterm))
  (evil-collection-init))
;; Unmap keys in 'evil-maps. If not done, (setq org-return-follows-link t) will not work
(with-eval-after-load 'evil-maps
  (define-key evil-motion-state-map (kbd "SPC") nil)
  (define-key evil-motion-state-map (kbd "RET") nil)
  (define-key evil-motion-state-map (kbd "TAB") nil))

(use-package general
  :config
  (general-evil-setup)
  ;; set up 'SPC' as the global leader key
  (general-create-definer mark/leader-keys
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC" ;; Set leader
    :global-prefix "C-SPC") ;; Access leader in insert mode

  (mark/leader-keys
    "." '(find-file :wk "Find file")
    "TAB" '(comment-line :wk "Comment lines")
    "p" '(projectile-command-map :wk "Projectile command map"))

  (mark/leader-keys
    "f" '(:ignore t :wk "Find")
    "f c" '((lambda () (interactive) (find-file "~/.config/emacs/config.org")) :wk "Edit emacs config")
    "f e"' (sudo-edit :wk "Root edit current file")
    "f u"' (sudo-edit-find-file :wk "Root find file")
    "f r" '(counsel-recentf :wk "Recent files"))

  (mark/leader-keys
    "b" '(:ignore t :wk "Buffer Bookmarks")
    "b b" '(switch-to-buffer :wk "Switch buffer")
    "b k" '(kill-this-buffer :wk "Kill this buffer")
    "b i" '(ibuffer :wk "Ibuffer")
    "b n" '(next-buffer :wk "Next buffer")
    "b p" '(previous-buffer :wk "Previous buffer")
    "b r" '(revert-buffer :wk "Reload buffer")
    "b j" '(bookmark-jump :wk "Bookmark jump"))

  (mark/leader-keys
    "d" '(:ignore t :wk "Dired")
    "d v" '(dired :wk "Open dired")
    "d j" '(dired-jump :wk "Dired jump to current"))

  (mark/leader-keys
    "e" '(:ignore t :wk "Eglot Evaluate")
    "e e" '(eglot-reconnect :wk "Eglot Reconnect")
    "e f" '(eglot-format :wk "Eglot Format")
    "e b" '(eval-buffer :wk "Evaluate elisp in buffer")
    "e r" '(eval-region :wk "Evaluate elisp in region"))

  (mark/leader-keys
    "g" '(:ignore t :wk "Git")
    "g g" '(magit-status :wk "Magit status"))

  (mark/leader-keys
    "h" '(:ignore t :wk "Help") ;; To get more help use C-h commands (describe variable, function, etc.)
    "h r" '((lambda () (interactive)
              (load-file "~/.config/emacs/init.el"))
            :wk "Reload emacs config"))

  (mark/leader-keys
    "s" '(:ignore t :wk "Show")
    "s v" '(vterm :wk "Show vterm")
    "s u" '(undo-tree-visualize :wk "Show Undotree"))

  (mark/leader-keys
    "t" '(:ignore t :wk "Toggle")
    "t t" '(visual-line-mode :wk "Toggle truncated lines (wrap)")
    "t l" '(display-line-numbers-mode :wk "Toggle line numbers")))

(menu-bar-mode -1)           ;; Disable the menu bar
(scroll-bar-mode -1)         ;; Disable the scroll bar
(tool-bar-mode -1)           ;; Disable the tool bar
(setq inhibit-startup-screen t) ;; Disable welcome screen

(delete-selection-mode 1)    ;; You can select text and delete it by typing.
(electric-indent-mode -1)    ;; Turn off the weird indenting that Emacs does by default.
(electric-pair-mode 1)       ;; Turns on automatic parens pairing

(global-auto-revert-mode t)  ;; Automatically reload file and show changes if the file has changed
(global-display-line-numbers-mode 1) ;; Display line numbers
(global-visual-line-mode t)  ;; Enable truncated lines

;; The following prevents <> from auto-pairing when electric-pair-mode is on.
;; Otherwise, org-tempo is broken when you try to <s TAB...
(add-hook 'org-mode-hook (lambda ()
                           (setq-local electric-pair-inhibit-predicate
                                       `(lambda (c)
                                          (if (char-equal c ?<) t (,electric-pair-inhibit-predicate c))))))
(setq display-line-numbers-type 'relative) ;; Relative line numbers
(global-display-line-numbers-mode)
(setq dired-kill-when-opening-new-dired-buffer t) ;; Dired don't create new buffer

(setq mouse-wheel-progressive-speed nil) ;; Disable progressive speed when scrolling
(setq scroll-conservatively 10) ;; Smooth scrolling when going down with scroll margin
(setq scroll-margin 8)

(setq make-backup-files nil) ;; Stop creating ~ backup files
(setq org-edit-src-content-indentation 4) ;; Set src block automatic indent to 4 instead of 2.
(setq-default tab-width 4)

;; Move customization variables to a separate file and load it, avoid filling up init.el with unnecessary variables
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

(global-set-key [escape] 'keyboard-escape-quit) ;; Makes Escape quit prompts (Minibuffer Escape)
(blink-cursor-mode 0) ;; Don't blink cursor
(add-hook 'prog-mode-hook (lambda () (hs-minor-mode t))) ;; Enable folding hide/show globally

(use-package gruvbox-theme
  :init
  (load-theme 'gruvbox-dark-medium t)) ;; We need to add t to trust this package

(add-to-list 'default-frame-alist '(alpha-background . 90)) ;; For all new frames henceforth

(set-face-attribute 'default nil
                    :font "JetBrains Mono" ;; Set your favorite type of font or download JetBrains Mono
                    :height 120
                    :weight 'medium)
;; This sets the default font on all graphical frames created after restarting Emacs.
;; Does the same thing as 'set-face-attribute default' above, but emacsclient fonts
;; are not right unless I also add this method of setting the default font.

(add-to-list 'default-frame-alist '(font . "JetBrains Mono")) ;; Set your favorite font
(setq-default line-spacing 0.12)

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 25      ;; Sets modeline height
        doom-modeline-bar-width 5    ;; Sets right bar width
        doom-modeline-persp-name t   ;; Adds perspective name to modeline
        doom-modeline-persp-icon t)) ;; Adds folder icon next to persp name

(use-package projectile
  :config
  (projectile-mode)
  :init
  (setq projectile-switch-project-action #'projectile-dired)
  (setq projectile-run-use-comint-mode t) ;; Interactive run dialog
  (setq projectile-project-search-path '(("~/Projects/" . 3) ("/mnt/Ext4D/Mark/Projektek/". 4))))
;; Use Bookmarks for non git projects

;; Automatically start eglot for a given file type.
(use-package eglot
  :ensure nil ;; Don't install eglot because it's now built-in
  :hook (('c-mode . 'eglot-ensure) ;; Autostart lsp servers
         ('c++-mode . 'eglot-ensure)
         ('csharp-mode . 'eglot-ensure)
         ('java-mode . 'eglot-ensure)
         ('html-mode . 'eglot-ensure)
         ('css-mode . 'eglot-ensure)
         ('javascript-mode . 'eglot-ensure)
         ('rust-mode . 'eglot-ensure)
         ('lua-mode . 'eglot-ensure)) ;; Lua-mode needs to be installed
  :config
  ;; No event buffers, disable providers cause a lot of hover traffic. Shutdown unused servers.
  (setq eglot-events-buffer-size 0
        eglot-ignored-server-capabilities '(:hoverProvider
                                            :documentHighlightProvider)
        eglot-autoshutdown t)
  (add-to-list 'eglot-server-programs
               `(lua-mode . ("~/.config/emacs/lsp-servers/lua-language-server-3.7.4-linux-x64/bin/lua-language-server" "-lsp"))) ;; Adds our lua lsp server to eglot's server list
  (add-to-list 'eglot-server-programs
               `(csharp-mode . ("/usr/share/omnisharp-roslyn-1.39.11/OmniSharp" "-lsp")))
  (add-to-list 'eglot-server-programs
               `(java-mode . ("~/.config/emacs/lsp-servers/jdt-language-server-1.31.0/bin/jdtls" "-lsp")))
  )

(use-package yasnippet-snippets
  :hook (prog-mode . yas-minor-mode))

(use-package lua-mode
  :mode "\\.lua\\'") ;; Only start in a lua file

(use-package rust-mode
  :mode "\\.rs\\'")

(use-package gdscript-mode
  :mode "\\.gd\\'")
(defun lsp--gdscript-ignore-errors (original-function &rest args)
  "Ignore the error message resulting from Godot not replying to the `JSONRPC' request."
  (if (string-equal major-mode "gdscript-mode")
      (let ((json-data (nth 0 args)))
        (if (and (string= (gethash "jsonrpc" json-data "") "2.0")
                 (not (gethash "id" json-data nil))
                 (not (gethash "method" json-data nil)))
            nil ; (message "Method not found")
          (apply original-function args)))
    (apply original-function args)))
;; Runs the function `lsp--gdscript-ignore-errors` around `lsp--get-message-type` to suppress unknown notification errors.
(advice-add #'lsp--get-message-type :around #'lsp--gdscript-ignore-errors)

(add-hook 'org-mode-hook 'org-indent-mode) ;; Indent text

(use-package toc-org
  :commands toc-org-enable
  :init (add-hook 'org-mode-hook 'toc-org-enable))

(use-package org-superstar
  :hook (org-mode . org-superstar-mode)
  :after org)

(with-eval-after-load 'org
  (require 'org-tempo))

(use-package vterm
  :config
  (setq vterm-max-scrollback 5000))

(use-package nerd-icons
  :if (display-graphic-p))

(use-package nerd-icons-dired
  :hook (dired-mode . (lambda () (nerd-icons-dired-mode t))))

(use-package nerd-icons-ibuffer
  :hook (ibuffer-mode . nerd-icons-ibuffer-mode))

(use-package magit
  :commands magit-status)

(use-package diff-hl
  :hook ((magit-pre-refresh-hook . diff-hl-magit-pre-refresh)
         (magit-post-refresh-hook . diff-hl-magit-post-refresh))
  :init (global-diff-hl-mode))

(use-package corfu
  ;; Optional customizations
  :custom
  (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  (corfu-auto t)                 ;; Enable auto completion
  (corfu-auto-prefix 2)          ;; Minimum length of prefix for auto completion.
  (corfu-popupinfo-mode t)       ;; Enable popup information
  (corfu-popupinfo-delay 0.5)    ;; Lower popupinfo delay to 0.5 seconds from 2 seconds
  :config
  (setq completion-ignore-case  t)
  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setq tab-always-indent 'complete)
  (setq corfu-preview-current nil) ;; Don't insert completion without confirmation

  ;; Recommended: Enable Corfu globally.  This is recommended since Dabbrev can
  ;; be used globally (M-/).  See also the customization variable
  ;; `global-corfu-modes' to exclude certain modes.
  :init
  (global-corfu-mode))

(use-package nerd-icons-corfu
  :after corfu
  :init (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package cape
  :after corfu
  :init
  ;; Add to the global default value of `completion-at-point-functions' which is
  ;; used by `completion-at-point'.  The order of the functions matters, the
  ;; first function returning a result wins.  Note that the list of buffer-local
  ;; completion functions takes precedence over the global list.
  ;; The functions that are added later will be the first in the list

  (add-to-list 'completion-at-point-functions #'cape-dabbrev) ;; Complete word from current buffers
  (add-to-list 'completion-at-point-functions #'cape-dict) ;; Dictionary completion
  (add-to-list 'completion-at-point-functions #'cape-file) ;; Path completion
  (add-to-list 'completion-at-point-functions #'cape-elisp-block) ;; Complete elisp in Org or Markdown mode
  (add-to-list 'completion-at-point-functions #'cape-keyword) ;; Keyword/Snipet completion

  ;;(add-to-list 'completion-at-point-functions #'cape-abbrev) ;; Complete abbreviation
  ;;(add-to-list 'completion-at-point-functions #'cape-history) ;; Complete from Eshell, Comint or minibuffer history
  ;;(add-to-list 'completion-at-point-functions #'cape-line) ;; Complete entire line from current buffer
  ;;(add-to-list 'completion-at-point-functions #'cape-elisp-symbol) ;; Complete Elisp symbol
  ;;(add-to-list 'completion-at-point-functions #'cape-tex) ;; Complete Unicode char from TeX command, e.g. \hbar
  ;;(add-to-list 'completion-at-point-functions #'cape-sgml) ;; Complete Unicode char from SGML entity, e.g., &alpha
  ;;(add-to-list 'completion-at-point-functions #'cape-rfc1345) ;; Complete Unicode char using RFC 1345 mnemonics
  )

(use-package ivy
  :bind
  (("C-c C-r" . ivy-resume) ;; Resumes the last Ivy-based completion.
   ("C-x B" . ivy-switch-buffer-other-window))
  :diminish
  :custom
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (setq enable-recursive-minibuffers t)
  :config
  (ivy-mode))

(use-package ivy-rich ;; This gets us descriptions in M-x.
  :init (ivy-rich-mode 1))

(use-package nerd-icons-ivy-rich ;; Adds icons to M-x.
  :init (nerd-icons-ivy-rich-mode 1))

(use-package counsel
  :diminish
  :config (counsel-mode))

(use-package undo-tree
  :init
  (global-undo-tree-mode)
  ;; Use separate directory for undo history
  (setq undo-tree-history-directory-alist '(("." . "~/.config/emacs/undoTree"))))

(use-package sudo-edit
  :config (setq sudo-edit-local-method "doas")) ;; To use doas

(use-package drag-stuff
  :init
  (drag-stuff-global-mode 1)
  (drag-stuff-define-keys))

(use-package diminish)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package rainbow-mode
  :diminish
  :hook
  ((org-mode prog-mode) . rainbow-mode))

(use-package which-key
  :init
  (which-key-mode 1)
  :diminish
  :config
  (setq which-key-side-window-location 'bottom
        which-key-sort-order #'which-key-key-order-alpha ;; Same as default, except single characters are sorted alphabetically
        which-key-sort-uppercase-first nil
        which-key-add-column-padding 1 ;; Number of spaces to add to the left of each column
        which-key-min-display-lines 6  ;; Increase the minimum lines to display, because the default is only 1
        which-key-idle-delay 0.8 ;; Set the time delay (in seconds) for the which-key popup to appear
        which-key-max-description-length 25))

(use-package ws-butler
  :init (ws-butler-global-mode))

;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))
;; Increase the amount of data which Emacs reads from the process
(setq read-process-output-max (* 1024 1024)) ;; 1mb
