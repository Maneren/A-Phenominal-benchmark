.global AND_REG_REG

.section .text

.macro AND_MACRO
	and x1, x1, x12
	and x2, x2, x12
	and x3, x3, x12
	and x4, x4, x12
	and x5, x5, x12
	and x6, x6, x12
	and x7, x7, x12
	and x8, x8, x12
.endm

AND_REG_REG:
	mov x1, 0
	mov x2, 0
	mov x3, 0
	mov x4, 0
	mov x5, 0
	mov x6, 0
	mov x7, 0
	mov x8, 0

	mov x12, 0

	mov x0, 8388608

.AndLoop:
	AND_MACRO
	AND_MACRO
	AND_MACRO
	AND_MACRO
	AND_MACRO
	AND_MACRO
	AND_MACRO
	AND_MACRO
	AND_MACRO
	AND_MACRO
	AND_MACRO
	AND_MACRO
	AND_MACRO
	AND_MACRO
	AND_MACRO
	AND_MACRO

	sub x0, x0, 1
	cmp x0, 0

	bne .AndLoop
	ret
