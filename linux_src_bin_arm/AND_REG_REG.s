.global AND_REG_REG

.section .text

.macro AND_MACRO
	and w1, w1, w12
	and w2, w2, w12
	and w3, w3, w12
	and w4, w4, w12
	and w5, w5, w12
	and w6, w6, w12
	and w7, w7, w12
	and w8, w8, w12
.endm

AND_REG_REG:
	mov w0, 0
	mov w1, 0
	mov w2, 0
	mov w3, 0
	mov w4, 0
	mov w5, 0
	mov w6, 0
	mov w7, 0
	mov w8, 0

	mov w12, 0

	mov w0, 8388608

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

	sub w0, w0, 1
	cmp w0, 0

	bne .AndLoop
	ret
