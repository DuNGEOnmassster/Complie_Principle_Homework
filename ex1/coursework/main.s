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
	ldr	w0, [sp, #8]
	adrp	x8, _g1@PAGE
	ldr	w1, [x8, _g1@PAGEOFF]
	bl	_add
	str	w0, [sp, #4]
	ldr	w8, [sp, #4]
	adrp	x9, _g2@GOTPAGE
	ldr	x9, [x9, _g2@GOTPAGEOFF]
	ldr	w9, [x9]
	add	w8, w8, w9
	str	w8, [sp, #4]
	ldr	w0, [sp, #4]
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__DATA,__data
	.globl	_g1                             ; @g1
	.p2align	2
_g1:
	.long	10                              ; 0xa

	.comm	_g2,4,2                         ; @g2
.subsections_via_symbols
