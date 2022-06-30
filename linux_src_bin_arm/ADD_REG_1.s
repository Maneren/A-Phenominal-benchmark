.global ADD_REG_1

.macro ADD_MACRO
	add x1, x1, 1
	add x2, x2, 1
	add x3, x3, 1
	add x4, x4, 1
	add x5, x5, 1
	add x6, x6, 1
	add x7, x7, 1
	add x8, x8, 1
.endm

ADD_REG_1:
	mov x1, 0
	mov x2, 0
	mov x3, 0
	mov x4, 0
	mov x5, 0
	mov x6, 0
	mov x7, 0
	mov x8, 0

	mov x0, 8388608

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

	sub x0, x0, 1
	cmp x0, 0

	bne .AddLoop
	ret
