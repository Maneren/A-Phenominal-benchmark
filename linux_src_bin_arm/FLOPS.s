.global FLOPS_SSE
.global FLOPS_AVX
.global FLOPS_AVX512

.section .text

.macro fadd_SSE
	fadd	s1, s1, s0
	fadd	s2, s2, s0
	fadd	s3, s3, s0
	fadd	s4, s4, s0
	fadd	s5, s5, s0
	fadd	s6, s6, s0
	fadd	s7, s7, s0
	fadd	s8, s8, s0
.endm

.macro fadd_AVX
	fadd	s1, s1, s0
	fadd	s2, s2, s0
	fadd	s3, s3, s0
	fadd	s4, s4, s0
	fadd	s5, s5, s0
	fadd	s6, s6, s0
	fadd	s7, s7, s0
	fadd	s8, s8, s0
	fadd	s9, s9, s0
	fadd	s10, s10, s0
	fadd	s11, s11, s0
	fadd	s12, s12, s0
	fadd	s13, s13, s0
	fadd	s14, s14, s0
	fadd	s15, s15, s0
.endm

FLOPS_SSE:
	mov x0, 2097152

.SSEHead:
	fadd_SSE
	fadd_SSE
	fadd_SSE
	fadd_SSE
	fadd_SSE
	fadd_SSE
	fadd_SSE
	fadd_SSE
	fadd_SSE
	fadd_SSE
	fadd_SSE
	fadd_SSE
	fadd_SSE
	fadd_SSE
	fadd_SSE
	fadd_SSE

	sub x0, x0, 1
	cmp x0, 0

	bne .SSEHead
	ret

FLOPS_AVX:
	mov x0, 1048576

.AVXLoop:
	fadd_AVX
	fadd_AVX
	fadd_AVX
	fadd_AVX
	fadd_AVX
	fadd_AVX
	fadd_AVX
	fadd_AVX

	sub x0, x0, 1
	cmp x0, 0

	bne .AVXLoop
	ret
