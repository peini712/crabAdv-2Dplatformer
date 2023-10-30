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
	.file	"sprites.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	spriteDraw.part.0, %function
spriteDraw.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r2, .L11
	ldrsh	r3, [r0]
	ldrsb	lr, [r0, #16]
	ldrh	ip, [r2]
	add	r2, r3, lr
	cmp	r2, ip
	ldr	r1, [r0, #28]
	bgt	.L10
.L2:
	ldrb	r3, [r1, #1]	@ zero_extendqisi2
	bic	r3, r3, #1
	orr	r3, r3, #2
	strb	r3, [r1, #1]
	pop	{r4, r5, lr}
	bx	lr
.L10:
	add	r2, ip, #239
	cmp	r3, r2
	bgt	.L2
	ldr	r4, .L11+4
	ldrsh	r2, [r0, #2]
	ldrsb	r5, [r0, #17]
	ldrh	r0, [r4]
	add	r4, r2, r5
	cmp	r4, r0
	ble	.L2
	add	r4, r0, #159
	cmp	r2, r4
	bgt	.L2
	ldrb	r4, [r1, #1]	@ zero_extendqisi2
	subs	r3, r3, ip
	bic	ip, r4, #3
	strb	ip, [r1, #1]
	sub	r0, r2, r0
	bpl	.L4
	add	lr, lr, r3
	cmp	lr, #0
	addgt	r3, r3, #508
	addgt	r3, r3, #3
.L4:
	cmp	r0, #0
	bge	.L5
	add	r5, r5, r0
	cmp	r5, #0
	addgt	r0, r0, #255
.L5:
	ldrh	r2, [r1, #2]
	lsr	r2, r2, #9
	orr	r2, r2, r3, lsl #23
	ror	r2, r2, #23
	strb	r0, [r1]
	strh	r2, [r1, #2]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	hOff
	.word	vOff
	.size	spriteDraw.part.0, .-spriteDraw.part.0
	.align	2
	.global	hideSprites
	.syntax unified
	.arm
	.fpu softvfp
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r0, .L17
.L14:
	add	r1, r0, r2, lsl #3
	ldrb	r3, [r1, #1]	@ zero_extendqisi2
	add	r2, r2, #1
	bic	r3, r3, #1
	orr	r3, r3, #2
	cmp	r2, #128
	strb	r3, [r1, #1]
	bne	.L14
	bx	lr
.L18:
	.align	2
.L17:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.align	2
	.global	createSprite
	.syntax unified
	.arm
	.fpu softvfp
	.type	createSprite, %function
createSprite:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r5, .L26
	mov	r6, r0
	mov	r3, r5
	mov	ip, #0
	b	.L22
.L20:
	add	ip, ip, #1
	cmp	ip, #64
	add	r3, r3, #36
	beq	.L25
.L22:
	ldrb	r2, [r3, #22]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L20
	add	r0, ip, ip, lsl #3
	mov	r4, r6
	add	r5, r5, r0, lsl #2
	mov	lr, r5
	mov	r7, #1
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldr	r3, .L26+4
	ldr	r2, [r4]
	add	r0, r3, ip, lsl #3
	str	r2, [lr]
	strb	r7, [r5, #22]
	str	r0, [r5, #28]
	mov	r2, #8
	ldr	r1, [r6, #28]
	ldr	r3, .L26+8
	mov	lr, pc
	bx	r3
	mov	r0, r5
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L25:
	mov	r0, #0
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	sprite_pool
	.word	shadowOAM
	.word	memcpy
	.size	createSprite, .-createSprite
	.align	2
	.global	createUI
	.syntax unified
	.arm
	.fpu softvfp
	.type	createUI, %function
createUI:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L35
	mov	r1, r0
	mov	r2, r4
	mov	r3, #0
	b	.L31
.L29:
	add	r3, r3, #1
	cmp	r3, #64
	add	r2, r2, #36
	beq	.L34
.L31:
	ldrb	ip, [r2, #22]	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L29
	mov	lr, #1
	ldr	r2, .L35+4
	add	r0, r2, r3, lsl #3
	add	r3, r3, r3, lsl #3
	add	r4, r4, r3, lsl #2
	strb	ip, [r4, #12]
	str	r0, [r4, #28]
	strb	lr, [r4, #22]
	mov	r2, #8
	ldr	r3, .L35+8
	mov	lr, pc
	bx	r3
	mov	r0, r4
	pop	{r4, lr}
	bx	lr
.L34:
	mov	r0, #0
	pop	{r4, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	sprite_pool
	.word	shadowOAM
	.word	memcpy
	.size	createUI, .-createUI
	.align	2
	.global	recreateSprite
	.syntax unified
	.arm
	.fpu softvfp
	.type	recreateSprite, %function
recreateSprite:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	lr, r1
	mov	ip, r0
	mov	r5, r0
	mov	r7, #1
	mov	r6, r1
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldr	r4, .L39
	ldmia	lr!, {r0, r1, r2, r3}
	sub	r4, r5, r4
	stmia	ip!, {r0, r1, r2, r3}
	asr	r3, r4, #2
	rsb	r2, r3, r3, lsl #3
	add	r2, r2, r2, lsl #6
	add	r2, r3, r2, lsl #3
	rsb	r2, r2, r2, lsl #15
	ldr	r0, .L39+4
	ldr	r1, [lr]
	add	r3, r3, r2, lsl #3
	add	r0, r0, r3, lsl #3
	str	r1, [ip]
	strb	r7, [r5, #22]
	str	r0, [r5, #28]
	mov	r2, #8
	ldr	r1, [r6, #28]
	ldr	r3, .L39+8
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L40:
	.align	2
.L39:
	.word	sprite_pool
	.word	shadowOAM
	.word	memcpy
	.size	recreateSprite, .-recreateSprite
	.align	2
	.global	freeSprite
	.syntax unified
	.arm
	.fpu softvfp
	.type	freeSprite, %function
freeSprite:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r1, [r0, #28]
	strb	r2, [r0, #22]
	ldrb	r3, [r1, #1]	@ zero_extendqisi2
	bic	r3, r3, #1
	orr	r3, r3, #2
	strb	r3, [r1, #1]
	str	r2, [r0, #28]
	bx	lr
	.size	freeSprite, .-freeSprite
	.global	__aeabi_idivmod
	.align	2
	.global	updateSprites
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSprites, %function
updateSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r6, .L57
	mov	r5, #0
	mov	r4, r6
	mov	r8, #15
	ldr	r7, .L57+4
	b	.L52
.L44:
	add	r5, r5, #1
	cmp	r5, #64
	add	r4, r4, #36
	beq	.L55
.L52:
	ldrb	r3, [r4, #22]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L44
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L48
	mov	r0, r4
	mov	lr, pc
	bx	r3
	ldrb	r3, [r4, #22]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L44
.L48:
	add	r3, r5, r5, lsl #3
	add	r3, r6, r3, lsl #2
	ldrb	r3, [r3, #12]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L44
	ldrsb	r2, [r4, #16]
	ldrsb	r3, [r4, #18]
	mul	r3, r2, r3
	add	r2, r3, #7
	cmp	r3, #0
	movlt	r3, r2
	ldr	r9, [r4, #28]
	ldrb	r0, [r4, #23]	@ zero_extendqisi2
	ldrb	r2, [r9, #4]	@ zero_extendqisi2
	ldrsb	r1, [r4, #20]
	add	r3, r0, r3, asr #3
	and	r0, r3, #15
	bic	r3, r2, #30
	orr	r3, r3, r0, lsl #1
	cmp	r1, #1
	strb	r3, [r9, #4]
	ble	.L56
	ldrb	r3, [r4, #13]	@ zero_extendqisi2
	sub	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	strb	r3, [r4, #13]
	bne	.L51
	ldrb	r0, [r4, #19]	@ zero_extendqisi2
	add	r0, r0, #1
	lsl	r0, r0, #24
	asr	r0, r0, #24
	mov	lr, pc
	bx	r7
	strb	r8, [r4, #13]
	strb	r1, [r4, #19]
.L51:
	ldrsb	r2, [r4, #17]
	ldrsb	r3, [r4, #19]
	mul	r3, r2, r3
	add	r2, r3, #7
	cmp	r3, #0
	movlt	r3, r2
	ldrb	r1, [r4, #24]	@ zero_extendqisi2
	ldrh	r2, [r9, #4]
	add	r3, r1, r3, asr #3
	and	r1, r3, #31
	bic	r3, r2, #992
	orr	r3, r3, r1, lsl #5
	strh	r3, [r9, #4]	@ movhi
.L50:
	mov	r0, r4
	add	r5, r5, #1
	bl	spriteDraw.part.0
	cmp	r5, #64
	add	r4, r4, #36
	bne	.L52
.L55:
	ldr	r4, .L57+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L57+12
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L56:
	ldrh	r3, [r9, #4]
	ldrb	r2, [r4, #24]	@ zero_extendqisi2
	bic	r3, r3, #992
	and	r2, r2, #31
	orr	r3, r3, r2, lsl #5
	strh	r3, [r9, #4]	@ movhi
	b	.L50
.L58:
	.align	2
.L57:
	.word	sprite_pool
	.word	__aeabi_idivmod
	.word	DMANow
	.word	shadowOAM
	.size	updateSprites, .-updateSprites
	.align	2
	.global	clearSprites
	.syntax unified
	.arm
	.fpu softvfp
	.type	clearSprites, %function
clearSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r3, .L67
	add	r0, r3, #2304
.L61:
	ldrb	r2, [r3, #22]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L60
	ldr	r1, [r3, #28]
	ldrb	r2, [r1, #1]	@ zero_extendqisi2
	bic	r2, r2, #1
	orr	r2, r2, #2
	strb	ip, [r3, #22]
	strb	r2, [r1, #1]
	str	ip, [r3, #28]
.L60:
	add	r3, r3, #36
	cmp	r3, r0
	bne	.L61
	bx	lr
.L68:
	.align	2
.L67:
	.word	sprite_pool
	.size	clearSprites, .-clearSprites
	.align	2
	.global	spriteInCamera
	.syntax unified
	.arm
	.fpu softvfp
	.type	spriteInCamera, %function
spriteInCamera:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L74
	ldrsh	r1, [r0]
	ldrsb	r3, [r0, #16]
	ldrh	r2, [r2]
	add	r3, r3, r1
	cmp	r3, r2
	ble	.L73
	add	r2, r2, #239
	cmp	r1, r2
	bgt	.L73
	ldr	r1, .L74+4
	ldrsh	r3, [r0, #2]
	ldrsb	r2, [r0, #17]
	ldrh	r0, [r1]
	add	r2, r2, r3
	cmp	r2, r0
	ble	.L73
	add	r0, r0, #159
	cmp	r3, r0
	movgt	r0, #0
	movle	r0, #1
	bx	lr
.L73:
	mov	r0, #0
	bx	lr
.L75:
	.align	2
.L74:
	.word	hOff
	.word	vOff
	.size	spriteInCamera, .-spriteInCamera
	.align	2
	.global	spriteCollide
	.syntax unified
	.arm
	.fpu softvfp
	.type	spriteCollide, %function
spriteCollide:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldrsh	r2, [r1, #2]
	ldrsb	lr, [r1, #17]
	ldrsb	ip, [r1, #16]
	sub	sp, sp, #16
	ldrsh	r3, [r1]
	stmib	sp, {r2, ip, lr}
	str	r3, [sp]
	ldr	r4, .L78
	ldrsb	r3, [r0, #17]
	ldrsb	r2, [r0, #16]
	ldrsh	r1, [r0, #2]
	ldrsh	r0, [r0]
	mov	lr, pc
	bx	r4
	and	r0, r0, #255
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L79:
	.align	2
.L78:
	.word	collision
	.size	spriteCollide, .-spriteCollide
	.align	2
	.global	spriteDraw
	.syntax unified
	.arm
	.fpu softvfp
	.type	spriteDraw, %function
spriteDraw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrb	r3, [r0, #22]	@ zero_extendqisi2
	cmp	r3, #0
	bxeq	lr
	b	spriteDraw.part.0
	.size	spriteDraw, .-spriteDraw
	.comm	shadowOAM,1024,4
	.comm	sprite_pool,2304,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
