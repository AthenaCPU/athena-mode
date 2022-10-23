(defconst athena-registers
  '( ;; base registers
    "r0" "r1" "r2" "r3" "r4" "r5" "r6" "r7" "r8" "r9" "r10" "r11" "r12"
    "r13" "r14" "r15" "r16" "r17" "r18" "r19" "r20" "r21" "r22" "r23" "r24"
    "r25" "r26" "r27" "r28" "r29" "r30" "r31"

    "zero" "v0" "v1" "v2" "v3" "v4" "v5" "v6" "v7" "a0" "a1" "k0" "k1"
    "at" "sp" "gp" "fp" "ra"

    ;; special reg
    "isa" "vendorid" "status" "trapvec" "inten" "epc" "cause"

    ;; -----------------------------------------------------------------
    ;;  FPU
    "f0" "f1" "f2" "f3" "f4" "f5" "f6" "f7" "f8" "f9" "f10" "f11" "f12"
    "f13" "f14" "f15" "f16" "f17" "f18" "f19" "f20" "f21" "f22" "f23"
    "f24" "f25" "f26" "f27" "f28" "f29" "f30" "f31"
    ))

(defconst athena-instructions
  '(
    "add" "addi" "addiu" "addu" "sub" "subi" "subiu" "subu"

    "and" "andi" "nor" "or" "ori" "xor" "xori"

    "beq" "bgt" "blt" "bne"

    "call" "jmp"

    "div" "divu" "mult" "multu" "mod" "modu"

    "lb" "lbu" "lh" "lhu" "lw"

    "lih"

    "mvsrw" "mvsrr"

    "nop"

    "sb" "sh" "sw"

    "sll" "sllr" "sra" "srar" "srl" "srlr"

    "trap"

    ;; --------------------------------------------------------
    ;;  FPU extension
    ;; --------------------------------------------------------
    "abs.f" "add.f" "div.f" "mod.f" "mult.f" "neg.f" "sub.f"))

(defconst athena-pseudo-instructions
  '("b" "beqz" "bgtz" "bltz" "bnez" "la" "li"))

(defconst athena-constants
  "\\<$?[-+]?[0-9][-+_0-9A-Fa-fHhXxDdTtQqOoBbYyeE.]*\\>")

(defconst athena-directives
  ;; TODO
  '(".org" ".incbin" ".section" ".include" ".extern" ".global" ".include"))

(defvar athena-font-lock-defaults
  `((
     ( ,athena-constants . font-lock-constant-face)
     ( ,(regexp-opt athena-instructions 'words) . font-lock-keyword-face)
     ( ,(regexp-opt athena-pseudo-instructions 'words) . font-lock-variable-name-face)
     ( ,(regexp-opt athena-registers 'words) . font-lock-type-face))
     ( ,(regexp-opt athena-directives 'words) . font-lock-preprocessor-face)))

(define-derived-mode athena-mode asm-mode "Athena Assembly"
  "Athena Mojor Mode"
  (setq font-lock-defaults athena-font-lock-defaults))
  
(provide 'athena-mode)
