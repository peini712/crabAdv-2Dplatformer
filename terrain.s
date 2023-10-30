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
	.file	"terrain.c"
	.text
	.align	2
	.global	isNotTerrain
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	isNotTerrain, %function
isNotTerrain:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L3
	ldr	r3, .L3+4
	ldr	r2, [r2]
	ldr	r3, [r3]
	mla	r1, r2, r1, r3
	ldrb	r0, [r1, r0]	@ zero_extendqisi2
	bx	lr
.L4:
	.align	2
.L3:
	.word	mapWidth
	.word	mapCollisionBitmap
	.size	isNotTerrain, .-isNotTerrain
	.align	2
	.global	isTerrain
	.syntax unified
	.arm
	.fpu softvfp
	.type	isTerrain, %function
isTerrain:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L6
	ldr	r3, .L6+4
	ldr	r2, [r2]
	ldr	r3, [r3]
	mla	r1, r2, r1, r3
	ldrb	r0, [r1, r0]	@ zero_extendqisi2
	rsbs	r0, r0, #1
	movcc	r0, #0
	bx	lr
.L7:
	.align	2
.L6:
	.word	mapWidth
	.word	mapCollisionBitmap
	.size	isTerrain, .-isTerrain
	.align	2
	.global	collideTerrain
	.syntax unified
	.arm
	.fpu softvfp
	.type	collideTerrain, %function
