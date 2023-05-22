	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 3
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
	stur	wzr, [x29, #-4]
	stur	wzr, [x29, #-8]
	ldur	w8, [x29, #-8]
	add	w8, w8, #2
	lsl	w8, w8, #1
	stur	w8, [x29, #-12]
	ldur	w8, [x29, #-8]
	add	w8, w8, #2
	lsl	w8, w8, #1
	str	w8, [sp, #24]
	ldur	w8, [x29, #-12]
                                        ; implicit-def: $x10
	mov	x10, x8
	ldr	w9, [sp, #24]
                                        ; implicit-def: $x8
	mov	x8, x9
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	mov	x9, sp
	str	x10, [x9]
	str	x8, [x9, #8]
	bl	_printf
	stur	wzr, [x29, #-16]
	b	LBB0_1
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	ldur	w8, [x29, #-16]
	ldur	w9, [x29, #-12]
	subs	w8, w8, w9
	b.gt	LBB0_8
	b	LBB0_2
LBB0_2:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldur	w8, [x29, #-16]
	mov	w9, #3
	mul	w8, w8, w9
	subs	w8, w8, #1
	stur	w8, [x29, #-20]
	ldur	w8, [x29, #-20]
	ldr	w9, [sp, #24]
	subs	w8, w8, w9
	b.ge	LBB0_4
	b	LBB0_3
LBB0_3:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldur	w8, [x29, #-20]
	ldur	w9, [x29, #-16]
	subs	w8, w8, w9
	b.ge	LBB0_5
	b	LBB0_4
LBB0_4:                                 ;   in Loop: Header=BB0_1 Depth=1
	adrp	x0, l_.str.1@PAGE
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
	b	LBB0_6
LBB0_5:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldur	w9, [x29, #-20]
                                        ; implicit-def: $x8
	mov	x8, x9
	adrp	x0, l_.str.2@PAGE
	add	x0, x0, l_.str.2@PAGEOFF
	mov	x9, sp
	str	x8, [x9]
	bl	_printf
	b	LBB0_6
LBB0_6:                                 ;   in Loop: Header=BB0_1 Depth=1
	b	LBB0_7
LBB0_7:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldur	w8, [x29, #-16]
	add	w8, w8, #1
	stur	w8, [x29, #-16]
	b	LBB0_1
LBB0_8:
	stur	wzr, [x29, #-16]
	b	LBB0_9
LBB0_9:                                 ; =>This Inner Loop Header: Depth=1
	ldur	w8, [x29, #-16]
	ldur	w9, [x29, #-12]
	subs	w8, w8, w9
	b.gt	LBB0_14
	b	LBB0_10
LBB0_10:                                ;   in Loop: Header=BB0_9 Depth=1
	mov	w8, #2
	str	w8, [sp, #20]
	ldur	w8, [x29, #-16]
	ldr	w9, [sp, #20]
	subs	w8, w8, w9
	b.lt	LBB0_12
	b	LBB0_11
LBB0_11:
	adrp	x0, l_.str.3@PAGE
	add	x0, x0, l_.str.3@PAGEOFF
	bl	_printf
	b	LBB0_14
LBB0_12:                                ;   in Loop: Header=BB0_9 Depth=1
	ldur	w9, [x29, #-16]
                                        ; implicit-def: $x8
	mov	x8, x9
	adrp	x0, l_.str.4@PAGE
	add	x0, x0, l_.str.4@PAGEOFF
	mov	x9, sp
	str	x8, [x9]
	bl	_printf
	b	LBB0_13
LBB0_13:                                ;   in Loop: Header=BB0_9 Depth=1
	ldur	w8, [x29, #-16]
	add	w8, w8, #1
	stur	w8, [x29, #-16]
	b	LBB0_9
LBB0_14:
	mov	w0, #0
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"y1 = %d, y2 = %d\n"

l_.str.1:                               ; @.str.1
	.asciz	"Dangerous! Not process\n"

l_.str.2:                               ; @.str.2
	.asciz	"Normal Status. With j = %d\n"

l_.str.3:                               ; @.str.3
	.asciz	"Reach boundary, break loop.\n"

l_.str.4:                               ; @.str.4
	.asciz	"Within boundary, now count i as %d\n"

.subsections_via_symbols
