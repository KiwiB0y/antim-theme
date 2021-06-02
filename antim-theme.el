;;; antim-theme.el --- the dark theme created to save your eyes

;; Copyright 2021-present, All rights reserved
;; Code licensed under the GNU GPL v.3 license

;; Author: KiwiB0y
;; Version: 0.0.1
;; URL: https://github.com/KiwiB0y/antim-theme


;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; This file is not part of GNU Emacs.

;;; Comentary:

;; This theme is a GNU Emacs theme created by Kiwib0y
;; It's only GUI support for now

;;; Code:
(require 'cl-lib)
(deftheme antim)

(defgroup antim nil
  "Antim theme options.
Reload the theme after changing anything in this group."
  :group 'faces)

(defcustom antim-enlarge-headings t
  "Use different font sizes for some headings and titles."
  :type 'boolean
  :group 'antim)

(defcustom antim-height-title-1 1.3
  "Font size 100%."
  :type 'number
  :group 'antim)

(defcustom antim-height-title-2 1.1
  "Font size 110%."
  :type 'number
  :group 'antim)

(defcustom antim-height-title-3 1.0
  "Font size 130%."
  :type 'number
  :group 'antim)

(defcustom antim-height-doc-title 1.44
  "Font size 144%."
  :type 'number
  :group 'antim)

(defcustom antim-alternate-mode-line-and-minibuffer nil
  "Use less pink in the minibuffer."
  :type 'boolean
  :group 'antim)

(defvar antim-use-24-bit-colors-on-256-colors-terms nil)

(let ((colors '(;; Upstream theme color
                (antim-bg              "#231d27" "unspecified-bg")  ; official background
                (antim-fg              "#eeefff")                   ; official foreground
                (antim-current         "#18161b")                   ; official current-line/selection
                (antim-comment         "#696969")                   ; official comment
                (antim-string-cyan     "#affeff")                   ; official cyan
                (antim-green           "#296f68")                   ; official green
		(antim-light-green     "#75b9ab")                   ; official light-green
		(antim-cursor-green    "#0D493b")                   ; official cursor
                (antim-orange          "#ab873c")                   ; official orange
                (antim-pink            "#cf4a96")                   ; official pink
                (antim-purple          "#7d6691")                   ; official purple
                (antim-red             "#b22222")                   ; official red
                (antim-yellow          "#f0dc7d")                   ; official yellow

                ;; Other colors
                (bg2-dark-pink         "#452a3f")
                (fg2                   "#b6b6b2")
		(other-white           "#ddefff")
		(dark-blue             "#19537f")

		;; delimiters
		(antim-delimiter-one   "#cf4a96")
		(antim-delimiter-two   "#296f68")
		(antim-delimiter-three "#f0dc7d")
		(antim-delimiter-four  "#19537f")))

      (faces '(;; default themes
	       (default :foreground ,antim-fg :background ,antim-bg)
	       (cursor :background ,antim-cursor-green)
	       (fringe :background ,antim-bg :foreground ,fg2)

               (default-italic :slant italic)
               (ffap :foreground ,fg2)
               (fringe :background ,antim-bg :foreground ,fg2)
               (highlight :foreground ,antim-fg :background ,antim-bg)
               (hl-line :background ,antim-current :extend t)
               (info-quoted-name :foreground ,antim-orange)
               (info-string :foreground ,antim-string-cyan)
               (lazy-highlight :foreground ,fg2 :background ,bg2-dark-pink)
               (link :foreground ,antim-yellow :underline t)
               (linum :slant italic :foreground ,antim-pink :background ,antim-bg)
               (line-number :slant italic :foreground ,antim-fg :background ,antim-bg)
               (match :background ,antim-green :foreground ,antim-bg)
	       (minibuffer-prompt
		,@(if antim-alternate-mode-line-and-minibuffer
                      (list :weight 'normal :foreground antim-fg)
                    (list :weight 'bold :foreground antim-pink)))
	       (read-multiple-choice-face :inherit completions-first-difference)
	       ; syntax
	       (font-lock-builtin-face :foreground ,antim-orange)
               (font-lock-comment-face :foreground ,antim-comment)
               (font-lock-comment-delimiter-face :foreground ,antim-comment)
               (font-lock-constant-face :foreground ,antim-string-cyan)
               (font-lock-doc-face :foreground ,antim-comment)
               (font-lock-function-name-face :foreground ,antim-green :weight bold)
               (font-lock-keyword-face :weight bold :foreground ,antim-pink)
               (font-lock-negation-char-face :foreground ,antim-string-cyan)
               (font-lock-preprocessor-face :foreground ,antim-orange)
               (font-lock-reference-face :foreground ,antim-string-cyan)
               (font-lock-regexp-grouping-backslash :foreground ,antim-string-cyan)
               (font-lock-regexp-grouping-construct :foreground ,antim-purple)
               (font-lock-string-face :foreground ,antim-yellow)
               (font-lock-type-face :foreground ,antim-purple)
               (font-lock-variable-name-face :foreground ,antim-fg
                                             :weight bold)
               (font-lock-warning-face :foreground ,antim-red :background ,bg2-dark-pink)

	       ;; rainbow-delimiter
	       (rainbow-delimiters-depth-1-face :foreground ,antim-delimiter-one)
               (rainbow-delimiters-depth-2-face :foreground ,antim-delimiter-two)
               (rainbow-delimiters-depth-3-face :foreground ,antim-delimiter-three)
               (rainbow-delimiters-depth-4-face :foreground ,antim-delimiter-four)
               (rainbow-delimiters-depth-5-face :foreground ,antim-delimiter-one)
               (rainbow-delimiters-depth-6-face :foreground ,antim-delimiter-two)
               (rainbow-delimiters-depth-7-face :foreground ,antim-delimiter-three)
               (rainbow-delimiters-depth-8-face :foreground ,antim-delimiter-four)
               (rainbow-delimiters-unmatched-face :foreground ,antim-orange :background ,bg2-dark-pink)

	       ;; dired
               (dired-directory :foreground ,antim-green :weight normal)
               (dired-flagged :foreground ,antim-pink)
               (dired-header :foreground ,antim-light-green
			     :weight bold :background ,antim-bg)
               (dired-ignored :inherit shadow)
               (dired-mark :foreground ,antim-fg :weight bold)
               (dired-marked :foreground ,antim-orange :weight bold)
               (dired-perm-write :foreground ,antim-fg :underline t)
               (dired-symlink :foreground ,antim-yellow :weight normal :slant italic)
               (dired-warning :foreground ,antim-orange :underline t))))

  (apply #'custom-theme-set-faces
	 'antim
	 (let ((color-names (mapcar #'car colors))
	       (graphic-colors (mapcar #'cadr colors))
	       (expand-for-kind
		(lambda (kind spec)
		  (when (and (string= (symbol-name kind) "term-colors")
			     antim-use-24-bit-colors-on-256-colors-terms)
		    (setq kind 'graphic-colors))
		  (cl-progv color-names (symbol-value kind)
		    (eval `(backquote ,spec))))))
	   (cl-loop for (face . spec) in faces
		    collect `(,face
			      ((((min-colors 16777216)) ; fully graphical environment
				,(funcall expand-for-kind 'graphic-colors spec))))))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
	       (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'antim)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:

;;; antim-theme.el ends here
