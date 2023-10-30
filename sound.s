	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"sound.c"
	.text
	.align	2
	.global	setupSounds
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #128
	str	lr, [sp, #-4]!
	mvn	r2, #170
	mov	lr, #8
	mov	ip, #97
	mov	r0, #1
	strh	r1, [r3, #132]	@ movhi
	ldr	r1, .L4
	strh	r2, [r3, #128]	@ movhi
	strh	r1, [r3, #130]	@ movhi
	strh	lr, [r3, #4]	@ movhi
	ldr	r2, .L4+4
	ldr	r1, .L4+8
	ldr	r3, .L4+12
	strh	ip, [r2]	@ movhi
	strh	r0, [r2, #8]	@ movhi
	ldr	lr, [sp], #4
	str	r3, [r1, #4092]
	bx	lr
.L5:
	.align	2
.L4:
	.word	-1266
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupSounds, .-setupSounds
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSoundA
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r7, #0
	ldr	r3, .L8+8
	ldr	r3, [r3]
	mov	r5, r1
	mov	r6, r0
	mov	r8, r2
	mov	r1, r0
	str	r7, [r3, #20]
	mov	r0, #1
	mov	r3, #910163968
	ldr	r2, .L8+12
	ldr	r4, .L8+16
	mov	lr, pc
	bx	r4
	mov	r2, #1
	mvn	r0, #1520
	mov	r1, #128
	ldr	r4, .L8+20
	ldr	r3, .L8+24
	strh	r7, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	mov	r0, r5
	str	r5, [r4, #4]
	str	r2, [r4, #8]
	ldr	r3, .L8+28
	str	r6, [r4]
	str	r8, [r4, #12]
	mov	lr, pc
	bx	r3
	ldr	r5, .L8+32
	adr	r3, .L8
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r5, .L8+36
	ldr	r3, .L8+40
	mov	lr, pc
	bx	r5
	ldr	r3, .L8+44
	mov	lr, pc
	bx	r3
	str	r7, [r4, #20]
	str	r0, [r4, #16]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L9:
	.align	3
.L8:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109024
	.word	DMANow
	.word	soundA
	.word	67109120
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	1086687360
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	playSoundB
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r7, #0
	ldr	r3, .L12+8
	ldr	r3, [r3]
	mov	r5, r1
	mov	r6, r0
	mov	r8, r2
	mov	r1, r0
	str	r7, [r3, #32]
	mov	r0, #2
	mov	r3, #910163968
	ldr	r2, .L12+12
	ldr	r4, .L12+16
	mov	lr, pc
	bx	r4
	mov	r2, #1
	mvn	r0, #1520
	mov	r1, #128
	ldr	r4, .L12+20
	ldr	r3, .L12+24
	strh	r7, [r3, #6]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	strh	r1, [r3, #6]	@ movhi
	mov	r0, r5
	str	r5, [r4, #4]
	str	r2, [r4, #8]
	ldr	r3, .L12+28
	str	r6, [r4]
	str	r8, [r4, #12]
	mov	lr, pc
	bx	r3
	ldr	r5, .L12+32
	adr	r3, .L12
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r5, .L12+36
	ldr	r3, .L12+40
	mov	lr, pc
	bx	r5
	ldr	r3, .L12+44
	mov	lr, pc
	bx	r3
	str	r7, [r4, #20]
	str	r0, [r4, #16]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L13:
	.align	3
.L12:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109028
	.word	DMANow
	.word	soundB
	.word	67109120
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	1086687360
	.word	__aeabi_d2iz
	.size	playSoundB, .-playSoundB
	.align	2
	.global	interruptHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L29
	ldrh	r1, [r3, #2]
	tst	r1, #1
	push	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	beq	.L16
	ldr	r3, .L29+4
	ldr	r2, [r3, #8]
	cmp	r2, #0
	beq	.L18
	add	r1, r3, #16
	ldm	r1, {r1, r2}
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #20]
	ble	.L18
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L27
	ldr	r0, .L29+8
	ldr	r1, .L29+12
	ldr	r0, [r0]
	str	r2, [r3, #8]
	str	r2, [r0, #20]
	strh	r2, [r1, #2]	@ movhi
.L18:
	ldr	r3, .L29+16
	ldr	r2, [r3, #8]
	cmp	r2, #0
	beq	.L16
	add	r1, r3, #16
	ldm	r1, {r1, r2}
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #20]
	ble	.L16
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L28
	ldr	r0, .L29+8
	ldr	r1, .L29+12
	ldr	r0, [r0]
	str	r2, [r3, #8]
	str	r2, [r0, #32]
	strh	r2, [r1, #6]	@ movhi
.L16:
	mov	r1, #1
	ldr	r3, .L29
	ldrh	r2, [r3, #2]
	ldrh	r2, [r3, #2]
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L27:
	ldm	r3, {r0, r1}
	bl	playSoundA
	b	.L18
.L28:
	ldm	r3, {r0, r1}
	bl	playSoundB
	b	.L16
.L30:
	.align	2
.L29:
	.word	67109376
	.word	soundA
	.word	dma
	.word	67109120
	.word	soundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	pauseSounds
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseSounds, %function
pauseSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L32
	ldr	r0, .L32+4
	ldr	r1, .L32+8
	str	r3, [r0, #8]
	str	r3, [r1, #8]
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L33:
	.align	2
.L32:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	pauseSounds, .-pauseSounds
	.align	2
	.global	unpauseSounds
	.syntax unified
	.arm
	.fpu softvfp
	.type	unpauseSounds, %function
unpauseSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #128
	mov	r3, #1
	ldr	r2, .L35
	ldr	ip, .L35+4
	ldr	r0, .L35+8
	strh	r1, [r2, #2]	@ movhi
	str	r3, [ip, #8]
	strh	r1, [r2, #6]	@ movhi
	str	r3, [r0, #8]
	bx	lr
.L36:
	.align	2
.L35:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	unpauseSounds, .-unpauseSounds
	.align	2
	.global	stopSounds
	.syntax unified
	.arm
	.fpu softvfp
	.type	stopSounds, %function
stopSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L38
	ldr	ip, .L38+4
	strh	r3, [r2, #2]	@ movhi
	ldr	r0, .L38+8
	strh	r3, [r2, #6]	@ movhi
	ldr	r1, .L38+12
	ldr	r2, [ip]
	str	r3, [r0, #8]
	str	r3, [r2, #20]
	str	r3, [r1, #8]
	str	r3, [r2, #32]
	bx	lr
.L39:
	.align	2
.L38:
	.word	67109120
	.word	dma
	.word	soundA
	.word	soundB
	.size	stopSounds, .-stopSounds
	.align	2
	.global	setupInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #97
	str	lr, [sp, #-4]!
	mov	r0, #67108864
	mov	lr, #1
	mov	ip, #8
	ldr	r3, .L42
	ldr	r2, .L42+4
	strh	r1, [r3]	@ movhi
	ldr	r1, .L42+8
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [r2, #4092]
	bx	lr
.L43:
	.align	2
.L42:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.comm	soundB,24,4
	.comm	soundA,24,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
