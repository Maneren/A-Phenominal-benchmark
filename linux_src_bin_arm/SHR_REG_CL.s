.global SHR_REG_CL
.global SHR_REG_CL_AVX_512

.section .text

.macro SHR_MACRO
	asr x1, x1, 1
	asr x2, x2, 1
	asr x3, x3, 1
	asr x4, x4, 1
	asr x5, x5, 1
	asr x6, x6, 1
	asr x7, x7, 1
	asr x8, x8, 1
.endm


SHR_REG_CL:
	mov x1, 0
	mov x2, 0
	mov x3, 0
	mov x4, 0
	mov x5, 0
	mov x6, 0
	mov x7, 0
	mov x8, 0

	mov x0, 8388608

.ShrHead:
	SHR_MACRO
	SHR_MACRO
	SHR_MACRO
	SHR_MACRO
	SHR_MACRO
	SHR_MACRO
	SHR_MACRO
	SHR_MACRO
	SHR_MACRO
	SHR_MACRO
	SHR_MACRO
	SHR_MACRO
	SHR_MACRO
	SHR_MACRO
	SHR_MACRO
	SHR_MACRO
	
	sub x0, x0, 1
	cmp x0, 0

	bne .ShrHead
	ret

SHR_REG_CL_AVX_512:
  ret
