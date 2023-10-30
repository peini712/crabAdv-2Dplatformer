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
	.file	"gameStateMachine.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"state changed: from %d to %d\000"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	gameInfo.part.0, %function
gameInfo.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L4
	mov	r2, #0
	ldrb	r1, [r4]	@ zero_extendqisi2
	ldr	r0, .L4+4
	ldr	r3, .L4+8
	mov	lr, pc
	bx	r3
	mov	r2, #1
	mov	ip, #0
	ldrb	r0, [r4]	@ zero_extendqisi2
	ldr	r1, .L4+12
	ldr	r3, .L4+16
	strb	r0, [r1]
	strb	r2, [r3]
	strb	ip, [r4]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	state
	.word	.LC0
	.word	mgba_printf
	.word	previous_state
	.word	state_changed
	.size	gameInfo.part.0, .-gameInfo.part.0
	.set	pause.part.0,gameInfo.part.0
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"seed is %d\000"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame0.part.0, %function
goToGame0.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L8
	ldr	r0, .L8+4
	ldr	r1, [r4]
	ldr	r3, .L8+8
	mov	lr, pc
	bx	r3
	ldr	r0, [r4]
	ldr	r3, .L8+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	seed
	.word	.LC1
	.word	mgba_printf
	.word	srand
	.word	initGame
	.size	goToGame0.part.0, .-goToGame0.part.0
	.align	2
	.global	stateMachineInit
	.syntax unified
	.arm
	.fpu softvfp
	.type	stateMachineInit, %function
stateMachineInit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #0
	ldr	r5, .L12
	ldr	r6, .L12+4
	mov	r2, r4
	ldrb	r1, [r5]	@ zero_extendqisi2
	ldr	r0, .L12+8
	ldr	r3, .L12+12
	strb	r4, [r6]
	mov	lr, pc
	bx	r3
	mov	r3, #1
	ldr	r1, .L12+16
	ldrb	r0, [r5]	@ zero_extendqisi2
	ldr	ip, .L12+20
	ldr	r2, .L12+24
	strb	r3, [r1]
	str	r4, [ip]
	strb	r0, [r6]
	strb	r4, [r5]
	str	r3, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	state
	.word	previous_state
	.word	.LC0
	.word	mgba_printf
	.word	state_changed
	.word	bgTimer
	.word	bgState
	.size	stateMachineInit, .-stateMachineInit
	.align	2
	.global	setState
	.syntax unified
	.arm
	.fpu softvfp
	.type	setState, %function
