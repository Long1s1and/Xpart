    .section .text.entry
    .align 2
    .globl _traps 
_traps:
    # -----------
    # 1. save 32 registers and sepc to stack
    sd sp, -8(sp)
    sd ra, -16(sp)
    sd gp, -24(sp)
    sd tp, -32(sp)
    sd t0, -40(sp)
    sd t1, -48(sp)
    sd t2, -56(sp)
    sd s0, -64(sp)
    sd s1, -72(sp)
    sd a0, -80(sp)
    sd a1, -88(sp)
    sd a2, -96(sp)
    sd a3, -104(sp)
    sd a4, -112(sp)
    sd s5, -120(sp)
    sd a6, -128(sp)
    sd a7, -136(sp)
    sd s2, -144(sp)
    sd s3, -152(sp)
    sd s4, -160(sp)
    sd s5, -168(sp)
    sd s6, -176(sp)
    sd s7, -184(sp)
    sd s8, -192(sp)
    sd s9, -200(sp)
    sd s10, -208(sp)
    sd s11, -216(sp)
    sd t3, -224(sp)
    sd t4, -232(sp)
    sd t5, -240(sp)
    sd t6, -248(sp)
    addi sp, sp, -248
    # -----------
    # 2. call trap_handler
    
    csrr a0, scause
    csrr a1, sepc
    call trap_handler
    # -----------
    # 3. restore sepc and 32 registers (x2(sp) should be restore last) from stack

#     li t1, 0x8000000000000005
#     csrr a0, scause
#     csrr a1, sepc
#     beq a0, t1, _csrwrite
#     addi a1, a1, 4
# _csrwrite:
#     csrw sepc, a1

    ld t6, 0(sp)
    ld t5, 8(sp)
    ld t4, 16(sp)
    ld t3, 24(sp)
    ld s11, 32(sp)
    ld s10, 40(sp)
    ld s9, 48(sp)
    ld s8, 56(sp)
    ld s7, 64(sp)
    ld s6, 72(sp)
    ld s5, 80(sp)
    ld s4, 88(sp)
    ld s3, 96(sp)
    ld s2, 104(sp)
    ld a7, 112(sp)
    ld a6, 120(sp)
    ld a5, 128(sp)
    ld a4, 136(sp)
    ld a3, 144(sp)
    ld a2, 152(sp)
    ld a1, 160(sp)
    ld a0, 168(sp)
    ld s1, 176(sp)
    ld s0, 184(sp)
    ld t2, 192(sp)
    ld t1, 200(sp)
    ld t0, 208(sp)
    ld tp, 216(sp)
    ld gp, 224(sp)
    ld ra, 232(sp)
    ld sp, 240(sp)
    # -----------
    # 4. return from trap
    sret
    # -----------
    .extern dummy
    .globl __dummy
__dummy:
    la t0, dummy
    csrw sepc, t0
    sret

    .globl __switch_to
__switch_to:
    sd ra, 40(a0)
    sd sp, 48(a0)
    sd s0, 56(a0)
    sd s1, 64(a0)
    sd s2, 72(a0)
    sd s3, 80(a0)
    sd s4, 88(a0)
    sd s5, 96(a0)
    sd s6, 104(a0)
    sd s7, 112(a0)
    sd s8, 120(a0)
    sd s9, 128(a0)
    sd s10, 136(a0)
    sd s11, 144(a0)

    ld ra, 40(a1)
    ld sp, 48(a1)
    ld s0, 56(a1)
    ld s1, 64(a1)
    ld s2, 72(a1)
    ld s3, 80(a1)
    ld s4, 88(a1)
    ld s5, 96(a1)
    ld s6, 104(a1)
    ld s7, 112(a1)
    ld s8, 120(a1)
    ld s9, 128(a1)
    ld s10, 136(a1)
    ld s11, 144(a1)

