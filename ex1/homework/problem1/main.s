	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 3
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	wzr, [x29, #-4]
	mov	w8, #10
	str	w8, [sp, #8]
	mov	w8, #5
	str	w8, [sp, #8]
	bl	_f1
	bl	_FUNC2
	ldr	w8, [sp, #8]
	subs	w8, w8, #5
	b.ne	LBB0_2
	b	LBB0_1
LBB0_1:
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	b	LBB0_3
LBB0_2:
	ldr	w9, [sp, #8]
                                        ; implicit-def: $x8
	mov	x8, x9
	adrp	x0, l_.str.1@PAGE
	add	x0, x0, l_.str.1@PAGEOFF
	mov	x9, sp
	str	x8, [x9]
	bl	_printf
	b	LBB0_3
LBB0_3:
	mov	w0, #0
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__DATA,__data
	.globl	_global_var1                    ; @global_var1
	.p2align	2
_global_var1:
	.long	5                               ; 0x5

	.p2align	2                               ; @main.local_var2
_main.local_var2:
	.long	20                              ; 0x14

	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"local var1 is still 5\n"

l_.str.1:                               ; @.str.1
	.asciz	"local var1 changed, now is %d\n"

	.comm	_global_var2,4,2                ; @global_var2
.subsections_via_symbols