setState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L16
	mov	r4, r0
	mov	r2, r0
	ldrb	r1, [r5]	@ zero_extendqisi2
	ldr	r0, .L16+4
	ldr	r3, .L16+8
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldrb	r0, [r5]	@ zero_extendqisi2
	ldr	r1, .L16+12
	ldr	r3, .L16+16
	strb	r0, [r1]
	strb	r2, [r3]
	strb	r4, [r5]
	pop	{r4, r5, r6, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	state
	.word	.LC0
	.word	mgba_printf
	.word	previous_state
	.word	state_changed
	.size	setState, .-setState
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L34
	ldr	r3, .L34+4
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	cmp	r3, #60
	bne	.L19
	ldr	r3, .L34+8
	ldr	r2, [r3]
	cmp	r2, #0
	mov	r1, #67108864
	moveq	r2, #1
	movne	r2, #0
	ldreq	r0, .L34+12
	ldrne	r0, .L34+16
	strh	r0, [r1, #8]	@ movhi
	str	r2, [r3]
	mov	r3, #0
	str	r3, [r4]
.L19:
	mov	lr, #67108864
	ldr	r5, .L34+20
	ldr	r1, [r5]
	rsbs	r2, r1, #0
	and	r2, r2, #255
	and	r3, r1, #255
	rsbpl	r3, r2, #0
	add	r2, r1, r1, lsl #4
	ldr	ip, .L34+24
	lsl	r3, r3, #16
	add	r2, r2, r2, lsl #8
	lsr	r3, r3, #16
	add	r2, r2, r2, lsl #16
	sub	ip, ip, r2
	rsb	r0, r3, #256
	ldr	r2, .L34+28
	lsl	r0, r0, #16
	lsr	r0, r0, #16
	cmp	r2, ip, ror #2
	strh	r3, [lr, #20]	@ movhi
	strh	r0, [lr, #24]	@ movhi
	bcc	.L22
	mov	r0, #117440512
	ldr	r2, .L34+32
	smull	r3, r2, r1, r2
	asr	r3, r1, #31
	add	r1, r2, r1
	rsb	r1, r3, r1, asr #5
	rsbs	r2, r1, #0
	and	r2, r2, #3
	ldr	r3, .L34+36
	ldrh	ip, [r0, #4]
	and	r1, r1, #3
	rsbpl	r1, r2, #0
	ldr	r2, .L34+40
	and	r1, r3, r1, lsl #6
	and	ip, ip, r2
	ldr	r3, [r0]
	ldr	r2, .L34+44
	and	r2, r2, r3
	ldr	r3, .L34+48
	orr	r1, r1, ip
	orr	r3, r2, r3
	strh	r1, [r0, #4]	@ movhi
	str	r3, [r0]
.L22:
	ldr	r6, .L34+52
	ldrh	r3, [r6]
	tst	r3, #4
	beq	.L23
	ldr	r2, .L34+56
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L32
.L23:
	tst	r3, #8
	beq	.L24
	ldr	r3, .L34+56
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L33
.L24:
	ldr	r2, [r4]
	ldr	r3, [r5]
	add	r2, r2, #1
	add	r3, r3, #1
	str	r2, [r4]
	str	r3, [r5]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L33:
	ldr	r6, .L34+60
	mov	r2, #2
	ldrb	r1, [r6]	@ zero_extendqisi2
	ldr	r0, .L34+64
	ldr	r3, .L34+68
	mov	lr, pc
	bx	r3
	mov	ip, #2
	mov	r2, #1
	ldrb	r0, [r6]	@ zero_extendqisi2
	ldr	r1, .L34+72
	ldr	r3, .L34+76
	strb	ip, [r6]
	strb	r0, [r1]
	strb	r2, [r3]
	b	.L24
.L32:
	ldr	r7, .L34+60
	mov	r2, #1
	ldrb	r1, [r7]	@ zero_extendqisi2
	ldr	r0, .L34+64
	ldr	r3, .L34+68
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldrb	ip, [r7]	@ zero_extendqisi2
	ldr	r0, .L34+72
	ldr	r1, .L34+76
	ldrh	r3, [r6]
	strb	ip, [r0]
	strb	r2, [r7]
	strb	r2, [r1]
	b	.L23
.L35:
	.align	2
.L34:
	.word	bgTimer
	.word	hideSprites
	.word	bgState
	.word	5763
	.word	6019
	.word	seed
	.word	143165576
	.word	71582788
	.word	-2004318071
	.word	1022
	.word	-1023
	.word	1040194560
	.word	1081090120
	.word	oldButtons
	.word	buttons
	.word	state
	.word	.LC0
	.word	mgba_printf
	.word	previous_state
	.word	state_changed
	.size	start, .-start
	.align	2
	.global	gameInfo
	.syntax unified
	.arm
	.fpu softvfp
	.type	gameInfo, %function
gameInfo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L41
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L41+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	gameInfo.part.0
.L42:
	.align	2
.L41:
	.word	oldButtons
	.word	buttons
	.size	gameInfo, .-gameInfo
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L55
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L44
	ldr	r2, .L55+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L53
.L44:
	tst	r3, #4
	beq	.L43
	ldr	r3, .L55+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L54
.L43:
	pop	{r4, r5, r6, lr}
	bx	lr
.L54:
	pop	{r4, r5, r6, lr}
	b	pause.part.0
.L53:
	ldr	r5, .L55+8
	mov	r2, #2
	ldrb	r1, [r5]	@ zero_extendqisi2
	ldr	r0, .L55+12
	ldr	r3, .L55+16
	mov	lr, pc
	bx	r3
	mov	r3, #2
	mov	r1, #1
	ldrb	ip, [r5]	@ zero_extendqisi2
	ldr	r0, .L55+20
	ldr	r2, .L55+24
	strb	r3, [r5]
	ldr	r3, .L55+28
	strb	ip, [r0]
	strb	r1, [r2]
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L44
.L56:
	.align	2
.L55:
	.word	oldButtons
	.word	buttons
	.word	state
	.word	.LC0
	.word	mgba_printf
	.word	previous_state
	.word	state_changed
	.word	unpauseSounds
	.size	pause, .-pause
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	gameInfo
	.size	win, .-win
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	gameInfo
	.size	lose, .-lose
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #67108864
	mov	r3, #5888
	ldr	ip, .L61
	ldr	r2, .L61+4
	ldr	r1, .L61+8
	push	{r4, lr}
	ldr	r4, .L61+12
	strh	r3, [r0]	@ movhi
	strh	r2, [r0, #8]	@ movhi
	mov	r3, #256
	strh	r1, [r0, #10]	@ movhi
	mov	r2, #83886080
	strh	ip, [r0, #12]	@ movhi
	ldr	r1, .L61+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L61+20
	ldr	r1, .L61+24
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L61+28
	ldr	r1, .L61+32
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L61+36
	ldr	r1, .L61+40
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L61+44
	ldr	r1, .L61+48
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L61+52
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L61+56
	mov	lr, pc
	bx	r4
	ldr	r3, .L61+60
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L61+64
	ldr	r3, .L61+68
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L62:
	.align	2
.L61:
	.word	5506
	.word	5763
	.word	5250
	.word	DMANow
	.word	welcomePal
	.word	15136
	.word	welcomeTiles
	.word	100704256
	.word	welcomeMap
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	hideSprites
	.word	shadowOAM
	.word	menu_song_length
	.word	menu_song_data
	.word	playSoundA
	.size	goToStart, .-goToStart
	.align	2
	.global	goToGameInfo
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGameInfo, %function
goToGameInfo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #67108864
	mov	r4, #256
	mov	r1, #5120
	strh	r4, [r3]	@ movhi
	ldr	r2, .L65
	strh	r1, [r3, #8]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r3, r4
	mov	r2, #83886080
	ldr	r4, .L65+4
	mov	r0, #3
	ldr	r1, .L65+8
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L65+12
	ldr	r1, .L65+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L65+20
	ldr	r1, .L65+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L66:
	.align	2
.L65:
	.word	hideSprites
	.word	DMANow
	.word	gameInfoPagePal
	.word	6816
	.word	gameInfoPageTiles
	.word	100704256
	.word	gameInfoPageMap
	.size	goToGameInfo, .-goToGameInfo
	.align	2
	.global	goToGame0
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame0, %function
goToGame0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, r0
	ldr	r3, .L73
	mov	lr, pc
	bx	r3
	cmp	r4, #3
	popne	{r4, lr}
	bne	goToGame0.part.0
.L72:
	ldr	r3, .L73+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L74:
	.align	2
.L73:
	.word	hideSprites
	.word	resumeGame
	.size	goToGame0, .-goToGame0
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #256
	mov	r5, #67108864
	mov	r2, #5248
	ldr	r4, .L77
	strh	r3, [r5]	@ movhi
	mov	r0, #3
	strh	r2, [r5, #8]	@ movhi
	ldr	r1, .L77+4
	mov	r2, #83886080
	mov	lr, pc
	bx	r4
	mov	r3, #12928
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L77+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L77+12
	mov	r3, #1024
	ldr	r2, .L77+16
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r2, .L77+20
	strh	r3, [r5, #16]	@ movhi
	strh	r3, [r5, #18]	@ movhi
	mov	lr, pc
	bx	r2
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L77+24
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L78:
	.align	2
.L77:
	.word	DMANow
	.word	pausePagePal
	.word	pausePageTiles
	.word	pausePageMap
	.word	100704256
	.word	hideSprites
	.word	shadowOAM
	.size	goToPause, .-goToPause
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"diamond collected: %d\000"
	.align	2
.LC3:
	.ascii	"diamond %p, x: %d\000"
	.text
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r2, #5248
	mov	r6, #67108864
	mov	r3, #4352
	mov	r4, #0
	ldr	r5, .L84
	strh	r3, [r6]	@ movhi
	mov	r0, #3
	mov	r3, #256
	strh	r2, [r6, #8]	@ movhi
	ldr	r1, .L84+4
	mov	r2, #83886080
	mov	lr, pc
	bx	r5
	mov	r3, #13440
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L84+8
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r2, .L84+12
	ldr	r1, .L84+16
	mov	r3, #1024
	mov	lr, pc
	bx	r5
	strh	r4, [r6, #16]	@ movhi
	ldr	r3, .L84+20
	strh	r4, [r6, #18]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L84+24
	mov	lr, pc
	bx	r5
	ldr	r3, .L84+28
	ldr	r10, .L84+32
	ldr	r1, [r3]
	mov	r2, #1
	ldr	r3, .L84+36
	ldr	r0, .L84+40
	mov	lr, pc
	bx	r3
	ldr	r5, .L84+44
	ldr	r1, [r10]
	ldr	r0, .L84+48
	mov	lr, pc
	bx	r5
	ldr	r3, [r10]
	cmp	r3, r4
	ble	.L80
	mov	fp, #60
	ldr	r9, .L84+52
	ldr	r8, .L84+56
	ldr	r7, .L84+60
	ldr	r6, .L84+64
.L81:
	mov	r0, r8
	mov	lr, pc
	bx	r9
	mov	r2, #96
	ldr	r1, [r0, #28]
	ldrh	r3, [r1, #2]
	lsr	r3, r3, #9
	orr	r3, r3, fp, lsl #23
	ror	r3, r3, #23
	strb	r2, [r1]
	strh	r3, [r1, #2]	@ movhi
	mov	r2, fp
	mov	r0, r7
	mov	lr, pc
	bx	r5
	ldr	r3, [r10]
	add	r4, r4, #1
	add	fp, fp, #16
	cmp	r3, r4
	and	fp, fp, r6
	bgt	.L81
.L80:
	ldr	r3, .L84+68
	mov	lr, pc
	bx	r3
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L85:
	.align	2
.L84:
	.word	DMANow
	.word	winPagePal
	.word	winPageTiles
	.word	100704256
	.word	winPageMap
	.word	clearSprites
	.word	shadowOAM
	.word	win_length
	.word	diamondCollected
	.word	playSoundA
	.word	win_data
	.word	mgba_printf
	.word	.LC2
	.word	createUI
	.word	pf_ui_diamond
	.word	.LC3
	.word	511
	.word	updateSprites
	.size	goToWin, .-goToWin
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #256
	mov	r5, #67108864
	mov	r2, #5248
	mov	r6, #0
	ldr	r4, .L88
	strh	r3, [r5]	@ movhi
	mov	r0, #3
	strh	r2, [r5, #8]	@ movhi
	ldr	r1, .L88+4
	mov	r2, #83886080
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L88+8
	ldr	r1, .L88+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L88+16
	ldr	r1, .L88+20
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	strh	r6, [r5, #16]	@ movhi
	ldr	r3, .L88+24
	strh	r6, [r5, #18]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L88+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L88+32
	mov	r2, r6
	ldr	r1, [r3]
	ldr	r0, .L88+36
	ldr	r3, .L88+40
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L89:
	.align	2
.L88:
	.word	DMANow
	.word	losePagePal
	.word	7136
	.word	losePageTiles
	.word	100704256
	.word	losePageMap
	.word	hideSprites
	.word	shadowOAM
	.word	loseSound_length
	.word	loseSound_data
	.word	playSoundA
	.size	goToLose, .-goToLose
	.align	2
	.global	stateMachineLoop
	.syntax unified
	.arm
	.fpu softvfp
	.type	stateMachineLoop, %function
stateMachineLoop:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L117
	ldr	r2, .L117+4
	ldrh	r1, [r3]
	push	{r4, r5, r6, lr}
	ldr	r4, .L117+8
	strh	r1, [r2]	@ movhi
	ldr	r2, .L117+12
	ldrb	r1, [r4]	@ zero_extendqisi2
	ldrh	r2, [r2, #48]
	cmp	r1, #0
	strh	r2, [r3]	@ movhi
	bne	.L91
	ldr	r3, .L117+16
	ldrb	r3, [r3]	@ zero_extendqisi2
.L92:
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L103
.L105:
	.word	.L108
	.word	.L104
	.word	.L107
	.word	.L106
	.word	.L104
	.word	.L104
.L106:
	bl	pause
.L103:
	ldr	r3, .L117+20
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L104:
	bl	gameInfo
	b	.L103
.L91:
	ldr	r6, .L117+24
	ldr	r3, .L117+28
	mov	lr, pc
	bx	r3
	ldrb	r3, [r6]	@ zero_extendqisi2
	cmp	r3, #2
	ldr	r5, .L117+16
	beq	.L113
.L93:
	ldrb	r3, [r5]	@ zero_extendqisi2
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L95
.L97:
	.word	.L101
	.word	.L100
	.word	.L99
	.word	.L94
	.word	.L98
	.word	.L96
.L99:
	ldrb	r6, [r6]	@ zero_extendqisi2
	ldr	r3, .L117+32
	mov	lr, pc
	bx	r3
	cmp	r6, #3
	beq	.L115
	bl	goToGame0.part.0
	ldrb	r3, [r5]	@ zero_extendqisi2
.L95:
	mov	r2, #0
	strb	r2, [r4]
	b	.L92
.L108:
	bl	start
	b	.L103
.L107:
	ldr	r3, .L117+36
	mov	lr, pc
	bx	r3
	b	.L103
.L113:
	ldrb	r3, [r5]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L116
.L94:
	bl	goToPause
	ldrb	r3, [r5]	@ zero_extendqisi2
	b	.L95
.L116:
	ldr	r3, .L117+40
	mov	lr, pc
	bx	r3
	b	.L93
.L98:
	bl	goToWin
	ldrb	r3, [r5]	@ zero_extendqisi2
	b	.L95
.L101:
	bl	goToStart
	ldrb	r3, [r5]	@ zero_extendqisi2
	b	.L95
.L96:
	bl	goToLose
	ldrb	r3, [r5]	@ zero_extendqisi2
	b	.L95
.L100:
	bl	goToGameInfo
	ldrb	r3, [r5]	@ zero_extendqisi2
	b	.L95
.L115:
	ldr	r3, .L117+44
	mov	lr, pc
	bx	r3
	ldrb	r3, [r5]	@ zero_extendqisi2
	b	.L95
.L118:
	.align	2
.L117:
	.word	buttons
	.word	oldButtons
	.word	state_changed
	.word	67109120
	.word	state
	.word	waitForVBlank
	.word	previous_state
	.word	pauseSounds
	.word	hideSprites
	.word	game0
	.word	cleanGame
	.word	resumeGame
	.size	stateMachineLoop, .-stateMachineLoop
	.comm	bgTimer,4,4
	.comm	bgState,4,4
	.comm	state_changed,1,1
	.comm	state,1,1
	.comm	previous_state,1,1
	.comm	seed,4,4
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
