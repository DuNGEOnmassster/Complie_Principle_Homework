	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 3
	.globl	_func                           ; -- Begin function func
	.p2align	2
_func:                                  ; @func
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	w0, [sp, #12]
	ldr	w8, [sp, #12]
	str	w8, [sp, #4]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
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
	mov	w8, #0
	str	w8, [sp]                        ; 4-byte Folded Spill
	stur	wzr, [x29, #-4]
	adrp	x9, _a1@PAGE
	mov	w8, #11
	str	w8, [x9, _a1@PAGEOFF]
	adrp	x9, _a2@GOTPAGE
	ldr	x9, [x9, _a2@GOTPAGEOFF]
	mov	w8, #22
	str	w8, [x9]
	mov	w8, #5
	str	w8, [sp, #8]
	ldr	w0, [sp, #8]
	bl	_func
	ldr	w0, [sp]                        ; 4-byte Folded Reload
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__DATA,__data
	.globl	_a1                             ; @a1
	.p2align	2
_a1:
	.long	1                               ; 0x1

	.comm	_a2,4,2                         ; @a2
.subsections_via_symbols
