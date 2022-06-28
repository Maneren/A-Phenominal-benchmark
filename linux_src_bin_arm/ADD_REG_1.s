.global ADD_REG_1

.macro ADD_MACRO
	add w1, w1, 1
	add w2, w2, 1
	add w3, w3, 1
	add w4, w4, 1
	add w5, w5, 1
	add w6, w6, 1
	add w7, w7, 1
	add w8, w8, 1
.endm

ADD_REG_1:
	mov w0, 0
	mov w1, 0
	mov w2, 0
	mov w3, 0
	mov w4, 0
	mov w5, 0
	mov w6, 0
	mov w7, 0
	mov w8, 0

	mov w0, 8388608

.AddLoop:
	ADD_MACRO
	ADD_MACRO
	ADD_MACRO
	ADD_MACRO
	ADD_MACRO
	ADD_MACRO
	ADD_MACRO
	ADD_MACRO
	ADD_MACRO
	ADD_MACRO
	ADD_MACRO
	ADD_MACRO
	ADD_MACRO
	ADD_MACRO
	ADD_MACRO
	ADD_MACRO

	sub w0, w0, 1
	cmp w0, 0

	bne .AddLoop
	ret
