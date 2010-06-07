; -*- Mode: Lisp; Package: editor -*-

#|
= is-mode - InstallScript �t�@�C����ҏW�����肷��

* Author:  MIYAMUKO Katsuyuki ((<URL:mailto:miyamuko@gmail.com>))
* URL: ((<URL:http://miyamuko.s56.xrea.com/xyzzy/is-mode/intro.htm>))
* Version: $Id: is-mode.l,v 1.9 2004/08/09 14:03:06 miyamuko Exp $


== ����

InstallScript (InstallShield �p�X�N���v�g) �p�̕ҏW���[�h�ł��B

* �K���ȃC���f���g
* �K���ȐF�Â�
* �L�[���[�h�̕⊮
* function �� #define �̃^�O�W�����v


== �C���X�g�[��

((<NetInstaller|URL:http://www.mirai.ne.jp/~gyo/xyzzy/ni.html>)) �ŃC���X�g�[�������ꍇ�� 3 �ȍ~���A
NetInstaller + (({ni-autoload})) ���g���Ă���l�� 4 �ȍ~�� OK �ł��B

(1) �A�[�J�C�u���_�E�����[�h���܂��B

    ((<URL:http://miyamuko.s56.xrea.com/xyzzy/archives/is-mode.zip>))

(2) �A�[�J�C�u��W�J���āA$XYZZY/site-lisp �z���Ƀt�@�C�����R�s�[���܂��B

(3) �g���q�� rul �̃t�@�C�����J�����Ƃ��Ɏ����I�� is-mode �ɂȂ�悤��
    ~/.xyzzy �܂��� $XYZZY/site-lisp/siteinit.l �Ɉȉ��̃R�[�h��ǉ����܂��B

        ;; is-mode
        (require "is-mode")
        (pushnew '("\\.rul$" . is-mode) *auto-mode-alist* :test 'equal)

(4) �ݒ�𔽉f�����邽�� xyzzy ���ċN�����Ă��������B

    ��siteinit.l �ɋL�q�����ꍇ�ɂ͍ă_���v���K�v�ł��B


== ���t�@�����X

=== �L�[���蓖��

: ((%TAB%))
    �C���f���g����B

    Compiler directive (#define�Ƃ�) �̓C���f���g���܂���B

: ((%RET%))
    ���s�{�C���f���g�t���B

: ((%M-TAB%))
    �L�[���[�h�Ƒg�ݍ��݊֐��̕⊮�B

    ��s���镶��������΂��̕�������n�܂�L�[���[�h���c�[���`�b�v�ŕ\�����܂��B
    ��s���镶�����Ȃ���΂��ׂẴL�[���[�h��\�����܂��B

=== �ϐ�

--- *is-label-level*
--- *is-label-offset*

�C���f���g���x����ݒ肵�܂��B

    ;; �C���f���g�̕�(���}�� _ �̕���, default=4)
    (setq *is-indent-level* 4)

    ;; ���x���̃I�t�Z�b�g(���}�� - �̕���, default=-4)
    ;;; �����̂��߂̂��肦�Ȃ��ݒ�B
    (setq *is-label-offset* 4)

    ;; function Foo(nBar)
    ;; ____number nFoo;
    ;; begin
    ;; ____if (nBar != 0) goto Baz;
    ;; ____nFoo = 10
    ;; ____----Label:
    ;; ____// ...
    ;; end;


== ���ꂩ���邩������Ȃ�����

* MSI �̃L�[���[�h���܂Ƃ߂�B
* ���t�@�����X�B
* �X�e�[�g�����g���p������ꍇ�̃C���f���g�������Ƃ���B
* �ł��A�ւȂ��傱�Ȃ̂ŕ��u


== ���m�̃o�O

�ȉ��̂悤�ȏꍇ�K�؂ɃC���f���g�ł��Ȃ��B

    if (szHoge == "HOGE"
    || szFoo == "FOO") then  // ���̍s���C���f���g�ł��Ȃ�
    endif;

    nPos = StrFind(svTarget,
    szFindMe);  // ������

�{���͎��̂悤�ɂ������B

    if (szHoge == "HOGE"
        || szFoo == "FOO") then
    endif;

    nPos = StrFind(svTarget,
                   szFindMe);

�ł����C���Ȃ��B


== �֘A���邩������Ȃ��y�[�W

: InstallShield - Software Installation and Migration for SysAdmins and Developers
    ((<URL:http://www.installshield.com/>))


== ���C�Z���X

properties-mode �͏C�� BSD ���C�Z���X�Ɋ�Â��ė��p�\�ł��B

  Copyright (C) 2003-2004 MIYAMUKO Katsuyuki. All rights reserved.

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are
  met:

  1 Redistributions of source code must retain the above copyright notice,
  this list of conditions and the following disclaimer as the first lines
  of this file unmodified.

  2 Redistributions in binary form must reproduce the above copyright
  notice, this list of conditions and the following disclaimer in the
  documentation and/or other materials provided with the distribution.

  THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
  ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
  OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
  SUCH DAMAGE.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:
|#


(provide "is-mode")
(in-package "editor")
(export '(*is-mode-hook*
          *is-mode-map*
          *is-comment-column*
          *is-indent-level*
          *is-label-offset*
          is-completion
          is-mode))

; �t�b�N
(defvar *is-mode-hook* nil
  "is-mode: �t�b�N�ϐ�")

; configuration
(defvar *is-comment-column* nil)
(defvar *is-indent-level* 4
  "�C���f���g�œ����X�y�[�X�̐�")
(defvar *is-label-offset* -4
  "���x���̃I�t�Z�b�g")

; compiled regexp
(defvar *is-label-regexp*
  (compile-regexp "^[ \t]*[A-Z_][A-Z0-9_]*:[ \t]*$")
  "���x���̐��K�\��")

(defvar *is-block-beg-regexp*
  (compile-regexp "\\<try\\|for\\|program\\|switch\\|while\\|function\\|repeat\\>")
  "�u���b�N���J�n���鎯�ʎq�̐��K�\���B
   ���̂ق��ɂ� if ... then ������B
   if ... goto label; �Ƃ������ʂ� if �\��������̂ŒP���� if �Ńu���b�N���J�n�ł��Ȃ��B
  ")

(defvar *is-block-mid-regexp*
  (compile-regexp "\\<begin\\|case\\|default\\|catch\\|else\\|elseif\\>"))

(defvar *is-block-end-regexp*
  (compile-regexp "\\<\\(until\\|end\\(catch\\|for\\|if\\|program\\|switch\\|while\\)?\\)\\>"))


; �L�[���[�h
(defvar *is-completion-list* nil
  "is-mode: �⊮���X�g�̃|�b�v�A�b�v")

(defvar *is-keyword-hash-table* nil)
(defvar *is-keyword-file* "InstallScript")

;; label color
(defvar *is-label-color* '(:keyword 0 :bold)
  "���x���̐F")

(defvar *is-regexp-keyword-list* nil
  "is-mode: ���K�\���L�[���[�h���X�g")

(setq *is-regexp-keyword-list*
  (compile-regexp-keyword-list
   `(
     ;; ���x���s
     (,*is-label-regexp* t ((0 . ,*is-label-color*)))
     )))


;; �V���^�b�N�X�e�[�u��
(defvar *is-mode-syntax-table* nil)
(unless *is-mode-syntax-table*
  (setq *is-mode-syntax-table* (make-syntax-table))
  (do ((x #x21 (1+ x))) ((>= x #x7f))
    (let ((c (code-char x)))
      (unless (alphanumericp c)
        (set-syntax-punctuation *is-mode-syntax-table* c))))
  ; �ȉ�mode�ɍ��킹�Đݒ�
  (set-syntax-word *is-mode-syntax-table* #\#)
  (set-syntax-string *is-mode-syntax-table* #\")
  (set-syntax-string *is-mode-syntax-table* #\')
  (set-syntax-escape *is-mode-syntax-table* #\\)
  (set-syntax-symbol *is-mode-syntax-table* #\_)
  (set-syntax-match *is-mode-syntax-table* #\( #\)) ; �Ή�����()�ɔ��
  (set-syntax-match *is-mode-syntax-table* #\{ #\})
  (set-syntax-match *is-mode-syntax-table* #\[ #\])
  (set-syntax-start-multi-comment *is-mode-syntax-table* "/*")
  (set-syntax-end-multi-comment *is-mode-syntax-table* "*/")
  (set-syntax-start-c++-comment *is-mode-syntax-table* #\/)
  (set-syntax-end-c++-comment *is-mode-syntax-table* #\LFD)
  )

;; �L�[�}�b�v
(defvar *is-mode-map* nil)
(unless *is-mode-map*
  (setq *is-mode-map* (make-sparse-keymap))
  ; �ȉ��L�[����
  (define-key *is-mode-map* #\# 'is-electric-insert)
  (define-key *is-mode-map* #\: 'is-electric-insert)
  (define-key *is-mode-map* #\C-h 'backward-delete-char-untabify-or-selection)
  (define-key *is-mode-map* #\TAB 'is-indent-line)
  (define-key *is-mode-map* #\C-M-q 'indent-sexp)
  (define-key *is-mode-map* #\RET 'is-newline-and-indent)
  (define-key *is-mode-map* #\M-TAB 'is-completion)       ; �⊮
  )

(defun is-electric-insert (&optional (arg 1))
  (interactive "*p")
  (self-insert-command arg)
  (is-indent-line))

(defun is-newline-and-indent (&optional (arg 1))
  (interactive "*p")
  (is-indent-line)
  (delete-trailing-spaces)
  (insert #\LFD arg)
  (is-indent-line))

; from c-indent-line
(defun is-indent-line ()
  (interactive "*")
  (if (or (not (interactive-p))
          *c-tab-always-indent*
          (save-excursion
            (skip-chars-backward " \t")
            (bolp)))
      (case (save-excursion
              (goto-bol)
              (parse-point-syntax))
        (:string)
        (:comment
         (let ((column (calc-c-comment-indent)))
           (when (integerp column)
             (smart-indentation column))))
        (t
         (let ((column (calc-is-indent)))
           (when (integerp column)
             (smart-indentation column)))))
    (insert "\t"))
  t)

(defun is-previous-line ()
  "�O�̗L���ȍs�܂Ŗ߂�"
  (let ((in-conditional-compilation nil))
    (save-restriction
      (while (forward-line -1)
        (goto-bol)
        (cond
         ;; #else �̒��ɂ���ꍇ #ifdef �̑O�܂Ŗ߂�
         (in-conditional-compilation
          (if (looking-at "[ \t]*#ifn?def")
              (setq in-conditional-compilation nil)))
         ((equal (parse-point-syntax) :comment)
          ; nop
          )
         ((looking-at "[ \t]*#else")
          (setq in-conditional-compilation t))
         ((not (or (is-space-line) (is-compiler-directive) (is-label)))
          (return-from is-previous-line t))
         ))
      )))

(defun is-space-line ()
  "��s���ǂ���"
  (save-excursion
    (goto-bol)
    (looking-at "[ \t]*$")))

(defun is-compiler-directive ()
  "compiler directive ���ǂ���"
  (save-excursion
    (goto-bol)
    (looking-at "[ \t]*#")))

(defun is-label ()
  "���x�����ǂ���"
  (save-excursion
    (goto-bol)
    (looking-at *is-label-regexp*)))

(defun calc-is-indent ()
  "�C���f���g���鐔�𐔂���B"
  (let ((column 0))
    ; compiler directive �̓C���f���g�Ȃ�
    (if (is-compiler-directive)
        (return-from calc-is-indent 0))

    (save-excursion
      ;�O�̍s�𒲂ׂ�
      (when (is-previous-line)
        (save-restriction
          (narrow-to-region (progn (goto-eol) (point))
                            (progn (goto-bol) (point)))
          (goto-bol)
          (skip-chars-forward " \t")
          ; �C���f���g��
          (setq column (current-column))
;          (msgbox "base indent(line ~D): ~D" (current-line-number) column)

          ; �J�����̂�����΃C���f���g���𑝂₷
          (cond
           ((or (looking-at *is-block-beg-regexp*)
                (looking-at *is-block-mid-regexp*)
                (and (looking-at "if") (scan-buffer "then[ \t]*$" :regexp t)))
            (incf column *is-indent-level*)
;            (msgbox " open ~D" column)
            ))
          )))
    ; ���݂̍s�𒲂ׂ�
    (save-excursion
      (goto-bol)
      (skip-chars-forward " \t")
      ; �����̂�����΃C���f���g�������炷
      (cond
       ((or (looking-at *is-block-mid-regexp*)
            (looking-at *is-block-end-regexp*))
        (decf column *is-indent-level*)
;        (msgbox "close ~D" column)
        ))
      ; ���x���Ȃ� *is-label-offset* �����₷
      (if (is-label)
          (return-from calc-is-indent (+ column *is-label-offset*)))
      )
    column
    ))


; �⊮
;; addrev-table
(defvar *is-mode-abbrev-table* nil)
(unless *is-mode-abbrev-table*
  (define-abbrev-table '*is-mode-abbrev-table*))

;; popup �⊮
(defun is-completion ()
  "is-mode: �⊮"
  (interactive)
  (or *is-completion-list*
      (setq *is-completion-list* (make-list-from-keyword-table *is-keyword-hash-table*))
      (return-from is-completion nil))
  (let ((opoint (point)))
    (skip-syntax-spec-backward "w_")
    (let ((from (point)))
      (goto-char opoint)
      ; :list-ignore-case=�⊮�ő啶������������ʂ��Ȃ�, :list=����
      (do-completion from opoint :list-ignore-case *is-completion-list*
                     nil nil *is-completion-list* ; xyzzy 0.2.2.211�ȑO���g���ꍇ�̓R�����g�A�E�g
                     ))))

; function ���̈ꗗ
(defun is-build-summary-of-functions ()
  (let ((result nil))
    (save-excursion
      (goto-char (point-min))
      (while (scan-buffer (concat "^[ \t]*function[ \t]+"
                                  "\\([a-zA-Z0-9_]+[ \t]+\\)?"
                                  "\\([a-zA-Z0-9_]+\\)[ \t]*(")
                          :regexp t :tail t)
        (push (list (current-line-number) (match-string 2)) result)))
    (nreverse result)
    ))

; tag
(pushnew '(is-maketags "*.rul" "*.h") *maketags-list* :key #'car)

(defun tags-find-is-point (class name functionp point)
  (goto-char (- point *jump-tag-limit*))
  (and (or (scan-buffer "^#[ \t]*define[ \t]+[A-Z_]+"
                        :regexp t :limit (+ point *jump-tag-limit*))
           (scan-buffer (concat "^[ \t]*function[ \t]+"
                                "\\([a-zA-Z]+[ \t]+\\)?"
                                (regexp-quote name) "[ \t]+(")
                        :regexp t :limit (+ point *jump-tag-limit*)))
       (point)))

;; function ���^�O�t��
;;   function [return type] name (parameters)
(defun is-maketags (file count)
  (goto-char (point-min))
  (while (scan-buffer "^[ \t]*\\(#define\\|function\\)[ \t]+" :regexp t :tail t :case-fold t)
    (do-events)
    (when (and (equal (match-string 1) "function")
               (looking-at "[a-zA-Z0-9_]+[ \t]+"))
      (goto-char (match-end 0)))
    (let ((opoint (point)))
      (skip-chars-forward "a-zA-Z0-9_")
      (unless (= opoint (point))
        (format t "~A~A~D" (buffer-substring opoint (point)) file opoint)
        (setq count (1+ count)))))
  count)

; mode�̎��s
(defun is-mode ()
  "is-mode"
  (interactive)
  (kill-all-local-variables)
  (setq mode-name "InstallScript")
  (setq buffer-mode 'is-mode)
  (use-syntax-table *is-mode-syntax-table*)
  (use-keymap *is-mode-map*)

  ; ����W�J
  (setq *local-abbrev-table* *is-mode-abbrev-table*)

  (make-local-variable 'paragraph-start)
  (setq paragraph-start "^$\\|\f") ; forward|backward-paragraph �ňړ�����i���ʒu
  (make-local-variable 'paragraph-separate)
  (setq paragraph-separate paragraph-start)

  ; �^�O�֘A
  (make-local-variable 'tags-find-target)
  (setq tags-find-target #'tags-find-target-simple)
  (make-local-variable 'tags-find-point)
  (setq tags-find-point #'tags-find-is-point)
  (make-local-variable 'build-summary-function)
  (setq build-summary-function 'is-build-summary-of-functions)

  ; indent
  (make-local-variable 'mode-specific-indent-command)
  (setq mode-specific-indent-command 'is-indent-line)
  (make-local-variable 'mode-newline-and-indent-command)
  (setq mode-newline-and-indent-command 'is-newline-and-indent)

  ; comment
  (setq comment-start "// " comment-end "") ; indent-for-comment�ő}�������z
  (setq comment-start-skip "/+[ \t]*")
  (setq comment-indent-function 'calc-is-indent)
  (when *is-comment-column*
    (setq comment-column *is-comment-column*))

  ; keyword
  (and *is-keyword-file*
       (null *is-keyword-hash-table*)
       (setq *is-keyword-hash-table*
             (load-keyword-file *is-keyword-file* nil))) ; t=�啶������������ʂ��Ȃ�, nil=����
  (when *is-keyword-hash-table*
    (make-local-variable 'keyword-hash-table)
    (setq keyword-hash-table *is-keyword-hash-table*))
  (make-local-variable 'regexp-keyword-list)
  (setq regexp-keyword-list *is-regexp-keyword-list*)

  ; �t�b�N�̎��s
  (run-hooks '*is-mode-hook*))