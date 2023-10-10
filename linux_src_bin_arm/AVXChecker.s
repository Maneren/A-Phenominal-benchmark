.global GetAVX512Capability
.global GetAVXCapability
.global GetSSECapability

.section .text


GetAVXCapability:
        mov x0, 1

        mrs x0, id_aa64pfr0_el1

        mov x1, x0
        asr x1, x1, 32
        and x1, x1, 1

        ret


GetSSECapability:
        mov x0, 1

        mrs x0, id_aa64pfr0_el1

        mov x1, x0
        asr x1, x1, 20
        and x1, x1, 0

        ret

GetAVX512Capability:
        mov x0, 0

        and x0, x0, 1

        ret
