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
	.file	"game.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateUI, %function
updateUI:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L26
	ldr	r3, [r3]
	ldrsb	lr, [r3, #21]
	cmp	lr, #0
	ble	.L24
	ldr	r2, .L26+4
	mov	r1, r2
	add	ip, r2, lr, lsl #2
	lsl	r4, lr, #2
.L5:
	ldr	r3, [r1], #4
	ldr	r0, [r3, #28]
	ldrb	r3, [r0, #1]	@ zero_extendqisi2
	cmp	r1, ip
	bic	r3, r3, #3
	strb	r3, [r0, #1]
	bne	.L5
	cmp	lr, #4
	bgt	.L4
.L3:
	ldr	r0, .L26+8
	add	r2, r2, r4
.L9:
	ldr	r3, [r2], #4
	ldr	r1, [r3, #28]
	ldrb	r3, [r1, #1]	@ zero_extendqisi2
	bic	r3, r3, #1
	orr	r3, r3, #2
	cmp	r2, r0
	strb	r3, [r1, #1]
	bne	.L9
.L4:
	ldr	r3, .L26+12
	ldr	r2, [r3]
	cmp	r2, #8
	ble	.L25
	mov	r2, #8
	str	r2, [r3]
.L10:
	mov	r1, #0
	ldr	ip, .L26+16
.L12:
	ldr	r3, [ip], #4
	ldr	r0, [r3, #28]
	ldrb	r3, [r0, #1]	@ zero_extendqisi2
	add	r1, r1, #1
	bic	r3, r3, #3
	cmp	r2, r1
	strb	r3, [r0, #1]
	bgt	.L12
.L11:
	cmp	r2, #8
	beq	.L1
	ldr	r0, .L26+16
	lsl	r2, r2, #2
	sub	r2, r2, #4
	add	r2, r2, r0
	add	r0, r0, #28
.L14:
	ldr	r3, [r2, #4]!
	ldr	r1, [r3, #28]
	ldrb	r3, [r1, #1]	@ zero_extendqisi2
	bic	r3, r3, #1
	orr	r3, r3, #2
	cmp	r0, r2
	strb	r3, [r1, #1]
	bne	.L14
.L1:
	pop	{r4, lr}
	bx	lr
.L25:
	cmp	r2, #0
	bgt	.L10
	b	.L11
.L24:
	ldr	r2, .L26+4
	lsl	r4, lr, #2
	b	.L3
.L27:
	.align	2
.L26:
	.word	player
	.word	ui_hearts
	.word	ui_hearts+20
	.word	dropCollected
	.word	ui_drops
	.size	updateUI, .-updateUI
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	damage, %function
damage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldrb	r2, [r0, #12]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L40
.L29:
	push	{r4, lr}
	ldrb	r3, [r0, #21]	@ zero_extendqisi2
	sub	r3, r3, #1
	lsl	r3, r3, #24
	asr	r3, r3, #24
	cmp	r3, #0
	strb	r3, [r0, #21]
	movlt	r3, #0
	strblt	r3, [r0, #21]
	blt	.L32
	beq	.L32
.L33:
	bl	updateUI
	mov	r0, #1
	pop	{r4, lr}
	bx	lr
.L32:
	cmp	r2, #1
	beq	.L41
	cmp	r2, #3
	bne	.L35
	mov	lr, #4
	mov	r3, #0
	mov	ip, #12
	mov	r1, #1
	ldr	r2, .L42
	strb	lr, [r0, #12]
	strb	ip, [r0, #23]
	strb	r3, [r0, #24]
	strh	r3, [r0, #18]	@ movhi
	strb	r1, [r0, #20]
	str	r2, [r0, #32]
	bl	updateUI
	mov	r0, #1
	pop	{r4, lr}
	bx	lr
.L40:
	ldr	r3, .L42+4
	ldr	r1, [r3]
	cmp	r1, #0
	bgt	.L36
	mov	r1, #60
	str	r1, [r3]
	b	.L29
.L35:
	ldr	r3, .L42+8
	mov	lr, pc
	bx	r3
	bl	updateUI
	mov	r0, #1
	pop	{r4, lr}
	bx	lr
.L36:
	mov	r0, #0
	bx	lr
.L41:
	mov	r0, #5
	ldr	r3, .L42+12
	mov	lr, pc
	bx	r3
	b	.L33
.L43:
	.align	2
.L42:
	.word	updateCollectible
	.word	invincibleCounter
	.word	freeSprite
	.word	setState
	.size	damage, .-damage
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	carMoveLeft, %function
carMoveLeft:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldrsh	r3, [r0]
	cmp	r3, #0
	ble	.L47
	ldrsb	r2, [r0, #14]
	sub	r3, r3, r2
	lsl	r3, r3, #16
	asr	r3, r3, #16
	cmp	r3, #0
	strh	r3, [r0]	@ movhi
	bxgt	lr
.L47:
	push	{r4, lr}
	ldr	r3, .L52
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	freeSprite
	.size	carMoveLeft, .-carMoveLeft
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initUI, %function
initUI:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r7, #226
	mov	r6, #4
	ldr	r8, .L60
	ldr	r4, .L60+4
	ldr	r9, .L60+8
	ldr	r5, .L60+12
.L55:
	mov	r0, r9
	mov	lr, pc
	bx	r4
	ldr	r2, [r0, #28]
	ldrh	r3, [r2, #2]
	add	r1, r7, #500
	lsr	r3, r3, #9
	add	r1, r1, #2
	orr	r3, r3, r7, lsl #23
	and	r7, r1, r5
	ror	r3, r3, #23
	cmp	r7, #176
	str	r0, [r8], #4
	strb	r6, [r2]
	strh	r3, [r2, #2]	@ movhi
	bne	.L55
	mov	r8, #4
	mov	r7, r8
	ldr	r9, .L60+16
	ldr	r6, .L60+20
	ldr	r5, .L60+12
.L56:
	mov	r0, r6
	mov	lr, pc
	bx	r4
	ldr	r2, [r0, #28]
	ldrh	r3, [r2, #2]
	add	r1, r8, #10
	lsr	r3, r3, #9
	orr	r3, r3, r8, lsl #23
	and	r8, r1, r5
	ror	r3, r3, #23
	cmp	r8, #84
	str	r0, [r9], #4
	strb	r7, [r2]
	strh	r3, [r2, #2]	@ movhi
	bne	.L56
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L61:
	.align	2
.L60:
	.word	ui_hearts
	.word	createUI
	.word	pf_ui_heart
	.word	511
	.word	ui_drops
	.word	pf_ui_drop
	.size	initUI, .-initUI
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"create creature at %d, %d\000"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	createCreature, %function
createCreature:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, .L64
	ldr	r0, .L64+4
	mov	r5, r1
	mov	r4, r2
	mov	lr, pc
	bx	r3
	mov	r0, r6
	ldr	r3, .L64+8
	mov	lr, pc
	bx	r3
	strh	r5, [r0]	@ movhi
	strh	r4, [r0, #2]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L65:
	.align	2
.L64:
	.word	mgba_printf
	.word	.LC0
	.word	createSprite
	.size	createCreature, .-createCreature
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEgg, %function
updateEgg:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldrh	r3, [r0, #2]
	ldrsb	r1, [r0, #15]
	add	r3, r3, r1
	lsl	r3, r3, #16
	ldrsb	r1, [r0, #17]
	asr	r3, r3, #16
	strh	r3, [r0, #2]	@ movhi
	add	r1, r1, r3
	mov	r4, r0
	ldr	r3, .L70
	ldrsh	r0, [r0]
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	beq	.L69
	pop	{r4, lr}
	bx	lr
.L69:
	mov	r0, r4
	ldr	r3, .L70+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L71:
	.align	2
.L70:
	.word	isNotTerrain
	.word	freeSprite
	.size	updateEgg, .-updateEgg
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldrb	r3, [r0, #12]	@ zero_extendqisi2
	cmp	r3, #3
	push	{r4, r5, r6, lr}
	mov	r4, r0
	beq	.L73
.L78:
	ldrh	r3, [r4, #8]
	ldrsh	r2, [r4]
	sub	r3, r3, #1
	cmp	r2, #0
	strh	r3, [r4, #8]	@ movhi
	ble	.L98
	ldrsh	r3, [r4, #4]
	cmp	r3, r2
	blt	.L109
.L98:
	mov	r5, #1
.L74:
	ldr	r3, .L113
	mov	r2, #512
	mov	r1, #1024
	mov	r0, r4
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	ldrb	r3, [r4, #12]	@ zero_extendqisi2
	beq	.L79
	ldrsb	r0, [r4, #18]
	cmp	r3, #3
	mov	r1, r3
	mov	r2, r0
	beq	.L108
.L80:
	mov	r3, #300
	strh	r3, [r4, #8]	@ movhi
.L95:
	rsbs	r2, r2, #1
	movcc	r2, #0
	strb	r2, [r4, #18]
	b	.L89
.L79:
	cmp	r3, #3
	mov	r1, r3
	beq	.L110
.L84:
	ldrsh	r3, [r4, #8]
	cmp	r3, #0
	ble	.L88
	cmp	r5, #0
	ldrsb	r2, [r4, #18]
	ldrb	r1, [r4, #12]	@ zero_extendqisi2
	bne	.L80
.L89:
	ldrsb	r3, [r4, #14]
	lsl	r3, r3, #16
	cmp	r2, #0
	lsr	r3, r3, #16
	rsbne	r3, r3, #0
	lslne	r3, r3, #16
	ldrh	r2, [r4]
	lsrne	r3, r3, #16
	add	r3, r2, r3
	cmp	r1, #5
	strh	r3, [r4]	@ movhi
	beq	.L111
.L72:
	pop	{r4, r5, r6, lr}
	bx	lr
.L109:
	ldr	r1, .L113+4
	ldrsb	r3, [r4, #16]
	ldr	r1, [r1]
	add	r3, r3, r2
	cmp	r3, r1
	bge	.L98
	ldrsh	r5, [r4, #6]
	cmp	r5, r2
	movgt	r5, #0
	movle	r5, #1
	b	.L74
.L108:
	ldrsh	ip, [r4, #8]
	cmp	ip, #0
	bgt	.L80
	mov	r2, #300
	strh	r2, [r4, #8]	@ movhi
.L82:
	mov	r1, r3
	mov	r2, r0
	b	.L95
.L73:
	ldrsh	r3, [r0, #2]
	ldr	r5, .L113+8
	b	.L76
.L77:
	ldrh	r3, [r4, #2]
	add	r3, r3, #1
	lsl	r3, r3, #16
	asr	r3, r3, #16
	strh	r3, [r4, #2]	@ movhi
.L76:
	ldrsb	r2, [r4, #16]
	ldrsh	r0, [r4]
	ldrsb	r1, [r4, #17]
	add	r2, r2, r2, lsr #31
	add	r0, r0, r2, asr #1
	add	r1, r1, r3
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L77
	b	.L78
.L111:
	ldrh	r3, [r4, #10]
	sub	r3, r3, #1
	lsl	r3, r3, #16
	asr	r3, r3, #16
	cmp	r3, #0
	strh	r3, [r4, #10]	@ movhi
	bgt	.L72
	ldr	r3, .L113+12
	ldr	r0, .L113+16
	mov	lr, pc
	bx	r3
	mov	r1, #120
	ldrsb	r3, [r4, #16]
	ldrh	r2, [r4]
	add	r3, r3, r3, lsr #31
	add	r3, r2, r3, asr #1
	strh	r3, [r0]	@ movhi
	ldrsb	r3, [r4, #17]
	ldrh	r2, [r4, #2]
	add	r3, r3, r3, lsr #31
	add	r3, r2, r3, asr #1
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r4, #10]	@ movhi
	b	.L72
.L88:
	mov	r3, #300
	cmp	r5, #0
	strh	r3, [r4, #8]	@ movhi
	bne	.L112
	ldr	r3, .L113+20
	mov	lr, pc
	bx	r3
	subs	r2, r0, #0
	and	r2, r2, #1
	rsblt	r2, r2, #0
	strb	r2, [r4, #18]
	ldrb	r1, [r4, #12]	@ zero_extendqisi2
	b	.L89
.L110:
	ldrsb	r0, [r4, #18]
	cmp	r0, #0
	mov	r2, r0
	bne	.L85
	cmp	r5, #0
	bne	.L108
	ldrsb	r3, [r4, #16]
	ldrsh	r1, [r4, #2]
	ldrsb	r2, [r4, #17]
	ldrsh	r0, [r4]
	add	r1, r1, r2
	add	r0, r0, r3
	add	r1, r1, #1
	ldr	r3, .L113+8
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	subs	r5, r0, #0
	movne	r5, #1
	b	.L84
.L85:
	cmp	r5, #0
	bne	.L108
	ldrsb	r3, [r4, #17]
	ldrsh	r1, [r4, #2]
	ldrsh	r0, [r4]
	add	r1, r1, r3
	add	r1, r1, #1
	ldr	r3, .L113+8
	sub	r0, r0, #1
	mov	lr, pc
	bx	r3
	subs	r5, r0, #0
	movne	r5, #1
	b	.L84
.L112:
	ldrb	r3, [r4, #12]	@ zero_extendqisi2
	ldrsb	r0, [r4, #18]
	b	.L82
.L114:
	.align	2
.L113:
	.word	collideTerrain
	.word	mapWidth
	.word	isNotTerrain
	.word	createSprite
	.word	pf_birdEgg
	.word	rand
	.size	updateEnemy, .-updateEnemy
	.global	__aeabi_i2f
	.global	__aeabi_fmul
	.global	__aeabi_fadd
	.global	__aeabi_f2iz
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r7, .L169
	ldr	r6, .L169+4
	ldrh	r3, [r7]
	ldrh	r5, [r6]
	tst	r3, #64
	mov	r4, r0
	and	r5, r5, #64
	beq	.L116
	cmp	r5, #0
	beq	.L161
	ldr	r9, .L169+8
	ldr	r0, [r9]
.L159:
	cmp	r0, #0
	movle	r8, #0
	movgt	r8, #1
	cmp	r0, #0
	mov	r5, r8
	ble	.L123
.L120:
	sub	r0, r0, #1
.L141:
	ldrsb	r10, [r4, #15]
	cmp	r0, #7
	str	r0, [r9]
	addgt	r0, r10, r10, lsl #2
	bgt	.L127
	ldr	r3, .L169+12
	mov	lr, pc
	bx	r3
	ldr	fp, .L169+16
	mov	r1, #1056964608
	mov	lr, pc
	bx	fp
	mov	r1, #1065353216
	ldr	r2, .L169+20
	mov	lr, pc
	bx	r2
	mov	r2, r0
	ldr	r3, .L169+12
	mov	r0, r10
	mov	r10, r2
	mov	lr, pc
	bx	r3
	mov	r1, r0
	mov	r0, r10
	mov	lr, pc
	bx	fp
	ldr	r3, .L169+24
	mov	lr, pc
	bx	r3
.L127:
	mov	r1, #0
	rsb	r2, r0, #0
	ldr	r10, .L169+28
	mov	r0, r4
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	moveq	r1, #1
	streq	r0, [r9]
	beq	.L128
	ldrh	r3, [r6]
	ands	r2, r3, #32
	mov	r1, #1
	bne	.L129
.L164:
	mov	r9, #1
	ldrsb	r1, [r4, #14]
	mov	r0, r4
	rsb	r1, r1, #0
	strb	r9, [r4, #18]
	mov	lr, pc
	bx	r10
	ldrh	r3, [r6]
	ands	r2, r3, #16
	mov	r1, r9
	bne	.L130
.L165:
	mov	r0, r4
	strb	r2, [r4, #18]
	ldrsb	r1, [r4, #14]
	mov	lr, pc
	bx	r10
	cmp	r8, #0
	movne	r3, #8
	strbne	r3, [r4, #24]
	beq	.L132
	ldrsh	r3, [r4]
	cmp	r3, #119
	ble	.L162
.L134:
	ldr	r2, .L169+32
	ldr	r2, [r2]
	sub	r1, r2, #119
	cmp	r1, r3
	ldrle	r3, .L169+36
	ldrgt	r2, .L169+36
	subgt	r3, r3, #120
	suble	r2, r2, #240
	strhle	r2, [r3]	@ movhi
	strhgt	r3, [r2]	@ movhi
	ldrsh	r3, [r4, #2]
	cmp	r3, #79
	ble	.L163
.L137:
	ldr	r2, .L169+40
	ldr	r2, [r2]
	sub	r1, r2, #79
	cmp	r1, r3
	ldrle	r3, .L169+44
	ldrgt	r2, .L169+44
	subgt	r3, r3, #80
	suble	r2, r2, #160
	strhle	r2, [r3]	@ movhi
	strhgt	r3, [r2]	@ movhi
	ldr	r3, .L169+48
	ldr	r3, [r3]
	cmp	r3, #1
	bne	.L115
.L167:
	ldrh	r3, [r7]
	tst	r3, #1
	beq	.L115
	ldrh	r2, [r6]
	ands	r5, r2, #1
	bne	.L115
	ldr	r6, .L169+52
	ldr	r3, [r6]
	cmp	r3, #0
	ble	.L115
	ldr	r3, .L169+56
	ldr	r0, .L169+60
	mov	lr, pc
	bx	r3
	ldrsb	r2, [r4, #16]
	ldrh	r3, [r4]
	add	r3, r3, r2
	strh	r3, [r0]	@ movhi
	ldrsb	r3, [r4, #17]
	ldrh	r2, [r4, #2]
	add	r3, r3, r3, lsr #31
	add	r3, r2, r3, asr #1
	strh	r3, [r0, #2]	@ movhi
	ldr	r3, [r6]
	ldrsb	r2, [r4, #18]
	sub	r3, r3, #1
	strb	r2, [r0, #18]
	bic	r3, r3, r3, asr #31
	str	r3, [r6]
	bl	updateUI
	ldr	r3, .L169+64
	mov	r2, r5
	ldr	r1, [r3]
	ldr	r0, .L169+68
	ldr	r3, .L169+72
	mov	lr, pc
	bx	r3
	b	.L115
.L168:
	add	r0, r10, r9
	mov	r1, r5
	sub	r0, r0, #1
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L118
	ldrh	r5, [r6]
	and	r5, r5, #64
.L116:
	ldr	r9, .L169+8
	cmp	r5, #0
	ldr	r0, [r9]
	bne	.L159
	cmp	r0, #0
	movle	r8, r5
	bgt	.L119
.L123:
	ldr	r3, .L169+76
	mov	r1, #0
	mov	r0, r4
	ldr	r2, [r3]
	ldr	r10, .L169+28
	mov	lr, pc
	bx	r10
	mov	r1, #0
.L128:
	ldrh	r3, [r6]
	ands	r2, r3, #32
	beq	.L164
.L129:
	ands	r2, r3, #16
	beq	.L165
.L130:
	cmp	r8, #0
	movne	r8, #8
	beq	.L166
.L132:
	strb	r8, [r4, #24]
.L133:
	ldrsh	r3, [r4]
	cmp	r3, #119
	bgt	.L134
.L162:
	mov	r2, #0
	ldr	r3, .L169+36
	strh	r2, [r3]	@ movhi
	ldrsh	r3, [r4, #2]
	cmp	r3, #79
	bgt	.L137
.L163:
	mov	r2, #0
	ldr	r3, .L169+44
	strh	r2, [r3]	@ movhi
	ldr	r3, .L169+48
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L167
.L115:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L166:
	orrs	r3, r1, r5
	moveq	r3, #10
	strb	r8, [r4, #24]
	strbeq	r8, [r4, #19]
	strbeq	r3, [r4, #13]
	b	.L133
.L161:
	ldrsb	r1, [r0, #17]
	ldrsh	r5, [r0, #2]
	ldrsh	r9, [r0]
	add	r5, r5, r1
	mov	r1, r5
	mov	r0, r9
	ldr	r8, .L169+80
	ldrsb	r10, [r4, #16]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	bne	.L168
.L118:
	ldrh	r3, [r6]
	tst	r3, #64
	mov	r0, #10
	movne	r5, #1
	ldr	r9, .L169+8
	movne	r8, r5
	str	r0, [r9]
	bne	.L120
.L119:
	ldr	r3, .L169+84
	ldr	r3, [r3]
	tst	r3, #1
	addeq	r8, r0, #1
	ldrne	r8, [r9]
	subne	r0, r8, #1
.L125:
	cmp	r8, #0
	movle	r8, #0
	movgt	r8, #1
	mov	r5, r8
	b	.L141
.L170:
	.align	2
.L169:
	.word	oldButtons
	.word	buttons
	.word	jumpCounter
	.word	__aeabi_i2f
	.word	__aeabi_fmul
	.word	__aeabi_fadd
	.word	__aeabi_f2iz
	.word	spriteTryMove
	.word	mapWidth
	.word	hOff
	.word	mapHeight
	.word	vOff
	.word	level
	.word	dropCollected
	.word	createSprite
	.word	pf_greyWater
	.word	crabAttackSound_length
	.word	crabAttackSound_data
	.word	playSoundB
	.word	playerGravity
	.word	isNotTerrain
	.word	frameElapsed
	.size	updatePlayer, .-updatePlayer
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldrsb	r2, [r0, #18]
	ldrsb	r3, [r0, #14]
	cmp	r2, #0
	lsl	r3, r3, #16
	ldrh	r2, [r0]
	lsr	r3, r3, #16
	addeq	r3, r3, r2
	subne	r3, r2, r3
	lsl	r2, r3, #16
	mov	r3, r2
	lsr	r2, r2, #16
	asr	r3, r3, #16
	cmp	r2, #1024
	mov	r8, r0
	strh	r3, [r0]	@ movhi
	bhi	.L188
	ldr	r6, .L189
	mov	r4, #0
	mov	r5, r6
	ldr	r7, .L189+4
	b	.L179
.L177:
	cmp	r4, #64
	add	r5, r5, #36
	beq	.L171
.L179:
	ldrb	r2, [r5, #22]	@ zero_extendqisi2
	add	r3, r4, r4, lsl #3
	cmp	r2, #0
	add	r3, r6, r3, lsl #2
	add	r4, r4, #1
	beq	.L177
	ldrb	r3, [r3, #12]	@ zero_extendqisi2
	sub	r2, r3, #2
	cmp	r3, #5
	cmpne	r2, #1
	bhi	.L177
	mov	r1, r5
	mov	r0, r8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L177
	mov	r0, r8
	bl	damage
	mov	r0, r5
	bl	damage
	cmp	r4, #64
	add	r5, r5, #36
	bne	.L179
.L171:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L188:
	ldr	r3, .L189+8
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L190:
	.align	2
.L189:
	.word	sprite_pool
	.word	spriteCollide
	.word	freeSprite
	.size	updateBullet, .-updateBullet
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"diamond collected: %d\000"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCollectible, %function
updateCollectible:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L200
	push	{r4, lr}
	ldr	r3, .L200+4
	ldr	r1, [r2]
	mov	r4, r0
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	bne	.L198
	pop	{r4, lr}
	bx	lr
.L198:
	ldr	r3, .L200+8
	mov	r0, r4
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r1, #22272
	ldr	r2, .L200+12
	strh	r1, [r3, #104]	@ movhi
	strh	r2, [r3, #108]	@ movhi
	ldrb	r3, [r4, #12]	@ zero_extendqisi2
	cmp	r3, #8
	moveq	r1, #1
	beq	.L193
	cmp	r3, #4
	moveq	r1, #3
	beq	.L193
	cmp	r3, #9
	movne	r1, #0
	beq	.L199
.L193:
	ldr	r2, .L200+16
	ldr	r3, [r2]
	pop	{r4, lr}
	add	r3, r3, r1
	str	r3, [r2]
	b	updateUI
.L199:
	ldr	r3, .L200+20
	ldr	r1, [r3]
	ldr	r0, .L200+24
	add	r1, r1, #1
	ldr	r2, .L200+28
	str	r1, [r3]
	mov	lr, pc
	bx	r2
	mov	r1, #0
	b	.L193
.L201:
	.align	2
.L200:
	.word	player
	.word	spriteCollide
	.word	freeSprite
	.word	-30804
	.word	dropCollected
	.word	diamondCollected
	.word	.LC1
	.word	mgba_printf
	.size	updateCollectible, .-updateCollectible
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateChest, %function
updateChest:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L209
	push	{r4, lr}
	ldr	r3, .L209+4
	ldr	r1, [r2]
	mov	r4, r0
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	bne	.L208
	pop	{r4, lr}
	bx	lr
.L208:
	ldrh	r2, [r4, #2]
	sub	r2, r2, #24
	lsl	r2, r2, #16
	ldrsh	r1, [r4]
	asr	r2, r2, #16
	ldr	r0, .L209+8
	bl	createCreature
	mov	r0, r4
	ldr	r3, .L209+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L210:
	.align	2
.L209:
	.word	player
	.word	spriteCollide
	.word	pf_diamond
	.word	freeSprite
	.size	updateChest, .-updateChest
	.align	2
	.global	resumeGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	resumeGame, %function
resumeGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #4352
	mov	r5, #67108864
	mov	r3, #16384
	mov	r0, #3
	strh	r2, [r5]	@ movhi
	ldr	r1, .L223
	ldr	r2, .L223+4
	ldr	r4, .L223+8
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L223+12
	ldr	r1, .L223+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L223+20
	mov	r2, #32
	mov	r1, #240
	ldr	r0, .L223+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L223+28
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L212
	ldrh	r3, [r5]
	orr	r3, r3, #512
	mov	r2, #83886080
	mov	r0, #3
	strh	r3, [r5]	@ movhi
	ldr	r1, .L223+32
	mov	r3, #256
	mov	lr, pc
	bx	r4
	mov	r3, #9408
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L223+36
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L223+40
	mov	r3, #4096
	ldr	r1, .L223+44
	mov	lr, pc
	bx	r4
	ldr	r2, .L223+48
	rsb	r0, r2, #100663296
	add	r0, r0, #49152
	add	ip, r2, #2432
.L214:
	add	r1, r0, r2
	ldrb	r3, [r2, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	subne	r3, r3, #128
	andne	r3, r3, #255
	cmp	r2, ip
	strb	r3, [r1]
	bne	.L214
	ldr	r3, .L223+52
	rsb	r0, r3, #83886080
	add	r0, r0, #256
	add	ip, r3, #256
.L215:
	add	r2, r0, r3
	ldrh	r1, [r3, #2]!
	cmp	r3, ip
	strh	r1, [r2]	@ movhi
	bne	.L215
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L223+56
	ldr	r1, .L223+60
	mov	lr, pc
	bx	r4
	b	.L216
.L212:
	ldr	r2, .L223+64
	mov	r3, #256
	mov	r0, #3
	strh	r2, [r5, #8]	@ movhi
	ldr	r1, .L223+68
	mov	r2, #83886080
	mov	lr, pc
	bx	r4
	mov	r3, #9792
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L223+72
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L223+40
	ldr	r1, .L223+76
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L223+80
	ldr	r1, .L223+84
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L223+88
	ldr	r1, .L223+92
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L223+96
	ldr	r1, .L223+100
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L223+104
	ldr	r1, .L223+84
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L223+108
	ldr	r1, .L223+112
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L223+116
	ldr	r1, .L223+100
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L223+120
	ldr	r1, .L223+124
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L223+128
	ldr	r1, .L223+112
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L223+132
	ldr	r1, .L223+136
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L223+56
	ldr	r1, .L223+124
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L223+140
	ldr	r1, .L223+144
	mov	lr, pc
	bx	r4
.L216:
	bl	updateUI
	ldr	r3, .L223+148
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L224:
	.align	2
.L223:
	.word	spritesheetTiles
	.word	100728832
	.word	DMANow
	.word	83886592
	.word	spritesheetPal
	.word	memset
	.word	100728768
	.word	level
	.word	level0backgroundPal
	.word	level0backgroundTiles
	.word	100685824
	.word	level0backgroundMap
	.word	level0_frontlayerTiles-1
	.word	level0_frontlayerPal-2
	.word	100706304
	.word	level0_frontlayerMap
	.word	-13440
	.word	level1backgroundPal
	.word	level1backgroundTiles
	.word	level1backgroundMap
	.word	100687872
	.word	level1backgroundMap+2048
	.word	100689920
	.word	level1backgroundMap+8192
	.word	100691968
	.word	level1backgroundMap+10240
	.word	100694016
	.word	100696064
	.word	level1backgroundMap+4096
	.word	100698112
	.word	100700160
	.word	level1backgroundMap+12288
	.word	100702208
	.word	100704256
	.word	level1backgroundMap+6144
	.word	100708352
	.word	level1backgroundMap+14336
	.word	unpauseSounds
	.size	resumeGame, .-resumeGame
	.global	__aeabi_fdiv
	.align	2
	.global	game0
	.syntax unified
	.arm
	.fpu softvfp
	.type	game0, %function
game0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r8, .L286
	ldrb	r3, [r8]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L276
	ldr	r7, .L286+4
	ldr	r1, .L286+8
	ldr	r3, [r7]
	ldr	r2, [r1]
	ldr	r4, .L286+12
	add	r3, r3, #1
	cmp	r2, #0
	str	r3, [r7]
	ldrh	r3, [r4]
	subgt	r2, r2, #1
	strgt	r2, [r1]
	tst	r3, #8
	beq	.L233
	ldr	r2, .L286+16
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L277
.L233:
	tst	r3, #2
	bne	.L273
.L284:
	ldr	r9, .L286+20
.L234:
	ldr	r5, .L286+24
	ldr	r6, .L286+28
	ldr	r3, .L286+32
	mov	lr, pc
	bx	r3
	mov	r4, #0
	mov	fp, r5
	ldr	r10, [r6]
	b	.L238
.L236:
	ldr	r3, .L286+36
	add	fp, fp, #36
	cmp	r3, fp
	add	r4, r4, #1
	beq	.L278
.L238:
	ldrb	r0, [fp, #22]	@ zero_extendqisi2
	add	r2, r4, r4, lsl #3
	cmp	r0, #0
	add	r2, r5, r2, lsl #2
	beq	.L236
	ldrb	r2, [r2, #12]	@ zero_extendqisi2
	sub	r0, r2, #2
	sub	r2, r2, #5
	cmp	r2, #1
	cmphi	r0, #1
	bhi	.L236
	mov	r1, fp
	mov	r0, r10
	ldr	r3, .L286+40
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	beq	.L236
	mov	r0, r10
	bl	damage
	b	.L236
.L273:
	ldr	r3, .L286+16
	ldrh	r3, [r3]
	tst	r3, #2
	ldr	r9, .L286+20
	bne	.L234
	ldrb	r3, [r9]	@ zero_extendqisi2
	rsbs	r3, r3, #1
	movcc	r3, #0
	strb	r3, [r9]
	b	.L234
.L278:
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L286+44
	mov	r2, #117440512
	ldr	r4, .L286+48
	mov	lr, pc
	bx	r4
	ldr	r1, .L286+52
	ldr	r5, .L286+56
	ldrh	r3, [r1]
	ldr	r0, [r5]
	lsr	r3, r3, #8
	cmp	r3, #2
	movge	r3, #2
	cmp	r0, #0
	mov	ip, #67108864
	bne	.L239
	add	r2, r3, #11
	lsl	r2, r2, #24
	orr	r2, r2, #1073741824
	ldr	r4, .L286+60
	orr	r2, r2, #8585216
	lsr	r2, r2, #16
	strh	r2, [ip, #10]	@ movhi
	ldr	lr, .L286+64
	strh	r4, [ip, #8]	@ movhi
	ldrh	r2, [lr]
	add	r2, r2, #72
	lsl	r2, r2, #16
	lsr	r2, r2, #16
	strh	r2, [ip, #18]	@ movhi
	ldrb	r2, [r1]	@ zero_extendqisi2
	rsb	r2, r2, #256
	lsl	r2, r2, #16
	lsr	r2, r2, #16
	strh	r2, [ip, #16]	@ movhi
	ldrh	r2, [r1]
	sub	r3, r2, r3, lsl #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [ip, #20]	@ movhi
	ldrh	r3, [lr]
	strh	r3, [ip, #22]	@ movhi
	ldrh	r3, [ip]
	orr	r3, r3, #768
	strh	r3, [ip]	@ movhi
	ldrb	r3, [r9]	@ zero_extendqisi2
	cmp	r3, #0
	ldr	r2, [r6]
	bne	.L279
.L241:
	mov	r1, #67108864
	ldr	r3, .L286+68
	ldrh	ip, [r1]
	and	r3, r3, ip
	strh	r3, [r1]	@ movhi
	cmp	r0, #0
	ldrsh	r1, [r2]
	ldrsb	r3, [r2, #16]
	bne	.L248
.L282:
	rsb	r3, r3, #1008
	cmp	r3, r1
	blt	.L280
	ldr	r2, .L286+72
	ldr	r3, [r7]
	mul	r3, r2, r3
	add	r3, r3, #47710208
	ldr	r2, .L286+76
	add	r3, r3, #11648
	cmp	r1, #896
	ror	r3, r3, #2
	movge	r1, #0
	movlt	r1, #1
	cmp	r3, r2
	movhi	r1, #0
	cmp	r1, #0
	bne	.L281
.L225:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L239:
	lsl	r2, r3, #26
	add	r2, r2, #184549376
	orr	r2, r2, #-1073741824
	orr	r2, r2, #8585216
	lsr	r2, r2, #16
	strh	r2, [ip, #8]	@ movhi
	ldr	r2, .L286+80
	ldrh	lr, [ip]
	and	r2, r2, lr
	strh	r2, [ip]	@ movhi
	ldrh	r2, [r1]
	sub	r3, r2, r3, lsl #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [ip, #16]	@ movhi
	ldr	r3, .L286+64
	ldrh	r3, [r3]
	strh	r3, [ip, #18]	@ movhi
	ldrb	r3, [r9]	@ zero_extendqisi2
	cmp	r3, #0
	ldr	r2, [r6]
	beq	.L241
.L279:
	ldrsh	r0, [r2]
	ldr	r9, .L286+84
	mov	lr, pc
	bx	r9
	ldr	r3, .L286+88
	mov	r4, r0
	ldr	r0, [r3]
	mov	lr, pc
	bx	r9
	ldr	r3, .L286+92
	mov	r1, r0
	mov	r0, r4
	mov	lr, pc
	bx	r3
	ldr	r1, .L286+96
	ldr	r3, .L286+100
	mov	lr, pc
	bx	r3
	ldr	r3, .L286+104
	mov	lr, pc
	bx	r3
	mov	r9, r0
	mov	r2, #64
	mov	r1, #240
	ldr	r10, .L286+108
	ldr	r0, .L286+112
	mov	lr, pc
	bx	r10
	mov	r2, #64
	mov	r1, #0
	ldr	r0, .L286+116
	mov	lr, pc
	bx	r10
	rsbs	r3, r9, #0
	and	r3, r3, #7
	and	r0, r9, #7
	rsbpl	r0, r3, #0
	cmp	r0, #0
	ble	.L246
	mov	r3, #0
	mvn	lr, #15
	ldr	ip, .L286+116
.L242:
	add	r1, r3, #100663296
	add	r1, r1, #65280
	add	r2, r3, ip
.L245:
	strb	lr, [r2], #8
	cmp	r2, r1
	bne	.L245
	add	r3, r3, #1
	cmp	r3, r0
	bne	.L242
.L246:
	mov	r3, #67108864
	mov	r4, #0
	mov	r1, #31
	ldrh	r2, [r3]
	orr	r2, r2, #1024
	strh	r2, [r3]	@ movhi
	ldr	r0, .L286+120
	ldr	r2, .L286+124
	strh	r0, [r3, #12]	@ movhi
	strh	r1, [r2, #224]	@ movhi
	ldr	r0, .L286+128
	mov	r1, r4
	mov	r2, #2048
	strh	r4, [r3, #26]	@ movhi
	strh	r4, [r3, #24]	@ movhi
	mov	lr, pc
	bx	r10
	cmp	r9, r4
	add	r2, r9, #7
	movge	r2, r9
	cmp	r9, #7
	movgt	r1, r4
	movgt	ip, #250
	ldrgt	r0, .L286+128
	asr	r2, r2, #3
	ble	.L244
.L243:
	add	r3, r1, #608
	add	r1, r1, #1
	lsl	r3, r3, #1
	cmp	r1, r2
	strh	ip, [r0, r3]	@ movhi
	blt	.L243
.L244:
	mov	r1, #251
	ldr	r3, .L286+128
	add	r2, r2, #608
	lsl	r2, r2, #1
	ldr	r0, [r5]
	strh	r1, [r3, r2]	@ movhi
	ldr	r2, [r6]
	cmp	r0, #0
	ldrsh	r1, [r2]
	ldrsb	r3, [r2, #16]
	beq	.L282
.L248:
	rsb	r3, r3, #992
	cmp	r3, r1
	bge	.L225
	ldrsh	r3, [r2, #2]
	cmp	r3, #384
	ble	.L225
	mov	r0, #4
	ldr	r3, .L286+132
	mov	lr, pc
	bx	r3
	b	.L225
.L276:
	ldr	r3, .L286+136
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r0, #5248
	mov	r3, #256
	mov	r1, #0
	strh	r3, [r2]	@ movhi
	strh	r0, [r2, #8]	@ movhi
	ldr	r0, .L286+56
	strh	r1, [r2, #16]	@ movhi
	strh	r1, [r2, #18]	@ movhi
	ldr	r2, [r0]
	cmp	r2, r1
	mov	r2, #83886080
	beq	.L283
	mov	r0, #3
	ldr	r1, .L286+140
	ldr	r4, .L286+48
	mov	lr, pc
	bx	r4
	mov	r3, #17664
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L286+144
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L286+148
	ldr	r1, .L286+152
	mov	lr, pc
	bx	r4
.L228:
	ldr	r3, .L286+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L225
	ldr	r3, .L286+16
	ldrh	r3, [r3]
	ands	r3, r3, #8
	bne	.L225
	strb	r3, [r8]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	resumeGame
.L277:
	ldr	r3, .L286+132
	mov	r0, #3
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #2
	bne	.L273
	b	.L284
.L283:
	ldr	r4, .L286+48
	mov	r0, #3
	ldr	r1, .L286+156
	mov	lr, pc
	bx	r4
	mov	r3, #14784
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L286+160
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L286+148
	ldr	r1, .L286+164
	mov	lr, pc
	bx	r4
	b	.L228
.L280:
	mov	ip, #1024
	mov	r0, #512
	mov	r7, #1
	ldr	r2, .L286+88
	ldr	r1, .L286+168
	str	ip, [r2]
	ldr	r3, .L286+172
	ldr	r2, .L286+176
	str	r0, [r1]
	str	r2, [r3]
	str	r7, [r5]
	strb	r7, [r8]
	bl	resumeGame
	ldr	r3, .L286+180
	mov	lr, pc
	bx	r3
	bl	initUI
	mov	r1, #16
	ldr	r2, .L286+184
	ldr	r3, .L286+188
	ldr	r0, .L286+192
	mov	lr, pc
	bx	r3
	ldr	r4, .L286+196
	ldr	r0, .L286+200
	mov	lr, pc
	bx	r4
	mov	r3, r0
	ldr	r2, .L286+204
	ldr	r0, .L286+208
	str	r2, [r3]
	str	r3, [r6]
	mov	lr, pc
	bx	r4
	mov	r3, r0
	ldr	r2, .L286+212
	ldr	r0, .L286+208
	str	r2, [r3]
	mov	lr, pc
	bx	r4
	mov	r3, r0
	ldr	r2, .L286+216
	ldr	r0, .L286+208
	str	r2, [r3]
	mov	lr, pc
	bx	r4
	mov	r2, #176
	ldr	r3, .L286+220
	strh	r2, [r0, #4]	@ movhi
	str	r3, [r0]
	ldr	r0, .L286+208
	mov	lr, pc
	bx	r4
	mov	r3, r0
	ldr	r2, .L286+224
	ldr	r0, .L286+208
	str	r2, [r3]
	mov	lr, pc
	bx	r4
	mov	r3, r0
	ldr	r2, .L286+228
	ldr	r0, .L286+208
	str	r2, [r3]
	mov	lr, pc
	bx	r4
	mov	r3, r0
	ldr	r2, .L286+232
	ldr	r0, .L286+208
	str	r2, [r3]
	mov	lr, pc
	bx	r4
	mov	r3, r0
	ldr	r2, .L286+236
	ldr	r0, .L286+240
	str	r2, [r3]
	mov	lr, pc
	bx	r4
	mov	r3, r0
	ldr	r2, .L286+244
	ldr	r0, .L286+240
	str	r2, [r3]
	mov	lr, pc
	bx	r4
	ldr	r3, .L286+248
	mov	r1, #112
	str	r3, [r0]
	ldr	r2, .L286+252
	ldr	r0, .L286+256
	bl	createCreature
	mov	r1, #272
	ldr	r2, .L286+260
	ldr	r0, .L286+256
	bl	createCreature
	mov	r2, #190
	mov	r1, #600
	ldr	r0, .L286+256
	bl	createCreature
	mov	r2, #280
	mov	r1, #768
	ldr	r0, .L286+264
	bl	createCreature
	mov	r1, #580
	ldr	r2, .L286+268
	ldr	r0, .L286+264
	bl	createCreature
	mov	r2, #115
	ldr	r1, .L286+272
	ldr	r0, .L286+264
	bl	createCreature
	bl	updateUI
	ldr	r3, .L286+276
	mov	r2, r7
	ldr	r1, [r3]
	ldr	r0, .L286+280
	ldr	r3, .L286+284
	mov	lr, pc
	bx	r3
	b	.L225
.L281:
	ldr	r6, .L286+288
	mov	lr, pc
	bx	r6
	ldr	r3, .L286+292
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #1
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3
	cmp	r0, #4
	beq	.L285
	ldr	r7, .L286+296
	ldrsb	r5, [r7, #16]
	ldrsb	r4, [r7, #17]
	rsb	r5, r5, #1024
	rsb	r4, r4, #120
	lsl	r5, r5, #16
	lsl	r4, r4, #16
	lsr	r5, r5, #16
	asr	r4, r4, #16
	mov	r1, r5
	mov	r2, r4
	ldr	r0, .L286+192
	ldr	r3, .L286+188
	mov	lr, pc
	bx	r3
	mov	r0, r7
	ldr	r3, .L286+196
	mov	lr, pc
	bx	r3
	mov	r7, r0
	strh	r5, [r0]	@ movhi
	strh	r4, [r0, #2]	@ movhi
.L251:
	mov	lr, pc
	bx	r6
	rsbs	r1, r0, #0
	ldrb	r2, [r7, #23]	@ zero_extendqisi2
	and	r1, r1, #3
	and	r3, r0, #3
	rsbpl	r3, r1, #0
	add	r3, r2, r3, lsl #1
	strb	r3, [r7, #23]
	b	.L225
.L285:
	ldr	r8, .L286+300
	ldrsb	r5, [r8, #16]
	ldrsb	r4, [r8, #17]
	rsb	r5, r5, #1024
	rsb	r4, r4, #120
	lsl	r5, r5, #16
	lsl	r4, r4, #16
	lsr	r5, r5, #16
	asr	r4, r4, #16
	mov	r1, r5
	mov	r2, r4
	ldr	r0, .L286+192
	ldr	r3, .L286+188
	mov	lr, pc
	bx	r3
	ldr	r3, .L286+196
	mov	r0, r8
	mov	lr, pc
	bx	r3
	ldr	r3, .L286+296
	cmp	r8, r3
	mov	r7, r0
	strh	r5, [r0]	@ movhi
	strh	r4, [r0, #2]	@ movhi
	bne	.L225
	b	.L251
.L287:
	.align	2
.L286:
	.word	showingManual
	.word	frameElapsed
	.word	invincibleCounter
	.word	oldButtons
	.word	buttons
	.word	cheatEnabled
	.word	sprite_pool
	.word	player
	.word	updateSprites
	.word	sprite_pool+2304
	.word	spriteCollide
	.word	shadowOAM
	.word	DMANow
	.word	hOff
	.word	level
	.word	5518
	.word	vOff
	.word	64511
	.word	-1527099483
	.word	23860928
	.word	65023
	.word	__aeabi_i2f
	.word	mapWidth
	.word	__aeabi_fdiv
	.word	1131413504
	.word	__aeabi_fmul
	.word	__aeabi_f2iz
	.word	memset
	.word	100728448
	.word	100728512
	.word	2701
	.word	83886336
	.word	100683776
	.word	setState
	.word	hideSprites
	.word	level1IntroPal
	.word	level1IntroTiles
	.word	100704256
	.word	level1IntroMap
	.word	level0IntroPal
	.word	level0IntroTiles
	.word	level0IntroMap
	.word	mapHeight
	.word	mapCollisionBitmap
	.word	level1collisionmapBitmap
	.word	clearSprites
	.word	450
	.word	mgba_printf
	.word	.LC0
	.word	createSprite
	.word	pf_player
	.word	29491216
	.word	pf_enemyTurtle
	.word	20316480
	.word	13107800
	.word	29491392
	.word	5898600
	.word	8389322
	.word	15728672
	.word	28836715
	.word	pf_enemyBird
	.word	20316190
	.word	16384560
	.word	402
	.word	pf_blueWater
	.word	326
	.word	pf_chest
	.word	430
	.word	830
	.word	level1_bgm_length
	.word	level1_bgm_data
	.word	playSoundA
	.word	rand
	.word	1717986919
	.word	pf_smallCar
	.word	pf_bigCar
	.size	game0, .-game0
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, #0
	mov	lr, #1
	ldr	r2, .L290
	ldr	ip, .L290+4
	strb	r4, [r2]
	ldr	r0, .L290+8
	ldr	r1, .L290+12
	ldr	r2, .L290+16
	ldr	r3, .L290+20
	strb	lr, [ip]
	str	r4, [r0]
	str	r4, [r1]
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	ldr	ip, .L290+24
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L290+28
	mov	lr, pc
	bx	ip
	mov	r2, #67108864
	mov	r1, #4352
	ldr	r3, .L290+32
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L290+36
	ldr	r1, .L290+40
	ldr	lr, .L290+44
	ldr	ip, .L290+48
	ldr	fp, [r1, #36]
	ldrh	r10, [r6, #40]
	and	fp, fp, lr
	and	r10, r10, ip
	ldr	r2, .L290+52
	strh	r10, [r6, #40]	@ movhi
	mov	r8, #12
	ldr	r10, .L290+56
	orr	fp, fp, #1073741824
	orr	fp, fp, #8192
	str	fp, [r1, #36]
	str	r10, [r1, #32]
	mov	fp, #8
	str	r10, [r2, #32]
	mov	r10, #4
	ldr	r5, [r6, #36]
	ldrh	r3, [r1, #40]
	ldr	r0, .L290+60
	ldr	r9, .L290+64
	ldr	r7, .L290+68
	and	r5, r5, lr
	str	r0, [r6, #32]
	and	r3, r3, ip
	add	r0, r6, #36
	orr	r5, r5, #1073741824
	str	r0, [r6, #28]
	str	r9, [r6, #12]
	ldr	r0, .L290+72
	ldr	r9, .L290+76
	strh	r7, [r6, #20]	@ movhi
	strb	r8, [r2, #23]
	ldr	r7, .L290+80
	ldr	r8, .L290+84
	orr	r5, r5, #8192
	orr	r3, r3, #264
	str	r5, [r6, #36]
	strh	r3, [r1, #40]	@ movhi
	add	r5, r1, #36
	add	r3, r2, #36
	str	r4, [r6]
	strb	r4, [r6, #23]
	strb	r4, [r6, #24]
	str	r4, [r1]
	str	r5, [r1, #28]
	str	r4, [r2]
	str	r3, [r2, #28]
	str	r0, [r6, #4]
	str	r0, [r1, #4]
	str	r0, [r2, #4]
	strb	r10, [r1, #23]
	strb	fp, [r1, #24]
	strb	fp, [r2, #24]
	str	r9, [r1, #12]
	strh	r7, [r1, #20]	@ movhi
	str	r8, [r6, #16]
	str	r8, [r1, #16]
	ldr	r8, [r2, #36]
	ldrh	r1, [r2, #40]
	str	r9, [r2, #12]
	ldr	r9, .L290+88
	ldr	r10, .L290+92
	and	r8, r8, lr
	and	r1, r1, ip
	orr	r8, r8, r9
	orr	r1, r1, #280
	strh	r7, [r2, #20]	@ movhi
	str	r8, [r2, #36]
	strh	r1, [r2, #40]	@ movhi
	str	r10, [r2, #16]
	mov	r2, #4
	ldr	r5, .L290+96
	ldr	r3, .L290+100
	strb	r2, [r5, #23]
	ldrh	r2, [r3, #40]
	and	r2, r2, ip
	orr	r2, r2, #360
	strh	r2, [r3, #40]	@ movhi
	mov	r2, #10
	ldr	fp, [r5, #36]
	and	fp, fp, lr
	orr	fp, fp, #8192
	str	fp, [r5, #36]
	mov	fp, #4
	strb	r2, [r5, #24]
	mov	r2, #11
	ldrh	r8, [r5, #40]
	and	r8, r8, ip
	orr	r8, r8, #328
	strh	r8, [r5, #40]	@ movhi
	ldr	r8, .L290+104
	str	r8, [r5, #12]
	ldr	r8, .L290+108
	ldr	r1, [r3, #36]
	strh	r8, [r5, #20]	@ movhi
	ldr	r8, .L290+112
	and	r1, r1, lr
	strb	fp, [r3, #23]
	str	r8, [r3, #32]
	ldr	fp, .L290+116
	add	r8, r3, #36
	orr	r1, r1, #8192
	str	r8, [r3, #28]
	str	r1, [r3, #36]
	ldr	r8, .L290+120
	ldr	r1, .L290+124
	str	fp, [r3, #12]
	add	fp, r5, #36
	str	r4, [r5]
	str	r0, [r5, #4]
	str	r4, [r3]
	str	r0, [r3, #4]
	str	fp, [r5, #28]
	str	r8, [r5, #32]
	str	r1, [r5, #16]
	str	r1, [r3, #16]
	strb	r2, [r3, #24]
	strh	r7, [r3, #20]	@ movhi
	ldr	r3, .L290+128
	str	r10, [r3, #16]
	mov	r10, #260	@ movhi
	mov	r1, r2
	strh	r10, [r3, #20]	@ movhi
	ldr	r10, .L290+132
	strb	r1, [r10, #24]
	mov	r1, #4
	strb	r1, [r10, #23]
	mov	r1, #8
	ldr	r2, [r3, #36]
	and	r2, r2, lr
	orr	r9, r2, r9
	add	r2, r3, #36
	str	r2, [r3, #28]
	ldrh	r2, [r3, #40]
	and	r2, r2, ip
	orr	r2, r2, #512
	strh	r2, [r3, #40]	@ movhi
	ldr	r2, .L290+136
	strb	r1, [r2, #23]
	ldr	r1, .L290+84
	str	r1, [r2, #16]
	mov	r1, #516	@ movhi
	strh	r1, [r2, #20]	@ movhi
	mov	r1, #16
	str	r9, [r3, #36]
	ldr	r9, .L290+140
	str	r9, [r3, #12]
	ldr	r9, .L290+144
	str	r9, [r10, #32]
	add	r9, r10, #36
	str	r9, [r10, #28]
	add	r9, r2, #36
	str	r9, [r2, #28]
	ldr	r9, [r2, #36]
	and	r9, r9, lr
	orr	r9, r9, #1073741824
	orr	r9, r9, #8192
	str	r9, [r2, #36]
	ldrh	r9, [r2, #40]
	and	r9, r9, ip
	orr	r9, r9, #16
	strh	r9, [r2, #40]	@ movhi
	ldr	r9, .L290+148
	strb	r1, [r3, #24]
	str	r9, [r2, #12]
	ldr	r1, .L290+124
	ldr	r9, .L290+152
	str	r4, [r3]
	str	r0, [r3, #4]
	strb	r4, [r3, #23]
	str	r4, [r2]
	str	r4, [r10]
	str	r0, [r10, #4]
	str	r0, [r2, #4]
	strb	r4, [r2, #24]
	str	r9, [r2, #32]
	str	r9, [r3, #32]
	ldr	r9, [r10, #36]
	str	r1, [r10, #16]
	ldrh	r1, [r10, #40]
	and	r1, r1, ip
	orr	r1, r1, #360
	strh	r1, [r10, #40]	@ movhi
	and	r9, r9, lr
	ldr	r1, .L290+156
	orr	r9, r9, #8192
	str	r9, [r10, #36]
	strh	r7, [r10, #20]	@ movhi
	str	r1, [r10, #12]
	mov	r10, #8
	ldr	r3, .L290+160
	strb	r10, [r3, #23]
	mov	r10, #10
	ldr	r2, .L290+164
	strb	r10, [r3, #24]
	strb	r10, [r2, #24]
	mvn	r10, #254	@ movhi
	str	r0, [r3, #4]
	str	r0, [r2, #4]
	ldr	r0, .L290+168
	strh	r10, [r2, #20]	@ movhi
	add	r10, r2, #36
	str	r10, [r2, #28]
	str	r0, [r3, #12]
	mov	r10, #6
	mvn	r0, #253	@ movhi
	ldr	r1, [r3, #36]
	ldr	r9, [r2, #36]
	and	r9, r9, lr
	and	lr, lr, r1
	ldrh	r1, [r2, #40]
	and	r1, r1, ip
	orr	r1, r1, #332
	strh	r1, [r2, #40]	@ movhi
	mov	r1, fp
	mov	fp, #4
	ldrh	r7, [r3, #40]
	str	r8, [r3, #32]
	ldr	r8, .L290+84
	and	ip, ip, r7
	ldr	r7, .L290+172
	str	r8, [r3, #16]
	str	r8, [r2, #16]
	ldr	r8, .L290+176
	str	r7, [r2, #12]
	orr	r9, r9, #1073741824
	ldr	r7, .L290+180
	orr	lr, lr, #1073741824
	str	r8, [r2, #32]
	orr	r9, r9, #8192
	add	r8, r3, #36
	orr	lr, lr, #8192
	orr	ip, ip, #336
	str	r4, [r3]
	str	r4, [r2]
	strb	r10, [r2, #23]
	str	r9, [r2, #36]
	str	lr, [r3, #36]
	strh	r0, [r3, #20]	@ movhi
	str	r8, [r3, #28]
	ldr	r2, .L290+184
	strh	ip, [r3, #40]	@ movhi
	ldrh	ip, [r7]
	ldrh	r3, [r7, #4]
	ldrh	lr, [r7, #2]
	and	r3, r3, r2
	and	ip, ip, #7168
	ldr	r9, .L290+188
	orr	ip, ip, #8192
	orr	r3, r3, #328
	and	lr, lr, #15872
	orr	ip, ip, #4
	orr	r3, r3, #2
	strh	lr, [r7, #2]	@ movhi
	strh	ip, [r7]	@ movhi
	strh	r3, [r7, #4]	@ movhi
	ldr	r10, .L290+192
	mov	r2, #8
	mov	r0, r9
	mov	lr, pc
	bx	r10
	mov	r1, r8
	mov	r2, #8
	ldr	r0, .L290+196
	strb	fp, [r9]
	mov	lr, pc
	bx	r10
	ldr	ip, .L290+24
	mov	r7, ip
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L290+200
	ldr	r1, .L290+204
	mov	lr, pc
	bx	ip
	mov	ip, r7
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L290+208
	ldr	r1, .L290+212
	mov	lr, pc
	bx	ip
	mov	lr, #1024
	mov	r0, #256
	ldr	ip, .L290+216
	ldr	r1, .L290+220
	ldr	r2, .L290+224
	ldr	r3, .L290+228
	ldr	r7, .L290+16
	str	lr, [ip]
	str	r0, [r1]
	str	r2, [r3]
	str	r4, [r7]
	bl	resumeGame
	ldr	r3, .L290+232
	mov	lr, pc
	bx	r3
	bl	initUI
	ldrsb	r7, [r6, #17]
	rsb	r7, r7, #120
	lsl	r7, r7, #16
	asr	r7, r7, #16
	mov	r2, r7
	mov	r1, #16
	ldr	r0, .L290+236
	ldr	r3, .L290+240
	mov	lr, pc
	bx	r3
	mov	r0, r6
	ldr	r3, .L290+244
	mov	lr, pc
	bx	r3
	mov	r3, #16	@ movhi
	strh	r7, [r0, #2]	@ movhi
	strh	r3, [r0]	@ movhi
	ldr	r3, .L290+248
	ldr	r7, .L290+252
	ldrsb	r6, [r5, #17]
	str	r0, [r3]
	mov	lr, pc
	bx	r7
	ldr	r8, .L290+256
	smull	r2, r3, r8, r0
	asr	r1, r0, #31
	add	r3, r3, r0
	rsb	r1, r1, r3, asr #9
	rsb	r1, r1, r1, lsl #4
	sub	r1, r0, r1, lsl #6
	rsb	r6, r6, #120
	lsl	r1, r1, #16
	mov	r2, r6
	asr	r1, r1, #16
	mov	r0, r5
	bl	createCreature
	mov	lr, pc
	bx	r7
	smull	r3, r8, r0, r8
	asr	r1, r0, #31
	add	r8, r8, r0
	rsb	r1, r1, r8, asr #9
	rsb	r1, r1, r1, lsl #4
	sub	r1, r0, r1, lsl #6
	lsl	r1, r1, #16
	mov	r2, r6
	asr	r1, r1, #16
	mov	r0, r5
	bl	createCreature
	mov	lr, pc
	bx	r7
	ldr	r3, .L290+260
	smull	r2, r3, r0, r3
	asr	r1, r0, #31
	add	r3, r3, r0
	rsb	r1, r1, r3, asr #7
	add	r1, r1, r1, lsl #2
	rsb	r1, r1, r1, lsl #3
	sub	r0, r0, r1, lsl #2
	add	r1, r0, #816
	lsl	r1, r1, #16
	mov	r2, r6
	asr	r1, r1, #16
	mov	r0, r5
	bl	createCreature
	bl	updateUI
	ldr	r3, .L290+264
	ldr	r5, .L290+268
	ldr	r1, [r3]
	mov	r2, #1
	ldr	r0, .L290+272
	ldr	r3, .L290+276
	mov	lr, pc
	bx	r3
	str	r4, [r5]
	mov	r2, #2
	mov	r5, #10	@ movhi
	mov	r0, #30
	ldr	lr, .L290+280
	ldr	r3, .L290+284
	ldr	ip, .L290+288
	ldr	r1, .L290+292
	strh	r5, [lr]	@ movhi
	str	r4, [ip]
	str	r2, [r3]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	strh	r0, [r1]	@ movhi
	b	updateUI
.L291:
	.align	2
.L290:
	.word	cheatEnabled
	.word	showingManual
	.word	invincibleCounter
	.word	diamondCollected
	.word	level
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	mgba_open
	.word	pf_player
	.word	pf_smallCar
	.word	1073683711
	.word	-1023
	.word	pf_bigCar
	.word	carMoveLeft
	.word	updatePlayer
	.word	16850433
	.word	1284
	.word	2147418112
	.word	204290
	.word	257
	.word	4112
	.word	-2147459072
	.word	4128
	.word	pf_blueWater
	.word	pf_greyWater
	.word	7688
	.word	-25343
	.word	updateBullet
	.word	531975
	.word	updateCollectible
	.word	2056
	.word	pf_enemyBird
	.word	pf_birdEgg
	.word	pf_enemyTurtle
	.word	138757
	.word	updateEgg
	.word	73219
	.word	updateEnemy
	.word	50339334
	.word	pf_diamond
	.word	pf_chest
	.word	7689
	.word	7690
	.word	updateChest
	.word	pf_ui_heart
	.word	3073
	.word	pf_ui_drop
	.word	memcpy
	.word	pf_ui_diamond
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	mapWidth
	.word	mapHeight
	.word	level0collisionmapBitmap
	.word	mapCollisionBitmap
	.word	clearSprites
	.word	.LC0
	.word	mgba_printf
	.word	createSprite
	.word	player
	.word	rand
	.word	-2004318071
	.word	-368140053
	.word	level0_bgm_length
	.word	dropCollected
	.word	level0_bgm_data
	.word	playSoundA
	.word	hOff
	.word	playerGravity
	.word	frameElapsed
	.word	vOff
	.size	initGame, .-initGame
	.align	2
	.global	cleanGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	cleanGame, %function
cleanGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L294
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r2, #0
	pop	{r4, lr}
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #22]	@ movhi
	strh	r2, [r3, #20]	@ movhi
	bx	lr
.L295:
	.align	2
.L294:
	.word	clearSprites
	.size	cleanGame, .-cleanGame
	.comm	showingManual,1,1
	.comm	cheatEnabled,1,1
	.comm	invincibleCounter,4,4
	.comm	frameElapsed,4,4
	.comm	ui_drops,32,4
	.comm	ui_hearts,20,4
	.comm	level,4,4
	.comm	diamondCollected,4,4
	.comm	dropCollected,4,4
	.comm	jumpCounter,4,4
	.comm	playerGravity,4,4
	.comm	player,4,4
	.comm	pf_ui_drop,8,4
	.comm	pf_ui_heart,8,4
	.comm	pf_ui_diamond,8,4
	.comm	pf_diamond,44,4
	.comm	pf_chest,44,4
	.comm	pf_greyWater,44,4
	.comm	pf_blueWater,44,4
	.comm	pf_turtleShell,44,4
	.comm	pf_enemyTurtle,44,4
	.comm	pf_birdEgg,44,4
	.comm	pf_enemyBird,44,4
	.comm	pf_bigCar,44,4
	.comm	pf_smallCar,44,4
	.comm	pf_player,44,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
