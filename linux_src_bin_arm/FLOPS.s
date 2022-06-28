global FLOPS_SSE
global FLOPS_AVX
global FLOPS_AVX512

section .text

; 8x phenom II
%macro ADD_SSE 0
	addps xmm0, xmm1
	addps xmm0, xmm2
	addps xmm0, xmm3
	addps xmm0, xmm4
	addps xmm0, xmm5
	addps xmm0, xmm6
	addps xmm0, xmm7
	addps xmm0, xmm8
%endmacro

; For AVX capable CPU's
%macro ADD_AVX 0
	vaddps ymm0, ymm1, ymm1
	vaddps ymm0, ymm2, ymm2
	vaddps ymm0, ymm3, ymm3
	vaddps ymm0, ymm4, ymm4
	vaddps ymm0, ymm5, ymm5
	vaddps ymm0, ymm6, ymm6
	vaddps ymm0, ymm7, ymm7
	vaddps ymm0, ymm8, ymm8
	vaddps ymm0, ymm9, ymm9
	vaddps ymm0, ymm10, ymm10
	vaddps ymm0, ymm11, ymm11
	vaddps ymm0, ymm12, ymm12
	vaddps ymm0, ymm13, ymm13
	vaddps ymm0, ymm14, ymm14
	vaddps ymm0, ymm15, ymm15
%endmacro;


; For AVX512 capable CPU's
%macro ADD_AVX512 0
	vaddps zmm0, zmm1, zmm1
	vaddps zmm0, zmm2, zmm2
	vaddps zmm0, zmm3, zmm3
	vaddps zmm0, zmm4, zmm4
	vaddps zmm0, zmm5, zmm5
	vaddps zmm0, zmm6, zmm6
	vaddps zmm0, zmm7, zmm7
	vaddps zmm0, zmm8, zmm8
	vaddps zmm0, zmm9, zmm9
	vaddps zmm0, zmm10, zmm10
	vaddps zmm0, zmm11, zmm11
	vaddps zmm0, zmm12, zmm12
	vaddps zmm0, zmm13, zmm13
	vaddps zmm0, zmm14, zmm14
	vaddps zmm0, zmm15, zmm15
	vaddps zmm0, zmm16, zmm16
	vaddps zmm0, zmm17, zmm17
	vaddps zmm0, zmm18, zmm18
	vaddps zmm0, zmm19, zmm19
	vaddps zmm0, zmm20, zmm20
	vaddps zmm0, zmm21, zmm21
	vaddps zmm0, zmm22, zmm22
	vaddps zmm0, zmm23, zmm23
	vaddps zmm0, zmm24, zmm24
	vaddps zmm0, zmm25, zmm25
	vaddps zmm0, zmm26, zmm26
	vaddps zmm0, zmm27, zmm27
	vaddps zmm0, zmm28, zmm28
	vaddps zmm0, zmm29, zmm29
	vaddps zmm0, zmm30, zmm30
	vaddps zmm0, zmm31, zmm31
%endmacro

FLOPS_SSE:
	push rbx
	push rdi
	push rsi
	push rbp
	push r11
	push r8
	push r9
	push r10

	push r12

	mov r12, (1024*1024*1024)/(128 * 4)	; x4 for SSE

.LoopHead:
	ADD_SSE
	ADD_SSE
	ADD_SSE
	ADD_SSE
	ADD_SSE
	ADD_SSE
	ADD_SSE
	ADD_SSE
	ADD_SSE
	ADD_SSE
	ADD_SSE
	ADD_SSE
	ADD_SSE
	ADD_SSE
	ADD_SSE
	ADD_SSE

	dec r12
	jnz .LoopHead

	pop r12
	pop r10
	pop r9
	pop r8
	pop r11
	pop rbp
	pop rsi
	pop rdi
	pop rbx
	ret

FLOPS_AVX:
	push rbx
	push rdi
	push rsi
	push rbp
	push r11
	push r8
	push r9
	push r10
	push r12

	mov r12, (1024*1024*1024)/(128 * 8)		; x8 for AVX2

	; Set all the AVX regs to 0.0
	vxorps ymm0, ymm0, ymm0
	vxorps ymm1, ymm1, ymm1
	vxorps ymm2, ymm2, ymm2
	vxorps ymm3, ymm3, ymm3
	vxorps ymm4, ymm4, ymm4
	vxorps ymm5, ymm5, ymm5
	vxorps ymm6, ymm6, ymm6
	vxorps ymm7, ymm7, ymm7
	vxorps ymm8, ymm8, ymm8
	vxorps ymm9, ymm9, ymm9
	vxorps ymm10, ymm10, ymm10
	vxorps ymm11, ymm11, ymm11
	vxorps ymm12, ymm12, ymm12
	vxorps ymm13, ymm13, ymm13
	vxorps ymm14, ymm14, ymm14
	vxorps ymm15, ymm15, ymm15


.LoopHead:
	ADD_AVX
	ADD_AVX
	ADD_AVX
	ADD_AVX
	ADD_AVX
	ADD_AVX
	ADD_AVX
	ADD_AVX

	dec r12
	jnz .LoopHead

	pop r12
	pop r10
	pop r9
	pop r8
	pop r11
	pop rbp
	pop rsi
	pop rdi
	pop rbx
	ret



FLOPS_AVX512:
	push rbx
	push rdi
	push rsi
	push rbp
	push r11
	push r8
	push r9
	push r10
	push r12

	mov r12, (1024*1024*1024)/(128 * 16)		; x16 for AVX512

	; Set all the AVX512 regs to 0.0
	vxorps zmm0, zmm0, zmm0
	vxorps zmm1, zmm1, zmm1
	vxorps zmm2, zmm2, zmm2
	vxorps zmm3, zmm3, zmm3
	vxorps zmm4, zmm4, zmm4
	vxorps zmm5, zmm5, zmm5
	vxorps zmm6, zmm6, zmm6
	vxorps zmm7, zmm7, zmm7
	vxorps zmm8, zmm8, zmm8
	vxorps zmm9, zmm9, zmm9
	vxorps zmm10, zmm10, zmm10
	vxorps zmm11, zmm11, zmm11
	vxorps zmm12, zmm12, zmm12
	vxorps zmm13, zmm13, zmm13
	vxorps zmm14, zmm14, zmm14
	vxorps zmm15, zmm15, zmm15
	vxorps zmm16, zmm16, zmm16
	vxorps zmm17, zmm17, zmm17
	vxorps zmm18, zmm18, zmm18
	vxorps zmm19, zmm19, zmm19
	vxorps zmm20, zmm20, zmm20
	vxorps zmm21, zmm21, zmm21
	vxorps zmm22, zmm22, zmm22
	vxorps zmm23, zmm23, zmm23
	vxorps zmm24, zmm24, zmm24
	vxorps zmm25, zmm25, zmm25
	vxorps zmm26, zmm26, zmm26
	vxorps zmm27, zmm27, zmm27
	vxorps zmm28, zmm28, zmm28
	vxorps zmm29, zmm29, zmm29
	vxorps zmm30, zmm30, zmm30
	vxorps zmm31, zmm31, zmm31


.LoopHead:
	ADD_AVX512
	ADD_AVX512
	ADD_AVX512
	ADD_AVX512

	dec r12
	jnz .LoopHead

	pop r12
	pop r10
	pop r9
	pop r8
	pop r11
	pop rbp
	pop rsi
	pop rdi
	pop rbx
	ret