collideTerrain:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldrsh	r4, [r0, #2]
	ldrsh	ip, [r0]
	lsr	r3, r4, #31
	orrs	r3, r3, ip, lsr #31
	bne	.L16
	ldrsb	lr, [r0, #16]
	add	lr, lr, ip
	cmp	lr, r1
	bgt	.L16
	ldrsb	r1, [r0, #17]
	add	r0, r4, r1
	cmp	r0, r2
	bgt	.L16
	cmp	r1, #0
	mov	r0, r3
	ble	.L9
	ldr	r3, .L21
	ldr	r5, [r3]
	mla	r4, r5, r4, lr
	ldr	r3, .L21+4
	ldr	r3, [r3]
	add	r3, r3, r4
	b	.L10
.L20:
	ldrb	r2, [r3, #-1]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L16
	cmp	r1, r0
	add	r3, r3, r5
	beq	.L19
.L10:
	sub	r2, r3, lr
	ldrb	r2, [r2, ip]	@ zero_extendqisi2
	cmp	r2, #0
	add	r0, r0, #1
	bne	.L20
.L16:
	mov	r0, #1
.L9:
	pop	{r4, r5, lr}
	bx	lr
.L19:
	mov	r0, #0
	b	.L9
.L22:
	.align	2
.L21:
	.word	mapWidth
	.word	mapCollisionBitmap
	.size	collideTerrain, .-collideTerrain
	.align	2
	.global	spriteTryMove
	.syntax unified
	.arm
	.fpu softvfp
	.type	spriteTryMove, %function
spriteTryMove:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r5, r0
	bne	.L75
	cmp	r2, #0
	moveq	r0, r2
	bne	.L76
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L76:
	ldrsh	r9, [r5, #2]
	mov	r6, r9
	ble	.L40
	ldrsb	r6, [r5, #17]
	add	r6, r6, r9
	ldr	r3, .L81
	sub	r6, r6, #1
	adds	r0, r2, r6
	ldr	r3, [r3]
	bmi	.L41
	cmp	r0, r3
	blt	.L44
.L41:
	sub	r3, r3, r6
	sub	r2, r3, #1
.L45:
	cmp	r2, #0
	moveq	r0, r2
	eor	r7, r2, r2, asr #31
	moveq	r3, r0
	sub	r7, r7, r2, asr #31
	beq	.L47
.L46:
	ldr	r0, .L81+4
	ldr	r3, .L81+8
	ldr	r4, [r0]
	ldr	r8, [r3]
	ldrsb	r0, [r5, #16]
.L52:
	cmp	r0, #0
	ble	.L50
	add	lr, r1, r6
	mul	ip, r8, lr
	ldrsh	r3, [r5]
	add	lr, r0, r3
	add	lr, r4, lr
	add	r3, r3, ip
	add	r3, r4, r3
	add	lr, lr, ip
	b	.L49
.L77:
	cmp	lr, r3
	beq	.L50
.L49:
	ldrb	ip, [r3], #1	@ zero_extendqisi2
	cmp	ip, #0
	bne	.L77
	cmp	r2, #0
	ble	.L78
	sub	r0, r1, #1
	lsl	r3, r0, #16
	lsr	r3, r3, #16
.L47:
	add	r3, r3, r9
	strh	r3, [r5, #2]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L75:
	ldrsh	r9, [r0]
	mov	r6, r9
	ble	.L25
	ldrsb	r6, [r0, #16]
	add	r6, r6, r9
	ldr	r3, .L81+8
	sub	r6, r6, #1
	adds	r2, r1, r6
	ldr	lr, [r3]
	bmi	.L26
	cmp	r2, lr
	bge	.L26
.L29:
	eor	r7, r1, r1, asr #31
	sub	r7, r7, r1, asr #31
.L62:
	mov	r0, #0
	ldr	r3, .L81+4
	ldrsb	r4, [r5, #17]
	ldr	r8, [r3]
.L37:
	cmp	r4, #0
	ble	.L35
	ldrsh	r3, [r5, #2]
	add	ip, r0, r6
	mla	r3, lr, r3, ip
	mov	r2, #0
	add	r3, r8, r3
	b	.L34
.L79:
	cmp	r4, r2
	add	r3, r3, lr
	beq	.L35
.L34:
	ldrb	ip, [r3]	@ zero_extendqisi2
	cmp	ip, #0
	add	r2, r2, #1
	bne	.L79
	cmp	r1, #0
	ble	.L80
	sub	r0, r0, #1
	lsl	r3, r0, #16
	lsr	r3, r3, #16
.L32:
	add	r3, r3, r9
	strh	r3, [r5]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L40:
	adds	r3, r2, r9
	bmi	.L43
	ldr	r0, .L81
	ldr	r0, [r0]
	cmp	r3, r0
	bge	.L43
.L44:
	eor	r7, r2, r2, asr #31
	sub	r7, r7, r2, asr #31
	b	.L46
.L26:
	sub	r1, lr, r6
	sub	r1, r1, #1
.L30:
	cmp	r1, #0
	moveq	r0, r1
	eor	r7, r1, r1, asr #31
	moveq	r3, r0
	sub	r7, r7, r1, asr #31
	beq	.L32
	ldr	r3, .L81+8
	ldr	lr, [r3]
	b	.L62
.L43:
	rsb	r2, r9, #0
	b	.L45
.L35:
	cmp	r1, #0
	addgt	r0, r0, #1
	suble	r0, r0, #1
.L36:
	eor	r3, r0, r0, asr #31
	sub	r3, r3, r0, asr #31
	cmp	r3, r7
	blt	.L37
	lsl	r3, r0, #16
	lsr	r3, r3, #16
	b	.L32
.L50:
	cmp	r2, #0
	addgt	r1, r1, #1
	suble	r1, r1, #1
.L51:
	eor	r3, r1, r1, asr #31
	sub	r3, r3, r1, asr #31
	cmp	r3, r7
	blt	.L52
	lsl	r3, r1, #16
	mov	r0, r1
	lsr	r3, r3, #16
	b	.L47
.L25:
	adds	r3, r1, r9
	bmi	.L28
	ldr	r2, .L81+8
	ldr	lr, [r2]
	cmp	r3, lr
	blt	.L29
.L28:
	rsb	r1, r9, #0
	b	.L30
.L80:
	add	r0, r0, #1
	lsl	r3, r0, #16
	lsr	r3, r3, #16
	b	.L32
.L78:
	add	r0, r1, #1
	lsl	r3, r0, #16
	lsr	r3, r3, #16
	b	.L47
.L82:
	.align	2
.L81:
	.word	mapHeight
	.word	mapCollisionBitmap
	.word	mapWidth
	.size	spriteTryMove, .-spriteTryMove
	.comm	mapCollisionBitmap,4,4
	.comm	mapWidth,4,4
	.comm	mapHeight,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
