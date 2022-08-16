(defconst athena-registers
  '("r0" "r1" "r2" "r3" "r4" "r5" "r6" "r7" "r8" "r9" "r10" "r11" "r12"
    "r13" "r14" "r15" "r16" "r17" "r18" "r19" "r20" "r21" "r22" "r23" "r24"
    "r25" "r26" "r27" "r28" "r29" "r30" "r31"

    "zero" "v0" "v1" "v2" "v3" "v4" "v5" "v6" "v7" "a0" "a1" "k0" "k1"
    "at" "sp" "gp" "fp" "ra"))

(defconst athena-instructions
  '("add" "addi" "addiu" "addu" "sub" "subi" "subiu" "subu"
    "and" "andi" "nor" "or" "ori" "xor" "xori"
    "b" "beq" "beqz" "bgt" "bgtz" "blt" "bltz" "bne" "bnez"
    "call" "jmp"
    "div" "divu" "mod" "modu" "mult" "multu"
    "lb" "lbu" "lh" "lhu" "lw"
    "lih" "la"
    "mvsrr" "mvsrw"
    "nop" "trap"
    "sb" "sh" "sw"
    "sll" "sllr" "sra" "srar" "srl" "srlr"))

(defconst athena-constants
  "\\<$?[-+]?[0-9][-+_0-9A-Fa-fHhXxDdTtQqOoBbYyeE.]*\\>")

(defvar athena-font-lock-defaults
  `((
     ( ,athena-constants . font-lock-constant-face)
     ( ,(regexp-opt athena-instructions 'words) . font-lock-builtin-face)
     ( ,(regexp-opt athena-registers 'words) . font-lock-variable-name-face))))

(define-derived-mode athena-mode asm-mode "Athena ASM"
  "Athena Mojor Mode"
  (setq font-lock-defaults athena-font-lock-defaults))

(provide 'athena-mode)
