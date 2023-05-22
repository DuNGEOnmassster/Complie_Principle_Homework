	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 3
	.globl	_sum                            ; -- Begin function sum
	.p2align	2
_sum:                                   ; @sum
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	w0, [sp, #28]
	str	w1, [sp, #24]
	str	w2, [sp, #20]
	str	w3, [sp, #16]
	str	w4, [sp, #12]
	str	w5, [sp, #8]
	ldr	w8, [sp, #28]
	ldr	w9, [sp, #24]
	add	w8, w8, w9
	ldr	w9, [sp, #20]
	add	w8, w8, w9
	ldr	w9, [sp, #16]
	add	w8, w8, w9
	ldr	w9, [sp, #12]
	add	w8, w8, w9
	ldr	w9, [sp, #8]
	add	w0, w8, w9
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, #0
	str	w8, [sp, #12]                   ; 4-byte Folded Spill
	stur	wzr, [x29, #-4]
	mov	w8, #1
	stur	w8, [x29, #-12]
	mov	w8, #2
	stur	w8, [x29, #-16]
	mov	w8, #3
	stur	w8, [x29, #-20]
	mov	w8, #4
	str	w8, [sp, #24]
	mov	w8, #5
	str	w8, [sp, #20]
	mov	w8, #6
	str	w8, [sp, #16]
	ldur	w0, [x29, #-12]
	ldur	w1, [x29, #-16]
	ldur	w2, [x29, #-20]
	ldr	w3, [sp, #24]
	ldr	w4, [sp, #20]
	ldr	w5, [sp, #16]
	bl	_sum
	mov	x8, x0
	ldr	w0, [sp, #12]                   ; 4-byte Folded Reload
	stur	w8, [x29, #-8]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
