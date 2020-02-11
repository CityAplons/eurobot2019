
build/robotflesh.elf:     file format elf32-littlearm

Sections:
Idx Name              Size      VMA       LMA       File off  Algn  Flags
  0 .isr_vector       00000188  08000000  08000000  00010000  2**0  CONTENTS, ALLOC, LOAD, READONLY, DATA
  1 .text             0000b0b4  08000190  08000190  00010190  2**4  CONTENTS, ALLOC, LOAD, READONLY, CODE
  2 .rodata           00000938  0800b248  0800b248  0001b248  2**3  CONTENTS, ALLOC, LOAD, READONLY, DATA
  3 .init_array       00000004  0800bb80  0800bb80  0001bb80  2**2  CONTENTS, ALLOC, LOAD, DATA
  4 .fini_array       00000004  0800bb84  0800bb84  0001bb84  2**2  CONTENTS, ALLOC, LOAD, DATA
  5 .data             00000250  20000000  0800bb88  00020000  2**2  CONTENTS, ALLOC, LOAD, DATA
  6 .ccmram           00000000  10000000  10000000  00020250  2**0  CONTENTS
  7 .bss              000190c0  20000250  20000250  00020250  2**3  ALLOC
  8 ._user_heap_stack 00000600  20019310  20019310  00020250  2**0  ALLOC
  9 .ARM.attributes   00000030  00000000  00000000  00020250  2**0  CONTENTS, READONLY
 10 .debug_info       0001d7a0  00000000  00000000  00020280  2**0  CONTENTS, READONLY, DEBUGGING
 11 .debug_abbrev     00003c22  00000000  00000000  0003da20  2**0  CONTENTS, READONLY, DEBUGGING
 12 .debug_loc        00007aa4  00000000  00000000  00041642  2**0  CONTENTS, READONLY, DEBUGGING
 13 .debug_aranges    00000e08  00000000  00000000  000490e6  2**0  CONTENTS, READONLY, DEBUGGING
 14 .debug_ranges     00000c88  00000000  00000000  00049eee  2**0  CONTENTS, READONLY, DEBUGGING
 15 .debug_line       00005fb0  00000000  00000000  0004ab76  2**0  CONTENTS, READONLY, DEBUGGING
 16 .debug_str        0000490a  00000000  00000000  00050b26  2**0  CONTENTS, READONLY, DEBUGGING
 17 .comment          0000007f  00000000  00000000  00055430  2**0  CONTENTS, READONLY
 18 .debug_frame      00004200  00000000  00000000  000554b0  2**2  CONTENTS, READONLY, DEBUGGING

Disassembly of section .text:

08000190 <__do_global_dtors_aux>:
 8000190:	b510      	push	{r4, lr}
 8000192:	4c05      	ldr	r4, [pc, #20]	; (80001a8 <__do_global_dtors_aux+0x18>)
 8000194:	7823      	ldrb	r3, [r4, #0]
 8000196:	b933      	cbnz	r3, 80001a6 <__do_global_dtors_aux+0x16>
 8000198:	4b04      	ldr	r3, [pc, #16]	; (80001ac <__do_global_dtors_aux+0x1c>)
 800019a:	b113      	cbz	r3, 80001a2 <__do_global_dtors_aux+0x12>
 800019c:	4804      	ldr	r0, [pc, #16]	; (80001b0 <__do_global_dtors_aux+0x20>)
 800019e:	f3af 8000 	nop.w
 80001a2:	2301      	movs	r3, #1
 80001a4:	7023      	strb	r3, [r4, #0]
 80001a6:	bd10      	pop	{r4, pc}
 80001a8:	20000250 	.word	0x20000250
 80001ac:	00000000 	.word	0x00000000
 80001b0:	0800b22c 	.word	0x0800b22c

080001b4 <frame_dummy>:
 80001b4:	b508      	push	{r3, lr}
 80001b6:	4b03      	ldr	r3, [pc, #12]	; (80001c4 <frame_dummy+0x10>)
 80001b8:	b11b      	cbz	r3, 80001c2 <frame_dummy+0xe>
 80001ba:	4903      	ldr	r1, [pc, #12]	; (80001c8 <frame_dummy+0x14>)
 80001bc:	4803      	ldr	r0, [pc, #12]	; (80001cc <frame_dummy+0x18>)
 80001be:	f3af 8000 	nop.w
 80001c2:	bd08      	pop	{r3, pc}
 80001c4:	00000000 	.word	0x00000000
 80001c8:	20000254 	.word	0x20000254
 80001cc:	0800b22c 	.word	0x0800b22c

080001d0 <__aeabi_drsub>:
 80001d0:	f081 4100 	eor.w	r1, r1, #2147483648	; 0x80000000
 80001d4:	e002      	b.n	80001dc <__adddf3>
 80001d6:	bf00      	nop

080001d8 <__aeabi_dsub>:
 80001d8:	f083 4300 	eor.w	r3, r3, #2147483648	; 0x80000000

080001dc <__adddf3>:
 80001dc:	b530      	push	{r4, r5, lr}
 80001de:	ea4f 0441 	mov.w	r4, r1, lsl #1
 80001e2:	ea4f 0543 	mov.w	r5, r3, lsl #1
 80001e6:	ea94 0f05 	teq	r4, r5
 80001ea:	bf08      	it	eq
 80001ec:	ea90 0f02 	teqeq	r0, r2
 80001f0:	bf1f      	itttt	ne
 80001f2:	ea54 0c00 	orrsne.w	ip, r4, r0
 80001f6:	ea55 0c02 	orrsne.w	ip, r5, r2
 80001fa:	ea7f 5c64 	mvnsne.w	ip, r4, asr #21
 80001fe:	ea7f 5c65 	mvnsne.w	ip, r5, asr #21
 8000202:	f000 80e2 	beq.w	80003ca <__adddf3+0x1ee>
 8000206:	ea4f 5454 	mov.w	r4, r4, lsr #21
 800020a:	ebd4 5555 	rsbs	r5, r4, r5, lsr #21
 800020e:	bfb8      	it	lt
 8000210:	426d      	neglt	r5, r5
 8000212:	dd0c      	ble.n	800022e <__adddf3+0x52>
 8000214:	442c      	add	r4, r5
 8000216:	ea80 0202 	eor.w	r2, r0, r2
 800021a:	ea81 0303 	eor.w	r3, r1, r3
 800021e:	ea82 0000 	eor.w	r0, r2, r0
 8000222:	ea83 0101 	eor.w	r1, r3, r1
 8000226:	ea80 0202 	eor.w	r2, r0, r2
 800022a:	ea81 0303 	eor.w	r3, r1, r3
 800022e:	2d36      	cmp	r5, #54	; 0x36
 8000230:	bf88      	it	hi
 8000232:	bd30      	pophi	{r4, r5, pc}
 8000234:	f011 4f00 	tst.w	r1, #2147483648	; 0x80000000
 8000238:	ea4f 3101 	mov.w	r1, r1, lsl #12
 800023c:	f44f 1c80 	mov.w	ip, #1048576	; 0x100000
 8000240:	ea4c 3111 	orr.w	r1, ip, r1, lsr #12
 8000244:	d002      	beq.n	800024c <__adddf3+0x70>
 8000246:	4240      	negs	r0, r0
 8000248:	eb61 0141 	sbc.w	r1, r1, r1, lsl #1
 800024c:	f013 4f00 	tst.w	r3, #2147483648	; 0x80000000
 8000250:	ea4f 3303 	mov.w	r3, r3, lsl #12
 8000254:	ea4c 3313 	orr.w	r3, ip, r3, lsr #12
 8000258:	d002      	beq.n	8000260 <__adddf3+0x84>
 800025a:	4252      	negs	r2, r2
 800025c:	eb63 0343 	sbc.w	r3, r3, r3, lsl #1
 8000260:	ea94 0f05 	teq	r4, r5
 8000264:	f000 80a7 	beq.w	80003b6 <__adddf3+0x1da>
 8000268:	f1a4 0401 	sub.w	r4, r4, #1
 800026c:	f1d5 0e20 	rsbs	lr, r5, #32
 8000270:	db0d      	blt.n	800028e <__adddf3+0xb2>
 8000272:	fa02 fc0e 	lsl.w	ip, r2, lr
 8000276:	fa22 f205 	lsr.w	r2, r2, r5
 800027a:	1880      	adds	r0, r0, r2
 800027c:	f141 0100 	adc.w	r1, r1, #0
 8000280:	fa03 f20e 	lsl.w	r2, r3, lr
 8000284:	1880      	adds	r0, r0, r2
 8000286:	fa43 f305 	asr.w	r3, r3, r5
 800028a:	4159      	adcs	r1, r3
 800028c:	e00e      	b.n	80002ac <__adddf3+0xd0>
 800028e:	f1a5 0520 	sub.w	r5, r5, #32
 8000292:	f10e 0e20 	add.w	lr, lr, #32
 8000296:	2a01      	cmp	r2, #1
 8000298:	fa03 fc0e 	lsl.w	ip, r3, lr
 800029c:	bf28      	it	cs
 800029e:	f04c 0c02 	orrcs.w	ip, ip, #2
 80002a2:	fa43 f305 	asr.w	r3, r3, r5
 80002a6:	18c0      	adds	r0, r0, r3
 80002a8:	eb51 71e3 	adcs.w	r1, r1, r3, asr #31
 80002ac:	f001 4500 	and.w	r5, r1, #2147483648	; 0x80000000
 80002b0:	d507      	bpl.n	80002c2 <__adddf3+0xe6>
 80002b2:	f04f 0e00 	mov.w	lr, #0
 80002b6:	f1dc 0c00 	rsbs	ip, ip, #0
 80002ba:	eb7e 0000 	sbcs.w	r0, lr, r0
 80002be:	eb6e 0101 	sbc.w	r1, lr, r1
 80002c2:	f5b1 1f80 	cmp.w	r1, #1048576	; 0x100000
 80002c6:	d31b      	bcc.n	8000300 <__adddf3+0x124>
 80002c8:	f5b1 1f00 	cmp.w	r1, #2097152	; 0x200000
 80002cc:	d30c      	bcc.n	80002e8 <__adddf3+0x10c>
 80002ce:	0849      	lsrs	r1, r1, #1
 80002d0:	ea5f 0030 	movs.w	r0, r0, rrx
 80002d4:	ea4f 0c3c 	mov.w	ip, ip, rrx
 80002d8:	f104 0401 	add.w	r4, r4, #1
 80002dc:	ea4f 5244 	mov.w	r2, r4, lsl #21
 80002e0:	f512 0f80 	cmn.w	r2, #4194304	; 0x400000
 80002e4:	f080 809a 	bcs.w	800041c <__adddf3+0x240>
 80002e8:	f1bc 4f00 	cmp.w	ip, #2147483648	; 0x80000000
 80002ec:	bf08      	it	eq
 80002ee:	ea5f 0c50 	movseq.w	ip, r0, lsr #1
 80002f2:	f150 0000 	adcs.w	r0, r0, #0
 80002f6:	eb41 5104 	adc.w	r1, r1, r4, lsl #20
 80002fa:	ea41 0105 	orr.w	r1, r1, r5
 80002fe:	bd30      	pop	{r4, r5, pc}
 8000300:	ea5f 0c4c 	movs.w	ip, ip, lsl #1
 8000304:	4140      	adcs	r0, r0
 8000306:	eb41 0101 	adc.w	r1, r1, r1
 800030a:	f411 1f80 	tst.w	r1, #1048576	; 0x100000
 800030e:	f1a4 0401 	sub.w	r4, r4, #1
 8000312:	d1e9      	bne.n	80002e8 <__adddf3+0x10c>
 8000314:	f091 0f00 	teq	r1, #0
 8000318:	bf04      	itt	eq
 800031a:	4601      	moveq	r1, r0
 800031c:	2000      	moveq	r0, #0
 800031e:	fab1 f381 	clz	r3, r1
 8000322:	bf08      	it	eq
 8000324:	3320      	addeq	r3, #32
 8000326:	f1a3 030b 	sub.w	r3, r3, #11
 800032a:	f1b3 0220 	subs.w	r2, r3, #32
 800032e:	da0c      	bge.n	800034a <__adddf3+0x16e>
 8000330:	320c      	adds	r2, #12
 8000332:	dd08      	ble.n	8000346 <__adddf3+0x16a>
 8000334:	f102 0c14 	add.w	ip, r2, #20
 8000338:	f1c2 020c 	rsb	r2, r2, #12
 800033c:	fa01 f00c 	lsl.w	r0, r1, ip
 8000340:	fa21 f102 	lsr.w	r1, r1, r2
 8000344:	e00c      	b.n	8000360 <__adddf3+0x184>
 8000346:	f102 0214 	add.w	r2, r2, #20
 800034a:	bfd8      	it	le
 800034c:	f1c2 0c20 	rsble	ip, r2, #32
 8000350:	fa01 f102 	lsl.w	r1, r1, r2
 8000354:	fa20 fc0c 	lsr.w	ip, r0, ip
 8000358:	bfdc      	itt	le
 800035a:	ea41 010c 	orrle.w	r1, r1, ip
 800035e:	4090      	lslle	r0, r2
 8000360:	1ae4      	subs	r4, r4, r3
 8000362:	bfa2      	ittt	ge
 8000364:	eb01 5104 	addge.w	r1, r1, r4, lsl #20
 8000368:	4329      	orrge	r1, r5
 800036a:	bd30      	popge	{r4, r5, pc}
 800036c:	ea6f 0404 	mvn.w	r4, r4
 8000370:	3c1f      	subs	r4, #31
 8000372:	da1c      	bge.n	80003ae <__adddf3+0x1d2>
 8000374:	340c      	adds	r4, #12
 8000376:	dc0e      	bgt.n	8000396 <__adddf3+0x1ba>
 8000378:	f104 0414 	add.w	r4, r4, #20
 800037c:	f1c4 0220 	rsb	r2, r4, #32
 8000380:	fa20 f004 	lsr.w	r0, r0, r4
 8000384:	fa01 f302 	lsl.w	r3, r1, r2
 8000388:	ea40 0003 	orr.w	r0, r0, r3
 800038c:	fa21 f304 	lsr.w	r3, r1, r4
 8000390:	ea45 0103 	orr.w	r1, r5, r3
 8000394:	bd30      	pop	{r4, r5, pc}
 8000396:	f1c4 040c 	rsb	r4, r4, #12
 800039a:	f1c4 0220 	rsb	r2, r4, #32
 800039e:	fa20 f002 	lsr.w	r0, r0, r2
 80003a2:	fa01 f304 	lsl.w	r3, r1, r4
 80003a6:	ea40 0003 	orr.w	r0, r0, r3
 80003aa:	4629      	mov	r1, r5
 80003ac:	bd30      	pop	{r4, r5, pc}
 80003ae:	fa21 f004 	lsr.w	r0, r1, r4
 80003b2:	4629      	mov	r1, r5
 80003b4:	bd30      	pop	{r4, r5, pc}
 80003b6:	f094 0f00 	teq	r4, #0
 80003ba:	f483 1380 	eor.w	r3, r3, #1048576	; 0x100000
 80003be:	bf06      	itte	eq
 80003c0:	f481 1180 	eoreq.w	r1, r1, #1048576	; 0x100000
 80003c4:	3401      	addeq	r4, #1
 80003c6:	3d01      	subne	r5, #1
 80003c8:	e74e      	b.n	8000268 <__adddf3+0x8c>
 80003ca:	ea7f 5c64 	mvns.w	ip, r4, asr #21
 80003ce:	bf18      	it	ne
 80003d0:	ea7f 5c65 	mvnsne.w	ip, r5, asr #21
 80003d4:	d029      	beq.n	800042a <__adddf3+0x24e>
 80003d6:	ea94 0f05 	teq	r4, r5
 80003da:	bf08      	it	eq
 80003dc:	ea90 0f02 	teqeq	r0, r2
 80003e0:	d005      	beq.n	80003ee <__adddf3+0x212>
 80003e2:	ea54 0c00 	orrs.w	ip, r4, r0
 80003e6:	bf04      	itt	eq
 80003e8:	4619      	moveq	r1, r3
 80003ea:	4610      	moveq	r0, r2
 80003ec:	bd30      	pop	{r4, r5, pc}
 80003ee:	ea91 0f03 	teq	r1, r3
 80003f2:	bf1e      	ittt	ne
 80003f4:	2100      	movne	r1, #0
 80003f6:	2000      	movne	r0, #0
 80003f8:	bd30      	popne	{r4, r5, pc}
 80003fa:	ea5f 5c54 	movs.w	ip, r4, lsr #21
 80003fe:	d105      	bne.n	800040c <__adddf3+0x230>
 8000400:	0040      	lsls	r0, r0, #1
 8000402:	4149      	adcs	r1, r1
 8000404:	bf28      	it	cs
 8000406:	f041 4100 	orrcs.w	r1, r1, #2147483648	; 0x80000000
 800040a:	bd30      	pop	{r4, r5, pc}
 800040c:	f514 0480 	adds.w	r4, r4, #4194304	; 0x400000
 8000410:	bf3c      	itt	cc
 8000412:	f501 1180 	addcc.w	r1, r1, #1048576	; 0x100000
 8000416:	bd30      	popcc	{r4, r5, pc}
 8000418:	f001 4500 	and.w	r5, r1, #2147483648	; 0x80000000
 800041c:	f045 41fe 	orr.w	r1, r5, #2130706432	; 0x7f000000
 8000420:	f441 0170 	orr.w	r1, r1, #15728640	; 0xf00000
 8000424:	f04f 0000 	mov.w	r0, #0
 8000428:	bd30      	pop	{r4, r5, pc}
 800042a:	ea7f 5c64 	mvns.w	ip, r4, asr #21
 800042e:	bf1a      	itte	ne
 8000430:	4619      	movne	r1, r3
 8000432:	4610      	movne	r0, r2
 8000434:	ea7f 5c65 	mvnseq.w	ip, r5, asr #21
 8000438:	bf1c      	itt	ne
 800043a:	460b      	movne	r3, r1
 800043c:	4602      	movne	r2, r0
 800043e:	ea50 3401 	orrs.w	r4, r0, r1, lsl #12
 8000442:	bf06      	itte	eq
 8000444:	ea52 3503 	orrseq.w	r5, r2, r3, lsl #12
 8000448:	ea91 0f03 	teqeq	r1, r3
 800044c:	f441 2100 	orrne.w	r1, r1, #524288	; 0x80000
 8000450:	bd30      	pop	{r4, r5, pc}
 8000452:	bf00      	nop

08000454 <__aeabi_ui2d>:
 8000454:	f090 0f00 	teq	r0, #0
 8000458:	bf04      	itt	eq
 800045a:	2100      	moveq	r1, #0
 800045c:	4770      	bxeq	lr
 800045e:	b530      	push	{r4, r5, lr}
 8000460:	f44f 6480 	mov.w	r4, #1024	; 0x400
 8000464:	f104 0432 	add.w	r4, r4, #50	; 0x32
 8000468:	f04f 0500 	mov.w	r5, #0
 800046c:	f04f 0100 	mov.w	r1, #0
 8000470:	e750      	b.n	8000314 <__adddf3+0x138>
 8000472:	bf00      	nop

08000474 <__aeabi_i2d>:
 8000474:	f090 0f00 	teq	r0, #0
 8000478:	bf04      	itt	eq
 800047a:	2100      	moveq	r1, #0
 800047c:	4770      	bxeq	lr
 800047e:	b530      	push	{r4, r5, lr}
 8000480:	f44f 6480 	mov.w	r4, #1024	; 0x400
 8000484:	f104 0432 	add.w	r4, r4, #50	; 0x32
 8000488:	f010 4500 	ands.w	r5, r0, #2147483648	; 0x80000000
 800048c:	bf48      	it	mi
 800048e:	4240      	negmi	r0, r0
 8000490:	f04f 0100 	mov.w	r1, #0
 8000494:	e73e      	b.n	8000314 <__adddf3+0x138>
 8000496:	bf00      	nop

08000498 <__aeabi_f2d>:
 8000498:	0042      	lsls	r2, r0, #1
 800049a:	ea4f 01e2 	mov.w	r1, r2, asr #3
 800049e:	ea4f 0131 	mov.w	r1, r1, rrx
 80004a2:	ea4f 7002 	mov.w	r0, r2, lsl #28
 80004a6:	bf1f      	itttt	ne
 80004a8:	f012 437f 	andsne.w	r3, r2, #4278190080	; 0xff000000
 80004ac:	f093 4f7f 	teqne	r3, #4278190080	; 0xff000000
 80004b0:	f081 5160 	eorne.w	r1, r1, #939524096	; 0x38000000
 80004b4:	4770      	bxne	lr
 80004b6:	f032 427f 	bics.w	r2, r2, #4278190080	; 0xff000000
 80004ba:	bf08      	it	eq
 80004bc:	4770      	bxeq	lr
 80004be:	f093 4f7f 	teq	r3, #4278190080	; 0xff000000
 80004c2:	bf04      	itt	eq
 80004c4:	f441 2100 	orreq.w	r1, r1, #524288	; 0x80000
 80004c8:	4770      	bxeq	lr
 80004ca:	b530      	push	{r4, r5, lr}
 80004cc:	f44f 7460 	mov.w	r4, #896	; 0x380
 80004d0:	f001 4500 	and.w	r5, r1, #2147483648	; 0x80000000
 80004d4:	f021 4100 	bic.w	r1, r1, #2147483648	; 0x80000000
 80004d8:	e71c      	b.n	8000314 <__adddf3+0x138>
 80004da:	bf00      	nop

080004dc <__aeabi_ul2d>:
 80004dc:	ea50 0201 	orrs.w	r2, r0, r1
 80004e0:	bf08      	it	eq
 80004e2:	4770      	bxeq	lr
 80004e4:	b530      	push	{r4, r5, lr}
 80004e6:	f04f 0500 	mov.w	r5, #0
 80004ea:	e00a      	b.n	8000502 <__aeabi_l2d+0x16>

080004ec <__aeabi_l2d>:
 80004ec:	ea50 0201 	orrs.w	r2, r0, r1
 80004f0:	bf08      	it	eq
 80004f2:	4770      	bxeq	lr
 80004f4:	b530      	push	{r4, r5, lr}
 80004f6:	f011 4500 	ands.w	r5, r1, #2147483648	; 0x80000000
 80004fa:	d502      	bpl.n	8000502 <__aeabi_l2d+0x16>
 80004fc:	4240      	negs	r0, r0
 80004fe:	eb61 0141 	sbc.w	r1, r1, r1, lsl #1
 8000502:	f44f 6480 	mov.w	r4, #1024	; 0x400
 8000506:	f104 0432 	add.w	r4, r4, #50	; 0x32
 800050a:	ea5f 5c91 	movs.w	ip, r1, lsr #22
 800050e:	f43f aed8 	beq.w	80002c2 <__adddf3+0xe6>
 8000512:	f04f 0203 	mov.w	r2, #3
 8000516:	ea5f 0cdc 	movs.w	ip, ip, lsr #3
 800051a:	bf18      	it	ne
 800051c:	3203      	addne	r2, #3
 800051e:	ea5f 0cdc 	movs.w	ip, ip, lsr #3
 8000522:	bf18      	it	ne
 8000524:	3203      	addne	r2, #3
 8000526:	eb02 02dc 	add.w	r2, r2, ip, lsr #3
 800052a:	f1c2 0320 	rsb	r3, r2, #32
 800052e:	fa00 fc03 	lsl.w	ip, r0, r3
 8000532:	fa20 f002 	lsr.w	r0, r0, r2
 8000536:	fa01 fe03 	lsl.w	lr, r1, r3
 800053a:	ea40 000e 	orr.w	r0, r0, lr
 800053e:	fa21 f102 	lsr.w	r1, r1, r2
 8000542:	4414      	add	r4, r2
 8000544:	e6bd      	b.n	80002c2 <__adddf3+0xe6>
 8000546:	bf00      	nop

08000548 <__aeabi_dmul>:
 8000548:	b570      	push	{r4, r5, r6, lr}
 800054a:	f04f 0cff 	mov.w	ip, #255	; 0xff
 800054e:	f44c 6ce0 	orr.w	ip, ip, #1792	; 0x700
 8000552:	ea1c 5411 	ands.w	r4, ip, r1, lsr #20
 8000556:	bf1d      	ittte	ne
 8000558:	ea1c 5513 	andsne.w	r5, ip, r3, lsr #20
 800055c:	ea94 0f0c 	teqne	r4, ip
 8000560:	ea95 0f0c 	teqne	r5, ip
 8000564:	f000 f8de 	bleq	8000724 <__aeabi_dmul+0x1dc>
 8000568:	442c      	add	r4, r5
 800056a:	ea81 0603 	eor.w	r6, r1, r3
 800056e:	ea21 514c 	bic.w	r1, r1, ip, lsl #21
 8000572:	ea23 534c 	bic.w	r3, r3, ip, lsl #21
 8000576:	ea50 3501 	orrs.w	r5, r0, r1, lsl #12
 800057a:	bf18      	it	ne
 800057c:	ea52 3503 	orrsne.w	r5, r2, r3, lsl #12
 8000580:	f441 1180 	orr.w	r1, r1, #1048576	; 0x100000
 8000584:	f443 1380 	orr.w	r3, r3, #1048576	; 0x100000
 8000588:	d038      	beq.n	80005fc <__aeabi_dmul+0xb4>
 800058a:	fba0 ce02 	umull	ip, lr, r0, r2
 800058e:	f04f 0500 	mov.w	r5, #0
 8000592:	fbe1 e502 	umlal	lr, r5, r1, r2
 8000596:	f006 4200 	and.w	r2, r6, #2147483648	; 0x80000000
 800059a:	fbe0 e503 	umlal	lr, r5, r0, r3
 800059e:	f04f 0600 	mov.w	r6, #0
 80005a2:	fbe1 5603 	umlal	r5, r6, r1, r3
 80005a6:	f09c 0f00 	teq	ip, #0
 80005aa:	bf18      	it	ne
 80005ac:	f04e 0e01 	orrne.w	lr, lr, #1
 80005b0:	f1a4 04ff 	sub.w	r4, r4, #255	; 0xff
 80005b4:	f5b6 7f00 	cmp.w	r6, #512	; 0x200
 80005b8:	f564 7440 	sbc.w	r4, r4, #768	; 0x300
 80005bc:	d204      	bcs.n	80005c8 <__aeabi_dmul+0x80>
 80005be:	ea5f 0e4e 	movs.w	lr, lr, lsl #1
 80005c2:	416d      	adcs	r5, r5
 80005c4:	eb46 0606 	adc.w	r6, r6, r6
 80005c8:	ea42 21c6 	orr.w	r1, r2, r6, lsl #11
 80005cc:	ea41 5155 	orr.w	r1, r1, r5, lsr #21
 80005d0:	ea4f 20c5 	mov.w	r0, r5, lsl #11
 80005d4:	ea40 505e 	orr.w	r0, r0, lr, lsr #21
 80005d8:	ea4f 2ece 	mov.w	lr, lr, lsl #11
 80005dc:	f1b4 0cfd 	subs.w	ip, r4, #253	; 0xfd
 80005e0:	bf88      	it	hi
 80005e2:	f5bc 6fe0 	cmphi.w	ip, #1792	; 0x700
 80005e6:	d81e      	bhi.n	8000626 <__aeabi_dmul+0xde>
 80005e8:	f1be 4f00 	cmp.w	lr, #2147483648	; 0x80000000
 80005ec:	bf08      	it	eq
 80005ee:	ea5f 0e50 	movseq.w	lr, r0, lsr #1
 80005f2:	f150 0000 	adcs.w	r0, r0, #0
 80005f6:	eb41 5104 	adc.w	r1, r1, r4, lsl #20
 80005fa:	bd70      	pop	{r4, r5, r6, pc}
 80005fc:	f006 4600 	and.w	r6, r6, #2147483648	; 0x80000000
 8000600:	ea46 0101 	orr.w	r1, r6, r1
 8000604:	ea40 0002 	orr.w	r0, r0, r2
 8000608:	ea81 0103 	eor.w	r1, r1, r3
 800060c:	ebb4 045c 	subs.w	r4, r4, ip, lsr #1
 8000610:	bfc2      	ittt	gt
 8000612:	ebd4 050c 	rsbsgt	r5, r4, ip
 8000616:	ea41 5104 	orrgt.w	r1, r1, r4, lsl #20
 800061a:	bd70      	popgt	{r4, r5, r6, pc}
 800061c:	f441 1180 	orr.w	r1, r1, #1048576	; 0x100000
 8000620:	f04f 0e00 	mov.w	lr, #0
 8000624:	3c01      	subs	r4, #1
 8000626:	f300 80ab 	bgt.w	8000780 <__aeabi_dmul+0x238>
 800062a:	f114 0f36 	cmn.w	r4, #54	; 0x36
 800062e:	bfde      	ittt	le
 8000630:	2000      	movle	r0, #0
 8000632:	f001 4100 	andle.w	r1, r1, #2147483648	; 0x80000000
 8000636:	bd70      	pople	{r4, r5, r6, pc}
 8000638:	f1c4 0400 	rsb	r4, r4, #0
 800063c:	3c20      	subs	r4, #32
 800063e:	da35      	bge.n	80006ac <__aeabi_dmul+0x164>
 8000640:	340c      	adds	r4, #12
 8000642:	dc1b      	bgt.n	800067c <__aeabi_dmul+0x134>
 8000644:	f104 0414 	add.w	r4, r4, #20
 8000648:	f1c4 0520 	rsb	r5, r4, #32
 800064c:	fa00 f305 	lsl.w	r3, r0, r5
 8000650:	fa20 f004 	lsr.w	r0, r0, r4
 8000654:	fa01 f205 	lsl.w	r2, r1, r5
 8000658:	ea40 0002 	orr.w	r0, r0, r2
 800065c:	f001 4200 	and.w	r2, r1, #2147483648	; 0x80000000
 8000660:	f021 4100 	bic.w	r1, r1, #2147483648	; 0x80000000
 8000664:	eb10 70d3 	adds.w	r0, r0, r3, lsr #31
 8000668:	fa21 f604 	lsr.w	r6, r1, r4
 800066c:	eb42 0106 	adc.w	r1, r2, r6
 8000670:	ea5e 0e43 	orrs.w	lr, lr, r3, lsl #1
 8000674:	bf08      	it	eq
 8000676:	ea20 70d3 	biceq.w	r0, r0, r3, lsr #31
 800067a:	bd70      	pop	{r4, r5, r6, pc}
 800067c:	f1c4 040c 	rsb	r4, r4, #12
 8000680:	f1c4 0520 	rsb	r5, r4, #32
 8000684:	fa00 f304 	lsl.w	r3, r0, r4
 8000688:	fa20 f005 	lsr.w	r0, r0, r5
 800068c:	fa01 f204 	lsl.w	r2, r1, r4
 8000690:	ea40 0002 	orr.w	r0, r0, r2
 8000694:	f001 4100 	and.w	r1, r1, #2147483648	; 0x80000000
 8000698:	eb10 70d3 	adds.w	r0, r0, r3, lsr #31
 800069c:	f141 0100 	adc.w	r1, r1, #0
 80006a0:	ea5e 0e43 	orrs.w	lr, lr, r3, lsl #1
 80006a4:	bf08      	it	eq
 80006a6:	ea20 70d3 	biceq.w	r0, r0, r3, lsr #31
 80006aa:	bd70      	pop	{r4, r5, r6, pc}
 80006ac:	f1c4 0520 	rsb	r5, r4, #32
 80006b0:	fa00 f205 	lsl.w	r2, r0, r5
 80006b4:	ea4e 0e02 	orr.w	lr, lr, r2
 80006b8:	fa20 f304 	lsr.w	r3, r0, r4
 80006bc:	fa01 f205 	lsl.w	r2, r1, r5
 80006c0:	ea43 0302 	orr.w	r3, r3, r2
 80006c4:	fa21 f004 	lsr.w	r0, r1, r4
 80006c8:	f001 4100 	and.w	r1, r1, #2147483648	; 0x80000000
 80006cc:	fa21 f204 	lsr.w	r2, r1, r4
 80006d0:	ea20 0002 	bic.w	r0, r0, r2
 80006d4:	eb00 70d3 	add.w	r0, r0, r3, lsr #31
 80006d8:	ea5e 0e43 	orrs.w	lr, lr, r3, lsl #1
 80006dc:	bf08      	it	eq
 80006de:	ea20 70d3 	biceq.w	r0, r0, r3, lsr #31
 80006e2:	bd70      	pop	{r4, r5, r6, pc}
 80006e4:	f094 0f00 	teq	r4, #0
 80006e8:	d10f      	bne.n	800070a <__aeabi_dmul+0x1c2>
 80006ea:	f001 4600 	and.w	r6, r1, #2147483648	; 0x80000000
 80006ee:	0040      	lsls	r0, r0, #1
 80006f0:	eb41 0101 	adc.w	r1, r1, r1
 80006f4:	f411 1f80 	tst.w	r1, #1048576	; 0x100000
 80006f8:	bf08      	it	eq
 80006fa:	3c01      	subeq	r4, #1
 80006fc:	d0f7      	beq.n	80006ee <__aeabi_dmul+0x1a6>
 80006fe:	ea41 0106 	orr.w	r1, r1, r6
 8000702:	f095 0f00 	teq	r5, #0
 8000706:	bf18      	it	ne
 8000708:	4770      	bxne	lr
 800070a:	f003 4600 	and.w	r6, r3, #2147483648	; 0x80000000
 800070e:	0052      	lsls	r2, r2, #1
 8000710:	eb43 0303 	adc.w	r3, r3, r3
 8000714:	f413 1f80 	tst.w	r3, #1048576	; 0x100000
 8000718:	bf08      	it	eq
 800071a:	3d01      	subeq	r5, #1
 800071c:	d0f7      	beq.n	800070e <__aeabi_dmul+0x1c6>
 800071e:	ea43 0306 	orr.w	r3, r3, r6
 8000722:	4770      	bx	lr
 8000724:	ea94 0f0c 	teq	r4, ip
 8000728:	ea0c 5513 	and.w	r5, ip, r3, lsr #20
 800072c:	bf18      	it	ne
 800072e:	ea95 0f0c 	teqne	r5, ip
 8000732:	d00c      	beq.n	800074e <__aeabi_dmul+0x206>
 8000734:	ea50 0641 	orrs.w	r6, r0, r1, lsl #1
 8000738:	bf18      	it	ne
 800073a:	ea52 0643 	orrsne.w	r6, r2, r3, lsl #1
 800073e:	d1d1      	bne.n	80006e4 <__aeabi_dmul+0x19c>
 8000740:	ea81 0103 	eor.w	r1, r1, r3
 8000744:	f001 4100 	and.w	r1, r1, #2147483648	; 0x80000000
 8000748:	f04f 0000 	mov.w	r0, #0
 800074c:	bd70      	pop	{r4, r5, r6, pc}
 800074e:	ea50 0641 	orrs.w	r6, r0, r1, lsl #1
 8000752:	bf06      	itte	eq
 8000754:	4610      	moveq	r0, r2
 8000756:	4619      	moveq	r1, r3
 8000758:	ea52 0643 	orrsne.w	r6, r2, r3, lsl #1
 800075c:	d019      	beq.n	8000792 <__aeabi_dmul+0x24a>
 800075e:	ea94 0f0c 	teq	r4, ip
 8000762:	d102      	bne.n	800076a <__aeabi_dmul+0x222>
 8000764:	ea50 3601 	orrs.w	r6, r0, r1, lsl #12
 8000768:	d113      	bne.n	8000792 <__aeabi_dmul+0x24a>
 800076a:	ea95 0f0c 	teq	r5, ip
 800076e:	d105      	bne.n	800077c <__aeabi_dmul+0x234>
 8000770:	ea52 3603 	orrs.w	r6, r2, r3, lsl #12
 8000774:	bf1c      	itt	ne
 8000776:	4610      	movne	r0, r2
 8000778:	4619      	movne	r1, r3
 800077a:	d10a      	bne.n	8000792 <__aeabi_dmul+0x24a>
 800077c:	ea81 0103 	eor.w	r1, r1, r3
 8000780:	f001 4100 	and.w	r1, r1, #2147483648	; 0x80000000
 8000784:	f041 41fe 	orr.w	r1, r1, #2130706432	; 0x7f000000
 8000788:	f441 0170 	orr.w	r1, r1, #15728640	; 0xf00000
 800078c:	f04f 0000 	mov.w	r0, #0
 8000790:	bd70      	pop	{r4, r5, r6, pc}
 8000792:	f041 41fe 	orr.w	r1, r1, #2130706432	; 0x7f000000
 8000796:	f441 0178 	orr.w	r1, r1, #16252928	; 0xf80000
 800079a:	bd70      	pop	{r4, r5, r6, pc}

0800079c <__aeabi_ddiv>:
 800079c:	b570      	push	{r4, r5, r6, lr}
 800079e:	f04f 0cff 	mov.w	ip, #255	; 0xff
 80007a2:	f44c 6ce0 	orr.w	ip, ip, #1792	; 0x700
 80007a6:	ea1c 5411 	ands.w	r4, ip, r1, lsr #20
 80007aa:	bf1d      	ittte	ne
 80007ac:	ea1c 5513 	andsne.w	r5, ip, r3, lsr #20
 80007b0:	ea94 0f0c 	teqne	r4, ip
 80007b4:	ea95 0f0c 	teqne	r5, ip
 80007b8:	f000 f8a7 	bleq	800090a <__aeabi_ddiv+0x16e>
 80007bc:	eba4 0405 	sub.w	r4, r4, r5
 80007c0:	ea81 0e03 	eor.w	lr, r1, r3
 80007c4:	ea52 3503 	orrs.w	r5, r2, r3, lsl #12
 80007c8:	ea4f 3101 	mov.w	r1, r1, lsl #12
 80007cc:	f000 8088 	beq.w	80008e0 <__aeabi_ddiv+0x144>
 80007d0:	ea4f 3303 	mov.w	r3, r3, lsl #12
 80007d4:	f04f 5580 	mov.w	r5, #268435456	; 0x10000000
 80007d8:	ea45 1313 	orr.w	r3, r5, r3, lsr #4
 80007dc:	ea43 6312 	orr.w	r3, r3, r2, lsr #24
 80007e0:	ea4f 2202 	mov.w	r2, r2, lsl #8
 80007e4:	ea45 1511 	orr.w	r5, r5, r1, lsr #4
 80007e8:	ea45 6510 	orr.w	r5, r5, r0, lsr #24
 80007ec:	ea4f 2600 	mov.w	r6, r0, lsl #8
 80007f0:	f00e 4100 	and.w	r1, lr, #2147483648	; 0x80000000
 80007f4:	429d      	cmp	r5, r3
 80007f6:	bf08      	it	eq
 80007f8:	4296      	cmpeq	r6, r2
 80007fa:	f144 04fd 	adc.w	r4, r4, #253	; 0xfd
 80007fe:	f504 7440 	add.w	r4, r4, #768	; 0x300
 8000802:	d202      	bcs.n	800080a <__aeabi_ddiv+0x6e>
 8000804:	085b      	lsrs	r3, r3, #1
 8000806:	ea4f 0232 	mov.w	r2, r2, rrx
 800080a:	1ab6      	subs	r6, r6, r2
 800080c:	eb65 0503 	sbc.w	r5, r5, r3
 8000810:	085b      	lsrs	r3, r3, #1
 8000812:	ea4f 0232 	mov.w	r2, r2, rrx
 8000816:	f44f 1080 	mov.w	r0, #1048576	; 0x100000
 800081a:	f44f 2c00 	mov.w	ip, #524288	; 0x80000
 800081e:	ebb6 0e02 	subs.w	lr, r6, r2
 8000822:	eb75 0e03 	sbcs.w	lr, r5, r3
 8000826:	bf22      	ittt	cs
 8000828:	1ab6      	subcs	r6, r6, r2
 800082a:	4675      	movcs	r5, lr
 800082c:	ea40 000c 	orrcs.w	r0, r0, ip
 8000830:	085b      	lsrs	r3, r3, #1
 8000832:	ea4f 0232 	mov.w	r2, r2, rrx
 8000836:	ebb6 0e02 	subs.w	lr, r6, r2
 800083a:	eb75 0e03 	sbcs.w	lr, r5, r3
 800083e:	bf22      	ittt	cs
 8000840:	1ab6      	subcs	r6, r6, r2
 8000842:	4675      	movcs	r5, lr
 8000844:	ea40 005c 	orrcs.w	r0, r0, ip, lsr #1
 8000848:	085b      	lsrs	r3, r3, #1
 800084a:	ea4f 0232 	mov.w	r2, r2, rrx
 800084e:	ebb6 0e02 	subs.w	lr, r6, r2
 8000852:	eb75 0e03 	sbcs.w	lr, r5, r3
 8000856:	bf22      	ittt	cs
 8000858:	1ab6      	subcs	r6, r6, r2
 800085a:	4675      	movcs	r5, lr
 800085c:	ea40 009c 	orrcs.w	r0, r0, ip, lsr #2
 8000860:	085b      	lsrs	r3, r3, #1
 8000862:	ea4f 0232 	mov.w	r2, r2, rrx
 8000866:	ebb6 0e02 	subs.w	lr, r6, r2
 800086a:	eb75 0e03 	sbcs.w	lr, r5, r3
 800086e:	bf22      	ittt	cs
 8000870:	1ab6      	subcs	r6, r6, r2
 8000872:	4675      	movcs	r5, lr
 8000874:	ea40 00dc 	orrcs.w	r0, r0, ip, lsr #3
 8000878:	ea55 0e06 	orrs.w	lr, r5, r6
 800087c:	d018      	beq.n	80008b0 <__aeabi_ddiv+0x114>
 800087e:	ea4f 1505 	mov.w	r5, r5, lsl #4
 8000882:	ea45 7516 	orr.w	r5, r5, r6, lsr #28
 8000886:	ea4f 1606 	mov.w	r6, r6, lsl #4
 800088a:	ea4f 03c3 	mov.w	r3, r3, lsl #3
 800088e:	ea43 7352 	orr.w	r3, r3, r2, lsr #29
 8000892:	ea4f 02c2 	mov.w	r2, r2, lsl #3
 8000896:	ea5f 1c1c 	movs.w	ip, ip, lsr #4
 800089a:	d1c0      	bne.n	800081e <__aeabi_ddiv+0x82>
 800089c:	f411 1f80 	tst.w	r1, #1048576	; 0x100000
 80008a0:	d10b      	bne.n	80008ba <__aeabi_ddiv+0x11e>
 80008a2:	ea41 0100 	orr.w	r1, r1, r0
 80008a6:	f04f 0000 	mov.w	r0, #0
 80008aa:	f04f 4c00 	mov.w	ip, #2147483648	; 0x80000000
 80008ae:	e7b6      	b.n	800081e <__aeabi_ddiv+0x82>
 80008b0:	f411 1f80 	tst.w	r1, #1048576	; 0x100000
 80008b4:	bf04      	itt	eq
 80008b6:	4301      	orreq	r1, r0
 80008b8:	2000      	moveq	r0, #0
 80008ba:	f1b4 0cfd 	subs.w	ip, r4, #253	; 0xfd
 80008be:	bf88      	it	hi
 80008c0:	f5bc 6fe0 	cmphi.w	ip, #1792	; 0x700
 80008c4:	f63f aeaf 	bhi.w	8000626 <__aeabi_dmul+0xde>
 80008c8:	ebb5 0c03 	subs.w	ip, r5, r3
 80008cc:	bf04      	itt	eq
 80008ce:	ebb6 0c02 	subseq.w	ip, r6, r2
 80008d2:	ea5f 0c50 	movseq.w	ip, r0, lsr #1
 80008d6:	f150 0000 	adcs.w	r0, r0, #0
 80008da:	eb41 5104 	adc.w	r1, r1, r4, lsl #20
 80008de:	bd70      	pop	{r4, r5, r6, pc}
 80008e0:	f00e 4e00 	and.w	lr, lr, #2147483648	; 0x80000000
 80008e4:	ea4e 3111 	orr.w	r1, lr, r1, lsr #12
 80008e8:	eb14 045c 	adds.w	r4, r4, ip, lsr #1
 80008ec:	bfc2      	ittt	gt
 80008ee:	ebd4 050c 	rsbsgt	r5, r4, ip
 80008f2:	ea41 5104 	orrgt.w	r1, r1, r4, lsl #20
 80008f6:	bd70      	popgt	{r4, r5, r6, pc}
 80008f8:	f441 1180 	orr.w	r1, r1, #1048576	; 0x100000
 80008fc:	f04f 0e00 	mov.w	lr, #0
 8000900:	3c01      	subs	r4, #1
 8000902:	e690      	b.n	8000626 <__aeabi_dmul+0xde>
 8000904:	ea45 0e06 	orr.w	lr, r5, r6
 8000908:	e68d      	b.n	8000626 <__aeabi_dmul+0xde>
 800090a:	ea0c 5513 	and.w	r5, ip, r3, lsr #20
 800090e:	ea94 0f0c 	teq	r4, ip
 8000912:	bf08      	it	eq
 8000914:	ea95 0f0c 	teqeq	r5, ip
 8000918:	f43f af3b 	beq.w	8000792 <__aeabi_dmul+0x24a>
 800091c:	ea94 0f0c 	teq	r4, ip
 8000920:	d10a      	bne.n	8000938 <__aeabi_ddiv+0x19c>
 8000922:	ea50 3401 	orrs.w	r4, r0, r1, lsl #12
 8000926:	f47f af34 	bne.w	8000792 <__aeabi_dmul+0x24a>
 800092a:	ea95 0f0c 	teq	r5, ip
 800092e:	f47f af25 	bne.w	800077c <__aeabi_dmul+0x234>
 8000932:	4610      	mov	r0, r2
 8000934:	4619      	mov	r1, r3
 8000936:	e72c      	b.n	8000792 <__aeabi_dmul+0x24a>
 8000938:	ea95 0f0c 	teq	r5, ip
 800093c:	d106      	bne.n	800094c <__aeabi_ddiv+0x1b0>
 800093e:	ea52 3503 	orrs.w	r5, r2, r3, lsl #12
 8000942:	f43f aefd 	beq.w	8000740 <__aeabi_dmul+0x1f8>
 8000946:	4610      	mov	r0, r2
 8000948:	4619      	mov	r1, r3
 800094a:	e722      	b.n	8000792 <__aeabi_dmul+0x24a>
 800094c:	ea50 0641 	orrs.w	r6, r0, r1, lsl #1
 8000950:	bf18      	it	ne
 8000952:	ea52 0643 	orrsne.w	r6, r2, r3, lsl #1
 8000956:	f47f aec5 	bne.w	80006e4 <__aeabi_dmul+0x19c>
 800095a:	ea50 0441 	orrs.w	r4, r0, r1, lsl #1
 800095e:	f47f af0d 	bne.w	800077c <__aeabi_dmul+0x234>
 8000962:	ea52 0543 	orrs.w	r5, r2, r3, lsl #1
 8000966:	f47f aeeb 	bne.w	8000740 <__aeabi_dmul+0x1f8>
 800096a:	e712      	b.n	8000792 <__aeabi_dmul+0x24a>

0800096c <__aeabi_d2f>:
 800096c:	ea4f 0241 	mov.w	r2, r1, lsl #1
 8000970:	f1b2 43e0 	subs.w	r3, r2, #1879048192	; 0x70000000
 8000974:	bf24      	itt	cs
 8000976:	f5b3 1c00 	subscs.w	ip, r3, #2097152	; 0x200000
 800097a:	f1dc 5cfe 	rsbscs	ip, ip, #532676608	; 0x1fc00000
 800097e:	d90d      	bls.n	800099c <__aeabi_d2f+0x30>
 8000980:	f001 4c00 	and.w	ip, r1, #2147483648	; 0x80000000
 8000984:	ea4f 02c0 	mov.w	r2, r0, lsl #3
 8000988:	ea4c 7050 	orr.w	r0, ip, r0, lsr #29
 800098c:	f1b2 4f00 	cmp.w	r2, #2147483648	; 0x80000000
 8000990:	eb40 0083 	adc.w	r0, r0, r3, lsl #2
 8000994:	bf08      	it	eq
 8000996:	f020 0001 	biceq.w	r0, r0, #1
 800099a:	4770      	bx	lr
 800099c:	f011 4f80 	tst.w	r1, #1073741824	; 0x40000000
 80009a0:	d121      	bne.n	80009e6 <__aeabi_d2f+0x7a>
 80009a2:	f113 7238 	adds.w	r2, r3, #48234496	; 0x2e00000
 80009a6:	bfbc      	itt	lt
 80009a8:	f001 4000 	andlt.w	r0, r1, #2147483648	; 0x80000000
 80009ac:	4770      	bxlt	lr
 80009ae:	f441 1180 	orr.w	r1, r1, #1048576	; 0x100000
 80009b2:	ea4f 5252 	mov.w	r2, r2, lsr #21
 80009b6:	f1c2 0218 	rsb	r2, r2, #24
 80009ba:	f1c2 0c20 	rsb	ip, r2, #32
 80009be:	fa10 f30c 	lsls.w	r3, r0, ip
 80009c2:	fa20 f002 	lsr.w	r0, r0, r2
 80009c6:	bf18      	it	ne
 80009c8:	f040 0001 	orrne.w	r0, r0, #1
 80009cc:	ea4f 23c1 	mov.w	r3, r1, lsl #11
 80009d0:	ea4f 23d3 	mov.w	r3, r3, lsr #11
 80009d4:	fa03 fc0c 	lsl.w	ip, r3, ip
 80009d8:	ea40 000c 	orr.w	r0, r0, ip
 80009dc:	fa23 f302 	lsr.w	r3, r3, r2
 80009e0:	ea4f 0343 	mov.w	r3, r3, lsl #1
 80009e4:	e7cc      	b.n	8000980 <__aeabi_d2f+0x14>
 80009e6:	ea7f 5362 	mvns.w	r3, r2, asr #21
 80009ea:	d107      	bne.n	80009fc <__aeabi_d2f+0x90>
 80009ec:	ea50 3301 	orrs.w	r3, r0, r1, lsl #12
 80009f0:	bf1e      	ittt	ne
 80009f2:	f04f 40fe 	movne.w	r0, #2130706432	; 0x7f000000
 80009f6:	f440 0040 	orrne.w	r0, r0, #12582912	; 0xc00000
 80009fa:	4770      	bxne	lr
 80009fc:	f001 4000 	and.w	r0, r1, #2147483648	; 0x80000000
 8000a00:	f040 40fe 	orr.w	r0, r0, #2130706432	; 0x7f000000
 8000a04:	f440 0000 	orr.w	r0, r0, #8388608	; 0x800000
 8000a08:	4770      	bx	lr
 8000a0a:	bf00      	nop

08000a0c <strlen>:
 8000a0c:	4603      	mov	r3, r0
 8000a0e:	f813 2b01 	ldrb.w	r2, [r3], #1
 8000a12:	2a00      	cmp	r2, #0
 8000a14:	d1fb      	bne.n	8000a0e <strlen+0x2>
 8000a16:	1a18      	subs	r0, r3, r0
 8000a18:	3801      	subs	r0, #1
 8000a1a:	4770      	bx	lr

08000a1c <__gedf2>:
 8000a1c:	f04f 3cff 	mov.w	ip, #4294967295	; 0xffffffff
 8000a20:	e006      	b.n	8000a30 <__cmpdf2+0x4>
 8000a22:	bf00      	nop

08000a24 <__ledf2>:
 8000a24:	f04f 0c01 	mov.w	ip, #1
 8000a28:	e002      	b.n	8000a30 <__cmpdf2+0x4>
 8000a2a:	bf00      	nop

08000a2c <__cmpdf2>:
 8000a2c:	f04f 0c01 	mov.w	ip, #1
 8000a30:	f84d cd04 	str.w	ip, [sp, #-4]!
 8000a34:	ea4f 0c41 	mov.w	ip, r1, lsl #1
 8000a38:	ea7f 5c6c 	mvns.w	ip, ip, asr #21
 8000a3c:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 8000a40:	bf18      	it	ne
 8000a42:	ea7f 5c6c 	mvnsne.w	ip, ip, asr #21
 8000a46:	d01b      	beq.n	8000a80 <__cmpdf2+0x54>
 8000a48:	b001      	add	sp, #4
 8000a4a:	ea50 0c41 	orrs.w	ip, r0, r1, lsl #1
 8000a4e:	bf0c      	ite	eq
 8000a50:	ea52 0c43 	orrseq.w	ip, r2, r3, lsl #1
 8000a54:	ea91 0f03 	teqne	r1, r3
 8000a58:	bf02      	ittt	eq
 8000a5a:	ea90 0f02 	teqeq	r0, r2
 8000a5e:	2000      	moveq	r0, #0
 8000a60:	4770      	bxeq	lr
 8000a62:	f110 0f00 	cmn.w	r0, #0
 8000a66:	ea91 0f03 	teq	r1, r3
 8000a6a:	bf58      	it	pl
 8000a6c:	4299      	cmppl	r1, r3
 8000a6e:	bf08      	it	eq
 8000a70:	4290      	cmpeq	r0, r2
 8000a72:	bf2c      	ite	cs
 8000a74:	17d8      	asrcs	r0, r3, #31
 8000a76:	ea6f 70e3 	mvncc.w	r0, r3, asr #31
 8000a7a:	f040 0001 	orr.w	r0, r0, #1
 8000a7e:	4770      	bx	lr
 8000a80:	ea4f 0c41 	mov.w	ip, r1, lsl #1
 8000a84:	ea7f 5c6c 	mvns.w	ip, ip, asr #21
 8000a88:	d102      	bne.n	8000a90 <__cmpdf2+0x64>
 8000a8a:	ea50 3c01 	orrs.w	ip, r0, r1, lsl #12
 8000a8e:	d107      	bne.n	8000aa0 <__cmpdf2+0x74>
 8000a90:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 8000a94:	ea7f 5c6c 	mvns.w	ip, ip, asr #21
 8000a98:	d1d6      	bne.n	8000a48 <__cmpdf2+0x1c>
 8000a9a:	ea52 3c03 	orrs.w	ip, r2, r3, lsl #12
 8000a9e:	d0d3      	beq.n	8000a48 <__cmpdf2+0x1c>
 8000aa0:	f85d 0b04 	ldr.w	r0, [sp], #4
 8000aa4:	4770      	bx	lr
 8000aa6:	bf00      	nop

08000aa8 <__aeabi_cdrcmple>:
 8000aa8:	4684      	mov	ip, r0
 8000aaa:	4610      	mov	r0, r2
 8000aac:	4662      	mov	r2, ip
 8000aae:	468c      	mov	ip, r1
 8000ab0:	4619      	mov	r1, r3
 8000ab2:	4663      	mov	r3, ip
 8000ab4:	e000      	b.n	8000ab8 <__aeabi_cdcmpeq>
 8000ab6:	bf00      	nop

08000ab8 <__aeabi_cdcmpeq>:
 8000ab8:	b501      	push	{r0, lr}
 8000aba:	f7ff ffb7 	bl	8000a2c <__cmpdf2>
 8000abe:	2800      	cmp	r0, #0
 8000ac0:	bf48      	it	mi
 8000ac2:	f110 0f00 	cmnmi.w	r0, #0
 8000ac6:	bd01      	pop	{r0, pc}

08000ac8 <__aeabi_dcmpeq>:
 8000ac8:	f84d ed08 	str.w	lr, [sp, #-8]!
 8000acc:	f7ff fff4 	bl	8000ab8 <__aeabi_cdcmpeq>
 8000ad0:	bf0c      	ite	eq
 8000ad2:	2001      	moveq	r0, #1
 8000ad4:	2000      	movne	r0, #0
 8000ad6:	f85d fb08 	ldr.w	pc, [sp], #8
 8000ada:	bf00      	nop

08000adc <__aeabi_dcmplt>:
 8000adc:	f84d ed08 	str.w	lr, [sp, #-8]!
 8000ae0:	f7ff ffea 	bl	8000ab8 <__aeabi_cdcmpeq>
 8000ae4:	bf34      	ite	cc
 8000ae6:	2001      	movcc	r0, #1
 8000ae8:	2000      	movcs	r0, #0
 8000aea:	f85d fb08 	ldr.w	pc, [sp], #8
 8000aee:	bf00      	nop

08000af0 <__aeabi_dcmple>:
 8000af0:	f84d ed08 	str.w	lr, [sp, #-8]!
 8000af4:	f7ff ffe0 	bl	8000ab8 <__aeabi_cdcmpeq>
 8000af8:	bf94      	ite	ls
 8000afa:	2001      	movls	r0, #1
 8000afc:	2000      	movhi	r0, #0
 8000afe:	f85d fb08 	ldr.w	pc, [sp], #8
 8000b02:	bf00      	nop

08000b04 <__aeabi_dcmpge>:
 8000b04:	f84d ed08 	str.w	lr, [sp, #-8]!
 8000b08:	f7ff ffce 	bl	8000aa8 <__aeabi_cdrcmple>
 8000b0c:	bf94      	ite	ls
 8000b0e:	2001      	movls	r0, #1
 8000b10:	2000      	movhi	r0, #0
 8000b12:	f85d fb08 	ldr.w	pc, [sp], #8
 8000b16:	bf00      	nop

08000b18 <__aeabi_dcmpgt>:
 8000b18:	f84d ed08 	str.w	lr, [sp, #-8]!
 8000b1c:	f7ff ffc4 	bl	8000aa8 <__aeabi_cdrcmple>
 8000b20:	bf34      	ite	cc
 8000b22:	2001      	movcc	r0, #1
 8000b24:	2000      	movcs	r0, #0
 8000b26:	f85d fb08 	ldr.w	pc, [sp], #8
 8000b2a:	bf00      	nop

08000b2c <__aeabi_dcmpun>:
 8000b2c:	ea4f 0c41 	mov.w	ip, r1, lsl #1
 8000b30:	ea7f 5c6c 	mvns.w	ip, ip, asr #21
 8000b34:	d102      	bne.n	8000b3c <__aeabi_dcmpun+0x10>
 8000b36:	ea50 3c01 	orrs.w	ip, r0, r1, lsl #12
 8000b3a:	d10a      	bne.n	8000b52 <__aeabi_dcmpun+0x26>
 8000b3c:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 8000b40:	ea7f 5c6c 	mvns.w	ip, ip, asr #21
 8000b44:	d102      	bne.n	8000b4c <__aeabi_dcmpun+0x20>
 8000b46:	ea52 3c03 	orrs.w	ip, r2, r3, lsl #12
 8000b4a:	d102      	bne.n	8000b52 <__aeabi_dcmpun+0x26>
 8000b4c:	f04f 0000 	mov.w	r0, #0
 8000b50:	4770      	bx	lr
 8000b52:	f04f 0001 	mov.w	r0, #1
 8000b56:	4770      	bx	lr

08000b58 <__aeabi_d2iz>:
 8000b58:	ea4f 0241 	mov.w	r2, r1, lsl #1
 8000b5c:	f512 1200 	adds.w	r2, r2, #2097152	; 0x200000
 8000b60:	d215      	bcs.n	8000b8e <__aeabi_d2iz+0x36>
 8000b62:	d511      	bpl.n	8000b88 <__aeabi_d2iz+0x30>
 8000b64:	f46f 7378 	mvn.w	r3, #992	; 0x3e0
 8000b68:	ebb3 5262 	subs.w	r2, r3, r2, asr #21
 8000b6c:	d912      	bls.n	8000b94 <__aeabi_d2iz+0x3c>
 8000b6e:	ea4f 23c1 	mov.w	r3, r1, lsl #11
 8000b72:	f043 4300 	orr.w	r3, r3, #2147483648	; 0x80000000
 8000b76:	ea43 5350 	orr.w	r3, r3, r0, lsr #21
 8000b7a:	f011 4f00 	tst.w	r1, #2147483648	; 0x80000000
 8000b7e:	fa23 f002 	lsr.w	r0, r3, r2
 8000b82:	bf18      	it	ne
 8000b84:	4240      	negne	r0, r0
 8000b86:	4770      	bx	lr
 8000b88:	f04f 0000 	mov.w	r0, #0
 8000b8c:	4770      	bx	lr
 8000b8e:	ea50 3001 	orrs.w	r0, r0, r1, lsl #12
 8000b92:	d105      	bne.n	8000ba0 <__aeabi_d2iz+0x48>
 8000b94:	f011 4000 	ands.w	r0, r1, #2147483648	; 0x80000000
 8000b98:	bf08      	it	eq
 8000b9a:	f06f 4000 	mvneq.w	r0, #2147483648	; 0x80000000
 8000b9e:	4770      	bx	lr
 8000ba0:	f04f 0000 	mov.w	r0, #0
 8000ba4:	4770      	bx	lr
 8000ba6:	bf00      	nop

08000ba8 <Reset_Handler>:
 8000ba8:	f8df d034 	ldr.w	sp, [pc, #52]	; 8000be0 <LoopFillZerobss+0x14>
 8000bac:	2100      	movs	r1, #0
 8000bae:	e003      	b.n	8000bb8 <LoopCopyDataInit>

08000bb0 <CopyDataInit>:
 8000bb0:	4b0c      	ldr	r3, [pc, #48]	; (8000be4 <LoopFillZerobss+0x18>)
 8000bb2:	585b      	ldr	r3, [r3, r1]
 8000bb4:	5043      	str	r3, [r0, r1]
 8000bb6:	3104      	adds	r1, #4

08000bb8 <LoopCopyDataInit>:
 8000bb8:	480b      	ldr	r0, [pc, #44]	; (8000be8 <LoopFillZerobss+0x1c>)
 8000bba:	4b0c      	ldr	r3, [pc, #48]	; (8000bec <LoopFillZerobss+0x20>)
 8000bbc:	1842      	adds	r2, r0, r1
 8000bbe:	429a      	cmp	r2, r3
 8000bc0:	d3f6      	bcc.n	8000bb0 <CopyDataInit>
 8000bc2:	4a0b      	ldr	r2, [pc, #44]	; (8000bf0 <LoopFillZerobss+0x24>)
 8000bc4:	e002      	b.n	8000bcc <LoopFillZerobss>

08000bc6 <FillZerobss>:
 8000bc6:	2300      	movs	r3, #0
 8000bc8:	f842 3b04 	str.w	r3, [r2], #4

08000bcc <LoopFillZerobss>:
 8000bcc:	4b09      	ldr	r3, [pc, #36]	; (8000bf4 <LoopFillZerobss+0x28>)
 8000bce:	429a      	cmp	r2, r3
 8000bd0:	d3f9      	bcc.n	8000bc6 <FillZerobss>
 8000bd2:	f007 fac7 	bl	8008164 <SystemInit>
 8000bd6:	f007 ff49 	bl	8008a6c <__libc_init_array>
 8000bda:	f000 f9f5 	bl	8000fc8 <main>
 8000bde:	4770      	bx	lr
 8000be0:	20020000 	.word	0x20020000
 8000be4:	0800bb88 	.word	0x0800bb88
 8000be8:	20000000 	.word	0x20000000
 8000bec:	20000250 	.word	0x20000250
 8000bf0:	20000250 	.word	0x20000250
 8000bf4:	20019310 	.word	0x20019310

08000bf8 <ADC_IRQHandler>:
 8000bf8:	e7fe      	b.n	8000bf8 <ADC_IRQHandler>
	...

08000bfc <NVIC_SetPriorityGrouping>:
 8000bfc:	b480      	push	{r7}
 8000bfe:	b085      	sub	sp, #20
 8000c00:	af00      	add	r7, sp, #0
 8000c02:	6078      	str	r0, [r7, #4]
 8000c04:	687b      	ldr	r3, [r7, #4]
 8000c06:	f003 0307 	and.w	r3, r3, #7
 8000c0a:	60fb      	str	r3, [r7, #12]
 8000c0c:	4b0c      	ldr	r3, [pc, #48]	; (8000c40 <NVIC_SetPriorityGrouping+0x44>)
 8000c0e:	68db      	ldr	r3, [r3, #12]
 8000c10:	60bb      	str	r3, [r7, #8]
 8000c12:	68ba      	ldr	r2, [r7, #8]
 8000c14:	f64f 03ff 	movw	r3, #63743	; 0xf8ff
 8000c18:	4013      	ands	r3, r2
 8000c1a:	60bb      	str	r3, [r7, #8]
 8000c1c:	68fb      	ldr	r3, [r7, #12]
 8000c1e:	021a      	lsls	r2, r3, #8
 8000c20:	68bb      	ldr	r3, [r7, #8]
 8000c22:	4313      	orrs	r3, r2
 8000c24:	f043 63bf 	orr.w	r3, r3, #100139008	; 0x5f80000
 8000c28:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
 8000c2c:	60bb      	str	r3, [r7, #8]
 8000c2e:	4a04      	ldr	r2, [pc, #16]	; (8000c40 <NVIC_SetPriorityGrouping+0x44>)
 8000c30:	68bb      	ldr	r3, [r7, #8]
 8000c32:	60d3      	str	r3, [r2, #12]
 8000c34:	bf00      	nop
 8000c36:	3714      	adds	r7, #20
 8000c38:	46bd      	mov	sp, r7
 8000c3a:	f85d 7b04 	ldr.w	r7, [sp], #4
 8000c3e:	4770      	bx	lr
 8000c40:	e000ed00 	.word	0xe000ed00

08000c44 <NVIC_SetPriority>:
 8000c44:	b480      	push	{r7}
 8000c46:	b083      	sub	sp, #12
 8000c48:	af00      	add	r7, sp, #0
 8000c4a:	4603      	mov	r3, r0
 8000c4c:	6039      	str	r1, [r7, #0]
 8000c4e:	71fb      	strb	r3, [r7, #7]
 8000c50:	f997 3007 	ldrsb.w	r3, [r7, #7]
 8000c54:	2b00      	cmp	r3, #0
 8000c56:	da0b      	bge.n	8000c70 <NVIC_SetPriority+0x2c>
 8000c58:	683b      	ldr	r3, [r7, #0]
 8000c5a:	b2da      	uxtb	r2, r3
 8000c5c:	490c      	ldr	r1, [pc, #48]	; (8000c90 <NVIC_SetPriority+0x4c>)
 8000c5e:	79fb      	ldrb	r3, [r7, #7]
 8000c60:	f003 030f 	and.w	r3, r3, #15
 8000c64:	3b04      	subs	r3, #4
 8000c66:	0112      	lsls	r2, r2, #4
 8000c68:	b2d2      	uxtb	r2, r2
 8000c6a:	440b      	add	r3, r1
 8000c6c:	761a      	strb	r2, [r3, #24]
 8000c6e:	e009      	b.n	8000c84 <NVIC_SetPriority+0x40>
 8000c70:	683b      	ldr	r3, [r7, #0]
 8000c72:	b2da      	uxtb	r2, r3
 8000c74:	4907      	ldr	r1, [pc, #28]	; (8000c94 <NVIC_SetPriority+0x50>)
 8000c76:	f997 3007 	ldrsb.w	r3, [r7, #7]
 8000c7a:	0112      	lsls	r2, r2, #4
 8000c7c:	b2d2      	uxtb	r2, r2
 8000c7e:	440b      	add	r3, r1
 8000c80:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 8000c84:	bf00      	nop
 8000c86:	370c      	adds	r7, #12
 8000c88:	46bd      	mov	sp, r7
 8000c8a:	f85d 7b04 	ldr.w	r7, [sp], #4
 8000c8e:	4770      	bx	lr
 8000c90:	e000ed00 	.word	0xe000ed00
 8000c94:	e000e100 	.word	0xe000e100

08000c98 <SysTick_Config>:
 8000c98:	b580      	push	{r7, lr}
 8000c9a:	b082      	sub	sp, #8
 8000c9c:	af00      	add	r7, sp, #0
 8000c9e:	6078      	str	r0, [r7, #4]
 8000ca0:	687b      	ldr	r3, [r7, #4]
 8000ca2:	3b01      	subs	r3, #1
 8000ca4:	f1b3 7f80 	cmp.w	r3, #16777216	; 0x1000000
 8000ca8:	d301      	bcc.n	8000cae <SysTick_Config+0x16>
 8000caa:	2301      	movs	r3, #1
 8000cac:	e00f      	b.n	8000cce <SysTick_Config+0x36>
 8000cae:	4a0a      	ldr	r2, [pc, #40]	; (8000cd8 <SysTick_Config+0x40>)
 8000cb0:	687b      	ldr	r3, [r7, #4]
 8000cb2:	3b01      	subs	r3, #1
 8000cb4:	6053      	str	r3, [r2, #4]
 8000cb6:	210f      	movs	r1, #15
 8000cb8:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 8000cbc:	f7ff ffc2 	bl	8000c44 <NVIC_SetPriority>
 8000cc0:	4b05      	ldr	r3, [pc, #20]	; (8000cd8 <SysTick_Config+0x40>)
 8000cc2:	2200      	movs	r2, #0
 8000cc4:	609a      	str	r2, [r3, #8]
 8000cc6:	4b04      	ldr	r3, [pc, #16]	; (8000cd8 <SysTick_Config+0x40>)
 8000cc8:	2207      	movs	r2, #7
 8000cca:	601a      	str	r2, [r3, #0]
 8000ccc:	2300      	movs	r3, #0
 8000cce:	4618      	mov	r0, r3
 8000cd0:	3708      	adds	r7, #8
 8000cd2:	46bd      	mov	sp, r7
 8000cd4:	bd80      	pop	{r7, pc}
 8000cd6:	bf00      	nop
 8000cd8:	e000e010 	.word	0xe000e010

08000cdc <LL_RCC_HSE_Enable>:
 8000cdc:	b480      	push	{r7}
 8000cde:	af00      	add	r7, sp, #0
 8000ce0:	4b05      	ldr	r3, [pc, #20]	; (8000cf8 <LL_RCC_HSE_Enable+0x1c>)
 8000ce2:	681b      	ldr	r3, [r3, #0]
 8000ce4:	4a04      	ldr	r2, [pc, #16]	; (8000cf8 <LL_RCC_HSE_Enable+0x1c>)
 8000ce6:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
 8000cea:	6013      	str	r3, [r2, #0]
 8000cec:	bf00      	nop
 8000cee:	46bd      	mov	sp, r7
 8000cf0:	f85d 7b04 	ldr.w	r7, [sp], #4
 8000cf4:	4770      	bx	lr
 8000cf6:	bf00      	nop
 8000cf8:	40023800 	.word	0x40023800

08000cfc <LL_RCC_HSE_IsReady>:
 8000cfc:	b480      	push	{r7}
 8000cfe:	af00      	add	r7, sp, #0
 8000d00:	4b07      	ldr	r3, [pc, #28]	; (8000d20 <LL_RCC_HSE_IsReady+0x24>)
 8000d02:	681b      	ldr	r3, [r3, #0]
 8000d04:	f403 3300 	and.w	r3, r3, #131072	; 0x20000
 8000d08:	f5b3 3f00 	cmp.w	r3, #131072	; 0x20000
 8000d0c:	bf0c      	ite	eq
 8000d0e:	2301      	moveq	r3, #1
 8000d10:	2300      	movne	r3, #0
 8000d12:	b2db      	uxtb	r3, r3
 8000d14:	4618      	mov	r0, r3
 8000d16:	46bd      	mov	sp, r7
 8000d18:	f85d 7b04 	ldr.w	r7, [sp], #4
 8000d1c:	4770      	bx	lr
 8000d1e:	bf00      	nop
 8000d20:	40023800 	.word	0x40023800

08000d24 <LL_RCC_SetSysClkSource>:
 8000d24:	b480      	push	{r7}
 8000d26:	b083      	sub	sp, #12
 8000d28:	af00      	add	r7, sp, #0
 8000d2a:	6078      	str	r0, [r7, #4]
 8000d2c:	4b06      	ldr	r3, [pc, #24]	; (8000d48 <LL_RCC_SetSysClkSource+0x24>)
 8000d2e:	689b      	ldr	r3, [r3, #8]
 8000d30:	f023 0203 	bic.w	r2, r3, #3
 8000d34:	4904      	ldr	r1, [pc, #16]	; (8000d48 <LL_RCC_SetSysClkSource+0x24>)
 8000d36:	687b      	ldr	r3, [r7, #4]
 8000d38:	4313      	orrs	r3, r2
 8000d3a:	608b      	str	r3, [r1, #8]
 8000d3c:	bf00      	nop
 8000d3e:	370c      	adds	r7, #12
 8000d40:	46bd      	mov	sp, r7
 8000d42:	f85d 7b04 	ldr.w	r7, [sp], #4
 8000d46:	4770      	bx	lr
 8000d48:	40023800 	.word	0x40023800

08000d4c <LL_RCC_GetSysClkSource>:
 8000d4c:	b480      	push	{r7}
 8000d4e:	af00      	add	r7, sp, #0
 8000d50:	4b04      	ldr	r3, [pc, #16]	; (8000d64 <LL_RCC_GetSysClkSource+0x18>)
 8000d52:	689b      	ldr	r3, [r3, #8]
 8000d54:	f003 030c 	and.w	r3, r3, #12
 8000d58:	4618      	mov	r0, r3
 8000d5a:	46bd      	mov	sp, r7
 8000d5c:	f85d 7b04 	ldr.w	r7, [sp], #4
 8000d60:	4770      	bx	lr
 8000d62:	bf00      	nop
 8000d64:	40023800 	.word	0x40023800

08000d68 <LL_RCC_SetAHBPrescaler>:
 8000d68:	b480      	push	{r7}
 8000d6a:	b083      	sub	sp, #12
 8000d6c:	af00      	add	r7, sp, #0
 8000d6e:	6078      	str	r0, [r7, #4]
 8000d70:	4b06      	ldr	r3, [pc, #24]	; (8000d8c <LL_RCC_SetAHBPrescaler+0x24>)
 8000d72:	689b      	ldr	r3, [r3, #8]
 8000d74:	f023 02f0 	bic.w	r2, r3, #240	; 0xf0
 8000d78:	4904      	ldr	r1, [pc, #16]	; (8000d8c <LL_RCC_SetAHBPrescaler+0x24>)
 8000d7a:	687b      	ldr	r3, [r7, #4]
 8000d7c:	4313      	orrs	r3, r2
 8000d7e:	608b      	str	r3, [r1, #8]
 8000d80:	bf00      	nop
 8000d82:	370c      	adds	r7, #12
 8000d84:	46bd      	mov	sp, r7
 8000d86:	f85d 7b04 	ldr.w	r7, [sp], #4
 8000d8a:	4770      	bx	lr
 8000d8c:	40023800 	.word	0x40023800

08000d90 <LL_RCC_SetAPB1Prescaler>:
 8000d90:	b480      	push	{r7}
 8000d92:	b083      	sub	sp, #12
 8000d94:	af00      	add	r7, sp, #0
 8000d96:	6078      	str	r0, [r7, #4]
 8000d98:	4b06      	ldr	r3, [pc, #24]	; (8000db4 <LL_RCC_SetAPB1Prescaler+0x24>)
 8000d9a:	689b      	ldr	r3, [r3, #8]
 8000d9c:	f423 52e0 	bic.w	r2, r3, #7168	; 0x1c00
 8000da0:	4904      	ldr	r1, [pc, #16]	; (8000db4 <LL_RCC_SetAPB1Prescaler+0x24>)
 8000da2:	687b      	ldr	r3, [r7, #4]
 8000da4:	4313      	orrs	r3, r2
 8000da6:	608b      	str	r3, [r1, #8]
 8000da8:	bf00      	nop
 8000daa:	370c      	adds	r7, #12
 8000dac:	46bd      	mov	sp, r7
 8000dae:	f85d 7b04 	ldr.w	r7, [sp], #4
 8000db2:	4770      	bx	lr
 8000db4:	40023800 	.word	0x40023800

08000db8 <LL_RCC_SetAPB2Prescaler>:
 8000db8:	b480      	push	{r7}
 8000dba:	b083      	sub	sp, #12
 8000dbc:	af00      	add	r7, sp, #0
 8000dbe:	6078      	str	r0, [r7, #4]
 8000dc0:	4b06      	ldr	r3, [pc, #24]	; (8000ddc <LL_RCC_SetAPB2Prescaler+0x24>)
 8000dc2:	689b      	ldr	r3, [r3, #8]
 8000dc4:	f423 4260 	bic.w	r2, r3, #57344	; 0xe000
 8000dc8:	4904      	ldr	r1, [pc, #16]	; (8000ddc <LL_RCC_SetAPB2Prescaler+0x24>)
 8000dca:	687b      	ldr	r3, [r7, #4]
 8000dcc:	4313      	orrs	r3, r2
 8000dce:	608b      	str	r3, [r1, #8]
 8000dd0:	bf00      	nop
 8000dd2:	370c      	adds	r7, #12
 8000dd4:	46bd      	mov	sp, r7
 8000dd6:	f85d 7b04 	ldr.w	r7, [sp], #4
 8000dda:	4770      	bx	lr
 8000ddc:	40023800 	.word	0x40023800

08000de0 <LL_RCC_PLL_Enable>:
 8000de0:	b480      	push	{r7}
 8000de2:	af00      	add	r7, sp, #0
 8000de4:	4b05      	ldr	r3, [pc, #20]	; (8000dfc <LL_RCC_PLL_Enable+0x1c>)
 8000de6:	681b      	ldr	r3, [r3, #0]
 8000de8:	4a04      	ldr	r2, [pc, #16]	; (8000dfc <LL_RCC_PLL_Enable+0x1c>)
 8000dea:	f043 7380 	orr.w	r3, r3, #16777216	; 0x1000000
 8000dee:	6013      	str	r3, [r2, #0]
 8000df0:	bf00      	nop
 8000df2:	46bd      	mov	sp, r7
 8000df4:	f85d 7b04 	ldr.w	r7, [sp], #4
 8000df8:	4770      	bx	lr
 8000dfa:	bf00      	nop
 8000dfc:	40023800 	.word	0x40023800

08000e00 <LL_RCC_PLL_IsReady>:
 8000e00:	b480      	push	{r7}
 8000e02:	af00      	add	r7, sp, #0
 8000e04:	4b07      	ldr	r3, [pc, #28]	; (8000e24 <LL_RCC_PLL_IsReady+0x24>)
 8000e06:	681b      	ldr	r3, [r3, #0]
 8000e08:	f003 7300 	and.w	r3, r3, #33554432	; 0x2000000
 8000e0c:	f1b3 7f00 	cmp.w	r3, #33554432	; 0x2000000
 8000e10:	bf0c      	ite	eq
 8000e12:	2301      	moveq	r3, #1
 8000e14:	2300      	movne	r3, #0
 8000e16:	b2db      	uxtb	r3, r3
 8000e18:	4618      	mov	r0, r3
 8000e1a:	46bd      	mov	sp, r7
 8000e1c:	f85d 7b04 	ldr.w	r7, [sp], #4
 8000e20:	4770      	bx	lr
 8000e22:	bf00      	nop
 8000e24:	40023800 	.word	0x40023800

08000e28 <LL_RCC_PLL_ConfigDomain_SYS>:
 8000e28:	b480      	push	{r7}
 8000e2a:	b085      	sub	sp, #20
 8000e2c:	af00      	add	r7, sp, #0
 8000e2e:	60f8      	str	r0, [r7, #12]
 8000e30:	60b9      	str	r1, [r7, #8]
 8000e32:	607a      	str	r2, [r7, #4]
 8000e34:	603b      	str	r3, [r7, #0]
 8000e36:	4b0d      	ldr	r3, [pc, #52]	; (8000e6c <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 8000e38:	685a      	ldr	r2, [r3, #4]
 8000e3a:	4b0d      	ldr	r3, [pc, #52]	; (8000e70 <LL_RCC_PLL_ConfigDomain_SYS+0x48>)
 8000e3c:	4013      	ands	r3, r2
 8000e3e:	68f9      	ldr	r1, [r7, #12]
 8000e40:	68ba      	ldr	r2, [r7, #8]
 8000e42:	4311      	orrs	r1, r2
 8000e44:	687a      	ldr	r2, [r7, #4]
 8000e46:	0192      	lsls	r2, r2, #6
 8000e48:	430a      	orrs	r2, r1
 8000e4a:	4908      	ldr	r1, [pc, #32]	; (8000e6c <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 8000e4c:	4313      	orrs	r3, r2
 8000e4e:	604b      	str	r3, [r1, #4]
 8000e50:	4b06      	ldr	r3, [pc, #24]	; (8000e6c <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 8000e52:	685b      	ldr	r3, [r3, #4]
 8000e54:	f423 3240 	bic.w	r2, r3, #196608	; 0x30000
 8000e58:	4904      	ldr	r1, [pc, #16]	; (8000e6c <LL_RCC_PLL_ConfigDomain_SYS+0x44>)
 8000e5a:	683b      	ldr	r3, [r7, #0]
 8000e5c:	4313      	orrs	r3, r2
 8000e5e:	604b      	str	r3, [r1, #4]
 8000e60:	bf00      	nop
 8000e62:	3714      	adds	r7, #20
 8000e64:	46bd      	mov	sp, r7
 8000e66:	f85d 7b04 	ldr.w	r7, [sp], #4
 8000e6a:	4770      	bx	lr
 8000e6c:	40023800 	.word	0x40023800
 8000e70:	ffbf8000 	.word	0xffbf8000

08000e74 <LL_FLASH_SetLatency>:
 8000e74:	b480      	push	{r7}
 8000e76:	b083      	sub	sp, #12
 8000e78:	af00      	add	r7, sp, #0
 8000e7a:	6078      	str	r0, [r7, #4]
 8000e7c:	4b06      	ldr	r3, [pc, #24]	; (8000e98 <LL_FLASH_SetLatency+0x24>)
 8000e7e:	681b      	ldr	r3, [r3, #0]
 8000e80:	f023 020f 	bic.w	r2, r3, #15
 8000e84:	4904      	ldr	r1, [pc, #16]	; (8000e98 <LL_FLASH_SetLatency+0x24>)
 8000e86:	687b      	ldr	r3, [r7, #4]
 8000e88:	4313      	orrs	r3, r2
 8000e8a:	600b      	str	r3, [r1, #0]
 8000e8c:	bf00      	nop
 8000e8e:	370c      	adds	r7, #12
 8000e90:	46bd      	mov	sp, r7
 8000e92:	f85d 7b04 	ldr.w	r7, [sp], #4
 8000e96:	4770      	bx	lr
 8000e98:	40023c00 	.word	0x40023c00

08000e9c <LL_AHB1_GRP1_EnableClock>:
 8000e9c:	b480      	push	{r7}
 8000e9e:	b085      	sub	sp, #20
 8000ea0:	af00      	add	r7, sp, #0
 8000ea2:	6078      	str	r0, [r7, #4]
 8000ea4:	4b08      	ldr	r3, [pc, #32]	; (8000ec8 <LL_AHB1_GRP1_EnableClock+0x2c>)
 8000ea6:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8000ea8:	4907      	ldr	r1, [pc, #28]	; (8000ec8 <LL_AHB1_GRP1_EnableClock+0x2c>)
 8000eaa:	687b      	ldr	r3, [r7, #4]
 8000eac:	4313      	orrs	r3, r2
 8000eae:	630b      	str	r3, [r1, #48]	; 0x30
 8000eb0:	4b05      	ldr	r3, [pc, #20]	; (8000ec8 <LL_AHB1_GRP1_EnableClock+0x2c>)
 8000eb2:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8000eb4:	687b      	ldr	r3, [r7, #4]
 8000eb6:	4013      	ands	r3, r2
 8000eb8:	60fb      	str	r3, [r7, #12]
 8000eba:	68fb      	ldr	r3, [r7, #12]
 8000ebc:	bf00      	nop
 8000ebe:	3714      	adds	r7, #20
 8000ec0:	46bd      	mov	sp, r7
 8000ec2:	f85d 7b04 	ldr.w	r7, [sp], #4
 8000ec6:	4770      	bx	lr
 8000ec8:	40023800 	.word	0x40023800

08000ecc <LL_GPIO_SetPinMode>:
 8000ecc:	b480      	push	{r7}
 8000ece:	b089      	sub	sp, #36	; 0x24
 8000ed0:	af00      	add	r7, sp, #0
 8000ed2:	60f8      	str	r0, [r7, #12]
 8000ed4:	60b9      	str	r1, [r7, #8]
 8000ed6:	607a      	str	r2, [r7, #4]
 8000ed8:	68fb      	ldr	r3, [r7, #12]
 8000eda:	681a      	ldr	r2, [r3, #0]
 8000edc:	68bb      	ldr	r3, [r7, #8]
 8000ede:	617b      	str	r3, [r7, #20]
 8000ee0:	697b      	ldr	r3, [r7, #20]
 8000ee2:	fa93 f3a3 	rbit	r3, r3
 8000ee6:	613b      	str	r3, [r7, #16]
 8000ee8:	693b      	ldr	r3, [r7, #16]
 8000eea:	fab3 f383 	clz	r3, r3
 8000eee:	005b      	lsls	r3, r3, #1
 8000ef0:	2103      	movs	r1, #3
 8000ef2:	fa01 f303 	lsl.w	r3, r1, r3
 8000ef6:	43db      	mvns	r3, r3
 8000ef8:	401a      	ands	r2, r3
 8000efa:	68bb      	ldr	r3, [r7, #8]
 8000efc:	61fb      	str	r3, [r7, #28]
 8000efe:	69fb      	ldr	r3, [r7, #28]
 8000f00:	fa93 f3a3 	rbit	r3, r3
 8000f04:	61bb      	str	r3, [r7, #24]
 8000f06:	69bb      	ldr	r3, [r7, #24]
 8000f08:	fab3 f383 	clz	r3, r3
 8000f0c:	005b      	lsls	r3, r3, #1
 8000f0e:	6879      	ldr	r1, [r7, #4]
 8000f10:	fa01 f303 	lsl.w	r3, r1, r3
 8000f14:	431a      	orrs	r2, r3
 8000f16:	68fb      	ldr	r3, [r7, #12]
 8000f18:	601a      	str	r2, [r3, #0]
 8000f1a:	bf00      	nop
 8000f1c:	3724      	adds	r7, #36	; 0x24
 8000f1e:	46bd      	mov	sp, r7
 8000f20:	f85d 7b04 	ldr.w	r7, [sp], #4
 8000f24:	4770      	bx	lr
	...

08000f28 <rcc_config>:
 8000f28:	b580      	push	{r7, lr}
 8000f2a:	af00      	add	r7, sp, #0
 8000f2c:	f7ff fed6 	bl	8000cdc <LL_RCC_HSE_Enable>
 8000f30:	bf00      	nop
 8000f32:	f7ff fee3 	bl	8000cfc <LL_RCC_HSE_IsReady>
 8000f36:	4603      	mov	r3, r0
 8000f38:	2b01      	cmp	r3, #1
 8000f3a:	d1fa      	bne.n	8000f32 <rcc_config+0xa>
 8000f3c:	2005      	movs	r0, #5
 8000f3e:	f7ff ff99 	bl	8000e74 <LL_FLASH_SetLatency>
 8000f42:	2300      	movs	r3, #0
 8000f44:	f44f 72a8 	mov.w	r2, #336	; 0x150
 8000f48:	2108      	movs	r1, #8
 8000f4a:	f44f 0080 	mov.w	r0, #4194304	; 0x400000
 8000f4e:	f7ff ff6b 	bl	8000e28 <LL_RCC_PLL_ConfigDomain_SYS>
 8000f52:	f7ff ff45 	bl	8000de0 <LL_RCC_PLL_Enable>
 8000f56:	bf00      	nop
 8000f58:	f7ff ff52 	bl	8000e00 <LL_RCC_PLL_IsReady>
 8000f5c:	4603      	mov	r3, r0
 8000f5e:	2b01      	cmp	r3, #1
 8000f60:	d1fa      	bne.n	8000f58 <rcc_config+0x30>
 8000f62:	2000      	movs	r0, #0
 8000f64:	f7ff ff00 	bl	8000d68 <LL_RCC_SetAHBPrescaler>
 8000f68:	2002      	movs	r0, #2
 8000f6a:	f7ff fedb 	bl	8000d24 <LL_RCC_SetSysClkSource>
 8000f6e:	bf00      	nop
 8000f70:	f7ff feec 	bl	8000d4c <LL_RCC_GetSysClkSource>
 8000f74:	4603      	mov	r3, r0
 8000f76:	2b08      	cmp	r3, #8
 8000f78:	d1fa      	bne.n	8000f70 <rcc_config+0x48>
 8000f7a:	f44f 50a0 	mov.w	r0, #5120	; 0x1400
 8000f7e:	f7ff ff07 	bl	8000d90 <LL_RCC_SetAPB1Prescaler>
 8000f82:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8000f86:	f7ff ff17 	bl	8000db8 <LL_RCC_SetAPB2Prescaler>
 8000f8a:	4804      	ldr	r0, [pc, #16]	; (8000f9c <rcc_config+0x74>)
 8000f8c:	f7ff fe84 	bl	8000c98 <SysTick_Config>
 8000f90:	4b03      	ldr	r3, [pc, #12]	; (8000fa0 <rcc_config+0x78>)
 8000f92:	4a04      	ldr	r2, [pc, #16]	; (8000fa4 <rcc_config+0x7c>)
 8000f94:	601a      	str	r2, [r3, #0]
 8000f96:	bf00      	nop
 8000f98:	bd80      	pop	{r7, pc}
 8000f9a:	bf00      	nop
 8000f9c:	00029040 	.word	0x00029040
 8000fa0:	2000007c 	.word	0x2000007c
 8000fa4:	0a037a00 	.word	0x0a037a00

08000fa8 <gpio_config>:
 8000fa8:	b580      	push	{r7, lr}
 8000faa:	af00      	add	r7, sp, #0
 8000fac:	2008      	movs	r0, #8
 8000fae:	f7ff ff75 	bl	8000e9c <LL_AHB1_GRP1_EnableClock>
 8000fb2:	2201      	movs	r2, #1
 8000fb4:	f44f 5100 	mov.w	r1, #8192	; 0x2000
 8000fb8:	4802      	ldr	r0, [pc, #8]	; (8000fc4 <gpio_config+0x1c>)
 8000fba:	f7ff ff87 	bl	8000ecc <LL_GPIO_SetPinMode>
 8000fbe:	bf00      	nop
 8000fc0:	bd80      	pop	{r7, pc}
 8000fc2:	bf00      	nop
 8000fc4:	40020c00 	.word	0x40020c00

08000fc8 <main>:
 8000fc8:	b580      	push	{r7, lr}
 8000fca:	b084      	sub	sp, #16
 8000fcc:	af04      	add	r7, sp, #16
 8000fce:	f7ff ffab 	bl	8000f28 <rcc_config>
 8000fd2:	f7ff ffe9 	bl	8000fa8 <gpio_config>
 8000fd6:	2000      	movs	r0, #0
 8000fd8:	f7ff fe10 	bl	8000bfc <NVIC_SetPriorityGrouping>
 8000fdc:	4b1c      	ldr	r3, [pc, #112]	; (8001050 <main+0x88>)
 8000fde:	9302      	str	r3, [sp, #8]
 8000fe0:	4b1c      	ldr	r3, [pc, #112]	; (8001054 <main+0x8c>)
 8000fe2:	9301      	str	r3, [sp, #4]
 8000fe4:	2303      	movs	r3, #3
 8000fe6:	9300      	str	r3, [sp, #0]
 8000fe8:	2300      	movs	r3, #0
 8000fea:	f44f 6280 	mov.w	r2, #1024	; 0x400
 8000fee:	491a      	ldr	r1, [pc, #104]	; (8001058 <main+0x90>)
 8000ff0:	481a      	ldr	r0, [pc, #104]	; (800105c <main+0x94>)
 8000ff2:	f004 ff73 	bl	8005edc <xTaskCreateStatic>
 8000ff6:	4b1a      	ldr	r3, [pc, #104]	; (8001060 <main+0x98>)
 8000ff8:	9302      	str	r3, [sp, #8]
 8000ffa:	4b1a      	ldr	r3, [pc, #104]	; (8001064 <main+0x9c>)
 8000ffc:	9301      	str	r3, [sp, #4]
 8000ffe:	2302      	movs	r3, #2
 8001000:	9300      	str	r3, [sp, #0]
 8001002:	2300      	movs	r3, #0
 8001004:	f44f 6280 	mov.w	r2, #1024	; 0x400
 8001008:	4917      	ldr	r1, [pc, #92]	; (8001068 <main+0xa0>)
 800100a:	4818      	ldr	r0, [pc, #96]	; (800106c <main+0xa4>)
 800100c:	f004 ff66 	bl	8005edc <xTaskCreateStatic>
 8001010:	4b17      	ldr	r3, [pc, #92]	; (8001070 <main+0xa8>)
 8001012:	9302      	str	r3, [sp, #8]
 8001014:	4b17      	ldr	r3, [pc, #92]	; (8001074 <main+0xac>)
 8001016:	9301      	str	r3, [sp, #4]
 8001018:	2302      	movs	r3, #2
 800101a:	9300      	str	r3, [sp, #0]
 800101c:	2300      	movs	r3, #0
 800101e:	f44f 6280 	mov.w	r2, #1024	; 0x400
 8001022:	4915      	ldr	r1, [pc, #84]	; (8001078 <main+0xb0>)
 8001024:	4815      	ldr	r0, [pc, #84]	; (800107c <main+0xb4>)
 8001026:	f004 ff59 	bl	8005edc <xTaskCreateStatic>
 800102a:	4b15      	ldr	r3, [pc, #84]	; (8001080 <main+0xb8>)
 800102c:	9302      	str	r3, [sp, #8]
 800102e:	4b15      	ldr	r3, [pc, #84]	; (8001084 <main+0xbc>)
 8001030:	9301      	str	r3, [sp, #4]
 8001032:	2301      	movs	r3, #1
 8001034:	9300      	str	r3, [sp, #0]
 8001036:	2300      	movs	r3, #0
 8001038:	f44f 6280 	mov.w	r2, #1024	; 0x400
 800103c:	4912      	ldr	r1, [pc, #72]	; (8001088 <main+0xc0>)
 800103e:	4813      	ldr	r0, [pc, #76]	; (800108c <main+0xc4>)
 8001040:	f004 ff4c 	bl	8005edc <xTaskCreateStatic>
 8001044:	f005 f91c 	bl	8006280 <vTaskStartScheduler>
 8001048:	2300      	movs	r3, #0
 800104a:	4618      	mov	r0, r3
 800104c:	46bd      	mov	sp, r7
 800104e:	bd80      	pop	{r7, pc}
 8001050:	200139f0 	.word	0x200139f0
 8001054:	200167c0 	.word	0x200167c0
 8001058:	0800b248 	.word	0x0800b248
 800105c:	08003151 	.word	0x08003151
 8001060:	200187c8 	.word	0x200187c8
 8001064:	20014ec0 	.word	0x20014ec0
 8001068:	0800b254 	.word	0x0800b254
 800106c:	08004181 	.word	0x08004181
 8001070:	20015ec0 	.word	0x20015ec0
 8001074:	200177c0 	.word	0x200177c0
 8001078:	0800b260 	.word	0x0800b260
 800107c:	08004ec5 	.word	0x08004ec5
 8001080:	20016340 	.word	0x20016340
 8001084:	20013e70 	.word	0x20013e70
 8001088:	0800b26c 	.word	0x0800b26c
 800108c:	080018d5 	.word	0x080018d5

08001090 <_malloc_r>:
 8001090:	b580      	push	{r7, lr}
 8001092:	b082      	sub	sp, #8
 8001094:	af00      	add	r7, sp, #0
 8001096:	6078      	str	r0, [r7, #4]
 8001098:	6039      	str	r1, [r7, #0]
 800109a:	6838      	ldr	r0, [r7, #0]
 800109c:	f006 fe88 	bl	8007db0 <pvPortMalloc>
 80010a0:	4603      	mov	r3, r0
 80010a2:	4618      	mov	r0, r3
 80010a4:	3708      	adds	r7, #8
 80010a6:	46bd      	mov	sp, r7
 80010a8:	bd80      	pop	{r7, pc}

080010aa <_free_r>:
 80010aa:	b580      	push	{r7, lr}
 80010ac:	b082      	sub	sp, #8
 80010ae:	af00      	add	r7, sp, #0
 80010b0:	6078      	str	r0, [r7, #4]
 80010b2:	6039      	str	r1, [r7, #0]
 80010b4:	6838      	ldr	r0, [r7, #0]
 80010b6:	f006 ff41 	bl	8007f3c <vPortFree>
 80010ba:	bf00      	nop
 80010bc:	3708      	adds	r7, #8
 80010be:	46bd      	mov	sp, r7
 80010c0:	bd80      	pop	{r7, pc}
	...

080010c4 <NVIC_EnableIRQ>:
 80010c4:	b480      	push	{r7}
 80010c6:	b083      	sub	sp, #12
 80010c8:	af00      	add	r7, sp, #0
 80010ca:	4603      	mov	r3, r0
 80010cc:	71fb      	strb	r3, [r7, #7]
 80010ce:	79fb      	ldrb	r3, [r7, #7]
 80010d0:	f003 021f 	and.w	r2, r3, #31
 80010d4:	4907      	ldr	r1, [pc, #28]	; (80010f4 <NVIC_EnableIRQ+0x30>)
 80010d6:	f997 3007 	ldrsb.w	r3, [r7, #7]
 80010da:	095b      	lsrs	r3, r3, #5
 80010dc:	2001      	movs	r0, #1
 80010de:	fa00 f202 	lsl.w	r2, r0, r2
 80010e2:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
 80010e6:	bf00      	nop
 80010e8:	370c      	adds	r7, #12
 80010ea:	46bd      	mov	sp, r7
 80010ec:	f85d 7b04 	ldr.w	r7, [sp], #4
 80010f0:	4770      	bx	lr
 80010f2:	bf00      	nop
 80010f4:	e000e100 	.word	0xe000e100

080010f8 <NVIC_SetPriority>:
 80010f8:	b480      	push	{r7}
 80010fa:	b083      	sub	sp, #12
 80010fc:	af00      	add	r7, sp, #0
 80010fe:	4603      	mov	r3, r0
 8001100:	6039      	str	r1, [r7, #0]
 8001102:	71fb      	strb	r3, [r7, #7]
 8001104:	f997 3007 	ldrsb.w	r3, [r7, #7]
 8001108:	2b00      	cmp	r3, #0
 800110a:	da0b      	bge.n	8001124 <NVIC_SetPriority+0x2c>
 800110c:	683b      	ldr	r3, [r7, #0]
 800110e:	b2da      	uxtb	r2, r3
 8001110:	490c      	ldr	r1, [pc, #48]	; (8001144 <NVIC_SetPriority+0x4c>)
 8001112:	79fb      	ldrb	r3, [r7, #7]
 8001114:	f003 030f 	and.w	r3, r3, #15
 8001118:	3b04      	subs	r3, #4
 800111a:	0112      	lsls	r2, r2, #4
 800111c:	b2d2      	uxtb	r2, r2
 800111e:	440b      	add	r3, r1
 8001120:	761a      	strb	r2, [r3, #24]
 8001122:	e009      	b.n	8001138 <NVIC_SetPriority+0x40>
 8001124:	683b      	ldr	r3, [r7, #0]
 8001126:	b2da      	uxtb	r2, r3
 8001128:	4907      	ldr	r1, [pc, #28]	; (8001148 <NVIC_SetPriority+0x50>)
 800112a:	f997 3007 	ldrsb.w	r3, [r7, #7]
 800112e:	0112      	lsls	r2, r2, #4
 8001130:	b2d2      	uxtb	r2, r2
 8001132:	440b      	add	r3, r1
 8001134:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 8001138:	bf00      	nop
 800113a:	370c      	adds	r7, #12
 800113c:	46bd      	mov	sp, r7
 800113e:	f85d 7b04 	ldr.w	r7, [sp], #4
 8001142:	4770      	bx	lr
 8001144:	e000ed00 	.word	0xe000ed00
 8001148:	e000e100 	.word	0xe000e100

0800114c <LL_USART_IsActiveFlag_TC>:
 800114c:	b480      	push	{r7}
 800114e:	b083      	sub	sp, #12
 8001150:	af00      	add	r7, sp, #0
 8001152:	6078      	str	r0, [r7, #4]
 8001154:	687b      	ldr	r3, [r7, #4]
 8001156:	681b      	ldr	r3, [r3, #0]
 8001158:	f003 0340 	and.w	r3, r3, #64	; 0x40
 800115c:	2b40      	cmp	r3, #64	; 0x40
 800115e:	bf0c      	ite	eq
 8001160:	2301      	moveq	r3, #1
 8001162:	2300      	movne	r3, #0
 8001164:	b2db      	uxtb	r3, r3
 8001166:	4618      	mov	r0, r3
 8001168:	370c      	adds	r7, #12
 800116a:	46bd      	mov	sp, r7
 800116c:	f85d 7b04 	ldr.w	r7, [sp], #4
 8001170:	4770      	bx	lr

08001172 <LL_USART_IsActiveFlag_TXE>:
 8001172:	b480      	push	{r7}
 8001174:	b083      	sub	sp, #12
 8001176:	af00      	add	r7, sp, #0
 8001178:	6078      	str	r0, [r7, #4]
 800117a:	687b      	ldr	r3, [r7, #4]
 800117c:	681b      	ldr	r3, [r3, #0]
 800117e:	f003 0380 	and.w	r3, r3, #128	; 0x80
 8001182:	2b80      	cmp	r3, #128	; 0x80
 8001184:	bf0c      	ite	eq
 8001186:	2301      	moveq	r3, #1
 8001188:	2300      	movne	r3, #0
 800118a:	b2db      	uxtb	r3, r3
 800118c:	4618      	mov	r0, r3
 800118e:	370c      	adds	r7, #12
 8001190:	46bd      	mov	sp, r7
 8001192:	f85d 7b04 	ldr.w	r7, [sp], #4
 8001196:	4770      	bx	lr

08001198 <LL_USART_ClearFlag_TC>:
 8001198:	b480      	push	{r7}
 800119a:	b083      	sub	sp, #12
 800119c:	af00      	add	r7, sp, #0
 800119e:	6078      	str	r0, [r7, #4]
 80011a0:	687b      	ldr	r3, [r7, #4]
 80011a2:	f06f 0240 	mvn.w	r2, #64	; 0x40
 80011a6:	601a      	str	r2, [r3, #0]
 80011a8:	bf00      	nop
 80011aa:	370c      	adds	r7, #12
 80011ac:	46bd      	mov	sp, r7
 80011ae:	f85d 7b04 	ldr.w	r7, [sp], #4
 80011b2:	4770      	bx	lr

080011b4 <LL_USART_TransmitData8>:
 80011b4:	b480      	push	{r7}
 80011b6:	b083      	sub	sp, #12
 80011b8:	af00      	add	r7, sp, #0
 80011ba:	6078      	str	r0, [r7, #4]
 80011bc:	460b      	mov	r3, r1
 80011be:	70fb      	strb	r3, [r7, #3]
 80011c0:	78fa      	ldrb	r2, [r7, #3]
 80011c2:	687b      	ldr	r3, [r7, #4]
 80011c4:	605a      	str	r2, [r3, #4]
 80011c6:	bf00      	nop
 80011c8:	370c      	adds	r7, #12
 80011ca:	46bd      	mov	sp, r7
 80011cc:	f85d 7b04 	ldr.w	r7, [sp], #4
 80011d0:	4770      	bx	lr
	...

080011d4 <LL_APB2_GRP1_EnableClock>:
 80011d4:	b480      	push	{r7}
 80011d6:	b085      	sub	sp, #20
 80011d8:	af00      	add	r7, sp, #0
 80011da:	6078      	str	r0, [r7, #4]
 80011dc:	4b08      	ldr	r3, [pc, #32]	; (8001200 <LL_APB2_GRP1_EnableClock+0x2c>)
 80011de:	6c5a      	ldr	r2, [r3, #68]	; 0x44
 80011e0:	4907      	ldr	r1, [pc, #28]	; (8001200 <LL_APB2_GRP1_EnableClock+0x2c>)
 80011e2:	687b      	ldr	r3, [r7, #4]
 80011e4:	4313      	orrs	r3, r2
 80011e6:	644b      	str	r3, [r1, #68]	; 0x44
 80011e8:	4b05      	ldr	r3, [pc, #20]	; (8001200 <LL_APB2_GRP1_EnableClock+0x2c>)
 80011ea:	6c5a      	ldr	r2, [r3, #68]	; 0x44
 80011ec:	687b      	ldr	r3, [r7, #4]
 80011ee:	4013      	ands	r3, r2
 80011f0:	60fb      	str	r3, [r7, #12]
 80011f2:	68fb      	ldr	r3, [r7, #12]
 80011f4:	bf00      	nop
 80011f6:	3714      	adds	r7, #20
 80011f8:	46bd      	mov	sp, r7
 80011fa:	f85d 7b04 	ldr.w	r7, [sp], #4
 80011fe:	4770      	bx	lr
 8001200:	40023800 	.word	0x40023800

08001204 <LL_TIM_EnableCounter>:
 8001204:	b480      	push	{r7}
 8001206:	b083      	sub	sp, #12
 8001208:	af00      	add	r7, sp, #0
 800120a:	6078      	str	r0, [r7, #4]
 800120c:	687b      	ldr	r3, [r7, #4]
 800120e:	681b      	ldr	r3, [r3, #0]
 8001210:	f043 0201 	orr.w	r2, r3, #1
 8001214:	687b      	ldr	r3, [r7, #4]
 8001216:	601a      	str	r2, [r3, #0]
 8001218:	bf00      	nop
 800121a:	370c      	adds	r7, #12
 800121c:	46bd      	mov	sp, r7
 800121e:	f85d 7b04 	ldr.w	r7, [sp], #4
 8001222:	4770      	bx	lr

08001224 <LL_TIM_DisableCounter>:
 8001224:	b480      	push	{r7}
 8001226:	b083      	sub	sp, #12
 8001228:	af00      	add	r7, sp, #0
 800122a:	6078      	str	r0, [r7, #4]
 800122c:	687b      	ldr	r3, [r7, #4]
 800122e:	681b      	ldr	r3, [r3, #0]
 8001230:	f023 0201 	bic.w	r2, r3, #1
 8001234:	687b      	ldr	r3, [r7, #4]
 8001236:	601a      	str	r2, [r3, #0]
 8001238:	bf00      	nop
 800123a:	370c      	adds	r7, #12
 800123c:	46bd      	mov	sp, r7
 800123e:	f85d 7b04 	ldr.w	r7, [sp], #4
 8001242:	4770      	bx	lr

08001244 <LL_TIM_SetCounterMode>:
 8001244:	b480      	push	{r7}
 8001246:	b083      	sub	sp, #12
 8001248:	af00      	add	r7, sp, #0
 800124a:	6078      	str	r0, [r7, #4]
 800124c:	6039      	str	r1, [r7, #0]
 800124e:	687b      	ldr	r3, [r7, #4]
 8001250:	681b      	ldr	r3, [r3, #0]
 8001252:	f023 0270 	bic.w	r2, r3, #112	; 0x70
 8001256:	683b      	ldr	r3, [r7, #0]
 8001258:	431a      	orrs	r2, r3
 800125a:	687b      	ldr	r3, [r7, #4]
 800125c:	601a      	str	r2, [r3, #0]
 800125e:	bf00      	nop
 8001260:	370c      	adds	r7, #12
 8001262:	46bd      	mov	sp, r7
 8001264:	f85d 7b04 	ldr.w	r7, [sp], #4
 8001268:	4770      	bx	lr

0800126a <LL_TIM_SetPrescaler>:
 800126a:	b480      	push	{r7}
 800126c:	b083      	sub	sp, #12
 800126e:	af00      	add	r7, sp, #0
 8001270:	6078      	str	r0, [r7, #4]
 8001272:	6039      	str	r1, [r7, #0]
 8001274:	687b      	ldr	r3, [r7, #4]
 8001276:	683a      	ldr	r2, [r7, #0]
 8001278:	629a      	str	r2, [r3, #40]	; 0x28
 800127a:	bf00      	nop
 800127c:	370c      	adds	r7, #12
 800127e:	46bd      	mov	sp, r7
 8001280:	f85d 7b04 	ldr.w	r7, [sp], #4
 8001284:	4770      	bx	lr

08001286 <LL_TIM_SetAutoReload>:
 8001286:	b480      	push	{r7}
 8001288:	b083      	sub	sp, #12
 800128a:	af00      	add	r7, sp, #0
 800128c:	6078      	str	r0, [r7, #4]
 800128e:	6039      	str	r1, [r7, #0]
 8001290:	687b      	ldr	r3, [r7, #4]
 8001292:	683a      	ldr	r2, [r7, #0]
 8001294:	62da      	str	r2, [r3, #44]	; 0x2c
 8001296:	bf00      	nop
 8001298:	370c      	adds	r7, #12
 800129a:	46bd      	mov	sp, r7
 800129c:	f85d 7b04 	ldr.w	r7, [sp], #4
 80012a0:	4770      	bx	lr

080012a2 <LL_TIM_ClearFlag_UPDATE>:
 80012a2:	b480      	push	{r7}
 80012a4:	b083      	sub	sp, #12
 80012a6:	af00      	add	r7, sp, #0
 80012a8:	6078      	str	r0, [r7, #4]
 80012aa:	687b      	ldr	r3, [r7, #4]
 80012ac:	f06f 0201 	mvn.w	r2, #1
 80012b0:	611a      	str	r2, [r3, #16]
 80012b2:	bf00      	nop
 80012b4:	370c      	adds	r7, #12
 80012b6:	46bd      	mov	sp, r7
 80012b8:	f85d 7b04 	ldr.w	r7, [sp], #4
 80012bc:	4770      	bx	lr

080012be <LL_TIM_IsActiveFlag_UPDATE>:
 80012be:	b480      	push	{r7}
 80012c0:	b083      	sub	sp, #12
 80012c2:	af00      	add	r7, sp, #0
 80012c4:	6078      	str	r0, [r7, #4]
 80012c6:	687b      	ldr	r3, [r7, #4]
 80012c8:	691b      	ldr	r3, [r3, #16]
 80012ca:	f003 0301 	and.w	r3, r3, #1
 80012ce:	2b01      	cmp	r3, #1
 80012d0:	bf0c      	ite	eq
 80012d2:	2301      	moveq	r3, #1
 80012d4:	2300      	movne	r3, #0
 80012d6:	b2db      	uxtb	r3, r3
 80012d8:	4618      	mov	r0, r3
 80012da:	370c      	adds	r7, #12
 80012dc:	46bd      	mov	sp, r7
 80012de:	f85d 7b04 	ldr.w	r7, [sp], #4
 80012e2:	4770      	bx	lr

080012e4 <LL_TIM_EnableIT_UPDATE>:
 80012e4:	b480      	push	{r7}
 80012e6:	b083      	sub	sp, #12
 80012e8:	af00      	add	r7, sp, #0
 80012ea:	6078      	str	r0, [r7, #4]
 80012ec:	687b      	ldr	r3, [r7, #4]
 80012ee:	68db      	ldr	r3, [r3, #12]
 80012f0:	f043 0201 	orr.w	r2, r3, #1
 80012f4:	687b      	ldr	r3, [r7, #4]
 80012f6:	60da      	str	r2, [r3, #12]
 80012f8:	bf00      	nop
 80012fa:	370c      	adds	r7, #12
 80012fc:	46bd      	mov	sp, r7
 80012fe:	f85d 7b04 	ldr.w	r7, [sp], #4
 8001302:	4770      	bx	lr

08001304 <stm_driver_send_msg>:
 8001304:	b580      	push	{r7, lr}
 8001306:	b084      	sub	sp, #16
 8001308:	af00      	add	r7, sp, #0
 800130a:	6078      	str	r0, [r7, #4]
 800130c:	6039      	str	r1, [r7, #0]
 800130e:	2300      	movs	r3, #0
 8001310:	60fb      	str	r3, [r7, #12]
 8001312:	4813      	ldr	r0, [pc, #76]	; (8001360 <stm_driver_send_msg+0x5c>)
 8001314:	f7ff ff40 	bl	8001198 <LL_USART_ClearFlag_TC>
 8001318:	e011      	b.n	800133e <stm_driver_send_msg+0x3a>
 800131a:	bf00      	nop
 800131c:	4810      	ldr	r0, [pc, #64]	; (8001360 <stm_driver_send_msg+0x5c>)
 800131e:	f7ff ff28 	bl	8001172 <LL_USART_IsActiveFlag_TXE>
 8001322:	4603      	mov	r3, r0
 8001324:	2b00      	cmp	r3, #0
 8001326:	d0f9      	beq.n	800131c <stm_driver_send_msg+0x18>
 8001328:	68fb      	ldr	r3, [r7, #12]
 800132a:	1c5a      	adds	r2, r3, #1
 800132c:	60fa      	str	r2, [r7, #12]
 800132e:	461a      	mov	r2, r3
 8001330:	687b      	ldr	r3, [r7, #4]
 8001332:	4413      	add	r3, r2
 8001334:	781b      	ldrb	r3, [r3, #0]
 8001336:	4619      	mov	r1, r3
 8001338:	4809      	ldr	r0, [pc, #36]	; (8001360 <stm_driver_send_msg+0x5c>)
 800133a:	f7ff ff3b 	bl	80011b4 <LL_USART_TransmitData8>
 800133e:	683b      	ldr	r3, [r7, #0]
 8001340:	1e5a      	subs	r2, r3, #1
 8001342:	603a      	str	r2, [r7, #0]
 8001344:	2b00      	cmp	r3, #0
 8001346:	d1e8      	bne.n	800131a <stm_driver_send_msg+0x16>
 8001348:	bf00      	nop
 800134a:	4805      	ldr	r0, [pc, #20]	; (8001360 <stm_driver_send_msg+0x5c>)
 800134c:	f7ff fefe 	bl	800114c <LL_USART_IsActiveFlag_TC>
 8001350:	4603      	mov	r3, r0
 8001352:	2b00      	cmp	r3, #0
 8001354:	d0f9      	beq.n	800134a <stm_driver_send_msg+0x46>
 8001356:	bf00      	nop
 8001358:	3710      	adds	r7, #16
 800135a:	46bd      	mov	sp, r7
 800135c:	bd80      	pop	{r7, pc}
 800135e:	bf00      	nop
 8001360:	40011000 	.word	0x40011000

08001364 <manip_dyn_stop>:
 8001364:	b580      	push	{r7, lr}
 8001366:	b084      	sub	sp, #16
 8001368:	af00      	add	r7, sp, #0
 800136a:	1d3b      	adds	r3, r7, #4
 800136c:	2200      	movs	r2, #0
 800136e:	601a      	str	r2, [r3, #0]
 8001370:	605a      	str	r2, [r3, #4]
 8001372:	811a      	strh	r2, [r3, #8]
 8001374:	2302      	movs	r3, #2
 8001376:	713b      	strb	r3, [r7, #4]
 8001378:	1d3b      	adds	r3, r7, #4
 800137a:	210a      	movs	r1, #10
 800137c:	4618      	mov	r0, r3
 800137e:	f7ff ffc1 	bl	8001304 <stm_driver_send_msg>
 8001382:	bf00      	nop
 8001384:	3710      	adds	r7, #16
 8001386:	46bd      	mov	sp, r7
 8001388:	bd80      	pop	{r7, pc}
	...

0800138c <manip_hw_config>:
 800138c:	b580      	push	{r7, lr}
 800138e:	af00      	add	r7, sp, #0
 8001390:	2002      	movs	r0, #2
 8001392:	f7ff ff1f 	bl	80011d4 <LL_APB2_GRP1_EnableClock>
 8001396:	f240 31e7 	movw	r1, #999	; 0x3e7
 800139a:	480b      	ldr	r0, [pc, #44]	; (80013c8 <manip_hw_config+0x3c>)
 800139c:	f7ff ff73 	bl	8001286 <LL_TIM_SetAutoReload>
 80013a0:	21a7      	movs	r1, #167	; 0xa7
 80013a2:	4809      	ldr	r0, [pc, #36]	; (80013c8 <manip_hw_config+0x3c>)
 80013a4:	f7ff ff61 	bl	800126a <LL_TIM_SetPrescaler>
 80013a8:	2100      	movs	r1, #0
 80013aa:	4807      	ldr	r0, [pc, #28]	; (80013c8 <manip_hw_config+0x3c>)
 80013ac:	f7ff ff4a 	bl	8001244 <LL_TIM_SetCounterMode>
 80013b0:	4805      	ldr	r0, [pc, #20]	; (80013c8 <manip_hw_config+0x3c>)
 80013b2:	f7ff ff97 	bl	80012e4 <LL_TIM_EnableIT_UPDATE>
 80013b6:	2107      	movs	r1, #7
 80013b8:	202c      	movs	r0, #44	; 0x2c
 80013ba:	f7ff fe9d 	bl	80010f8 <NVIC_SetPriority>
 80013be:	202c      	movs	r0, #44	; 0x2c
 80013c0:	f7ff fe80 	bl	80010c4 <NVIC_EnableIRQ>
 80013c4:	bf00      	nop
 80013c6:	bd80      	pop	{r7, pc}
 80013c8:	40010400 	.word	0x40010400

080013cc <dyn_set_angle>:
 80013cc:	b5b0      	push	{r4, r5, r7, lr}
 80013ce:	b084      	sub	sp, #16
 80013d0:	af00      	add	r7, sp, #0
 80013d2:	4604      	mov	r4, r0
 80013d4:	4608      	mov	r0, r1
 80013d6:	4611      	mov	r1, r2
 80013d8:	461a      	mov	r2, r3
 80013da:	4623      	mov	r3, r4
 80013dc:	71fb      	strb	r3, [r7, #7]
 80013de:	4603      	mov	r3, r0
 80013e0:	71bb      	strb	r3, [r7, #6]
 80013e2:	460b      	mov	r3, r1
 80013e4:	80bb      	strh	r3, [r7, #4]
 80013e6:	4613      	mov	r3, r2
 80013e8:	807b      	strh	r3, [r7, #2]
 80013ea:	4b52      	ldr	r3, [pc, #328]	; (8001534 <dyn_set_angle+0x168>)
 80013ec:	6819      	ldr	r1, [r3, #0]
 80013ee:	79fa      	ldrb	r2, [r7, #7]
 80013f0:	4613      	mov	r3, r2
 80013f2:	00db      	lsls	r3, r3, #3
 80013f4:	1a9b      	subs	r3, r3, r2
 80013f6:	009b      	lsls	r3, r3, #2
 80013f8:	3328      	adds	r3, #40	; 0x28
 80013fa:	440b      	add	r3, r1
 80013fc:	3304      	adds	r3, #4
 80013fe:	60fb      	str	r3, [r7, #12]
 8001400:	f04f 0300 	mov.w	r3, #0
 8001404:	60bb      	str	r3, [r7, #8]
 8001406:	4b4b      	ldr	r3, [pc, #300]	; (8001534 <dyn_set_angle+0x168>)
 8001408:	681b      	ldr	r3, [r3, #0]
 800140a:	781a      	ldrb	r2, [r3, #0]
 800140c:	4b49      	ldr	r3, [pc, #292]	; (8001534 <dyn_set_angle+0x168>)
 800140e:	681b      	ldr	r3, [r3, #0]
 8001410:	3201      	adds	r2, #1
 8001412:	b2d2      	uxtb	r2, r2
 8001414:	701a      	strb	r2, [r3, #0]
 8001416:	68fb      	ldr	r3, [r7, #12]
 8001418:	79ba      	ldrb	r2, [r7, #6]
 800141a:	701a      	strb	r2, [r3, #0]
 800141c:	68fb      	ldr	r3, [r7, #12]
 800141e:	88ba      	ldrh	r2, [r7, #4]
 8001420:	809a      	strh	r2, [r3, #4]
 8001422:	4b44      	ldr	r3, [pc, #272]	; (8001534 <dyn_set_angle+0x168>)
 8001424:	681a      	ldr	r2, [r3, #0]
 8001426:	79bb      	ldrb	r3, [r7, #6]
 8001428:	3b01      	subs	r3, #1
 800142a:	3304      	adds	r3, #4
 800142c:	005b      	lsls	r3, r3, #1
 800142e:	4413      	add	r3, r2
 8001430:	889a      	ldrh	r2, [r3, #4]
 8001432:	68fb      	ldr	r3, [r7, #12]
 8001434:	805a      	strh	r2, [r3, #2]
 8001436:	4b3f      	ldr	r3, [pc, #252]	; (8001534 <dyn_set_angle+0x168>)
 8001438:	681a      	ldr	r2, [r3, #0]
 800143a:	79bb      	ldrb	r3, [r7, #6]
 800143c:	3b01      	subs	r3, #1
 800143e:	68f9      	ldr	r1, [r7, #12]
 8001440:	8889      	ldrh	r1, [r1, #4]
 8001442:	3304      	adds	r3, #4
 8001444:	005b      	lsls	r3, r3, #1
 8001446:	4413      	add	r3, r2
 8001448:	460a      	mov	r2, r1
 800144a:	809a      	strh	r2, [r3, #4]
 800144c:	68fb      	ldr	r3, [r7, #12]
 800144e:	887a      	ldrh	r2, [r7, #2]
 8001450:	80da      	strh	r2, [r3, #6]
 8001452:	68fb      	ldr	r3, [r7, #12]
 8001454:	2200      	movs	r2, #0
 8001456:	741a      	strb	r2, [r3, #16]
 8001458:	68fb      	ldr	r3, [r7, #12]
 800145a:	2200      	movs	r2, #0
 800145c:	745a      	strb	r2, [r3, #17]
 800145e:	68fb      	ldr	r3, [r7, #12]
 8001460:	885b      	ldrh	r3, [r3, #2]
 8001462:	2b00      	cmp	r3, #0
 8001464:	d103      	bne.n	800146e <dyn_set_angle+0xa2>
 8001466:	68fb      	ldr	r3, [r7, #12]
 8001468:	22c8      	movs	r2, #200	; 0xc8
 800146a:	609a      	str	r2, [r3, #8]
 800146c:	e043      	b.n	80014f6 <dyn_set_angle+0x12a>
 800146e:	68fb      	ldr	r3, [r7, #12]
 8001470:	889b      	ldrh	r3, [r3, #4]
 8001472:	461a      	mov	r2, r3
 8001474:	68fb      	ldr	r3, [r7, #12]
 8001476:	885b      	ldrh	r3, [r3, #2]
 8001478:	1ad3      	subs	r3, r2, r3
 800147a:	ee07 3a90 	vmov	s15, r3
 800147e:	eef8 7ae7 	vcvt.f32.s32	s15, s15
 8001482:	eef0 7ae7 	vabs.f32	s15, s15
 8001486:	ee17 0a90 	vmov	r0, s15
 800148a:	f7ff f805 	bl	8000498 <__aeabi_f2d>
 800148e:	4604      	mov	r4, r0
 8001490:	460d      	mov	r5, r1
 8001492:	68fb      	ldr	r3, [r7, #12]
 8001494:	88db      	ldrh	r3, [r3, #6]
 8001496:	ee07 3a90 	vmov	s15, r3
 800149a:	eef8 7a67 	vcvt.f32.u32	s15, s15
 800149e:	ee17 0a90 	vmov	r0, s15
 80014a2:	f7fe fff9 	bl	8000498 <__aeabi_f2d>
 80014a6:	4602      	mov	r2, r0
 80014a8:	460b      	mov	r3, r1
 80014aa:	4620      	mov	r0, r4
 80014ac:	4629      	mov	r1, r5
 80014ae:	f7ff f975 	bl	800079c <__aeabi_ddiv>
 80014b2:	4603      	mov	r3, r0
 80014b4:	460c      	mov	r4, r1
 80014b6:	4618      	mov	r0, r3
 80014b8:	4621      	mov	r1, r4
 80014ba:	f04f 0200 	mov.w	r2, #0
 80014be:	4b1e      	ldr	r3, [pc, #120]	; (8001538 <dyn_set_angle+0x16c>)
 80014c0:	f7ff f842 	bl	8000548 <__aeabi_dmul>
 80014c4:	4603      	mov	r3, r0
 80014c6:	460c      	mov	r4, r1
 80014c8:	4618      	mov	r0, r3
 80014ca:	4621      	mov	r1, r4
 80014cc:	f04f 0200 	mov.w	r2, #0
 80014d0:	4b1a      	ldr	r3, [pc, #104]	; (800153c <dyn_set_angle+0x170>)
 80014d2:	f7fe fe83 	bl	80001dc <__adddf3>
 80014d6:	4603      	mov	r3, r0
 80014d8:	460c      	mov	r4, r1
 80014da:	4618      	mov	r0, r3
 80014dc:	4621      	mov	r1, r4
 80014de:	f7ff fa45 	bl	800096c <__aeabi_d2f>
 80014e2:	4603      	mov	r3, r0
 80014e4:	60bb      	str	r3, [r7, #8]
 80014e6:	edd7 7a02 	vldr	s15, [r7, #8]
 80014ea:	eefc 7ae7 	vcvt.u32.f32	s15, s15
 80014ee:	ee17 2a90 	vmov	r2, s15
 80014f2:	68fb      	ldr	r3, [r7, #12]
 80014f4:	609a      	str	r2, [r3, #8]
 80014f6:	68fb      	ldr	r3, [r7, #12]
 80014f8:	2200      	movs	r2, #0
 80014fa:	749a      	strb	r2, [r3, #18]
 80014fc:	68fb      	ldr	r3, [r7, #12]
 80014fe:	79ba      	ldrb	r2, [r7, #6]
 8001500:	74da      	strb	r2, [r3, #19]
 8001502:	88bb      	ldrh	r3, [r7, #4]
 8001504:	b2da      	uxtb	r2, r3
 8001506:	68fb      	ldr	r3, [r7, #12]
 8001508:	751a      	strb	r2, [r3, #20]
 800150a:	88bb      	ldrh	r3, [r7, #4]
 800150c:	0a1b      	lsrs	r3, r3, #8
 800150e:	b29b      	uxth	r3, r3
 8001510:	b2da      	uxtb	r2, r3
 8001512:	68fb      	ldr	r3, [r7, #12]
 8001514:	755a      	strb	r2, [r3, #21]
 8001516:	887b      	ldrh	r3, [r7, #2]
 8001518:	b2da      	uxtb	r2, r3
 800151a:	68fb      	ldr	r3, [r7, #12]
 800151c:	759a      	strb	r2, [r3, #22]
 800151e:	887b      	ldrh	r3, [r7, #2]
 8001520:	0a1b      	lsrs	r3, r3, #8
 8001522:	b29b      	uxth	r3, r3
 8001524:	b2da      	uxtb	r2, r3
 8001526:	68fb      	ldr	r3, [r7, #12]
 8001528:	75da      	strb	r2, [r3, #23]
 800152a:	bf00      	nop
 800152c:	3710      	adds	r7, #16
 800152e:	46bd      	mov	sp, r7
 8001530:	bdb0      	pop	{r4, r5, r7, pc}
 8001532:	bf00      	nop
 8001534:	2000026c 	.word	0x2000026c
 8001538:	407b4000 	.word	0x407b4000
 800153c:	40240000 	.word	0x40240000

08001540 <dyn_update>:
 8001540:	b480      	push	{r7}
 8001542:	b083      	sub	sp, #12
 8001544:	af00      	add	r7, sp, #0
 8001546:	2300      	movs	r3, #0
 8001548:	607b      	str	r3, [r7, #4]
 800154a:	4b38      	ldr	r3, [pc, #224]	; (800162c <dyn_update+0xec>)
 800154c:	681b      	ldr	r3, [r3, #0]
 800154e:	332c      	adds	r3, #44	; 0x2c
 8001550:	603b      	str	r3, [r7, #0]
 8001552:	4b36      	ldr	r3, [pc, #216]	; (800162c <dyn_update+0xec>)
 8001554:	681b      	ldr	r3, [r3, #0]
 8001556:	789b      	ldrb	r3, [r3, #2]
 8001558:	607b      	str	r3, [r7, #4]
 800155a:	e05a      	b.n	8001612 <dyn_update+0xd2>
 800155c:	4b33      	ldr	r3, [pc, #204]	; (800162c <dyn_update+0xec>)
 800155e:	681b      	ldr	r3, [r3, #0]
 8001560:	6899      	ldr	r1, [r3, #8]
 8001562:	687a      	ldr	r2, [r7, #4]
 8001564:	4613      	mov	r3, r2
 8001566:	00db      	lsls	r3, r3, #3
 8001568:	1a9b      	subs	r3, r3, r2
 800156a:	009b      	lsls	r3, r3, #2
 800156c:	461a      	mov	r2, r3
 800156e:	683b      	ldr	r3, [r7, #0]
 8001570:	4413      	add	r3, r2
 8001572:	68db      	ldr	r3, [r3, #12]
 8001574:	1ac9      	subs	r1, r1, r3
 8001576:	687a      	ldr	r2, [r7, #4]
 8001578:	4613      	mov	r3, r2
 800157a:	00db      	lsls	r3, r3, #3
 800157c:	1a9b      	subs	r3, r3, r2
 800157e:	009b      	lsls	r3, r3, #2
 8001580:	461a      	mov	r2, r3
 8001582:	683b      	ldr	r3, [r7, #0]
 8001584:	4413      	add	r3, r2
 8001586:	689b      	ldr	r3, [r3, #8]
 8001588:	4299      	cmp	r1, r3
 800158a:	d33f      	bcc.n	800160c <dyn_update+0xcc>
 800158c:	687a      	ldr	r2, [r7, #4]
 800158e:	4613      	mov	r3, r2
 8001590:	00db      	lsls	r3, r3, #3
 8001592:	1a9b      	subs	r3, r3, r2
 8001594:	009b      	lsls	r3, r3, #2
 8001596:	461a      	mov	r2, r3
 8001598:	683b      	ldr	r3, [r7, #0]
 800159a:	4413      	add	r3, r2
 800159c:	7c1b      	ldrb	r3, [r3, #16]
 800159e:	2b00      	cmp	r3, #0
 80015a0:	d034      	beq.n	800160c <dyn_update+0xcc>
 80015a2:	687a      	ldr	r2, [r7, #4]
 80015a4:	4613      	mov	r3, r2
 80015a6:	00db      	lsls	r3, r3, #3
 80015a8:	1a9b      	subs	r3, r3, r2
 80015aa:	009b      	lsls	r3, r3, #2
 80015ac:	461a      	mov	r2, r3
 80015ae:	683b      	ldr	r3, [r7, #0]
 80015b0:	1899      	adds	r1, r3, r2
 80015b2:	687a      	ldr	r2, [r7, #4]
 80015b4:	4613      	mov	r3, r2
 80015b6:	00db      	lsls	r3, r3, #3
 80015b8:	1a9b      	subs	r3, r3, r2
 80015ba:	009b      	lsls	r3, r3, #2
 80015bc:	461a      	mov	r2, r3
 80015be:	683b      	ldr	r3, [r7, #0]
 80015c0:	4413      	add	r3, r2
 80015c2:	888a      	ldrh	r2, [r1, #4]
 80015c4:	805a      	strh	r2, [r3, #2]
 80015c6:	687a      	ldr	r2, [r7, #4]
 80015c8:	4613      	mov	r3, r2
 80015ca:	00db      	lsls	r3, r3, #3
 80015cc:	1a9b      	subs	r3, r3, r2
 80015ce:	009b      	lsls	r3, r3, #2
 80015d0:	461a      	mov	r2, r3
 80015d2:	683b      	ldr	r3, [r7, #0]
 80015d4:	4413      	add	r3, r2
 80015d6:	2201      	movs	r2, #1
 80015d8:	745a      	strb	r2, [r3, #17]
 80015da:	4b14      	ldr	r3, [pc, #80]	; (800162c <dyn_update+0xec>)
 80015dc:	681b      	ldr	r3, [r3, #0]
 80015de:	78db      	ldrb	r3, [r3, #3]
 80015e0:	b259      	sxtb	r1, r3
 80015e2:	687a      	ldr	r2, [r7, #4]
 80015e4:	4613      	mov	r3, r2
 80015e6:	00db      	lsls	r3, r3, #3
 80015e8:	1a9b      	subs	r3, r3, r2
 80015ea:	009b      	lsls	r3, r3, #2
 80015ec:	461a      	mov	r2, r3
 80015ee:	683b      	ldr	r3, [r7, #0]
 80015f0:	4413      	add	r3, r2
 80015f2:	781b      	ldrb	r3, [r3, #0]
 80015f4:	461a      	mov	r2, r3
 80015f6:	2301      	movs	r3, #1
 80015f8:	4093      	lsls	r3, r2
 80015fa:	b25b      	sxtb	r3, r3
 80015fc:	43db      	mvns	r3, r3
 80015fe:	b25b      	sxtb	r3, r3
 8001600:	400b      	ands	r3, r1
 8001602:	b25a      	sxtb	r2, r3
 8001604:	4b09      	ldr	r3, [pc, #36]	; (800162c <dyn_update+0xec>)
 8001606:	681b      	ldr	r3, [r3, #0]
 8001608:	b2d2      	uxtb	r2, r2
 800160a:	70da      	strb	r2, [r3, #3]
 800160c:	687b      	ldr	r3, [r7, #4]
 800160e:	3301      	adds	r3, #1
 8001610:	607b      	str	r3, [r7, #4]
 8001612:	4b06      	ldr	r3, [pc, #24]	; (800162c <dyn_update+0xec>)
 8001614:	681b      	ldr	r3, [r3, #0]
 8001616:	785b      	ldrb	r3, [r3, #1]
 8001618:	461a      	mov	r2, r3
 800161a:	687b      	ldr	r3, [r7, #4]
 800161c:	4293      	cmp	r3, r2
 800161e:	dd9d      	ble.n	800155c <dyn_update+0x1c>
 8001620:	bf00      	nop
 8001622:	370c      	adds	r7, #12
 8001624:	46bd      	mov	sp, r7
 8001626:	f85d 7b04 	ldr.w	r7, [sp], #4
 800162a:	4770      	bx	lr
 800162c:	2000026c 	.word	0x2000026c

08001630 <cmd_update>:
 8001630:	b480      	push	{r7}
 8001632:	b083      	sub	sp, #12
 8001634:	af00      	add	r7, sp, #0
 8001636:	2300      	movs	r3, #0
 8001638:	607b      	str	r3, [r7, #4]
 800163a:	4b16      	ldr	r3, [pc, #88]	; (8001694 <cmd_update+0x64>)
 800163c:	681b      	ldr	r3, [r3, #0]
 800163e:	332c      	adds	r3, #44	; 0x2c
 8001640:	603b      	str	r3, [r7, #0]
 8001642:	4b14      	ldr	r3, [pc, #80]	; (8001694 <cmd_update+0x64>)
 8001644:	681b      	ldr	r3, [r3, #0]
 8001646:	789b      	ldrb	r3, [r3, #2]
 8001648:	607b      	str	r3, [r7, #4]
 800164a:	e013      	b.n	8001674 <cmd_update+0x44>
 800164c:	687a      	ldr	r2, [r7, #4]
 800164e:	4613      	mov	r3, r2
 8001650:	00db      	lsls	r3, r3, #3
 8001652:	1a9b      	subs	r3, r3, r2
 8001654:	009b      	lsls	r3, r3, #2
 8001656:	461a      	mov	r2, r3
 8001658:	683b      	ldr	r3, [r7, #0]
 800165a:	4413      	add	r3, r2
 800165c:	7c5b      	ldrb	r3, [r3, #17]
 800165e:	2b01      	cmp	r3, #1
 8001660:	d110      	bne.n	8001684 <cmd_update+0x54>
 8001662:	4b0c      	ldr	r3, [pc, #48]	; (8001694 <cmd_update+0x64>)
 8001664:	681b      	ldr	r3, [r3, #0]
 8001666:	789a      	ldrb	r2, [r3, #2]
 8001668:	3201      	adds	r2, #1
 800166a:	b2d2      	uxtb	r2, r2
 800166c:	709a      	strb	r2, [r3, #2]
 800166e:	687b      	ldr	r3, [r7, #4]
 8001670:	3301      	adds	r3, #1
 8001672:	607b      	str	r3, [r7, #4]
 8001674:	4b07      	ldr	r3, [pc, #28]	; (8001694 <cmd_update+0x64>)
 8001676:	681b      	ldr	r3, [r3, #0]
 8001678:	785b      	ldrb	r3, [r3, #1]
 800167a:	461a      	mov	r2, r3
 800167c:	687b      	ldr	r3, [r7, #4]
 800167e:	4293      	cmp	r3, r2
 8001680:	dde4      	ble.n	800164c <cmd_update+0x1c>
 8001682:	e000      	b.n	8001686 <cmd_update+0x56>
 8001684:	bf00      	nop
 8001686:	bf00      	nop
 8001688:	370c      	adds	r7, #12
 800168a:	46bd      	mov	sp, r7
 800168c:	f85d 7b04 	ldr.w	r7, [sp], #4
 8001690:	4770      	bx	lr
 8001692:	bf00      	nop
 8001694:	2000026c 	.word	0x2000026c

08001698 <dyn_time_slice_operator>:
 8001698:	b580      	push	{r7, lr}
 800169a:	b084      	sub	sp, #16
 800169c:	af00      	add	r7, sp, #0
 800169e:	6078      	str	r0, [r7, #4]
 80016a0:	687b      	ldr	r3, [r7, #4]
 80016a2:	332c      	adds	r3, #44	; 0x2c
 80016a4:	60fb      	str	r3, [r7, #12]
 80016a6:	f7ff ff4b 	bl	8001540 <dyn_update>
 80016aa:	687b      	ldr	r3, [r7, #4]
 80016ac:	785b      	ldrb	r3, [r3, #1]
 80016ae:	461a      	mov	r2, r3
 80016b0:	4613      	mov	r3, r2
 80016b2:	00db      	lsls	r3, r3, #3
 80016b4:	1a9b      	subs	r3, r3, r2
 80016b6:	009b      	lsls	r3, r3, #2
 80016b8:	461a      	mov	r2, r3
 80016ba:	68fb      	ldr	r3, [r7, #12]
 80016bc:	4413      	add	r3, r2
 80016be:	7c1b      	ldrb	r3, [r3, #16]
 80016c0:	2b00      	cmp	r3, #0
 80016c2:	d163      	bne.n	800178c <dyn_time_slice_operator+0xf4>
 80016c4:	687b      	ldr	r3, [r7, #4]
 80016c6:	78db      	ldrb	r3, [r3, #3]
 80016c8:	4619      	mov	r1, r3
 80016ca:	687b      	ldr	r3, [r7, #4]
 80016cc:	785b      	ldrb	r3, [r3, #1]
 80016ce:	461a      	mov	r2, r3
 80016d0:	4613      	mov	r3, r2
 80016d2:	00db      	lsls	r3, r3, #3
 80016d4:	1a9b      	subs	r3, r3, r2
 80016d6:	009b      	lsls	r3, r3, #2
 80016d8:	461a      	mov	r2, r3
 80016da:	68fb      	ldr	r3, [r7, #12]
 80016dc:	4413      	add	r3, r2
 80016de:	781b      	ldrb	r3, [r3, #0]
 80016e0:	fa41 f303 	asr.w	r3, r1, r3
 80016e4:	f003 0301 	and.w	r3, r3, #1
 80016e8:	2b00      	cmp	r3, #0
 80016ea:	d14f      	bne.n	800178c <dyn_time_slice_operator+0xf4>
 80016ec:	687b      	ldr	r3, [r7, #4]
 80016ee:	785b      	ldrb	r3, [r3, #1]
 80016f0:	461a      	mov	r2, r3
 80016f2:	4613      	mov	r3, r2
 80016f4:	00db      	lsls	r3, r3, #3
 80016f6:	1a9b      	subs	r3, r3, r2
 80016f8:	009b      	lsls	r3, r3, #2
 80016fa:	461a      	mov	r2, r3
 80016fc:	68fb      	ldr	r3, [r7, #12]
 80016fe:	4413      	add	r3, r2
 8001700:	2201      	movs	r2, #1
 8001702:	741a      	strb	r2, [r3, #16]
 8001704:	687b      	ldr	r3, [r7, #4]
 8001706:	785b      	ldrb	r3, [r3, #1]
 8001708:	461a      	mov	r2, r3
 800170a:	4613      	mov	r3, r2
 800170c:	00db      	lsls	r3, r3, #3
 800170e:	1a9b      	subs	r3, r3, r2
 8001710:	009b      	lsls	r3, r3, #2
 8001712:	461a      	mov	r2, r3
 8001714:	68fb      	ldr	r3, [r7, #12]
 8001716:	4413      	add	r3, r2
 8001718:	3312      	adds	r3, #18
 800171a:	210a      	movs	r1, #10
 800171c:	4618      	mov	r0, r3
 800171e:	f7ff fdf1 	bl	8001304 <stm_driver_send_msg>
 8001722:	687b      	ldr	r3, [r7, #4]
 8001724:	785b      	ldrb	r3, [r3, #1]
 8001726:	461a      	mov	r2, r3
 8001728:	4613      	mov	r3, r2
 800172a:	00db      	lsls	r3, r3, #3
 800172c:	1a9b      	subs	r3, r3, r2
 800172e:	009b      	lsls	r3, r3, #2
 8001730:	461a      	mov	r2, r3
 8001732:	68fb      	ldr	r3, [r7, #12]
 8001734:	4413      	add	r3, r2
 8001736:	687a      	ldr	r2, [r7, #4]
 8001738:	6892      	ldr	r2, [r2, #8]
 800173a:	60da      	str	r2, [r3, #12]
 800173c:	687b      	ldr	r3, [r7, #4]
 800173e:	78db      	ldrb	r3, [r3, #3]
 8001740:	b25a      	sxtb	r2, r3
 8001742:	687b      	ldr	r3, [r7, #4]
 8001744:	785b      	ldrb	r3, [r3, #1]
 8001746:	4619      	mov	r1, r3
 8001748:	460b      	mov	r3, r1
 800174a:	00db      	lsls	r3, r3, #3
 800174c:	1a5b      	subs	r3, r3, r1
 800174e:	009b      	lsls	r3, r3, #2
 8001750:	4619      	mov	r1, r3
 8001752:	68fb      	ldr	r3, [r7, #12]
 8001754:	440b      	add	r3, r1
 8001756:	781b      	ldrb	r3, [r3, #0]
 8001758:	4619      	mov	r1, r3
 800175a:	2301      	movs	r3, #1
 800175c:	408b      	lsls	r3, r1
 800175e:	b25b      	sxtb	r3, r3
 8001760:	4313      	orrs	r3, r2
 8001762:	b25b      	sxtb	r3, r3
 8001764:	b2da      	uxtb	r2, r3
 8001766:	687b      	ldr	r3, [r7, #4]
 8001768:	70da      	strb	r2, [r3, #3]
 800176a:	687b      	ldr	r3, [r7, #4]
 800176c:	785b      	ldrb	r3, [r3, #1]
 800176e:	461a      	mov	r2, r3
 8001770:	687b      	ldr	r3, [r7, #4]
 8001772:	781b      	ldrb	r3, [r3, #0]
 8001774:	3b01      	subs	r3, #1
 8001776:	429a      	cmp	r2, r3
 8001778:	d008      	beq.n	800178c <dyn_time_slice_operator+0xf4>
 800177a:	687b      	ldr	r3, [r7, #4]
 800177c:	785b      	ldrb	r3, [r3, #1]
 800177e:	3301      	adds	r3, #1
 8001780:	b2da      	uxtb	r2, r3
 8001782:	687b      	ldr	r3, [r7, #4]
 8001784:	705a      	strb	r2, [r3, #1]
 8001786:	200a      	movs	r0, #10
 8001788:	f004 fd46 	bl	8006218 <vTaskDelay>
 800178c:	f7ff ff50 	bl	8001630 <cmd_update>
 8001790:	bf00      	nop
 8001792:	3710      	adds	r7, #16
 8001794:	46bd      	mov	sp, r7
 8001796:	bd80      	pop	{r7, pc}

08001798 <dyn_set_speeds>:
 8001798:	b580      	push	{r7, lr}
 800179a:	b088      	sub	sp, #32
 800179c:	af00      	add	r7, sp, #0
 800179e:	2300      	movs	r3, #0
 80017a0:	61fb      	str	r3, [r7, #28]
 80017a2:	2300      	movs	r3, #0
 80017a4:	61bb      	str	r3, [r7, #24]
 80017a6:	1d3b      	adds	r3, r7, #4
 80017a8:	2213      	movs	r2, #19
 80017aa:	2100      	movs	r1, #0
 80017ac:	4618      	mov	r0, r3
 80017ae:	f007 f994 	bl	8008ada <memset>
 80017b2:	2301      	movs	r3, #1
 80017b4:	713b      	strb	r3, [r7, #4]
 80017b6:	2300      	movs	r3, #0
 80017b8:	61fb      	str	r3, [r7, #28]
 80017ba:	2301      	movs	r3, #1
 80017bc:	61bb      	str	r3, [r7, #24]
 80017be:	e023      	b.n	8001808 <dyn_set_speeds+0x70>
 80017c0:	4b17      	ldr	r3, [pc, #92]	; (8001820 <dyn_set_speeds+0x88>)
 80017c2:	681a      	ldr	r2, [r3, #0]
 80017c4:	69fb      	ldr	r3, [r7, #28]
 80017c6:	330c      	adds	r3, #12
 80017c8:	005b      	lsls	r3, r3, #1
 80017ca:	4413      	add	r3, r2
 80017cc:	889b      	ldrh	r3, [r3, #4]
 80017ce:	0a1b      	lsrs	r3, r3, #8
 80017d0:	b29b      	uxth	r3, r3
 80017d2:	b2d9      	uxtb	r1, r3
 80017d4:	1d3a      	adds	r2, r7, #4
 80017d6:	69bb      	ldr	r3, [r7, #24]
 80017d8:	4413      	add	r3, r2
 80017da:	460a      	mov	r2, r1
 80017dc:	701a      	strb	r2, [r3, #0]
 80017de:	4b10      	ldr	r3, [pc, #64]	; (8001820 <dyn_set_speeds+0x88>)
 80017e0:	681a      	ldr	r2, [r3, #0]
 80017e2:	69fb      	ldr	r3, [r7, #28]
 80017e4:	330c      	adds	r3, #12
 80017e6:	005b      	lsls	r3, r3, #1
 80017e8:	4413      	add	r3, r2
 80017ea:	889a      	ldrh	r2, [r3, #4]
 80017ec:	69bb      	ldr	r3, [r7, #24]
 80017ee:	3301      	adds	r3, #1
 80017f0:	b2d2      	uxtb	r2, r2
 80017f2:	f107 0120 	add.w	r1, r7, #32
 80017f6:	440b      	add	r3, r1
 80017f8:	f803 2c1c 	strb.w	r2, [r3, #-28]
 80017fc:	69fb      	ldr	r3, [r7, #28]
 80017fe:	3301      	adds	r3, #1
 8001800:	61fb      	str	r3, [r7, #28]
 8001802:	69bb      	ldr	r3, [r7, #24]
 8001804:	3302      	adds	r3, #2
 8001806:	61bb      	str	r3, [r7, #24]
 8001808:	69fb      	ldr	r3, [r7, #28]
 800180a:	2b07      	cmp	r3, #7
 800180c:	ddd8      	ble.n	80017c0 <dyn_set_speeds+0x28>
 800180e:	1d3b      	adds	r3, r7, #4
 8001810:	2112      	movs	r1, #18
 8001812:	4618      	mov	r0, r3
 8001814:	f7ff fd76 	bl	8001304 <stm_driver_send_msg>
 8001818:	bf00      	nop
 800181a:	3720      	adds	r7, #32
 800181c:	46bd      	mov	sp, r7
 800181e:	bd80      	pop	{r7, pc}
 8001820:	2000026c 	.word	0x2000026c

08001824 <dyn_set_init_pos>:
 8001824:	b580      	push	{r7, lr}
 8001826:	b088      	sub	sp, #32
 8001828:	af00      	add	r7, sp, #0
 800182a:	2300      	movs	r3, #0
 800182c:	61fb      	str	r3, [r7, #28]
 800182e:	2300      	movs	r3, #0
 8001830:	61bb      	str	r3, [r7, #24]
 8001832:	1d3b      	adds	r3, r7, #4
 8001834:	2213      	movs	r2, #19
 8001836:	2100      	movs	r1, #0
 8001838:	4618      	mov	r0, r3
 800183a:	f007 f94e 	bl	8008ada <memset>
 800183e:	2303      	movs	r3, #3
 8001840:	713b      	strb	r3, [r7, #4]
 8001842:	2300      	movs	r3, #0
 8001844:	61fb      	str	r3, [r7, #28]
 8001846:	2301      	movs	r3, #1
 8001848:	61bb      	str	r3, [r7, #24]
 800184a:	e023      	b.n	8001894 <dyn_set_init_pos+0x70>
 800184c:	4b17      	ldr	r3, [pc, #92]	; (80018ac <dyn_set_init_pos+0x88>)
 800184e:	681a      	ldr	r2, [r3, #0]
 8001850:	69fb      	ldr	r3, [r7, #28]
 8001852:	3304      	adds	r3, #4
 8001854:	005b      	lsls	r3, r3, #1
 8001856:	4413      	add	r3, r2
 8001858:	889b      	ldrh	r3, [r3, #4]
 800185a:	0a1b      	lsrs	r3, r3, #8
 800185c:	b29b      	uxth	r3, r3
 800185e:	b2d9      	uxtb	r1, r3
 8001860:	1d3a      	adds	r2, r7, #4
 8001862:	69bb      	ldr	r3, [r7, #24]
 8001864:	4413      	add	r3, r2
 8001866:	460a      	mov	r2, r1
 8001868:	701a      	strb	r2, [r3, #0]
 800186a:	4b10      	ldr	r3, [pc, #64]	; (80018ac <dyn_set_init_pos+0x88>)
 800186c:	681a      	ldr	r2, [r3, #0]
 800186e:	69fb      	ldr	r3, [r7, #28]
 8001870:	3304      	adds	r3, #4
 8001872:	005b      	lsls	r3, r3, #1
 8001874:	4413      	add	r3, r2
 8001876:	889a      	ldrh	r2, [r3, #4]
 8001878:	69bb      	ldr	r3, [r7, #24]
 800187a:	3301      	adds	r3, #1
 800187c:	b2d2      	uxtb	r2, r2
 800187e:	f107 0120 	add.w	r1, r7, #32
 8001882:	440b      	add	r3, r1
 8001884:	f803 2c1c 	strb.w	r2, [r3, #-28]
 8001888:	69fb      	ldr	r3, [r7, #28]
 800188a:	3301      	adds	r3, #1
 800188c:	61fb      	str	r3, [r7, #28]
 800188e:	69bb      	ldr	r3, [r7, #24]
 8001890:	3302      	adds	r3, #2
 8001892:	61bb      	str	r3, [r7, #24]
 8001894:	69fb      	ldr	r3, [r7, #28]
 8001896:	2b07      	cmp	r3, #7
 8001898:	ddd8      	ble.n	800184c <dyn_set_init_pos+0x28>
 800189a:	1d3b      	adds	r3, r7, #4
 800189c:	2112      	movs	r1, #18
 800189e:	4618      	mov	r0, r3
 80018a0:	f7ff fd30 	bl	8001304 <stm_driver_send_msg>
 80018a4:	bf00      	nop
 80018a6:	3720      	adds	r7, #32
 80018a8:	46bd      	mov	sp, r7
 80018aa:	bd80      	pop	{r7, pc}
 80018ac:	2000026c 	.word	0x2000026c

080018b0 <manipulators_block>:
 80018b0:	b580      	push	{r7, lr}
 80018b2:	af00      	add	r7, sp, #0
 80018b4:	f7ff fd56 	bl	8001364 <manip_dyn_stop>
 80018b8:	4b05      	ldr	r3, [pc, #20]	; (80018d0 <manipulators_block+0x20>)
 80018ba:	681b      	ldr	r3, [r3, #0]
 80018bc:	791a      	ldrb	r2, [r3, #4]
 80018be:	4b04      	ldr	r3, [pc, #16]	; (80018d0 <manipulators_block+0x20>)
 80018c0:	681b      	ldr	r3, [r3, #0]
 80018c2:	f042 0202 	orr.w	r2, r2, #2
 80018c6:	b2d2      	uxtb	r2, r2
 80018c8:	711a      	strb	r2, [r3, #4]
 80018ca:	bf00      	nop
 80018cc:	bd80      	pop	{r7, pc}
 80018ce:	bf00      	nop
 80018d0:	2000026c 	.word	0x2000026c

080018d4 <manipulators_manager>:
 80018d4:	b590      	push	{r4, r7, lr}
 80018d6:	b0e1      	sub	sp, #388	; 0x184
 80018d8:	af00      	add	r7, sp, #0
 80018da:	1d3b      	adds	r3, r7, #4
 80018dc:	6018      	str	r0, [r3, #0]
 80018de:	2300      	movs	r3, #0
 80018e0:	f8c7 317c 	str.w	r3, [r7, #380]	; 0x17c
 80018e4:	f107 0318 	add.w	r3, r7, #24
 80018e8:	4a87      	ldr	r2, [pc, #540]	; (8001b08 <manipulators_manager+0x234>)
 80018ea:	461c      	mov	r4, r3
 80018ec:	4613      	mov	r3, r2
 80018ee:	cb0f      	ldmia	r3, {r0, r1, r2, r3}
 80018f0:	e884 000f 	stmia.w	r4, {r0, r1, r2, r3}
 80018f4:	f107 0308 	add.w	r3, r7, #8
 80018f8:	4a84      	ldr	r2, [pc, #528]	; (8001b0c <manipulators_manager+0x238>)
 80018fa:	461c      	mov	r4, r3
 80018fc:	4613      	mov	r3, r2
 80018fe:	cb0f      	ldmia	r3, {r0, r1, r2, r3}
 8001900:	e884 000f 	stmia.w	r4, {r0, r1, r2, r3}
 8001904:	f005 f948 	bl	8006b98 <xTaskGetCurrentTaskHandle>
 8001908:	4602      	mov	r2, r0
 800190a:	f107 0328 	add.w	r3, r7, #40	; 0x28
 800190e:	f8c3 2150 	str.w	r2, [r3, #336]	; 0x150
 8001912:	f107 0328 	add.w	r3, r7, #40	; 0x28
 8001916:	2200      	movs	r2, #0
 8001918:	70da      	strb	r2, [r3, #3]
 800191a:	f107 0328 	add.w	r3, r7, #40	; 0x28
 800191e:	2200      	movs	r2, #0
 8001920:	711a      	strb	r2, [r3, #4]
 8001922:	f107 0328 	add.w	r3, r7, #40	; 0x28
 8001926:	2200      	movs	r2, #0
 8001928:	609a      	str	r2, [r3, #8]
 800192a:	f107 0328 	add.w	r3, r7, #40	; 0x28
 800192e:	2200      	movs	r2, #0
 8001930:	701a      	strb	r2, [r3, #0]
 8001932:	f107 0328 	add.w	r3, r7, #40	; 0x28
 8001936:	2200      	movs	r2, #0
 8001938:	705a      	strb	r2, [r3, #1]
 800193a:	f107 0328 	add.w	r3, r7, #40	; 0x28
 800193e:	2200      	movs	r2, #0
 8001940:	709a      	strb	r2, [r3, #2]
 8001942:	2300      	movs	r3, #0
 8001944:	f8c7 317c 	str.w	r3, [r7, #380]	; 0x17c
 8001948:	e02b      	b.n	80019a2 <manipulators_manager+0xce>
 800194a:	f107 0228 	add.w	r2, r7, #40	; 0x28
 800194e:	f8d7 317c 	ldr.w	r3, [r7, #380]	; 0x17c
 8001952:	3304      	adds	r3, #4
 8001954:	005b      	lsls	r3, r3, #1
 8001956:	4413      	add	r3, r2
 8001958:	2200      	movs	r2, #0
 800195a:	809a      	strh	r2, [r3, #4]
 800195c:	f107 0318 	add.w	r3, r7, #24
 8001960:	f8d7 217c 	ldr.w	r2, [r7, #380]	; 0x17c
 8001964:	f833 1012 	ldrh.w	r1, [r3, r2, lsl #1]
 8001968:	f107 0228 	add.w	r2, r7, #40	; 0x28
 800196c:	f8d7 317c 	ldr.w	r3, [r7, #380]	; 0x17c
 8001970:	330c      	adds	r3, #12
 8001972:	005b      	lsls	r3, r3, #1
 8001974:	4413      	add	r3, r2
 8001976:	460a      	mov	r2, r1
 8001978:	809a      	strh	r2, [r3, #4]
 800197a:	f107 0308 	add.w	r3, r7, #8
 800197e:	f8d7 217c 	ldr.w	r2, [r7, #380]	; 0x17c
 8001982:	f833 1012 	ldrh.w	r1, [r3, r2, lsl #1]
 8001986:	f107 0228 	add.w	r2, r7, #40	; 0x28
 800198a:	f8d7 317c 	ldr.w	r3, [r7, #380]	; 0x17c
 800198e:	3304      	adds	r3, #4
 8001990:	005b      	lsls	r3, r3, #1
 8001992:	4413      	add	r3, r2
 8001994:	460a      	mov	r2, r1
 8001996:	809a      	strh	r2, [r3, #4]
 8001998:	f8d7 317c 	ldr.w	r3, [r7, #380]	; 0x17c
 800199c:	3301      	adds	r3, #1
 800199e:	f8c7 317c 	str.w	r3, [r7, #380]	; 0x17c
 80019a2:	f8d7 317c 	ldr.w	r3, [r7, #380]	; 0x17c
 80019a6:	2b07      	cmp	r3, #7
 80019a8:	ddcf      	ble.n	800194a <manipulators_manager+0x76>
 80019aa:	2300      	movs	r3, #0
 80019ac:	f8c7 317c 	str.w	r3, [r7, #380]	; 0x17c
 80019b0:	e050      	b.n	8001a54 <manipulators_manager+0x180>
 80019b2:	f107 0128 	add.w	r1, r7, #40	; 0x28
 80019b6:	f8d7 217c 	ldr.w	r2, [r7, #380]	; 0x17c
 80019ba:	4613      	mov	r3, r2
 80019bc:	00db      	lsls	r3, r3, #3
 80019be:	1a9b      	subs	r3, r3, r2
 80019c0:	009b      	lsls	r3, r3, #2
 80019c2:	3338      	adds	r3, #56	; 0x38
 80019c4:	440b      	add	r3, r1
 80019c6:	3306      	adds	r3, #6
 80019c8:	220a      	movs	r2, #10
 80019ca:	2100      	movs	r1, #0
 80019cc:	4618      	mov	r0, r3
 80019ce:	f007 f884 	bl	8008ada <memset>
 80019d2:	f107 0128 	add.w	r1, r7, #40	; 0x28
 80019d6:	f8d7 217c 	ldr.w	r2, [r7, #380]	; 0x17c
 80019da:	4613      	mov	r3, r2
 80019dc:	00db      	lsls	r3, r3, #3
 80019de:	1a9b      	subs	r3, r3, r2
 80019e0:	009b      	lsls	r3, r3, #2
 80019e2:	440b      	add	r3, r1
 80019e4:	3330      	adds	r3, #48	; 0x30
 80019e6:	2200      	movs	r2, #0
 80019e8:	801a      	strh	r2, [r3, #0]
 80019ea:	f107 0128 	add.w	r1, r7, #40	; 0x28
 80019ee:	f8d7 217c 	ldr.w	r2, [r7, #380]	; 0x17c
 80019f2:	4613      	mov	r3, r2
 80019f4:	00db      	lsls	r3, r3, #3
 80019f6:	1a9b      	subs	r3, r3, r2
 80019f8:	009b      	lsls	r3, r3, #2
 80019fa:	440b      	add	r3, r1
 80019fc:	332e      	adds	r3, #46	; 0x2e
 80019fe:	2200      	movs	r2, #0
 8001a00:	801a      	strh	r2, [r3, #0]
 8001a02:	f107 0128 	add.w	r1, r7, #40	; 0x28
 8001a06:	f8d7 217c 	ldr.w	r2, [r7, #380]	; 0x17c
 8001a0a:	4613      	mov	r3, r2
 8001a0c:	00db      	lsls	r3, r3, #3
 8001a0e:	1a9b      	subs	r3, r3, r2
 8001a10:	009b      	lsls	r3, r3, #2
 8001a12:	440b      	add	r3, r1
 8001a14:	3338      	adds	r3, #56	; 0x38
 8001a16:	2200      	movs	r2, #0
 8001a18:	601a      	str	r2, [r3, #0]
 8001a1a:	f107 0128 	add.w	r1, r7, #40	; 0x28
 8001a1e:	f8d7 217c 	ldr.w	r2, [r7, #380]	; 0x17c
 8001a22:	4613      	mov	r3, r2
 8001a24:	00db      	lsls	r3, r3, #3
 8001a26:	1a9b      	subs	r3, r3, r2
 8001a28:	009b      	lsls	r3, r3, #2
 8001a2a:	440b      	add	r3, r1
 8001a2c:	333c      	adds	r3, #60	; 0x3c
 8001a2e:	2200      	movs	r2, #0
 8001a30:	701a      	strb	r2, [r3, #0]
 8001a32:	f107 0128 	add.w	r1, r7, #40	; 0x28
 8001a36:	f8d7 217c 	ldr.w	r2, [r7, #380]	; 0x17c
 8001a3a:	4613      	mov	r3, r2
 8001a3c:	00db      	lsls	r3, r3, #3
 8001a3e:	1a9b      	subs	r3, r3, r2
 8001a40:	009b      	lsls	r3, r3, #2
 8001a42:	440b      	add	r3, r1
 8001a44:	333d      	adds	r3, #61	; 0x3d
 8001a46:	2200      	movs	r2, #0
 8001a48:	701a      	strb	r2, [r3, #0]
 8001a4a:	f8d7 317c 	ldr.w	r3, [r7, #380]	; 0x17c
 8001a4e:	3301      	adds	r3, #1
 8001a50:	f8c7 317c 	str.w	r3, [r7, #380]	; 0x17c
 8001a54:	f8d7 317c 	ldr.w	r3, [r7, #380]	; 0x17c
 8001a58:	2b09      	cmp	r3, #9
 8001a5a:	ddaa      	ble.n	80019b2 <manipulators_manager+0xde>
 8001a5c:	4a2c      	ldr	r2, [pc, #176]	; (8001b10 <manipulators_manager+0x23c>)
 8001a5e:	f107 0328 	add.w	r3, r7, #40	; 0x28
 8001a62:	6013      	str	r3, [r2, #0]
 8001a64:	f7ff fc92 	bl	800138c <manip_hw_config>
 8001a68:	f7ff fe96 	bl	8001798 <dyn_set_speeds>
 8001a6c:	201e      	movs	r0, #30
 8001a6e:	f004 fbd3 	bl	8006218 <vTaskDelay>
 8001a72:	f7ff fed7 	bl	8001824 <dyn_set_init_pos>
 8001a76:	f04f 31ff 	mov.w	r1, #4294967295	; 0xffffffff
 8001a7a:	2001      	movs	r0, #1
 8001a7c:	f005 fa6a 	bl	8006f54 <ulTaskNotifyTake>
 8001a80:	4824      	ldr	r0, [pc, #144]	; (8001b14 <manipulators_manager+0x240>)
 8001a82:	f7ff fbbf 	bl	8001204 <LL_TIM_EnableCounter>
 8001a86:	4b22      	ldr	r3, [pc, #136]	; (8001b10 <manipulators_manager+0x23c>)
 8001a88:	681b      	ldr	r3, [r3, #0]
 8001a8a:	2200      	movs	r2, #0
 8001a8c:	705a      	strb	r2, [r3, #1]
 8001a8e:	4b20      	ldr	r3, [pc, #128]	; (8001b10 <manipulators_manager+0x23c>)
 8001a90:	681b      	ldr	r3, [r3, #0]
 8001a92:	2200      	movs	r2, #0
 8001a94:	709a      	strb	r2, [r3, #2]
 8001a96:	e00c      	b.n	8001ab2 <manipulators_manager+0x1de>
 8001a98:	4b1d      	ldr	r3, [pc, #116]	; (8001b10 <manipulators_manager+0x23c>)
 8001a9a:	681b      	ldr	r3, [r3, #0]
 8001a9c:	4618      	mov	r0, r3
 8001a9e:	f7ff fdfb 	bl	8001698 <dyn_time_slice_operator>
 8001aa2:	4b1d      	ldr	r3, [pc, #116]	; (8001b18 <manipulators_manager+0x244>)
 8001aa4:	f04f 5280 	mov.w	r2, #268435456	; 0x10000000
 8001aa8:	601a      	str	r2, [r3, #0]
 8001aaa:	f3bf 8f4f 	dsb	sy
 8001aae:	f3bf 8f6f 	isb	sy
 8001ab2:	4b17      	ldr	r3, [pc, #92]	; (8001b10 <manipulators_manager+0x23c>)
 8001ab4:	681b      	ldr	r3, [r3, #0]
 8001ab6:	789a      	ldrb	r2, [r3, #2]
 8001ab8:	4b15      	ldr	r3, [pc, #84]	; (8001b10 <manipulators_manager+0x23c>)
 8001aba:	681b      	ldr	r3, [r3, #0]
 8001abc:	781b      	ldrb	r3, [r3, #0]
 8001abe:	429a      	cmp	r2, r3
 8001ac0:	d3ea      	bcc.n	8001a98 <manipulators_manager+0x1c4>
 8001ac2:	4b13      	ldr	r3, [pc, #76]	; (8001b10 <manipulators_manager+0x23c>)
 8001ac4:	681b      	ldr	r3, [r3, #0]
 8001ac6:	2200      	movs	r2, #0
 8001ac8:	701a      	strb	r2, [r3, #0]
 8001aca:	4b11      	ldr	r3, [pc, #68]	; (8001b10 <manipulators_manager+0x23c>)
 8001acc:	681b      	ldr	r3, [r3, #0]
 8001ace:	2200      	movs	r2, #0
 8001ad0:	705a      	strb	r2, [r3, #1]
 8001ad2:	4b0f      	ldr	r3, [pc, #60]	; (8001b10 <manipulators_manager+0x23c>)
 8001ad4:	681b      	ldr	r3, [r3, #0]
 8001ad6:	2200      	movs	r2, #0
 8001ad8:	709a      	strb	r2, [r3, #2]
 8001ada:	4b0d      	ldr	r3, [pc, #52]	; (8001b10 <manipulators_manager+0x23c>)
 8001adc:	681b      	ldr	r3, [r3, #0]
 8001ade:	78da      	ldrb	r2, [r3, #3]
 8001ae0:	4b0b      	ldr	r3, [pc, #44]	; (8001b10 <manipulators_manager+0x23c>)
 8001ae2:	681b      	ldr	r3, [r3, #0]
 8001ae4:	f022 0201 	bic.w	r2, r2, #1
 8001ae8:	b2d2      	uxtb	r2, r2
 8001aea:	70da      	strb	r2, [r3, #3]
 8001aec:	4809      	ldr	r0, [pc, #36]	; (8001b14 <manipulators_manager+0x240>)
 8001aee:	f7ff fb99 	bl	8001224 <LL_TIM_DisableCounter>
 8001af2:	4b07      	ldr	r3, [pc, #28]	; (8001b10 <manipulators_manager+0x23c>)
 8001af4:	681b      	ldr	r3, [r3, #0]
 8001af6:	791a      	ldrb	r2, [r3, #4]
 8001af8:	4b05      	ldr	r3, [pc, #20]	; (8001b10 <manipulators_manager+0x23c>)
 8001afa:	681b      	ldr	r3, [r3, #0]
 8001afc:	f022 0201 	bic.w	r2, r2, #1
 8001b00:	b2d2      	uxtb	r2, r2
 8001b02:	711a      	strb	r2, [r3, #4]
 8001b04:	e7b7      	b.n	8001a76 <manipulators_manager+0x1a2>
 8001b06:	bf00      	nop
 8001b08:	0800b27c 	.word	0x0800b27c
 8001b0c:	0800b28c 	.word	0x0800b28c
 8001b10:	2000026c 	.word	0x2000026c
 8001b14:	40010400 	.word	0x40010400
 8001b18:	e000ed04 	.word	0xe000ed04

08001b1c <cmd_arm_down>:
 8001b1c:	b580      	push	{r7, lr}
 8001b1e:	b082      	sub	sp, #8
 8001b20:	af00      	add	r7, sp, #0
 8001b22:	6078      	str	r0, [r7, #4]
 8001b24:	4b31      	ldr	r3, [pc, #196]	; (8001bec <cmd_arm_down+0xd0>)
 8001b26:	681b      	ldr	r3, [r3, #0]
 8001b28:	2b00      	cmp	r3, #0
 8001b2a:	d054      	beq.n	8001bd6 <cmd_arm_down+0xba>
 8001b2c:	4b2f      	ldr	r3, [pc, #188]	; (8001bec <cmd_arm_down+0xd0>)
 8001b2e:	681b      	ldr	r3, [r3, #0]
 8001b30:	78db      	ldrb	r3, [r3, #3]
 8001b32:	f003 0301 	and.w	r3, r3, #1
 8001b36:	2b00      	cmp	r3, #0
 8001b38:	d14d      	bne.n	8001bd6 <cmd_arm_down+0xba>
 8001b3a:	4b2c      	ldr	r3, [pc, #176]	; (8001bec <cmd_arm_down+0xd0>)
 8001b3c:	681b      	ldr	r3, [r3, #0]
 8001b3e:	791b      	ldrb	r3, [r3, #4]
 8001b40:	f003 0302 	and.w	r3, r3, #2
 8001b44:	2b00      	cmp	r3, #0
 8001b46:	d146      	bne.n	8001bd6 <cmd_arm_down+0xba>
 8001b48:	4b28      	ldr	r3, [pc, #160]	; (8001bec <cmd_arm_down+0xd0>)
 8001b4a:	681b      	ldr	r3, [r3, #0]
 8001b4c:	8cdb      	ldrh	r3, [r3, #38]	; 0x26
 8001b4e:	f240 220f 	movw	r2, #527	; 0x20f
 8001b52:	2106      	movs	r1, #6
 8001b54:	2000      	movs	r0, #0
 8001b56:	f7ff fc39 	bl	80013cc <dyn_set_angle>
 8001b5a:	4b24      	ldr	r3, [pc, #144]	; (8001bec <cmd_arm_down+0xd0>)
 8001b5c:	6819      	ldr	r1, [r3, #0]
 8001b5e:	4b23      	ldr	r3, [pc, #140]	; (8001bec <cmd_arm_down+0xd0>)
 8001b60:	681b      	ldr	r3, [r3, #0]
 8001b62:	781b      	ldrb	r3, [r3, #0]
 8001b64:	1e5a      	subs	r2, r3, #1
 8001b66:	4613      	mov	r3, r2
 8001b68:	00db      	lsls	r3, r3, #3
 8001b6a:	1a9b      	subs	r3, r3, r2
 8001b6c:	009b      	lsls	r3, r3, #2
 8001b6e:	440b      	add	r3, r1
 8001b70:	3334      	adds	r3, #52	; 0x34
 8001b72:	681b      	ldr	r3, [r3, #0]
 8001b74:	4a1d      	ldr	r2, [pc, #116]	; (8001bec <cmd_arm_down+0xd0>)
 8001b76:	6810      	ldr	r0, [r2, #0]
 8001b78:	4a1c      	ldr	r2, [pc, #112]	; (8001bec <cmd_arm_down+0xd0>)
 8001b7a:	6812      	ldr	r2, [r2, #0]
 8001b7c:	7812      	ldrb	r2, [r2, #0]
 8001b7e:	3a01      	subs	r2, #1
 8001b80:	f503 7116 	add.w	r1, r3, #600	; 0x258
 8001b84:	4613      	mov	r3, r2
 8001b86:	00db      	lsls	r3, r3, #3
 8001b88:	1a9b      	subs	r3, r3, r2
 8001b8a:	009b      	lsls	r3, r3, #2
 8001b8c:	4403      	add	r3, r0
 8001b8e:	3334      	adds	r3, #52	; 0x34
 8001b90:	6019      	str	r1, [r3, #0]
 8001b92:	4b16      	ldr	r3, [pc, #88]	; (8001bec <cmd_arm_down+0xd0>)
 8001b94:	681b      	ldr	r3, [r3, #0]
 8001b96:	78da      	ldrb	r2, [r3, #3]
 8001b98:	4b14      	ldr	r3, [pc, #80]	; (8001bec <cmd_arm_down+0xd0>)
 8001b9a:	681b      	ldr	r3, [r3, #0]
 8001b9c:	f042 0201 	orr.w	r2, r2, #1
 8001ba0:	b2d2      	uxtb	r2, r2
 8001ba2:	70da      	strb	r2, [r3, #3]
 8001ba4:	4b11      	ldr	r3, [pc, #68]	; (8001bec <cmd_arm_down+0xd0>)
 8001ba6:	681b      	ldr	r3, [r3, #0]
 8001ba8:	791a      	ldrb	r2, [r3, #4]
 8001baa:	4b10      	ldr	r3, [pc, #64]	; (8001bec <cmd_arm_down+0xd0>)
 8001bac:	681b      	ldr	r3, [r3, #0]
 8001bae:	f042 0201 	orr.w	r2, r2, #1
 8001bb2:	b2d2      	uxtb	r2, r2
 8001bb4:	711a      	strb	r2, [r3, #4]
 8001bb6:	4b0d      	ldr	r3, [pc, #52]	; (8001bec <cmd_arm_down+0xd0>)
 8001bb8:	681b      	ldr	r3, [r3, #0]
 8001bba:	f8d3 0150 	ldr.w	r0, [r3, #336]	; 0x150
 8001bbe:	2300      	movs	r3, #0
 8001bc0:	2202      	movs	r2, #2
 8001bc2:	2100      	movs	r1, #0
 8001bc4:	f005 fa12 	bl	8006fec <xTaskGenericNotify>
 8001bc8:	2203      	movs	r2, #3
 8001bca:	4909      	ldr	r1, [pc, #36]	; (8001bf0 <cmd_arm_down+0xd4>)
 8001bcc:	6878      	ldr	r0, [r7, #4]
 8001bce:	f006 ff79 	bl	8008ac4 <memcpy>
 8001bd2:	2303      	movs	r3, #3
 8001bd4:	e006      	b.n	8001be4 <cmd_arm_down+0xc8>
 8001bd6:	bf00      	nop
 8001bd8:	2203      	movs	r2, #3
 8001bda:	4906      	ldr	r1, [pc, #24]	; (8001bf4 <cmd_arm_down+0xd8>)
 8001bdc:	6878      	ldr	r0, [r7, #4]
 8001bde:	f006 ff71 	bl	8008ac4 <memcpy>
 8001be2:	2303      	movs	r3, #3
 8001be4:	4618      	mov	r0, r3
 8001be6:	3708      	adds	r7, #8
 8001be8:	46bd      	mov	sp, r7
 8001bea:	bd80      	pop	{r7, pc}
 8001bec:	2000026c 	.word	0x2000026c
 8001bf0:	0800b29c 	.word	0x0800b29c
 8001bf4:	0800b2a0 	.word	0x0800b2a0

08001bf8 <cmd_arm_up>:
 8001bf8:	b580      	push	{r7, lr}
 8001bfa:	b082      	sub	sp, #8
 8001bfc:	af00      	add	r7, sp, #0
 8001bfe:	6078      	str	r0, [r7, #4]
 8001c00:	4b31      	ldr	r3, [pc, #196]	; (8001cc8 <cmd_arm_up+0xd0>)
 8001c02:	681b      	ldr	r3, [r3, #0]
 8001c04:	2b00      	cmp	r3, #0
 8001c06:	d054      	beq.n	8001cb2 <cmd_arm_up+0xba>
 8001c08:	4b2f      	ldr	r3, [pc, #188]	; (8001cc8 <cmd_arm_up+0xd0>)
 8001c0a:	681b      	ldr	r3, [r3, #0]
 8001c0c:	78db      	ldrb	r3, [r3, #3]
 8001c0e:	f003 0301 	and.w	r3, r3, #1
 8001c12:	2b00      	cmp	r3, #0
 8001c14:	d14d      	bne.n	8001cb2 <cmd_arm_up+0xba>
 8001c16:	4b2c      	ldr	r3, [pc, #176]	; (8001cc8 <cmd_arm_up+0xd0>)
 8001c18:	681b      	ldr	r3, [r3, #0]
 8001c1a:	791b      	ldrb	r3, [r3, #4]
 8001c1c:	f003 0302 	and.w	r3, r3, #2
 8001c20:	2b00      	cmp	r3, #0
 8001c22:	d146      	bne.n	8001cb2 <cmd_arm_up+0xba>
 8001c24:	4b28      	ldr	r3, [pc, #160]	; (8001cc8 <cmd_arm_up+0xd0>)
 8001c26:	681b      	ldr	r3, [r3, #0]
 8001c28:	8cdb      	ldrh	r3, [r3, #38]	; 0x26
 8001c2a:	f44f 7240 	mov.w	r2, #768	; 0x300
 8001c2e:	2106      	movs	r1, #6
 8001c30:	2000      	movs	r0, #0
 8001c32:	f7ff fbcb 	bl	80013cc <dyn_set_angle>
 8001c36:	4b24      	ldr	r3, [pc, #144]	; (8001cc8 <cmd_arm_up+0xd0>)
 8001c38:	6819      	ldr	r1, [r3, #0]
 8001c3a:	4b23      	ldr	r3, [pc, #140]	; (8001cc8 <cmd_arm_up+0xd0>)
 8001c3c:	681b      	ldr	r3, [r3, #0]
 8001c3e:	781b      	ldrb	r3, [r3, #0]
 8001c40:	1e5a      	subs	r2, r3, #1
 8001c42:	4613      	mov	r3, r2
 8001c44:	00db      	lsls	r3, r3, #3
 8001c46:	1a9b      	subs	r3, r3, r2
 8001c48:	009b      	lsls	r3, r3, #2
 8001c4a:	440b      	add	r3, r1
 8001c4c:	3334      	adds	r3, #52	; 0x34
 8001c4e:	681b      	ldr	r3, [r3, #0]
 8001c50:	4a1d      	ldr	r2, [pc, #116]	; (8001cc8 <cmd_arm_up+0xd0>)
 8001c52:	6810      	ldr	r0, [r2, #0]
 8001c54:	4a1c      	ldr	r2, [pc, #112]	; (8001cc8 <cmd_arm_up+0xd0>)
 8001c56:	6812      	ldr	r2, [r2, #0]
 8001c58:	7812      	ldrb	r2, [r2, #0]
 8001c5a:	3a01      	subs	r2, #1
 8001c5c:	f503 7116 	add.w	r1, r3, #600	; 0x258
 8001c60:	4613      	mov	r3, r2
 8001c62:	00db      	lsls	r3, r3, #3
 8001c64:	1a9b      	subs	r3, r3, r2
 8001c66:	009b      	lsls	r3, r3, #2
 8001c68:	4403      	add	r3, r0
 8001c6a:	3334      	adds	r3, #52	; 0x34
 8001c6c:	6019      	str	r1, [r3, #0]
 8001c6e:	4b16      	ldr	r3, [pc, #88]	; (8001cc8 <cmd_arm_up+0xd0>)
 8001c70:	681b      	ldr	r3, [r3, #0]
 8001c72:	78da      	ldrb	r2, [r3, #3]
 8001c74:	4b14      	ldr	r3, [pc, #80]	; (8001cc8 <cmd_arm_up+0xd0>)
 8001c76:	681b      	ldr	r3, [r3, #0]
 8001c78:	f042 0201 	orr.w	r2, r2, #1
 8001c7c:	b2d2      	uxtb	r2, r2
 8001c7e:	70da      	strb	r2, [r3, #3]
 8001c80:	4b11      	ldr	r3, [pc, #68]	; (8001cc8 <cmd_arm_up+0xd0>)
 8001c82:	681b      	ldr	r3, [r3, #0]
 8001c84:	791a      	ldrb	r2, [r3, #4]
 8001c86:	4b10      	ldr	r3, [pc, #64]	; (8001cc8 <cmd_arm_up+0xd0>)
 8001c88:	681b      	ldr	r3, [r3, #0]
 8001c8a:	f042 0201 	orr.w	r2, r2, #1
 8001c8e:	b2d2      	uxtb	r2, r2
 8001c90:	711a      	strb	r2, [r3, #4]
 8001c92:	4b0d      	ldr	r3, [pc, #52]	; (8001cc8 <cmd_arm_up+0xd0>)
 8001c94:	681b      	ldr	r3, [r3, #0]
 8001c96:	f8d3 0150 	ldr.w	r0, [r3, #336]	; 0x150
 8001c9a:	2300      	movs	r3, #0
 8001c9c:	2202      	movs	r2, #2
 8001c9e:	2100      	movs	r1, #0
 8001ca0:	f005 f9a4 	bl	8006fec <xTaskGenericNotify>
 8001ca4:	2203      	movs	r2, #3
 8001ca6:	4909      	ldr	r1, [pc, #36]	; (8001ccc <cmd_arm_up+0xd4>)
 8001ca8:	6878      	ldr	r0, [r7, #4]
 8001caa:	f006 ff0b 	bl	8008ac4 <memcpy>
 8001cae:	2303      	movs	r3, #3
 8001cb0:	e006      	b.n	8001cc0 <cmd_arm_up+0xc8>
 8001cb2:	bf00      	nop
 8001cb4:	2203      	movs	r2, #3
 8001cb6:	4906      	ldr	r1, [pc, #24]	; (8001cd0 <cmd_arm_up+0xd8>)
 8001cb8:	6878      	ldr	r0, [r7, #4]
 8001cba:	f006 ff03 	bl	8008ac4 <memcpy>
 8001cbe:	2303      	movs	r3, #3
 8001cc0:	4618      	mov	r0, r3
 8001cc2:	3708      	adds	r7, #8
 8001cc4:	46bd      	mov	sp, r7
 8001cc6:	bd80      	pop	{r7, pc}
 8001cc8:	2000026c 	.word	0x2000026c
 8001ccc:	0800b29c 	.word	0x0800b29c
 8001cd0:	0800b2a0 	.word	0x0800b2a0

08001cd4 <cmd_paws_open>:
 8001cd4:	b580      	push	{r7, lr}
 8001cd6:	b084      	sub	sp, #16
 8001cd8:	af00      	add	r7, sp, #0
 8001cda:	6078      	str	r0, [r7, #4]
 8001cdc:	4b3f      	ldr	r3, [pc, #252]	; (8001ddc <cmd_paws_open+0x108>)
 8001cde:	681b      	ldr	r3, [r3, #0]
 8001ce0:	2b00      	cmp	r3, #0
 8001ce2:	d070      	beq.n	8001dc6 <cmd_paws_open+0xf2>
 8001ce4:	4b3d      	ldr	r3, [pc, #244]	; (8001ddc <cmd_paws_open+0x108>)
 8001ce6:	681b      	ldr	r3, [r3, #0]
 8001ce8:	78db      	ldrb	r3, [r3, #3]
 8001cea:	f003 0301 	and.w	r3, r3, #1
 8001cee:	2b00      	cmp	r3, #0
 8001cf0:	d169      	bne.n	8001dc6 <cmd_paws_open+0xf2>
 8001cf2:	4b3a      	ldr	r3, [pc, #232]	; (8001ddc <cmd_paws_open+0x108>)
 8001cf4:	681b      	ldr	r3, [r3, #0]
 8001cf6:	791b      	ldrb	r3, [r3, #4]
 8001cf8:	f003 0302 	and.w	r3, r3, #2
 8001cfc:	2b00      	cmp	r3, #0
 8001cfe:	d162      	bne.n	8001dc6 <cmd_paws_open+0xf2>
 8001d00:	687b      	ldr	r3, [r7, #4]
 8001d02:	781b      	ldrb	r3, [r3, #0]
 8001d04:	72fb      	strb	r3, [r7, #11]
 8001d06:	2300      	movs	r3, #0
 8001d08:	60fb      	str	r3, [r7, #12]
 8001d0a:	e01b      	b.n	8001d44 <cmd_paws_open+0x70>
 8001d0c:	7afa      	ldrb	r2, [r7, #11]
 8001d0e:	68fb      	ldr	r3, [r7, #12]
 8001d10:	fa42 f303 	asr.w	r3, r2, r3
 8001d14:	f003 0301 	and.w	r3, r3, #1
 8001d18:	2b00      	cmp	r3, #0
 8001d1a:	d010      	beq.n	8001d3e <cmd_paws_open+0x6a>
 8001d1c:	68fb      	ldr	r3, [r7, #12]
 8001d1e:	b2d8      	uxtb	r0, r3
 8001d20:	68fb      	ldr	r3, [r7, #12]
 8001d22:	b2db      	uxtb	r3, r3
 8001d24:	3301      	adds	r3, #1
 8001d26:	b2d9      	uxtb	r1, r3
 8001d28:	4b2c      	ldr	r3, [pc, #176]	; (8001ddc <cmd_paws_open+0x108>)
 8001d2a:	681a      	ldr	r2, [r3, #0]
 8001d2c:	68fb      	ldr	r3, [r7, #12]
 8001d2e:	330c      	adds	r3, #12
 8001d30:	005b      	lsls	r3, r3, #1
 8001d32:	4413      	add	r3, r2
 8001d34:	889b      	ldrh	r3, [r3, #4]
 8001d36:	f240 3216 	movw	r2, #790	; 0x316
 8001d3a:	f7ff fb47 	bl	80013cc <dyn_set_angle>
 8001d3e:	68fb      	ldr	r3, [r7, #12]
 8001d40:	3301      	adds	r3, #1
 8001d42:	60fb      	str	r3, [r7, #12]
 8001d44:	68fb      	ldr	r3, [r7, #12]
 8001d46:	2b04      	cmp	r3, #4
 8001d48:	d9e0      	bls.n	8001d0c <cmd_paws_open+0x38>
 8001d4a:	4b24      	ldr	r3, [pc, #144]	; (8001ddc <cmd_paws_open+0x108>)
 8001d4c:	6819      	ldr	r1, [r3, #0]
 8001d4e:	4b23      	ldr	r3, [pc, #140]	; (8001ddc <cmd_paws_open+0x108>)
 8001d50:	681b      	ldr	r3, [r3, #0]
 8001d52:	781b      	ldrb	r3, [r3, #0]
 8001d54:	1e5a      	subs	r2, r3, #1
 8001d56:	4613      	mov	r3, r2
 8001d58:	00db      	lsls	r3, r3, #3
 8001d5a:	1a9b      	subs	r3, r3, r2
 8001d5c:	009b      	lsls	r3, r3, #2
 8001d5e:	440b      	add	r3, r1
 8001d60:	3334      	adds	r3, #52	; 0x34
 8001d62:	681b      	ldr	r3, [r3, #0]
 8001d64:	4a1d      	ldr	r2, [pc, #116]	; (8001ddc <cmd_paws_open+0x108>)
 8001d66:	6810      	ldr	r0, [r2, #0]
 8001d68:	4a1c      	ldr	r2, [pc, #112]	; (8001ddc <cmd_paws_open+0x108>)
 8001d6a:	6812      	ldr	r2, [r2, #0]
 8001d6c:	7812      	ldrb	r2, [r2, #0]
 8001d6e:	3a01      	subs	r2, #1
 8001d70:	f503 7116 	add.w	r1, r3, #600	; 0x258
 8001d74:	4613      	mov	r3, r2
 8001d76:	00db      	lsls	r3, r3, #3
 8001d78:	1a9b      	subs	r3, r3, r2
 8001d7a:	009b      	lsls	r3, r3, #2
 8001d7c:	4403      	add	r3, r0
 8001d7e:	3334      	adds	r3, #52	; 0x34
 8001d80:	6019      	str	r1, [r3, #0]
 8001d82:	4b16      	ldr	r3, [pc, #88]	; (8001ddc <cmd_paws_open+0x108>)
 8001d84:	681b      	ldr	r3, [r3, #0]
 8001d86:	78da      	ldrb	r2, [r3, #3]
 8001d88:	4b14      	ldr	r3, [pc, #80]	; (8001ddc <cmd_paws_open+0x108>)
 8001d8a:	681b      	ldr	r3, [r3, #0]
 8001d8c:	f042 0201 	orr.w	r2, r2, #1
 8001d90:	b2d2      	uxtb	r2, r2
 8001d92:	70da      	strb	r2, [r3, #3]
 8001d94:	4b11      	ldr	r3, [pc, #68]	; (8001ddc <cmd_paws_open+0x108>)
 8001d96:	681b      	ldr	r3, [r3, #0]
 8001d98:	791a      	ldrb	r2, [r3, #4]
 8001d9a:	4b10      	ldr	r3, [pc, #64]	; (8001ddc <cmd_paws_open+0x108>)
 8001d9c:	681b      	ldr	r3, [r3, #0]
 8001d9e:	f042 0201 	orr.w	r2, r2, #1
 8001da2:	b2d2      	uxtb	r2, r2
 8001da4:	711a      	strb	r2, [r3, #4]
 8001da6:	4b0d      	ldr	r3, [pc, #52]	; (8001ddc <cmd_paws_open+0x108>)
 8001da8:	681b      	ldr	r3, [r3, #0]
 8001daa:	f8d3 0150 	ldr.w	r0, [r3, #336]	; 0x150
 8001dae:	2300      	movs	r3, #0
 8001db0:	2202      	movs	r2, #2
 8001db2:	2100      	movs	r1, #0
 8001db4:	f005 f91a 	bl	8006fec <xTaskGenericNotify>
 8001db8:	2203      	movs	r2, #3
 8001dba:	4909      	ldr	r1, [pc, #36]	; (8001de0 <cmd_paws_open+0x10c>)
 8001dbc:	6878      	ldr	r0, [r7, #4]
 8001dbe:	f006 fe81 	bl	8008ac4 <memcpy>
 8001dc2:	2303      	movs	r3, #3
 8001dc4:	e006      	b.n	8001dd4 <cmd_paws_open+0x100>
 8001dc6:	bf00      	nop
 8001dc8:	2203      	movs	r2, #3
 8001dca:	4906      	ldr	r1, [pc, #24]	; (8001de4 <cmd_paws_open+0x110>)
 8001dcc:	6878      	ldr	r0, [r7, #4]
 8001dce:	f006 fe79 	bl	8008ac4 <memcpy>
 8001dd2:	2303      	movs	r3, #3
 8001dd4:	4618      	mov	r0, r3
 8001dd6:	3710      	adds	r7, #16
 8001dd8:	46bd      	mov	sp, r7
 8001dda:	bd80      	pop	{r7, pc}
 8001ddc:	2000026c 	.word	0x2000026c
 8001de0:	0800b29c 	.word	0x0800b29c
 8001de4:	0800b2a0 	.word	0x0800b2a0

08001de8 <cmd_paws_close>:
 8001de8:	b580      	push	{r7, lr}
 8001dea:	b084      	sub	sp, #16
 8001dec:	af00      	add	r7, sp, #0
 8001dee:	6078      	str	r0, [r7, #4]
 8001df0:	4b3f      	ldr	r3, [pc, #252]	; (8001ef0 <cmd_paws_close+0x108>)
 8001df2:	681b      	ldr	r3, [r3, #0]
 8001df4:	2b00      	cmp	r3, #0
 8001df6:	d070      	beq.n	8001eda <cmd_paws_close+0xf2>
 8001df8:	4b3d      	ldr	r3, [pc, #244]	; (8001ef0 <cmd_paws_close+0x108>)
 8001dfa:	681b      	ldr	r3, [r3, #0]
 8001dfc:	78db      	ldrb	r3, [r3, #3]
 8001dfe:	f003 0301 	and.w	r3, r3, #1
 8001e02:	2b00      	cmp	r3, #0
 8001e04:	d169      	bne.n	8001eda <cmd_paws_close+0xf2>
 8001e06:	4b3a      	ldr	r3, [pc, #232]	; (8001ef0 <cmd_paws_close+0x108>)
 8001e08:	681b      	ldr	r3, [r3, #0]
 8001e0a:	791b      	ldrb	r3, [r3, #4]
 8001e0c:	f003 0302 	and.w	r3, r3, #2
 8001e10:	2b00      	cmp	r3, #0
 8001e12:	d162      	bne.n	8001eda <cmd_paws_close+0xf2>
 8001e14:	687b      	ldr	r3, [r7, #4]
 8001e16:	781b      	ldrb	r3, [r3, #0]
 8001e18:	72fb      	strb	r3, [r7, #11]
 8001e1a:	2300      	movs	r3, #0
 8001e1c:	60fb      	str	r3, [r7, #12]
 8001e1e:	e01b      	b.n	8001e58 <cmd_paws_close+0x70>
 8001e20:	7afa      	ldrb	r2, [r7, #11]
 8001e22:	68fb      	ldr	r3, [r7, #12]
 8001e24:	fa42 f303 	asr.w	r3, r2, r3
 8001e28:	f003 0301 	and.w	r3, r3, #1
 8001e2c:	2b00      	cmp	r3, #0
 8001e2e:	d010      	beq.n	8001e52 <cmd_paws_close+0x6a>
 8001e30:	68fb      	ldr	r3, [r7, #12]
 8001e32:	b2d8      	uxtb	r0, r3
 8001e34:	68fb      	ldr	r3, [r7, #12]
 8001e36:	b2db      	uxtb	r3, r3
 8001e38:	3301      	adds	r3, #1
 8001e3a:	b2d9      	uxtb	r1, r3
 8001e3c:	4b2c      	ldr	r3, [pc, #176]	; (8001ef0 <cmd_paws_close+0x108>)
 8001e3e:	681a      	ldr	r2, [r3, #0]
 8001e40:	68fb      	ldr	r3, [r7, #12]
 8001e42:	330c      	adds	r3, #12
 8001e44:	005b      	lsls	r3, r3, #1
 8001e46:	4413      	add	r3, r2
 8001e48:	889b      	ldrh	r3, [r3, #4]
 8001e4a:	f44f 72f5 	mov.w	r2, #490	; 0x1ea
 8001e4e:	f7ff fabd 	bl	80013cc <dyn_set_angle>
 8001e52:	68fb      	ldr	r3, [r7, #12]
 8001e54:	3301      	adds	r3, #1
 8001e56:	60fb      	str	r3, [r7, #12]
 8001e58:	68fb      	ldr	r3, [r7, #12]
 8001e5a:	2b04      	cmp	r3, #4
 8001e5c:	d9e0      	bls.n	8001e20 <cmd_paws_close+0x38>
 8001e5e:	4b24      	ldr	r3, [pc, #144]	; (8001ef0 <cmd_paws_close+0x108>)
 8001e60:	6819      	ldr	r1, [r3, #0]
 8001e62:	4b23      	ldr	r3, [pc, #140]	; (8001ef0 <cmd_paws_close+0x108>)
 8001e64:	681b      	ldr	r3, [r3, #0]
 8001e66:	781b      	ldrb	r3, [r3, #0]
 8001e68:	1e5a      	subs	r2, r3, #1
 8001e6a:	4613      	mov	r3, r2
 8001e6c:	00db      	lsls	r3, r3, #3
 8001e6e:	1a9b      	subs	r3, r3, r2
 8001e70:	009b      	lsls	r3, r3, #2
 8001e72:	440b      	add	r3, r1
 8001e74:	3334      	adds	r3, #52	; 0x34
 8001e76:	681b      	ldr	r3, [r3, #0]
 8001e78:	4a1d      	ldr	r2, [pc, #116]	; (8001ef0 <cmd_paws_close+0x108>)
 8001e7a:	6810      	ldr	r0, [r2, #0]
 8001e7c:	4a1c      	ldr	r2, [pc, #112]	; (8001ef0 <cmd_paws_close+0x108>)
 8001e7e:	6812      	ldr	r2, [r2, #0]
 8001e80:	7812      	ldrb	r2, [r2, #0]
 8001e82:	3a01      	subs	r2, #1
 8001e84:	f503 7116 	add.w	r1, r3, #600	; 0x258
 8001e88:	4613      	mov	r3, r2
 8001e8a:	00db      	lsls	r3, r3, #3
 8001e8c:	1a9b      	subs	r3, r3, r2
 8001e8e:	009b      	lsls	r3, r3, #2
 8001e90:	4403      	add	r3, r0
 8001e92:	3334      	adds	r3, #52	; 0x34
 8001e94:	6019      	str	r1, [r3, #0]
 8001e96:	4b16      	ldr	r3, [pc, #88]	; (8001ef0 <cmd_paws_close+0x108>)
 8001e98:	681b      	ldr	r3, [r3, #0]
 8001e9a:	78da      	ldrb	r2, [r3, #3]
 8001e9c:	4b14      	ldr	r3, [pc, #80]	; (8001ef0 <cmd_paws_close+0x108>)
 8001e9e:	681b      	ldr	r3, [r3, #0]
 8001ea0:	f042 0201 	orr.w	r2, r2, #1
 8001ea4:	b2d2      	uxtb	r2, r2
 8001ea6:	70da      	strb	r2, [r3, #3]
 8001ea8:	4b11      	ldr	r3, [pc, #68]	; (8001ef0 <cmd_paws_close+0x108>)
 8001eaa:	681b      	ldr	r3, [r3, #0]
 8001eac:	791a      	ldrb	r2, [r3, #4]
 8001eae:	4b10      	ldr	r3, [pc, #64]	; (8001ef0 <cmd_paws_close+0x108>)
 8001eb0:	681b      	ldr	r3, [r3, #0]
 8001eb2:	f042 0201 	orr.w	r2, r2, #1
 8001eb6:	b2d2      	uxtb	r2, r2
 8001eb8:	711a      	strb	r2, [r3, #4]
 8001eba:	4b0d      	ldr	r3, [pc, #52]	; (8001ef0 <cmd_paws_close+0x108>)
 8001ebc:	681b      	ldr	r3, [r3, #0]
 8001ebe:	f8d3 0150 	ldr.w	r0, [r3, #336]	; 0x150
 8001ec2:	2300      	movs	r3, #0
 8001ec4:	2202      	movs	r2, #2
 8001ec6:	2100      	movs	r1, #0
 8001ec8:	f005 f890 	bl	8006fec <xTaskGenericNotify>
 8001ecc:	2203      	movs	r2, #3
 8001ece:	4909      	ldr	r1, [pc, #36]	; (8001ef4 <cmd_paws_close+0x10c>)
 8001ed0:	6878      	ldr	r0, [r7, #4]
 8001ed2:	f006 fdf7 	bl	8008ac4 <memcpy>
 8001ed6:	2303      	movs	r3, #3
 8001ed8:	e006      	b.n	8001ee8 <cmd_paws_close+0x100>
 8001eda:	bf00      	nop
 8001edc:	2203      	movs	r2, #3
 8001ede:	4906      	ldr	r1, [pc, #24]	; (8001ef8 <cmd_paws_close+0x110>)
 8001ee0:	6878      	ldr	r0, [r7, #4]
 8001ee2:	f006 fdef 	bl	8008ac4 <memcpy>
 8001ee6:	2303      	movs	r3, #3
 8001ee8:	4618      	mov	r0, r3
 8001eea:	3710      	adds	r7, #16
 8001eec:	46bd      	mov	sp, r7
 8001eee:	bd80      	pop	{r7, pc}
 8001ef0:	2000026c 	.word	0x2000026c
 8001ef4:	0800b29c 	.word	0x0800b29c
 8001ef8:	0800b2a0 	.word	0x0800b2a0

08001efc <cmd_l_door_open>:
 8001efc:	b580      	push	{r7, lr}
 8001efe:	b082      	sub	sp, #8
 8001f00:	af00      	add	r7, sp, #0
 8001f02:	6078      	str	r0, [r7, #4]
 8001f04:	4b31      	ldr	r3, [pc, #196]	; (8001fcc <cmd_l_door_open+0xd0>)
 8001f06:	681b      	ldr	r3, [r3, #0]
 8001f08:	2b00      	cmp	r3, #0
 8001f0a:	d054      	beq.n	8001fb6 <cmd_l_door_open+0xba>
 8001f0c:	4b2f      	ldr	r3, [pc, #188]	; (8001fcc <cmd_l_door_open+0xd0>)
 8001f0e:	681b      	ldr	r3, [r3, #0]
 8001f10:	78db      	ldrb	r3, [r3, #3]
 8001f12:	f003 0301 	and.w	r3, r3, #1
 8001f16:	2b00      	cmp	r3, #0
 8001f18:	d14d      	bne.n	8001fb6 <cmd_l_door_open+0xba>
 8001f1a:	4b2c      	ldr	r3, [pc, #176]	; (8001fcc <cmd_l_door_open+0xd0>)
 8001f1c:	681b      	ldr	r3, [r3, #0]
 8001f1e:	791b      	ldrb	r3, [r3, #4]
 8001f20:	f003 0302 	and.w	r3, r3, #2
 8001f24:	2b00      	cmp	r3, #0
 8001f26:	d146      	bne.n	8001fb6 <cmd_l_door_open+0xba>
 8001f28:	4b28      	ldr	r3, [pc, #160]	; (8001fcc <cmd_l_door_open+0xd0>)
 8001f2a:	681b      	ldr	r3, [r3, #0]
 8001f2c:	8d1b      	ldrh	r3, [r3, #40]	; 0x28
 8001f2e:	f44f 7200 	mov.w	r2, #512	; 0x200
 8001f32:	2107      	movs	r1, #7
 8001f34:	2000      	movs	r0, #0
 8001f36:	f7ff fa49 	bl	80013cc <dyn_set_angle>
 8001f3a:	4b24      	ldr	r3, [pc, #144]	; (8001fcc <cmd_l_door_open+0xd0>)
 8001f3c:	6819      	ldr	r1, [r3, #0]
 8001f3e:	4b23      	ldr	r3, [pc, #140]	; (8001fcc <cmd_l_door_open+0xd0>)
 8001f40:	681b      	ldr	r3, [r3, #0]
 8001f42:	781b      	ldrb	r3, [r3, #0]
 8001f44:	1e5a      	subs	r2, r3, #1
 8001f46:	4613      	mov	r3, r2
 8001f48:	00db      	lsls	r3, r3, #3
 8001f4a:	1a9b      	subs	r3, r3, r2
 8001f4c:	009b      	lsls	r3, r3, #2
 8001f4e:	440b      	add	r3, r1
 8001f50:	3334      	adds	r3, #52	; 0x34
 8001f52:	681b      	ldr	r3, [r3, #0]
 8001f54:	4a1d      	ldr	r2, [pc, #116]	; (8001fcc <cmd_l_door_open+0xd0>)
 8001f56:	6810      	ldr	r0, [r2, #0]
 8001f58:	4a1c      	ldr	r2, [pc, #112]	; (8001fcc <cmd_l_door_open+0xd0>)
 8001f5a:	6812      	ldr	r2, [r2, #0]
 8001f5c:	7812      	ldrb	r2, [r2, #0]
 8001f5e:	3a01      	subs	r2, #1
 8001f60:	f503 7116 	add.w	r1, r3, #600	; 0x258
 8001f64:	4613      	mov	r3, r2
 8001f66:	00db      	lsls	r3, r3, #3
 8001f68:	1a9b      	subs	r3, r3, r2
 8001f6a:	009b      	lsls	r3, r3, #2
 8001f6c:	4403      	add	r3, r0
 8001f6e:	3334      	adds	r3, #52	; 0x34
 8001f70:	6019      	str	r1, [r3, #0]
 8001f72:	4b16      	ldr	r3, [pc, #88]	; (8001fcc <cmd_l_door_open+0xd0>)
 8001f74:	681b      	ldr	r3, [r3, #0]
 8001f76:	78da      	ldrb	r2, [r3, #3]
 8001f78:	4b14      	ldr	r3, [pc, #80]	; (8001fcc <cmd_l_door_open+0xd0>)
 8001f7a:	681b      	ldr	r3, [r3, #0]
 8001f7c:	f042 0201 	orr.w	r2, r2, #1
 8001f80:	b2d2      	uxtb	r2, r2
 8001f82:	70da      	strb	r2, [r3, #3]
 8001f84:	4b11      	ldr	r3, [pc, #68]	; (8001fcc <cmd_l_door_open+0xd0>)
 8001f86:	681b      	ldr	r3, [r3, #0]
 8001f88:	791a      	ldrb	r2, [r3, #4]
 8001f8a:	4b10      	ldr	r3, [pc, #64]	; (8001fcc <cmd_l_door_open+0xd0>)
 8001f8c:	681b      	ldr	r3, [r3, #0]
 8001f8e:	f042 0201 	orr.w	r2, r2, #1
 8001f92:	b2d2      	uxtb	r2, r2
 8001f94:	711a      	strb	r2, [r3, #4]
 8001f96:	4b0d      	ldr	r3, [pc, #52]	; (8001fcc <cmd_l_door_open+0xd0>)
 8001f98:	681b      	ldr	r3, [r3, #0]
 8001f9a:	f8d3 0150 	ldr.w	r0, [r3, #336]	; 0x150
 8001f9e:	2300      	movs	r3, #0
 8001fa0:	2202      	movs	r2, #2
 8001fa2:	2100      	movs	r1, #0
 8001fa4:	f005 f822 	bl	8006fec <xTaskGenericNotify>
 8001fa8:	2203      	movs	r2, #3
 8001faa:	4909      	ldr	r1, [pc, #36]	; (8001fd0 <cmd_l_door_open+0xd4>)
 8001fac:	6878      	ldr	r0, [r7, #4]
 8001fae:	f006 fd89 	bl	8008ac4 <memcpy>
 8001fb2:	2303      	movs	r3, #3
 8001fb4:	e006      	b.n	8001fc4 <cmd_l_door_open+0xc8>
 8001fb6:	bf00      	nop
 8001fb8:	2203      	movs	r2, #3
 8001fba:	4906      	ldr	r1, [pc, #24]	; (8001fd4 <cmd_l_door_open+0xd8>)
 8001fbc:	6878      	ldr	r0, [r7, #4]
 8001fbe:	f006 fd81 	bl	8008ac4 <memcpy>
 8001fc2:	2303      	movs	r3, #3
 8001fc4:	4618      	mov	r0, r3
 8001fc6:	3708      	adds	r7, #8
 8001fc8:	46bd      	mov	sp, r7
 8001fca:	bd80      	pop	{r7, pc}
 8001fcc:	2000026c 	.word	0x2000026c
 8001fd0:	0800b29c 	.word	0x0800b29c
 8001fd4:	0800b2a0 	.word	0x0800b2a0

08001fd8 <cmd_l_door_close>:
 8001fd8:	b580      	push	{r7, lr}
 8001fda:	b082      	sub	sp, #8
 8001fdc:	af00      	add	r7, sp, #0
 8001fde:	6078      	str	r0, [r7, #4]
 8001fe0:	4b31      	ldr	r3, [pc, #196]	; (80020a8 <cmd_l_door_close+0xd0>)
 8001fe2:	681b      	ldr	r3, [r3, #0]
 8001fe4:	2b00      	cmp	r3, #0
 8001fe6:	d054      	beq.n	8002092 <cmd_l_door_close+0xba>
 8001fe8:	4b2f      	ldr	r3, [pc, #188]	; (80020a8 <cmd_l_door_close+0xd0>)
 8001fea:	681b      	ldr	r3, [r3, #0]
 8001fec:	78db      	ldrb	r3, [r3, #3]
 8001fee:	f003 0301 	and.w	r3, r3, #1
 8001ff2:	2b00      	cmp	r3, #0
 8001ff4:	d14d      	bne.n	8002092 <cmd_l_door_close+0xba>
 8001ff6:	4b2c      	ldr	r3, [pc, #176]	; (80020a8 <cmd_l_door_close+0xd0>)
 8001ff8:	681b      	ldr	r3, [r3, #0]
 8001ffa:	791b      	ldrb	r3, [r3, #4]
 8001ffc:	f003 0302 	and.w	r3, r3, #2
 8002000:	2b00      	cmp	r3, #0
 8002002:	d146      	bne.n	8002092 <cmd_l_door_close+0xba>
 8002004:	4b28      	ldr	r3, [pc, #160]	; (80020a8 <cmd_l_door_close+0xd0>)
 8002006:	681b      	ldr	r3, [r3, #0]
 8002008:	8d1b      	ldrh	r3, [r3, #40]	; 0x28
 800200a:	f240 32ff 	movw	r2, #1023	; 0x3ff
 800200e:	2107      	movs	r1, #7
 8002010:	2000      	movs	r0, #0
 8002012:	f7ff f9db 	bl	80013cc <dyn_set_angle>
 8002016:	4b24      	ldr	r3, [pc, #144]	; (80020a8 <cmd_l_door_close+0xd0>)
 8002018:	6819      	ldr	r1, [r3, #0]
 800201a:	4b23      	ldr	r3, [pc, #140]	; (80020a8 <cmd_l_door_close+0xd0>)
 800201c:	681b      	ldr	r3, [r3, #0]
 800201e:	781b      	ldrb	r3, [r3, #0]
 8002020:	1e5a      	subs	r2, r3, #1
 8002022:	4613      	mov	r3, r2
 8002024:	00db      	lsls	r3, r3, #3
 8002026:	1a9b      	subs	r3, r3, r2
 8002028:	009b      	lsls	r3, r3, #2
 800202a:	440b      	add	r3, r1
 800202c:	3334      	adds	r3, #52	; 0x34
 800202e:	681b      	ldr	r3, [r3, #0]
 8002030:	4a1d      	ldr	r2, [pc, #116]	; (80020a8 <cmd_l_door_close+0xd0>)
 8002032:	6810      	ldr	r0, [r2, #0]
 8002034:	4a1c      	ldr	r2, [pc, #112]	; (80020a8 <cmd_l_door_close+0xd0>)
 8002036:	6812      	ldr	r2, [r2, #0]
 8002038:	7812      	ldrb	r2, [r2, #0]
 800203a:	3a01      	subs	r2, #1
 800203c:	f503 7116 	add.w	r1, r3, #600	; 0x258
 8002040:	4613      	mov	r3, r2
 8002042:	00db      	lsls	r3, r3, #3
 8002044:	1a9b      	subs	r3, r3, r2
 8002046:	009b      	lsls	r3, r3, #2
 8002048:	4403      	add	r3, r0
 800204a:	3334      	adds	r3, #52	; 0x34
 800204c:	6019      	str	r1, [r3, #0]
 800204e:	4b16      	ldr	r3, [pc, #88]	; (80020a8 <cmd_l_door_close+0xd0>)
 8002050:	681b      	ldr	r3, [r3, #0]
 8002052:	78da      	ldrb	r2, [r3, #3]
 8002054:	4b14      	ldr	r3, [pc, #80]	; (80020a8 <cmd_l_door_close+0xd0>)
 8002056:	681b      	ldr	r3, [r3, #0]
 8002058:	f042 0201 	orr.w	r2, r2, #1
 800205c:	b2d2      	uxtb	r2, r2
 800205e:	70da      	strb	r2, [r3, #3]
 8002060:	4b11      	ldr	r3, [pc, #68]	; (80020a8 <cmd_l_door_close+0xd0>)
 8002062:	681b      	ldr	r3, [r3, #0]
 8002064:	791a      	ldrb	r2, [r3, #4]
 8002066:	4b10      	ldr	r3, [pc, #64]	; (80020a8 <cmd_l_door_close+0xd0>)
 8002068:	681b      	ldr	r3, [r3, #0]
 800206a:	f042 0201 	orr.w	r2, r2, #1
 800206e:	b2d2      	uxtb	r2, r2
 8002070:	711a      	strb	r2, [r3, #4]
 8002072:	4b0d      	ldr	r3, [pc, #52]	; (80020a8 <cmd_l_door_close+0xd0>)
 8002074:	681b      	ldr	r3, [r3, #0]
 8002076:	f8d3 0150 	ldr.w	r0, [r3, #336]	; 0x150
 800207a:	2300      	movs	r3, #0
 800207c:	2202      	movs	r2, #2
 800207e:	2100      	movs	r1, #0
 8002080:	f004 ffb4 	bl	8006fec <xTaskGenericNotify>
 8002084:	2203      	movs	r2, #3
 8002086:	4909      	ldr	r1, [pc, #36]	; (80020ac <cmd_l_door_close+0xd4>)
 8002088:	6878      	ldr	r0, [r7, #4]
 800208a:	f006 fd1b 	bl	8008ac4 <memcpy>
 800208e:	2303      	movs	r3, #3
 8002090:	e006      	b.n	80020a0 <cmd_l_door_close+0xc8>
 8002092:	bf00      	nop
 8002094:	2203      	movs	r2, #3
 8002096:	4906      	ldr	r1, [pc, #24]	; (80020b0 <cmd_l_door_close+0xd8>)
 8002098:	6878      	ldr	r0, [r7, #4]
 800209a:	f006 fd13 	bl	8008ac4 <memcpy>
 800209e:	2303      	movs	r3, #3
 80020a0:	4618      	mov	r0, r3
 80020a2:	3708      	adds	r7, #8
 80020a4:	46bd      	mov	sp, r7
 80020a6:	bd80      	pop	{r7, pc}
 80020a8:	2000026c 	.word	0x2000026c
 80020ac:	0800b29c 	.word	0x0800b29c
 80020b0:	0800b2a0 	.word	0x0800b2a0

080020b4 <cmd_r_door_open>:
 80020b4:	b580      	push	{r7, lr}
 80020b6:	b082      	sub	sp, #8
 80020b8:	af00      	add	r7, sp, #0
 80020ba:	6078      	str	r0, [r7, #4]
 80020bc:	4b31      	ldr	r3, [pc, #196]	; (8002184 <cmd_r_door_open+0xd0>)
 80020be:	681b      	ldr	r3, [r3, #0]
 80020c0:	2b00      	cmp	r3, #0
 80020c2:	d054      	beq.n	800216e <cmd_r_door_open+0xba>
 80020c4:	4b2f      	ldr	r3, [pc, #188]	; (8002184 <cmd_r_door_open+0xd0>)
 80020c6:	681b      	ldr	r3, [r3, #0]
 80020c8:	78db      	ldrb	r3, [r3, #3]
 80020ca:	f003 0301 	and.w	r3, r3, #1
 80020ce:	2b00      	cmp	r3, #0
 80020d0:	d14d      	bne.n	800216e <cmd_r_door_open+0xba>
 80020d2:	4b2c      	ldr	r3, [pc, #176]	; (8002184 <cmd_r_door_open+0xd0>)
 80020d4:	681b      	ldr	r3, [r3, #0]
 80020d6:	791b      	ldrb	r3, [r3, #4]
 80020d8:	f003 0302 	and.w	r3, r3, #2
 80020dc:	2b00      	cmp	r3, #0
 80020de:	d146      	bne.n	800216e <cmd_r_door_open+0xba>
 80020e0:	4b28      	ldr	r3, [pc, #160]	; (8002184 <cmd_r_door_open+0xd0>)
 80020e2:	681b      	ldr	r3, [r3, #0]
 80020e4:	8d5b      	ldrh	r3, [r3, #42]	; 0x2a
 80020e6:	f44f 7200 	mov.w	r2, #512	; 0x200
 80020ea:	2108      	movs	r1, #8
 80020ec:	2000      	movs	r0, #0
 80020ee:	f7ff f96d 	bl	80013cc <dyn_set_angle>
 80020f2:	4b24      	ldr	r3, [pc, #144]	; (8002184 <cmd_r_door_open+0xd0>)
 80020f4:	6819      	ldr	r1, [r3, #0]
 80020f6:	4b23      	ldr	r3, [pc, #140]	; (8002184 <cmd_r_door_open+0xd0>)
 80020f8:	681b      	ldr	r3, [r3, #0]
 80020fa:	781b      	ldrb	r3, [r3, #0]
 80020fc:	1e5a      	subs	r2, r3, #1
 80020fe:	4613      	mov	r3, r2
 8002100:	00db      	lsls	r3, r3, #3
 8002102:	1a9b      	subs	r3, r3, r2
 8002104:	009b      	lsls	r3, r3, #2
 8002106:	440b      	add	r3, r1
 8002108:	3334      	adds	r3, #52	; 0x34
 800210a:	681b      	ldr	r3, [r3, #0]
 800210c:	4a1d      	ldr	r2, [pc, #116]	; (8002184 <cmd_r_door_open+0xd0>)
 800210e:	6810      	ldr	r0, [r2, #0]
 8002110:	4a1c      	ldr	r2, [pc, #112]	; (8002184 <cmd_r_door_open+0xd0>)
 8002112:	6812      	ldr	r2, [r2, #0]
 8002114:	7812      	ldrb	r2, [r2, #0]
 8002116:	3a01      	subs	r2, #1
 8002118:	f503 7116 	add.w	r1, r3, #600	; 0x258
 800211c:	4613      	mov	r3, r2
 800211e:	00db      	lsls	r3, r3, #3
 8002120:	1a9b      	subs	r3, r3, r2
 8002122:	009b      	lsls	r3, r3, #2
 8002124:	4403      	add	r3, r0
 8002126:	3334      	adds	r3, #52	; 0x34
 8002128:	6019      	str	r1, [r3, #0]
 800212a:	4b16      	ldr	r3, [pc, #88]	; (8002184 <cmd_r_door_open+0xd0>)
 800212c:	681b      	ldr	r3, [r3, #0]
 800212e:	78da      	ldrb	r2, [r3, #3]
 8002130:	4b14      	ldr	r3, [pc, #80]	; (8002184 <cmd_r_door_open+0xd0>)
 8002132:	681b      	ldr	r3, [r3, #0]
 8002134:	f042 0201 	orr.w	r2, r2, #1
 8002138:	b2d2      	uxtb	r2, r2
 800213a:	70da      	strb	r2, [r3, #3]
 800213c:	4b11      	ldr	r3, [pc, #68]	; (8002184 <cmd_r_door_open+0xd0>)
 800213e:	681b      	ldr	r3, [r3, #0]
 8002140:	791a      	ldrb	r2, [r3, #4]
 8002142:	4b10      	ldr	r3, [pc, #64]	; (8002184 <cmd_r_door_open+0xd0>)
 8002144:	681b      	ldr	r3, [r3, #0]
 8002146:	f042 0201 	orr.w	r2, r2, #1
 800214a:	b2d2      	uxtb	r2, r2
 800214c:	711a      	strb	r2, [r3, #4]
 800214e:	4b0d      	ldr	r3, [pc, #52]	; (8002184 <cmd_r_door_open+0xd0>)
 8002150:	681b      	ldr	r3, [r3, #0]
 8002152:	f8d3 0150 	ldr.w	r0, [r3, #336]	; 0x150
 8002156:	2300      	movs	r3, #0
 8002158:	2202      	movs	r2, #2
 800215a:	2100      	movs	r1, #0
 800215c:	f004 ff46 	bl	8006fec <xTaskGenericNotify>
 8002160:	2203      	movs	r2, #3
 8002162:	4909      	ldr	r1, [pc, #36]	; (8002188 <cmd_r_door_open+0xd4>)
 8002164:	6878      	ldr	r0, [r7, #4]
 8002166:	f006 fcad 	bl	8008ac4 <memcpy>
 800216a:	2303      	movs	r3, #3
 800216c:	e006      	b.n	800217c <cmd_r_door_open+0xc8>
 800216e:	bf00      	nop
 8002170:	2203      	movs	r2, #3
 8002172:	4906      	ldr	r1, [pc, #24]	; (800218c <cmd_r_door_open+0xd8>)
 8002174:	6878      	ldr	r0, [r7, #4]
 8002176:	f006 fca5 	bl	8008ac4 <memcpy>
 800217a:	2303      	movs	r3, #3
 800217c:	4618      	mov	r0, r3
 800217e:	3708      	adds	r7, #8
 8002180:	46bd      	mov	sp, r7
 8002182:	bd80      	pop	{r7, pc}
 8002184:	2000026c 	.word	0x2000026c
 8002188:	0800b29c 	.word	0x0800b29c
 800218c:	0800b2a0 	.word	0x0800b2a0

08002190 <cmd_r_door_close>:
 8002190:	b580      	push	{r7, lr}
 8002192:	b082      	sub	sp, #8
 8002194:	af00      	add	r7, sp, #0
 8002196:	6078      	str	r0, [r7, #4]
 8002198:	4b31      	ldr	r3, [pc, #196]	; (8002260 <cmd_r_door_close+0xd0>)
 800219a:	681b      	ldr	r3, [r3, #0]
 800219c:	2b00      	cmp	r3, #0
 800219e:	d054      	beq.n	800224a <cmd_r_door_close+0xba>
 80021a0:	4b2f      	ldr	r3, [pc, #188]	; (8002260 <cmd_r_door_close+0xd0>)
 80021a2:	681b      	ldr	r3, [r3, #0]
 80021a4:	78db      	ldrb	r3, [r3, #3]
 80021a6:	f003 0301 	and.w	r3, r3, #1
 80021aa:	2b00      	cmp	r3, #0
 80021ac:	d14d      	bne.n	800224a <cmd_r_door_close+0xba>
 80021ae:	4b2c      	ldr	r3, [pc, #176]	; (8002260 <cmd_r_door_close+0xd0>)
 80021b0:	681b      	ldr	r3, [r3, #0]
 80021b2:	791b      	ldrb	r3, [r3, #4]
 80021b4:	f003 0302 	and.w	r3, r3, #2
 80021b8:	2b00      	cmp	r3, #0
 80021ba:	d146      	bne.n	800224a <cmd_r_door_close+0xba>
 80021bc:	4b28      	ldr	r3, [pc, #160]	; (8002260 <cmd_r_door_close+0xd0>)
 80021be:	681b      	ldr	r3, [r3, #0]
 80021c0:	8d5b      	ldrh	r3, [r3, #42]	; 0x2a
 80021c2:	f240 32ff 	movw	r2, #1023	; 0x3ff
 80021c6:	2108      	movs	r1, #8
 80021c8:	2000      	movs	r0, #0
 80021ca:	f7ff f8ff 	bl	80013cc <dyn_set_angle>
 80021ce:	4b24      	ldr	r3, [pc, #144]	; (8002260 <cmd_r_door_close+0xd0>)
 80021d0:	6819      	ldr	r1, [r3, #0]
 80021d2:	4b23      	ldr	r3, [pc, #140]	; (8002260 <cmd_r_door_close+0xd0>)
 80021d4:	681b      	ldr	r3, [r3, #0]
 80021d6:	781b      	ldrb	r3, [r3, #0]
 80021d8:	1e5a      	subs	r2, r3, #1
 80021da:	4613      	mov	r3, r2
 80021dc:	00db      	lsls	r3, r3, #3
 80021de:	1a9b      	subs	r3, r3, r2
 80021e0:	009b      	lsls	r3, r3, #2
 80021e2:	440b      	add	r3, r1
 80021e4:	3334      	adds	r3, #52	; 0x34
 80021e6:	681b      	ldr	r3, [r3, #0]
 80021e8:	4a1d      	ldr	r2, [pc, #116]	; (8002260 <cmd_r_door_close+0xd0>)
 80021ea:	6810      	ldr	r0, [r2, #0]
 80021ec:	4a1c      	ldr	r2, [pc, #112]	; (8002260 <cmd_r_door_close+0xd0>)
 80021ee:	6812      	ldr	r2, [r2, #0]
 80021f0:	7812      	ldrb	r2, [r2, #0]
 80021f2:	3a01      	subs	r2, #1
 80021f4:	f503 7116 	add.w	r1, r3, #600	; 0x258
 80021f8:	4613      	mov	r3, r2
 80021fa:	00db      	lsls	r3, r3, #3
 80021fc:	1a9b      	subs	r3, r3, r2
 80021fe:	009b      	lsls	r3, r3, #2
 8002200:	4403      	add	r3, r0
 8002202:	3334      	adds	r3, #52	; 0x34
 8002204:	6019      	str	r1, [r3, #0]
 8002206:	4b16      	ldr	r3, [pc, #88]	; (8002260 <cmd_r_door_close+0xd0>)
 8002208:	681b      	ldr	r3, [r3, #0]
 800220a:	78da      	ldrb	r2, [r3, #3]
 800220c:	4b14      	ldr	r3, [pc, #80]	; (8002260 <cmd_r_door_close+0xd0>)
 800220e:	681b      	ldr	r3, [r3, #0]
 8002210:	f042 0201 	orr.w	r2, r2, #1
 8002214:	b2d2      	uxtb	r2, r2
 8002216:	70da      	strb	r2, [r3, #3]
 8002218:	4b11      	ldr	r3, [pc, #68]	; (8002260 <cmd_r_door_close+0xd0>)
 800221a:	681b      	ldr	r3, [r3, #0]
 800221c:	791a      	ldrb	r2, [r3, #4]
 800221e:	4b10      	ldr	r3, [pc, #64]	; (8002260 <cmd_r_door_close+0xd0>)
 8002220:	681b      	ldr	r3, [r3, #0]
 8002222:	f042 0201 	orr.w	r2, r2, #1
 8002226:	b2d2      	uxtb	r2, r2
 8002228:	711a      	strb	r2, [r3, #4]
 800222a:	4b0d      	ldr	r3, [pc, #52]	; (8002260 <cmd_r_door_close+0xd0>)
 800222c:	681b      	ldr	r3, [r3, #0]
 800222e:	f8d3 0150 	ldr.w	r0, [r3, #336]	; 0x150
 8002232:	2300      	movs	r3, #0
 8002234:	2202      	movs	r2, #2
 8002236:	2100      	movs	r1, #0
 8002238:	f004 fed8 	bl	8006fec <xTaskGenericNotify>
 800223c:	2203      	movs	r2, #3
 800223e:	4909      	ldr	r1, [pc, #36]	; (8002264 <cmd_r_door_close+0xd4>)
 8002240:	6878      	ldr	r0, [r7, #4]
 8002242:	f006 fc3f 	bl	8008ac4 <memcpy>
 8002246:	2303      	movs	r3, #3
 8002248:	e006      	b.n	8002258 <cmd_r_door_close+0xc8>
 800224a:	bf00      	nop
 800224c:	2203      	movs	r2, #3
 800224e:	4906      	ldr	r1, [pc, #24]	; (8002268 <cmd_r_door_close+0xd8>)
 8002250:	6878      	ldr	r0, [r7, #4]
 8002252:	f006 fc37 	bl	8008ac4 <memcpy>
 8002256:	2303      	movs	r3, #3
 8002258:	4618      	mov	r0, r3
 800225a:	3708      	adds	r7, #8
 800225c:	46bd      	mov	sp, r7
 800225e:	bd80      	pop	{r7, pc}
 8002260:	2000026c 	.word	0x2000026c
 8002264:	0800b29c 	.word	0x0800b29c
 8002268:	0800b2a0 	.word	0x0800b2a0

0800226c <TIM8_UP_TIM13_IRQHandler>:
 800226c:	b580      	push	{r7, lr}
 800226e:	b082      	sub	sp, #8
 8002270:	af00      	add	r7, sp, #0
 8002272:	2300      	movs	r3, #0
 8002274:	607b      	str	r3, [r7, #4]
 8002276:	4814      	ldr	r0, [pc, #80]	; (80022c8 <TIM8_UP_TIM13_IRQHandler+0x5c>)
 8002278:	f7ff f821 	bl	80012be <LL_TIM_IsActiveFlag_UPDATE>
 800227c:	4603      	mov	r3, r0
 800227e:	2b00      	cmp	r3, #0
 8002280:	d012      	beq.n	80022a8 <TIM8_UP_TIM13_IRQHandler+0x3c>
 8002282:	4811      	ldr	r0, [pc, #68]	; (80022c8 <TIM8_UP_TIM13_IRQHandler+0x5c>)
 8002284:	f7ff f80d 	bl	80012a2 <LL_TIM_ClearFlag_UPDATE>
 8002288:	4b10      	ldr	r3, [pc, #64]	; (80022cc <TIM8_UP_TIM13_IRQHandler+0x60>)
 800228a:	681b      	ldr	r3, [r3, #0]
 800228c:	689a      	ldr	r2, [r3, #8]
 800228e:	4b0f      	ldr	r3, [pc, #60]	; (80022cc <TIM8_UP_TIM13_IRQHandler+0x60>)
 8002290:	681b      	ldr	r3, [r3, #0]
 8002292:	3201      	adds	r2, #1
 8002294:	609a      	str	r2, [r3, #8]
 8002296:	4b0d      	ldr	r3, [pc, #52]	; (80022cc <TIM8_UP_TIM13_IRQHandler+0x60>)
 8002298:	681b      	ldr	r3, [r3, #0]
 800229a:	f8d3 3150 	ldr.w	r3, [r3, #336]	; 0x150
 800229e:	1d3a      	adds	r2, r7, #4
 80022a0:	4611      	mov	r1, r2
 80022a2:	4618      	mov	r0, r3
 80022a4:	f004 ff5e 	bl	8007164 <vTaskNotifyGiveFromISR>
 80022a8:	687b      	ldr	r3, [r7, #4]
 80022aa:	2b00      	cmp	r3, #0
 80022ac:	d007      	beq.n	80022be <TIM8_UP_TIM13_IRQHandler+0x52>
 80022ae:	4b08      	ldr	r3, [pc, #32]	; (80022d0 <TIM8_UP_TIM13_IRQHandler+0x64>)
 80022b0:	f04f 5280 	mov.w	r2, #268435456	; 0x10000000
 80022b4:	601a      	str	r2, [r3, #0]
 80022b6:	f3bf 8f4f 	dsb	sy
 80022ba:	f3bf 8f6f 	isb	sy
 80022be:	bf00      	nop
 80022c0:	3708      	adds	r7, #8
 80022c2:	46bd      	mov	sp, r7
 80022c4:	bd80      	pop	{r7, pc}
 80022c6:	bf00      	nop
 80022c8:	40010400 	.word	0x40010400
 80022cc:	2000026c 	.word	0x2000026c
 80022d0:	e000ed04 	.word	0xe000ed04

080022d4 <LL_RCC_HSE_Disable>:
 80022d4:	b480      	push	{r7}
 80022d6:	af00      	add	r7, sp, #0
 80022d8:	4b05      	ldr	r3, [pc, #20]	; (80022f0 <LL_RCC_HSE_Disable+0x1c>)
 80022da:	681b      	ldr	r3, [r3, #0]
 80022dc:	4a04      	ldr	r2, [pc, #16]	; (80022f0 <LL_RCC_HSE_Disable+0x1c>)
 80022de:	f423 3380 	bic.w	r3, r3, #65536	; 0x10000
 80022e2:	6013      	str	r3, [r2, #0]
 80022e4:	bf00      	nop
 80022e6:	46bd      	mov	sp, r7
 80022e8:	f85d 7b04 	ldr.w	r7, [sp], #4
 80022ec:	4770      	bx	lr
 80022ee:	bf00      	nop
 80022f0:	40023800 	.word	0x40023800

080022f4 <LL_RCC_HSI_Enable>:
 80022f4:	b480      	push	{r7}
 80022f6:	af00      	add	r7, sp, #0
 80022f8:	4b05      	ldr	r3, [pc, #20]	; (8002310 <LL_RCC_HSI_Enable+0x1c>)
 80022fa:	681b      	ldr	r3, [r3, #0]
 80022fc:	4a04      	ldr	r2, [pc, #16]	; (8002310 <LL_RCC_HSI_Enable+0x1c>)
 80022fe:	f043 0301 	orr.w	r3, r3, #1
 8002302:	6013      	str	r3, [r2, #0]
 8002304:	bf00      	nop
 8002306:	46bd      	mov	sp, r7
 8002308:	f85d 7b04 	ldr.w	r7, [sp], #4
 800230c:	4770      	bx	lr
 800230e:	bf00      	nop
 8002310:	40023800 	.word	0x40023800

08002314 <LL_RCC_HSI_IsReady>:
 8002314:	b480      	push	{r7}
 8002316:	af00      	add	r7, sp, #0
 8002318:	4b06      	ldr	r3, [pc, #24]	; (8002334 <LL_RCC_HSI_IsReady+0x20>)
 800231a:	681b      	ldr	r3, [r3, #0]
 800231c:	f003 0302 	and.w	r3, r3, #2
 8002320:	2b02      	cmp	r3, #2
 8002322:	bf0c      	ite	eq
 8002324:	2301      	moveq	r3, #1
 8002326:	2300      	movne	r3, #0
 8002328:	b2db      	uxtb	r3, r3
 800232a:	4618      	mov	r0, r3
 800232c:	46bd      	mov	sp, r7
 800232e:	f85d 7b04 	ldr.w	r7, [sp], #4
 8002332:	4770      	bx	lr
 8002334:	40023800 	.word	0x40023800

08002338 <LL_RCC_SetAHBPrescaler>:
 8002338:	b480      	push	{r7}
 800233a:	b083      	sub	sp, #12
 800233c:	af00      	add	r7, sp, #0
 800233e:	6078      	str	r0, [r7, #4]
 8002340:	4b06      	ldr	r3, [pc, #24]	; (800235c <LL_RCC_SetAHBPrescaler+0x24>)
 8002342:	689b      	ldr	r3, [r3, #8]
 8002344:	f023 02f0 	bic.w	r2, r3, #240	; 0xf0
 8002348:	4904      	ldr	r1, [pc, #16]	; (800235c <LL_RCC_SetAHBPrescaler+0x24>)
 800234a:	687b      	ldr	r3, [r7, #4]
 800234c:	4313      	orrs	r3, r2
 800234e:	608b      	str	r3, [r1, #8]
 8002350:	bf00      	nop
 8002352:	370c      	adds	r7, #12
 8002354:	46bd      	mov	sp, r7
 8002356:	f85d 7b04 	ldr.w	r7, [sp], #4
 800235a:	4770      	bx	lr
 800235c:	40023800 	.word	0x40023800

08002360 <LL_RCC_SetAPB1Prescaler>:
 8002360:	b480      	push	{r7}
 8002362:	b083      	sub	sp, #12
 8002364:	af00      	add	r7, sp, #0
 8002366:	6078      	str	r0, [r7, #4]
 8002368:	4b06      	ldr	r3, [pc, #24]	; (8002384 <LL_RCC_SetAPB1Prescaler+0x24>)
 800236a:	689b      	ldr	r3, [r3, #8]
 800236c:	f423 52e0 	bic.w	r2, r3, #7168	; 0x1c00
 8002370:	4904      	ldr	r1, [pc, #16]	; (8002384 <LL_RCC_SetAPB1Prescaler+0x24>)
 8002372:	687b      	ldr	r3, [r7, #4]
 8002374:	4313      	orrs	r3, r2
 8002376:	608b      	str	r3, [r1, #8]
 8002378:	bf00      	nop
 800237a:	370c      	adds	r7, #12
 800237c:	46bd      	mov	sp, r7
 800237e:	f85d 7b04 	ldr.w	r7, [sp], #4
 8002382:	4770      	bx	lr
 8002384:	40023800 	.word	0x40023800

08002388 <LL_RCC_SetAPB2Prescaler>:
 8002388:	b480      	push	{r7}
 800238a:	b083      	sub	sp, #12
 800238c:	af00      	add	r7, sp, #0
 800238e:	6078      	str	r0, [r7, #4]
 8002390:	4b06      	ldr	r3, [pc, #24]	; (80023ac <LL_RCC_SetAPB2Prescaler+0x24>)
 8002392:	689b      	ldr	r3, [r3, #8]
 8002394:	f423 4260 	bic.w	r2, r3, #57344	; 0xe000
 8002398:	4904      	ldr	r1, [pc, #16]	; (80023ac <LL_RCC_SetAPB2Prescaler+0x24>)
 800239a:	687b      	ldr	r3, [r7, #4]
 800239c:	4313      	orrs	r3, r2
 800239e:	608b      	str	r3, [r1, #8]
 80023a0:	bf00      	nop
 80023a2:	370c      	adds	r7, #12
 80023a4:	46bd      	mov	sp, r7
 80023a6:	f85d 7b04 	ldr.w	r7, [sp], #4
 80023aa:	4770      	bx	lr
 80023ac:	40023800 	.word	0x40023800

080023b0 <LL_RCC_PLL_Disable>:
 80023b0:	b480      	push	{r7}
 80023b2:	af00      	add	r7, sp, #0
 80023b4:	4b05      	ldr	r3, [pc, #20]	; (80023cc <LL_RCC_PLL_Disable+0x1c>)
 80023b6:	681b      	ldr	r3, [r3, #0]
 80023b8:	4a04      	ldr	r2, [pc, #16]	; (80023cc <LL_RCC_PLL_Disable+0x1c>)
 80023ba:	f023 7380 	bic.w	r3, r3, #16777216	; 0x1000000
 80023be:	6013      	str	r3, [r2, #0]
 80023c0:	bf00      	nop
 80023c2:	46bd      	mov	sp, r7
 80023c4:	f85d 7b04 	ldr.w	r7, [sp], #4
 80023c8:	4770      	bx	lr
 80023ca:	bf00      	nop
 80023cc:	40023800 	.word	0x40023800

080023d0 <DeInit>:
 80023d0:	b580      	push	{r7, lr}
 80023d2:	af00      	add	r7, sp, #0
 80023d4:	f7ff ffec 	bl	80023b0 <LL_RCC_PLL_Disable>
 80023d8:	f7ff ff7c 	bl	80022d4 <LL_RCC_HSE_Disable>
 80023dc:	f7ff ff8a 	bl	80022f4 <LL_RCC_HSI_Enable>
 80023e0:	bf00      	nop
 80023e2:	f7ff ff97 	bl	8002314 <LL_RCC_HSI_IsReady>
 80023e6:	4603      	mov	r3, r0
 80023e8:	2b01      	cmp	r3, #1
 80023ea:	d1fa      	bne.n	80023e2 <DeInit+0x12>
 80023ec:	2000      	movs	r0, #0
 80023ee:	f7ff ffa3 	bl	8002338 <LL_RCC_SetAHBPrescaler>
 80023f2:	2000      	movs	r0, #0
 80023f4:	f7ff ffb4 	bl	8002360 <LL_RCC_SetAPB1Prescaler>
 80023f8:	2000      	movs	r0, #0
 80023fa:	f7ff ffc5 	bl	8002388 <LL_RCC_SetAPB2Prescaler>
 80023fe:	4b07      	ldr	r3, [pc, #28]	; (800241c <DeInit+0x4c>)
 8002400:	2200      	movs	r2, #0
 8002402:	601a      	str	r2, [r3, #0]
 8002404:	4b05      	ldr	r3, [pc, #20]	; (800241c <DeInit+0x4c>)
 8002406:	2200      	movs	r2, #0
 8002408:	605a      	str	r2, [r3, #4]
 800240a:	4b04      	ldr	r3, [pc, #16]	; (800241c <DeInit+0x4c>)
 800240c:	2200      	movs	r2, #0
 800240e:	609a      	str	r2, [r3, #8]
 8002410:	b672      	cpsid	i
 8002412:	4b03      	ldr	r3, [pc, #12]	; (8002420 <DeInit+0x50>)
 8002414:	2201      	movs	r2, #1
 8002416:	601a      	str	r2, [r3, #0]
 8002418:	bf00      	nop
 800241a:	bd80      	pop	{r7, pc}
 800241c:	e000e010 	.word	0xe000e010
 8002420:	40013800 	.word	0x40013800

08002424 <init_bootloader>:
 8002424:	b580      	push	{r7, lr}
 8002426:	b084      	sub	sp, #16
 8002428:	af00      	add	r7, sp, #0
 800242a:	4b0a      	ldr	r3, [pc, #40]	; (8002454 <init_bootloader+0x30>)
 800242c:	607b      	str	r3, [r7, #4]
 800242e:	f7ff ffcf 	bl	80023d0 <DeInit>
 8002432:	687b      	ldr	r3, [r7, #4]
 8002434:	3304      	adds	r3, #4
 8002436:	681b      	ldr	r3, [r3, #0]
 8002438:	60fb      	str	r3, [r7, #12]
 800243a:	687b      	ldr	r3, [r7, #4]
 800243c:	681b      	ldr	r3, [r3, #0]
 800243e:	60bb      	str	r3, [r7, #8]
 8002440:	68bb      	ldr	r3, [r7, #8]
 8002442:	f383 8808 	msr	MSP, r3
 8002446:	68fb      	ldr	r3, [r7, #12]
 8002448:	4798      	blx	r3
 800244a:	bf00      	nop
 800244c:	3710      	adds	r7, #16
 800244e:	46bd      	mov	sp, r7
 8002450:	bd80      	pop	{r7, pc}
 8002452:	bf00      	nop
 8002454:	1fff0000 	.word	0x1fff0000

08002458 <cmd_bootloader>:
 8002458:	b580      	push	{r7, lr}
 800245a:	b082      	sub	sp, #8
 800245c:	af00      	add	r7, sp, #0
 800245e:	6078      	str	r0, [r7, #4]
 8002460:	f7ff ffe0 	bl	8002424 <init_bootloader>
 8002464:	2203      	movs	r2, #3
 8002466:	4904      	ldr	r1, [pc, #16]	; (8002478 <cmd_bootloader+0x20>)
 8002468:	6878      	ldr	r0, [r7, #4]
 800246a:	f006 fb2b 	bl	8008ac4 <memcpy>
 800246e:	2303      	movs	r3, #3
 8002470:	4618      	mov	r0, r3
 8002472:	3708      	adds	r7, #8
 8002474:	46bd      	mov	sp, r7
 8002476:	bd80      	pop	{r7, pc}
 8002478:	0800b2a4 	.word	0x0800b2a4

0800247c <NVIC_EnableIRQ>:
 800247c:	b480      	push	{r7}
 800247e:	b083      	sub	sp, #12
 8002480:	af00      	add	r7, sp, #0
 8002482:	4603      	mov	r3, r0
 8002484:	71fb      	strb	r3, [r7, #7]
 8002486:	79fb      	ldrb	r3, [r7, #7]
 8002488:	f003 021f 	and.w	r2, r3, #31
 800248c:	4907      	ldr	r1, [pc, #28]	; (80024ac <NVIC_EnableIRQ+0x30>)
 800248e:	f997 3007 	ldrsb.w	r3, [r7, #7]
 8002492:	095b      	lsrs	r3, r3, #5
 8002494:	2001      	movs	r0, #1
 8002496:	fa00 f202 	lsl.w	r2, r0, r2
 800249a:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
 800249e:	bf00      	nop
 80024a0:	370c      	adds	r7, #12
 80024a2:	46bd      	mov	sp, r7
 80024a4:	f85d 7b04 	ldr.w	r7, [sp], #4
 80024a8:	4770      	bx	lr
 80024aa:	bf00      	nop
 80024ac:	e000e100 	.word	0xe000e100

080024b0 <NVIC_SetPriority>:
 80024b0:	b480      	push	{r7}
 80024b2:	b083      	sub	sp, #12
 80024b4:	af00      	add	r7, sp, #0
 80024b6:	4603      	mov	r3, r0
 80024b8:	6039      	str	r1, [r7, #0]
 80024ba:	71fb      	strb	r3, [r7, #7]
 80024bc:	f997 3007 	ldrsb.w	r3, [r7, #7]
 80024c0:	2b00      	cmp	r3, #0
 80024c2:	da0b      	bge.n	80024dc <NVIC_SetPriority+0x2c>
 80024c4:	683b      	ldr	r3, [r7, #0]
 80024c6:	b2da      	uxtb	r2, r3
 80024c8:	490c      	ldr	r1, [pc, #48]	; (80024fc <NVIC_SetPriority+0x4c>)
 80024ca:	79fb      	ldrb	r3, [r7, #7]
 80024cc:	f003 030f 	and.w	r3, r3, #15
 80024d0:	3b04      	subs	r3, #4
 80024d2:	0112      	lsls	r2, r2, #4
 80024d4:	b2d2      	uxtb	r2, r2
 80024d6:	440b      	add	r3, r1
 80024d8:	761a      	strb	r2, [r3, #24]
 80024da:	e009      	b.n	80024f0 <NVIC_SetPriority+0x40>
 80024dc:	683b      	ldr	r3, [r7, #0]
 80024de:	b2da      	uxtb	r2, r3
 80024e0:	4907      	ldr	r1, [pc, #28]	; (8002500 <NVIC_SetPriority+0x50>)
 80024e2:	f997 3007 	ldrsb.w	r3, [r7, #7]
 80024e6:	0112      	lsls	r2, r2, #4
 80024e8:	b2d2      	uxtb	r2, r2
 80024ea:	440b      	add	r3, r1
 80024ec:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 80024f0:	bf00      	nop
 80024f2:	370c      	adds	r7, #12
 80024f4:	46bd      	mov	sp, r7
 80024f6:	f85d 7b04 	ldr.w	r7, [sp], #4
 80024fa:	4770      	bx	lr
 80024fc:	e000ed00 	.word	0xe000ed00
 8002500:	e000e100 	.word	0xe000e100

08002504 <LL_USART_Enable>:
 8002504:	b480      	push	{r7}
 8002506:	b083      	sub	sp, #12
 8002508:	af00      	add	r7, sp, #0
 800250a:	6078      	str	r0, [r7, #4]
 800250c:	687b      	ldr	r3, [r7, #4]
 800250e:	68db      	ldr	r3, [r3, #12]
 8002510:	f443 5200 	orr.w	r2, r3, #8192	; 0x2000
 8002514:	687b      	ldr	r3, [r7, #4]
 8002516:	60da      	str	r2, [r3, #12]
 8002518:	bf00      	nop
 800251a:	370c      	adds	r7, #12
 800251c:	46bd      	mov	sp, r7
 800251e:	f85d 7b04 	ldr.w	r7, [sp], #4
 8002522:	4770      	bx	lr

08002524 <LL_USART_EnableDirectionRx>:
 8002524:	b480      	push	{r7}
 8002526:	b083      	sub	sp, #12
 8002528:	af00      	add	r7, sp, #0
 800252a:	6078      	str	r0, [r7, #4]
 800252c:	687b      	ldr	r3, [r7, #4]
 800252e:	68db      	ldr	r3, [r3, #12]
 8002530:	f043 0204 	orr.w	r2, r3, #4
 8002534:	687b      	ldr	r3, [r7, #4]
 8002536:	60da      	str	r2, [r3, #12]
 8002538:	bf00      	nop
 800253a:	370c      	adds	r7, #12
 800253c:	46bd      	mov	sp, r7
 800253e:	f85d 7b04 	ldr.w	r7, [sp], #4
 8002542:	4770      	bx	lr

08002544 <LL_USART_EnableDirectionTx>:
 8002544:	b480      	push	{r7}
 8002546:	b083      	sub	sp, #12
 8002548:	af00      	add	r7, sp, #0
 800254a:	6078      	str	r0, [r7, #4]
 800254c:	687b      	ldr	r3, [r7, #4]
 800254e:	68db      	ldr	r3, [r3, #12]
 8002550:	f043 0208 	orr.w	r2, r3, #8
 8002554:	687b      	ldr	r3, [r7, #4]
 8002556:	60da      	str	r2, [r3, #12]
 8002558:	bf00      	nop
 800255a:	370c      	adds	r7, #12
 800255c:	46bd      	mov	sp, r7
 800255e:	f85d 7b04 	ldr.w	r7, [sp], #4
 8002562:	4770      	bx	lr

08002564 <LL_USART_SetTransferDirection>:
 8002564:	b480      	push	{r7}
 8002566:	b083      	sub	sp, #12
 8002568:	af00      	add	r7, sp, #0
 800256a:	6078      	str	r0, [r7, #4]
 800256c:	6039      	str	r1, [r7, #0]
 800256e:	687b      	ldr	r3, [r7, #4]
 8002570:	68db      	ldr	r3, [r3, #12]
 8002572:	f023 020c 	bic.w	r2, r3, #12
 8002576:	683b      	ldr	r3, [r7, #0]
 8002578:	431a      	orrs	r2, r3
 800257a:	687b      	ldr	r3, [r7, #4]
 800257c:	60da      	str	r2, [r3, #12]
 800257e:	bf00      	nop
 8002580:	370c      	adds	r7, #12
 8002582:	46bd      	mov	sp, r7
 8002584:	f85d 7b04 	ldr.w	r7, [sp], #4
 8002588:	4770      	bx	lr

0800258a <LL_USART_SetParity>:
 800258a:	b480      	push	{r7}
 800258c:	b083      	sub	sp, #12
 800258e:	af00      	add	r7, sp, #0
 8002590:	6078      	str	r0, [r7, #4]
 8002592:	6039      	str	r1, [r7, #0]
 8002594:	687b      	ldr	r3, [r7, #4]
 8002596:	68db      	ldr	r3, [r3, #12]
 8002598:	f423 62c0 	bic.w	r2, r3, #1536	; 0x600
 800259c:	683b      	ldr	r3, [r7, #0]
 800259e:	431a      	orrs	r2, r3
 80025a0:	687b      	ldr	r3, [r7, #4]
 80025a2:	60da      	str	r2, [r3, #12]
 80025a4:	bf00      	nop
 80025a6:	370c      	adds	r7, #12
 80025a8:	46bd      	mov	sp, r7
 80025aa:	f85d 7b04 	ldr.w	r7, [sp], #4
 80025ae:	4770      	bx	lr

080025b0 <LL_USART_SetDataWidth>:
 80025b0:	b480      	push	{r7}
 80025b2:	b083      	sub	sp, #12
 80025b4:	af00      	add	r7, sp, #0
 80025b6:	6078      	str	r0, [r7, #4]
 80025b8:	6039      	str	r1, [r7, #0]
 80025ba:	687b      	ldr	r3, [r7, #4]
 80025bc:	68db      	ldr	r3, [r3, #12]
 80025be:	f423 5280 	bic.w	r2, r3, #4096	; 0x1000
 80025c2:	683b      	ldr	r3, [r7, #0]
 80025c4:	431a      	orrs	r2, r3
 80025c6:	687b      	ldr	r3, [r7, #4]
 80025c8:	60da      	str	r2, [r3, #12]
 80025ca:	bf00      	nop
 80025cc:	370c      	adds	r7, #12
 80025ce:	46bd      	mov	sp, r7
 80025d0:	f85d 7b04 	ldr.w	r7, [sp], #4
 80025d4:	4770      	bx	lr

080025d6 <LL_USART_SetStopBitsLength>:
 80025d6:	b480      	push	{r7}
 80025d8:	b083      	sub	sp, #12
 80025da:	af00      	add	r7, sp, #0
 80025dc:	6078      	str	r0, [r7, #4]
 80025de:	6039      	str	r1, [r7, #0]
 80025e0:	687b      	ldr	r3, [r7, #4]
 80025e2:	691b      	ldr	r3, [r3, #16]
 80025e4:	f423 5240 	bic.w	r2, r3, #12288	; 0x3000
 80025e8:	683b      	ldr	r3, [r7, #0]
 80025ea:	431a      	orrs	r2, r3
 80025ec:	687b      	ldr	r3, [r7, #4]
 80025ee:	611a      	str	r2, [r3, #16]
 80025f0:	bf00      	nop
 80025f2:	370c      	adds	r7, #12
 80025f4:	46bd      	mov	sp, r7
 80025f6:	f85d 7b04 	ldr.w	r7, [sp], #4
 80025fa:	4770      	bx	lr

080025fc <LL_USART_SetHWFlowCtrl>:
 80025fc:	b480      	push	{r7}
 80025fe:	b083      	sub	sp, #12
 8002600:	af00      	add	r7, sp, #0
 8002602:	6078      	str	r0, [r7, #4]
 8002604:	6039      	str	r1, [r7, #0]
 8002606:	687b      	ldr	r3, [r7, #4]
 8002608:	695b      	ldr	r3, [r3, #20]
 800260a:	f423 7240 	bic.w	r2, r3, #768	; 0x300
 800260e:	683b      	ldr	r3, [r7, #0]
 8002610:	431a      	orrs	r2, r3
 8002612:	687b      	ldr	r3, [r7, #4]
 8002614:	615a      	str	r2, [r3, #20]
 8002616:	bf00      	nop
 8002618:	370c      	adds	r7, #12
 800261a:	46bd      	mov	sp, r7
 800261c:	f85d 7b04 	ldr.w	r7, [sp], #4
 8002620:	4770      	bx	lr
	...

08002624 <LL_USART_SetBaudRate>:
 8002624:	b480      	push	{r7}
 8002626:	b085      	sub	sp, #20
 8002628:	af00      	add	r7, sp, #0
 800262a:	60f8      	str	r0, [r7, #12]
 800262c:	60b9      	str	r1, [r7, #8]
 800262e:	607a      	str	r2, [r7, #4]
 8002630:	603b      	str	r3, [r7, #0]
 8002632:	687b      	ldr	r3, [r7, #4]
 8002634:	f5b3 4f00 	cmp.w	r3, #32768	; 0x8000
 8002638:	d152      	bne.n	80026e0 <LL_USART_SetBaudRate+0xbc>
 800263a:	68ba      	ldr	r2, [r7, #8]
 800263c:	4613      	mov	r3, r2
 800263e:	009b      	lsls	r3, r3, #2
 8002640:	4413      	add	r3, r2
 8002642:	009a      	lsls	r2, r3, #2
 8002644:	441a      	add	r2, r3
 8002646:	683b      	ldr	r3, [r7, #0]
 8002648:	005b      	lsls	r3, r3, #1
 800264a:	fbb2 f3f3 	udiv	r3, r2, r3
 800264e:	4a4f      	ldr	r2, [pc, #316]	; (800278c <LL_USART_SetBaudRate+0x168>)
 8002650:	fba2 2303 	umull	r2, r3, r2, r3
 8002654:	095b      	lsrs	r3, r3, #5
 8002656:	b29b      	uxth	r3, r3
 8002658:	011b      	lsls	r3, r3, #4
 800265a:	b299      	uxth	r1, r3
 800265c:	68ba      	ldr	r2, [r7, #8]
 800265e:	4613      	mov	r3, r2
 8002660:	009b      	lsls	r3, r3, #2
 8002662:	4413      	add	r3, r2
 8002664:	009a      	lsls	r2, r3, #2
 8002666:	441a      	add	r2, r3
 8002668:	683b      	ldr	r3, [r7, #0]
 800266a:	005b      	lsls	r3, r3, #1
 800266c:	fbb2 f2f3 	udiv	r2, r2, r3
 8002670:	4b46      	ldr	r3, [pc, #280]	; (800278c <LL_USART_SetBaudRate+0x168>)
 8002672:	fba3 0302 	umull	r0, r3, r3, r2
 8002676:	095b      	lsrs	r3, r3, #5
 8002678:	2064      	movs	r0, #100	; 0x64
 800267a:	fb00 f303 	mul.w	r3, r0, r3
 800267e:	1ad3      	subs	r3, r2, r3
 8002680:	00db      	lsls	r3, r3, #3
 8002682:	3332      	adds	r3, #50	; 0x32
 8002684:	4a41      	ldr	r2, [pc, #260]	; (800278c <LL_USART_SetBaudRate+0x168>)
 8002686:	fba2 2303 	umull	r2, r3, r2, r3
 800268a:	095b      	lsrs	r3, r3, #5
 800268c:	b29b      	uxth	r3, r3
 800268e:	005b      	lsls	r3, r3, #1
 8002690:	b29b      	uxth	r3, r3
 8002692:	f403 73f8 	and.w	r3, r3, #496	; 0x1f0
 8002696:	b29b      	uxth	r3, r3
 8002698:	440b      	add	r3, r1
 800269a:	b299      	uxth	r1, r3
 800269c:	68ba      	ldr	r2, [r7, #8]
 800269e:	4613      	mov	r3, r2
 80026a0:	009b      	lsls	r3, r3, #2
 80026a2:	4413      	add	r3, r2
 80026a4:	009a      	lsls	r2, r3, #2
 80026a6:	441a      	add	r2, r3
 80026a8:	683b      	ldr	r3, [r7, #0]
 80026aa:	005b      	lsls	r3, r3, #1
 80026ac:	fbb2 f2f3 	udiv	r2, r2, r3
 80026b0:	4b36      	ldr	r3, [pc, #216]	; (800278c <LL_USART_SetBaudRate+0x168>)
 80026b2:	fba3 0302 	umull	r0, r3, r3, r2
 80026b6:	095b      	lsrs	r3, r3, #5
 80026b8:	2064      	movs	r0, #100	; 0x64
 80026ba:	fb00 f303 	mul.w	r3, r0, r3
 80026be:	1ad3      	subs	r3, r2, r3
 80026c0:	00db      	lsls	r3, r3, #3
 80026c2:	3332      	adds	r3, #50	; 0x32
 80026c4:	4a31      	ldr	r2, [pc, #196]	; (800278c <LL_USART_SetBaudRate+0x168>)
 80026c6:	fba2 2303 	umull	r2, r3, r2, r3
 80026ca:	095b      	lsrs	r3, r3, #5
 80026cc:	b29b      	uxth	r3, r3
 80026ce:	f003 0307 	and.w	r3, r3, #7
 80026d2:	b29b      	uxth	r3, r3
 80026d4:	440b      	add	r3, r1
 80026d6:	b29b      	uxth	r3, r3
 80026d8:	461a      	mov	r2, r3
 80026da:	68fb      	ldr	r3, [r7, #12]
 80026dc:	609a      	str	r2, [r3, #8]
 80026de:	e04f      	b.n	8002780 <LL_USART_SetBaudRate+0x15c>
 80026e0:	68ba      	ldr	r2, [r7, #8]
 80026e2:	4613      	mov	r3, r2
 80026e4:	009b      	lsls	r3, r3, #2
 80026e6:	4413      	add	r3, r2
 80026e8:	009a      	lsls	r2, r3, #2
 80026ea:	441a      	add	r2, r3
 80026ec:	683b      	ldr	r3, [r7, #0]
 80026ee:	009b      	lsls	r3, r3, #2
 80026f0:	fbb2 f3f3 	udiv	r3, r2, r3
 80026f4:	4a25      	ldr	r2, [pc, #148]	; (800278c <LL_USART_SetBaudRate+0x168>)
 80026f6:	fba2 2303 	umull	r2, r3, r2, r3
 80026fa:	095b      	lsrs	r3, r3, #5
 80026fc:	b29b      	uxth	r3, r3
 80026fe:	011b      	lsls	r3, r3, #4
 8002700:	b299      	uxth	r1, r3
 8002702:	68ba      	ldr	r2, [r7, #8]
 8002704:	4613      	mov	r3, r2
 8002706:	009b      	lsls	r3, r3, #2
 8002708:	4413      	add	r3, r2
 800270a:	009a      	lsls	r2, r3, #2
 800270c:	441a      	add	r2, r3
 800270e:	683b      	ldr	r3, [r7, #0]
 8002710:	009b      	lsls	r3, r3, #2
 8002712:	fbb2 f2f3 	udiv	r2, r2, r3
 8002716:	4b1d      	ldr	r3, [pc, #116]	; (800278c <LL_USART_SetBaudRate+0x168>)
 8002718:	fba3 0302 	umull	r0, r3, r3, r2
 800271c:	095b      	lsrs	r3, r3, #5
 800271e:	2064      	movs	r0, #100	; 0x64
 8002720:	fb00 f303 	mul.w	r3, r0, r3
 8002724:	1ad3      	subs	r3, r2, r3
 8002726:	011b      	lsls	r3, r3, #4
 8002728:	3332      	adds	r3, #50	; 0x32
 800272a:	4a18      	ldr	r2, [pc, #96]	; (800278c <LL_USART_SetBaudRate+0x168>)
 800272c:	fba2 2303 	umull	r2, r3, r2, r3
 8002730:	095b      	lsrs	r3, r3, #5
 8002732:	b29b      	uxth	r3, r3
 8002734:	f003 03f0 	and.w	r3, r3, #240	; 0xf0
 8002738:	b29b      	uxth	r3, r3
 800273a:	440b      	add	r3, r1
 800273c:	b299      	uxth	r1, r3
 800273e:	68ba      	ldr	r2, [r7, #8]
 8002740:	4613      	mov	r3, r2
 8002742:	009b      	lsls	r3, r3, #2
 8002744:	4413      	add	r3, r2
 8002746:	009a      	lsls	r2, r3, #2
 8002748:	441a      	add	r2, r3
 800274a:	683b      	ldr	r3, [r7, #0]
 800274c:	009b      	lsls	r3, r3, #2
 800274e:	fbb2 f2f3 	udiv	r2, r2, r3
 8002752:	4b0e      	ldr	r3, [pc, #56]	; (800278c <LL_USART_SetBaudRate+0x168>)
 8002754:	fba3 0302 	umull	r0, r3, r3, r2
 8002758:	095b      	lsrs	r3, r3, #5
 800275a:	2064      	movs	r0, #100	; 0x64
 800275c:	fb00 f303 	mul.w	r3, r0, r3
 8002760:	1ad3      	subs	r3, r2, r3
 8002762:	011b      	lsls	r3, r3, #4
 8002764:	3332      	adds	r3, #50	; 0x32
 8002766:	4a09      	ldr	r2, [pc, #36]	; (800278c <LL_USART_SetBaudRate+0x168>)
 8002768:	fba2 2303 	umull	r2, r3, r2, r3
 800276c:	095b      	lsrs	r3, r3, #5
 800276e:	b29b      	uxth	r3, r3
 8002770:	f003 030f 	and.w	r3, r3, #15
 8002774:	b29b      	uxth	r3, r3
 8002776:	440b      	add	r3, r1
 8002778:	b29b      	uxth	r3, r3
 800277a:	461a      	mov	r2, r3
 800277c:	68fb      	ldr	r3, [r7, #12]
 800277e:	609a      	str	r2, [r3, #8]
 8002780:	bf00      	nop
 8002782:	3714      	adds	r7, #20
 8002784:	46bd      	mov	sp, r7
 8002786:	f85d 7b04 	ldr.w	r7, [sp], #4
 800278a:	4770      	bx	lr
 800278c:	51eb851f 	.word	0x51eb851f

08002790 <LL_USART_IsActiveFlag_TC>:
 8002790:	b480      	push	{r7}
 8002792:	b083      	sub	sp, #12
 8002794:	af00      	add	r7, sp, #0
 8002796:	6078      	str	r0, [r7, #4]
 8002798:	687b      	ldr	r3, [r7, #4]
 800279a:	681b      	ldr	r3, [r3, #0]
 800279c:	f003 0340 	and.w	r3, r3, #64	; 0x40
 80027a0:	2b40      	cmp	r3, #64	; 0x40
 80027a2:	bf0c      	ite	eq
 80027a4:	2301      	moveq	r3, #1
 80027a6:	2300      	movne	r3, #0
 80027a8:	b2db      	uxtb	r3, r3
 80027aa:	4618      	mov	r0, r3
 80027ac:	370c      	adds	r7, #12
 80027ae:	46bd      	mov	sp, r7
 80027b0:	f85d 7b04 	ldr.w	r7, [sp], #4
 80027b4:	4770      	bx	lr

080027b6 <LL_USART_IsActiveFlag_TXE>:
 80027b6:	b480      	push	{r7}
 80027b8:	b083      	sub	sp, #12
 80027ba:	af00      	add	r7, sp, #0
 80027bc:	6078      	str	r0, [r7, #4]
 80027be:	687b      	ldr	r3, [r7, #4]
 80027c0:	681b      	ldr	r3, [r3, #0]
 80027c2:	f003 0380 	and.w	r3, r3, #128	; 0x80
 80027c6:	2b80      	cmp	r3, #128	; 0x80
 80027c8:	bf0c      	ite	eq
 80027ca:	2301      	moveq	r3, #1
 80027cc:	2300      	movne	r3, #0
 80027ce:	b2db      	uxtb	r3, r3
 80027d0:	4618      	mov	r0, r3
 80027d2:	370c      	adds	r7, #12
 80027d4:	46bd      	mov	sp, r7
 80027d6:	f85d 7b04 	ldr.w	r7, [sp], #4
 80027da:	4770      	bx	lr

080027dc <LL_USART_ClearFlag_IDLE>:
 80027dc:	b480      	push	{r7}
 80027de:	b085      	sub	sp, #20
 80027e0:	af00      	add	r7, sp, #0
 80027e2:	6078      	str	r0, [r7, #4]
 80027e4:	687b      	ldr	r3, [r7, #4]
 80027e6:	681b      	ldr	r3, [r3, #0]
 80027e8:	60fb      	str	r3, [r7, #12]
 80027ea:	68fb      	ldr	r3, [r7, #12]
 80027ec:	687b      	ldr	r3, [r7, #4]
 80027ee:	685b      	ldr	r3, [r3, #4]
 80027f0:	60fb      	str	r3, [r7, #12]
 80027f2:	68fb      	ldr	r3, [r7, #12]
 80027f4:	bf00      	nop
 80027f6:	3714      	adds	r7, #20
 80027f8:	46bd      	mov	sp, r7
 80027fa:	f85d 7b04 	ldr.w	r7, [sp], #4
 80027fe:	4770      	bx	lr

08002800 <LL_USART_ClearFlag_TC>:
 8002800:	b480      	push	{r7}
 8002802:	b083      	sub	sp, #12
 8002804:	af00      	add	r7, sp, #0
 8002806:	6078      	str	r0, [r7, #4]
 8002808:	687b      	ldr	r3, [r7, #4]
 800280a:	f06f 0240 	mvn.w	r2, #64	; 0x40
 800280e:	601a      	str	r2, [r3, #0]
 8002810:	bf00      	nop
 8002812:	370c      	adds	r7, #12
 8002814:	46bd      	mov	sp, r7
 8002816:	f85d 7b04 	ldr.w	r7, [sp], #4
 800281a:	4770      	bx	lr

0800281c <LL_USART_EnableIT_IDLE>:
 800281c:	b480      	push	{r7}
 800281e:	b083      	sub	sp, #12
 8002820:	af00      	add	r7, sp, #0
 8002822:	6078      	str	r0, [r7, #4]
 8002824:	687b      	ldr	r3, [r7, #4]
 8002826:	68db      	ldr	r3, [r3, #12]
 8002828:	f043 0210 	orr.w	r2, r3, #16
 800282c:	687b      	ldr	r3, [r7, #4]
 800282e:	60da      	str	r2, [r3, #12]
 8002830:	bf00      	nop
 8002832:	370c      	adds	r7, #12
 8002834:	46bd      	mov	sp, r7
 8002836:	f85d 7b04 	ldr.w	r7, [sp], #4
 800283a:	4770      	bx	lr

0800283c <LL_USART_EnableDMAReq_RX>:
 800283c:	b480      	push	{r7}
 800283e:	b083      	sub	sp, #12
 8002840:	af00      	add	r7, sp, #0
 8002842:	6078      	str	r0, [r7, #4]
 8002844:	687b      	ldr	r3, [r7, #4]
 8002846:	695b      	ldr	r3, [r3, #20]
 8002848:	f043 0240 	orr.w	r2, r3, #64	; 0x40
 800284c:	687b      	ldr	r3, [r7, #4]
 800284e:	615a      	str	r2, [r3, #20]
 8002850:	bf00      	nop
 8002852:	370c      	adds	r7, #12
 8002854:	46bd      	mov	sp, r7
 8002856:	f85d 7b04 	ldr.w	r7, [sp], #4
 800285a:	4770      	bx	lr

0800285c <LL_USART_TransmitData8>:
 800285c:	b480      	push	{r7}
 800285e:	b083      	sub	sp, #12
 8002860:	af00      	add	r7, sp, #0
 8002862:	6078      	str	r0, [r7, #4]
 8002864:	460b      	mov	r3, r1
 8002866:	70fb      	strb	r3, [r7, #3]
 8002868:	78fa      	ldrb	r2, [r7, #3]
 800286a:	687b      	ldr	r3, [r7, #4]
 800286c:	605a      	str	r2, [r3, #4]
 800286e:	bf00      	nop
 8002870:	370c      	adds	r7, #12
 8002872:	46bd      	mov	sp, r7
 8002874:	f85d 7b04 	ldr.w	r7, [sp], #4
 8002878:	4770      	bx	lr
	...

0800287c <LL_AHB1_GRP1_EnableClock>:
 800287c:	b480      	push	{r7}
 800287e:	b085      	sub	sp, #20
 8002880:	af00      	add	r7, sp, #0
 8002882:	6078      	str	r0, [r7, #4]
 8002884:	4b08      	ldr	r3, [pc, #32]	; (80028a8 <LL_AHB1_GRP1_EnableClock+0x2c>)
 8002886:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8002888:	4907      	ldr	r1, [pc, #28]	; (80028a8 <LL_AHB1_GRP1_EnableClock+0x2c>)
 800288a:	687b      	ldr	r3, [r7, #4]
 800288c:	4313      	orrs	r3, r2
 800288e:	630b      	str	r3, [r1, #48]	; 0x30
 8002890:	4b05      	ldr	r3, [pc, #20]	; (80028a8 <LL_AHB1_GRP1_EnableClock+0x2c>)
 8002892:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8002894:	687b      	ldr	r3, [r7, #4]
 8002896:	4013      	ands	r3, r2
 8002898:	60fb      	str	r3, [r7, #12]
 800289a:	68fb      	ldr	r3, [r7, #12]
 800289c:	bf00      	nop
 800289e:	3714      	adds	r7, #20
 80028a0:	46bd      	mov	sp, r7
 80028a2:	f85d 7b04 	ldr.w	r7, [sp], #4
 80028a6:	4770      	bx	lr
 80028a8:	40023800 	.word	0x40023800

080028ac <LL_APB1_GRP1_EnableClock>:
 80028ac:	b480      	push	{r7}
 80028ae:	b085      	sub	sp, #20
 80028b0:	af00      	add	r7, sp, #0
 80028b2:	6078      	str	r0, [r7, #4]
 80028b4:	4b08      	ldr	r3, [pc, #32]	; (80028d8 <LL_APB1_GRP1_EnableClock+0x2c>)
 80028b6:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 80028b8:	4907      	ldr	r1, [pc, #28]	; (80028d8 <LL_APB1_GRP1_EnableClock+0x2c>)
 80028ba:	687b      	ldr	r3, [r7, #4]
 80028bc:	4313      	orrs	r3, r2
 80028be:	640b      	str	r3, [r1, #64]	; 0x40
 80028c0:	4b05      	ldr	r3, [pc, #20]	; (80028d8 <LL_APB1_GRP1_EnableClock+0x2c>)
 80028c2:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 80028c4:	687b      	ldr	r3, [r7, #4]
 80028c6:	4013      	ands	r3, r2
 80028c8:	60fb      	str	r3, [r7, #12]
 80028ca:	68fb      	ldr	r3, [r7, #12]
 80028cc:	bf00      	nop
 80028ce:	3714      	adds	r7, #20
 80028d0:	46bd      	mov	sp, r7
 80028d2:	f85d 7b04 	ldr.w	r7, [sp], #4
 80028d6:	4770      	bx	lr
 80028d8:	40023800 	.word	0x40023800

080028dc <LL_APB2_GRP1_EnableClock>:
 80028dc:	b480      	push	{r7}
 80028de:	b085      	sub	sp, #20
 80028e0:	af00      	add	r7, sp, #0
 80028e2:	6078      	str	r0, [r7, #4]
 80028e4:	4b08      	ldr	r3, [pc, #32]	; (8002908 <LL_APB2_GRP1_EnableClock+0x2c>)
 80028e6:	6c5a      	ldr	r2, [r3, #68]	; 0x44
 80028e8:	4907      	ldr	r1, [pc, #28]	; (8002908 <LL_APB2_GRP1_EnableClock+0x2c>)
 80028ea:	687b      	ldr	r3, [r7, #4]
 80028ec:	4313      	orrs	r3, r2
 80028ee:	644b      	str	r3, [r1, #68]	; 0x44
 80028f0:	4b05      	ldr	r3, [pc, #20]	; (8002908 <LL_APB2_GRP1_EnableClock+0x2c>)
 80028f2:	6c5a      	ldr	r2, [r3, #68]	; 0x44
 80028f4:	687b      	ldr	r3, [r7, #4]
 80028f6:	4013      	ands	r3, r2
 80028f8:	60fb      	str	r3, [r7, #12]
 80028fa:	68fb      	ldr	r3, [r7, #12]
 80028fc:	bf00      	nop
 80028fe:	3714      	adds	r7, #20
 8002900:	46bd      	mov	sp, r7
 8002902:	f85d 7b04 	ldr.w	r7, [sp], #4
 8002906:	4770      	bx	lr
 8002908:	40023800 	.word	0x40023800

0800290c <LL_DMA_EnableStream>:
 800290c:	b480      	push	{r7}
 800290e:	b083      	sub	sp, #12
 8002910:	af00      	add	r7, sp, #0
 8002912:	6078      	str	r0, [r7, #4]
 8002914:	6039      	str	r1, [r7, #0]
 8002916:	4a0c      	ldr	r2, [pc, #48]	; (8002948 <LL_DMA_EnableStream+0x3c>)
 8002918:	683b      	ldr	r3, [r7, #0]
 800291a:	4413      	add	r3, r2
 800291c:	781b      	ldrb	r3, [r3, #0]
 800291e:	461a      	mov	r2, r3
 8002920:	687b      	ldr	r3, [r7, #4]
 8002922:	4413      	add	r3, r2
 8002924:	681b      	ldr	r3, [r3, #0]
 8002926:	4908      	ldr	r1, [pc, #32]	; (8002948 <LL_DMA_EnableStream+0x3c>)
 8002928:	683a      	ldr	r2, [r7, #0]
 800292a:	440a      	add	r2, r1
 800292c:	7812      	ldrb	r2, [r2, #0]
 800292e:	4611      	mov	r1, r2
 8002930:	687a      	ldr	r2, [r7, #4]
 8002932:	440a      	add	r2, r1
 8002934:	f043 0301 	orr.w	r3, r3, #1
 8002938:	6013      	str	r3, [r2, #0]
 800293a:	bf00      	nop
 800293c:	370c      	adds	r7, #12
 800293e:	46bd      	mov	sp, r7
 8002940:	f85d 7b04 	ldr.w	r7, [sp], #4
 8002944:	4770      	bx	lr
 8002946:	bf00      	nop
 8002948:	0800b2f0 	.word	0x0800b2f0

0800294c <LL_DMA_DisableStream>:
 800294c:	b480      	push	{r7}
 800294e:	b083      	sub	sp, #12
 8002950:	af00      	add	r7, sp, #0
 8002952:	6078      	str	r0, [r7, #4]
 8002954:	6039      	str	r1, [r7, #0]
 8002956:	4a0c      	ldr	r2, [pc, #48]	; (8002988 <LL_DMA_DisableStream+0x3c>)
 8002958:	683b      	ldr	r3, [r7, #0]
 800295a:	4413      	add	r3, r2
 800295c:	781b      	ldrb	r3, [r3, #0]
 800295e:	461a      	mov	r2, r3
 8002960:	687b      	ldr	r3, [r7, #4]
 8002962:	4413      	add	r3, r2
 8002964:	681b      	ldr	r3, [r3, #0]
 8002966:	4908      	ldr	r1, [pc, #32]	; (8002988 <LL_DMA_DisableStream+0x3c>)
 8002968:	683a      	ldr	r2, [r7, #0]
 800296a:	440a      	add	r2, r1
 800296c:	7812      	ldrb	r2, [r2, #0]
 800296e:	4611      	mov	r1, r2
 8002970:	687a      	ldr	r2, [r7, #4]
 8002972:	440a      	add	r2, r1
 8002974:	f023 0301 	bic.w	r3, r3, #1
 8002978:	6013      	str	r3, [r2, #0]
 800297a:	bf00      	nop
 800297c:	370c      	adds	r7, #12
 800297e:	46bd      	mov	sp, r7
 8002980:	f85d 7b04 	ldr.w	r7, [sp], #4
 8002984:	4770      	bx	lr
 8002986:	bf00      	nop
 8002988:	0800b2f0 	.word	0x0800b2f0

0800298c <LL_DMA_SetMemoryIncMode>:
 800298c:	b480      	push	{r7}
 800298e:	b085      	sub	sp, #20
 8002990:	af00      	add	r7, sp, #0
 8002992:	60f8      	str	r0, [r7, #12]
 8002994:	60b9      	str	r1, [r7, #8]
 8002996:	607a      	str	r2, [r7, #4]
 8002998:	4a0d      	ldr	r2, [pc, #52]	; (80029d0 <LL_DMA_SetMemoryIncMode+0x44>)
 800299a:	68bb      	ldr	r3, [r7, #8]
 800299c:	4413      	add	r3, r2
 800299e:	781b      	ldrb	r3, [r3, #0]
 80029a0:	461a      	mov	r2, r3
 80029a2:	68fb      	ldr	r3, [r7, #12]
 80029a4:	4413      	add	r3, r2
 80029a6:	681b      	ldr	r3, [r3, #0]
 80029a8:	f423 6280 	bic.w	r2, r3, #1024	; 0x400
 80029ac:	4908      	ldr	r1, [pc, #32]	; (80029d0 <LL_DMA_SetMemoryIncMode+0x44>)
 80029ae:	68bb      	ldr	r3, [r7, #8]
 80029b0:	440b      	add	r3, r1
 80029b2:	781b      	ldrb	r3, [r3, #0]
 80029b4:	4619      	mov	r1, r3
 80029b6:	68fb      	ldr	r3, [r7, #12]
 80029b8:	440b      	add	r3, r1
 80029ba:	4619      	mov	r1, r3
 80029bc:	687b      	ldr	r3, [r7, #4]
 80029be:	4313      	orrs	r3, r2
 80029c0:	600b      	str	r3, [r1, #0]
 80029c2:	bf00      	nop
 80029c4:	3714      	adds	r7, #20
 80029c6:	46bd      	mov	sp, r7
 80029c8:	f85d 7b04 	ldr.w	r7, [sp], #4
 80029cc:	4770      	bx	lr
 80029ce:	bf00      	nop
 80029d0:	0800b2f0 	.word	0x0800b2f0

080029d4 <LL_DMA_SetDataLength>:
 80029d4:	b480      	push	{r7}
 80029d6:	b085      	sub	sp, #20
 80029d8:	af00      	add	r7, sp, #0
 80029da:	60f8      	str	r0, [r7, #12]
 80029dc:	60b9      	str	r1, [r7, #8]
 80029de:	607a      	str	r2, [r7, #4]
 80029e0:	4a0d      	ldr	r2, [pc, #52]	; (8002a18 <LL_DMA_SetDataLength+0x44>)
 80029e2:	68bb      	ldr	r3, [r7, #8]
 80029e4:	4413      	add	r3, r2
 80029e6:	781b      	ldrb	r3, [r3, #0]
 80029e8:	461a      	mov	r2, r3
 80029ea:	68fb      	ldr	r3, [r7, #12]
 80029ec:	4413      	add	r3, r2
 80029ee:	685b      	ldr	r3, [r3, #4]
 80029f0:	0c1b      	lsrs	r3, r3, #16
 80029f2:	041b      	lsls	r3, r3, #16
 80029f4:	4908      	ldr	r1, [pc, #32]	; (8002a18 <LL_DMA_SetDataLength+0x44>)
 80029f6:	68ba      	ldr	r2, [r7, #8]
 80029f8:	440a      	add	r2, r1
 80029fa:	7812      	ldrb	r2, [r2, #0]
 80029fc:	4611      	mov	r1, r2
 80029fe:	68fa      	ldr	r2, [r7, #12]
 8002a00:	440a      	add	r2, r1
 8002a02:	4611      	mov	r1, r2
 8002a04:	687a      	ldr	r2, [r7, #4]
 8002a06:	4313      	orrs	r3, r2
 8002a08:	604b      	str	r3, [r1, #4]
 8002a0a:	bf00      	nop
 8002a0c:	3714      	adds	r7, #20
 8002a0e:	46bd      	mov	sp, r7
 8002a10:	f85d 7b04 	ldr.w	r7, [sp], #4
 8002a14:	4770      	bx	lr
 8002a16:	bf00      	nop
 8002a18:	0800b2f0 	.word	0x0800b2f0

08002a1c <LL_DMA_SetChannelSelection>:
 8002a1c:	b480      	push	{r7}
 8002a1e:	b085      	sub	sp, #20
 8002a20:	af00      	add	r7, sp, #0
 8002a22:	60f8      	str	r0, [r7, #12]
 8002a24:	60b9      	str	r1, [r7, #8]
 8002a26:	607a      	str	r2, [r7, #4]
 8002a28:	4a0d      	ldr	r2, [pc, #52]	; (8002a60 <LL_DMA_SetChannelSelection+0x44>)
 8002a2a:	68bb      	ldr	r3, [r7, #8]
 8002a2c:	4413      	add	r3, r2
 8002a2e:	781b      	ldrb	r3, [r3, #0]
 8002a30:	461a      	mov	r2, r3
 8002a32:	68fb      	ldr	r3, [r7, #12]
 8002a34:	4413      	add	r3, r2
 8002a36:	681b      	ldr	r3, [r3, #0]
 8002a38:	f023 6260 	bic.w	r2, r3, #234881024	; 0xe000000
 8002a3c:	4908      	ldr	r1, [pc, #32]	; (8002a60 <LL_DMA_SetChannelSelection+0x44>)
 8002a3e:	68bb      	ldr	r3, [r7, #8]
 8002a40:	440b      	add	r3, r1
 8002a42:	781b      	ldrb	r3, [r3, #0]
 8002a44:	4619      	mov	r1, r3
 8002a46:	68fb      	ldr	r3, [r7, #12]
 8002a48:	440b      	add	r3, r1
 8002a4a:	4619      	mov	r1, r3
 8002a4c:	687b      	ldr	r3, [r7, #4]
 8002a4e:	4313      	orrs	r3, r2
 8002a50:	600b      	str	r3, [r1, #0]
 8002a52:	bf00      	nop
 8002a54:	3714      	adds	r7, #20
 8002a56:	46bd      	mov	sp, r7
 8002a58:	f85d 7b04 	ldr.w	r7, [sp], #4
 8002a5c:	4770      	bx	lr
 8002a5e:	bf00      	nop
 8002a60:	0800b2f0 	.word	0x0800b2f0

08002a64 <LL_DMA_ConfigAddresses>:
 8002a64:	b480      	push	{r7}
 8002a66:	b085      	sub	sp, #20
 8002a68:	af00      	add	r7, sp, #0
 8002a6a:	60f8      	str	r0, [r7, #12]
 8002a6c:	60b9      	str	r1, [r7, #8]
 8002a6e:	607a      	str	r2, [r7, #4]
 8002a70:	603b      	str	r3, [r7, #0]
 8002a72:	69bb      	ldr	r3, [r7, #24]
 8002a74:	2b40      	cmp	r3, #64	; 0x40
 8002a76:	d114      	bne.n	8002aa2 <LL_DMA_ConfigAddresses+0x3e>
 8002a78:	4a17      	ldr	r2, [pc, #92]	; (8002ad8 <LL_DMA_ConfigAddresses+0x74>)
 8002a7a:	68bb      	ldr	r3, [r7, #8]
 8002a7c:	4413      	add	r3, r2
 8002a7e:	781b      	ldrb	r3, [r3, #0]
 8002a80:	461a      	mov	r2, r3
 8002a82:	68fb      	ldr	r3, [r7, #12]
 8002a84:	4413      	add	r3, r2
 8002a86:	461a      	mov	r2, r3
 8002a88:	687b      	ldr	r3, [r7, #4]
 8002a8a:	60d3      	str	r3, [r2, #12]
 8002a8c:	4a12      	ldr	r2, [pc, #72]	; (8002ad8 <LL_DMA_ConfigAddresses+0x74>)
 8002a8e:	68bb      	ldr	r3, [r7, #8]
 8002a90:	4413      	add	r3, r2
 8002a92:	781b      	ldrb	r3, [r3, #0]
 8002a94:	461a      	mov	r2, r3
 8002a96:	68fb      	ldr	r3, [r7, #12]
 8002a98:	4413      	add	r3, r2
 8002a9a:	461a      	mov	r2, r3
 8002a9c:	683b      	ldr	r3, [r7, #0]
 8002a9e:	6093      	str	r3, [r2, #8]
 8002aa0:	e013      	b.n	8002aca <LL_DMA_ConfigAddresses+0x66>
 8002aa2:	4a0d      	ldr	r2, [pc, #52]	; (8002ad8 <LL_DMA_ConfigAddresses+0x74>)
 8002aa4:	68bb      	ldr	r3, [r7, #8]
 8002aa6:	4413      	add	r3, r2
 8002aa8:	781b      	ldrb	r3, [r3, #0]
 8002aaa:	461a      	mov	r2, r3
 8002aac:	68fb      	ldr	r3, [r7, #12]
 8002aae:	4413      	add	r3, r2
 8002ab0:	461a      	mov	r2, r3
 8002ab2:	687b      	ldr	r3, [r7, #4]
 8002ab4:	6093      	str	r3, [r2, #8]
 8002ab6:	4a08      	ldr	r2, [pc, #32]	; (8002ad8 <LL_DMA_ConfigAddresses+0x74>)
 8002ab8:	68bb      	ldr	r3, [r7, #8]
 8002aba:	4413      	add	r3, r2
 8002abc:	781b      	ldrb	r3, [r3, #0]
 8002abe:	461a      	mov	r2, r3
 8002ac0:	68fb      	ldr	r3, [r7, #12]
 8002ac2:	4413      	add	r3, r2
 8002ac4:	461a      	mov	r2, r3
 8002ac6:	683b      	ldr	r3, [r7, #0]
 8002ac8:	60d3      	str	r3, [r2, #12]
 8002aca:	bf00      	nop
 8002acc:	3714      	adds	r7, #20
 8002ace:	46bd      	mov	sp, r7
 8002ad0:	f85d 7b04 	ldr.w	r7, [sp], #4
 8002ad4:	4770      	bx	lr
 8002ad6:	bf00      	nop
 8002ad8:	0800b2f0 	.word	0x0800b2f0

08002adc <LL_DMA_IsActiveFlag_TC1>:
 8002adc:	b480      	push	{r7}
 8002ade:	b083      	sub	sp, #12
 8002ae0:	af00      	add	r7, sp, #0
 8002ae2:	6078      	str	r0, [r7, #4]
 8002ae4:	687b      	ldr	r3, [r7, #4]
 8002ae6:	681b      	ldr	r3, [r3, #0]
 8002ae8:	f403 6300 	and.w	r3, r3, #2048	; 0x800
 8002aec:	f5b3 6f00 	cmp.w	r3, #2048	; 0x800
 8002af0:	bf0c      	ite	eq
 8002af2:	2301      	moveq	r3, #1
 8002af4:	2300      	movne	r3, #0
 8002af6:	b2db      	uxtb	r3, r3
 8002af8:	4618      	mov	r0, r3
 8002afa:	370c      	adds	r7, #12
 8002afc:	46bd      	mov	sp, r7
 8002afe:	f85d 7b04 	ldr.w	r7, [sp], #4
 8002b02:	4770      	bx	lr

08002b04 <LL_DMA_IsActiveFlag_TC2>:
 8002b04:	b480      	push	{r7}
 8002b06:	b083      	sub	sp, #12
 8002b08:	af00      	add	r7, sp, #0
 8002b0a:	6078      	str	r0, [r7, #4]
 8002b0c:	687b      	ldr	r3, [r7, #4]
 8002b0e:	681b      	ldr	r3, [r3, #0]
 8002b10:	f403 1300 	and.w	r3, r3, #2097152	; 0x200000
 8002b14:	f5b3 1f00 	cmp.w	r3, #2097152	; 0x200000
 8002b18:	bf0c      	ite	eq
 8002b1a:	2301      	moveq	r3, #1
 8002b1c:	2300      	movne	r3, #0
 8002b1e:	b2db      	uxtb	r3, r3
 8002b20:	4618      	mov	r0, r3
 8002b22:	370c      	adds	r7, #12
 8002b24:	46bd      	mov	sp, r7
 8002b26:	f85d 7b04 	ldr.w	r7, [sp], #4
 8002b2a:	4770      	bx	lr

08002b2c <LL_DMA_ClearFlag_HT1>:
 8002b2c:	b480      	push	{r7}
 8002b2e:	b083      	sub	sp, #12
 8002b30:	af00      	add	r7, sp, #0
 8002b32:	6078      	str	r0, [r7, #4]
 8002b34:	687b      	ldr	r3, [r7, #4]
 8002b36:	f44f 6280 	mov.w	r2, #1024	; 0x400
 8002b3a:	609a      	str	r2, [r3, #8]
 8002b3c:	bf00      	nop
 8002b3e:	370c      	adds	r7, #12
 8002b40:	46bd      	mov	sp, r7
 8002b42:	f85d 7b04 	ldr.w	r7, [sp], #4
 8002b46:	4770      	bx	lr

08002b48 <LL_DMA_ClearFlag_HT2>:
 8002b48:	b480      	push	{r7}
 8002b4a:	b083      	sub	sp, #12
 8002b4c:	af00      	add	r7, sp, #0
 8002b4e:	6078      	str	r0, [r7, #4]
 8002b50:	687b      	ldr	r3, [r7, #4]
 8002b52:	f44f 1280 	mov.w	r2, #1048576	; 0x100000
 8002b56:	609a      	str	r2, [r3, #8]
 8002b58:	bf00      	nop
 8002b5a:	370c      	adds	r7, #12
 8002b5c:	46bd      	mov	sp, r7
 8002b5e:	f85d 7b04 	ldr.w	r7, [sp], #4
 8002b62:	4770      	bx	lr

08002b64 <LL_DMA_ClearFlag_TC1>:
 8002b64:	b480      	push	{r7}
 8002b66:	b083      	sub	sp, #12
 8002b68:	af00      	add	r7, sp, #0
 8002b6a:	6078      	str	r0, [r7, #4]
 8002b6c:	687b      	ldr	r3, [r7, #4]
 8002b6e:	f44f 6200 	mov.w	r2, #2048	; 0x800
 8002b72:	609a      	str	r2, [r3, #8]
 8002b74:	bf00      	nop
 8002b76:	370c      	adds	r7, #12
 8002b78:	46bd      	mov	sp, r7
 8002b7a:	f85d 7b04 	ldr.w	r7, [sp], #4
 8002b7e:	4770      	bx	lr

08002b80 <LL_DMA_ClearFlag_TC2>:
 8002b80:	b480      	push	{r7}
 8002b82:	b083      	sub	sp, #12
 8002b84:	af00      	add	r7, sp, #0
 8002b86:	6078      	str	r0, [r7, #4]
 8002b88:	687b      	ldr	r3, [r7, #4]
 8002b8a:	f44f 1200 	mov.w	r2, #2097152	; 0x200000
 8002b8e:	609a      	str	r2, [r3, #8]
 8002b90:	bf00      	nop
 8002b92:	370c      	adds	r7, #12
 8002b94:	46bd      	mov	sp, r7
 8002b96:	f85d 7b04 	ldr.w	r7, [sp], #4
 8002b9a:	4770      	bx	lr

08002b9c <LL_DMA_EnableIT_TC>:
 8002b9c:	b480      	push	{r7}
 8002b9e:	b083      	sub	sp, #12
 8002ba0:	af00      	add	r7, sp, #0
 8002ba2:	6078      	str	r0, [r7, #4]
 8002ba4:	6039      	str	r1, [r7, #0]
 8002ba6:	4a0c      	ldr	r2, [pc, #48]	; (8002bd8 <LL_DMA_EnableIT_TC+0x3c>)
 8002ba8:	683b      	ldr	r3, [r7, #0]
 8002baa:	4413      	add	r3, r2
 8002bac:	781b      	ldrb	r3, [r3, #0]
 8002bae:	461a      	mov	r2, r3
 8002bb0:	687b      	ldr	r3, [r7, #4]
 8002bb2:	4413      	add	r3, r2
 8002bb4:	681b      	ldr	r3, [r3, #0]
 8002bb6:	4908      	ldr	r1, [pc, #32]	; (8002bd8 <LL_DMA_EnableIT_TC+0x3c>)
 8002bb8:	683a      	ldr	r2, [r7, #0]
 8002bba:	440a      	add	r2, r1
 8002bbc:	7812      	ldrb	r2, [r2, #0]
 8002bbe:	4611      	mov	r1, r2
 8002bc0:	687a      	ldr	r2, [r7, #4]
 8002bc2:	440a      	add	r2, r1
 8002bc4:	f043 0310 	orr.w	r3, r3, #16
 8002bc8:	6013      	str	r3, [r2, #0]
 8002bca:	bf00      	nop
 8002bcc:	370c      	adds	r7, #12
 8002bce:	46bd      	mov	sp, r7
 8002bd0:	f85d 7b04 	ldr.w	r7, [sp], #4
 8002bd4:	4770      	bx	lr
 8002bd6:	bf00      	nop
 8002bd8:	0800b2f0 	.word	0x0800b2f0

08002bdc <LL_GPIO_SetPinMode>:
 8002bdc:	b480      	push	{r7}
 8002bde:	b089      	sub	sp, #36	; 0x24
 8002be0:	af00      	add	r7, sp, #0
 8002be2:	60f8      	str	r0, [r7, #12]
 8002be4:	60b9      	str	r1, [r7, #8]
 8002be6:	607a      	str	r2, [r7, #4]
 8002be8:	68fb      	ldr	r3, [r7, #12]
 8002bea:	681a      	ldr	r2, [r3, #0]
 8002bec:	68bb      	ldr	r3, [r7, #8]
 8002bee:	617b      	str	r3, [r7, #20]
 8002bf0:	697b      	ldr	r3, [r7, #20]
 8002bf2:	fa93 f3a3 	rbit	r3, r3
 8002bf6:	613b      	str	r3, [r7, #16]
 8002bf8:	693b      	ldr	r3, [r7, #16]
 8002bfa:	fab3 f383 	clz	r3, r3
 8002bfe:	005b      	lsls	r3, r3, #1
 8002c00:	2103      	movs	r1, #3
 8002c02:	fa01 f303 	lsl.w	r3, r1, r3
 8002c06:	43db      	mvns	r3, r3
 8002c08:	401a      	ands	r2, r3
 8002c0a:	68bb      	ldr	r3, [r7, #8]
 8002c0c:	61fb      	str	r3, [r7, #28]
 8002c0e:	69fb      	ldr	r3, [r7, #28]
 8002c10:	fa93 f3a3 	rbit	r3, r3
 8002c14:	61bb      	str	r3, [r7, #24]
 8002c16:	69bb      	ldr	r3, [r7, #24]
 8002c18:	fab3 f383 	clz	r3, r3
 8002c1c:	005b      	lsls	r3, r3, #1
 8002c1e:	6879      	ldr	r1, [r7, #4]
 8002c20:	fa01 f303 	lsl.w	r3, r1, r3
 8002c24:	431a      	orrs	r2, r3
 8002c26:	68fb      	ldr	r3, [r7, #12]
 8002c28:	601a      	str	r2, [r3, #0]
 8002c2a:	bf00      	nop
 8002c2c:	3724      	adds	r7, #36	; 0x24
 8002c2e:	46bd      	mov	sp, r7
 8002c30:	f85d 7b04 	ldr.w	r7, [sp], #4
 8002c34:	4770      	bx	lr

08002c36 <LL_GPIO_SetPinOutputType>:
 8002c36:	b480      	push	{r7}
 8002c38:	b085      	sub	sp, #20
 8002c3a:	af00      	add	r7, sp, #0
 8002c3c:	60f8      	str	r0, [r7, #12]
 8002c3e:	60b9      	str	r1, [r7, #8]
 8002c40:	607a      	str	r2, [r7, #4]
 8002c42:	68fb      	ldr	r3, [r7, #12]
 8002c44:	685a      	ldr	r2, [r3, #4]
 8002c46:	68bb      	ldr	r3, [r7, #8]
 8002c48:	43db      	mvns	r3, r3
 8002c4a:	401a      	ands	r2, r3
 8002c4c:	68bb      	ldr	r3, [r7, #8]
 8002c4e:	6879      	ldr	r1, [r7, #4]
 8002c50:	fb01 f303 	mul.w	r3, r1, r3
 8002c54:	431a      	orrs	r2, r3
 8002c56:	68fb      	ldr	r3, [r7, #12]
 8002c58:	605a      	str	r2, [r3, #4]
 8002c5a:	bf00      	nop
 8002c5c:	3714      	adds	r7, #20
 8002c5e:	46bd      	mov	sp, r7
 8002c60:	f85d 7b04 	ldr.w	r7, [sp], #4
 8002c64:	4770      	bx	lr

08002c66 <LL_GPIO_SetPinSpeed>:
 8002c66:	b480      	push	{r7}
 8002c68:	b089      	sub	sp, #36	; 0x24
 8002c6a:	af00      	add	r7, sp, #0
 8002c6c:	60f8      	str	r0, [r7, #12]
 8002c6e:	60b9      	str	r1, [r7, #8]
 8002c70:	607a      	str	r2, [r7, #4]
 8002c72:	68fb      	ldr	r3, [r7, #12]
 8002c74:	689a      	ldr	r2, [r3, #8]
 8002c76:	68bb      	ldr	r3, [r7, #8]
 8002c78:	617b      	str	r3, [r7, #20]
 8002c7a:	697b      	ldr	r3, [r7, #20]
 8002c7c:	fa93 f3a3 	rbit	r3, r3
 8002c80:	613b      	str	r3, [r7, #16]
 8002c82:	693b      	ldr	r3, [r7, #16]
 8002c84:	fab3 f383 	clz	r3, r3
 8002c88:	005b      	lsls	r3, r3, #1
 8002c8a:	2103      	movs	r1, #3
 8002c8c:	fa01 f303 	lsl.w	r3, r1, r3
 8002c90:	43db      	mvns	r3, r3
 8002c92:	401a      	ands	r2, r3
 8002c94:	68bb      	ldr	r3, [r7, #8]
 8002c96:	61fb      	str	r3, [r7, #28]
 8002c98:	69fb      	ldr	r3, [r7, #28]
 8002c9a:	fa93 f3a3 	rbit	r3, r3
 8002c9e:	61bb      	str	r3, [r7, #24]
 8002ca0:	69bb      	ldr	r3, [r7, #24]
 8002ca2:	fab3 f383 	clz	r3, r3
 8002ca6:	005b      	lsls	r3, r3, #1
 8002ca8:	6879      	ldr	r1, [r7, #4]
 8002caa:	fa01 f303 	lsl.w	r3, r1, r3
 8002cae:	431a      	orrs	r2, r3
 8002cb0:	68fb      	ldr	r3, [r7, #12]
 8002cb2:	609a      	str	r2, [r3, #8]
 8002cb4:	bf00      	nop
 8002cb6:	3724      	adds	r7, #36	; 0x24
 8002cb8:	46bd      	mov	sp, r7
 8002cba:	f85d 7b04 	ldr.w	r7, [sp], #4
 8002cbe:	4770      	bx	lr

08002cc0 <LL_GPIO_SetPinPull>:
 8002cc0:	b480      	push	{r7}
 8002cc2:	b089      	sub	sp, #36	; 0x24
 8002cc4:	af00      	add	r7, sp, #0
 8002cc6:	60f8      	str	r0, [r7, #12]
 8002cc8:	60b9      	str	r1, [r7, #8]
 8002cca:	607a      	str	r2, [r7, #4]
 8002ccc:	68fb      	ldr	r3, [r7, #12]
 8002cce:	68da      	ldr	r2, [r3, #12]
 8002cd0:	68bb      	ldr	r3, [r7, #8]
 8002cd2:	617b      	str	r3, [r7, #20]
 8002cd4:	697b      	ldr	r3, [r7, #20]
 8002cd6:	fa93 f3a3 	rbit	r3, r3
 8002cda:	613b      	str	r3, [r7, #16]
 8002cdc:	693b      	ldr	r3, [r7, #16]
 8002cde:	fab3 f383 	clz	r3, r3
 8002ce2:	005b      	lsls	r3, r3, #1
 8002ce4:	2103      	movs	r1, #3
 8002ce6:	fa01 f303 	lsl.w	r3, r1, r3
 8002cea:	43db      	mvns	r3, r3
 8002cec:	401a      	ands	r2, r3
 8002cee:	68bb      	ldr	r3, [r7, #8]
 8002cf0:	61fb      	str	r3, [r7, #28]
 8002cf2:	69fb      	ldr	r3, [r7, #28]
 8002cf4:	fa93 f3a3 	rbit	r3, r3
 8002cf8:	61bb      	str	r3, [r7, #24]
 8002cfa:	69bb      	ldr	r3, [r7, #24]
 8002cfc:	fab3 f383 	clz	r3, r3
 8002d00:	005b      	lsls	r3, r3, #1
 8002d02:	6879      	ldr	r1, [r7, #4]
 8002d04:	fa01 f303 	lsl.w	r3, r1, r3
 8002d08:	431a      	orrs	r2, r3
 8002d0a:	68fb      	ldr	r3, [r7, #12]
 8002d0c:	60da      	str	r2, [r3, #12]
 8002d0e:	bf00      	nop
 8002d10:	3724      	adds	r7, #36	; 0x24
 8002d12:	46bd      	mov	sp, r7
 8002d14:	f85d 7b04 	ldr.w	r7, [sp], #4
 8002d18:	4770      	bx	lr

08002d1a <LL_GPIO_SetAFPin_0_7>:
 8002d1a:	b480      	push	{r7}
 8002d1c:	b089      	sub	sp, #36	; 0x24
 8002d1e:	af00      	add	r7, sp, #0
 8002d20:	60f8      	str	r0, [r7, #12]
 8002d22:	60b9      	str	r1, [r7, #8]
 8002d24:	607a      	str	r2, [r7, #4]
 8002d26:	68fb      	ldr	r3, [r7, #12]
 8002d28:	6a1a      	ldr	r2, [r3, #32]
 8002d2a:	68bb      	ldr	r3, [r7, #8]
 8002d2c:	617b      	str	r3, [r7, #20]
 8002d2e:	697b      	ldr	r3, [r7, #20]
 8002d30:	fa93 f3a3 	rbit	r3, r3
 8002d34:	613b      	str	r3, [r7, #16]
 8002d36:	693b      	ldr	r3, [r7, #16]
 8002d38:	fab3 f383 	clz	r3, r3
 8002d3c:	009b      	lsls	r3, r3, #2
 8002d3e:	210f      	movs	r1, #15
 8002d40:	fa01 f303 	lsl.w	r3, r1, r3
 8002d44:	43db      	mvns	r3, r3
 8002d46:	401a      	ands	r2, r3
 8002d48:	68bb      	ldr	r3, [r7, #8]
 8002d4a:	61fb      	str	r3, [r7, #28]
 8002d4c:	69fb      	ldr	r3, [r7, #28]
 8002d4e:	fa93 f3a3 	rbit	r3, r3
 8002d52:	61bb      	str	r3, [r7, #24]
 8002d54:	69bb      	ldr	r3, [r7, #24]
 8002d56:	fab3 f383 	clz	r3, r3
 8002d5a:	009b      	lsls	r3, r3, #2
 8002d5c:	6879      	ldr	r1, [r7, #4]
 8002d5e:	fa01 f303 	lsl.w	r3, r1, r3
 8002d62:	431a      	orrs	r2, r3
 8002d64:	68fb      	ldr	r3, [r7, #12]
 8002d66:	621a      	str	r2, [r3, #32]
 8002d68:	bf00      	nop
 8002d6a:	3724      	adds	r7, #36	; 0x24
 8002d6c:	46bd      	mov	sp, r7
 8002d6e:	f85d 7b04 	ldr.w	r7, [sp], #4
 8002d72:	4770      	bx	lr

08002d74 <LL_GPIO_SetAFPin_8_15>:
 8002d74:	b480      	push	{r7}
 8002d76:	b089      	sub	sp, #36	; 0x24
 8002d78:	af00      	add	r7, sp, #0
 8002d7a:	60f8      	str	r0, [r7, #12]
 8002d7c:	60b9      	str	r1, [r7, #8]
 8002d7e:	607a      	str	r2, [r7, #4]
 8002d80:	68fb      	ldr	r3, [r7, #12]
 8002d82:	6a5a      	ldr	r2, [r3, #36]	; 0x24
 8002d84:	68bb      	ldr	r3, [r7, #8]
 8002d86:	0a1b      	lsrs	r3, r3, #8
 8002d88:	617b      	str	r3, [r7, #20]
 8002d8a:	697b      	ldr	r3, [r7, #20]
 8002d8c:	fa93 f3a3 	rbit	r3, r3
 8002d90:	613b      	str	r3, [r7, #16]
 8002d92:	693b      	ldr	r3, [r7, #16]
 8002d94:	fab3 f383 	clz	r3, r3
 8002d98:	009b      	lsls	r3, r3, #2
 8002d9a:	210f      	movs	r1, #15
 8002d9c:	fa01 f303 	lsl.w	r3, r1, r3
 8002da0:	43db      	mvns	r3, r3
 8002da2:	401a      	ands	r2, r3
 8002da4:	68bb      	ldr	r3, [r7, #8]
 8002da6:	0a1b      	lsrs	r3, r3, #8
 8002da8:	61fb      	str	r3, [r7, #28]
 8002daa:	69fb      	ldr	r3, [r7, #28]
 8002dac:	fa93 f3a3 	rbit	r3, r3
 8002db0:	61bb      	str	r3, [r7, #24]
 8002db2:	69bb      	ldr	r3, [r7, #24]
 8002db4:	fab3 f383 	clz	r3, r3
 8002db8:	009b      	lsls	r3, r3, #2
 8002dba:	6879      	ldr	r1, [r7, #4]
 8002dbc:	fa01 f303 	lsl.w	r3, r1, r3
 8002dc0:	431a      	orrs	r2, r3
 8002dc2:	68fb      	ldr	r3, [r7, #12]
 8002dc4:	625a      	str	r2, [r3, #36]	; 0x24
 8002dc6:	bf00      	nop
 8002dc8:	3724      	adds	r7, #36	; 0x24
 8002dca:	46bd      	mov	sp, r7
 8002dcc:	f85d 7b04 	ldr.w	r7, [sp], #4
 8002dd0:	4770      	bx	lr
	...

08002dd4 <terminal_hw_config>:
 8002dd4:	b580      	push	{r7, lr}
 8002dd6:	b082      	sub	sp, #8
 8002dd8:	af02      	add	r7, sp, #8
 8002dda:	2004      	movs	r0, #4
 8002ddc:	f7ff fd4e 	bl	800287c <LL_AHB1_GRP1_EnableClock>
 8002de0:	2207      	movs	r2, #7
 8002de2:	f44f 6180 	mov.w	r1, #1024	; 0x400
 8002de6:	48a0      	ldr	r0, [pc, #640]	; (8003068 <terminal_hw_config+0x294>)
 8002de8:	f7ff ffc4 	bl	8002d74 <LL_GPIO_SetAFPin_8_15>
 8002dec:	2202      	movs	r2, #2
 8002dee:	f44f 6180 	mov.w	r1, #1024	; 0x400
 8002df2:	489d      	ldr	r0, [pc, #628]	; (8003068 <terminal_hw_config+0x294>)
 8002df4:	f7ff fef2 	bl	8002bdc <LL_GPIO_SetPinMode>
 8002df8:	2200      	movs	r2, #0
 8002dfa:	f44f 6180 	mov.w	r1, #1024	; 0x400
 8002dfe:	489a      	ldr	r0, [pc, #616]	; (8003068 <terminal_hw_config+0x294>)
 8002e00:	f7ff ff19 	bl	8002c36 <LL_GPIO_SetPinOutputType>
 8002e04:	2200      	movs	r2, #0
 8002e06:	f44f 6180 	mov.w	r1, #1024	; 0x400
 8002e0a:	4897      	ldr	r0, [pc, #604]	; (8003068 <terminal_hw_config+0x294>)
 8002e0c:	f7ff ff58 	bl	8002cc0 <LL_GPIO_SetPinPull>
 8002e10:	2202      	movs	r2, #2
 8002e12:	f44f 6180 	mov.w	r1, #1024	; 0x400
 8002e16:	4894      	ldr	r0, [pc, #592]	; (8003068 <terminal_hw_config+0x294>)
 8002e18:	f7ff ff25 	bl	8002c66 <LL_GPIO_SetPinSpeed>
 8002e1c:	2207      	movs	r2, #7
 8002e1e:	f44f 6100 	mov.w	r1, #2048	; 0x800
 8002e22:	4891      	ldr	r0, [pc, #580]	; (8003068 <terminal_hw_config+0x294>)
 8002e24:	f7ff ffa6 	bl	8002d74 <LL_GPIO_SetAFPin_8_15>
 8002e28:	2202      	movs	r2, #2
 8002e2a:	f44f 6100 	mov.w	r1, #2048	; 0x800
 8002e2e:	488e      	ldr	r0, [pc, #568]	; (8003068 <terminal_hw_config+0x294>)
 8002e30:	f7ff fed4 	bl	8002bdc <LL_GPIO_SetPinMode>
 8002e34:	2200      	movs	r2, #0
 8002e36:	f44f 6100 	mov.w	r1, #2048	; 0x800
 8002e3a:	488b      	ldr	r0, [pc, #556]	; (8003068 <terminal_hw_config+0x294>)
 8002e3c:	f7ff fefb 	bl	8002c36 <LL_GPIO_SetPinOutputType>
 8002e40:	2200      	movs	r2, #0
 8002e42:	f44f 6100 	mov.w	r1, #2048	; 0x800
 8002e46:	4888      	ldr	r0, [pc, #544]	; (8003068 <terminal_hw_config+0x294>)
 8002e48:	f7ff ff3a 	bl	8002cc0 <LL_GPIO_SetPinPull>
 8002e4c:	2202      	movs	r2, #2
 8002e4e:	f44f 6100 	mov.w	r1, #2048	; 0x800
 8002e52:	4885      	ldr	r0, [pc, #532]	; (8003068 <terminal_hw_config+0x294>)
 8002e54:	f7ff ff07 	bl	8002c66 <LL_GPIO_SetPinSpeed>
 8002e58:	f44f 1000 	mov.w	r0, #2097152	; 0x200000
 8002e5c:	f7ff fd0e 	bl	800287c <LL_AHB1_GRP1_EnableClock>
 8002e60:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 8002e64:	f7ff fd22 	bl	80028ac <LL_APB1_GRP1_EnableClock>
 8002e68:	210c      	movs	r1, #12
 8002e6a:	4880      	ldr	r0, [pc, #512]	; (800306c <terminal_hw_config+0x298>)
 8002e6c:	f7ff fb7a 	bl	8002564 <LL_USART_SetTransferDirection>
 8002e70:	2100      	movs	r1, #0
 8002e72:	487e      	ldr	r0, [pc, #504]	; (800306c <terminal_hw_config+0x298>)
 8002e74:	f7ff fb89 	bl	800258a <LL_USART_SetParity>
 8002e78:	2100      	movs	r1, #0
 8002e7a:	487c      	ldr	r0, [pc, #496]	; (800306c <terminal_hw_config+0x298>)
 8002e7c:	f7ff fb98 	bl	80025b0 <LL_USART_SetDataWidth>
 8002e80:	2100      	movs	r1, #0
 8002e82:	487a      	ldr	r0, [pc, #488]	; (800306c <terminal_hw_config+0x298>)
 8002e84:	f7ff fba7 	bl	80025d6 <LL_USART_SetStopBitsLength>
 8002e88:	2100      	movs	r1, #0
 8002e8a:	4878      	ldr	r0, [pc, #480]	; (800306c <terminal_hw_config+0x298>)
 8002e8c:	f7ff fbb6 	bl	80025fc <LL_USART_SetHWFlowCtrl>
 8002e90:	4b77      	ldr	r3, [pc, #476]	; (8003070 <terminal_hw_config+0x29c>)
 8002e92:	681b      	ldr	r3, [r3, #0]
 8002e94:	0899      	lsrs	r1, r3, #2
 8002e96:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 8002e9a:	2200      	movs	r2, #0
 8002e9c:	4873      	ldr	r0, [pc, #460]	; (800306c <terminal_hw_config+0x298>)
 8002e9e:	f7ff fbc1 	bl	8002624 <LL_USART_SetBaudRate>
 8002ea2:	4872      	ldr	r0, [pc, #456]	; (800306c <terminal_hw_config+0x298>)
 8002ea4:	f7ff fb3e 	bl	8002524 <LL_USART_EnableDirectionRx>
 8002ea8:	4870      	ldr	r0, [pc, #448]	; (800306c <terminal_hw_config+0x298>)
 8002eaa:	f7ff fb4b 	bl	8002544 <LL_USART_EnableDirectionTx>
 8002eae:	486f      	ldr	r0, [pc, #444]	; (800306c <terminal_hw_config+0x298>)
 8002eb0:	f7ff fcc4 	bl	800283c <LL_USART_EnableDMAReq_RX>
 8002eb4:	486d      	ldr	r0, [pc, #436]	; (800306c <terminal_hw_config+0x298>)
 8002eb6:	f7ff fcb1 	bl	800281c <LL_USART_EnableIT_IDLE>
 8002eba:	486c      	ldr	r0, [pc, #432]	; (800306c <terminal_hw_config+0x298>)
 8002ebc:	f7ff fb22 	bl	8002504 <LL_USART_Enable>
 8002ec0:	2101      	movs	r1, #1
 8002ec2:	2027      	movs	r0, #39	; 0x27
 8002ec4:	f7ff faf4 	bl	80024b0 <NVIC_SetPriority>
 8002ec8:	2027      	movs	r0, #39	; 0x27
 8002eca:	f7ff fad7 	bl	800247c <NVIC_EnableIRQ>
 8002ece:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 8002ed2:	2101      	movs	r1, #1
 8002ed4:	4867      	ldr	r0, [pc, #412]	; (8003074 <terminal_hw_config+0x2a0>)
 8002ed6:	f7ff fda1 	bl	8002a1c <LL_DMA_SetChannelSelection>
 8002eda:	4b67      	ldr	r3, [pc, #412]	; (8003078 <terminal_hw_config+0x2a4>)
 8002edc:	681b      	ldr	r3, [r3, #0]
 8002ede:	68db      	ldr	r3, [r3, #12]
 8002ee0:	461a      	mov	r2, r3
 8002ee2:	2300      	movs	r3, #0
 8002ee4:	9300      	str	r3, [sp, #0]
 8002ee6:	4613      	mov	r3, r2
 8002ee8:	4a64      	ldr	r2, [pc, #400]	; (800307c <terminal_hw_config+0x2a8>)
 8002eea:	2101      	movs	r1, #1
 8002eec:	4861      	ldr	r0, [pc, #388]	; (8003074 <terminal_hw_config+0x2a0>)
 8002eee:	f7ff fdb9 	bl	8002a64 <LL_DMA_ConfigAddresses>
 8002ef2:	f44f 7280 	mov.w	r2, #256	; 0x100
 8002ef6:	2101      	movs	r1, #1
 8002ef8:	485e      	ldr	r0, [pc, #376]	; (8003074 <terminal_hw_config+0x2a0>)
 8002efa:	f7ff fd6b 	bl	80029d4 <LL_DMA_SetDataLength>
 8002efe:	f44f 6280 	mov.w	r2, #1024	; 0x400
 8002f02:	2101      	movs	r1, #1
 8002f04:	485b      	ldr	r0, [pc, #364]	; (8003074 <terminal_hw_config+0x2a0>)
 8002f06:	f7ff fd41 	bl	800298c <LL_DMA_SetMemoryIncMode>
 8002f0a:	2101      	movs	r1, #1
 8002f0c:	4859      	ldr	r0, [pc, #356]	; (8003074 <terminal_hw_config+0x2a0>)
 8002f0e:	f7ff fcfd 	bl	800290c <LL_DMA_EnableStream>
 8002f12:	2101      	movs	r1, #1
 8002f14:	4857      	ldr	r0, [pc, #348]	; (8003074 <terminal_hw_config+0x2a0>)
 8002f16:	f7ff fe41 	bl	8002b9c <LL_DMA_EnableIT_TC>
 8002f1a:	2106      	movs	r1, #6
 8002f1c:	200c      	movs	r0, #12
 8002f1e:	f7ff fac7 	bl	80024b0 <NVIC_SetPriority>
 8002f22:	200c      	movs	r0, #12
 8002f24:	f7ff faaa 	bl	800247c <NVIC_EnableIRQ>
 8002f28:	f44f 0080 	mov.w	r0, #4194304	; 0x400000
 8002f2c:	f7ff fca6 	bl	800287c <LL_AHB1_GRP1_EnableClock>
 8002f30:	2010      	movs	r0, #16
 8002f32:	f7ff fcd3 	bl	80028dc <LL_APB2_GRP1_EnableClock>
 8002f36:	2002      	movs	r0, #2
 8002f38:	f7ff fca0 	bl	800287c <LL_AHB1_GRP1_EnableClock>
 8002f3c:	2202      	movs	r2, #2
 8002f3e:	2140      	movs	r1, #64	; 0x40
 8002f40:	484f      	ldr	r0, [pc, #316]	; (8003080 <terminal_hw_config+0x2ac>)
 8002f42:	f7ff fe4b 	bl	8002bdc <LL_GPIO_SetPinMode>
 8002f46:	2207      	movs	r2, #7
 8002f48:	2140      	movs	r1, #64	; 0x40
 8002f4a:	484d      	ldr	r0, [pc, #308]	; (8003080 <terminal_hw_config+0x2ac>)
 8002f4c:	f7ff fee5 	bl	8002d1a <LL_GPIO_SetAFPin_0_7>
 8002f50:	2200      	movs	r2, #0
 8002f52:	2140      	movs	r1, #64	; 0x40
 8002f54:	484a      	ldr	r0, [pc, #296]	; (8003080 <terminal_hw_config+0x2ac>)
 8002f56:	f7ff fe6e 	bl	8002c36 <LL_GPIO_SetPinOutputType>
 8002f5a:	2201      	movs	r2, #1
 8002f5c:	2140      	movs	r1, #64	; 0x40
 8002f5e:	4848      	ldr	r0, [pc, #288]	; (8003080 <terminal_hw_config+0x2ac>)
 8002f60:	f7ff feae 	bl	8002cc0 <LL_GPIO_SetPinPull>
 8002f64:	2202      	movs	r2, #2
 8002f66:	2140      	movs	r1, #64	; 0x40
 8002f68:	4845      	ldr	r0, [pc, #276]	; (8003080 <terminal_hw_config+0x2ac>)
 8002f6a:	f7ff fe7c 	bl	8002c66 <LL_GPIO_SetPinSpeed>
 8002f6e:	2202      	movs	r2, #2
 8002f70:	2180      	movs	r1, #128	; 0x80
 8002f72:	4843      	ldr	r0, [pc, #268]	; (8003080 <terminal_hw_config+0x2ac>)
 8002f74:	f7ff fe32 	bl	8002bdc <LL_GPIO_SetPinMode>
 8002f78:	2207      	movs	r2, #7
 8002f7a:	2180      	movs	r1, #128	; 0x80
 8002f7c:	4840      	ldr	r0, [pc, #256]	; (8003080 <terminal_hw_config+0x2ac>)
 8002f7e:	f7ff fecc 	bl	8002d1a <LL_GPIO_SetAFPin_0_7>
 8002f82:	2200      	movs	r2, #0
 8002f84:	2180      	movs	r1, #128	; 0x80
 8002f86:	483e      	ldr	r0, [pc, #248]	; (8003080 <terminal_hw_config+0x2ac>)
 8002f88:	f7ff fe55 	bl	8002c36 <LL_GPIO_SetPinOutputType>
 8002f8c:	2201      	movs	r2, #1
 8002f8e:	2180      	movs	r1, #128	; 0x80
 8002f90:	483b      	ldr	r0, [pc, #236]	; (8003080 <terminal_hw_config+0x2ac>)
 8002f92:	f7ff fe95 	bl	8002cc0 <LL_GPIO_SetPinPull>
 8002f96:	2202      	movs	r2, #2
 8002f98:	2180      	movs	r1, #128	; 0x80
 8002f9a:	4839      	ldr	r0, [pc, #228]	; (8003080 <terminal_hw_config+0x2ac>)
 8002f9c:	f7ff fe63 	bl	8002c66 <LL_GPIO_SetPinSpeed>
 8002fa0:	210c      	movs	r1, #12
 8002fa2:	4838      	ldr	r0, [pc, #224]	; (8003084 <terminal_hw_config+0x2b0>)
 8002fa4:	f7ff fade 	bl	8002564 <LL_USART_SetTransferDirection>
 8002fa8:	2100      	movs	r1, #0
 8002faa:	4836      	ldr	r0, [pc, #216]	; (8003084 <terminal_hw_config+0x2b0>)
 8002fac:	f7ff faed 	bl	800258a <LL_USART_SetParity>
 8002fb0:	2100      	movs	r1, #0
 8002fb2:	4834      	ldr	r0, [pc, #208]	; (8003084 <terminal_hw_config+0x2b0>)
 8002fb4:	f7ff fafc 	bl	80025b0 <LL_USART_SetDataWidth>
 8002fb8:	2100      	movs	r1, #0
 8002fba:	4832      	ldr	r0, [pc, #200]	; (8003084 <terminal_hw_config+0x2b0>)
 8002fbc:	f7ff fb0b 	bl	80025d6 <LL_USART_SetStopBitsLength>
 8002fc0:	2100      	movs	r1, #0
 8002fc2:	4830      	ldr	r0, [pc, #192]	; (8003084 <terminal_hw_config+0x2b0>)
 8002fc4:	f7ff fb1a 	bl	80025fc <LL_USART_SetHWFlowCtrl>
 8002fc8:	4b29      	ldr	r3, [pc, #164]	; (8003070 <terminal_hw_config+0x29c>)
 8002fca:	681b      	ldr	r3, [r3, #0]
 8002fcc:	0859      	lsrs	r1, r3, #1
 8002fce:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 8002fd2:	2200      	movs	r2, #0
 8002fd4:	482b      	ldr	r0, [pc, #172]	; (8003084 <terminal_hw_config+0x2b0>)
 8002fd6:	f7ff fb25 	bl	8002624 <LL_USART_SetBaudRate>
 8002fda:	482a      	ldr	r0, [pc, #168]	; (8003084 <terminal_hw_config+0x2b0>)
 8002fdc:	f7ff faa2 	bl	8002524 <LL_USART_EnableDirectionRx>
 8002fe0:	4828      	ldr	r0, [pc, #160]	; (8003084 <terminal_hw_config+0x2b0>)
 8002fe2:	f7ff faaf 	bl	8002544 <LL_USART_EnableDirectionTx>
 8002fe6:	4827      	ldr	r0, [pc, #156]	; (8003084 <terminal_hw_config+0x2b0>)
 8002fe8:	f7ff fc28 	bl	800283c <LL_USART_EnableDMAReq_RX>
 8002fec:	4825      	ldr	r0, [pc, #148]	; (8003084 <terminal_hw_config+0x2b0>)
 8002fee:	f7ff fc15 	bl	800281c <LL_USART_EnableIT_IDLE>
 8002ff2:	4824      	ldr	r0, [pc, #144]	; (8003084 <terminal_hw_config+0x2b0>)
 8002ff4:	f7ff fa86 	bl	8002504 <LL_USART_Enable>
 8002ff8:	2101      	movs	r1, #1
 8002ffa:	2025      	movs	r0, #37	; 0x25
 8002ffc:	f7ff fa58 	bl	80024b0 <NVIC_SetPriority>
 8003000:	2025      	movs	r0, #37	; 0x25
 8003002:	f7ff fa3b 	bl	800247c <NVIC_EnableIRQ>
 8003006:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 800300a:	2102      	movs	r1, #2
 800300c:	481e      	ldr	r0, [pc, #120]	; (8003088 <terminal_hw_config+0x2b4>)
 800300e:	f7ff fd05 	bl	8002a1c <LL_DMA_SetChannelSelection>
 8003012:	4b19      	ldr	r3, [pc, #100]	; (8003078 <terminal_hw_config+0x2a4>)
 8003014:	681b      	ldr	r3, [r3, #0]
 8003016:	699b      	ldr	r3, [r3, #24]
 8003018:	461a      	mov	r2, r3
 800301a:	2300      	movs	r3, #0
 800301c:	9300      	str	r3, [sp, #0]
 800301e:	4613      	mov	r3, r2
 8003020:	4a1a      	ldr	r2, [pc, #104]	; (800308c <terminal_hw_config+0x2b8>)
 8003022:	2102      	movs	r1, #2
 8003024:	4818      	ldr	r0, [pc, #96]	; (8003088 <terminal_hw_config+0x2b4>)
 8003026:	f7ff fd1d 	bl	8002a64 <LL_DMA_ConfigAddresses>
 800302a:	f44f 7280 	mov.w	r2, #256	; 0x100
 800302e:	2102      	movs	r1, #2
 8003030:	4815      	ldr	r0, [pc, #84]	; (8003088 <terminal_hw_config+0x2b4>)
 8003032:	f7ff fccf 	bl	80029d4 <LL_DMA_SetDataLength>
 8003036:	f44f 6280 	mov.w	r2, #1024	; 0x400
 800303a:	2102      	movs	r1, #2
 800303c:	4812      	ldr	r0, [pc, #72]	; (8003088 <terminal_hw_config+0x2b4>)
 800303e:	f7ff fca5 	bl	800298c <LL_DMA_SetMemoryIncMode>
 8003042:	2102      	movs	r1, #2
 8003044:	4810      	ldr	r0, [pc, #64]	; (8003088 <terminal_hw_config+0x2b4>)
 8003046:	f7ff fc61 	bl	800290c <LL_DMA_EnableStream>
 800304a:	2102      	movs	r1, #2
 800304c:	480e      	ldr	r0, [pc, #56]	; (8003088 <terminal_hw_config+0x2b4>)
 800304e:	f7ff fda5 	bl	8002b9c <LL_DMA_EnableIT_TC>
 8003052:	2106      	movs	r1, #6
 8003054:	203a      	movs	r0, #58	; 0x3a
 8003056:	f7ff fa2b 	bl	80024b0 <NVIC_SetPriority>
 800305a:	203a      	movs	r0, #58	; 0x3a
 800305c:	f7ff fa0e 	bl	800247c <NVIC_EnableIRQ>
 8003060:	bf00      	nop
 8003062:	46bd      	mov	sp, r7
 8003064:	bd80      	pop	{r7, pc}
 8003066:	bf00      	nop
 8003068:	40020800 	.word	0x40020800
 800306c:	40004800 	.word	0x40004800
 8003070:	2000007c 	.word	0x2000007c
 8003074:	40026000 	.word	0x40026000
 8003078:	20000270 	.word	0x20000270
 800307c:	40004804 	.word	0x40004804
 8003080:	40020400 	.word	0x40020400
 8003084:	40011000 	.word	0x40011000
 8003088:	40026400 	.word	0x40026400
 800308c:	40011004 	.word	0x40011004

08003090 <term_request>:
 8003090:	b580      	push	{r7, lr}
 8003092:	b082      	sub	sp, #8
 8003094:	af00      	add	r7, sp, #0
 8003096:	6078      	str	r0, [r7, #4]
 8003098:	f04f 31ff 	mov.w	r1, #4294967295	; 0xffffffff
 800309c:	2001      	movs	r0, #1
 800309e:	f003 ff59 	bl	8006f54 <ulTaskNotifyTake>
 80030a2:	4603      	mov	r3, r0
 80030a4:	2b00      	cmp	r3, #0
 80030a6:	d008      	beq.n	80030ba <term_request+0x2a>
 80030a8:	687b      	ldr	r3, [r7, #4]
 80030aa:	68db      	ldr	r3, [r3, #12]
 80030ac:	1c5a      	adds	r2, r3, #1
 80030ae:	687b      	ldr	r3, [r7, #4]
 80030b0:	611a      	str	r2, [r3, #16]
 80030b2:	687b      	ldr	r3, [r7, #4]
 80030b4:	68db      	ldr	r3, [r3, #12]
 80030b6:	781b      	ldrb	r3, [r3, #0]
 80030b8:	e000      	b.n	80030bc <term_request+0x2c>
 80030ba:	2300      	movs	r3, #0
 80030bc:	4618      	mov	r0, r3
 80030be:	3708      	adds	r7, #8
 80030c0:	46bd      	mov	sp, r7
 80030c2:	bd80      	pop	{r7, pc}

080030c4 <term_response>:
 80030c4:	b580      	push	{r7, lr}
 80030c6:	b084      	sub	sp, #16
 80030c8:	af00      	add	r7, sp, #0
 80030ca:	6078      	str	r0, [r7, #4]
 80030cc:	6039      	str	r1, [r7, #0]
 80030ce:	2300      	movs	r3, #0
 80030d0:	60fb      	str	r3, [r7, #12]
 80030d2:	687b      	ldr	r3, [r7, #4]
 80030d4:	681b      	ldr	r3, [r3, #0]
 80030d6:	4618      	mov	r0, r3
 80030d8:	f7ff fb92 	bl	8002800 <LL_USART_ClearFlag_TC>
 80030dc:	e01b      	b.n	8003116 <term_response+0x52>
 80030de:	4b1b      	ldr	r3, [pc, #108]	; (800314c <term_response+0x88>)
 80030e0:	f04f 5280 	mov.w	r2, #268435456	; 0x10000000
 80030e4:	601a      	str	r2, [r3, #0]
 80030e6:	f3bf 8f4f 	dsb	sy
 80030ea:	f3bf 8f6f 	isb	sy
 80030ee:	687b      	ldr	r3, [r7, #4]
 80030f0:	681b      	ldr	r3, [r3, #0]
 80030f2:	4618      	mov	r0, r3
 80030f4:	f7ff fb5f 	bl	80027b6 <LL_USART_IsActiveFlag_TXE>
 80030f8:	4603      	mov	r3, r0
 80030fa:	2b00      	cmp	r3, #0
 80030fc:	d0ef      	beq.n	80030de <term_response+0x1a>
 80030fe:	687b      	ldr	r3, [r7, #4]
 8003100:	6818      	ldr	r0, [r3, #0]
 8003102:	687b      	ldr	r3, [r7, #4]
 8003104:	691a      	ldr	r2, [r3, #16]
 8003106:	68fb      	ldr	r3, [r7, #12]
 8003108:	1c59      	adds	r1, r3, #1
 800310a:	60f9      	str	r1, [r7, #12]
 800310c:	4413      	add	r3, r2
 800310e:	781b      	ldrb	r3, [r3, #0]
 8003110:	4619      	mov	r1, r3
 8003112:	f7ff fba3 	bl	800285c <LL_USART_TransmitData8>
 8003116:	683b      	ldr	r3, [r7, #0]
 8003118:	1e5a      	subs	r2, r3, #1
 800311a:	603a      	str	r2, [r7, #0]
 800311c:	2b00      	cmp	r3, #0
 800311e:	d1e6      	bne.n	80030ee <term_response+0x2a>
 8003120:	e007      	b.n	8003132 <term_response+0x6e>
 8003122:	4b0a      	ldr	r3, [pc, #40]	; (800314c <term_response+0x88>)
 8003124:	f04f 5280 	mov.w	r2, #268435456	; 0x10000000
 8003128:	601a      	str	r2, [r3, #0]
 800312a:	f3bf 8f4f 	dsb	sy
 800312e:	f3bf 8f6f 	isb	sy
 8003132:	687b      	ldr	r3, [r7, #4]
 8003134:	681b      	ldr	r3, [r3, #0]
 8003136:	4618      	mov	r0, r3
 8003138:	f7ff fb2a 	bl	8002790 <LL_USART_IsActiveFlag_TC>
 800313c:	4603      	mov	r3, r0
 800313e:	2b00      	cmp	r3, #0
 8003140:	d0ef      	beq.n	8003122 <term_response+0x5e>
 8003142:	bf00      	nop
 8003144:	3710      	adds	r7, #16
 8003146:	46bd      	mov	sp, r7
 8003148:	bd80      	pop	{r7, pc}
 800314a:	bf00      	nop
 800314c:	e000ed04 	.word	0xe000ed04

08003150 <terminal_manager>:
 8003150:	b580      	push	{r7, lr}
 8003152:	b08c      	sub	sp, #48	; 0x30
 8003154:	af00      	add	r7, sp, #0
 8003156:	6078      	str	r0, [r7, #4]
 8003158:	2300      	movs	r3, #0
 800315a:	62fb      	str	r3, [r7, #44]	; 0x2c
 800315c:	2300      	movs	r3, #0
 800315e:	62bb      	str	r3, [r7, #40]	; 0x28
 8003160:	4b1f      	ldr	r3, [pc, #124]	; (80031e0 <terminal_manager+0x90>)
 8003162:	60bb      	str	r3, [r7, #8]
 8003164:	f44f 7080 	mov.w	r0, #256	; 0x100
 8003168:	f005 fca4 	bl	8008ab4 <malloc>
 800316c:	4603      	mov	r3, r0
 800316e:	617b      	str	r3, [r7, #20]
 8003170:	2080      	movs	r0, #128	; 0x80
 8003172:	f005 fc9f 	bl	8008ab4 <malloc>
 8003176:	4603      	mov	r3, r0
 8003178:	61bb      	str	r3, [r7, #24]
 800317a:	200a      	movs	r0, #10
 800317c:	f005 fc9a 	bl	8008ab4 <malloc>
 8003180:	4603      	mov	r3, r0
 8003182:	623b      	str	r3, [r7, #32]
 8003184:	f003 fd08 	bl	8006b98 <xTaskGetCurrentTaskHandle>
 8003188:	4603      	mov	r3, r0
 800318a:	627b      	str	r3, [r7, #36]	; 0x24
 800318c:	4a15      	ldr	r2, [pc, #84]	; (80031e4 <terminal_manager+0x94>)
 800318e:	f107 0308 	add.w	r3, r7, #8
 8003192:	6013      	str	r3, [r2, #0]
 8003194:	f7ff fe1e 	bl	8002dd4 <terminal_hw_config>
 8003198:	f107 0308 	add.w	r3, r7, #8
 800319c:	4618      	mov	r0, r3
 800319e:	f7ff ff77 	bl	8003090 <term_request>
 80031a2:	62f8      	str	r0, [r7, #44]	; 0x2c
 80031a4:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 80031a6:	2b00      	cmp	r3, #0
 80031a8:	dd17      	ble.n	80031da <terminal_manager+0x8a>
 80031aa:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 80031ac:	2b80      	cmp	r3, #128	; 0x80
 80031ae:	dc14      	bgt.n	80031da <terminal_manager+0x8a>
 80031b0:	4a0d      	ldr	r2, [pc, #52]	; (80031e8 <terminal_manager+0x98>)
 80031b2:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 80031b4:	f852 3023 	ldr.w	r3, [r2, r3, lsl #2]
 80031b8:	2b00      	cmp	r3, #0
 80031ba:	d00e      	beq.n	80031da <terminal_manager+0x8a>
 80031bc:	4a0a      	ldr	r2, [pc, #40]	; (80031e8 <terminal_manager+0x98>)
 80031be:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 80031c0:	f852 3023 	ldr.w	r3, [r2, r3, lsl #2]
 80031c4:	69ba      	ldr	r2, [r7, #24]
 80031c6:	4610      	mov	r0, r2
 80031c8:	4798      	blx	r3
 80031ca:	62b8      	str	r0, [r7, #40]	; 0x28
 80031cc:	f107 0308 	add.w	r3, r7, #8
 80031d0:	6ab9      	ldr	r1, [r7, #40]	; 0x28
 80031d2:	4618      	mov	r0, r3
 80031d4:	f7ff ff76 	bl	80030c4 <term_response>
 80031d8:	e7de      	b.n	8003198 <terminal_manager+0x48>
 80031da:	bf00      	nop
 80031dc:	e7dc      	b.n	8003198 <terminal_manager+0x48>
 80031de:	bf00      	nop
 80031e0:	40004800 	.word	0x40004800
 80031e4:	20000270 	.word	0x20000270
 80031e8:	0800b2f8 	.word	0x0800b2f8

080031ec <USART3_IRQHandler>:
 80031ec:	b580      	push	{r7, lr}
 80031ee:	b082      	sub	sp, #8
 80031f0:	af00      	add	r7, sp, #0
 80031f2:	2300      	movs	r3, #0
 80031f4:	607b      	str	r3, [r7, #4]
 80031f6:	480b      	ldr	r0, [pc, #44]	; (8003224 <USART3_IRQHandler+0x38>)
 80031f8:	f7ff faf0 	bl	80027dc <LL_USART_ClearFlag_IDLE>
 80031fc:	2101      	movs	r1, #1
 80031fe:	480a      	ldr	r0, [pc, #40]	; (8003228 <USART3_IRQHandler+0x3c>)
 8003200:	f7ff fba4 	bl	800294c <LL_DMA_DisableStream>
 8003204:	687b      	ldr	r3, [r7, #4]
 8003206:	2b00      	cmp	r3, #0
 8003208:	d007      	beq.n	800321a <USART3_IRQHandler+0x2e>
 800320a:	4b08      	ldr	r3, [pc, #32]	; (800322c <USART3_IRQHandler+0x40>)
 800320c:	f04f 5280 	mov.w	r2, #268435456	; 0x10000000
 8003210:	601a      	str	r2, [r3, #0]
 8003212:	f3bf 8f4f 	dsb	sy
 8003216:	f3bf 8f6f 	isb	sy
 800321a:	bf00      	nop
 800321c:	3708      	adds	r7, #8
 800321e:	46bd      	mov	sp, r7
 8003220:	bd80      	pop	{r7, pc}
 8003222:	bf00      	nop
 8003224:	40004800 	.word	0x40004800
 8003228:	40026000 	.word	0x40026000
 800322c:	e000ed04 	.word	0xe000ed04

08003230 <DMA1_Stream1_IRQHandler>:
 8003230:	b580      	push	{r7, lr}
 8003232:	b082      	sub	sp, #8
 8003234:	af00      	add	r7, sp, #0
 8003236:	2300      	movs	r3, #0
 8003238:	607b      	str	r3, [r7, #4]
 800323a:	4813      	ldr	r0, [pc, #76]	; (8003288 <DMA1_Stream1_IRQHandler+0x58>)
 800323c:	f7ff fc4e 	bl	8002adc <LL_DMA_IsActiveFlag_TC1>
 8003240:	4603      	mov	r3, r0
 8003242:	2b00      	cmp	r3, #0
 8003244:	d011      	beq.n	800326a <DMA1_Stream1_IRQHandler+0x3a>
 8003246:	4810      	ldr	r0, [pc, #64]	; (8003288 <DMA1_Stream1_IRQHandler+0x58>)
 8003248:	f7ff fc8c 	bl	8002b64 <LL_DMA_ClearFlag_TC1>
 800324c:	480e      	ldr	r0, [pc, #56]	; (8003288 <DMA1_Stream1_IRQHandler+0x58>)
 800324e:	f7ff fc6d 	bl	8002b2c <LL_DMA_ClearFlag_HT1>
 8003252:	2101      	movs	r1, #1
 8003254:	480c      	ldr	r0, [pc, #48]	; (8003288 <DMA1_Stream1_IRQHandler+0x58>)
 8003256:	f7ff fb59 	bl	800290c <LL_DMA_EnableStream>
 800325a:	4b0c      	ldr	r3, [pc, #48]	; (800328c <DMA1_Stream1_IRQHandler+0x5c>)
 800325c:	681b      	ldr	r3, [r3, #0]
 800325e:	69db      	ldr	r3, [r3, #28]
 8003260:	1d3a      	adds	r2, r7, #4
 8003262:	4611      	mov	r1, r2
 8003264:	4618      	mov	r0, r3
 8003266:	f003 ff7d 	bl	8007164 <vTaskNotifyGiveFromISR>
 800326a:	687b      	ldr	r3, [r7, #4]
 800326c:	2b00      	cmp	r3, #0
 800326e:	d007      	beq.n	8003280 <DMA1_Stream1_IRQHandler+0x50>
 8003270:	4b07      	ldr	r3, [pc, #28]	; (8003290 <DMA1_Stream1_IRQHandler+0x60>)
 8003272:	f04f 5280 	mov.w	r2, #268435456	; 0x10000000
 8003276:	601a      	str	r2, [r3, #0]
 8003278:	f3bf 8f4f 	dsb	sy
 800327c:	f3bf 8f6f 	isb	sy
 8003280:	bf00      	nop
 8003282:	3708      	adds	r7, #8
 8003284:	46bd      	mov	sp, r7
 8003286:	bd80      	pop	{r7, pc}
 8003288:	40026000 	.word	0x40026000
 800328c:	20000270 	.word	0x20000270
 8003290:	e000ed04 	.word	0xe000ed04

08003294 <USART1_IRQHandler>:
 8003294:	b580      	push	{r7, lr}
 8003296:	b082      	sub	sp, #8
 8003298:	af00      	add	r7, sp, #0
 800329a:	2300      	movs	r3, #0
 800329c:	607b      	str	r3, [r7, #4]
 800329e:	480b      	ldr	r0, [pc, #44]	; (80032cc <USART1_IRQHandler+0x38>)
 80032a0:	f7ff fa9c 	bl	80027dc <LL_USART_ClearFlag_IDLE>
 80032a4:	2102      	movs	r1, #2
 80032a6:	480a      	ldr	r0, [pc, #40]	; (80032d0 <USART1_IRQHandler+0x3c>)
 80032a8:	f7ff fb50 	bl	800294c <LL_DMA_DisableStream>
 80032ac:	687b      	ldr	r3, [r7, #4]
 80032ae:	2b00      	cmp	r3, #0
 80032b0:	d007      	beq.n	80032c2 <USART1_IRQHandler+0x2e>
 80032b2:	4b08      	ldr	r3, [pc, #32]	; (80032d4 <USART1_IRQHandler+0x40>)
 80032b4:	f04f 5280 	mov.w	r2, #268435456	; 0x10000000
 80032b8:	601a      	str	r2, [r3, #0]
 80032ba:	f3bf 8f4f 	dsb	sy
 80032be:	f3bf 8f6f 	isb	sy
 80032c2:	bf00      	nop
 80032c4:	3708      	adds	r7, #8
 80032c6:	46bd      	mov	sp, r7
 80032c8:	bd80      	pop	{r7, pc}
 80032ca:	bf00      	nop
 80032cc:	40011000 	.word	0x40011000
 80032d0:	40026400 	.word	0x40026400
 80032d4:	e000ed04 	.word	0xe000ed04

080032d8 <DMA2_Stream2_IRQHandler>:
 80032d8:	b580      	push	{r7, lr}
 80032da:	b082      	sub	sp, #8
 80032dc:	af00      	add	r7, sp, #0
 80032de:	2300      	movs	r3, #0
 80032e0:	607b      	str	r3, [r7, #4]
 80032e2:	480f      	ldr	r0, [pc, #60]	; (8003320 <DMA2_Stream2_IRQHandler+0x48>)
 80032e4:	f7ff fc0e 	bl	8002b04 <LL_DMA_IsActiveFlag_TC2>
 80032e8:	4603      	mov	r3, r0
 80032ea:	2b00      	cmp	r3, #0
 80032ec:	d009      	beq.n	8003302 <DMA2_Stream2_IRQHandler+0x2a>
 80032ee:	480c      	ldr	r0, [pc, #48]	; (8003320 <DMA2_Stream2_IRQHandler+0x48>)
 80032f0:	f7ff fc46 	bl	8002b80 <LL_DMA_ClearFlag_TC2>
 80032f4:	480a      	ldr	r0, [pc, #40]	; (8003320 <DMA2_Stream2_IRQHandler+0x48>)
 80032f6:	f7ff fc27 	bl	8002b48 <LL_DMA_ClearFlag_HT2>
 80032fa:	2102      	movs	r1, #2
 80032fc:	4808      	ldr	r0, [pc, #32]	; (8003320 <DMA2_Stream2_IRQHandler+0x48>)
 80032fe:	f7ff fb05 	bl	800290c <LL_DMA_EnableStream>
 8003302:	687b      	ldr	r3, [r7, #4]
 8003304:	2b00      	cmp	r3, #0
 8003306:	d007      	beq.n	8003318 <DMA2_Stream2_IRQHandler+0x40>
 8003308:	4b06      	ldr	r3, [pc, #24]	; (8003324 <DMA2_Stream2_IRQHandler+0x4c>)
 800330a:	f04f 5280 	mov.w	r2, #268435456	; 0x10000000
 800330e:	601a      	str	r2, [r3, #0]
 8003310:	f3bf 8f4f 	dsb	sy
 8003314:	f3bf 8f6f 	isb	sy
 8003318:	bf00      	nop
 800331a:	3708      	adds	r7, #8
 800331c:	46bd      	mov	sp, r7
 800331e:	bd80      	pop	{r7, pc}
 8003320:	40026400 	.word	0x40026400
 8003324:	e000ed04 	.word	0xe000ed04

08003328 <cmd_echo_handler>:
 8003328:	b480      	push	{r7}
 800332a:	b083      	sub	sp, #12
 800332c:	af00      	add	r7, sp, #0
 800332e:	6078      	str	r0, [r7, #4]
 8003330:	2304      	movs	r3, #4
 8003332:	4618      	mov	r0, r3
 8003334:	370c      	adds	r7, #12
 8003336:	46bd      	mov	sp, r7
 8003338:	f85d 7b04 	ldr.w	r7, [sp], #4
 800333c:	4770      	bx	lr
	...

08003340 <cmd_fake_data>:
 8003340:	b580      	push	{r7, lr}
 8003342:	b086      	sub	sp, #24
 8003344:	af00      	add	r7, sp, #0
 8003346:	6078      	str	r0, [r7, #4]
 8003348:	4a09      	ldr	r2, [pc, #36]	; (8003370 <cmd_fake_data+0x30>)
 800334a:	f107 030c 	add.w	r3, r7, #12
 800334e:	ca07      	ldmia	r2, {r0, r1, r2}
 8003350:	c303      	stmia	r3!, {r0, r1}
 8003352:	701a      	strb	r2, [r3, #0]
 8003354:	687b      	ldr	r3, [r7, #4]
 8003356:	4618      	mov	r0, r3
 8003358:	f107 030c 	add.w	r3, r7, #12
 800335c:	2209      	movs	r2, #9
 800335e:	4619      	mov	r1, r3
 8003360:	f005 fbb0 	bl	8008ac4 <memcpy>
 8003364:	2309      	movs	r3, #9
 8003366:	4618      	mov	r0, r3
 8003368:	3718      	adds	r7, #24
 800336a:	46bd      	mov	sp, r7
 800336c:	bd80      	pop	{r7, pc}
 800336e:	bf00      	nop
 8003370:	0800b2a8 	.word	0x0800b2a8

08003374 <vApplicationMallocFailedHook>:
 8003374:	b480      	push	{r7}
 8003376:	af00      	add	r7, sp, #0
 8003378:	bf00      	nop
 800337a:	46bd      	mov	sp, r7
 800337c:	f85d 7b04 	ldr.w	r7, [sp], #4
 8003380:	4770      	bx	lr

08003382 <vApplicationIdleHook>:
 8003382:	b480      	push	{r7}
 8003384:	af00      	add	r7, sp, #0
 8003386:	bf00      	nop
 8003388:	46bd      	mov	sp, r7
 800338a:	f85d 7b04 	ldr.w	r7, [sp], #4
 800338e:	4770      	bx	lr

08003390 <vApplicationTickHook>:
 8003390:	b480      	push	{r7}
 8003392:	af00      	add	r7, sp, #0
 8003394:	bf00      	nop
 8003396:	46bd      	mov	sp, r7
 8003398:	f85d 7b04 	ldr.w	r7, [sp], #4
 800339c:	4770      	bx	lr

0800339e <vApplicationStackOverflowHook>:
 800339e:	b480      	push	{r7}
 80033a0:	b085      	sub	sp, #20
 80033a2:	af00      	add	r7, sp, #0
 80033a4:	6078      	str	r0, [r7, #4]
 80033a6:	6039      	str	r1, [r7, #0]
 80033a8:	f04f 0350 	mov.w	r3, #80	; 0x50
 80033ac:	f383 8811 	msr	BASEPRI, r3
 80033b0:	f3bf 8f6f 	isb	sy
 80033b4:	f3bf 8f4f 	dsb	sy
 80033b8:	60fb      	str	r3, [r7, #12]
 80033ba:	e7fe      	b.n	80033ba <vApplicationStackOverflowHook+0x1c>

080033bc <vApplicationGetIdleTaskMemory>:
 80033bc:	b480      	push	{r7}
 80033be:	b085      	sub	sp, #20
 80033c0:	af00      	add	r7, sp, #0
 80033c2:	60f8      	str	r0, [r7, #12]
 80033c4:	60b9      	str	r1, [r7, #8]
 80033c6:	607a      	str	r2, [r7, #4]
 80033c8:	68fb      	ldr	r3, [r7, #12]
 80033ca:	4a07      	ldr	r2, [pc, #28]	; (80033e8 <vApplicationGetIdleTaskMemory+0x2c>)
 80033cc:	601a      	str	r2, [r3, #0]
 80033ce:	68bb      	ldr	r3, [r7, #8]
 80033d0:	4a06      	ldr	r2, [pc, #24]	; (80033ec <vApplicationGetIdleTaskMemory+0x30>)
 80033d2:	601a      	str	r2, [r3, #0]
 80033d4:	687b      	ldr	r3, [r7, #4]
 80033d6:	2282      	movs	r2, #130	; 0x82
 80033d8:	601a      	str	r2, [r3, #0]
 80033da:	bf00      	nop
 80033dc:	3714      	adds	r7, #20
 80033de:	46bd      	mov	sp, r7
 80033e0:	f85d 7b04 	ldr.w	r7, [sp], #4
 80033e4:	4770      	bx	lr
 80033e6:	bf00      	nop
 80033e8:	20018c48 	.word	0x20018c48
 80033ec:	200190c8 	.word	0x200190c8

080033f0 <vApplicationGetTimerTaskMemory>:
 80033f0:	b480      	push	{r7}
 80033f2:	b085      	sub	sp, #20
 80033f4:	af00      	add	r7, sp, #0
 80033f6:	60f8      	str	r0, [r7, #12]
 80033f8:	60b9      	str	r1, [r7, #8]
 80033fa:	607a      	str	r2, [r7, #4]
 80033fc:	68fb      	ldr	r3, [r7, #12]
 80033fe:	4a07      	ldr	r2, [pc, #28]	; (800341c <vApplicationGetTimerTaskMemory+0x2c>)
 8003400:	601a      	str	r2, [r3, #0]
 8003402:	68bb      	ldr	r3, [r7, #8]
 8003404:	4a06      	ldr	r2, [pc, #24]	; (8003420 <vApplicationGetTimerTaskMemory+0x30>)
 8003406:	601a      	str	r2, [r3, #0]
 8003408:	687b      	ldr	r3, [r7, #4]
 800340a:	f44f 7282 	mov.w	r2, #260	; 0x104
 800340e:	601a      	str	r2, [r3, #0]
 8003410:	bf00      	nop
 8003412:	3714      	adds	r7, #20
 8003414:	46bd      	mov	sp, r7
 8003416:	f85d 7b04 	ldr.w	r7, [sp], #4
 800341a:	4770      	bx	lr
 800341c:	20000278 	.word	0x20000278
 8003420:	200006f8 	.word	0x200006f8

08003424 <NVIC_EnableIRQ>:
 8003424:	b480      	push	{r7}
 8003426:	b083      	sub	sp, #12
 8003428:	af00      	add	r7, sp, #0
 800342a:	4603      	mov	r3, r0
 800342c:	71fb      	strb	r3, [r7, #7]
 800342e:	79fb      	ldrb	r3, [r7, #7]
 8003430:	f003 021f 	and.w	r2, r3, #31
 8003434:	4907      	ldr	r1, [pc, #28]	; (8003454 <NVIC_EnableIRQ+0x30>)
 8003436:	f997 3007 	ldrsb.w	r3, [r7, #7]
 800343a:	095b      	lsrs	r3, r3, #5
 800343c:	2001      	movs	r0, #1
 800343e:	fa00 f202 	lsl.w	r2, r0, r2
 8003442:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
 8003446:	bf00      	nop
 8003448:	370c      	adds	r7, #12
 800344a:	46bd      	mov	sp, r7
 800344c:	f85d 7b04 	ldr.w	r7, [sp], #4
 8003450:	4770      	bx	lr
 8003452:	bf00      	nop
 8003454:	e000e100 	.word	0xe000e100

08003458 <NVIC_SetPriority>:
 8003458:	b480      	push	{r7}
 800345a:	b083      	sub	sp, #12
 800345c:	af00      	add	r7, sp, #0
 800345e:	4603      	mov	r3, r0
 8003460:	6039      	str	r1, [r7, #0]
 8003462:	71fb      	strb	r3, [r7, #7]
 8003464:	f997 3007 	ldrsb.w	r3, [r7, #7]
 8003468:	2b00      	cmp	r3, #0
 800346a:	da0b      	bge.n	8003484 <NVIC_SetPriority+0x2c>
 800346c:	683b      	ldr	r3, [r7, #0]
 800346e:	b2da      	uxtb	r2, r3
 8003470:	490c      	ldr	r1, [pc, #48]	; (80034a4 <NVIC_SetPriority+0x4c>)
 8003472:	79fb      	ldrb	r3, [r7, #7]
 8003474:	f003 030f 	and.w	r3, r3, #15
 8003478:	3b04      	subs	r3, #4
 800347a:	0112      	lsls	r2, r2, #4
 800347c:	b2d2      	uxtb	r2, r2
 800347e:	440b      	add	r3, r1
 8003480:	761a      	strb	r2, [r3, #24]
 8003482:	e009      	b.n	8003498 <NVIC_SetPriority+0x40>
 8003484:	683b      	ldr	r3, [r7, #0]
 8003486:	b2da      	uxtb	r2, r3
 8003488:	4907      	ldr	r1, [pc, #28]	; (80034a8 <NVIC_SetPriority+0x50>)
 800348a:	f997 3007 	ldrsb.w	r3, [r7, #7]
 800348e:	0112      	lsls	r2, r2, #4
 8003490:	b2d2      	uxtb	r2, r2
 8003492:	440b      	add	r3, r1
 8003494:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 8003498:	bf00      	nop
 800349a:	370c      	adds	r7, #12
 800349c:	46bd      	mov	sp, r7
 800349e:	f85d 7b04 	ldr.w	r7, [sp], #4
 80034a2:	4770      	bx	lr
 80034a4:	e000ed00 	.word	0xe000ed00
 80034a8:	e000e100 	.word	0xe000e100

080034ac <LL_AHB1_GRP1_EnableClock>:
 80034ac:	b480      	push	{r7}
 80034ae:	b085      	sub	sp, #20
 80034b0:	af00      	add	r7, sp, #0
 80034b2:	6078      	str	r0, [r7, #4]
 80034b4:	4b08      	ldr	r3, [pc, #32]	; (80034d8 <LL_AHB1_GRP1_EnableClock+0x2c>)
 80034b6:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 80034b8:	4907      	ldr	r1, [pc, #28]	; (80034d8 <LL_AHB1_GRP1_EnableClock+0x2c>)
 80034ba:	687b      	ldr	r3, [r7, #4]
 80034bc:	4313      	orrs	r3, r2
 80034be:	630b      	str	r3, [r1, #48]	; 0x30
 80034c0:	4b05      	ldr	r3, [pc, #20]	; (80034d8 <LL_AHB1_GRP1_EnableClock+0x2c>)
 80034c2:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 80034c4:	687b      	ldr	r3, [r7, #4]
 80034c6:	4013      	ands	r3, r2
 80034c8:	60fb      	str	r3, [r7, #12]
 80034ca:	68fb      	ldr	r3, [r7, #12]
 80034cc:	bf00      	nop
 80034ce:	3714      	adds	r7, #20
 80034d0:	46bd      	mov	sp, r7
 80034d2:	f85d 7b04 	ldr.w	r7, [sp], #4
 80034d6:	4770      	bx	lr
 80034d8:	40023800 	.word	0x40023800

080034dc <LL_APB1_GRP1_EnableClock>:
 80034dc:	b480      	push	{r7}
 80034de:	b085      	sub	sp, #20
 80034e0:	af00      	add	r7, sp, #0
 80034e2:	6078      	str	r0, [r7, #4]
 80034e4:	4b08      	ldr	r3, [pc, #32]	; (8003508 <LL_APB1_GRP1_EnableClock+0x2c>)
 80034e6:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 80034e8:	4907      	ldr	r1, [pc, #28]	; (8003508 <LL_APB1_GRP1_EnableClock+0x2c>)
 80034ea:	687b      	ldr	r3, [r7, #4]
 80034ec:	4313      	orrs	r3, r2
 80034ee:	640b      	str	r3, [r1, #64]	; 0x40
 80034f0:	4b05      	ldr	r3, [pc, #20]	; (8003508 <LL_APB1_GRP1_EnableClock+0x2c>)
 80034f2:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 80034f4:	687b      	ldr	r3, [r7, #4]
 80034f6:	4013      	ands	r3, r2
 80034f8:	60fb      	str	r3, [r7, #12]
 80034fa:	68fb      	ldr	r3, [r7, #12]
 80034fc:	bf00      	nop
 80034fe:	3714      	adds	r7, #20
 8003500:	46bd      	mov	sp, r7
 8003502:	f85d 7b04 	ldr.w	r7, [sp], #4
 8003506:	4770      	bx	lr
 8003508:	40023800 	.word	0x40023800

0800350c <LL_APB2_GRP1_EnableClock>:
 800350c:	b480      	push	{r7}
 800350e:	b085      	sub	sp, #20
 8003510:	af00      	add	r7, sp, #0
 8003512:	6078      	str	r0, [r7, #4]
 8003514:	4b08      	ldr	r3, [pc, #32]	; (8003538 <LL_APB2_GRP1_EnableClock+0x2c>)
 8003516:	6c5a      	ldr	r2, [r3, #68]	; 0x44
 8003518:	4907      	ldr	r1, [pc, #28]	; (8003538 <LL_APB2_GRP1_EnableClock+0x2c>)
 800351a:	687b      	ldr	r3, [r7, #4]
 800351c:	4313      	orrs	r3, r2
 800351e:	644b      	str	r3, [r1, #68]	; 0x44
 8003520:	4b05      	ldr	r3, [pc, #20]	; (8003538 <LL_APB2_GRP1_EnableClock+0x2c>)
 8003522:	6c5a      	ldr	r2, [r3, #68]	; 0x44
 8003524:	687b      	ldr	r3, [r7, #4]
 8003526:	4013      	ands	r3, r2
 8003528:	60fb      	str	r3, [r7, #12]
 800352a:	68fb      	ldr	r3, [r7, #12]
 800352c:	bf00      	nop
 800352e:	3714      	adds	r7, #20
 8003530:	46bd      	mov	sp, r7
 8003532:	f85d 7b04 	ldr.w	r7, [sp], #4
 8003536:	4770      	bx	lr
 8003538:	40023800 	.word	0x40023800

0800353c <LL_TIM_EnableCounter>:
 800353c:	b480      	push	{r7}
 800353e:	b083      	sub	sp, #12
 8003540:	af00      	add	r7, sp, #0
 8003542:	6078      	str	r0, [r7, #4]
 8003544:	687b      	ldr	r3, [r7, #4]
 8003546:	681b      	ldr	r3, [r3, #0]
 8003548:	f043 0201 	orr.w	r2, r3, #1
 800354c:	687b      	ldr	r3, [r7, #4]
 800354e:	601a      	str	r2, [r3, #0]
 8003550:	bf00      	nop
 8003552:	370c      	adds	r7, #12
 8003554:	46bd      	mov	sp, r7
 8003556:	f85d 7b04 	ldr.w	r7, [sp], #4
 800355a:	4770      	bx	lr

0800355c <LL_TIM_IsEnabledCounter>:
 800355c:	b480      	push	{r7}
 800355e:	b083      	sub	sp, #12
 8003560:	af00      	add	r7, sp, #0
 8003562:	6078      	str	r0, [r7, #4]
 8003564:	687b      	ldr	r3, [r7, #4]
 8003566:	681b      	ldr	r3, [r3, #0]
 8003568:	f003 0301 	and.w	r3, r3, #1
 800356c:	2b01      	cmp	r3, #1
 800356e:	bf0c      	ite	eq
 8003570:	2301      	moveq	r3, #1
 8003572:	2300      	movne	r3, #0
 8003574:	b2db      	uxtb	r3, r3
 8003576:	4618      	mov	r0, r3
 8003578:	370c      	adds	r7, #12
 800357a:	46bd      	mov	sp, r7
 800357c:	f85d 7b04 	ldr.w	r7, [sp], #4
 8003580:	4770      	bx	lr

08003582 <LL_TIM_EnableUpdateEvent>:
 8003582:	b480      	push	{r7}
 8003584:	b083      	sub	sp, #12
 8003586:	af00      	add	r7, sp, #0
 8003588:	6078      	str	r0, [r7, #4]
 800358a:	687b      	ldr	r3, [r7, #4]
 800358c:	681b      	ldr	r3, [r3, #0]
 800358e:	f023 0202 	bic.w	r2, r3, #2
 8003592:	687b      	ldr	r3, [r7, #4]
 8003594:	601a      	str	r2, [r3, #0]
 8003596:	bf00      	nop
 8003598:	370c      	adds	r7, #12
 800359a:	46bd      	mov	sp, r7
 800359c:	f85d 7b04 	ldr.w	r7, [sp], #4
 80035a0:	4770      	bx	lr

080035a2 <LL_TIM_SetUpdateSource>:
 80035a2:	b480      	push	{r7}
 80035a4:	b083      	sub	sp, #12
 80035a6:	af00      	add	r7, sp, #0
 80035a8:	6078      	str	r0, [r7, #4]
 80035aa:	6039      	str	r1, [r7, #0]
 80035ac:	687b      	ldr	r3, [r7, #4]
 80035ae:	681b      	ldr	r3, [r3, #0]
 80035b0:	f023 0204 	bic.w	r2, r3, #4
 80035b4:	683b      	ldr	r3, [r7, #0]
 80035b6:	431a      	orrs	r2, r3
 80035b8:	687b      	ldr	r3, [r7, #4]
 80035ba:	601a      	str	r2, [r3, #0]
 80035bc:	bf00      	nop
 80035be:	370c      	adds	r7, #12
 80035c0:	46bd      	mov	sp, r7
 80035c2:	f85d 7b04 	ldr.w	r7, [sp], #4
 80035c6:	4770      	bx	lr

080035c8 <LL_TIM_SetCounterMode>:
 80035c8:	b480      	push	{r7}
 80035ca:	b083      	sub	sp, #12
 80035cc:	af00      	add	r7, sp, #0
 80035ce:	6078      	str	r0, [r7, #4]
 80035d0:	6039      	str	r1, [r7, #0]
 80035d2:	687b      	ldr	r3, [r7, #4]
 80035d4:	681b      	ldr	r3, [r3, #0]
 80035d6:	f023 0270 	bic.w	r2, r3, #112	; 0x70
 80035da:	683b      	ldr	r3, [r7, #0]
 80035dc:	431a      	orrs	r2, r3
 80035de:	687b      	ldr	r3, [r7, #4]
 80035e0:	601a      	str	r2, [r3, #0]
 80035e2:	bf00      	nop
 80035e4:	370c      	adds	r7, #12
 80035e6:	46bd      	mov	sp, r7
 80035e8:	f85d 7b04 	ldr.w	r7, [sp], #4
 80035ec:	4770      	bx	lr

080035ee <LL_TIM_EnableARRPreload>:
 80035ee:	b480      	push	{r7}
 80035f0:	b083      	sub	sp, #12
 80035f2:	af00      	add	r7, sp, #0
 80035f4:	6078      	str	r0, [r7, #4]
 80035f6:	687b      	ldr	r3, [r7, #4]
 80035f8:	681b      	ldr	r3, [r3, #0]
 80035fa:	f043 0280 	orr.w	r2, r3, #128	; 0x80
 80035fe:	687b      	ldr	r3, [r7, #4]
 8003600:	601a      	str	r2, [r3, #0]
 8003602:	bf00      	nop
 8003604:	370c      	adds	r7, #12
 8003606:	46bd      	mov	sp, r7
 8003608:	f85d 7b04 	ldr.w	r7, [sp], #4
 800360c:	4770      	bx	lr

0800360e <LL_TIM_SetClockDivision>:
 800360e:	b480      	push	{r7}
 8003610:	b083      	sub	sp, #12
 8003612:	af00      	add	r7, sp, #0
 8003614:	6078      	str	r0, [r7, #4]
 8003616:	6039      	str	r1, [r7, #0]
 8003618:	687b      	ldr	r3, [r7, #4]
 800361a:	681b      	ldr	r3, [r3, #0]
 800361c:	f423 7240 	bic.w	r2, r3, #768	; 0x300
 8003620:	683b      	ldr	r3, [r7, #0]
 8003622:	431a      	orrs	r2, r3
 8003624:	687b      	ldr	r3, [r7, #4]
 8003626:	601a      	str	r2, [r3, #0]
 8003628:	bf00      	nop
 800362a:	370c      	adds	r7, #12
 800362c:	46bd      	mov	sp, r7
 800362e:	f85d 7b04 	ldr.w	r7, [sp], #4
 8003632:	4770      	bx	lr

08003634 <LL_TIM_SetPrescaler>:
 8003634:	b480      	push	{r7}
 8003636:	b083      	sub	sp, #12
 8003638:	af00      	add	r7, sp, #0
 800363a:	6078      	str	r0, [r7, #4]
 800363c:	6039      	str	r1, [r7, #0]
 800363e:	687b      	ldr	r3, [r7, #4]
 8003640:	683a      	ldr	r2, [r7, #0]
 8003642:	629a      	str	r2, [r3, #40]	; 0x28
 8003644:	bf00      	nop
 8003646:	370c      	adds	r7, #12
 8003648:	46bd      	mov	sp, r7
 800364a:	f85d 7b04 	ldr.w	r7, [sp], #4
 800364e:	4770      	bx	lr

08003650 <LL_TIM_SetAutoReload>:
 8003650:	b480      	push	{r7}
 8003652:	b083      	sub	sp, #12
 8003654:	af00      	add	r7, sp, #0
 8003656:	6078      	str	r0, [r7, #4]
 8003658:	6039      	str	r1, [r7, #0]
 800365a:	687b      	ldr	r3, [r7, #4]
 800365c:	683a      	ldr	r2, [r7, #0]
 800365e:	62da      	str	r2, [r3, #44]	; 0x2c
 8003660:	bf00      	nop
 8003662:	370c      	adds	r7, #12
 8003664:	46bd      	mov	sp, r7
 8003666:	f85d 7b04 	ldr.w	r7, [sp], #4
 800366a:	4770      	bx	lr

0800366c <LL_TIM_CC_EnableChannel>:
 800366c:	b480      	push	{r7}
 800366e:	b083      	sub	sp, #12
 8003670:	af00      	add	r7, sp, #0
 8003672:	6078      	str	r0, [r7, #4]
 8003674:	6039      	str	r1, [r7, #0]
 8003676:	687b      	ldr	r3, [r7, #4]
 8003678:	6a1a      	ldr	r2, [r3, #32]
 800367a:	683b      	ldr	r3, [r7, #0]
 800367c:	431a      	orrs	r2, r3
 800367e:	687b      	ldr	r3, [r7, #4]
 8003680:	621a      	str	r2, [r3, #32]
 8003682:	bf00      	nop
 8003684:	370c      	adds	r7, #12
 8003686:	46bd      	mov	sp, r7
 8003688:	f85d 7b04 	ldr.w	r7, [sp], #4
 800368c:	4770      	bx	lr
	...

08003690 <LL_TIM_OC_SetMode>:
 8003690:	b4b0      	push	{r4, r5, r7}
 8003692:	b085      	sub	sp, #20
 8003694:	af00      	add	r7, sp, #0
 8003696:	60f8      	str	r0, [r7, #12]
 8003698:	60b9      	str	r1, [r7, #8]
 800369a:	607a      	str	r2, [r7, #4]
 800369c:	68bb      	ldr	r3, [r7, #8]
 800369e:	2b01      	cmp	r3, #1
 80036a0:	d01c      	beq.n	80036dc <LL_TIM_OC_SetMode+0x4c>
 80036a2:	68bb      	ldr	r3, [r7, #8]
 80036a4:	2b04      	cmp	r3, #4
 80036a6:	d017      	beq.n	80036d8 <LL_TIM_OC_SetMode+0x48>
 80036a8:	68bb      	ldr	r3, [r7, #8]
 80036aa:	2b10      	cmp	r3, #16
 80036ac:	d012      	beq.n	80036d4 <LL_TIM_OC_SetMode+0x44>
 80036ae:	68bb      	ldr	r3, [r7, #8]
 80036b0:	2b40      	cmp	r3, #64	; 0x40
 80036b2:	d00d      	beq.n	80036d0 <LL_TIM_OC_SetMode+0x40>
 80036b4:	68bb      	ldr	r3, [r7, #8]
 80036b6:	f5b3 7f80 	cmp.w	r3, #256	; 0x100
 80036ba:	d007      	beq.n	80036cc <LL_TIM_OC_SetMode+0x3c>
 80036bc:	68bb      	ldr	r3, [r7, #8]
 80036be:	f5b3 6f80 	cmp.w	r3, #1024	; 0x400
 80036c2:	d101      	bne.n	80036c8 <LL_TIM_OC_SetMode+0x38>
 80036c4:	2305      	movs	r3, #5
 80036c6:	e00a      	b.n	80036de <LL_TIM_OC_SetMode+0x4e>
 80036c8:	2306      	movs	r3, #6
 80036ca:	e008      	b.n	80036de <LL_TIM_OC_SetMode+0x4e>
 80036cc:	2304      	movs	r3, #4
 80036ce:	e006      	b.n	80036de <LL_TIM_OC_SetMode+0x4e>
 80036d0:	2303      	movs	r3, #3
 80036d2:	e004      	b.n	80036de <LL_TIM_OC_SetMode+0x4e>
 80036d4:	2302      	movs	r3, #2
 80036d6:	e002      	b.n	80036de <LL_TIM_OC_SetMode+0x4e>
 80036d8:	2301      	movs	r3, #1
 80036da:	e000      	b.n	80036de <LL_TIM_OC_SetMode+0x4e>
 80036dc:	2300      	movs	r3, #0
 80036de:	461d      	mov	r5, r3
 80036e0:	68fb      	ldr	r3, [r7, #12]
 80036e2:	3318      	adds	r3, #24
 80036e4:	461a      	mov	r2, r3
 80036e6:	4629      	mov	r1, r5
 80036e8:	4b0c      	ldr	r3, [pc, #48]	; (800371c <LL_TIM_OC_SetMode+0x8c>)
 80036ea:	5c5b      	ldrb	r3, [r3, r1]
 80036ec:	4413      	add	r3, r2
 80036ee:	461c      	mov	r4, r3
 80036f0:	6822      	ldr	r2, [r4, #0]
 80036f2:	4629      	mov	r1, r5
 80036f4:	4b0a      	ldr	r3, [pc, #40]	; (8003720 <LL_TIM_OC_SetMode+0x90>)
 80036f6:	5c5b      	ldrb	r3, [r3, r1]
 80036f8:	4619      	mov	r1, r3
 80036fa:	2373      	movs	r3, #115	; 0x73
 80036fc:	408b      	lsls	r3, r1
 80036fe:	43db      	mvns	r3, r3
 8003700:	401a      	ands	r2, r3
 8003702:	4629      	mov	r1, r5
 8003704:	4b06      	ldr	r3, [pc, #24]	; (8003720 <LL_TIM_OC_SetMode+0x90>)
 8003706:	5c5b      	ldrb	r3, [r3, r1]
 8003708:	4619      	mov	r1, r3
 800370a:	687b      	ldr	r3, [r7, #4]
 800370c:	408b      	lsls	r3, r1
 800370e:	4313      	orrs	r3, r2
 8003710:	6023      	str	r3, [r4, #0]
 8003712:	bf00      	nop
 8003714:	3714      	adds	r7, #20
 8003716:	46bd      	mov	sp, r7
 8003718:	bcb0      	pop	{r4, r5, r7}
 800371a:	4770      	bx	lr
 800371c:	0800b4fc 	.word	0x0800b4fc
 8003720:	0800b504 	.word	0x0800b504

08003724 <LL_TIM_OC_EnableFast>:
 8003724:	b4b0      	push	{r4, r5, r7}
 8003726:	b083      	sub	sp, #12
 8003728:	af00      	add	r7, sp, #0
 800372a:	6078      	str	r0, [r7, #4]
 800372c:	6039      	str	r1, [r7, #0]
 800372e:	683b      	ldr	r3, [r7, #0]
 8003730:	2b01      	cmp	r3, #1
 8003732:	d01c      	beq.n	800376e <LL_TIM_OC_EnableFast+0x4a>
 8003734:	683b      	ldr	r3, [r7, #0]
 8003736:	2b04      	cmp	r3, #4
 8003738:	d017      	beq.n	800376a <LL_TIM_OC_EnableFast+0x46>
 800373a:	683b      	ldr	r3, [r7, #0]
 800373c:	2b10      	cmp	r3, #16
 800373e:	d012      	beq.n	8003766 <LL_TIM_OC_EnableFast+0x42>
 8003740:	683b      	ldr	r3, [r7, #0]
 8003742:	2b40      	cmp	r3, #64	; 0x40
 8003744:	d00d      	beq.n	8003762 <LL_TIM_OC_EnableFast+0x3e>
 8003746:	683b      	ldr	r3, [r7, #0]
 8003748:	f5b3 7f80 	cmp.w	r3, #256	; 0x100
 800374c:	d007      	beq.n	800375e <LL_TIM_OC_EnableFast+0x3a>
 800374e:	683b      	ldr	r3, [r7, #0]
 8003750:	f5b3 6f80 	cmp.w	r3, #1024	; 0x400
 8003754:	d101      	bne.n	800375a <LL_TIM_OC_EnableFast+0x36>
 8003756:	2305      	movs	r3, #5
 8003758:	e00a      	b.n	8003770 <LL_TIM_OC_EnableFast+0x4c>
 800375a:	2306      	movs	r3, #6
 800375c:	e008      	b.n	8003770 <LL_TIM_OC_EnableFast+0x4c>
 800375e:	2304      	movs	r3, #4
 8003760:	e006      	b.n	8003770 <LL_TIM_OC_EnableFast+0x4c>
 8003762:	2303      	movs	r3, #3
 8003764:	e004      	b.n	8003770 <LL_TIM_OC_EnableFast+0x4c>
 8003766:	2302      	movs	r3, #2
 8003768:	e002      	b.n	8003770 <LL_TIM_OC_EnableFast+0x4c>
 800376a:	2301      	movs	r3, #1
 800376c:	e000      	b.n	8003770 <LL_TIM_OC_EnableFast+0x4c>
 800376e:	2300      	movs	r3, #0
 8003770:	461d      	mov	r5, r3
 8003772:	687b      	ldr	r3, [r7, #4]
 8003774:	3318      	adds	r3, #24
 8003776:	461a      	mov	r2, r3
 8003778:	4629      	mov	r1, r5
 800377a:	4b09      	ldr	r3, [pc, #36]	; (80037a0 <LL_TIM_OC_EnableFast+0x7c>)
 800377c:	5c5b      	ldrb	r3, [r3, r1]
 800377e:	4413      	add	r3, r2
 8003780:	461c      	mov	r4, r3
 8003782:	6822      	ldr	r2, [r4, #0]
 8003784:	4629      	mov	r1, r5
 8003786:	4b07      	ldr	r3, [pc, #28]	; (80037a4 <LL_TIM_OC_EnableFast+0x80>)
 8003788:	5c5b      	ldrb	r3, [r3, r1]
 800378a:	4619      	mov	r1, r3
 800378c:	2304      	movs	r3, #4
 800378e:	408b      	lsls	r3, r1
 8003790:	4313      	orrs	r3, r2
 8003792:	6023      	str	r3, [r4, #0]
 8003794:	bf00      	nop
 8003796:	370c      	adds	r7, #12
 8003798:	46bd      	mov	sp, r7
 800379a:	bcb0      	pop	{r4, r5, r7}
 800379c:	4770      	bx	lr
 800379e:	bf00      	nop
 80037a0:	0800b4fc 	.word	0x0800b4fc
 80037a4:	0800b504 	.word	0x0800b504

080037a8 <LL_TIM_OC_EnablePreload>:
 80037a8:	b4b0      	push	{r4, r5, r7}
 80037aa:	b083      	sub	sp, #12
 80037ac:	af00      	add	r7, sp, #0
 80037ae:	6078      	str	r0, [r7, #4]
 80037b0:	6039      	str	r1, [r7, #0]
 80037b2:	683b      	ldr	r3, [r7, #0]
 80037b4:	2b01      	cmp	r3, #1
 80037b6:	d01c      	beq.n	80037f2 <LL_TIM_OC_EnablePreload+0x4a>
 80037b8:	683b      	ldr	r3, [r7, #0]
 80037ba:	2b04      	cmp	r3, #4
 80037bc:	d017      	beq.n	80037ee <LL_TIM_OC_EnablePreload+0x46>
 80037be:	683b      	ldr	r3, [r7, #0]
 80037c0:	2b10      	cmp	r3, #16
 80037c2:	d012      	beq.n	80037ea <LL_TIM_OC_EnablePreload+0x42>
 80037c4:	683b      	ldr	r3, [r7, #0]
 80037c6:	2b40      	cmp	r3, #64	; 0x40
 80037c8:	d00d      	beq.n	80037e6 <LL_TIM_OC_EnablePreload+0x3e>
 80037ca:	683b      	ldr	r3, [r7, #0]
 80037cc:	f5b3 7f80 	cmp.w	r3, #256	; 0x100
 80037d0:	d007      	beq.n	80037e2 <LL_TIM_OC_EnablePreload+0x3a>
 80037d2:	683b      	ldr	r3, [r7, #0]
 80037d4:	f5b3 6f80 	cmp.w	r3, #1024	; 0x400
 80037d8:	d101      	bne.n	80037de <LL_TIM_OC_EnablePreload+0x36>
 80037da:	2305      	movs	r3, #5
 80037dc:	e00a      	b.n	80037f4 <LL_TIM_OC_EnablePreload+0x4c>
 80037de:	2306      	movs	r3, #6
 80037e0:	e008      	b.n	80037f4 <LL_TIM_OC_EnablePreload+0x4c>
 80037e2:	2304      	movs	r3, #4
 80037e4:	e006      	b.n	80037f4 <LL_TIM_OC_EnablePreload+0x4c>
 80037e6:	2303      	movs	r3, #3
 80037e8:	e004      	b.n	80037f4 <LL_TIM_OC_EnablePreload+0x4c>
 80037ea:	2302      	movs	r3, #2
 80037ec:	e002      	b.n	80037f4 <LL_TIM_OC_EnablePreload+0x4c>
 80037ee:	2301      	movs	r3, #1
 80037f0:	e000      	b.n	80037f4 <LL_TIM_OC_EnablePreload+0x4c>
 80037f2:	2300      	movs	r3, #0
 80037f4:	461d      	mov	r5, r3
 80037f6:	687b      	ldr	r3, [r7, #4]
 80037f8:	3318      	adds	r3, #24
 80037fa:	461a      	mov	r2, r3
 80037fc:	4629      	mov	r1, r5
 80037fe:	4b09      	ldr	r3, [pc, #36]	; (8003824 <LL_TIM_OC_EnablePreload+0x7c>)
 8003800:	5c5b      	ldrb	r3, [r3, r1]
 8003802:	4413      	add	r3, r2
 8003804:	461c      	mov	r4, r3
 8003806:	6822      	ldr	r2, [r4, #0]
 8003808:	4629      	mov	r1, r5
 800380a:	4b07      	ldr	r3, [pc, #28]	; (8003828 <LL_TIM_OC_EnablePreload+0x80>)
 800380c:	5c5b      	ldrb	r3, [r3, r1]
 800380e:	4619      	mov	r1, r3
 8003810:	2308      	movs	r3, #8
 8003812:	408b      	lsls	r3, r1
 8003814:	4313      	orrs	r3, r2
 8003816:	6023      	str	r3, [r4, #0]
 8003818:	bf00      	nop
 800381a:	370c      	adds	r7, #12
 800381c:	46bd      	mov	sp, r7
 800381e:	bcb0      	pop	{r4, r5, r7}
 8003820:	4770      	bx	lr
 8003822:	bf00      	nop
 8003824:	0800b4fc 	.word	0x0800b4fc
 8003828:	0800b504 	.word	0x0800b504

0800382c <LL_TIM_OC_SetCompareCH1>:
 800382c:	b480      	push	{r7}
 800382e:	b083      	sub	sp, #12
 8003830:	af00      	add	r7, sp, #0
 8003832:	6078      	str	r0, [r7, #4]
 8003834:	6039      	str	r1, [r7, #0]
 8003836:	687b      	ldr	r3, [r7, #4]
 8003838:	683a      	ldr	r2, [r7, #0]
 800383a:	635a      	str	r2, [r3, #52]	; 0x34
 800383c:	bf00      	nop
 800383e:	370c      	adds	r7, #12
 8003840:	46bd      	mov	sp, r7
 8003842:	f85d 7b04 	ldr.w	r7, [sp], #4
 8003846:	4770      	bx	lr

08003848 <LL_TIM_OC_SetCompareCH2>:
 8003848:	b480      	push	{r7}
 800384a:	b083      	sub	sp, #12
 800384c:	af00      	add	r7, sp, #0
 800384e:	6078      	str	r0, [r7, #4]
 8003850:	6039      	str	r1, [r7, #0]
 8003852:	687b      	ldr	r3, [r7, #4]
 8003854:	683a      	ldr	r2, [r7, #0]
 8003856:	639a      	str	r2, [r3, #56]	; 0x38
 8003858:	bf00      	nop
 800385a:	370c      	adds	r7, #12
 800385c:	46bd      	mov	sp, r7
 800385e:	f85d 7b04 	ldr.w	r7, [sp], #4
 8003862:	4770      	bx	lr

08003864 <LL_TIM_OC_SetCompareCH3>:
 8003864:	b480      	push	{r7}
 8003866:	b083      	sub	sp, #12
 8003868:	af00      	add	r7, sp, #0
 800386a:	6078      	str	r0, [r7, #4]
 800386c:	6039      	str	r1, [r7, #0]
 800386e:	687b      	ldr	r3, [r7, #4]
 8003870:	683a      	ldr	r2, [r7, #0]
 8003872:	63da      	str	r2, [r3, #60]	; 0x3c
 8003874:	bf00      	nop
 8003876:	370c      	adds	r7, #12
 8003878:	46bd      	mov	sp, r7
 800387a:	f85d 7b04 	ldr.w	r7, [sp], #4
 800387e:	4770      	bx	lr

08003880 <LL_TIM_ClearFlag_UPDATE>:
 8003880:	b480      	push	{r7}
 8003882:	b083      	sub	sp, #12
 8003884:	af00      	add	r7, sp, #0
 8003886:	6078      	str	r0, [r7, #4]
 8003888:	687b      	ldr	r3, [r7, #4]
 800388a:	f06f 0201 	mvn.w	r2, #1
 800388e:	611a      	str	r2, [r3, #16]
 8003890:	bf00      	nop
 8003892:	370c      	adds	r7, #12
 8003894:	46bd      	mov	sp, r7
 8003896:	f85d 7b04 	ldr.w	r7, [sp], #4
 800389a:	4770      	bx	lr

0800389c <LL_TIM_IsActiveFlag_UPDATE>:
 800389c:	b480      	push	{r7}
 800389e:	b083      	sub	sp, #12
 80038a0:	af00      	add	r7, sp, #0
 80038a2:	6078      	str	r0, [r7, #4]
 80038a4:	687b      	ldr	r3, [r7, #4]
 80038a6:	691b      	ldr	r3, [r3, #16]
 80038a8:	f003 0301 	and.w	r3, r3, #1
 80038ac:	2b01      	cmp	r3, #1
 80038ae:	bf0c      	ite	eq
 80038b0:	2301      	moveq	r3, #1
 80038b2:	2300      	movne	r3, #0
 80038b4:	b2db      	uxtb	r3, r3
 80038b6:	4618      	mov	r0, r3
 80038b8:	370c      	adds	r7, #12
 80038ba:	46bd      	mov	sp, r7
 80038bc:	f85d 7b04 	ldr.w	r7, [sp], #4
 80038c0:	4770      	bx	lr

080038c2 <LL_TIM_EnableIT_UPDATE>:
 80038c2:	b480      	push	{r7}
 80038c4:	b083      	sub	sp, #12
 80038c6:	af00      	add	r7, sp, #0
 80038c8:	6078      	str	r0, [r7, #4]
 80038ca:	687b      	ldr	r3, [r7, #4]
 80038cc:	68db      	ldr	r3, [r3, #12]
 80038ce:	f043 0201 	orr.w	r2, r3, #1
 80038d2:	687b      	ldr	r3, [r7, #4]
 80038d4:	60da      	str	r2, [r3, #12]
 80038d6:	bf00      	nop
 80038d8:	370c      	adds	r7, #12
 80038da:	46bd      	mov	sp, r7
 80038dc:	f85d 7b04 	ldr.w	r7, [sp], #4
 80038e0:	4770      	bx	lr

080038e2 <LL_TIM_GenerateEvent_UPDATE>:
 80038e2:	b480      	push	{r7}
 80038e4:	b083      	sub	sp, #12
 80038e6:	af00      	add	r7, sp, #0
 80038e8:	6078      	str	r0, [r7, #4]
 80038ea:	687b      	ldr	r3, [r7, #4]
 80038ec:	695b      	ldr	r3, [r3, #20]
 80038ee:	f043 0201 	orr.w	r2, r3, #1
 80038f2:	687b      	ldr	r3, [r7, #4]
 80038f4:	615a      	str	r2, [r3, #20]
 80038f6:	bf00      	nop
 80038f8:	370c      	adds	r7, #12
 80038fa:	46bd      	mov	sp, r7
 80038fc:	f85d 7b04 	ldr.w	r7, [sp], #4
 8003900:	4770      	bx	lr
	...

08003904 <LL_SYSCFG_SetEXTISource>:
 8003904:	b480      	push	{r7}
 8003906:	b085      	sub	sp, #20
 8003908:	af00      	add	r7, sp, #0
 800390a:	6078      	str	r0, [r7, #4]
 800390c:	6039      	str	r1, [r7, #0]
 800390e:	4a12      	ldr	r2, [pc, #72]	; (8003958 <LL_SYSCFG_SetEXTISource+0x54>)
 8003910:	683b      	ldr	r3, [r7, #0]
 8003912:	b2db      	uxtb	r3, r3
 8003914:	3302      	adds	r3, #2
 8003916:	f852 2023 	ldr.w	r2, [r2, r3, lsl #2]
 800391a:	683b      	ldr	r3, [r7, #0]
 800391c:	0c1b      	lsrs	r3, r3, #16
 800391e:	43db      	mvns	r3, r3
 8003920:	ea02 0103 	and.w	r1, r2, r3
 8003924:	683b      	ldr	r3, [r7, #0]
 8003926:	0c1b      	lsrs	r3, r3, #16
 8003928:	60fb      	str	r3, [r7, #12]
 800392a:	68fb      	ldr	r3, [r7, #12]
 800392c:	fa93 f3a3 	rbit	r3, r3
 8003930:	60bb      	str	r3, [r7, #8]
 8003932:	68bb      	ldr	r3, [r7, #8]
 8003934:	fab3 f383 	clz	r3, r3
 8003938:	687a      	ldr	r2, [r7, #4]
 800393a:	409a      	lsls	r2, r3
 800393c:	4806      	ldr	r0, [pc, #24]	; (8003958 <LL_SYSCFG_SetEXTISource+0x54>)
 800393e:	683b      	ldr	r3, [r7, #0]
 8003940:	b2db      	uxtb	r3, r3
 8003942:	430a      	orrs	r2, r1
 8003944:	3302      	adds	r3, #2
 8003946:	f840 2023 	str.w	r2, [r0, r3, lsl #2]
 800394a:	bf00      	nop
 800394c:	3714      	adds	r7, #20
 800394e:	46bd      	mov	sp, r7
 8003950:	f85d 7b04 	ldr.w	r7, [sp], #4
 8003954:	4770      	bx	lr
 8003956:	bf00      	nop
 8003958:	40013800 	.word	0x40013800

0800395c <LL_EXTI_EnableIT_0_31>:
 800395c:	b480      	push	{r7}
 800395e:	b083      	sub	sp, #12
 8003960:	af00      	add	r7, sp, #0
 8003962:	6078      	str	r0, [r7, #4]
 8003964:	4b05      	ldr	r3, [pc, #20]	; (800397c <LL_EXTI_EnableIT_0_31+0x20>)
 8003966:	681a      	ldr	r2, [r3, #0]
 8003968:	4904      	ldr	r1, [pc, #16]	; (800397c <LL_EXTI_EnableIT_0_31+0x20>)
 800396a:	687b      	ldr	r3, [r7, #4]
 800396c:	4313      	orrs	r3, r2
 800396e:	600b      	str	r3, [r1, #0]
 8003970:	bf00      	nop
 8003972:	370c      	adds	r7, #12
 8003974:	46bd      	mov	sp, r7
 8003976:	f85d 7b04 	ldr.w	r7, [sp], #4
 800397a:	4770      	bx	lr
 800397c:	40013c00 	.word	0x40013c00

08003980 <LL_EXTI_EnableFallingTrig_0_31>:
 8003980:	b480      	push	{r7}
 8003982:	b083      	sub	sp, #12
 8003984:	af00      	add	r7, sp, #0
 8003986:	6078      	str	r0, [r7, #4]
 8003988:	4b05      	ldr	r3, [pc, #20]	; (80039a0 <LL_EXTI_EnableFallingTrig_0_31+0x20>)
 800398a:	68da      	ldr	r2, [r3, #12]
 800398c:	4904      	ldr	r1, [pc, #16]	; (80039a0 <LL_EXTI_EnableFallingTrig_0_31+0x20>)
 800398e:	687b      	ldr	r3, [r7, #4]
 8003990:	4313      	orrs	r3, r2
 8003992:	60cb      	str	r3, [r1, #12]
 8003994:	bf00      	nop
 8003996:	370c      	adds	r7, #12
 8003998:	46bd      	mov	sp, r7
 800399a:	f85d 7b04 	ldr.w	r7, [sp], #4
 800399e:	4770      	bx	lr
 80039a0:	40013c00 	.word	0x40013c00

080039a4 <LL_EXTI_ClearFlag_0_31>:
 80039a4:	b480      	push	{r7}
 80039a6:	b083      	sub	sp, #12
 80039a8:	af00      	add	r7, sp, #0
 80039aa:	6078      	str	r0, [r7, #4]
 80039ac:	4a04      	ldr	r2, [pc, #16]	; (80039c0 <LL_EXTI_ClearFlag_0_31+0x1c>)
 80039ae:	687b      	ldr	r3, [r7, #4]
 80039b0:	6153      	str	r3, [r2, #20]
 80039b2:	bf00      	nop
 80039b4:	370c      	adds	r7, #12
 80039b6:	46bd      	mov	sp, r7
 80039b8:	f85d 7b04 	ldr.w	r7, [sp], #4
 80039bc:	4770      	bx	lr
 80039be:	bf00      	nop
 80039c0:	40013c00 	.word	0x40013c00

080039c4 <LL_GPIO_SetPinMode>:
 80039c4:	b480      	push	{r7}
 80039c6:	b089      	sub	sp, #36	; 0x24
 80039c8:	af00      	add	r7, sp, #0
 80039ca:	60f8      	str	r0, [r7, #12]
 80039cc:	60b9      	str	r1, [r7, #8]
 80039ce:	607a      	str	r2, [r7, #4]
 80039d0:	68fb      	ldr	r3, [r7, #12]
 80039d2:	681a      	ldr	r2, [r3, #0]
 80039d4:	68bb      	ldr	r3, [r7, #8]
 80039d6:	617b      	str	r3, [r7, #20]
 80039d8:	697b      	ldr	r3, [r7, #20]
 80039da:	fa93 f3a3 	rbit	r3, r3
 80039de:	613b      	str	r3, [r7, #16]
 80039e0:	693b      	ldr	r3, [r7, #16]
 80039e2:	fab3 f383 	clz	r3, r3
 80039e6:	005b      	lsls	r3, r3, #1
 80039e8:	2103      	movs	r1, #3
 80039ea:	fa01 f303 	lsl.w	r3, r1, r3
 80039ee:	43db      	mvns	r3, r3
 80039f0:	401a      	ands	r2, r3
 80039f2:	68bb      	ldr	r3, [r7, #8]
 80039f4:	61fb      	str	r3, [r7, #28]
 80039f6:	69fb      	ldr	r3, [r7, #28]
 80039f8:	fa93 f3a3 	rbit	r3, r3
 80039fc:	61bb      	str	r3, [r7, #24]
 80039fe:	69bb      	ldr	r3, [r7, #24]
 8003a00:	fab3 f383 	clz	r3, r3
 8003a04:	005b      	lsls	r3, r3, #1
 8003a06:	6879      	ldr	r1, [r7, #4]
 8003a08:	fa01 f303 	lsl.w	r3, r1, r3
 8003a0c:	431a      	orrs	r2, r3
 8003a0e:	68fb      	ldr	r3, [r7, #12]
 8003a10:	601a      	str	r2, [r3, #0]
 8003a12:	bf00      	nop
 8003a14:	3724      	adds	r7, #36	; 0x24
 8003a16:	46bd      	mov	sp, r7
 8003a18:	f85d 7b04 	ldr.w	r7, [sp], #4
 8003a1c:	4770      	bx	lr

08003a1e <LL_GPIO_SetPinOutputType>:
 8003a1e:	b480      	push	{r7}
 8003a20:	b085      	sub	sp, #20
 8003a22:	af00      	add	r7, sp, #0
 8003a24:	60f8      	str	r0, [r7, #12]
 8003a26:	60b9      	str	r1, [r7, #8]
 8003a28:	607a      	str	r2, [r7, #4]
 8003a2a:	68fb      	ldr	r3, [r7, #12]
 8003a2c:	685a      	ldr	r2, [r3, #4]
 8003a2e:	68bb      	ldr	r3, [r7, #8]
 8003a30:	43db      	mvns	r3, r3
 8003a32:	401a      	ands	r2, r3
 8003a34:	68bb      	ldr	r3, [r7, #8]
 8003a36:	6879      	ldr	r1, [r7, #4]
 8003a38:	fb01 f303 	mul.w	r3, r1, r3
 8003a3c:	431a      	orrs	r2, r3
 8003a3e:	68fb      	ldr	r3, [r7, #12]
 8003a40:	605a      	str	r2, [r3, #4]
 8003a42:	bf00      	nop
 8003a44:	3714      	adds	r7, #20
 8003a46:	46bd      	mov	sp, r7
 8003a48:	f85d 7b04 	ldr.w	r7, [sp], #4
 8003a4c:	4770      	bx	lr

08003a4e <LL_GPIO_SetPinPull>:
 8003a4e:	b480      	push	{r7}
 8003a50:	b089      	sub	sp, #36	; 0x24
 8003a52:	af00      	add	r7, sp, #0
 8003a54:	60f8      	str	r0, [r7, #12]
 8003a56:	60b9      	str	r1, [r7, #8]
 8003a58:	607a      	str	r2, [r7, #4]
 8003a5a:	68fb      	ldr	r3, [r7, #12]
 8003a5c:	68da      	ldr	r2, [r3, #12]
 8003a5e:	68bb      	ldr	r3, [r7, #8]
 8003a60:	617b      	str	r3, [r7, #20]
 8003a62:	697b      	ldr	r3, [r7, #20]
 8003a64:	fa93 f3a3 	rbit	r3, r3
 8003a68:	613b      	str	r3, [r7, #16]
 8003a6a:	693b      	ldr	r3, [r7, #16]
 8003a6c:	fab3 f383 	clz	r3, r3
 8003a70:	005b      	lsls	r3, r3, #1
 8003a72:	2103      	movs	r1, #3
 8003a74:	fa01 f303 	lsl.w	r3, r1, r3
 8003a78:	43db      	mvns	r3, r3
 8003a7a:	401a      	ands	r2, r3
 8003a7c:	68bb      	ldr	r3, [r7, #8]
 8003a7e:	61fb      	str	r3, [r7, #28]
 8003a80:	69fb      	ldr	r3, [r7, #28]
 8003a82:	fa93 f3a3 	rbit	r3, r3
 8003a86:	61bb      	str	r3, [r7, #24]
 8003a88:	69bb      	ldr	r3, [r7, #24]
 8003a8a:	fab3 f383 	clz	r3, r3
 8003a8e:	005b      	lsls	r3, r3, #1
 8003a90:	6879      	ldr	r1, [r7, #4]
 8003a92:	fa01 f303 	lsl.w	r3, r1, r3
 8003a96:	431a      	orrs	r2, r3
 8003a98:	68fb      	ldr	r3, [r7, #12]
 8003a9a:	60da      	str	r2, [r3, #12]
 8003a9c:	bf00      	nop
 8003a9e:	3724      	adds	r7, #36	; 0x24
 8003aa0:	46bd      	mov	sp, r7
 8003aa2:	f85d 7b04 	ldr.w	r7, [sp], #4
 8003aa6:	4770      	bx	lr

08003aa8 <LL_GPIO_SetAFPin_8_15>:
 8003aa8:	b480      	push	{r7}
 8003aaa:	b089      	sub	sp, #36	; 0x24
 8003aac:	af00      	add	r7, sp, #0
 8003aae:	60f8      	str	r0, [r7, #12]
 8003ab0:	60b9      	str	r1, [r7, #8]
 8003ab2:	607a      	str	r2, [r7, #4]
 8003ab4:	68fb      	ldr	r3, [r7, #12]
 8003ab6:	6a5a      	ldr	r2, [r3, #36]	; 0x24
 8003ab8:	68bb      	ldr	r3, [r7, #8]
 8003aba:	0a1b      	lsrs	r3, r3, #8
 8003abc:	617b      	str	r3, [r7, #20]
 8003abe:	697b      	ldr	r3, [r7, #20]
 8003ac0:	fa93 f3a3 	rbit	r3, r3
 8003ac4:	613b      	str	r3, [r7, #16]
 8003ac6:	693b      	ldr	r3, [r7, #16]
 8003ac8:	fab3 f383 	clz	r3, r3
 8003acc:	009b      	lsls	r3, r3, #2
 8003ace:	210f      	movs	r1, #15
 8003ad0:	fa01 f303 	lsl.w	r3, r1, r3
 8003ad4:	43db      	mvns	r3, r3
 8003ad6:	401a      	ands	r2, r3
 8003ad8:	68bb      	ldr	r3, [r7, #8]
 8003ada:	0a1b      	lsrs	r3, r3, #8
 8003adc:	61fb      	str	r3, [r7, #28]
 8003ade:	69fb      	ldr	r3, [r7, #28]
 8003ae0:	fa93 f3a3 	rbit	r3, r3
 8003ae4:	61bb      	str	r3, [r7, #24]
 8003ae6:	69bb      	ldr	r3, [r7, #24]
 8003ae8:	fab3 f383 	clz	r3, r3
 8003aec:	009b      	lsls	r3, r3, #2
 8003aee:	6879      	ldr	r1, [r7, #4]
 8003af0:	fa01 f303 	lsl.w	r3, r1, r3
 8003af4:	431a      	orrs	r2, r3
 8003af6:	68fb      	ldr	r3, [r7, #12]
 8003af8:	625a      	str	r2, [r3, #36]	; 0x24
 8003afa:	bf00      	nop
 8003afc:	3724      	adds	r7, #36	; 0x24
 8003afe:	46bd      	mov	sp, r7
 8003b00:	f85d 7b04 	ldr.w	r7, [sp], #4
 8003b04:	4770      	bx	lr

08003b06 <LL_GPIO_IsInputPinSet>:
 8003b06:	b480      	push	{r7}
 8003b08:	b083      	sub	sp, #12
 8003b0a:	af00      	add	r7, sp, #0
 8003b0c:	6078      	str	r0, [r7, #4]
 8003b0e:	6039      	str	r1, [r7, #0]
 8003b10:	687b      	ldr	r3, [r7, #4]
 8003b12:	691a      	ldr	r2, [r3, #16]
 8003b14:	683b      	ldr	r3, [r7, #0]
 8003b16:	4013      	ands	r3, r2
 8003b18:	683a      	ldr	r2, [r7, #0]
 8003b1a:	429a      	cmp	r2, r3
 8003b1c:	bf0c      	ite	eq
 8003b1e:	2301      	moveq	r3, #1
 8003b20:	2300      	movne	r3, #0
 8003b22:	b2db      	uxtb	r3, r3
 8003b24:	4618      	mov	r0, r3
 8003b26:	370c      	adds	r7, #12
 8003b28:	46bd      	mov	sp, r7
 8003b2a:	f85d 7b04 	ldr.w	r7, [sp], #4
 8003b2e:	4770      	bx	lr

08003b30 <LL_GPIO_SetOutputPin>:
 8003b30:	b480      	push	{r7}
 8003b32:	b083      	sub	sp, #12
 8003b34:	af00      	add	r7, sp, #0
 8003b36:	6078      	str	r0, [r7, #4]
 8003b38:	6039      	str	r1, [r7, #0]
 8003b3a:	687b      	ldr	r3, [r7, #4]
 8003b3c:	683a      	ldr	r2, [r7, #0]
 8003b3e:	619a      	str	r2, [r3, #24]
 8003b40:	bf00      	nop
 8003b42:	370c      	adds	r7, #12
 8003b44:	46bd      	mov	sp, r7
 8003b46:	f85d 7b04 	ldr.w	r7, [sp], #4
 8003b4a:	4770      	bx	lr

08003b4c <LL_GPIO_ResetOutputPin>:
 8003b4c:	b480      	push	{r7}
 8003b4e:	b083      	sub	sp, #12
 8003b50:	af00      	add	r7, sp, #0
 8003b52:	6078      	str	r0, [r7, #4]
 8003b54:	6039      	str	r1, [r7, #0]
 8003b56:	683b      	ldr	r3, [r7, #0]
 8003b58:	041a      	lsls	r2, r3, #16
 8003b5a:	687b      	ldr	r3, [r7, #4]
 8003b5c:	619a      	str	r2, [r3, #24]
 8003b5e:	bf00      	nop
 8003b60:	370c      	adds	r7, #12
 8003b62:	46bd      	mov	sp, r7
 8003b64:	f85d 7b04 	ldr.w	r7, [sp], #4
 8003b68:	4770      	bx	lr
	...

08003b6c <mk_speed2pwm>:
 8003b6c:	b580      	push	{r7, lr}
 8003b6e:	b086      	sub	sp, #24
 8003b70:	af00      	add	r7, sp, #0
 8003b72:	6078      	str	r0, [r7, #4]
 8003b74:	687b      	ldr	r3, [r7, #4]
 8003b76:	68db      	ldr	r3, [r3, #12]
 8003b78:	4a5a      	ldr	r2, [pc, #360]	; (8003ce4 <mk_speed2pwm+0x178>)
 8003b7a:	6013      	str	r3, [r2, #0]
 8003b7c:	687b      	ldr	r3, [r7, #4]
 8003b7e:	691b      	ldr	r3, [r3, #16]
 8003b80:	4a58      	ldr	r2, [pc, #352]	; (8003ce4 <mk_speed2pwm+0x178>)
 8003b82:	6053      	str	r3, [r2, #4]
 8003b84:	687b      	ldr	r3, [r7, #4]
 8003b86:	695b      	ldr	r3, [r3, #20]
 8003b88:	4a56      	ldr	r2, [pc, #344]	; (8003ce4 <mk_speed2pwm+0x178>)
 8003b8a:	6093      	str	r3, [r2, #8]
 8003b8c:	4a56      	ldr	r2, [pc, #344]	; (8003ce8 <mk_speed2pwm+0x17c>)
 8003b8e:	f107 0308 	add.w	r3, r7, #8
 8003b92:	ca07      	ldmia	r2, {r0, r1, r2}
 8003b94:	e883 0007 	stmia.w	r3, {r0, r1, r2}
 8003b98:	2300      	movs	r3, #0
 8003b9a:	617b      	str	r3, [r7, #20]
 8003b9c:	4b53      	ldr	r3, [pc, #332]	; (8003cec <mk_speed2pwm+0x180>)
 8003b9e:	2203      	movs	r2, #3
 8003ba0:	2103      	movs	r1, #3
 8003ba2:	4853      	ldr	r0, [pc, #332]	; (8003cf0 <mk_speed2pwm+0x184>)
 8003ba4:	f004 feb1 	bl	800890a <arm_mat_init_f32>
 8003ba8:	4b52      	ldr	r3, [pc, #328]	; (8003cf4 <mk_speed2pwm+0x188>)
 8003baa:	2203      	movs	r2, #3
 8003bac:	2103      	movs	r1, #3
 8003bae:	4852      	ldr	r0, [pc, #328]	; (8003cf8 <mk_speed2pwm+0x18c>)
 8003bb0:	f004 feab 	bl	800890a <arm_mat_init_f32>
 8003bb4:	4b51      	ldr	r3, [pc, #324]	; (8003cfc <mk_speed2pwm+0x190>)
 8003bb6:	2201      	movs	r2, #1
 8003bb8:	2103      	movs	r1, #3
 8003bba:	4851      	ldr	r0, [pc, #324]	; (8003d00 <mk_speed2pwm+0x194>)
 8003bbc:	f004 fea5 	bl	800890a <arm_mat_init_f32>
 8003bc0:	4b50      	ldr	r3, [pc, #320]	; (8003d04 <mk_speed2pwm+0x198>)
 8003bc2:	2201      	movs	r2, #1
 8003bc4:	2103      	movs	r1, #3
 8003bc6:	4850      	ldr	r0, [pc, #320]	; (8003d08 <mk_speed2pwm+0x19c>)
 8003bc8:	f004 fe9f 	bl	800890a <arm_mat_init_f32>
 8003bcc:	4b4f      	ldr	r3, [pc, #316]	; (8003d0c <mk_speed2pwm+0x1a0>)
 8003bce:	2201      	movs	r2, #1
 8003bd0:	2103      	movs	r1, #3
 8003bd2:	484f      	ldr	r0, [pc, #316]	; (8003d10 <mk_speed2pwm+0x1a4>)
 8003bd4:	f004 fe99 	bl	800890a <arm_mat_init_f32>
 8003bd8:	4b42      	ldr	r3, [pc, #264]	; (8003ce4 <mk_speed2pwm+0x178>)
 8003bda:	2201      	movs	r2, #1
 8003bdc:	2103      	movs	r1, #3
 8003bde:	484d      	ldr	r0, [pc, #308]	; (8003d14 <mk_speed2pwm+0x1a8>)
 8003be0:	f004 fe93 	bl	800890a <arm_mat_init_f32>
 8003be4:	4a46      	ldr	r2, [pc, #280]	; (8003d00 <mk_speed2pwm+0x194>)
 8003be6:	494b      	ldr	r1, [pc, #300]	; (8003d14 <mk_speed2pwm+0x1a8>)
 8003be8:	4841      	ldr	r0, [pc, #260]	; (8003cf0 <mk_speed2pwm+0x184>)
 8003bea:	f004 fc0d 	bl	8008408 <arm_mat_mult_f32>
 8003bee:	4a46      	ldr	r2, [pc, #280]	; (8003d08 <mk_speed2pwm+0x19c>)
 8003bf0:	4948      	ldr	r1, [pc, #288]	; (8003d14 <mk_speed2pwm+0x1a8>)
 8003bf2:	4841      	ldr	r0, [pc, #260]	; (8003cf8 <mk_speed2pwm+0x18c>)
 8003bf4:	f004 fc08 	bl	8008408 <arm_mat_mult_f32>
 8003bf8:	4a45      	ldr	r2, [pc, #276]	; (8003d10 <mk_speed2pwm+0x1a4>)
 8003bfa:	4943      	ldr	r1, [pc, #268]	; (8003d08 <mk_speed2pwm+0x19c>)
 8003bfc:	4840      	ldr	r0, [pc, #256]	; (8003d00 <mk_speed2pwm+0x194>)
 8003bfe:	f004 fe9c 	bl	800893a <arm_mat_add_f32>
 8003c02:	2300      	movs	r3, #0
 8003c04:	4a44      	ldr	r2, [pc, #272]	; (8003d18 <mk_speed2pwm+0x1ac>)
 8003c06:	2103      	movs	r1, #3
 8003c08:	4840      	ldr	r0, [pc, #256]	; (8003d0c <mk_speed2pwm+0x1a0>)
 8003c0a:	f004 fb64 	bl	80082d6 <arm_max_f32>
 8003c0e:	2300      	movs	r3, #0
 8003c10:	4a42      	ldr	r2, [pc, #264]	; (8003d1c <mk_speed2pwm+0x1b0>)
 8003c12:	2103      	movs	r1, #3
 8003c14:	483d      	ldr	r0, [pc, #244]	; (8003d0c <mk_speed2pwm+0x1a0>)
 8003c16:	f004 fddf 	bl	80087d8 <arm_min_f32>
 8003c1a:	4b40      	ldr	r3, [pc, #256]	; (8003d1c <mk_speed2pwm+0x1b0>)
 8003c1c:	edd3 7a00 	vldr	s15, [r3]
 8003c20:	eeb0 7ae7 	vabs.f32	s14, s15
 8003c24:	4b3c      	ldr	r3, [pc, #240]	; (8003d18 <mk_speed2pwm+0x1ac>)
 8003c26:	edd3 7a00 	vldr	s15, [r3]
 8003c2a:	eeb4 7ae7 	vcmpe.f32	s14, s15
 8003c2e:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8003c32:	dd07      	ble.n	8003c44 <mk_speed2pwm+0xd8>
 8003c34:	4b39      	ldr	r3, [pc, #228]	; (8003d1c <mk_speed2pwm+0x1b0>)
 8003c36:	edd3 7a00 	vldr	s15, [r3]
 8003c3a:	eef1 7a67 	vneg.f32	s15, s15
 8003c3e:	4b36      	ldr	r3, [pc, #216]	; (8003d18 <mk_speed2pwm+0x1ac>)
 8003c40:	edc3 7a00 	vstr	s15, [r3]
 8003c44:	4b34      	ldr	r3, [pc, #208]	; (8003d18 <mk_speed2pwm+0x1ac>)
 8003c46:	edd3 7a00 	vldr	s15, [r3]
 8003c4a:	ed9f 7a35 	vldr	s14, [pc, #212]	; 8003d20 <mk_speed2pwm+0x1b4>
 8003c4e:	eef4 7ac7 	vcmpe.f32	s15, s14
 8003c52:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8003c56:	dd0c      	ble.n	8003c72 <mk_speed2pwm+0x106>
 8003c58:	4b2f      	ldr	r3, [pc, #188]	; (8003d18 <mk_speed2pwm+0x1ac>)
 8003c5a:	edd3 7a00 	vldr	s15, [r3]
 8003c5e:	ed9f 7a30 	vldr	s14, [pc, #192]	; 8003d20 <mk_speed2pwm+0x1b4>
 8003c62:	eec7 6a27 	vdiv.f32	s13, s14, s15
 8003c66:	492a      	ldr	r1, [pc, #168]	; (8003d10 <mk_speed2pwm+0x1a4>)
 8003c68:	eeb0 0a66 	vmov.f32	s0, s13
 8003c6c:	4828      	ldr	r0, [pc, #160]	; (8003d10 <mk_speed2pwm+0x1a4>)
 8003c6e:	f004 fcb4 	bl	80085da <arm_mat_scale_f32>
 8003c72:	2303      	movs	r3, #3
 8003c74:	4a25      	ldr	r2, [pc, #148]	; (8003d0c <mk_speed2pwm+0x1a0>)
 8003c76:	492b      	ldr	r1, [pc, #172]	; (8003d24 <mk_speed2pwm+0x1b8>)
 8003c78:	4824      	ldr	r0, [pc, #144]	; (8003d0c <mk_speed2pwm+0x1a0>)
 8003c7a:	f004 faa9 	bl	80081d0 <arm_mult_f32>
 8003c7e:	2300      	movs	r3, #0
 8003c80:	617b      	str	r3, [r7, #20]
 8003c82:	e01f      	b.n	8003cc4 <mk_speed2pwm+0x158>
 8003c84:	4a21      	ldr	r2, [pc, #132]	; (8003d0c <mk_speed2pwm+0x1a0>)
 8003c86:	697b      	ldr	r3, [r7, #20]
 8003c88:	009b      	lsls	r3, r3, #2
 8003c8a:	4413      	add	r3, r2
 8003c8c:	edd3 7a00 	vldr	s15, [r3]
 8003c90:	eef5 7ac0 	vcmpe.f32	s15, #0.0
 8003c94:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8003c98:	d511      	bpl.n	8003cbe <mk_speed2pwm+0x152>
 8003c9a:	697b      	ldr	r3, [r7, #20]
 8003c9c:	009b      	lsls	r3, r3, #2
 8003c9e:	f107 0218 	add.w	r2, r7, #24
 8003ca2:	4413      	add	r3, r2
 8003ca4:	3b10      	subs	r3, #16
 8003ca6:	edd3 7a00 	vldr	s15, [r3]
 8003caa:	eef1 7a67 	vneg.f32	s15, s15
 8003cae:	697b      	ldr	r3, [r7, #20]
 8003cb0:	009b      	lsls	r3, r3, #2
 8003cb2:	f107 0218 	add.w	r2, r7, #24
 8003cb6:	4413      	add	r3, r2
 8003cb8:	3b10      	subs	r3, #16
 8003cba:	edc3 7a00 	vstr	s15, [r3]
 8003cbe:	697b      	ldr	r3, [r7, #20]
 8003cc0:	3301      	adds	r3, #1
 8003cc2:	617b      	str	r3, [r7, #20]
 8003cc4:	697b      	ldr	r3, [r7, #20]
 8003cc6:	2b02      	cmp	r3, #2
 8003cc8:	dddc      	ble.n	8003c84 <mk_speed2pwm+0x118>
 8003cca:	687b      	ldr	r3, [r7, #4]
 8003ccc:	f103 0220 	add.w	r2, r3, #32
 8003cd0:	f107 0108 	add.w	r1, r7, #8
 8003cd4:	2303      	movs	r3, #3
 8003cd6:	480d      	ldr	r0, [pc, #52]	; (8003d0c <mk_speed2pwm+0x1a0>)
 8003cd8:	f004 fd03 	bl	80086e2 <arm_add_f32>
 8003cdc:	bf00      	nop
 8003cde:	3718      	adds	r7, #24
 8003ce0:	46bd      	mov	sp, r7
 8003ce2:	bd80      	pop	{r7, pc}
 8003ce4:	20000b0c 	.word	0x20000b0c
 8003ce8:	0800b2b4 	.word	0x0800b2b4
 8003cec:	20000000 	.word	0x20000000
 8003cf0:	20000b18 	.word	0x20000b18
 8003cf4:	20000024 	.word	0x20000024
 8003cf8:	20000b20 	.word	0x20000b20
 8003cfc:	20000b30 	.word	0x20000b30
 8003d00:	20000b28 	.word	0x20000b28
 8003d04:	20000b44 	.word	0x20000b44
 8003d08:	20000b3c 	.word	0x20000b3c
 8003d0c:	20000b58 	.word	0x20000b58
 8003d10:	20000b50 	.word	0x20000b50
 8003d14:	20000b64 	.word	0x20000b64
 8003d18:	20000b6c 	.word	0x20000b6c
 8003d1c:	20000b70 	.word	0x20000b70
 8003d20:	41b384ea 	.word	0x41b384ea
 8003d24:	20000048 	.word	0x20000048

08003d28 <mk_set_pwm>:
 8003d28:	b580      	push	{r7, lr}
 8003d2a:	b082      	sub	sp, #8
 8003d2c:	af00      	add	r7, sp, #0
 8003d2e:	6078      	str	r0, [r7, #4]
 8003d30:	687b      	ldr	r3, [r7, #4]
 8003d32:	edd3 7a00 	vldr	s15, [r3]
 8003d36:	eef5 7ac0 	vcmpe.f32	s15, #0.0
 8003d3a:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8003d3e:	dd04      	ble.n	8003d4a <mk_set_pwm+0x22>
 8003d40:	2110      	movs	r1, #16
 8003d42:	4832      	ldr	r0, [pc, #200]	; (8003e0c <mk_set_pwm+0xe4>)
 8003d44:	f7ff fef4 	bl	8003b30 <LL_GPIO_SetOutputPin>
 8003d48:	e003      	b.n	8003d52 <mk_set_pwm+0x2a>
 8003d4a:	2110      	movs	r1, #16
 8003d4c:	482f      	ldr	r0, [pc, #188]	; (8003e0c <mk_set_pwm+0xe4>)
 8003d4e:	f7ff fefd 	bl	8003b4c <LL_GPIO_ResetOutputPin>
 8003d52:	687b      	ldr	r3, [r7, #4]
 8003d54:	edd3 7a00 	vldr	s15, [r3]
 8003d58:	eef0 7ae7 	vabs.f32	s15, s15
 8003d5c:	ed9f 7a2c 	vldr	s14, [pc, #176]	; 8003e10 <mk_set_pwm+0xe8>
 8003d60:	ee67 7a87 	vmul.f32	s15, s15, s14
 8003d64:	eefc 7ae7 	vcvt.u32.f32	s15, s15
 8003d68:	ee17 1a90 	vmov	r1, s15
 8003d6c:	4829      	ldr	r0, [pc, #164]	; (8003e14 <mk_set_pwm+0xec>)
 8003d6e:	f7ff fd5d 	bl	800382c <LL_TIM_OC_SetCompareCH1>
 8003d72:	687b      	ldr	r3, [r7, #4]
 8003d74:	3304      	adds	r3, #4
 8003d76:	edd3 7a00 	vldr	s15, [r3]
 8003d7a:	eef5 7ac0 	vcmpe.f32	s15, #0.0
 8003d7e:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8003d82:	dd04      	ble.n	8003d8e <mk_set_pwm+0x66>
 8003d84:	2120      	movs	r1, #32
 8003d86:	4821      	ldr	r0, [pc, #132]	; (8003e0c <mk_set_pwm+0xe4>)
 8003d88:	f7ff fed2 	bl	8003b30 <LL_GPIO_SetOutputPin>
 8003d8c:	e003      	b.n	8003d96 <mk_set_pwm+0x6e>
 8003d8e:	2120      	movs	r1, #32
 8003d90:	481e      	ldr	r0, [pc, #120]	; (8003e0c <mk_set_pwm+0xe4>)
 8003d92:	f7ff fedb 	bl	8003b4c <LL_GPIO_ResetOutputPin>
 8003d96:	687b      	ldr	r3, [r7, #4]
 8003d98:	3304      	adds	r3, #4
 8003d9a:	edd3 7a00 	vldr	s15, [r3]
 8003d9e:	eef0 7ae7 	vabs.f32	s15, s15
 8003da2:	ed9f 7a1b 	vldr	s14, [pc, #108]	; 8003e10 <mk_set_pwm+0xe8>
 8003da6:	ee67 7a87 	vmul.f32	s15, s15, s14
 8003daa:	eefc 7ae7 	vcvt.u32.f32	s15, s15
 8003dae:	ee17 1a90 	vmov	r1, s15
 8003db2:	4818      	ldr	r0, [pc, #96]	; (8003e14 <mk_set_pwm+0xec>)
 8003db4:	f7ff fd48 	bl	8003848 <LL_TIM_OC_SetCompareCH2>
 8003db8:	687b      	ldr	r3, [r7, #4]
 8003dba:	3308      	adds	r3, #8
 8003dbc:	edd3 7a00 	vldr	s15, [r3]
 8003dc0:	eef5 7ac0 	vcmpe.f32	s15, #0.0
 8003dc4:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8003dc8:	dd05      	ble.n	8003dd6 <mk_set_pwm+0xae>
 8003dca:	f44f 6180 	mov.w	r1, #1024	; 0x400
 8003dce:	480f      	ldr	r0, [pc, #60]	; (8003e0c <mk_set_pwm+0xe4>)
 8003dd0:	f7ff feae 	bl	8003b30 <LL_GPIO_SetOutputPin>
 8003dd4:	e004      	b.n	8003de0 <mk_set_pwm+0xb8>
 8003dd6:	f44f 6180 	mov.w	r1, #1024	; 0x400
 8003dda:	480c      	ldr	r0, [pc, #48]	; (8003e0c <mk_set_pwm+0xe4>)
 8003ddc:	f7ff feb6 	bl	8003b4c <LL_GPIO_ResetOutputPin>
 8003de0:	687b      	ldr	r3, [r7, #4]
 8003de2:	3308      	adds	r3, #8
 8003de4:	edd3 7a00 	vldr	s15, [r3]
 8003de8:	eef0 7ae7 	vabs.f32	s15, s15
 8003dec:	ed9f 7a08 	vldr	s14, [pc, #32]	; 8003e10 <mk_set_pwm+0xe8>
 8003df0:	ee67 7a87 	vmul.f32	s15, s15, s14
 8003df4:	eefc 7ae7 	vcvt.u32.f32	s15, s15
 8003df8:	ee17 1a90 	vmov	r1, s15
 8003dfc:	4805      	ldr	r0, [pc, #20]	; (8003e14 <mk_set_pwm+0xec>)
 8003dfe:	f7ff fd31 	bl	8003864 <LL_TIM_OC_SetCompareCH3>
 8003e02:	bf00      	nop
 8003e04:	3708      	adds	r7, #8
 8003e06:	46bd      	mov	sp, r7
 8003e08:	bd80      	pop	{r7, pc}
 8003e0a:	bf00      	nop
 8003e0c:	40020000 	.word	0x40020000
 8003e10:	47241000 	.word	0x47241000
 8003e14:	40000800 	.word	0x40000800

08003e18 <mk_hw_config>:
 8003e18:	b580      	push	{r7, lr}
 8003e1a:	af00      	add	r7, sp, #0
 8003e1c:	2008      	movs	r0, #8
 8003e1e:	f7ff fb45 	bl	80034ac <LL_AHB1_GRP1_EnableClock>
 8003e22:	2001      	movs	r0, #1
 8003e24:	f7ff fb42 	bl	80034ac <LL_AHB1_GRP1_EnableClock>
 8003e28:	2010      	movs	r0, #16
 8003e2a:	f7ff fb3f 	bl	80034ac <LL_AHB1_GRP1_EnableClock>
 8003e2e:	2004      	movs	r0, #4
 8003e30:	f7ff fb54 	bl	80034dc <LL_APB1_GRP1_EnableClock>
 8003e34:	2201      	movs	r2, #1
 8003e36:	2110      	movs	r1, #16
 8003e38:	4889      	ldr	r0, [pc, #548]	; (8004060 <mk_hw_config+0x248>)
 8003e3a:	f7ff fdc3 	bl	80039c4 <LL_GPIO_SetPinMode>
 8003e3e:	2200      	movs	r2, #0
 8003e40:	2110      	movs	r1, #16
 8003e42:	4887      	ldr	r0, [pc, #540]	; (8004060 <mk_hw_config+0x248>)
 8003e44:	f7ff fdeb 	bl	8003a1e <LL_GPIO_SetPinOutputType>
 8003e48:	2200      	movs	r2, #0
 8003e4a:	2110      	movs	r1, #16
 8003e4c:	4884      	ldr	r0, [pc, #528]	; (8004060 <mk_hw_config+0x248>)
 8003e4e:	f7ff fdfe 	bl	8003a4e <LL_GPIO_SetPinPull>
 8003e52:	2201      	movs	r2, #1
 8003e54:	2120      	movs	r1, #32
 8003e56:	4882      	ldr	r0, [pc, #520]	; (8004060 <mk_hw_config+0x248>)
 8003e58:	f7ff fdb4 	bl	80039c4 <LL_GPIO_SetPinMode>
 8003e5c:	2200      	movs	r2, #0
 8003e5e:	2120      	movs	r1, #32
 8003e60:	487f      	ldr	r0, [pc, #508]	; (8004060 <mk_hw_config+0x248>)
 8003e62:	f7ff fddc 	bl	8003a1e <LL_GPIO_SetPinOutputType>
 8003e66:	2200      	movs	r2, #0
 8003e68:	2120      	movs	r1, #32
 8003e6a:	487d      	ldr	r0, [pc, #500]	; (8004060 <mk_hw_config+0x248>)
 8003e6c:	f7ff fdef 	bl	8003a4e <LL_GPIO_SetPinPull>
 8003e70:	2201      	movs	r2, #1
 8003e72:	f44f 6180 	mov.w	r1, #1024	; 0x400
 8003e76:	487a      	ldr	r0, [pc, #488]	; (8004060 <mk_hw_config+0x248>)
 8003e78:	f7ff fda4 	bl	80039c4 <LL_GPIO_SetPinMode>
 8003e7c:	2200      	movs	r2, #0
 8003e7e:	f44f 6180 	mov.w	r1, #1024	; 0x400
 8003e82:	4877      	ldr	r0, [pc, #476]	; (8004060 <mk_hw_config+0x248>)
 8003e84:	f7ff fdcb 	bl	8003a1e <LL_GPIO_SetPinOutputType>
 8003e88:	2200      	movs	r2, #0
 8003e8a:	f44f 6180 	mov.w	r1, #1024	; 0x400
 8003e8e:	4874      	ldr	r0, [pc, #464]	; (8004060 <mk_hw_config+0x248>)
 8003e90:	f7ff fddd 	bl	8003a4e <LL_GPIO_SetPinPull>
 8003e94:	2202      	movs	r2, #2
 8003e96:	f44f 5180 	mov.w	r1, #4096	; 0x1000
 8003e9a:	4872      	ldr	r0, [pc, #456]	; (8004064 <mk_hw_config+0x24c>)
 8003e9c:	f7ff fd92 	bl	80039c4 <LL_GPIO_SetPinMode>
 8003ea0:	2202      	movs	r2, #2
 8003ea2:	f44f 5180 	mov.w	r1, #4096	; 0x1000
 8003ea6:	486f      	ldr	r0, [pc, #444]	; (8004064 <mk_hw_config+0x24c>)
 8003ea8:	f7ff fdfe 	bl	8003aa8 <LL_GPIO_SetAFPin_8_15>
 8003eac:	2200      	movs	r2, #0
 8003eae:	f44f 5180 	mov.w	r1, #4096	; 0x1000
 8003eb2:	486c      	ldr	r0, [pc, #432]	; (8004064 <mk_hw_config+0x24c>)
 8003eb4:	f7ff fdb3 	bl	8003a1e <LL_GPIO_SetPinOutputType>
 8003eb8:	2202      	movs	r2, #2
 8003eba:	f44f 5100 	mov.w	r1, #8192	; 0x2000
 8003ebe:	4869      	ldr	r0, [pc, #420]	; (8004064 <mk_hw_config+0x24c>)
 8003ec0:	f7ff fd80 	bl	80039c4 <LL_GPIO_SetPinMode>
 8003ec4:	2202      	movs	r2, #2
 8003ec6:	f44f 5100 	mov.w	r1, #8192	; 0x2000
 8003eca:	4866      	ldr	r0, [pc, #408]	; (8004064 <mk_hw_config+0x24c>)
 8003ecc:	f7ff fdec 	bl	8003aa8 <LL_GPIO_SetAFPin_8_15>
 8003ed0:	2200      	movs	r2, #0
 8003ed2:	f44f 5100 	mov.w	r1, #8192	; 0x2000
 8003ed6:	4863      	ldr	r0, [pc, #396]	; (8004064 <mk_hw_config+0x24c>)
 8003ed8:	f7ff fda1 	bl	8003a1e <LL_GPIO_SetPinOutputType>
 8003edc:	2202      	movs	r2, #2
 8003ede:	f44f 4180 	mov.w	r1, #16384	; 0x4000
 8003ee2:	4860      	ldr	r0, [pc, #384]	; (8004064 <mk_hw_config+0x24c>)
 8003ee4:	f7ff fd6e 	bl	80039c4 <LL_GPIO_SetPinMode>
 8003ee8:	2202      	movs	r2, #2
 8003eea:	f44f 4180 	mov.w	r1, #16384	; 0x4000
 8003eee:	485d      	ldr	r0, [pc, #372]	; (8004064 <mk_hw_config+0x24c>)
 8003ef0:	f7ff fdda 	bl	8003aa8 <LL_GPIO_SetAFPin_8_15>
 8003ef4:	2200      	movs	r2, #0
 8003ef6:	f44f 4180 	mov.w	r1, #16384	; 0x4000
 8003efa:	485a      	ldr	r0, [pc, #360]	; (8004064 <mk_hw_config+0x24c>)
 8003efc:	f7ff fd8f 	bl	8003a1e <LL_GPIO_SetPinOutputType>
 8003f00:	4859      	ldr	r0, [pc, #356]	; (8004068 <mk_hw_config+0x250>)
 8003f02:	f7ff fb3e 	bl	8003582 <LL_TIM_EnableUpdateEvent>
 8003f06:	f44f 7100 	mov.w	r1, #512	; 0x200
 8003f0a:	4857      	ldr	r0, [pc, #348]	; (8004068 <mk_hw_config+0x250>)
 8003f0c:	f7ff fb7f 	bl	800360e <LL_TIM_SetClockDivision>
 8003f10:	2100      	movs	r1, #0
 8003f12:	4855      	ldr	r0, [pc, #340]	; (8004068 <mk_hw_config+0x250>)
 8003f14:	f7ff fb58 	bl	80035c8 <LL_TIM_SetCounterMode>
 8003f18:	f24a 4110 	movw	r1, #42000	; 0xa410
 8003f1c:	4852      	ldr	r0, [pc, #328]	; (8004068 <mk_hw_config+0x250>)
 8003f1e:	f7ff fb97 	bl	8003650 <LL_TIM_SetAutoReload>
 8003f22:	2100      	movs	r1, #0
 8003f24:	4850      	ldr	r0, [pc, #320]	; (8004068 <mk_hw_config+0x250>)
 8003f26:	f7ff fb3c 	bl	80035a2 <LL_TIM_SetUpdateSource>
 8003f2a:	f240 1111 	movw	r1, #273	; 0x111
 8003f2e:	484e      	ldr	r0, [pc, #312]	; (8004068 <mk_hw_config+0x250>)
 8003f30:	f7ff fb9c 	bl	800366c <LL_TIM_CC_EnableChannel>
 8003f34:	2260      	movs	r2, #96	; 0x60
 8003f36:	2101      	movs	r1, #1
 8003f38:	484b      	ldr	r0, [pc, #300]	; (8004068 <mk_hw_config+0x250>)
 8003f3a:	f7ff fba9 	bl	8003690 <LL_TIM_OC_SetMode>
 8003f3e:	2260      	movs	r2, #96	; 0x60
 8003f40:	2110      	movs	r1, #16
 8003f42:	4849      	ldr	r0, [pc, #292]	; (8004068 <mk_hw_config+0x250>)
 8003f44:	f7ff fba4 	bl	8003690 <LL_TIM_OC_SetMode>
 8003f48:	2260      	movs	r2, #96	; 0x60
 8003f4a:	f44f 7180 	mov.w	r1, #256	; 0x100
 8003f4e:	4846      	ldr	r0, [pc, #280]	; (8004068 <mk_hw_config+0x250>)
 8003f50:	f7ff fb9e 	bl	8003690 <LL_TIM_OC_SetMode>
 8003f54:	2101      	movs	r1, #1
 8003f56:	4844      	ldr	r0, [pc, #272]	; (8004068 <mk_hw_config+0x250>)
 8003f58:	f7ff fbe4 	bl	8003724 <LL_TIM_OC_EnableFast>
 8003f5c:	2110      	movs	r1, #16
 8003f5e:	4842      	ldr	r0, [pc, #264]	; (8004068 <mk_hw_config+0x250>)
 8003f60:	f7ff fbe0 	bl	8003724 <LL_TIM_OC_EnableFast>
 8003f64:	f44f 7180 	mov.w	r1, #256	; 0x100
 8003f68:	483f      	ldr	r0, [pc, #252]	; (8004068 <mk_hw_config+0x250>)
 8003f6a:	f7ff fbdb 	bl	8003724 <LL_TIM_OC_EnableFast>
 8003f6e:	2101      	movs	r1, #1
 8003f70:	483d      	ldr	r0, [pc, #244]	; (8004068 <mk_hw_config+0x250>)
 8003f72:	f7ff fc19 	bl	80037a8 <LL_TIM_OC_EnablePreload>
 8003f76:	2110      	movs	r1, #16
 8003f78:	483b      	ldr	r0, [pc, #236]	; (8004068 <mk_hw_config+0x250>)
 8003f7a:	f7ff fc15 	bl	80037a8 <LL_TIM_OC_EnablePreload>
 8003f7e:	f44f 7180 	mov.w	r1, #256	; 0x100
 8003f82:	4839      	ldr	r0, [pc, #228]	; (8004068 <mk_hw_config+0x250>)
 8003f84:	f7ff fc10 	bl	80037a8 <LL_TIM_OC_EnablePreload>
 8003f88:	4837      	ldr	r0, [pc, #220]	; (8004068 <mk_hw_config+0x250>)
 8003f8a:	f7ff fb30 	bl	80035ee <LL_TIM_EnableARRPreload>
 8003f8e:	f241 0168 	movw	r1, #4200	; 0x1068
 8003f92:	4835      	ldr	r0, [pc, #212]	; (8004068 <mk_hw_config+0x250>)
 8003f94:	f7ff fc4a 	bl	800382c <LL_TIM_OC_SetCompareCH1>
 8003f98:	f241 0168 	movw	r1, #4200	; 0x1068
 8003f9c:	4832      	ldr	r0, [pc, #200]	; (8004068 <mk_hw_config+0x250>)
 8003f9e:	f7ff fc53 	bl	8003848 <LL_TIM_OC_SetCompareCH2>
 8003fa2:	f241 0168 	movw	r1, #4200	; 0x1068
 8003fa6:	4830      	ldr	r0, [pc, #192]	; (8004068 <mk_hw_config+0x250>)
 8003fa8:	f7ff fc5c 	bl	8003864 <LL_TIM_OC_SetCompareCH3>
 8003fac:	482e      	ldr	r0, [pc, #184]	; (8004068 <mk_hw_config+0x250>)
 8003fae:	f7ff fc98 	bl	80038e2 <LL_TIM_GenerateEvent_UPDATE>
 8003fb2:	482d      	ldr	r0, [pc, #180]	; (8004068 <mk_hw_config+0x250>)
 8003fb4:	f7ff fac2 	bl	800353c <LL_TIM_EnableCounter>
 8003fb8:	2010      	movs	r0, #16
 8003fba:	f7ff fa77 	bl	80034ac <LL_AHB1_GRP1_EnableClock>
 8003fbe:	2200      	movs	r2, #0
 8003fc0:	2101      	movs	r1, #1
 8003fc2:	482a      	ldr	r0, [pc, #168]	; (800406c <mk_hw_config+0x254>)
 8003fc4:	f7ff fcfe 	bl	80039c4 <LL_GPIO_SetPinMode>
 8003fc8:	2200      	movs	r2, #0
 8003fca:	2101      	movs	r1, #1
 8003fcc:	4827      	ldr	r0, [pc, #156]	; (800406c <mk_hw_config+0x254>)
 8003fce:	f7ff fd3e 	bl	8003a4e <LL_GPIO_SetPinPull>
 8003fd2:	2200      	movs	r2, #0
 8003fd4:	2102      	movs	r1, #2
 8003fd6:	4825      	ldr	r0, [pc, #148]	; (800406c <mk_hw_config+0x254>)
 8003fd8:	f7ff fcf4 	bl	80039c4 <LL_GPIO_SetPinMode>
 8003fdc:	2200      	movs	r2, #0
 8003fde:	2102      	movs	r1, #2
 8003fe0:	4822      	ldr	r0, [pc, #136]	; (800406c <mk_hw_config+0x254>)
 8003fe2:	f7ff fd34 	bl	8003a4e <LL_GPIO_SetPinPull>
 8003fe6:	f44f 4080 	mov.w	r0, #16384	; 0x4000
 8003fea:	f7ff fa8f 	bl	800350c <LL_APB2_GRP1_EnableClock>
 8003fee:	f44f 0170 	mov.w	r1, #15728640	; 0xf00000
 8003ff2:	2004      	movs	r0, #4
 8003ff4:	f7ff fc86 	bl	8003904 <LL_SYSCFG_SetEXTISource>
 8003ff8:	2002      	movs	r0, #2
 8003ffa:	f7ff fcaf 	bl	800395c <LL_EXTI_EnableIT_0_31>
 8003ffe:	2002      	movs	r0, #2
 8004000:	f7ff fcbe 	bl	8003980 <LL_EXTI_EnableFallingTrig_0_31>
 8004004:	2106      	movs	r1, #6
 8004006:	2007      	movs	r0, #7
 8004008:	f7ff fa26 	bl	8003458 <NVIC_SetPriority>
 800400c:	2007      	movs	r0, #7
 800400e:	f7ff fa09 	bl	8003424 <NVIC_EnableIRQ>
 8004012:	2200      	movs	r2, #0
 8004014:	2104      	movs	r1, #4
 8004016:	4815      	ldr	r0, [pc, #84]	; (800406c <mk_hw_config+0x254>)
 8004018:	f7ff fcd4 	bl	80039c4 <LL_GPIO_SetPinMode>
 800401c:	2200      	movs	r2, #0
 800401e:	2104      	movs	r1, #4
 8004020:	4812      	ldr	r0, [pc, #72]	; (800406c <mk_hw_config+0x254>)
 8004022:	f7ff fd14 	bl	8003a4e <LL_GPIO_SetPinPull>
 8004026:	2020      	movs	r0, #32
 8004028:	f7ff fa58 	bl	80034dc <LL_APB1_GRP1_EnableClock>
 800402c:	2100      	movs	r1, #0
 800402e:	4810      	ldr	r0, [pc, #64]	; (8004070 <mk_hw_config+0x258>)
 8004030:	f7ff faca 	bl	80035c8 <LL_TIM_SetCounterMode>
 8004034:	f240 71cf 	movw	r1, #1999	; 0x7cf
 8004038:	480d      	ldr	r0, [pc, #52]	; (8004070 <mk_hw_config+0x258>)
 800403a:	f7ff fb09 	bl	8003650 <LL_TIM_SetAutoReload>
 800403e:	f24a 410f 	movw	r1, #41999	; 0xa40f
 8004042:	480b      	ldr	r0, [pc, #44]	; (8004070 <mk_hw_config+0x258>)
 8004044:	f7ff faf6 	bl	8003634 <LL_TIM_SetPrescaler>
 8004048:	4809      	ldr	r0, [pc, #36]	; (8004070 <mk_hw_config+0x258>)
 800404a:	f7ff fc3a 	bl	80038c2 <LL_TIM_EnableIT_UPDATE>
 800404e:	2106      	movs	r1, #6
 8004050:	2037      	movs	r0, #55	; 0x37
 8004052:	f7ff fa01 	bl	8003458 <NVIC_SetPriority>
 8004056:	2037      	movs	r0, #55	; 0x37
 8004058:	f7ff f9e4 	bl	8003424 <NVIC_EnableIRQ>
 800405c:	bf00      	nop
 800405e:	bd80      	pop	{r7, pc}
 8004060:	40020000 	.word	0x40020000
 8004064:	40020c00 	.word	0x40020c00
 8004068:	40000800 	.word	0x40000800
 800406c:	40021000 	.word	0x40021000
 8004070:	40001400 	.word	0x40001400

08004074 <mk_set_pwm_ctrl>:
 8004074:	b480      	push	{r7}
 8004076:	b083      	sub	sp, #12
 8004078:	af00      	add	r7, sp, #0
 800407a:	6078      	str	r0, [r7, #4]
 800407c:	687b      	ldr	r3, [r7, #4]
 800407e:	681b      	ldr	r3, [r3, #0]
 8004080:	f043 0201 	orr.w	r2, r3, #1
 8004084:	687b      	ldr	r3, [r7, #4]
 8004086:	601a      	str	r2, [r3, #0]
 8004088:	687b      	ldr	r3, [r7, #4]
 800408a:	681b      	ldr	r3, [r3, #0]
 800408c:	f023 0202 	bic.w	r2, r3, #2
 8004090:	687b      	ldr	r3, [r7, #4]
 8004092:	601a      	str	r2, [r3, #0]
 8004094:	bf00      	nop
 8004096:	370c      	adds	r7, #12
 8004098:	46bd      	mov	sp, r7
 800409a:	f85d 7b04 	ldr.w	r7, [sp], #4
 800409e:	4770      	bx	lr

080040a0 <mk_set_speed_ctrl>:
 80040a0:	b480      	push	{r7}
 80040a2:	b083      	sub	sp, #12
 80040a4:	af00      	add	r7, sp, #0
 80040a6:	6078      	str	r0, [r7, #4]
 80040a8:	687b      	ldr	r3, [r7, #4]
 80040aa:	681b      	ldr	r3, [r3, #0]
 80040ac:	f043 0202 	orr.w	r2, r3, #2
 80040b0:	687b      	ldr	r3, [r7, #4]
 80040b2:	601a      	str	r2, [r3, #0]
 80040b4:	687b      	ldr	r3, [r7, #4]
 80040b6:	681b      	ldr	r3, [r3, #0]
 80040b8:	f023 0201 	bic.w	r2, r3, #1
 80040bc:	687b      	ldr	r3, [r7, #4]
 80040be:	601a      	str	r2, [r3, #0]
 80040c0:	bf00      	nop
 80040c2:	370c      	adds	r7, #12
 80040c4:	46bd      	mov	sp, r7
 80040c6:	f85d 7b04 	ldr.w	r7, [sp], #4
 80040ca:	4770      	bx	lr

080040cc <mk_set_stop_motors_ctrl>:
 80040cc:	b480      	push	{r7}
 80040ce:	b083      	sub	sp, #12
 80040d0:	af00      	add	r7, sp, #0
 80040d2:	6078      	str	r0, [r7, #4]
 80040d4:	687b      	ldr	r3, [r7, #4]
 80040d6:	681b      	ldr	r3, [r3, #0]
 80040d8:	f043 0204 	orr.w	r2, r3, #4
 80040dc:	687b      	ldr	r3, [r7, #4]
 80040de:	601a      	str	r2, [r3, #0]
 80040e0:	bf00      	nop
 80040e2:	370c      	adds	r7, #12
 80040e4:	46bd      	mov	sp, r7
 80040e6:	f85d 7b04 	ldr.w	r7, [sp], #4
 80040ea:	4770      	bx	lr

080040ec <mk_set_block_motors_ctrl>:
 80040ec:	b480      	push	{r7}
 80040ee:	b083      	sub	sp, #12
 80040f0:	af00      	add	r7, sp, #0
 80040f2:	6078      	str	r0, [r7, #4]
 80040f4:	687b      	ldr	r3, [r7, #4]
 80040f6:	681b      	ldr	r3, [r3, #0]
 80040f8:	f043 0208 	orr.w	r2, r3, #8
 80040fc:	687b      	ldr	r3, [r7, #4]
 80040fe:	601a      	str	r2, [r3, #0]
 8004100:	bf00      	nop
 8004102:	370c      	adds	r7, #12
 8004104:	46bd      	mov	sp, r7
 8004106:	f85d 7b04 	ldr.w	r7, [sp], #4
 800410a:	4770      	bx	lr

0800410c <mk_clr_stop_motors_ctrl>:
 800410c:	b480      	push	{r7}
 800410e:	b083      	sub	sp, #12
 8004110:	af00      	add	r7, sp, #0
 8004112:	6078      	str	r0, [r7, #4]
 8004114:	687b      	ldr	r3, [r7, #4]
 8004116:	681b      	ldr	r3, [r3, #0]
 8004118:	f023 0204 	bic.w	r2, r3, #4
 800411c:	687b      	ldr	r3, [r7, #4]
 800411e:	601a      	str	r2, [r3, #0]
 8004120:	bf00      	nop
 8004122:	370c      	adds	r7, #12
 8004124:	46bd      	mov	sp, r7
 8004126:	f85d 7b04 	ldr.w	r7, [sp], #4
 800412a:	4770      	bx	lr

0800412c <read_cord_status>:
 800412c:	b580      	push	{r7, lr}
 800412e:	af00      	add	r7, sp, #0
 8004130:	2101      	movs	r1, #1
 8004132:	4803      	ldr	r0, [pc, #12]	; (8004140 <read_cord_status+0x14>)
 8004134:	f7ff fce7 	bl	8003b06 <LL_GPIO_IsInputPinSet>
 8004138:	4603      	mov	r3, r0
 800413a:	b2db      	uxtb	r3, r3
 800413c:	4618      	mov	r0, r3
 800413e:	bd80      	pop	{r7, pc}
 8004140:	40021000 	.word	0x40021000

08004144 <read_side_switch>:
 8004144:	b580      	push	{r7, lr}
 8004146:	af00      	add	r7, sp, #0
 8004148:	2104      	movs	r1, #4
 800414a:	4803      	ldr	r0, [pc, #12]	; (8004158 <read_side_switch+0x14>)
 800414c:	f7ff fcdb 	bl	8003b06 <LL_GPIO_IsInputPinSet>
 8004150:	4603      	mov	r3, r0
 8004152:	b2db      	uxtb	r3, r3
 8004154:	4618      	mov	r0, r3
 8004156:	bd80      	pop	{r7, pc}
 8004158:	40021000 	.word	0x40021000

0800415c <turn_off_all_motors>:
 800415c:	b580      	push	{r7, lr}
 800415e:	af00      	add	r7, sp, #0
 8004160:	4b05      	ldr	r3, [pc, #20]	; (8004178 <turn_off_all_motors+0x1c>)
 8004162:	681b      	ldr	r3, [r3, #0]
 8004164:	4618      	mov	r0, r3
 8004166:	f7ff ffc1 	bl	80040ec <mk_set_block_motors_ctrl>
 800416a:	4804      	ldr	r0, [pc, #16]	; (800417c <turn_off_all_motors+0x20>)
 800416c:	f7ff fddc 	bl	8003d28 <mk_set_pwm>
 8004170:	f7fd fb9e 	bl	80018b0 <manipulators_block>
 8004174:	bf00      	nop
 8004176:	bd80      	pop	{r7, pc}
 8004178:	20000b08 	.word	0x20000b08
 800417c:	20000b74 	.word	0x20000b74

08004180 <motor_kinematics>:
 8004180:	b580      	push	{r7, lr}
 8004182:	b08e      	sub	sp, #56	; 0x38
 8004184:	af00      	add	r7, sp, #0
 8004186:	6078      	str	r0, [r7, #4]
 8004188:	f107 030c 	add.w	r3, r7, #12
 800418c:	222c      	movs	r2, #44	; 0x2c
 800418e:	2100      	movs	r1, #0
 8004190:	4618      	mov	r0, r3
 8004192:	f004 fca2 	bl	8008ada <memset>
 8004196:	4b33      	ldr	r3, [pc, #204]	; (8004264 <motor_kinematics+0xe4>)
 8004198:	62fb      	str	r3, [r7, #44]	; 0x2c
 800419a:	4b32      	ldr	r3, [pc, #200]	; (8004264 <motor_kinematics+0xe4>)
 800419c:	633b      	str	r3, [r7, #48]	; 0x30
 800419e:	4b31      	ldr	r3, [pc, #196]	; (8004264 <motor_kinematics+0xe4>)
 80041a0:	637b      	str	r3, [r7, #52]	; 0x34
 80041a2:	f7ff fe39 	bl	8003e18 <mk_hw_config>
 80041a6:	4930      	ldr	r1, [pc, #192]	; (8004268 <motor_kinematics+0xe8>)
 80041a8:	2001      	movs	r0, #1
 80041aa:	f001 f8d1 	bl	8005350 <xQueueCreateMutexStatic>
 80041ae:	4603      	mov	r3, r0
 80041b0:	62bb      	str	r3, [r7, #40]	; 0x28
 80041b2:	f002 fcf1 	bl	8006b98 <xTaskGetCurrentTaskHandle>
 80041b6:	4603      	mov	r3, r0
 80041b8:	627b      	str	r3, [r7, #36]	; 0x24
 80041ba:	4a2c      	ldr	r2, [pc, #176]	; (800426c <motor_kinematics+0xec>)
 80041bc:	f107 030c 	add.w	r3, r7, #12
 80041c0:	6013      	str	r3, [r2, #0]
 80041c2:	4b2a      	ldr	r3, [pc, #168]	; (800426c <motor_kinematics+0xec>)
 80041c4:	681b      	ldr	r3, [r3, #0]
 80041c6:	4618      	mov	r0, r3
 80041c8:	f7ff ff80 	bl	80040cc <mk_set_stop_motors_ctrl>
 80041cc:	f04f 31ff 	mov.w	r1, #4294967295	; 0xffffffff
 80041d0:	2001      	movs	r0, #1
 80041d2:	f002 febf 	bl	8006f54 <ulTaskNotifyTake>
 80041d6:	4b25      	ldr	r3, [pc, #148]	; (800426c <motor_kinematics+0xec>)
 80041d8:	681b      	ldr	r3, [r3, #0]
 80041da:	69db      	ldr	r3, [r3, #28]
 80041dc:	f04f 31ff 	mov.w	r1, #4294967295	; 0xffffffff
 80041e0:	4618      	mov	r0, r3
 80041e2:	f001 fb3b 	bl	800585c <xQueueSemaphoreTake>
 80041e6:	4b21      	ldr	r3, [pc, #132]	; (800426c <motor_kinematics+0xec>)
 80041e8:	681b      	ldr	r3, [r3, #0]
 80041ea:	681b      	ldr	r3, [r3, #0]
 80041ec:	f003 0308 	and.w	r3, r3, #8
 80041f0:	2b00      	cmp	r3, #0
 80041f2:	d134      	bne.n	800425e <motor_kinematics+0xde>
 80041f4:	4b1d      	ldr	r3, [pc, #116]	; (800426c <motor_kinematics+0xec>)
 80041f6:	681b      	ldr	r3, [r3, #0]
 80041f8:	681b      	ldr	r3, [r3, #0]
 80041fa:	f003 0304 	and.w	r3, r3, #4
 80041fe:	2b00      	cmp	r3, #0
 8004200:	d00b      	beq.n	800421a <motor_kinematics+0x9a>
 8004202:	4b1a      	ldr	r3, [pc, #104]	; (800426c <motor_kinematics+0xec>)
 8004204:	681b      	ldr	r3, [r3, #0]
 8004206:	4a17      	ldr	r2, [pc, #92]	; (8004264 <motor_kinematics+0xe4>)
 8004208:	621a      	str	r2, [r3, #32]
 800420a:	4b18      	ldr	r3, [pc, #96]	; (800426c <motor_kinematics+0xec>)
 800420c:	681b      	ldr	r3, [r3, #0]
 800420e:	4a15      	ldr	r2, [pc, #84]	; (8004264 <motor_kinematics+0xe4>)
 8004210:	625a      	str	r2, [r3, #36]	; 0x24
 8004212:	4b16      	ldr	r3, [pc, #88]	; (800426c <motor_kinematics+0xec>)
 8004214:	681b      	ldr	r3, [r3, #0]
 8004216:	4a13      	ldr	r2, [pc, #76]	; (8004264 <motor_kinematics+0xe4>)
 8004218:	629a      	str	r2, [r3, #40]	; 0x28
 800421a:	4b14      	ldr	r3, [pc, #80]	; (800426c <motor_kinematics+0xec>)
 800421c:	681b      	ldr	r3, [r3, #0]
 800421e:	681b      	ldr	r3, [r3, #0]
 8004220:	f003 0302 	and.w	r3, r3, #2
 8004224:	2b00      	cmp	r3, #0
 8004226:	d00b      	beq.n	8004240 <motor_kinematics+0xc0>
 8004228:	4b10      	ldr	r3, [pc, #64]	; (800426c <motor_kinematics+0xec>)
 800422a:	681b      	ldr	r3, [r3, #0]
 800422c:	681b      	ldr	r3, [r3, #0]
 800422e:	f003 0304 	and.w	r3, r3, #4
 8004232:	2b00      	cmp	r3, #0
 8004234:	d104      	bne.n	8004240 <motor_kinematics+0xc0>
 8004236:	4b0d      	ldr	r3, [pc, #52]	; (800426c <motor_kinematics+0xec>)
 8004238:	681b      	ldr	r3, [r3, #0]
 800423a:	4618      	mov	r0, r3
 800423c:	f7ff fc96 	bl	8003b6c <mk_speed2pwm>
 8004240:	4b0a      	ldr	r3, [pc, #40]	; (800426c <motor_kinematics+0xec>)
 8004242:	681b      	ldr	r3, [r3, #0]
 8004244:	3320      	adds	r3, #32
 8004246:	4618      	mov	r0, r3
 8004248:	f7ff fd6e 	bl	8003d28 <mk_set_pwm>
 800424c:	4b07      	ldr	r3, [pc, #28]	; (800426c <motor_kinematics+0xec>)
 800424e:	681b      	ldr	r3, [r3, #0]
 8004250:	69d8      	ldr	r0, [r3, #28]
 8004252:	2300      	movs	r3, #0
 8004254:	2200      	movs	r2, #0
 8004256:	2100      	movs	r1, #0
 8004258:	f001 f896 	bl	8005388 <xQueueGenericSend>
 800425c:	e7b6      	b.n	80041cc <motor_kinematics+0x4c>
 800425e:	bf00      	nop
 8004260:	e7b4      	b.n	80041cc <motor_kinematics+0x4c>
 8004262:	bf00      	nop
 8004264:	3dcccccd 	.word	0x3dcccccd
 8004268:	20014e70 	.word	0x20014e70
 800426c:	20000b08 	.word	0x20000b08

08004270 <cmd_set_robot_session>:
 8004270:	b580      	push	{r7, lr}
 8004272:	b082      	sub	sp, #8
 8004274:	af00      	add	r7, sp, #0
 8004276:	6078      	str	r0, [r7, #4]
 8004278:	4b0f      	ldr	r3, [pc, #60]	; (80042b8 <cmd_set_robot_session+0x48>)
 800427a:	681b      	ldr	r3, [r3, #0]
 800427c:	2b00      	cmp	r3, #0
 800427e:	d00f      	beq.n	80042a0 <cmd_set_robot_session+0x30>
 8004280:	4b0d      	ldr	r3, [pc, #52]	; (80042b8 <cmd_set_robot_session+0x48>)
 8004282:	681b      	ldr	r3, [r3, #0]
 8004284:	2201      	movs	r2, #1
 8004286:	711a      	strb	r2, [r3, #4]
 8004288:	4b0b      	ldr	r3, [pc, #44]	; (80042b8 <cmd_set_robot_session+0x48>)
 800428a:	681b      	ldr	r3, [r3, #0]
 800428c:	4618      	mov	r0, r3
 800428e:	f7ff ff3d 	bl	800410c <mk_clr_stop_motors_ctrl>
 8004292:	2203      	movs	r2, #3
 8004294:	4909      	ldr	r1, [pc, #36]	; (80042bc <cmd_set_robot_session+0x4c>)
 8004296:	6878      	ldr	r0, [r7, #4]
 8004298:	f004 fc14 	bl	8008ac4 <memcpy>
 800429c:	2303      	movs	r3, #3
 800429e:	e006      	b.n	80042ae <cmd_set_robot_session+0x3e>
 80042a0:	bf00      	nop
 80042a2:	2203      	movs	r2, #3
 80042a4:	4906      	ldr	r1, [pc, #24]	; (80042c0 <cmd_set_robot_session+0x50>)
 80042a6:	6878      	ldr	r0, [r7, #4]
 80042a8:	f004 fc0c 	bl	8008ac4 <memcpy>
 80042ac:	2303      	movs	r3, #3
 80042ae:	4618      	mov	r0, r3
 80042b0:	3708      	adds	r7, #8
 80042b2:	46bd      	mov	sp, r7
 80042b4:	bd80      	pop	{r7, pc}
 80042b6:	bf00      	nop
 80042b8:	20000b08 	.word	0x20000b08
 80042bc:	0800b2c0 	.word	0x0800b2c0
 80042c0:	0800b2c4 	.word	0x0800b2c4

080042c4 <cmd_read_cord_status>:
 80042c4:	b590      	push	{r4, r7, lr}
 80042c6:	b083      	sub	sp, #12
 80042c8:	af00      	add	r7, sp, #0
 80042ca:	6078      	str	r0, [r7, #4]
 80042cc:	4b15      	ldr	r3, [pc, #84]	; (8004324 <cmd_read_cord_status+0x60>)
 80042ce:	681c      	ldr	r4, [r3, #0]
 80042d0:	f7ff ff2c 	bl	800412c <read_cord_status>
 80042d4:	4603      	mov	r3, r0
 80042d6:	7163      	strb	r3, [r4, #5]
 80042d8:	4b12      	ldr	r3, [pc, #72]	; (8004324 <cmd_read_cord_status+0x60>)
 80042da:	681b      	ldr	r3, [r3, #0]
 80042dc:	795b      	ldrb	r3, [r3, #5]
 80042de:	2b01      	cmp	r3, #1
 80042e0:	d115      	bne.n	800430e <cmd_read_cord_status+0x4a>
 80042e2:	4b10      	ldr	r3, [pc, #64]	; (8004324 <cmd_read_cord_status+0x60>)
 80042e4:	681b      	ldr	r3, [r3, #0]
 80042e6:	4618      	mov	r0, r3
 80042e8:	f7ff ff10 	bl	800410c <mk_clr_stop_motors_ctrl>
 80042ec:	480e      	ldr	r0, [pc, #56]	; (8004328 <cmd_read_cord_status+0x64>)
 80042ee:	f7ff f935 	bl	800355c <LL_TIM_IsEnabledCounter>
 80042f2:	4603      	mov	r3, r0
 80042f4:	2b00      	cmp	r3, #0
 80042f6:	d102      	bne.n	80042fe <cmd_read_cord_status+0x3a>
 80042f8:	480b      	ldr	r0, [pc, #44]	; (8004328 <cmd_read_cord_status+0x64>)
 80042fa:	f7ff f91f 	bl	800353c <LL_TIM_EnableCounter>
 80042fe:	4b09      	ldr	r3, [pc, #36]	; (8004324 <cmd_read_cord_status+0x60>)
 8004300:	681b      	ldr	r3, [r3, #0]
 8004302:	6998      	ldr	r0, [r3, #24]
 8004304:	2300      	movs	r3, #0
 8004306:	2202      	movs	r2, #2
 8004308:	2100      	movs	r1, #0
 800430a:	f002 fe6f 	bl	8006fec <xTaskGenericNotify>
 800430e:	4b05      	ldr	r3, [pc, #20]	; (8004324 <cmd_read_cord_status+0x60>)
 8004310:	681b      	ldr	r3, [r3, #0]
 8004312:	3305      	adds	r3, #5
 8004314:	781a      	ldrb	r2, [r3, #0]
 8004316:	687b      	ldr	r3, [r7, #4]
 8004318:	701a      	strb	r2, [r3, #0]
 800431a:	2301      	movs	r3, #1
 800431c:	4618      	mov	r0, r3
 800431e:	370c      	adds	r7, #12
 8004320:	46bd      	mov	sp, r7
 8004322:	bd90      	pop	{r4, r7, pc}
 8004324:	20000b08 	.word	0x20000b08
 8004328:	40001400 	.word	0x40001400

0800432c <cmd_read_side_switch>:
 800432c:	b590      	push	{r4, r7, lr}
 800432e:	b083      	sub	sp, #12
 8004330:	af00      	add	r7, sp, #0
 8004332:	6078      	str	r0, [r7, #4]
 8004334:	4b08      	ldr	r3, [pc, #32]	; (8004358 <cmd_read_side_switch+0x2c>)
 8004336:	681c      	ldr	r4, [r3, #0]
 8004338:	f7ff ff04 	bl	8004144 <read_side_switch>
 800433c:	4603      	mov	r3, r0
 800433e:	72a3      	strb	r3, [r4, #10]
 8004340:	4b05      	ldr	r3, [pc, #20]	; (8004358 <cmd_read_side_switch+0x2c>)
 8004342:	681b      	ldr	r3, [r3, #0]
 8004344:	330a      	adds	r3, #10
 8004346:	781a      	ldrb	r2, [r3, #0]
 8004348:	687b      	ldr	r3, [r7, #4]
 800434a:	701a      	strb	r2, [r3, #0]
 800434c:	2301      	movs	r3, #1
 800434e:	4618      	mov	r0, r3
 8004350:	370c      	adds	r7, #12
 8004352:	46bd      	mov	sp, r7
 8004354:	bd90      	pop	{r4, r7, pc}
 8004356:	bf00      	nop
 8004358:	20000b08 	.word	0x20000b08

0800435c <cmd_read_strategy>:
 800435c:	b480      	push	{r7}
 800435e:	b083      	sub	sp, #12
 8004360:	af00      	add	r7, sp, #0
 8004362:	6078      	str	r0, [r7, #4]
 8004364:	4b06      	ldr	r3, [pc, #24]	; (8004380 <cmd_read_strategy+0x24>)
 8004366:	681b      	ldr	r3, [r3, #0]
 8004368:	3306      	adds	r3, #6
 800436a:	781a      	ldrb	r2, [r3, #0]
 800436c:	687b      	ldr	r3, [r7, #4]
 800436e:	701a      	strb	r2, [r3, #0]
 8004370:	2301      	movs	r3, #1
 8004372:	4618      	mov	r0, r3
 8004374:	370c      	adds	r7, #12
 8004376:	46bd      	mov	sp, r7
 8004378:	f85d 7b04 	ldr.w	r7, [sp], #4
 800437c:	4770      	bx	lr
 800437e:	bf00      	nop
 8004380:	20000b08 	.word	0x20000b08

08004384 <cmd_set_pwm>:
 8004384:	b590      	push	{r4, r7, lr}
 8004386:	b085      	sub	sp, #20
 8004388:	af00      	add	r7, sp, #0
 800438a:	6078      	str	r0, [r7, #4]
 800438c:	687b      	ldr	r3, [r7, #4]
 800438e:	60fb      	str	r3, [r7, #12]
 8004390:	4b3f      	ldr	r3, [pc, #252]	; (8004490 <cmd_set_pwm+0x10c>)
 8004392:	681b      	ldr	r3, [r3, #0]
 8004394:	2b00      	cmp	r3, #0
 8004396:	d06d      	beq.n	8004474 <cmd_set_pwm+0xf0>
 8004398:	68fb      	ldr	r3, [r7, #12]
 800439a:	781b      	ldrb	r3, [r3, #0]
 800439c:	2b03      	cmp	r3, #3
 800439e:	d86b      	bhi.n	8004478 <cmd_set_pwm+0xf4>
 80043a0:	68fb      	ldr	r3, [r7, #12]
 80043a2:	781b      	ldrb	r3, [r3, #0]
 80043a4:	2b00      	cmp	r3, #0
 80043a6:	d067      	beq.n	8004478 <cmd_set_pwm+0xf4>
 80043a8:	68fb      	ldr	r3, [r7, #12]
 80043aa:	785a      	ldrb	r2, [r3, #1]
 80043ac:	7899      	ldrb	r1, [r3, #2]
 80043ae:	0209      	lsls	r1, r1, #8
 80043b0:	430a      	orrs	r2, r1
 80043b2:	78d9      	ldrb	r1, [r3, #3]
 80043b4:	0409      	lsls	r1, r1, #16
 80043b6:	430a      	orrs	r2, r1
 80043b8:	791b      	ldrb	r3, [r3, #4]
 80043ba:	061b      	lsls	r3, r3, #24
 80043bc:	4313      	orrs	r3, r2
 80043be:	ee07 3a90 	vmov	s15, r3
 80043c2:	eef0 7ae7 	vabs.f32	s15, s15
 80043c6:	ed9f 7a33 	vldr	s14, [pc, #204]	; 8004494 <cmd_set_pwm+0x110>
 80043ca:	eef4 7ac7 	vcmpe.f32	s15, s14
 80043ce:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 80043d2:	d451      	bmi.n	8004478 <cmd_set_pwm+0xf4>
 80043d4:	68fb      	ldr	r3, [r7, #12]
 80043d6:	785a      	ldrb	r2, [r3, #1]
 80043d8:	7899      	ldrb	r1, [r3, #2]
 80043da:	0209      	lsls	r1, r1, #8
 80043dc:	430a      	orrs	r2, r1
 80043de:	78d9      	ldrb	r1, [r3, #3]
 80043e0:	0409      	lsls	r1, r1, #16
 80043e2:	430a      	orrs	r2, r1
 80043e4:	791b      	ldrb	r3, [r3, #4]
 80043e6:	061b      	lsls	r3, r3, #24
 80043e8:	4313      	orrs	r3, r2
 80043ea:	ee07 3a90 	vmov	s15, r3
 80043ee:	eef0 7ae7 	vabs.f32	s15, s15
 80043f2:	eeb7 7a00 	vmov.f32	s14, #112	; 0x3f800000  1.0
 80043f6:	eef4 7ac7 	vcmpe.f32	s15, s14
 80043fa:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 80043fe:	dc3b      	bgt.n	8004478 <cmd_set_pwm+0xf4>
 8004400:	4b23      	ldr	r3, [pc, #140]	; (8004490 <cmd_set_pwm+0x10c>)
 8004402:	681b      	ldr	r3, [r3, #0]
 8004404:	69db      	ldr	r3, [r3, #28]
 8004406:	f04f 31ff 	mov.w	r1, #4294967295	; 0xffffffff
 800440a:	4618      	mov	r0, r3
 800440c:	f001 fa26 	bl	800585c <xQueueSemaphoreTake>
 8004410:	4b1f      	ldr	r3, [pc, #124]	; (8004490 <cmd_set_pwm+0x10c>)
 8004412:	681b      	ldr	r3, [r3, #0]
 8004414:	4618      	mov	r0, r3
 8004416:	f7ff fe2d 	bl	8004074 <mk_set_pwm_ctrl>
 800441a:	4b1d      	ldr	r3, [pc, #116]	; (8004490 <cmd_set_pwm+0x10c>)
 800441c:	681a      	ldr	r2, [r3, #0]
 800441e:	68fb      	ldr	r3, [r7, #12]
 8004420:	781b      	ldrb	r3, [r3, #0]
 8004422:	1e59      	subs	r1, r3, #1
 8004424:	68fb      	ldr	r3, [r7, #12]
 8004426:	7858      	ldrb	r0, [r3, #1]
 8004428:	789c      	ldrb	r4, [r3, #2]
 800442a:	0224      	lsls	r4, r4, #8
 800442c:	4320      	orrs	r0, r4
 800442e:	78dc      	ldrb	r4, [r3, #3]
 8004430:	0424      	lsls	r4, r4, #16
 8004432:	4320      	orrs	r0, r4
 8004434:	791b      	ldrb	r3, [r3, #4]
 8004436:	061b      	lsls	r3, r3, #24
 8004438:	4303      	orrs	r3, r0
 800443a:	4618      	mov	r0, r3
 800443c:	f101 0308 	add.w	r3, r1, #8
 8004440:	009b      	lsls	r3, r3, #2
 8004442:	4413      	add	r3, r2
 8004444:	6018      	str	r0, [r3, #0]
 8004446:	4b12      	ldr	r3, [pc, #72]	; (8004490 <cmd_set_pwm+0x10c>)
 8004448:	681b      	ldr	r3, [r3, #0]
 800444a:	69d8      	ldr	r0, [r3, #28]
 800444c:	2300      	movs	r3, #0
 800444e:	2200      	movs	r2, #0
 8004450:	2100      	movs	r1, #0
 8004452:	f000 ff99 	bl	8005388 <xQueueGenericSend>
 8004456:	4b0e      	ldr	r3, [pc, #56]	; (8004490 <cmd_set_pwm+0x10c>)
 8004458:	681b      	ldr	r3, [r3, #0]
 800445a:	6998      	ldr	r0, [r3, #24]
 800445c:	2300      	movs	r3, #0
 800445e:	2202      	movs	r2, #2
 8004460:	2100      	movs	r1, #0
 8004462:	f002 fdc3 	bl	8006fec <xTaskGenericNotify>
 8004466:	2203      	movs	r2, #3
 8004468:	490b      	ldr	r1, [pc, #44]	; (8004498 <cmd_set_pwm+0x114>)
 800446a:	6878      	ldr	r0, [r7, #4]
 800446c:	f004 fb2a 	bl	8008ac4 <memcpy>
 8004470:	2303      	movs	r3, #3
 8004472:	e008      	b.n	8004486 <cmd_set_pwm+0x102>
 8004474:	bf00      	nop
 8004476:	e000      	b.n	800447a <cmd_set_pwm+0xf6>
 8004478:	bf00      	nop
 800447a:	2203      	movs	r2, #3
 800447c:	4907      	ldr	r1, [pc, #28]	; (800449c <cmd_set_pwm+0x118>)
 800447e:	6878      	ldr	r0, [r7, #4]
 8004480:	f004 fb20 	bl	8008ac4 <memcpy>
 8004484:	2303      	movs	r3, #3
 8004486:	4618      	mov	r0, r3
 8004488:	3714      	adds	r7, #20
 800448a:	46bd      	mov	sp, r7
 800448c:	bd90      	pop	{r4, r7, pc}
 800448e:	bf00      	nop
 8004490:	20000b08 	.word	0x20000b08
 8004494:	3dcccccd 	.word	0x3dcccccd
 8004498:	0800b2c0 	.word	0x0800b2c0
 800449c:	0800b2c4 	.word	0x0800b2c4

080044a0 <cmd_set_speed>:
 80044a0:	b580      	push	{r7, lr}
 80044a2:	b084      	sub	sp, #16
 80044a4:	af00      	add	r7, sp, #0
 80044a6:	6078      	str	r0, [r7, #4]
 80044a8:	687b      	ldr	r3, [r7, #4]
 80044aa:	60fb      	str	r3, [r7, #12]
 80044ac:	4b1d      	ldr	r3, [pc, #116]	; (8004524 <cmd_set_speed+0x84>)
 80044ae:	681b      	ldr	r3, [r3, #0]
 80044b0:	2b00      	cmp	r3, #0
 80044b2:	d02b      	beq.n	800450c <cmd_set_speed+0x6c>
 80044b4:	4b1b      	ldr	r3, [pc, #108]	; (8004524 <cmd_set_speed+0x84>)
 80044b6:	681b      	ldr	r3, [r3, #0]
 80044b8:	69db      	ldr	r3, [r3, #28]
 80044ba:	f04f 31ff 	mov.w	r1, #4294967295	; 0xffffffff
 80044be:	4618      	mov	r0, r3
 80044c0:	f001 f9cc 	bl	800585c <xQueueSemaphoreTake>
 80044c4:	4b17      	ldr	r3, [pc, #92]	; (8004524 <cmd_set_speed+0x84>)
 80044c6:	681b      	ldr	r3, [r3, #0]
 80044c8:	4618      	mov	r0, r3
 80044ca:	f7ff fde9 	bl	80040a0 <mk_set_speed_ctrl>
 80044ce:	4b15      	ldr	r3, [pc, #84]	; (8004524 <cmd_set_speed+0x84>)
 80044d0:	681b      	ldr	r3, [r3, #0]
 80044d2:	330c      	adds	r3, #12
 80044d4:	68f9      	ldr	r1, [r7, #12]
 80044d6:	220c      	movs	r2, #12
 80044d8:	4618      	mov	r0, r3
 80044da:	f004 faf3 	bl	8008ac4 <memcpy>
 80044de:	4b11      	ldr	r3, [pc, #68]	; (8004524 <cmd_set_speed+0x84>)
 80044e0:	681b      	ldr	r3, [r3, #0]
 80044e2:	69d8      	ldr	r0, [r3, #28]
 80044e4:	2300      	movs	r3, #0
 80044e6:	2200      	movs	r2, #0
 80044e8:	2100      	movs	r1, #0
 80044ea:	f000 ff4d 	bl	8005388 <xQueueGenericSend>
 80044ee:	4b0d      	ldr	r3, [pc, #52]	; (8004524 <cmd_set_speed+0x84>)
 80044f0:	681b      	ldr	r3, [r3, #0]
 80044f2:	6998      	ldr	r0, [r3, #24]
 80044f4:	2300      	movs	r3, #0
 80044f6:	2202      	movs	r2, #2
 80044f8:	2100      	movs	r1, #0
 80044fa:	f002 fd77 	bl	8006fec <xTaskGenericNotify>
 80044fe:	2203      	movs	r2, #3
 8004500:	4909      	ldr	r1, [pc, #36]	; (8004528 <cmd_set_speed+0x88>)
 8004502:	6878      	ldr	r0, [r7, #4]
 8004504:	f004 fade 	bl	8008ac4 <memcpy>
 8004508:	2303      	movs	r3, #3
 800450a:	e006      	b.n	800451a <cmd_set_speed+0x7a>
 800450c:	bf00      	nop
 800450e:	2203      	movs	r2, #3
 8004510:	4906      	ldr	r1, [pc, #24]	; (800452c <cmd_set_speed+0x8c>)
 8004512:	6878      	ldr	r0, [r7, #4]
 8004514:	f004 fad6 	bl	8008ac4 <memcpy>
 8004518:	2303      	movs	r3, #3
 800451a:	4618      	mov	r0, r3
 800451c:	3710      	adds	r7, #16
 800451e:	46bd      	mov	sp, r7
 8004520:	bd80      	pop	{r7, pc}
 8004522:	bf00      	nop
 8004524:	20000b08 	.word	0x20000b08
 8004528:	0800b2c0 	.word	0x0800b2c0
 800452c:	0800b2c4 	.word	0x0800b2c4

08004530 <TIM7_IRQHandler>:
 8004530:	b580      	push	{r7, lr}
 8004532:	b082      	sub	sp, #8
 8004534:	af00      	add	r7, sp, #0
 8004536:	2300      	movs	r3, #0
 8004538:	607b      	str	r3, [r7, #4]
 800453a:	4814      	ldr	r0, [pc, #80]	; (800458c <TIM7_IRQHandler+0x5c>)
 800453c:	f7ff f9ae 	bl	800389c <LL_TIM_IsActiveFlag_UPDATE>
 8004540:	4603      	mov	r3, r0
 8004542:	2b00      	cmp	r3, #0
 8004544:	d012      	beq.n	800456c <TIM7_IRQHandler+0x3c>
 8004546:	4811      	ldr	r0, [pc, #68]	; (800458c <TIM7_IRQHandler+0x5c>)
 8004548:	f7ff f99a 	bl	8003880 <LL_TIM_ClearFlag_UPDATE>
 800454c:	4b10      	ldr	r3, [pc, #64]	; (8004590 <TIM7_IRQHandler+0x60>)
 800454e:	681b      	ldr	r3, [r3, #0]
 8004550:	3301      	adds	r3, #1
 8004552:	4a0f      	ldr	r2, [pc, #60]	; (8004590 <TIM7_IRQHandler+0x60>)
 8004554:	6013      	str	r3, [r2, #0]
 8004556:	4b0e      	ldr	r3, [pc, #56]	; (8004590 <TIM7_IRQHandler+0x60>)
 8004558:	681b      	ldr	r3, [r3, #0]
 800455a:	2b62      	cmp	r3, #98	; 0x62
 800455c:	d906      	bls.n	800456c <TIM7_IRQHandler+0x3c>
 800455e:	4b0d      	ldr	r3, [pc, #52]	; (8004594 <TIM7_IRQHandler+0x64>)
 8004560:	681b      	ldr	r3, [r3, #0]
 8004562:	791b      	ldrb	r3, [r3, #4]
 8004564:	2b01      	cmp	r3, #1
 8004566:	d001      	beq.n	800456c <TIM7_IRQHandler+0x3c>
 8004568:	f7ff fdf8 	bl	800415c <turn_off_all_motors>
 800456c:	687b      	ldr	r3, [r7, #4]
 800456e:	2b00      	cmp	r3, #0
 8004570:	d007      	beq.n	8004582 <TIM7_IRQHandler+0x52>
 8004572:	4b09      	ldr	r3, [pc, #36]	; (8004598 <TIM7_IRQHandler+0x68>)
 8004574:	f04f 5280 	mov.w	r2, #268435456	; 0x10000000
 8004578:	601a      	str	r2, [r3, #0]
 800457a:	f3bf 8f4f 	dsb	sy
 800457e:	f3bf 8f6f 	isb	sy
 8004582:	bf00      	nop
 8004584:	3708      	adds	r7, #8
 8004586:	46bd      	mov	sp, r7
 8004588:	bd80      	pop	{r7, pc}
 800458a:	bf00      	nop
 800458c:	40001400 	.word	0x40001400
 8004590:	20000b80 	.word	0x20000b80
 8004594:	20000b08 	.word	0x20000b08
 8004598:	e000ed04 	.word	0xe000ed04

0800459c <EXTI9_5_IRQHandler>:
 800459c:	b580      	push	{r7, lr}
 800459e:	b082      	sub	sp, #8
 80045a0:	af00      	add	r7, sp, #0
 80045a2:	2300      	movs	r3, #0
 80045a4:	607b      	str	r3, [r7, #4]
 80045a6:	f001 ff93 	bl	80064d0 <xTaskGetTickCountFromISR>
 80045aa:	4603      	mov	r3, r0
 80045ac:	807b      	strh	r3, [r7, #2]
 80045ae:	887a      	ldrh	r2, [r7, #2]
 80045b0:	4b16      	ldr	r3, [pc, #88]	; (800460c <EXTI9_5_IRQHandler+0x70>)
 80045b2:	681b      	ldr	r3, [r3, #0]
 80045b4:	891b      	ldrh	r3, [r3, #8]
 80045b6:	33c8      	adds	r3, #200	; 0xc8
 80045b8:	429a      	cmp	r2, r3
 80045ba:	dd10      	ble.n	80045de <EXTI9_5_IRQHandler+0x42>
 80045bc:	4b13      	ldr	r3, [pc, #76]	; (800460c <EXTI9_5_IRQHandler+0x70>)
 80045be:	681b      	ldr	r3, [r3, #0]
 80045c0:	799b      	ldrb	r3, [r3, #6]
 80045c2:	1c5a      	adds	r2, r3, #1
 80045c4:	4b12      	ldr	r3, [pc, #72]	; (8004610 <EXTI9_5_IRQHandler+0x74>)
 80045c6:	fb83 3102 	smull	r3, r1, r3, r2
 80045ca:	17d3      	asrs	r3, r2, #31
 80045cc:	1ac9      	subs	r1, r1, r3
 80045ce:	460b      	mov	r3, r1
 80045d0:	005b      	lsls	r3, r3, #1
 80045d2:	440b      	add	r3, r1
 80045d4:	1ad1      	subs	r1, r2, r3
 80045d6:	4b0d      	ldr	r3, [pc, #52]	; (800460c <EXTI9_5_IRQHandler+0x70>)
 80045d8:	681b      	ldr	r3, [r3, #0]
 80045da:	b2ca      	uxtb	r2, r1
 80045dc:	719a      	strb	r2, [r3, #6]
 80045de:	4b0b      	ldr	r3, [pc, #44]	; (800460c <EXTI9_5_IRQHandler+0x70>)
 80045e0:	681b      	ldr	r3, [r3, #0]
 80045e2:	887a      	ldrh	r2, [r7, #2]
 80045e4:	811a      	strh	r2, [r3, #8]
 80045e6:	2002      	movs	r0, #2
 80045e8:	f7ff f9dc 	bl	80039a4 <LL_EXTI_ClearFlag_0_31>
 80045ec:	687b      	ldr	r3, [r7, #4]
 80045ee:	2b00      	cmp	r3, #0
 80045f0:	d007      	beq.n	8004602 <EXTI9_5_IRQHandler+0x66>
 80045f2:	4b08      	ldr	r3, [pc, #32]	; (8004614 <EXTI9_5_IRQHandler+0x78>)
 80045f4:	f04f 5280 	mov.w	r2, #268435456	; 0x10000000
 80045f8:	601a      	str	r2, [r3, #0]
 80045fa:	f3bf 8f4f 	dsb	sy
 80045fe:	f3bf 8f6f 	isb	sy
 8004602:	bf00      	nop
 8004604:	3708      	adds	r7, #8
 8004606:	46bd      	mov	sp, r7
 8004608:	bd80      	pop	{r7, pc}
 800460a:	bf00      	nop
 800460c:	20000b08 	.word	0x20000b08
 8004610:	55555556 	.word	0x55555556
 8004614:	e000ed04 	.word	0xe000ed04

08004618 <NVIC_EnableIRQ>:
 8004618:	b480      	push	{r7}
 800461a:	b083      	sub	sp, #12
 800461c:	af00      	add	r7, sp, #0
 800461e:	4603      	mov	r3, r0
 8004620:	71fb      	strb	r3, [r7, #7]
 8004622:	79fb      	ldrb	r3, [r7, #7]
 8004624:	f003 021f 	and.w	r2, r3, #31
 8004628:	4907      	ldr	r1, [pc, #28]	; (8004648 <NVIC_EnableIRQ+0x30>)
 800462a:	f997 3007 	ldrsb.w	r3, [r7, #7]
 800462e:	095b      	lsrs	r3, r3, #5
 8004630:	2001      	movs	r0, #1
 8004632:	fa00 f202 	lsl.w	r2, r0, r2
 8004636:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
 800463a:	bf00      	nop
 800463c:	370c      	adds	r7, #12
 800463e:	46bd      	mov	sp, r7
 8004640:	f85d 7b04 	ldr.w	r7, [sp], #4
 8004644:	4770      	bx	lr
 8004646:	bf00      	nop
 8004648:	e000e100 	.word	0xe000e100

0800464c <NVIC_SetPriority>:
 800464c:	b480      	push	{r7}
 800464e:	b083      	sub	sp, #12
 8004650:	af00      	add	r7, sp, #0
 8004652:	4603      	mov	r3, r0
 8004654:	6039      	str	r1, [r7, #0]
 8004656:	71fb      	strb	r3, [r7, #7]
 8004658:	f997 3007 	ldrsb.w	r3, [r7, #7]
 800465c:	2b00      	cmp	r3, #0
 800465e:	da0b      	bge.n	8004678 <NVIC_SetPriority+0x2c>
 8004660:	683b      	ldr	r3, [r7, #0]
 8004662:	b2da      	uxtb	r2, r3
 8004664:	490c      	ldr	r1, [pc, #48]	; (8004698 <NVIC_SetPriority+0x4c>)
 8004666:	79fb      	ldrb	r3, [r7, #7]
 8004668:	f003 030f 	and.w	r3, r3, #15
 800466c:	3b04      	subs	r3, #4
 800466e:	0112      	lsls	r2, r2, #4
 8004670:	b2d2      	uxtb	r2, r2
 8004672:	440b      	add	r3, r1
 8004674:	761a      	strb	r2, [r3, #24]
 8004676:	e009      	b.n	800468c <NVIC_SetPriority+0x40>
 8004678:	683b      	ldr	r3, [r7, #0]
 800467a:	b2da      	uxtb	r2, r3
 800467c:	4907      	ldr	r1, [pc, #28]	; (800469c <NVIC_SetPriority+0x50>)
 800467e:	f997 3007 	ldrsb.w	r3, [r7, #7]
 8004682:	0112      	lsls	r2, r2, #4
 8004684:	b2d2      	uxtb	r2, r2
 8004686:	440b      	add	r3, r1
 8004688:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 800468c:	bf00      	nop
 800468e:	370c      	adds	r7, #12
 8004690:	46bd      	mov	sp, r7
 8004692:	f85d 7b04 	ldr.w	r7, [sp], #4
 8004696:	4770      	bx	lr
 8004698:	e000ed00 	.word	0xe000ed00
 800469c:	e000e100 	.word	0xe000e100

080046a0 <LL_AHB1_GRP1_EnableClock>:
 80046a0:	b480      	push	{r7}
 80046a2:	b085      	sub	sp, #20
 80046a4:	af00      	add	r7, sp, #0
 80046a6:	6078      	str	r0, [r7, #4]
 80046a8:	4b08      	ldr	r3, [pc, #32]	; (80046cc <LL_AHB1_GRP1_EnableClock+0x2c>)
 80046aa:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 80046ac:	4907      	ldr	r1, [pc, #28]	; (80046cc <LL_AHB1_GRP1_EnableClock+0x2c>)
 80046ae:	687b      	ldr	r3, [r7, #4]
 80046b0:	4313      	orrs	r3, r2
 80046b2:	630b      	str	r3, [r1, #48]	; 0x30
 80046b4:	4b05      	ldr	r3, [pc, #20]	; (80046cc <LL_AHB1_GRP1_EnableClock+0x2c>)
 80046b6:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 80046b8:	687b      	ldr	r3, [r7, #4]
 80046ba:	4013      	ands	r3, r2
 80046bc:	60fb      	str	r3, [r7, #12]
 80046be:	68fb      	ldr	r3, [r7, #12]
 80046c0:	bf00      	nop
 80046c2:	3714      	adds	r7, #20
 80046c4:	46bd      	mov	sp, r7
 80046c6:	f85d 7b04 	ldr.w	r7, [sp], #4
 80046ca:	4770      	bx	lr
 80046cc:	40023800 	.word	0x40023800

080046d0 <LL_APB1_GRP1_EnableClock>:
 80046d0:	b480      	push	{r7}
 80046d2:	b085      	sub	sp, #20
 80046d4:	af00      	add	r7, sp, #0
 80046d6:	6078      	str	r0, [r7, #4]
 80046d8:	4b08      	ldr	r3, [pc, #32]	; (80046fc <LL_APB1_GRP1_EnableClock+0x2c>)
 80046da:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 80046dc:	4907      	ldr	r1, [pc, #28]	; (80046fc <LL_APB1_GRP1_EnableClock+0x2c>)
 80046de:	687b      	ldr	r3, [r7, #4]
 80046e0:	4313      	orrs	r3, r2
 80046e2:	640b      	str	r3, [r1, #64]	; 0x40
 80046e4:	4b05      	ldr	r3, [pc, #20]	; (80046fc <LL_APB1_GRP1_EnableClock+0x2c>)
 80046e6:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 80046e8:	687b      	ldr	r3, [r7, #4]
 80046ea:	4013      	ands	r3, r2
 80046ec:	60fb      	str	r3, [r7, #12]
 80046ee:	68fb      	ldr	r3, [r7, #12]
 80046f0:	bf00      	nop
 80046f2:	3714      	adds	r7, #20
 80046f4:	46bd      	mov	sp, r7
 80046f6:	f85d 7b04 	ldr.w	r7, [sp], #4
 80046fa:	4770      	bx	lr
 80046fc:	40023800 	.word	0x40023800

08004700 <LL_APB2_GRP1_EnableClock>:
 8004700:	b480      	push	{r7}
 8004702:	b085      	sub	sp, #20
 8004704:	af00      	add	r7, sp, #0
 8004706:	6078      	str	r0, [r7, #4]
 8004708:	4b08      	ldr	r3, [pc, #32]	; (800472c <LL_APB2_GRP1_EnableClock+0x2c>)
 800470a:	6c5a      	ldr	r2, [r3, #68]	; 0x44
 800470c:	4907      	ldr	r1, [pc, #28]	; (800472c <LL_APB2_GRP1_EnableClock+0x2c>)
 800470e:	687b      	ldr	r3, [r7, #4]
 8004710:	4313      	orrs	r3, r2
 8004712:	644b      	str	r3, [r1, #68]	; 0x44
 8004714:	4b05      	ldr	r3, [pc, #20]	; (800472c <LL_APB2_GRP1_EnableClock+0x2c>)
 8004716:	6c5a      	ldr	r2, [r3, #68]	; 0x44
 8004718:	687b      	ldr	r3, [r7, #4]
 800471a:	4013      	ands	r3, r2
 800471c:	60fb      	str	r3, [r7, #12]
 800471e:	68fb      	ldr	r3, [r7, #12]
 8004720:	bf00      	nop
 8004722:	3714      	adds	r7, #20
 8004724:	46bd      	mov	sp, r7
 8004726:	f85d 7b04 	ldr.w	r7, [sp], #4
 800472a:	4770      	bx	lr
 800472c:	40023800 	.word	0x40023800

08004730 <LL_TIM_EnableCounter>:
 8004730:	b480      	push	{r7}
 8004732:	b083      	sub	sp, #12
 8004734:	af00      	add	r7, sp, #0
 8004736:	6078      	str	r0, [r7, #4]
 8004738:	687b      	ldr	r3, [r7, #4]
 800473a:	681b      	ldr	r3, [r3, #0]
 800473c:	f043 0201 	orr.w	r2, r3, #1
 8004740:	687b      	ldr	r3, [r7, #4]
 8004742:	601a      	str	r2, [r3, #0]
 8004744:	bf00      	nop
 8004746:	370c      	adds	r7, #12
 8004748:	46bd      	mov	sp, r7
 800474a:	f85d 7b04 	ldr.w	r7, [sp], #4
 800474e:	4770      	bx	lr

08004750 <LL_TIM_SetCounterMode>:
 8004750:	b480      	push	{r7}
 8004752:	b083      	sub	sp, #12
 8004754:	af00      	add	r7, sp, #0
 8004756:	6078      	str	r0, [r7, #4]
 8004758:	6039      	str	r1, [r7, #0]
 800475a:	687b      	ldr	r3, [r7, #4]
 800475c:	681b      	ldr	r3, [r3, #0]
 800475e:	f023 0270 	bic.w	r2, r3, #112	; 0x70
 8004762:	683b      	ldr	r3, [r7, #0]
 8004764:	431a      	orrs	r2, r3
 8004766:	687b      	ldr	r3, [r7, #4]
 8004768:	601a      	str	r2, [r3, #0]
 800476a:	bf00      	nop
 800476c:	370c      	adds	r7, #12
 800476e:	46bd      	mov	sp, r7
 8004770:	f85d 7b04 	ldr.w	r7, [sp], #4
 8004774:	4770      	bx	lr

08004776 <LL_TIM_SetPrescaler>:
 8004776:	b480      	push	{r7}
 8004778:	b083      	sub	sp, #12
 800477a:	af00      	add	r7, sp, #0
 800477c:	6078      	str	r0, [r7, #4]
 800477e:	6039      	str	r1, [r7, #0]
 8004780:	687b      	ldr	r3, [r7, #4]
 8004782:	683a      	ldr	r2, [r7, #0]
 8004784:	629a      	str	r2, [r3, #40]	; 0x28
 8004786:	bf00      	nop
 8004788:	370c      	adds	r7, #12
 800478a:	46bd      	mov	sp, r7
 800478c:	f85d 7b04 	ldr.w	r7, [sp], #4
 8004790:	4770      	bx	lr

08004792 <LL_TIM_SetAutoReload>:
 8004792:	b480      	push	{r7}
 8004794:	b083      	sub	sp, #12
 8004796:	af00      	add	r7, sp, #0
 8004798:	6078      	str	r0, [r7, #4]
 800479a:	6039      	str	r1, [r7, #0]
 800479c:	687b      	ldr	r3, [r7, #4]
 800479e:	683a      	ldr	r2, [r7, #0]
 80047a0:	62da      	str	r2, [r3, #44]	; 0x2c
 80047a2:	bf00      	nop
 80047a4:	370c      	adds	r7, #12
 80047a6:	46bd      	mov	sp, r7
 80047a8:	f85d 7b04 	ldr.w	r7, [sp], #4
 80047ac:	4770      	bx	lr

080047ae <LL_TIM_CC_EnableChannel>:
 80047ae:	b480      	push	{r7}
 80047b0:	b083      	sub	sp, #12
 80047b2:	af00      	add	r7, sp, #0
 80047b4:	6078      	str	r0, [r7, #4]
 80047b6:	6039      	str	r1, [r7, #0]
 80047b8:	687b      	ldr	r3, [r7, #4]
 80047ba:	6a1a      	ldr	r2, [r3, #32]
 80047bc:	683b      	ldr	r3, [r7, #0]
 80047be:	431a      	orrs	r2, r3
 80047c0:	687b      	ldr	r3, [r7, #4]
 80047c2:	621a      	str	r2, [r3, #32]
 80047c4:	bf00      	nop
 80047c6:	370c      	adds	r7, #12
 80047c8:	46bd      	mov	sp, r7
 80047ca:	f85d 7b04 	ldr.w	r7, [sp], #4
 80047ce:	4770      	bx	lr

080047d0 <LL_TIM_IC_Config>:
 80047d0:	b4b0      	push	{r4, r5, r7}
 80047d2:	b085      	sub	sp, #20
 80047d4:	af00      	add	r7, sp, #0
 80047d6:	60f8      	str	r0, [r7, #12]
 80047d8:	60b9      	str	r1, [r7, #8]
 80047da:	607a      	str	r2, [r7, #4]
 80047dc:	68bb      	ldr	r3, [r7, #8]
 80047de:	2b01      	cmp	r3, #1
 80047e0:	d01c      	beq.n	800481c <LL_TIM_IC_Config+0x4c>
 80047e2:	68bb      	ldr	r3, [r7, #8]
 80047e4:	2b04      	cmp	r3, #4
 80047e6:	d017      	beq.n	8004818 <LL_TIM_IC_Config+0x48>
 80047e8:	68bb      	ldr	r3, [r7, #8]
 80047ea:	2b10      	cmp	r3, #16
 80047ec:	d012      	beq.n	8004814 <LL_TIM_IC_Config+0x44>
 80047ee:	68bb      	ldr	r3, [r7, #8]
 80047f0:	2b40      	cmp	r3, #64	; 0x40
 80047f2:	d00d      	beq.n	8004810 <LL_TIM_IC_Config+0x40>
 80047f4:	68bb      	ldr	r3, [r7, #8]
 80047f6:	f5b3 7f80 	cmp.w	r3, #256	; 0x100
 80047fa:	d007      	beq.n	800480c <LL_TIM_IC_Config+0x3c>
 80047fc:	68bb      	ldr	r3, [r7, #8]
 80047fe:	f5b3 6f80 	cmp.w	r3, #1024	; 0x400
 8004802:	d101      	bne.n	8004808 <LL_TIM_IC_Config+0x38>
 8004804:	2305      	movs	r3, #5
 8004806:	e00a      	b.n	800481e <LL_TIM_IC_Config+0x4e>
 8004808:	2306      	movs	r3, #6
 800480a:	e008      	b.n	800481e <LL_TIM_IC_Config+0x4e>
 800480c:	2304      	movs	r3, #4
 800480e:	e006      	b.n	800481e <LL_TIM_IC_Config+0x4e>
 8004810:	2303      	movs	r3, #3
 8004812:	e004      	b.n	800481e <LL_TIM_IC_Config+0x4e>
 8004814:	2302      	movs	r3, #2
 8004816:	e002      	b.n	800481e <LL_TIM_IC_Config+0x4e>
 8004818:	2301      	movs	r3, #1
 800481a:	e000      	b.n	800481e <LL_TIM_IC_Config+0x4e>
 800481c:	2300      	movs	r3, #0
 800481e:	461d      	mov	r5, r3
 8004820:	68fb      	ldr	r3, [r7, #12]
 8004822:	3318      	adds	r3, #24
 8004824:	461a      	mov	r2, r3
 8004826:	4629      	mov	r1, r5
 8004828:	4b17      	ldr	r3, [pc, #92]	; (8004888 <LL_TIM_IC_Config+0xb8>)
 800482a:	5c5b      	ldrb	r3, [r3, r1]
 800482c:	4413      	add	r3, r2
 800482e:	461c      	mov	r4, r3
 8004830:	6822      	ldr	r2, [r4, #0]
 8004832:	4629      	mov	r1, r5
 8004834:	4b15      	ldr	r3, [pc, #84]	; (800488c <LL_TIM_IC_Config+0xbc>)
 8004836:	5c5b      	ldrb	r3, [r3, r1]
 8004838:	4619      	mov	r1, r3
 800483a:	23ff      	movs	r3, #255	; 0xff
 800483c:	408b      	lsls	r3, r1
 800483e:	43db      	mvns	r3, r3
 8004840:	401a      	ands	r2, r3
 8004842:	687b      	ldr	r3, [r7, #4]
 8004844:	0c1b      	lsrs	r3, r3, #16
 8004846:	b2db      	uxtb	r3, r3
 8004848:	4628      	mov	r0, r5
 800484a:	4910      	ldr	r1, [pc, #64]	; (800488c <LL_TIM_IC_Config+0xbc>)
 800484c:	5c09      	ldrb	r1, [r1, r0]
 800484e:	408b      	lsls	r3, r1
 8004850:	4313      	orrs	r3, r2
 8004852:	6023      	str	r3, [r4, #0]
 8004854:	68fb      	ldr	r3, [r7, #12]
 8004856:	6a1a      	ldr	r2, [r3, #32]
 8004858:	4629      	mov	r1, r5
 800485a:	4b0d      	ldr	r3, [pc, #52]	; (8004890 <LL_TIM_IC_Config+0xc0>)
 800485c:	5c5b      	ldrb	r3, [r3, r1]
 800485e:	4619      	mov	r1, r3
 8004860:	230a      	movs	r3, #10
 8004862:	408b      	lsls	r3, r1
 8004864:	43db      	mvns	r3, r3
 8004866:	401a      	ands	r2, r3
 8004868:	687b      	ldr	r3, [r7, #4]
 800486a:	f003 030a 	and.w	r3, r3, #10
 800486e:	4628      	mov	r0, r5
 8004870:	4907      	ldr	r1, [pc, #28]	; (8004890 <LL_TIM_IC_Config+0xc0>)
 8004872:	5c09      	ldrb	r1, [r1, r0]
 8004874:	408b      	lsls	r3, r1
 8004876:	431a      	orrs	r2, r3
 8004878:	68fb      	ldr	r3, [r7, #12]
 800487a:	621a      	str	r2, [r3, #32]
 800487c:	bf00      	nop
 800487e:	3714      	adds	r7, #20
 8004880:	46bd      	mov	sp, r7
 8004882:	bcb0      	pop	{r4, r5, r7}
 8004884:	4770      	bx	lr
 8004886:	bf00      	nop
 8004888:	0800b50c 	.word	0x0800b50c
 800488c:	0800b514 	.word	0x0800b514
 8004890:	0800b51c 	.word	0x0800b51c

08004894 <LL_TIM_SetEncoderMode>:
 8004894:	b480      	push	{r7}
 8004896:	b083      	sub	sp, #12
 8004898:	af00      	add	r7, sp, #0
 800489a:	6078      	str	r0, [r7, #4]
 800489c:	6039      	str	r1, [r7, #0]
 800489e:	687b      	ldr	r3, [r7, #4]
 80048a0:	689b      	ldr	r3, [r3, #8]
 80048a2:	f023 0207 	bic.w	r2, r3, #7
 80048a6:	683b      	ldr	r3, [r7, #0]
 80048a8:	431a      	orrs	r2, r3
 80048aa:	687b      	ldr	r3, [r7, #4]
 80048ac:	609a      	str	r2, [r3, #8]
 80048ae:	bf00      	nop
 80048b0:	370c      	adds	r7, #12
 80048b2:	46bd      	mov	sp, r7
 80048b4:	f85d 7b04 	ldr.w	r7, [sp], #4
 80048b8:	4770      	bx	lr

080048ba <LL_TIM_ClearFlag_UPDATE>:
 80048ba:	b480      	push	{r7}
 80048bc:	b083      	sub	sp, #12
 80048be:	af00      	add	r7, sp, #0
 80048c0:	6078      	str	r0, [r7, #4]
 80048c2:	687b      	ldr	r3, [r7, #4]
 80048c4:	f06f 0201 	mvn.w	r2, #1
 80048c8:	611a      	str	r2, [r3, #16]
 80048ca:	bf00      	nop
 80048cc:	370c      	adds	r7, #12
 80048ce:	46bd      	mov	sp, r7
 80048d0:	f85d 7b04 	ldr.w	r7, [sp], #4
 80048d4:	4770      	bx	lr

080048d6 <LL_TIM_IsActiveFlag_UPDATE>:
 80048d6:	b480      	push	{r7}
 80048d8:	b083      	sub	sp, #12
 80048da:	af00      	add	r7, sp, #0
 80048dc:	6078      	str	r0, [r7, #4]
 80048de:	687b      	ldr	r3, [r7, #4]
 80048e0:	691b      	ldr	r3, [r3, #16]
 80048e2:	f003 0301 	and.w	r3, r3, #1
 80048e6:	2b01      	cmp	r3, #1
 80048e8:	bf0c      	ite	eq
 80048ea:	2301      	moveq	r3, #1
 80048ec:	2300      	movne	r3, #0
 80048ee:	b2db      	uxtb	r3, r3
 80048f0:	4618      	mov	r0, r3
 80048f2:	370c      	adds	r7, #12
 80048f4:	46bd      	mov	sp, r7
 80048f6:	f85d 7b04 	ldr.w	r7, [sp], #4
 80048fa:	4770      	bx	lr

080048fc <LL_TIM_EnableIT_UPDATE>:
 80048fc:	b480      	push	{r7}
 80048fe:	b083      	sub	sp, #12
 8004900:	af00      	add	r7, sp, #0
 8004902:	6078      	str	r0, [r7, #4]
 8004904:	687b      	ldr	r3, [r7, #4]
 8004906:	68db      	ldr	r3, [r3, #12]
 8004908:	f043 0201 	orr.w	r2, r3, #1
 800490c:	687b      	ldr	r3, [r7, #4]
 800490e:	60da      	str	r2, [r3, #12]
 8004910:	bf00      	nop
 8004912:	370c      	adds	r7, #12
 8004914:	46bd      	mov	sp, r7
 8004916:	f85d 7b04 	ldr.w	r7, [sp], #4
 800491a:	4770      	bx	lr

0800491c <LL_GPIO_SetPinMode>:
 800491c:	b480      	push	{r7}
 800491e:	b089      	sub	sp, #36	; 0x24
 8004920:	af00      	add	r7, sp, #0
 8004922:	60f8      	str	r0, [r7, #12]
 8004924:	60b9      	str	r1, [r7, #8]
 8004926:	607a      	str	r2, [r7, #4]
 8004928:	68fb      	ldr	r3, [r7, #12]
 800492a:	681a      	ldr	r2, [r3, #0]
 800492c:	68bb      	ldr	r3, [r7, #8]
 800492e:	617b      	str	r3, [r7, #20]
 8004930:	697b      	ldr	r3, [r7, #20]
 8004932:	fa93 f3a3 	rbit	r3, r3
 8004936:	613b      	str	r3, [r7, #16]
 8004938:	693b      	ldr	r3, [r7, #16]
 800493a:	fab3 f383 	clz	r3, r3
 800493e:	005b      	lsls	r3, r3, #1
 8004940:	2103      	movs	r1, #3
 8004942:	fa01 f303 	lsl.w	r3, r1, r3
 8004946:	43db      	mvns	r3, r3
 8004948:	401a      	ands	r2, r3
 800494a:	68bb      	ldr	r3, [r7, #8]
 800494c:	61fb      	str	r3, [r7, #28]
 800494e:	69fb      	ldr	r3, [r7, #28]
 8004950:	fa93 f3a3 	rbit	r3, r3
 8004954:	61bb      	str	r3, [r7, #24]
 8004956:	69bb      	ldr	r3, [r7, #24]
 8004958:	fab3 f383 	clz	r3, r3
 800495c:	005b      	lsls	r3, r3, #1
 800495e:	6879      	ldr	r1, [r7, #4]
 8004960:	fa01 f303 	lsl.w	r3, r1, r3
 8004964:	431a      	orrs	r2, r3
 8004966:	68fb      	ldr	r3, [r7, #12]
 8004968:	601a      	str	r2, [r3, #0]
 800496a:	bf00      	nop
 800496c:	3724      	adds	r7, #36	; 0x24
 800496e:	46bd      	mov	sp, r7
 8004970:	f85d 7b04 	ldr.w	r7, [sp], #4
 8004974:	4770      	bx	lr

08004976 <LL_GPIO_SetPinOutputType>:
 8004976:	b480      	push	{r7}
 8004978:	b085      	sub	sp, #20
 800497a:	af00      	add	r7, sp, #0
 800497c:	60f8      	str	r0, [r7, #12]
 800497e:	60b9      	str	r1, [r7, #8]
 8004980:	607a      	str	r2, [r7, #4]
 8004982:	68fb      	ldr	r3, [r7, #12]
 8004984:	685a      	ldr	r2, [r3, #4]
 8004986:	68bb      	ldr	r3, [r7, #8]
 8004988:	43db      	mvns	r3, r3
 800498a:	401a      	ands	r2, r3
 800498c:	68bb      	ldr	r3, [r7, #8]
 800498e:	6879      	ldr	r1, [r7, #4]
 8004990:	fb01 f303 	mul.w	r3, r1, r3
 8004994:	431a      	orrs	r2, r3
 8004996:	68fb      	ldr	r3, [r7, #12]
 8004998:	605a      	str	r2, [r3, #4]
 800499a:	bf00      	nop
 800499c:	3714      	adds	r7, #20
 800499e:	46bd      	mov	sp, r7
 80049a0:	f85d 7b04 	ldr.w	r7, [sp], #4
 80049a4:	4770      	bx	lr

080049a6 <LL_GPIO_SetAFPin_0_7>:
 80049a6:	b480      	push	{r7}
 80049a8:	b089      	sub	sp, #36	; 0x24
 80049aa:	af00      	add	r7, sp, #0
 80049ac:	60f8      	str	r0, [r7, #12]
 80049ae:	60b9      	str	r1, [r7, #8]
 80049b0:	607a      	str	r2, [r7, #4]
 80049b2:	68fb      	ldr	r3, [r7, #12]
 80049b4:	6a1a      	ldr	r2, [r3, #32]
 80049b6:	68bb      	ldr	r3, [r7, #8]
 80049b8:	617b      	str	r3, [r7, #20]
 80049ba:	697b      	ldr	r3, [r7, #20]
 80049bc:	fa93 f3a3 	rbit	r3, r3
 80049c0:	613b      	str	r3, [r7, #16]
 80049c2:	693b      	ldr	r3, [r7, #16]
 80049c4:	fab3 f383 	clz	r3, r3
 80049c8:	009b      	lsls	r3, r3, #2
 80049ca:	210f      	movs	r1, #15
 80049cc:	fa01 f303 	lsl.w	r3, r1, r3
 80049d0:	43db      	mvns	r3, r3
 80049d2:	401a      	ands	r2, r3
 80049d4:	68bb      	ldr	r3, [r7, #8]
 80049d6:	61fb      	str	r3, [r7, #28]
 80049d8:	69fb      	ldr	r3, [r7, #28]
 80049da:	fa93 f3a3 	rbit	r3, r3
 80049de:	61bb      	str	r3, [r7, #24]
 80049e0:	69bb      	ldr	r3, [r7, #24]
 80049e2:	fab3 f383 	clz	r3, r3
 80049e6:	009b      	lsls	r3, r3, #2
 80049e8:	6879      	ldr	r1, [r7, #4]
 80049ea:	fa01 f303 	lsl.w	r3, r1, r3
 80049ee:	431a      	orrs	r2, r3
 80049f0:	68fb      	ldr	r3, [r7, #12]
 80049f2:	621a      	str	r2, [r3, #32]
 80049f4:	bf00      	nop
 80049f6:	3724      	adds	r7, #36	; 0x24
 80049f8:	46bd      	mov	sp, r7
 80049fa:	f85d 7b04 	ldr.w	r7, [sp], #4
 80049fe:	4770      	bx	lr

08004a00 <LL_GPIO_SetAFPin_8_15>:
 8004a00:	b480      	push	{r7}
 8004a02:	b089      	sub	sp, #36	; 0x24
 8004a04:	af00      	add	r7, sp, #0
 8004a06:	60f8      	str	r0, [r7, #12]
 8004a08:	60b9      	str	r1, [r7, #8]
 8004a0a:	607a      	str	r2, [r7, #4]
 8004a0c:	68fb      	ldr	r3, [r7, #12]
 8004a0e:	6a5a      	ldr	r2, [r3, #36]	; 0x24
 8004a10:	68bb      	ldr	r3, [r7, #8]
 8004a12:	0a1b      	lsrs	r3, r3, #8
 8004a14:	617b      	str	r3, [r7, #20]
 8004a16:	697b      	ldr	r3, [r7, #20]
 8004a18:	fa93 f3a3 	rbit	r3, r3
 8004a1c:	613b      	str	r3, [r7, #16]
 8004a1e:	693b      	ldr	r3, [r7, #16]
 8004a20:	fab3 f383 	clz	r3, r3
 8004a24:	009b      	lsls	r3, r3, #2
 8004a26:	210f      	movs	r1, #15
 8004a28:	fa01 f303 	lsl.w	r3, r1, r3
 8004a2c:	43db      	mvns	r3, r3
 8004a2e:	401a      	ands	r2, r3
 8004a30:	68bb      	ldr	r3, [r7, #8]
 8004a32:	0a1b      	lsrs	r3, r3, #8
 8004a34:	61fb      	str	r3, [r7, #28]
 8004a36:	69fb      	ldr	r3, [r7, #28]
 8004a38:	fa93 f3a3 	rbit	r3, r3
 8004a3c:	61bb      	str	r3, [r7, #24]
 8004a3e:	69bb      	ldr	r3, [r7, #24]
 8004a40:	fab3 f383 	clz	r3, r3
 8004a44:	009b      	lsls	r3, r3, #2
 8004a46:	6879      	ldr	r1, [r7, #4]
 8004a48:	fa01 f303 	lsl.w	r3, r1, r3
 8004a4c:	431a      	orrs	r2, r3
 8004a4e:	68fb      	ldr	r3, [r7, #12]
 8004a50:	625a      	str	r2, [r3, #36]	; 0x24
 8004a52:	bf00      	nop
 8004a54:	3724      	adds	r7, #36	; 0x24
 8004a56:	46bd      	mov	sp, r7
 8004a58:	f85d 7b04 	ldr.w	r7, [sp], #4
 8004a5c:	4770      	bx	lr
	...

08004a60 <normalize_angle>:
 8004a60:	b480      	push	{r7}
 8004a62:	b083      	sub	sp, #12
 8004a64:	af00      	add	r7, sp, #0
 8004a66:	ed87 0a01 	vstr	s0, [r7, #4]
 8004a6a:	edd7 7a01 	vldr	s15, [r7, #4]
 8004a6e:	ed9f 7a13 	vldr	s14, [pc, #76]	; 8004abc <normalize_angle+0x5c>
 8004a72:	eef4 7ac7 	vcmpe.f32	s15, s14
 8004a76:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8004a7a:	dd06      	ble.n	8004a8a <normalize_angle+0x2a>
 8004a7c:	edd7 7a01 	vldr	s15, [r7, #4]
 8004a80:	ed9f 7a0e 	vldr	s14, [pc, #56]	; 8004abc <normalize_angle+0x5c>
 8004a84:	ee77 7ac7 	vsub.f32	s15, s15, s14
 8004a88:	e011      	b.n	8004aae <normalize_angle+0x4e>
 8004a8a:	edd7 7a01 	vldr	s15, [r7, #4]
 8004a8e:	ed9f 7a0c 	vldr	s14, [pc, #48]	; 8004ac0 <normalize_angle+0x60>
 8004a92:	eef4 7ac7 	vcmpe.f32	s15, s14
 8004a96:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8004a9a:	d506      	bpl.n	8004aaa <normalize_angle+0x4a>
 8004a9c:	edd7 7a01 	vldr	s15, [r7, #4]
 8004aa0:	ed9f 7a06 	vldr	s14, [pc, #24]	; 8004abc <normalize_angle+0x5c>
 8004aa4:	ee77 7a87 	vadd.f32	s15, s15, s14
 8004aa8:	e001      	b.n	8004aae <normalize_angle+0x4e>
 8004aaa:	edd7 7a01 	vldr	s15, [r7, #4]
 8004aae:	eeb0 0a67 	vmov.f32	s0, s15
 8004ab2:	370c      	adds	r7, #12
 8004ab4:	46bd      	mov	sp, r7
 8004ab6:	f85d 7b04 	ldr.w	r7, [sp], #4
 8004aba:	4770      	bx	lr
 8004abc:	40c90fdb 	.word	0x40c90fdb
 8004ac0:	c0c90fdb 	.word	0xc0c90fdb

08004ac4 <odom_hw_config>:
 8004ac4:	b580      	push	{r7, lr}
 8004ac6:	b082      	sub	sp, #8
 8004ac8:	af00      	add	r7, sp, #0
 8004aca:	6078      	str	r0, [r7, #4]
 8004acc:	2001      	movs	r0, #1
 8004ace:	f7ff fde7 	bl	80046a0 <LL_AHB1_GRP1_EnableClock>
 8004ad2:	2001      	movs	r0, #1
 8004ad4:	f7ff fe14 	bl	8004700 <LL_APB2_GRP1_EnableClock>
 8004ad8:	2001      	movs	r0, #1
 8004ada:	f7ff fdf9 	bl	80046d0 <LL_APB1_GRP1_EnableClock>
 8004ade:	2002      	movs	r0, #2
 8004ae0:	f7ff fdf6 	bl	80046d0 <LL_APB1_GRP1_EnableClock>
 8004ae4:	2010      	movs	r0, #16
 8004ae6:	f7ff fdf3 	bl	80046d0 <LL_APB1_GRP1_EnableClock>
 8004aea:	2202      	movs	r2, #2
 8004aec:	2102      	movs	r1, #2
 8004aee:	4872      	ldr	r0, [pc, #456]	; (8004cb8 <odom_hw_config+0x1f4>)
 8004af0:	f7ff ff14 	bl	800491c <LL_GPIO_SetPinMode>
 8004af4:	2201      	movs	r2, #1
 8004af6:	2102      	movs	r1, #2
 8004af8:	486f      	ldr	r0, [pc, #444]	; (8004cb8 <odom_hw_config+0x1f4>)
 8004afa:	f7ff ff54 	bl	80049a6 <LL_GPIO_SetAFPin_0_7>
 8004afe:	2200      	movs	r2, #0
 8004b00:	2102      	movs	r1, #2
 8004b02:	486d      	ldr	r0, [pc, #436]	; (8004cb8 <odom_hw_config+0x1f4>)
 8004b04:	f7ff ff37 	bl	8004976 <LL_GPIO_SetPinOutputType>
 8004b08:	2202      	movs	r2, #2
 8004b0a:	2101      	movs	r1, #1
 8004b0c:	486a      	ldr	r0, [pc, #424]	; (8004cb8 <odom_hw_config+0x1f4>)
 8004b0e:	f7ff ff05 	bl	800491c <LL_GPIO_SetPinMode>
 8004b12:	2201      	movs	r2, #1
 8004b14:	2101      	movs	r1, #1
 8004b16:	4868      	ldr	r0, [pc, #416]	; (8004cb8 <odom_hw_config+0x1f4>)
 8004b18:	f7ff ff72 	bl	8004a00 <LL_GPIO_SetAFPin_8_15>
 8004b1c:	2200      	movs	r2, #0
 8004b1e:	2101      	movs	r1, #1
 8004b20:	4865      	ldr	r0, [pc, #404]	; (8004cb8 <odom_hw_config+0x1f4>)
 8004b22:	f7ff ff28 	bl	8004976 <LL_GPIO_SetPinOutputType>
 8004b26:	2202      	movs	r2, #2
 8004b28:	2180      	movs	r1, #128	; 0x80
 8004b2a:	4863      	ldr	r0, [pc, #396]	; (8004cb8 <odom_hw_config+0x1f4>)
 8004b2c:	f7ff fef6 	bl	800491c <LL_GPIO_SetPinMode>
 8004b30:	2202      	movs	r2, #2
 8004b32:	2180      	movs	r1, #128	; 0x80
 8004b34:	4860      	ldr	r0, [pc, #384]	; (8004cb8 <odom_hw_config+0x1f4>)
 8004b36:	f7ff ff36 	bl	80049a6 <LL_GPIO_SetAFPin_0_7>
 8004b3a:	2200      	movs	r2, #0
 8004b3c:	2180      	movs	r1, #128	; 0x80
 8004b3e:	485e      	ldr	r0, [pc, #376]	; (8004cb8 <odom_hw_config+0x1f4>)
 8004b40:	f7ff ff19 	bl	8004976 <LL_GPIO_SetPinOutputType>
 8004b44:	2202      	movs	r2, #2
 8004b46:	2140      	movs	r1, #64	; 0x40
 8004b48:	485b      	ldr	r0, [pc, #364]	; (8004cb8 <odom_hw_config+0x1f4>)
 8004b4a:	f7ff fee7 	bl	800491c <LL_GPIO_SetPinMode>
 8004b4e:	2202      	movs	r2, #2
 8004b50:	2140      	movs	r1, #64	; 0x40
 8004b52:	4859      	ldr	r0, [pc, #356]	; (8004cb8 <odom_hw_config+0x1f4>)
 8004b54:	f7ff ff27 	bl	80049a6 <LL_GPIO_SetAFPin_0_7>
 8004b58:	2200      	movs	r2, #0
 8004b5a:	2140      	movs	r1, #64	; 0x40
 8004b5c:	4856      	ldr	r0, [pc, #344]	; (8004cb8 <odom_hw_config+0x1f4>)
 8004b5e:	f7ff ff0a 	bl	8004976 <LL_GPIO_SetPinOutputType>
 8004b62:	2202      	movs	r2, #2
 8004b64:	f44f 7100 	mov.w	r1, #512	; 0x200
 8004b68:	4853      	ldr	r0, [pc, #332]	; (8004cb8 <odom_hw_config+0x1f4>)
 8004b6a:	f7ff fed7 	bl	800491c <LL_GPIO_SetPinMode>
 8004b6e:	2201      	movs	r2, #1
 8004b70:	f44f 7100 	mov.w	r1, #512	; 0x200
 8004b74:	4850      	ldr	r0, [pc, #320]	; (8004cb8 <odom_hw_config+0x1f4>)
 8004b76:	f7ff ff43 	bl	8004a00 <LL_GPIO_SetAFPin_8_15>
 8004b7a:	2200      	movs	r2, #0
 8004b7c:	f44f 7100 	mov.w	r1, #512	; 0x200
 8004b80:	484d      	ldr	r0, [pc, #308]	; (8004cb8 <odom_hw_config+0x1f4>)
 8004b82:	f7ff fef8 	bl	8004976 <LL_GPIO_SetPinOutputType>
 8004b86:	2202      	movs	r2, #2
 8004b88:	f44f 7180 	mov.w	r1, #256	; 0x100
 8004b8c:	484a      	ldr	r0, [pc, #296]	; (8004cb8 <odom_hw_config+0x1f4>)
 8004b8e:	f7ff fec5 	bl	800491c <LL_GPIO_SetPinMode>
 8004b92:	2201      	movs	r2, #1
 8004b94:	f44f 7180 	mov.w	r1, #256	; 0x100
 8004b98:	4847      	ldr	r0, [pc, #284]	; (8004cb8 <odom_hw_config+0x1f4>)
 8004b9a:	f7ff ff31 	bl	8004a00 <LL_GPIO_SetAFPin_8_15>
 8004b9e:	2200      	movs	r2, #0
 8004ba0:	f44f 7180 	mov.w	r1, #256	; 0x100
 8004ba4:	4844      	ldr	r0, [pc, #272]	; (8004cb8 <odom_hw_config+0x1f4>)
 8004ba6:	f7ff fee6 	bl	8004976 <LL_GPIO_SetPinOutputType>
 8004baa:	2111      	movs	r1, #17
 8004bac:	f04f 4080 	mov.w	r0, #1073741824	; 0x40000000
 8004bb0:	f7ff fdfd 	bl	80047ae <LL_TIM_CC_EnableChannel>
 8004bb4:	f44f 3280 	mov.w	r2, #65536	; 0x10000
 8004bb8:	2101      	movs	r1, #1
 8004bba:	f04f 4080 	mov.w	r0, #1073741824	; 0x40000000
 8004bbe:	f7ff fe07 	bl	80047d0 <LL_TIM_IC_Config>
 8004bc2:	f44f 3280 	mov.w	r2, #65536	; 0x10000
 8004bc6:	2110      	movs	r1, #16
 8004bc8:	f04f 4080 	mov.w	r0, #1073741824	; 0x40000000
 8004bcc:	f7ff fe00 	bl	80047d0 <LL_TIM_IC_Config>
 8004bd0:	f64f 71ff 	movw	r1, #65535	; 0xffff
 8004bd4:	f04f 4080 	mov.w	r0, #1073741824	; 0x40000000
 8004bd8:	f7ff fddb 	bl	8004792 <LL_TIM_SetAutoReload>
 8004bdc:	2103      	movs	r1, #3
 8004bde:	f04f 4080 	mov.w	r0, #1073741824	; 0x40000000
 8004be2:	f7ff fe57 	bl	8004894 <LL_TIM_SetEncoderMode>
 8004be6:	687b      	ldr	r3, [r7, #4]
 8004be8:	6b9b      	ldr	r3, [r3, #56]	; 0x38
 8004bea:	f247 5230 	movw	r2, #30000	; 0x7530
 8004bee:	801a      	strh	r2, [r3, #0]
 8004bf0:	2111      	movs	r1, #17
 8004bf2:	4832      	ldr	r0, [pc, #200]	; (8004cbc <odom_hw_config+0x1f8>)
 8004bf4:	f7ff fddb 	bl	80047ae <LL_TIM_CC_EnableChannel>
 8004bf8:	f44f 3280 	mov.w	r2, #65536	; 0x10000
 8004bfc:	2101      	movs	r1, #1
 8004bfe:	482f      	ldr	r0, [pc, #188]	; (8004cbc <odom_hw_config+0x1f8>)
 8004c00:	f7ff fde6 	bl	80047d0 <LL_TIM_IC_Config>
 8004c04:	f44f 3280 	mov.w	r2, #65536	; 0x10000
 8004c08:	2110      	movs	r1, #16
 8004c0a:	482c      	ldr	r0, [pc, #176]	; (8004cbc <odom_hw_config+0x1f8>)
 8004c0c:	f7ff fde0 	bl	80047d0 <LL_TIM_IC_Config>
 8004c10:	f64f 71ff 	movw	r1, #65535	; 0xffff
 8004c14:	4829      	ldr	r0, [pc, #164]	; (8004cbc <odom_hw_config+0x1f8>)
 8004c16:	f7ff fdbc 	bl	8004792 <LL_TIM_SetAutoReload>
 8004c1a:	2103      	movs	r1, #3
 8004c1c:	4827      	ldr	r0, [pc, #156]	; (8004cbc <odom_hw_config+0x1f8>)
 8004c1e:	f7ff fe39 	bl	8004894 <LL_TIM_SetEncoderMode>
 8004c22:	687b      	ldr	r3, [r7, #4]
 8004c24:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
 8004c26:	f247 5230 	movw	r2, #30000	; 0x7530
 8004c2a:	801a      	strh	r2, [r3, #0]
 8004c2c:	2111      	movs	r1, #17
 8004c2e:	4824      	ldr	r0, [pc, #144]	; (8004cc0 <odom_hw_config+0x1fc>)
 8004c30:	f7ff fdbd 	bl	80047ae <LL_TIM_CC_EnableChannel>
 8004c34:	f44f 3280 	mov.w	r2, #65536	; 0x10000
 8004c38:	2101      	movs	r1, #1
 8004c3a:	4821      	ldr	r0, [pc, #132]	; (8004cc0 <odom_hw_config+0x1fc>)
 8004c3c:	f7ff fdc8 	bl	80047d0 <LL_TIM_IC_Config>
 8004c40:	f44f 3280 	mov.w	r2, #65536	; 0x10000
 8004c44:	2110      	movs	r1, #16
 8004c46:	481e      	ldr	r0, [pc, #120]	; (8004cc0 <odom_hw_config+0x1fc>)
 8004c48:	f7ff fdc2 	bl	80047d0 <LL_TIM_IC_Config>
 8004c4c:	f64f 71ff 	movw	r1, #65535	; 0xffff
 8004c50:	481b      	ldr	r0, [pc, #108]	; (8004cc0 <odom_hw_config+0x1fc>)
 8004c52:	f7ff fd9e 	bl	8004792 <LL_TIM_SetAutoReload>
 8004c56:	2103      	movs	r1, #3
 8004c58:	4819      	ldr	r0, [pc, #100]	; (8004cc0 <odom_hw_config+0x1fc>)
 8004c5a:	f7ff fe1b 	bl	8004894 <LL_TIM_SetEncoderMode>
 8004c5e:	687b      	ldr	r3, [r7, #4]
 8004c60:	6c1b      	ldr	r3, [r3, #64]	; 0x40
 8004c62:	f247 5230 	movw	r2, #30000	; 0x7530
 8004c66:	801a      	strh	r2, [r3, #0]
 8004c68:	f24a 410f 	movw	r1, #41999	; 0xa40f
 8004c6c:	4815      	ldr	r0, [pc, #84]	; (8004cc4 <odom_hw_config+0x200>)
 8004c6e:	f7ff fd90 	bl	8004792 <LL_TIM_SetAutoReload>
 8004c72:	2113      	movs	r1, #19
 8004c74:	4813      	ldr	r0, [pc, #76]	; (8004cc4 <odom_hw_config+0x200>)
 8004c76:	f7ff fd7e 	bl	8004776 <LL_TIM_SetPrescaler>
 8004c7a:	2100      	movs	r1, #0
 8004c7c:	4811      	ldr	r0, [pc, #68]	; (8004cc4 <odom_hw_config+0x200>)
 8004c7e:	f7ff fd67 	bl	8004750 <LL_TIM_SetCounterMode>
 8004c82:	4810      	ldr	r0, [pc, #64]	; (8004cc4 <odom_hw_config+0x200>)
 8004c84:	f7ff fe3a 	bl	80048fc <LL_TIM_EnableIT_UPDATE>
 8004c88:	2107      	movs	r1, #7
 8004c8a:	2036      	movs	r0, #54	; 0x36
 8004c8c:	f7ff fcde 	bl	800464c <NVIC_SetPriority>
 8004c90:	2036      	movs	r0, #54	; 0x36
 8004c92:	f7ff fcc1 	bl	8004618 <NVIC_EnableIRQ>
 8004c96:	f04f 4080 	mov.w	r0, #1073741824	; 0x40000000
 8004c9a:	f7ff fd49 	bl	8004730 <LL_TIM_EnableCounter>
 8004c9e:	4807      	ldr	r0, [pc, #28]	; (8004cbc <odom_hw_config+0x1f8>)
 8004ca0:	f7ff fd46 	bl	8004730 <LL_TIM_EnableCounter>
 8004ca4:	4806      	ldr	r0, [pc, #24]	; (8004cc0 <odom_hw_config+0x1fc>)
 8004ca6:	f7ff fd43 	bl	8004730 <LL_TIM_EnableCounter>
 8004caa:	4806      	ldr	r0, [pc, #24]	; (8004cc4 <odom_hw_config+0x200>)
 8004cac:	f7ff fd40 	bl	8004730 <LL_TIM_EnableCounter>
 8004cb0:	bf00      	nop
 8004cb2:	3708      	adds	r7, #8
 8004cb4:	46bd      	mov	sp, r7
 8004cb6:	bd80      	pop	{r7, pc}
 8004cb8:	40020000 	.word	0x40020000
 8004cbc:	40000400 	.word	0x40000400
 8004cc0:	40010000 	.word	0x40010000
 8004cc4:	40001000 	.word	0x40001000

08004cc8 <odom_calc_wheels_speeds>:
 8004cc8:	b480      	push	{r7}
 8004cca:	b085      	sub	sp, #20
 8004ccc:	af00      	add	r7, sp, #0
 8004cce:	6078      	str	r0, [r7, #4]
 8004cd0:	2300      	movs	r3, #0
 8004cd2:	60fb      	str	r3, [r7, #12]
 8004cd4:	2300      	movs	r3, #0
 8004cd6:	60fb      	str	r3, [r7, #12]
 8004cd8:	e039      	b.n	8004d4e <odom_calc_wheels_speeds+0x86>
 8004cda:	687b      	ldr	r3, [r7, #4]
 8004cdc:	68fa      	ldr	r2, [r7, #12]
 8004cde:	320e      	adds	r2, #14
 8004ce0:	f853 3022 	ldr.w	r3, [r3, r2, lsl #2]
 8004ce4:	881b      	ldrh	r3, [r3, #0]
 8004ce6:	f5a3 43ea 	sub.w	r3, r3, #29952	; 0x7500
 8004cea:	3b30      	subs	r3, #48	; 0x30
 8004cec:	b29b      	uxth	r3, r3
 8004cee:	b219      	sxth	r1, r3
 8004cf0:	687a      	ldr	r2, [r7, #4]
 8004cf2:	68fb      	ldr	r3, [r7, #12]
 8004cf4:	3320      	adds	r3, #32
 8004cf6:	005b      	lsls	r3, r3, #1
 8004cf8:	4413      	add	r3, r2
 8004cfa:	460a      	mov	r2, r1
 8004cfc:	809a      	strh	r2, [r3, #4]
 8004cfe:	687b      	ldr	r3, [r7, #4]
 8004d00:	68fa      	ldr	r2, [r7, #12]
 8004d02:	320e      	adds	r2, #14
 8004d04:	f853 3022 	ldr.w	r3, [r3, r2, lsl #2]
 8004d08:	f247 5230 	movw	r2, #30000	; 0x7530
 8004d0c:	801a      	strh	r2, [r3, #0]
 8004d0e:	687a      	ldr	r2, [r7, #4]
 8004d10:	68fb      	ldr	r3, [r7, #12]
 8004d12:	3320      	adds	r3, #32
 8004d14:	005b      	lsls	r3, r3, #1
 8004d16:	4413      	add	r3, r2
 8004d18:	f9b3 3004 	ldrsh.w	r3, [r3, #4]
 8004d1c:	ee07 3a90 	vmov	s15, r3
 8004d20:	eef8 7ae7 	vcvt.f32.s32	s15, s15
 8004d24:	ee77 7aa7 	vadd.f32	s15, s15, s15
 8004d28:	ed9f 7a0d 	vldr	s14, [pc, #52]	; 8004d60 <odom_calc_wheels_speeds+0x98>
 8004d2c:	ee27 7a87 	vmul.f32	s14, s15, s14
 8004d30:	eddf 6a0c 	vldr	s13, [pc, #48]	; 8004d64 <odom_calc_wheels_speeds+0x9c>
 8004d34:	eec7 7a26 	vdiv.f32	s15, s14, s13
 8004d38:	687a      	ldr	r2, [r7, #4]
 8004d3a:	68fb      	ldr	r3, [r7, #12]
 8004d3c:	330a      	adds	r3, #10
 8004d3e:	009b      	lsls	r3, r3, #2
 8004d40:	4413      	add	r3, r2
 8004d42:	3304      	adds	r3, #4
 8004d44:	edc3 7a00 	vstr	s15, [r3]
 8004d48:	68fb      	ldr	r3, [r7, #12]
 8004d4a:	3301      	adds	r3, #1
 8004d4c:	60fb      	str	r3, [r7, #12]
 8004d4e:	68fb      	ldr	r3, [r7, #12]
 8004d50:	2b02      	cmp	r3, #2
 8004d52:	ddc2      	ble.n	8004cda <odom_calc_wheels_speeds+0x12>
 8004d54:	bf00      	nop
 8004d56:	3714      	adds	r7, #20
 8004d58:	46bd      	mov	sp, r7
 8004d5a:	f85d 7b04 	ldr.w	r7, [sp], #4
 8004d5e:	4770      	bx	lr
 8004d60:	40490fdb 	.word	0x40490fdb
 8004d64:	47e00000 	.word	0x47e00000

08004d68 <odom_calc_robot_speed>:
 8004d68:	b580      	push	{r7, lr}
 8004d6a:	b082      	sub	sp, #8
 8004d6c:	af00      	add	r7, sp, #0
 8004d6e:	6078      	str	r0, [r7, #4]
 8004d70:	687b      	ldr	r3, [r7, #4]
 8004d72:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 8004d74:	4a12      	ldr	r2, [pc, #72]	; (8004dc0 <odom_calc_robot_speed+0x58>)
 8004d76:	6013      	str	r3, [r2, #0]
 8004d78:	687b      	ldr	r3, [r7, #4]
 8004d7a:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8004d7c:	4a10      	ldr	r2, [pc, #64]	; (8004dc0 <odom_calc_robot_speed+0x58>)
 8004d7e:	6053      	str	r3, [r2, #4]
 8004d80:	687b      	ldr	r3, [r7, #4]
 8004d82:	6b5b      	ldr	r3, [r3, #52]	; 0x34
 8004d84:	4a0e      	ldr	r2, [pc, #56]	; (8004dc0 <odom_calc_robot_speed+0x58>)
 8004d86:	6093      	str	r3, [r2, #8]
 8004d88:	4b0e      	ldr	r3, [pc, #56]	; (8004dc4 <odom_calc_robot_speed+0x5c>)
 8004d8a:	2203      	movs	r2, #3
 8004d8c:	2103      	movs	r1, #3
 8004d8e:	480e      	ldr	r0, [pc, #56]	; (8004dc8 <odom_calc_robot_speed+0x60>)
 8004d90:	f003 fdbb 	bl	800890a <arm_mat_init_f32>
 8004d94:	4b0a      	ldr	r3, [pc, #40]	; (8004dc0 <odom_calc_robot_speed+0x58>)
 8004d96:	2201      	movs	r2, #1
 8004d98:	2103      	movs	r1, #3
 8004d9a:	480c      	ldr	r0, [pc, #48]	; (8004dcc <odom_calc_robot_speed+0x64>)
 8004d9c:	f003 fdb5 	bl	800890a <arm_mat_init_f32>
 8004da0:	687b      	ldr	r3, [r7, #4]
 8004da2:	3320      	adds	r3, #32
 8004da4:	2201      	movs	r2, #1
 8004da6:	2103      	movs	r1, #3
 8004da8:	4809      	ldr	r0, [pc, #36]	; (8004dd0 <odom_calc_robot_speed+0x68>)
 8004daa:	f003 fdae 	bl	800890a <arm_mat_init_f32>
 8004dae:	4a08      	ldr	r2, [pc, #32]	; (8004dd0 <odom_calc_robot_speed+0x68>)
 8004db0:	4906      	ldr	r1, [pc, #24]	; (8004dcc <odom_calc_robot_speed+0x64>)
 8004db2:	4805      	ldr	r0, [pc, #20]	; (8004dc8 <odom_calc_robot_speed+0x60>)
 8004db4:	f003 fb28 	bl	8008408 <arm_mat_mult_f32>
 8004db8:	bf00      	nop
 8004dba:	3708      	adds	r7, #8
 8004dbc:	46bd      	mov	sp, r7
 8004dbe:	bd80      	pop	{r7, pc}
 8004dc0:	20000b88 	.word	0x20000b88
 8004dc4:	20000054 	.word	0x20000054
 8004dc8:	20000b94 	.word	0x20000b94
 8004dcc:	20000b9c 	.word	0x20000b9c
 8004dd0:	20000ba4 	.word	0x20000ba4

08004dd4 <odom_calc_glob_params>:
 8004dd4:	b580      	push	{r7, lr}
 8004dd6:	b088      	sub	sp, #32
 8004dd8:	af00      	add	r7, sp, #0
 8004dda:	6078      	str	r0, [r7, #4]
 8004ddc:	687b      	ldr	r3, [r7, #4]
 8004dde:	ed93 7a04 	vldr	s14, [r3, #16]
 8004de2:	687b      	ldr	r3, [r7, #4]
 8004de4:	edd3 7a0a 	vldr	s15, [r3, #40]	; 0x28
 8004de8:	ee77 7a27 	vadd.f32	s15, s14, s15
 8004dec:	edc7 7a07 	vstr	s15, [r7, #28]
 8004df0:	ed97 0a07 	vldr	s0, [r7, #28]
 8004df4:	f7ff fe34 	bl	8004a60 <normalize_angle>
 8004df8:	ed87 0a07 	vstr	s0, [r7, #28]
 8004dfc:	ed97 0a07 	vldr	s0, [r7, #28]
 8004e00:	f005 fb82 	bl	800a508 <cosf>
 8004e04:	eef0 7a40 	vmov.f32	s15, s0
 8004e08:	edc7 7a03 	vstr	s15, [r7, #12]
 8004e0c:	ed97 0a07 	vldr	s0, [r7, #28]
 8004e10:	f005 fbc2 	bl	800a598 <sinf>
 8004e14:	eef0 7a40 	vmov.f32	s15, s0
 8004e18:	eef1 7a67 	vneg.f32	s15, s15
 8004e1c:	edc7 7a04 	vstr	s15, [r7, #16]
 8004e20:	ed97 0a07 	vldr	s0, [r7, #28]
 8004e24:	f005 fbb8 	bl	800a598 <sinf>
 8004e28:	eef0 7a40 	vmov.f32	s15, s0
 8004e2c:	edc7 7a05 	vstr	s15, [r7, #20]
 8004e30:	ed97 0a07 	vldr	s0, [r7, #28]
 8004e34:	f005 fb68 	bl	800a508 <cosf>
 8004e38:	eef0 7a40 	vmov.f32	s15, s0
 8004e3c:	edc7 7a06 	vstr	s15, [r7, #24]
 8004e40:	f107 030c 	add.w	r3, r7, #12
 8004e44:	2202      	movs	r2, #2
 8004e46:	2102      	movs	r1, #2
 8004e48:	481b      	ldr	r0, [pc, #108]	; (8004eb8 <odom_calc_glob_params+0xe4>)
 8004e4a:	f003 fd5e 	bl	800890a <arm_mat_init_f32>
 8004e4e:	687b      	ldr	r3, [r7, #4]
 8004e50:	3314      	adds	r3, #20
 8004e52:	2201      	movs	r2, #1
 8004e54:	2102      	movs	r1, #2
 8004e56:	4819      	ldr	r0, [pc, #100]	; (8004ebc <odom_calc_glob_params+0xe8>)
 8004e58:	f003 fd57 	bl	800890a <arm_mat_init_f32>
 8004e5c:	687b      	ldr	r3, [r7, #4]
 8004e5e:	3320      	adds	r3, #32
 8004e60:	2201      	movs	r2, #1
 8004e62:	2102      	movs	r1, #2
 8004e64:	4816      	ldr	r0, [pc, #88]	; (8004ec0 <odom_calc_glob_params+0xec>)
 8004e66:	f003 fd50 	bl	800890a <arm_mat_init_f32>
 8004e6a:	4a14      	ldr	r2, [pc, #80]	; (8004ebc <odom_calc_glob_params+0xe8>)
 8004e6c:	4914      	ldr	r1, [pc, #80]	; (8004ec0 <odom_calc_glob_params+0xec>)
 8004e6e:	4812      	ldr	r0, [pc, #72]	; (8004eb8 <odom_calc_glob_params+0xe4>)
 8004e70:	f003 faca 	bl	8008408 <arm_mat_mult_f32>
 8004e74:	687b      	ldr	r3, [r7, #4]
 8004e76:	6a9a      	ldr	r2, [r3, #40]	; 0x28
 8004e78:	687b      	ldr	r3, [r7, #4]
 8004e7a:	61da      	str	r2, [r3, #28]
 8004e7c:	687b      	ldr	r3, [r7, #4]
 8004e7e:	ed93 7a02 	vldr	s14, [r3, #8]
 8004e82:	687b      	ldr	r3, [r7, #4]
 8004e84:	edd3 7a05 	vldr	s15, [r3, #20]
 8004e88:	ee77 7a27 	vadd.f32	s15, s14, s15
 8004e8c:	687b      	ldr	r3, [r7, #4]
 8004e8e:	edc3 7a02 	vstr	s15, [r3, #8]
 8004e92:	687b      	ldr	r3, [r7, #4]
 8004e94:	ed93 7a03 	vldr	s14, [r3, #12]
 8004e98:	687b      	ldr	r3, [r7, #4]
 8004e9a:	edd3 7a06 	vldr	s15, [r3, #24]
 8004e9e:	ee77 7a27 	vadd.f32	s15, s14, s15
 8004ea2:	687b      	ldr	r3, [r7, #4]
 8004ea4:	edc3 7a03 	vstr	s15, [r3, #12]
 8004ea8:	687b      	ldr	r3, [r7, #4]
 8004eaa:	69fa      	ldr	r2, [r7, #28]
 8004eac:	611a      	str	r2, [r3, #16]
 8004eae:	bf00      	nop
 8004eb0:	3720      	adds	r7, #32
 8004eb2:	46bd      	mov	sp, r7
 8004eb4:	bd80      	pop	{r7, pc}
 8004eb6:	bf00      	nop
 8004eb8:	20000bac 	.word	0x20000bac
 8004ebc:	20000bb4 	.word	0x20000bb4
 8004ec0:	20000bbc 	.word	0x20000bbc

08004ec4 <odometry>:
 8004ec4:	b580      	push	{r7, lr}
 8004ec6:	b096      	sub	sp, #88	; 0x58
 8004ec8:	af00      	add	r7, sp, #0
 8004eca:	6078      	str	r0, [r7, #4]
 8004ecc:	f107 0308 	add.w	r3, r7, #8
 8004ed0:	2250      	movs	r2, #80	; 0x50
 8004ed2:	2100      	movs	r1, #0
 8004ed4:	4618      	mov	r0, r3
 8004ed6:	f003 fe00 	bl	8008ada <memset>
 8004eda:	4b14      	ldr	r3, [pc, #80]	; (8004f2c <odometry+0x68>)
 8004edc:	643b      	str	r3, [r7, #64]	; 0x40
 8004ede:	4b14      	ldr	r3, [pc, #80]	; (8004f30 <odometry+0x6c>)
 8004ee0:	647b      	str	r3, [r7, #68]	; 0x44
 8004ee2:	4b14      	ldr	r3, [pc, #80]	; (8004f34 <odometry+0x70>)
 8004ee4:	64bb      	str	r3, [r7, #72]	; 0x48
 8004ee6:	f001 fe57 	bl	8006b98 <xTaskGetCurrentTaskHandle>
 8004eea:	4603      	mov	r3, r0
 8004eec:	657b      	str	r3, [r7, #84]	; 0x54
 8004eee:	4a12      	ldr	r2, [pc, #72]	; (8004f38 <odometry+0x74>)
 8004ef0:	f107 0308 	add.w	r3, r7, #8
 8004ef4:	6013      	str	r3, [r2, #0]
 8004ef6:	f107 0308 	add.w	r3, r7, #8
 8004efa:	4618      	mov	r0, r3
 8004efc:	f7ff fde2 	bl	8004ac4 <odom_hw_config>
 8004f00:	f04f 31ff 	mov.w	r1, #4294967295	; 0xffffffff
 8004f04:	2001      	movs	r0, #1
 8004f06:	f002 f825 	bl	8006f54 <ulTaskNotifyTake>
 8004f0a:	f107 0308 	add.w	r3, r7, #8
 8004f0e:	4618      	mov	r0, r3
 8004f10:	f7ff feda 	bl	8004cc8 <odom_calc_wheels_speeds>
 8004f14:	f107 0308 	add.w	r3, r7, #8
 8004f18:	4618      	mov	r0, r3
 8004f1a:	f7ff ff25 	bl	8004d68 <odom_calc_robot_speed>
 8004f1e:	f107 0308 	add.w	r3, r7, #8
 8004f22:	4618      	mov	r0, r3
 8004f24:	f7ff ff56 	bl	8004dd4 <odom_calc_glob_params>
 8004f28:	e7ea      	b.n	8004f00 <odometry+0x3c>
 8004f2a:	bf00      	nop
 8004f2c:	40000024 	.word	0x40000024
 8004f30:	40000424 	.word	0x40000424
 8004f34:	40010024 	.word	0x40010024
 8004f38:	20000b84 	.word	0x20000b84

08004f3c <cmd_get_speed>:
 8004f3c:	b580      	push	{r7, lr}
 8004f3e:	b082      	sub	sp, #8
 8004f40:	af00      	add	r7, sp, #0
 8004f42:	6078      	str	r0, [r7, #4]
 8004f44:	4b0c      	ldr	r3, [pc, #48]	; (8004f78 <cmd_get_speed+0x3c>)
 8004f46:	681b      	ldr	r3, [r3, #0]
 8004f48:	2b00      	cmp	r3, #0
 8004f4a:	d009      	beq.n	8004f60 <cmd_get_speed+0x24>
 8004f4c:	4b0a      	ldr	r3, [pc, #40]	; (8004f78 <cmd_get_speed+0x3c>)
 8004f4e:	681b      	ldr	r3, [r3, #0]
 8004f50:	3320      	adds	r3, #32
 8004f52:	220c      	movs	r2, #12
 8004f54:	4619      	mov	r1, r3
 8004f56:	6878      	ldr	r0, [r7, #4]
 8004f58:	f003 fdb4 	bl	8008ac4 <memcpy>
 8004f5c:	230c      	movs	r3, #12
 8004f5e:	e006      	b.n	8004f6e <cmd_get_speed+0x32>
 8004f60:	bf00      	nop
 8004f62:	2203      	movs	r2, #3
 8004f64:	4905      	ldr	r1, [pc, #20]	; (8004f7c <cmd_get_speed+0x40>)
 8004f66:	6878      	ldr	r0, [r7, #4]
 8004f68:	f003 fdac 	bl	8008ac4 <memcpy>
 8004f6c:	2303      	movs	r3, #3
 8004f6e:	4618      	mov	r0, r3
 8004f70:	3708      	adds	r7, #8
 8004f72:	46bd      	mov	sp, r7
 8004f74:	bd80      	pop	{r7, pc}
 8004f76:	bf00      	nop
 8004f78:	20000b84 	.word	0x20000b84
 8004f7c:	0800b2c8 	.word	0x0800b2c8

08004f80 <cmd_set_coord>:
 8004f80:	b580      	push	{r7, lr}
 8004f82:	b084      	sub	sp, #16
 8004f84:	af00      	add	r7, sp, #0
 8004f86:	6078      	str	r0, [r7, #4]
 8004f88:	687b      	ldr	r3, [r7, #4]
 8004f8a:	60fb      	str	r3, [r7, #12]
 8004f8c:	4b1f      	ldr	r3, [pc, #124]	; (800500c <cmd_set_coord+0x8c>)
 8004f8e:	681b      	ldr	r3, [r3, #0]
 8004f90:	2b00      	cmp	r3, #0
 8004f92:	d030      	beq.n	8004ff6 <cmd_set_coord+0x76>
 8004f94:	4b1d      	ldr	r3, [pc, #116]	; (800500c <cmd_set_coord+0x8c>)
 8004f96:	681a      	ldr	r2, [r3, #0]
 8004f98:	68fb      	ldr	r3, [r7, #12]
 8004f9a:	7819      	ldrb	r1, [r3, #0]
 8004f9c:	7858      	ldrb	r0, [r3, #1]
 8004f9e:	0200      	lsls	r0, r0, #8
 8004fa0:	4301      	orrs	r1, r0
 8004fa2:	7898      	ldrb	r0, [r3, #2]
 8004fa4:	0400      	lsls	r0, r0, #16
 8004fa6:	4301      	orrs	r1, r0
 8004fa8:	78db      	ldrb	r3, [r3, #3]
 8004faa:	061b      	lsls	r3, r3, #24
 8004fac:	430b      	orrs	r3, r1
 8004fae:	6093      	str	r3, [r2, #8]
 8004fb0:	4b16      	ldr	r3, [pc, #88]	; (800500c <cmd_set_coord+0x8c>)
 8004fb2:	681a      	ldr	r2, [r3, #0]
 8004fb4:	68fb      	ldr	r3, [r7, #12]
 8004fb6:	7919      	ldrb	r1, [r3, #4]
 8004fb8:	7958      	ldrb	r0, [r3, #5]
 8004fba:	0200      	lsls	r0, r0, #8
 8004fbc:	4301      	orrs	r1, r0
 8004fbe:	7998      	ldrb	r0, [r3, #6]
 8004fc0:	0400      	lsls	r0, r0, #16
 8004fc2:	4301      	orrs	r1, r0
 8004fc4:	79db      	ldrb	r3, [r3, #7]
 8004fc6:	061b      	lsls	r3, r3, #24
 8004fc8:	430b      	orrs	r3, r1
 8004fca:	60d3      	str	r3, [r2, #12]
 8004fcc:	4b0f      	ldr	r3, [pc, #60]	; (800500c <cmd_set_coord+0x8c>)
 8004fce:	681a      	ldr	r2, [r3, #0]
 8004fd0:	68fb      	ldr	r3, [r7, #12]
 8004fd2:	7a19      	ldrb	r1, [r3, #8]
 8004fd4:	7a58      	ldrb	r0, [r3, #9]
 8004fd6:	0200      	lsls	r0, r0, #8
 8004fd8:	4301      	orrs	r1, r0
 8004fda:	7a98      	ldrb	r0, [r3, #10]
 8004fdc:	0400      	lsls	r0, r0, #16
 8004fde:	4301      	orrs	r1, r0
 8004fe0:	7adb      	ldrb	r3, [r3, #11]
 8004fe2:	061b      	lsls	r3, r3, #24
 8004fe4:	430b      	orrs	r3, r1
 8004fe6:	6113      	str	r3, [r2, #16]
 8004fe8:	2203      	movs	r2, #3
 8004fea:	4909      	ldr	r1, [pc, #36]	; (8005010 <cmd_set_coord+0x90>)
 8004fec:	6878      	ldr	r0, [r7, #4]
 8004fee:	f003 fd69 	bl	8008ac4 <memcpy>
 8004ff2:	2303      	movs	r3, #3
 8004ff4:	e006      	b.n	8005004 <cmd_set_coord+0x84>
 8004ff6:	bf00      	nop
 8004ff8:	2203      	movs	r2, #3
 8004ffa:	4906      	ldr	r1, [pc, #24]	; (8005014 <cmd_set_coord+0x94>)
 8004ffc:	6878      	ldr	r0, [r7, #4]
 8004ffe:	f003 fd61 	bl	8008ac4 <memcpy>
 8005002:	2303      	movs	r3, #3
 8005004:	4618      	mov	r0, r3
 8005006:	3710      	adds	r7, #16
 8005008:	46bd      	mov	sp, r7
 800500a:	bd80      	pop	{r7, pc}
 800500c:	20000b84 	.word	0x20000b84
 8005010:	0800b2cc 	.word	0x0800b2cc
 8005014:	0800b2c8 	.word	0x0800b2c8

08005018 <cmd_get_coord>:
 8005018:	b580      	push	{r7, lr}
 800501a:	b082      	sub	sp, #8
 800501c:	af00      	add	r7, sp, #0
 800501e:	6078      	str	r0, [r7, #4]
 8005020:	4b0c      	ldr	r3, [pc, #48]	; (8005054 <cmd_get_coord+0x3c>)
 8005022:	681b      	ldr	r3, [r3, #0]
 8005024:	2b00      	cmp	r3, #0
 8005026:	d009      	beq.n	800503c <cmd_get_coord+0x24>
 8005028:	4b0a      	ldr	r3, [pc, #40]	; (8005054 <cmd_get_coord+0x3c>)
 800502a:	681b      	ldr	r3, [r3, #0]
 800502c:	3308      	adds	r3, #8
 800502e:	220c      	movs	r2, #12
 8005030:	4619      	mov	r1, r3
 8005032:	6878      	ldr	r0, [r7, #4]
 8005034:	f003 fd46 	bl	8008ac4 <memcpy>
 8005038:	230c      	movs	r3, #12
 800503a:	e006      	b.n	800504a <cmd_get_coord+0x32>
 800503c:	bf00      	nop
 800503e:	2206      	movs	r2, #6
 8005040:	4905      	ldr	r1, [pc, #20]	; (8005058 <cmd_get_coord+0x40>)
 8005042:	6878      	ldr	r0, [r7, #4]
 8005044:	f003 fd3e 	bl	8008ac4 <memcpy>
 8005048:	2306      	movs	r3, #6
 800504a:	4618      	mov	r0, r3
 800504c:	3708      	adds	r7, #8
 800504e:	46bd      	mov	sp, r7
 8005050:	bd80      	pop	{r7, pc}
 8005052:	bf00      	nop
 8005054:	20000b84 	.word	0x20000b84
 8005058:	0800b2d0 	.word	0x0800b2d0

0800505c <cmd_get_wheel_speed>:
 800505c:	b580      	push	{r7, lr}
 800505e:	b082      	sub	sp, #8
 8005060:	af00      	add	r7, sp, #0
 8005062:	6078      	str	r0, [r7, #4]
 8005064:	4b0c      	ldr	r3, [pc, #48]	; (8005098 <cmd_get_wheel_speed+0x3c>)
 8005066:	681b      	ldr	r3, [r3, #0]
 8005068:	2b00      	cmp	r3, #0
 800506a:	d009      	beq.n	8005080 <cmd_get_wheel_speed+0x24>
 800506c:	4b0a      	ldr	r3, [pc, #40]	; (8005098 <cmd_get_wheel_speed+0x3c>)
 800506e:	681b      	ldr	r3, [r3, #0]
 8005070:	332c      	adds	r3, #44	; 0x2c
 8005072:	220c      	movs	r2, #12
 8005074:	4619      	mov	r1, r3
 8005076:	6878      	ldr	r0, [r7, #4]
 8005078:	f003 fd24 	bl	8008ac4 <memcpy>
 800507c:	230c      	movs	r3, #12
 800507e:	e006      	b.n	800508e <cmd_get_wheel_speed+0x32>
 8005080:	bf00      	nop
 8005082:	2203      	movs	r2, #3
 8005084:	4905      	ldr	r1, [pc, #20]	; (800509c <cmd_get_wheel_speed+0x40>)
 8005086:	6878      	ldr	r0, [r7, #4]
 8005088:	f003 fd1c 	bl	8008ac4 <memcpy>
 800508c:	2303      	movs	r3, #3
 800508e:	4618      	mov	r0, r3
 8005090:	3708      	adds	r7, #8
 8005092:	46bd      	mov	sp, r7
 8005094:	bd80      	pop	{r7, pc}
 8005096:	bf00      	nop
 8005098:	20000b84 	.word	0x20000b84
 800509c:	0800b2c8 	.word	0x0800b2c8

080050a0 <TIM6_DAC_IRQHandler>:
 80050a0:	b580      	push	{r7, lr}
 80050a2:	b082      	sub	sp, #8
 80050a4:	af00      	add	r7, sp, #0
 80050a6:	2300      	movs	r3, #0
 80050a8:	607b      	str	r3, [r7, #4]
 80050aa:	4819      	ldr	r0, [pc, #100]	; (8005110 <TIM6_DAC_IRQHandler+0x70>)
 80050ac:	f7ff fc13 	bl	80048d6 <LL_TIM_IsActiveFlag_UPDATE>
 80050b0:	4603      	mov	r3, r0
 80050b2:	2b00      	cmp	r3, #0
 80050b4:	d01c      	beq.n	80050f0 <TIM6_DAC_IRQHandler+0x50>
 80050b6:	4816      	ldr	r0, [pc, #88]	; (8005110 <TIM6_DAC_IRQHandler+0x70>)
 80050b8:	f7ff fbff 	bl	80048ba <LL_TIM_ClearFlag_UPDATE>
 80050bc:	4b15      	ldr	r3, [pc, #84]	; (8005114 <TIM6_DAC_IRQHandler+0x74>)
 80050be:	681a      	ldr	r2, [r3, #0]
 80050c0:	4b14      	ldr	r3, [pc, #80]	; (8005114 <TIM6_DAC_IRQHandler+0x74>)
 80050c2:	681b      	ldr	r3, [r3, #0]
 80050c4:	6812      	ldr	r2, [r2, #0]
 80050c6:	605a      	str	r2, [r3, #4]
 80050c8:	4b12      	ldr	r3, [pc, #72]	; (8005114 <TIM6_DAC_IRQHandler+0x74>)
 80050ca:	681b      	ldr	r3, [r3, #0]
 80050cc:	edd3 7a00 	vldr	s15, [r3]
 80050d0:	4b10      	ldr	r3, [pc, #64]	; (8005114 <TIM6_DAC_IRQHandler+0x74>)
 80050d2:	681b      	ldr	r3, [r3, #0]
 80050d4:	ed9f 7a10 	vldr	s14, [pc, #64]	; 8005118 <TIM6_DAC_IRQHandler+0x78>
 80050d8:	ee77 7a87 	vadd.f32	s15, s15, s14
 80050dc:	edc3 7a00 	vstr	s15, [r3]
 80050e0:	4b0c      	ldr	r3, [pc, #48]	; (8005114 <TIM6_DAC_IRQHandler+0x74>)
 80050e2:	681b      	ldr	r3, [r3, #0]
 80050e4:	6cdb      	ldr	r3, [r3, #76]	; 0x4c
 80050e6:	1d3a      	adds	r2, r7, #4
 80050e8:	4611      	mov	r1, r2
 80050ea:	4618      	mov	r0, r3
 80050ec:	f002 f83a 	bl	8007164 <vTaskNotifyGiveFromISR>
 80050f0:	687b      	ldr	r3, [r7, #4]
 80050f2:	2b00      	cmp	r3, #0
 80050f4:	d007      	beq.n	8005106 <TIM6_DAC_IRQHandler+0x66>
 80050f6:	4b09      	ldr	r3, [pc, #36]	; (800511c <TIM6_DAC_IRQHandler+0x7c>)
 80050f8:	f04f 5280 	mov.w	r2, #268435456	; 0x10000000
 80050fc:	601a      	str	r2, [r3, #0]
 80050fe:	f3bf 8f4f 	dsb	sy
 8005102:	f3bf 8f6f 	isb	sy
 8005106:	bf00      	nop
 8005108:	3708      	adds	r7, #8
 800510a:	46bd      	mov	sp, r7
 800510c:	bd80      	pop	{r7, pc}
 800510e:	bf00      	nop
 8005110:	40001000 	.word	0x40001000
 8005114:	20000b84 	.word	0x20000b84
 8005118:	3c23d70a 	.word	0x3c23d70a
 800511c:	e000ed04 	.word	0xe000ed04

08005120 <xQueueGenericReset>:
 8005120:	b580      	push	{r7, lr}
 8005122:	b084      	sub	sp, #16
 8005124:	af00      	add	r7, sp, #0
 8005126:	6078      	str	r0, [r7, #4]
 8005128:	6039      	str	r1, [r7, #0]
 800512a:	687b      	ldr	r3, [r7, #4]
 800512c:	60fb      	str	r3, [r7, #12]
 800512e:	68fb      	ldr	r3, [r7, #12]
 8005130:	2b00      	cmp	r3, #0
 8005132:	d109      	bne.n	8005148 <xQueueGenericReset+0x28>
 8005134:	f04f 0350 	mov.w	r3, #80	; 0x50
 8005138:	f383 8811 	msr	BASEPRI, r3
 800513c:	f3bf 8f6f 	isb	sy
 8005140:	f3bf 8f4f 	dsb	sy
 8005144:	60bb      	str	r3, [r7, #8]
 8005146:	e7fe      	b.n	8005146 <xQueueGenericReset+0x26>
 8005148:	f002 fd18 	bl	8007b7c <vPortEnterCritical>
 800514c:	68fb      	ldr	r3, [r7, #12]
 800514e:	681a      	ldr	r2, [r3, #0]
 8005150:	68fb      	ldr	r3, [r7, #12]
 8005152:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
 8005154:	68f9      	ldr	r1, [r7, #12]
 8005156:	6c09      	ldr	r1, [r1, #64]	; 0x40
 8005158:	fb01 f303 	mul.w	r3, r1, r3
 800515c:	441a      	add	r2, r3
 800515e:	68fb      	ldr	r3, [r7, #12]
 8005160:	609a      	str	r2, [r3, #8]
 8005162:	68fb      	ldr	r3, [r7, #12]
 8005164:	2200      	movs	r2, #0
 8005166:	639a      	str	r2, [r3, #56]	; 0x38
 8005168:	68fb      	ldr	r3, [r7, #12]
 800516a:	681a      	ldr	r2, [r3, #0]
 800516c:	68fb      	ldr	r3, [r7, #12]
 800516e:	605a      	str	r2, [r3, #4]
 8005170:	68fb      	ldr	r3, [r7, #12]
 8005172:	681a      	ldr	r2, [r3, #0]
 8005174:	68fb      	ldr	r3, [r7, #12]
 8005176:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
 8005178:	3b01      	subs	r3, #1
 800517a:	68f9      	ldr	r1, [r7, #12]
 800517c:	6c09      	ldr	r1, [r1, #64]	; 0x40
 800517e:	fb01 f303 	mul.w	r3, r1, r3
 8005182:	441a      	add	r2, r3
 8005184:	68fb      	ldr	r3, [r7, #12]
 8005186:	60da      	str	r2, [r3, #12]
 8005188:	68fb      	ldr	r3, [r7, #12]
 800518a:	22ff      	movs	r2, #255	; 0xff
 800518c:	f883 2044 	strb.w	r2, [r3, #68]	; 0x44
 8005190:	68fb      	ldr	r3, [r7, #12]
 8005192:	22ff      	movs	r2, #255	; 0xff
 8005194:	f883 2045 	strb.w	r2, [r3, #69]	; 0x45
 8005198:	683b      	ldr	r3, [r7, #0]
 800519a:	2b00      	cmp	r3, #0
 800519c:	d114      	bne.n	80051c8 <xQueueGenericReset+0xa8>
 800519e:	68fb      	ldr	r3, [r7, #12]
 80051a0:	691b      	ldr	r3, [r3, #16]
 80051a2:	2b00      	cmp	r3, #0
 80051a4:	d01a      	beq.n	80051dc <xQueueGenericReset+0xbc>
 80051a6:	68fb      	ldr	r3, [r7, #12]
 80051a8:	3310      	adds	r3, #16
 80051aa:	4618      	mov	r0, r3
 80051ac:	f001 fb36 	bl	800681c <xTaskRemoveFromEventList>
 80051b0:	4603      	mov	r3, r0
 80051b2:	2b00      	cmp	r3, #0
 80051b4:	d012      	beq.n	80051dc <xQueueGenericReset+0xbc>
 80051b6:	4b0d      	ldr	r3, [pc, #52]	; (80051ec <xQueueGenericReset+0xcc>)
 80051b8:	f04f 5280 	mov.w	r2, #268435456	; 0x10000000
 80051bc:	601a      	str	r2, [r3, #0]
 80051be:	f3bf 8f4f 	dsb	sy
 80051c2:	f3bf 8f6f 	isb	sy
 80051c6:	e009      	b.n	80051dc <xQueueGenericReset+0xbc>
 80051c8:	68fb      	ldr	r3, [r7, #12]
 80051ca:	3310      	adds	r3, #16
 80051cc:	4618      	mov	r0, r3
 80051ce:	f000 fdd1 	bl	8005d74 <vListInitialise>
 80051d2:	68fb      	ldr	r3, [r7, #12]
 80051d4:	3324      	adds	r3, #36	; 0x24
 80051d6:	4618      	mov	r0, r3
 80051d8:	f000 fdcc 	bl	8005d74 <vListInitialise>
 80051dc:	f002 fcfc 	bl	8007bd8 <vPortExitCritical>
 80051e0:	2301      	movs	r3, #1
 80051e2:	4618      	mov	r0, r3
 80051e4:	3710      	adds	r7, #16
 80051e6:	46bd      	mov	sp, r7
 80051e8:	bd80      	pop	{r7, pc}
 80051ea:	bf00      	nop
 80051ec:	e000ed04 	.word	0xe000ed04

080051f0 <xQueueGenericCreateStatic>:
 80051f0:	b580      	push	{r7, lr}
 80051f2:	b08e      	sub	sp, #56	; 0x38
 80051f4:	af02      	add	r7, sp, #8
 80051f6:	60f8      	str	r0, [r7, #12]
 80051f8:	60b9      	str	r1, [r7, #8]
 80051fa:	607a      	str	r2, [r7, #4]
 80051fc:	603b      	str	r3, [r7, #0]
 80051fe:	68fb      	ldr	r3, [r7, #12]
 8005200:	2b00      	cmp	r3, #0
 8005202:	d109      	bne.n	8005218 <xQueueGenericCreateStatic+0x28>
 8005204:	f04f 0350 	mov.w	r3, #80	; 0x50
 8005208:	f383 8811 	msr	BASEPRI, r3
 800520c:	f3bf 8f6f 	isb	sy
 8005210:	f3bf 8f4f 	dsb	sy
 8005214:	62bb      	str	r3, [r7, #40]	; 0x28
 8005216:	e7fe      	b.n	8005216 <xQueueGenericCreateStatic+0x26>
 8005218:	683b      	ldr	r3, [r7, #0]
 800521a:	2b00      	cmp	r3, #0
 800521c:	d109      	bne.n	8005232 <xQueueGenericCreateStatic+0x42>
 800521e:	f04f 0350 	mov.w	r3, #80	; 0x50
 8005222:	f383 8811 	msr	BASEPRI, r3
 8005226:	f3bf 8f6f 	isb	sy
 800522a:	f3bf 8f4f 	dsb	sy
 800522e:	627b      	str	r3, [r7, #36]	; 0x24
 8005230:	e7fe      	b.n	8005230 <xQueueGenericCreateStatic+0x40>
 8005232:	687b      	ldr	r3, [r7, #4]
 8005234:	2b00      	cmp	r3, #0
 8005236:	d002      	beq.n	800523e <xQueueGenericCreateStatic+0x4e>
 8005238:	68bb      	ldr	r3, [r7, #8]
 800523a:	2b00      	cmp	r3, #0
 800523c:	d001      	beq.n	8005242 <xQueueGenericCreateStatic+0x52>
 800523e:	2301      	movs	r3, #1
 8005240:	e000      	b.n	8005244 <xQueueGenericCreateStatic+0x54>
 8005242:	2300      	movs	r3, #0
 8005244:	2b00      	cmp	r3, #0
 8005246:	d109      	bne.n	800525c <xQueueGenericCreateStatic+0x6c>
 8005248:	f04f 0350 	mov.w	r3, #80	; 0x50
 800524c:	f383 8811 	msr	BASEPRI, r3
 8005250:	f3bf 8f6f 	isb	sy
 8005254:	f3bf 8f4f 	dsb	sy
 8005258:	623b      	str	r3, [r7, #32]
 800525a:	e7fe      	b.n	800525a <xQueueGenericCreateStatic+0x6a>
 800525c:	687b      	ldr	r3, [r7, #4]
 800525e:	2b00      	cmp	r3, #0
 8005260:	d102      	bne.n	8005268 <xQueueGenericCreateStatic+0x78>
 8005262:	68bb      	ldr	r3, [r7, #8]
 8005264:	2b00      	cmp	r3, #0
 8005266:	d101      	bne.n	800526c <xQueueGenericCreateStatic+0x7c>
 8005268:	2301      	movs	r3, #1
 800526a:	e000      	b.n	800526e <xQueueGenericCreateStatic+0x7e>
 800526c:	2300      	movs	r3, #0
 800526e:	2b00      	cmp	r3, #0
 8005270:	d109      	bne.n	8005286 <xQueueGenericCreateStatic+0x96>
 8005272:	f04f 0350 	mov.w	r3, #80	; 0x50
 8005276:	f383 8811 	msr	BASEPRI, r3
 800527a:	f3bf 8f6f 	isb	sy
 800527e:	f3bf 8f4f 	dsb	sy
 8005282:	61fb      	str	r3, [r7, #28]
 8005284:	e7fe      	b.n	8005284 <xQueueGenericCreateStatic+0x94>
 8005286:	2350      	movs	r3, #80	; 0x50
 8005288:	617b      	str	r3, [r7, #20]
 800528a:	697b      	ldr	r3, [r7, #20]
 800528c:	2b50      	cmp	r3, #80	; 0x50
 800528e:	d009      	beq.n	80052a4 <xQueueGenericCreateStatic+0xb4>
 8005290:	f04f 0350 	mov.w	r3, #80	; 0x50
 8005294:	f383 8811 	msr	BASEPRI, r3
 8005298:	f3bf 8f6f 	isb	sy
 800529c:	f3bf 8f4f 	dsb	sy
 80052a0:	61bb      	str	r3, [r7, #24]
 80052a2:	e7fe      	b.n	80052a2 <xQueueGenericCreateStatic+0xb2>
 80052a4:	697b      	ldr	r3, [r7, #20]
 80052a6:	683b      	ldr	r3, [r7, #0]
 80052a8:	62fb      	str	r3, [r7, #44]	; 0x2c
 80052aa:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 80052ac:	2b00      	cmp	r3, #0
 80052ae:	d00d      	beq.n	80052cc <xQueueGenericCreateStatic+0xdc>
 80052b0:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 80052b2:	2201      	movs	r2, #1
 80052b4:	f883 2046 	strb.w	r2, [r3, #70]	; 0x46
 80052b8:	f897 2038 	ldrb.w	r2, [r7, #56]	; 0x38
 80052bc:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 80052be:	9300      	str	r3, [sp, #0]
 80052c0:	4613      	mov	r3, r2
 80052c2:	687a      	ldr	r2, [r7, #4]
 80052c4:	68b9      	ldr	r1, [r7, #8]
 80052c6:	68f8      	ldr	r0, [r7, #12]
 80052c8:	f000 f805 	bl	80052d6 <prvInitialiseNewQueue>
 80052cc:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 80052ce:	4618      	mov	r0, r3
 80052d0:	3730      	adds	r7, #48	; 0x30
 80052d2:	46bd      	mov	sp, r7
 80052d4:	bd80      	pop	{r7, pc}

080052d6 <prvInitialiseNewQueue>:
 80052d6:	b580      	push	{r7, lr}
 80052d8:	b084      	sub	sp, #16
 80052da:	af00      	add	r7, sp, #0
 80052dc:	60f8      	str	r0, [r7, #12]
 80052de:	60b9      	str	r1, [r7, #8]
 80052e0:	607a      	str	r2, [r7, #4]
 80052e2:	70fb      	strb	r3, [r7, #3]
 80052e4:	68bb      	ldr	r3, [r7, #8]
 80052e6:	2b00      	cmp	r3, #0
 80052e8:	d103      	bne.n	80052f2 <prvInitialiseNewQueue+0x1c>
 80052ea:	69bb      	ldr	r3, [r7, #24]
 80052ec:	69ba      	ldr	r2, [r7, #24]
 80052ee:	601a      	str	r2, [r3, #0]
 80052f0:	e002      	b.n	80052f8 <prvInitialiseNewQueue+0x22>
 80052f2:	69bb      	ldr	r3, [r7, #24]
 80052f4:	687a      	ldr	r2, [r7, #4]
 80052f6:	601a      	str	r2, [r3, #0]
 80052f8:	69bb      	ldr	r3, [r7, #24]
 80052fa:	68fa      	ldr	r2, [r7, #12]
 80052fc:	63da      	str	r2, [r3, #60]	; 0x3c
 80052fe:	69bb      	ldr	r3, [r7, #24]
 8005300:	68ba      	ldr	r2, [r7, #8]
 8005302:	641a      	str	r2, [r3, #64]	; 0x40
 8005304:	2101      	movs	r1, #1
 8005306:	69b8      	ldr	r0, [r7, #24]
 8005308:	f7ff ff0a 	bl	8005120 <xQueueGenericReset>
 800530c:	69bb      	ldr	r3, [r7, #24]
 800530e:	78fa      	ldrb	r2, [r7, #3]
 8005310:	f883 204c 	strb.w	r2, [r3, #76]	; 0x4c
 8005314:	bf00      	nop
 8005316:	3710      	adds	r7, #16
 8005318:	46bd      	mov	sp, r7
 800531a:	bd80      	pop	{r7, pc}

0800531c <prvInitialiseMutex>:
 800531c:	b580      	push	{r7, lr}
 800531e:	b082      	sub	sp, #8
 8005320:	af00      	add	r7, sp, #0
 8005322:	6078      	str	r0, [r7, #4]
 8005324:	687b      	ldr	r3, [r7, #4]
 8005326:	2b00      	cmp	r3, #0
 8005328:	d00e      	beq.n	8005348 <prvInitialiseMutex+0x2c>
 800532a:	687b      	ldr	r3, [r7, #4]
 800532c:	2200      	movs	r2, #0
 800532e:	609a      	str	r2, [r3, #8]
 8005330:	687b      	ldr	r3, [r7, #4]
 8005332:	2200      	movs	r2, #0
 8005334:	601a      	str	r2, [r3, #0]
 8005336:	687b      	ldr	r3, [r7, #4]
 8005338:	2200      	movs	r2, #0
 800533a:	60da      	str	r2, [r3, #12]
 800533c:	2300      	movs	r3, #0
 800533e:	2200      	movs	r2, #0
 8005340:	2100      	movs	r1, #0
 8005342:	6878      	ldr	r0, [r7, #4]
 8005344:	f000 f820 	bl	8005388 <xQueueGenericSend>
 8005348:	bf00      	nop
 800534a:	3708      	adds	r7, #8
 800534c:	46bd      	mov	sp, r7
 800534e:	bd80      	pop	{r7, pc}

08005350 <xQueueCreateMutexStatic>:
 8005350:	b580      	push	{r7, lr}
 8005352:	b088      	sub	sp, #32
 8005354:	af02      	add	r7, sp, #8
 8005356:	4603      	mov	r3, r0
 8005358:	6039      	str	r1, [r7, #0]
 800535a:	71fb      	strb	r3, [r7, #7]
 800535c:	2301      	movs	r3, #1
 800535e:	617b      	str	r3, [r7, #20]
 8005360:	2300      	movs	r3, #0
 8005362:	613b      	str	r3, [r7, #16]
 8005364:	79fb      	ldrb	r3, [r7, #7]
 8005366:	9300      	str	r3, [sp, #0]
 8005368:	683b      	ldr	r3, [r7, #0]
 800536a:	2200      	movs	r2, #0
 800536c:	6939      	ldr	r1, [r7, #16]
 800536e:	6978      	ldr	r0, [r7, #20]
 8005370:	f7ff ff3e 	bl	80051f0 <xQueueGenericCreateStatic>
 8005374:	60f8      	str	r0, [r7, #12]
 8005376:	68f8      	ldr	r0, [r7, #12]
 8005378:	f7ff ffd0 	bl	800531c <prvInitialiseMutex>
 800537c:	68fb      	ldr	r3, [r7, #12]
 800537e:	4618      	mov	r0, r3
 8005380:	3718      	adds	r7, #24
 8005382:	46bd      	mov	sp, r7
 8005384:	bd80      	pop	{r7, pc}
	...

08005388 <xQueueGenericSend>:
 8005388:	b580      	push	{r7, lr}
 800538a:	b08e      	sub	sp, #56	; 0x38
 800538c:	af00      	add	r7, sp, #0
 800538e:	60f8      	str	r0, [r7, #12]
 8005390:	60b9      	str	r1, [r7, #8]
 8005392:	607a      	str	r2, [r7, #4]
 8005394:	603b      	str	r3, [r7, #0]
 8005396:	2300      	movs	r3, #0
 8005398:	637b      	str	r3, [r7, #52]	; 0x34
 800539a:	68fb      	ldr	r3, [r7, #12]
 800539c:	633b      	str	r3, [r7, #48]	; 0x30
 800539e:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 80053a0:	2b00      	cmp	r3, #0
 80053a2:	d109      	bne.n	80053b8 <xQueueGenericSend+0x30>
 80053a4:	f04f 0350 	mov.w	r3, #80	; 0x50
 80053a8:	f383 8811 	msr	BASEPRI, r3
 80053ac:	f3bf 8f6f 	isb	sy
 80053b0:	f3bf 8f4f 	dsb	sy
 80053b4:	62bb      	str	r3, [r7, #40]	; 0x28
 80053b6:	e7fe      	b.n	80053b6 <xQueueGenericSend+0x2e>
 80053b8:	68bb      	ldr	r3, [r7, #8]
 80053ba:	2b00      	cmp	r3, #0
 80053bc:	d103      	bne.n	80053c6 <xQueueGenericSend+0x3e>
 80053be:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 80053c0:	6c1b      	ldr	r3, [r3, #64]	; 0x40
 80053c2:	2b00      	cmp	r3, #0
 80053c4:	d101      	bne.n	80053ca <xQueueGenericSend+0x42>
 80053c6:	2301      	movs	r3, #1
 80053c8:	e000      	b.n	80053cc <xQueueGenericSend+0x44>
 80053ca:	2300      	movs	r3, #0
 80053cc:	2b00      	cmp	r3, #0
 80053ce:	d109      	bne.n	80053e4 <xQueueGenericSend+0x5c>
 80053d0:	f04f 0350 	mov.w	r3, #80	; 0x50
 80053d4:	f383 8811 	msr	BASEPRI, r3
 80053d8:	f3bf 8f6f 	isb	sy
 80053dc:	f3bf 8f4f 	dsb	sy
 80053e0:	627b      	str	r3, [r7, #36]	; 0x24
 80053e2:	e7fe      	b.n	80053e2 <xQueueGenericSend+0x5a>
 80053e4:	683b      	ldr	r3, [r7, #0]
 80053e6:	2b02      	cmp	r3, #2
 80053e8:	d103      	bne.n	80053f2 <xQueueGenericSend+0x6a>
 80053ea:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 80053ec:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
 80053ee:	2b01      	cmp	r3, #1
 80053f0:	d101      	bne.n	80053f6 <xQueueGenericSend+0x6e>
 80053f2:	2301      	movs	r3, #1
 80053f4:	e000      	b.n	80053f8 <xQueueGenericSend+0x70>
 80053f6:	2300      	movs	r3, #0
 80053f8:	2b00      	cmp	r3, #0
 80053fa:	d109      	bne.n	8005410 <xQueueGenericSend+0x88>
 80053fc:	f04f 0350 	mov.w	r3, #80	; 0x50
 8005400:	f383 8811 	msr	BASEPRI, r3
 8005404:	f3bf 8f6f 	isb	sy
 8005408:	f3bf 8f4f 	dsb	sy
 800540c:	623b      	str	r3, [r7, #32]
 800540e:	e7fe      	b.n	800540e <xQueueGenericSend+0x86>
 8005410:	f001 fbd2 	bl	8006bb8 <xTaskGetSchedulerState>
 8005414:	4603      	mov	r3, r0
 8005416:	2b00      	cmp	r3, #0
 8005418:	d102      	bne.n	8005420 <xQueueGenericSend+0x98>
 800541a:	687b      	ldr	r3, [r7, #4]
 800541c:	2b00      	cmp	r3, #0
 800541e:	d101      	bne.n	8005424 <xQueueGenericSend+0x9c>
 8005420:	2301      	movs	r3, #1
 8005422:	e000      	b.n	8005426 <xQueueGenericSend+0x9e>
 8005424:	2300      	movs	r3, #0
 8005426:	2b00      	cmp	r3, #0
 8005428:	d109      	bne.n	800543e <xQueueGenericSend+0xb6>
 800542a:	f04f 0350 	mov.w	r3, #80	; 0x50
 800542e:	f383 8811 	msr	BASEPRI, r3
 8005432:	f3bf 8f6f 	isb	sy
 8005436:	f3bf 8f4f 	dsb	sy
 800543a:	61fb      	str	r3, [r7, #28]
 800543c:	e7fe      	b.n	800543c <xQueueGenericSend+0xb4>
 800543e:	f002 fb9d 	bl	8007b7c <vPortEnterCritical>
 8005442:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 8005444:	6b9a      	ldr	r2, [r3, #56]	; 0x38
 8005446:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 8005448:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
 800544a:	429a      	cmp	r2, r3
 800544c:	d302      	bcc.n	8005454 <xQueueGenericSend+0xcc>
 800544e:	683b      	ldr	r3, [r7, #0]
 8005450:	2b02      	cmp	r3, #2
 8005452:	d129      	bne.n	80054a8 <xQueueGenericSend+0x120>
 8005454:	683a      	ldr	r2, [r7, #0]
 8005456:	68b9      	ldr	r1, [r7, #8]
 8005458:	6b38      	ldr	r0, [r7, #48]	; 0x30
 800545a:	f000 fb1f 	bl	8005a9c <prvCopyDataToQueue>
 800545e:	62f8      	str	r0, [r7, #44]	; 0x2c
 8005460:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 8005462:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 8005464:	2b00      	cmp	r3, #0
 8005466:	d010      	beq.n	800548a <xQueueGenericSend+0x102>
 8005468:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 800546a:	3324      	adds	r3, #36	; 0x24
 800546c:	4618      	mov	r0, r3
 800546e:	f001 f9d5 	bl	800681c <xTaskRemoveFromEventList>
 8005472:	4603      	mov	r3, r0
 8005474:	2b00      	cmp	r3, #0
 8005476:	d013      	beq.n	80054a0 <xQueueGenericSend+0x118>
 8005478:	4b3f      	ldr	r3, [pc, #252]	; (8005578 <xQueueGenericSend+0x1f0>)
 800547a:	f04f 5280 	mov.w	r2, #268435456	; 0x10000000
 800547e:	601a      	str	r2, [r3, #0]
 8005480:	f3bf 8f4f 	dsb	sy
 8005484:	f3bf 8f6f 	isb	sy
 8005488:	e00a      	b.n	80054a0 <xQueueGenericSend+0x118>
 800548a:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 800548c:	2b00      	cmp	r3, #0
 800548e:	d007      	beq.n	80054a0 <xQueueGenericSend+0x118>
 8005490:	4b39      	ldr	r3, [pc, #228]	; (8005578 <xQueueGenericSend+0x1f0>)
 8005492:	f04f 5280 	mov.w	r2, #268435456	; 0x10000000
 8005496:	601a      	str	r2, [r3, #0]
 8005498:	f3bf 8f4f 	dsb	sy
 800549c:	f3bf 8f6f 	isb	sy
 80054a0:	f002 fb9a 	bl	8007bd8 <vPortExitCritical>
 80054a4:	2301      	movs	r3, #1
 80054a6:	e063      	b.n	8005570 <xQueueGenericSend+0x1e8>
 80054a8:	687b      	ldr	r3, [r7, #4]
 80054aa:	2b00      	cmp	r3, #0
 80054ac:	d103      	bne.n	80054b6 <xQueueGenericSend+0x12e>
 80054ae:	f002 fb93 	bl	8007bd8 <vPortExitCritical>
 80054b2:	2300      	movs	r3, #0
 80054b4:	e05c      	b.n	8005570 <xQueueGenericSend+0x1e8>
 80054b6:	6b7b      	ldr	r3, [r7, #52]	; 0x34
 80054b8:	2b00      	cmp	r3, #0
 80054ba:	d106      	bne.n	80054ca <xQueueGenericSend+0x142>
 80054bc:	f107 0314 	add.w	r3, r7, #20
 80054c0:	4618      	mov	r0, r3
 80054c2:	f001 fa0d 	bl	80068e0 <vTaskInternalSetTimeOutState>
 80054c6:	2301      	movs	r3, #1
 80054c8:	637b      	str	r3, [r7, #52]	; 0x34
 80054ca:	f002 fb85 	bl	8007bd8 <vPortExitCritical>
 80054ce:	f000 ff45 	bl	800635c <vTaskSuspendAll>
 80054d2:	f002 fb53 	bl	8007b7c <vPortEnterCritical>
 80054d6:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 80054d8:	f893 3044 	ldrb.w	r3, [r3, #68]	; 0x44
 80054dc:	b25b      	sxtb	r3, r3
 80054de:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
 80054e2:	d103      	bne.n	80054ec <xQueueGenericSend+0x164>
 80054e4:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 80054e6:	2200      	movs	r2, #0
 80054e8:	f883 2044 	strb.w	r2, [r3, #68]	; 0x44
 80054ec:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 80054ee:	f893 3045 	ldrb.w	r3, [r3, #69]	; 0x45
 80054f2:	b25b      	sxtb	r3, r3
 80054f4:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
 80054f8:	d103      	bne.n	8005502 <xQueueGenericSend+0x17a>
 80054fa:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 80054fc:	2200      	movs	r2, #0
 80054fe:	f883 2045 	strb.w	r2, [r3, #69]	; 0x45
 8005502:	f002 fb69 	bl	8007bd8 <vPortExitCritical>
 8005506:	1d3a      	adds	r2, r7, #4
 8005508:	f107 0314 	add.w	r3, r7, #20
 800550c:	4611      	mov	r1, r2
 800550e:	4618      	mov	r0, r3
 8005510:	f001 f9fc 	bl	800690c <xTaskCheckForTimeOut>
 8005514:	4603      	mov	r3, r0
 8005516:	2b00      	cmp	r3, #0
 8005518:	d124      	bne.n	8005564 <xQueueGenericSend+0x1dc>
 800551a:	6b38      	ldr	r0, [r7, #48]	; 0x30
 800551c:	f000 fbb6 	bl	8005c8c <prvIsQueueFull>
 8005520:	4603      	mov	r3, r0
 8005522:	2b00      	cmp	r3, #0
 8005524:	d018      	beq.n	8005558 <xQueueGenericSend+0x1d0>
 8005526:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 8005528:	3310      	adds	r3, #16
 800552a:	687a      	ldr	r2, [r7, #4]
 800552c:	4611      	mov	r1, r2
 800552e:	4618      	mov	r0, r3
 8005530:	f001 f926 	bl	8006780 <vTaskPlaceOnEventList>
 8005534:	6b38      	ldr	r0, [r7, #48]	; 0x30
 8005536:	f000 fb41 	bl	8005bbc <prvUnlockQueue>
 800553a:	f000 ff1d 	bl	8006378 <xTaskResumeAll>
 800553e:	4603      	mov	r3, r0
 8005540:	2b00      	cmp	r3, #0
 8005542:	f47f af7c 	bne.w	800543e <xQueueGenericSend+0xb6>
 8005546:	4b0c      	ldr	r3, [pc, #48]	; (8005578 <xQueueGenericSend+0x1f0>)
 8005548:	f04f 5280 	mov.w	r2, #268435456	; 0x10000000
 800554c:	601a      	str	r2, [r3, #0]
 800554e:	f3bf 8f4f 	dsb	sy
 8005552:	f3bf 8f6f 	isb	sy
 8005556:	e772      	b.n	800543e <xQueueGenericSend+0xb6>
 8005558:	6b38      	ldr	r0, [r7, #48]	; 0x30
 800555a:	f000 fb2f 	bl	8005bbc <prvUnlockQueue>
 800555e:	f000 ff0b 	bl	8006378 <xTaskResumeAll>
 8005562:	e76c      	b.n	800543e <xQueueGenericSend+0xb6>
 8005564:	6b38      	ldr	r0, [r7, #48]	; 0x30
 8005566:	f000 fb29 	bl	8005bbc <prvUnlockQueue>
 800556a:	f000 ff05 	bl	8006378 <xTaskResumeAll>
 800556e:	2300      	movs	r3, #0
 8005570:	4618      	mov	r0, r3
 8005572:	3738      	adds	r7, #56	; 0x38
 8005574:	46bd      	mov	sp, r7
 8005576:	bd80      	pop	{r7, pc}
 8005578:	e000ed04 	.word	0xe000ed04

0800557c <xQueueGenericSendFromISR>:
 800557c:	b580      	push	{r7, lr}
 800557e:	b08e      	sub	sp, #56	; 0x38
 8005580:	af00      	add	r7, sp, #0
 8005582:	60f8      	str	r0, [r7, #12]
 8005584:	60b9      	str	r1, [r7, #8]
 8005586:	607a      	str	r2, [r7, #4]
 8005588:	603b      	str	r3, [r7, #0]
 800558a:	68fb      	ldr	r3, [r7, #12]
 800558c:	633b      	str	r3, [r7, #48]	; 0x30
 800558e:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 8005590:	2b00      	cmp	r3, #0
 8005592:	d109      	bne.n	80055a8 <xQueueGenericSendFromISR+0x2c>
 8005594:	f04f 0350 	mov.w	r3, #80	; 0x50
 8005598:	f383 8811 	msr	BASEPRI, r3
 800559c:	f3bf 8f6f 	isb	sy
 80055a0:	f3bf 8f4f 	dsb	sy
 80055a4:	627b      	str	r3, [r7, #36]	; 0x24
 80055a6:	e7fe      	b.n	80055a6 <xQueueGenericSendFromISR+0x2a>
 80055a8:	68bb      	ldr	r3, [r7, #8]
 80055aa:	2b00      	cmp	r3, #0
 80055ac:	d103      	bne.n	80055b6 <xQueueGenericSendFromISR+0x3a>
 80055ae:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 80055b0:	6c1b      	ldr	r3, [r3, #64]	; 0x40
 80055b2:	2b00      	cmp	r3, #0
 80055b4:	d101      	bne.n	80055ba <xQueueGenericSendFromISR+0x3e>
 80055b6:	2301      	movs	r3, #1
 80055b8:	e000      	b.n	80055bc <xQueueGenericSendFromISR+0x40>
 80055ba:	2300      	movs	r3, #0
 80055bc:	2b00      	cmp	r3, #0
 80055be:	d109      	bne.n	80055d4 <xQueueGenericSendFromISR+0x58>
 80055c0:	f04f 0350 	mov.w	r3, #80	; 0x50
 80055c4:	f383 8811 	msr	BASEPRI, r3
 80055c8:	f3bf 8f6f 	isb	sy
 80055cc:	f3bf 8f4f 	dsb	sy
 80055d0:	623b      	str	r3, [r7, #32]
 80055d2:	e7fe      	b.n	80055d2 <xQueueGenericSendFromISR+0x56>
 80055d4:	683b      	ldr	r3, [r7, #0]
 80055d6:	2b02      	cmp	r3, #2
 80055d8:	d103      	bne.n	80055e2 <xQueueGenericSendFromISR+0x66>
 80055da:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 80055dc:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
 80055de:	2b01      	cmp	r3, #1
 80055e0:	d101      	bne.n	80055e6 <xQueueGenericSendFromISR+0x6a>
 80055e2:	2301      	movs	r3, #1
 80055e4:	e000      	b.n	80055e8 <xQueueGenericSendFromISR+0x6c>
 80055e6:	2300      	movs	r3, #0
 80055e8:	2b00      	cmp	r3, #0
 80055ea:	d109      	bne.n	8005600 <xQueueGenericSendFromISR+0x84>
 80055ec:	f04f 0350 	mov.w	r3, #80	; 0x50
 80055f0:	f383 8811 	msr	BASEPRI, r3
 80055f4:	f3bf 8f6f 	isb	sy
 80055f8:	f3bf 8f4f 	dsb	sy
 80055fc:	61fb      	str	r3, [r7, #28]
 80055fe:	e7fe      	b.n	80055fe <xQueueGenericSendFromISR+0x82>
 8005600:	f002 fb98 	bl	8007d34 <vPortValidateInterruptPriority>
 8005604:	f3ef 8211 	mrs	r2, BASEPRI
 8005608:	f04f 0350 	mov.w	r3, #80	; 0x50
 800560c:	f383 8811 	msr	BASEPRI, r3
 8005610:	f3bf 8f6f 	isb	sy
 8005614:	f3bf 8f4f 	dsb	sy
 8005618:	61ba      	str	r2, [r7, #24]
 800561a:	617b      	str	r3, [r7, #20]
 800561c:	69bb      	ldr	r3, [r7, #24]
 800561e:	62fb      	str	r3, [r7, #44]	; 0x2c
 8005620:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 8005622:	6b9a      	ldr	r2, [r3, #56]	; 0x38
 8005624:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 8005626:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
 8005628:	429a      	cmp	r2, r3
 800562a:	d302      	bcc.n	8005632 <xQueueGenericSendFromISR+0xb6>
 800562c:	683b      	ldr	r3, [r7, #0]
 800562e:	2b02      	cmp	r3, #2
 8005630:	d12c      	bne.n	800568c <xQueueGenericSendFromISR+0x110>
 8005632:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 8005634:	f893 3045 	ldrb.w	r3, [r3, #69]	; 0x45
 8005638:	f887 302b 	strb.w	r3, [r7, #43]	; 0x2b
 800563c:	683a      	ldr	r2, [r7, #0]
 800563e:	68b9      	ldr	r1, [r7, #8]
 8005640:	6b38      	ldr	r0, [r7, #48]	; 0x30
 8005642:	f000 fa2b 	bl	8005a9c <prvCopyDataToQueue>
 8005646:	f997 302b 	ldrsb.w	r3, [r7, #43]	; 0x2b
 800564a:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
 800564e:	d112      	bne.n	8005676 <xQueueGenericSendFromISR+0xfa>
 8005650:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 8005652:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 8005654:	2b00      	cmp	r3, #0
 8005656:	d016      	beq.n	8005686 <xQueueGenericSendFromISR+0x10a>
 8005658:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 800565a:	3324      	adds	r3, #36	; 0x24
 800565c:	4618      	mov	r0, r3
 800565e:	f001 f8dd 	bl	800681c <xTaskRemoveFromEventList>
 8005662:	4603      	mov	r3, r0
 8005664:	2b00      	cmp	r3, #0
 8005666:	d00e      	beq.n	8005686 <xQueueGenericSendFromISR+0x10a>
 8005668:	687b      	ldr	r3, [r7, #4]
 800566a:	2b00      	cmp	r3, #0
 800566c:	d00b      	beq.n	8005686 <xQueueGenericSendFromISR+0x10a>
 800566e:	687b      	ldr	r3, [r7, #4]
 8005670:	2201      	movs	r2, #1
 8005672:	601a      	str	r2, [r3, #0]
 8005674:	e007      	b.n	8005686 <xQueueGenericSendFromISR+0x10a>
 8005676:	f897 302b 	ldrb.w	r3, [r7, #43]	; 0x2b
 800567a:	3301      	adds	r3, #1
 800567c:	b2db      	uxtb	r3, r3
 800567e:	b25a      	sxtb	r2, r3
 8005680:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 8005682:	f883 2045 	strb.w	r2, [r3, #69]	; 0x45
 8005686:	2301      	movs	r3, #1
 8005688:	637b      	str	r3, [r7, #52]	; 0x34
 800568a:	e001      	b.n	8005690 <xQueueGenericSendFromISR+0x114>
 800568c:	2300      	movs	r3, #0
 800568e:	637b      	str	r3, [r7, #52]	; 0x34
 8005690:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 8005692:	613b      	str	r3, [r7, #16]
 8005694:	693b      	ldr	r3, [r7, #16]
 8005696:	f383 8811 	msr	BASEPRI, r3
 800569a:	6b7b      	ldr	r3, [r7, #52]	; 0x34
 800569c:	4618      	mov	r0, r3
 800569e:	3738      	adds	r7, #56	; 0x38
 80056a0:	46bd      	mov	sp, r7
 80056a2:	bd80      	pop	{r7, pc}

080056a4 <xQueueReceive>:
 80056a4:	b580      	push	{r7, lr}
 80056a6:	b08c      	sub	sp, #48	; 0x30
 80056a8:	af00      	add	r7, sp, #0
 80056aa:	60f8      	str	r0, [r7, #12]
 80056ac:	60b9      	str	r1, [r7, #8]
 80056ae:	607a      	str	r2, [r7, #4]
 80056b0:	2300      	movs	r3, #0
 80056b2:	62fb      	str	r3, [r7, #44]	; 0x2c
 80056b4:	68fb      	ldr	r3, [r7, #12]
 80056b6:	62bb      	str	r3, [r7, #40]	; 0x28
 80056b8:	6abb      	ldr	r3, [r7, #40]	; 0x28
 80056ba:	2b00      	cmp	r3, #0
 80056bc:	d109      	bne.n	80056d2 <xQueueReceive+0x2e>
 80056be:	f04f 0350 	mov.w	r3, #80	; 0x50
 80056c2:	f383 8811 	msr	BASEPRI, r3
 80056c6:	f3bf 8f6f 	isb	sy
 80056ca:	f3bf 8f4f 	dsb	sy
 80056ce:	623b      	str	r3, [r7, #32]
 80056d0:	e7fe      	b.n	80056d0 <xQueueReceive+0x2c>
 80056d2:	68bb      	ldr	r3, [r7, #8]
 80056d4:	2b00      	cmp	r3, #0
 80056d6:	d103      	bne.n	80056e0 <xQueueReceive+0x3c>
 80056d8:	6abb      	ldr	r3, [r7, #40]	; 0x28
 80056da:	6c1b      	ldr	r3, [r3, #64]	; 0x40
 80056dc:	2b00      	cmp	r3, #0
 80056de:	d101      	bne.n	80056e4 <xQueueReceive+0x40>
 80056e0:	2301      	movs	r3, #1
 80056e2:	e000      	b.n	80056e6 <xQueueReceive+0x42>
 80056e4:	2300      	movs	r3, #0
 80056e6:	2b00      	cmp	r3, #0
 80056e8:	d109      	bne.n	80056fe <xQueueReceive+0x5a>
 80056ea:	f04f 0350 	mov.w	r3, #80	; 0x50
 80056ee:	f383 8811 	msr	BASEPRI, r3
 80056f2:	f3bf 8f6f 	isb	sy
 80056f6:	f3bf 8f4f 	dsb	sy
 80056fa:	61fb      	str	r3, [r7, #28]
 80056fc:	e7fe      	b.n	80056fc <xQueueReceive+0x58>
 80056fe:	f001 fa5b 	bl	8006bb8 <xTaskGetSchedulerState>
 8005702:	4603      	mov	r3, r0
 8005704:	2b00      	cmp	r3, #0
 8005706:	d102      	bne.n	800570e <xQueueReceive+0x6a>
 8005708:	687b      	ldr	r3, [r7, #4]
 800570a:	2b00      	cmp	r3, #0
 800570c:	d101      	bne.n	8005712 <xQueueReceive+0x6e>
 800570e:	2301      	movs	r3, #1
 8005710:	e000      	b.n	8005714 <xQueueReceive+0x70>
 8005712:	2300      	movs	r3, #0
 8005714:	2b00      	cmp	r3, #0
 8005716:	d109      	bne.n	800572c <xQueueReceive+0x88>
 8005718:	f04f 0350 	mov.w	r3, #80	; 0x50
 800571c:	f383 8811 	msr	BASEPRI, r3
 8005720:	f3bf 8f6f 	isb	sy
 8005724:	f3bf 8f4f 	dsb	sy
 8005728:	61bb      	str	r3, [r7, #24]
 800572a:	e7fe      	b.n	800572a <xQueueReceive+0x86>
 800572c:	f002 fa26 	bl	8007b7c <vPortEnterCritical>
 8005730:	6abb      	ldr	r3, [r7, #40]	; 0x28
 8005732:	6b9b      	ldr	r3, [r3, #56]	; 0x38
 8005734:	627b      	str	r3, [r7, #36]	; 0x24
 8005736:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8005738:	2b00      	cmp	r3, #0
 800573a:	d01f      	beq.n	800577c <xQueueReceive+0xd8>
 800573c:	68b9      	ldr	r1, [r7, #8]
 800573e:	6ab8      	ldr	r0, [r7, #40]	; 0x28
 8005740:	f000 fa16 	bl	8005b70 <prvCopyDataFromQueue>
 8005744:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8005746:	1e5a      	subs	r2, r3, #1
 8005748:	6abb      	ldr	r3, [r7, #40]	; 0x28
 800574a:	639a      	str	r2, [r3, #56]	; 0x38
 800574c:	6abb      	ldr	r3, [r7, #40]	; 0x28
 800574e:	691b      	ldr	r3, [r3, #16]
 8005750:	2b00      	cmp	r3, #0
 8005752:	d00f      	beq.n	8005774 <xQueueReceive+0xd0>
 8005754:	6abb      	ldr	r3, [r7, #40]	; 0x28
 8005756:	3310      	adds	r3, #16
 8005758:	4618      	mov	r0, r3
 800575a:	f001 f85f 	bl	800681c <xTaskRemoveFromEventList>
 800575e:	4603      	mov	r3, r0
 8005760:	2b00      	cmp	r3, #0
 8005762:	d007      	beq.n	8005774 <xQueueReceive+0xd0>
 8005764:	4b3c      	ldr	r3, [pc, #240]	; (8005858 <xQueueReceive+0x1b4>)
 8005766:	f04f 5280 	mov.w	r2, #268435456	; 0x10000000
 800576a:	601a      	str	r2, [r3, #0]
 800576c:	f3bf 8f4f 	dsb	sy
 8005770:	f3bf 8f6f 	isb	sy
 8005774:	f002 fa30 	bl	8007bd8 <vPortExitCritical>
 8005778:	2301      	movs	r3, #1
 800577a:	e069      	b.n	8005850 <xQueueReceive+0x1ac>
 800577c:	687b      	ldr	r3, [r7, #4]
 800577e:	2b00      	cmp	r3, #0
 8005780:	d103      	bne.n	800578a <xQueueReceive+0xe6>
 8005782:	f002 fa29 	bl	8007bd8 <vPortExitCritical>
 8005786:	2300      	movs	r3, #0
 8005788:	e062      	b.n	8005850 <xQueueReceive+0x1ac>
 800578a:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 800578c:	2b00      	cmp	r3, #0
 800578e:	d106      	bne.n	800579e <xQueueReceive+0xfa>
 8005790:	f107 0310 	add.w	r3, r7, #16
 8005794:	4618      	mov	r0, r3
 8005796:	f001 f8a3 	bl	80068e0 <vTaskInternalSetTimeOutState>
 800579a:	2301      	movs	r3, #1
 800579c:	62fb      	str	r3, [r7, #44]	; 0x2c
 800579e:	f002 fa1b 	bl	8007bd8 <vPortExitCritical>
 80057a2:	f000 fddb 	bl	800635c <vTaskSuspendAll>
 80057a6:	f002 f9e9 	bl	8007b7c <vPortEnterCritical>
 80057aa:	6abb      	ldr	r3, [r7, #40]	; 0x28
 80057ac:	f893 3044 	ldrb.w	r3, [r3, #68]	; 0x44
 80057b0:	b25b      	sxtb	r3, r3
 80057b2:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
 80057b6:	d103      	bne.n	80057c0 <xQueueReceive+0x11c>
 80057b8:	6abb      	ldr	r3, [r7, #40]	; 0x28
 80057ba:	2200      	movs	r2, #0
 80057bc:	f883 2044 	strb.w	r2, [r3, #68]	; 0x44
 80057c0:	6abb      	ldr	r3, [r7, #40]	; 0x28
 80057c2:	f893 3045 	ldrb.w	r3, [r3, #69]	; 0x45
 80057c6:	b25b      	sxtb	r3, r3
 80057c8:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
 80057cc:	d103      	bne.n	80057d6 <xQueueReceive+0x132>
 80057ce:	6abb      	ldr	r3, [r7, #40]	; 0x28
 80057d0:	2200      	movs	r2, #0
 80057d2:	f883 2045 	strb.w	r2, [r3, #69]	; 0x45
 80057d6:	f002 f9ff 	bl	8007bd8 <vPortExitCritical>
 80057da:	1d3a      	adds	r2, r7, #4
 80057dc:	f107 0310 	add.w	r3, r7, #16
 80057e0:	4611      	mov	r1, r2
 80057e2:	4618      	mov	r0, r3
 80057e4:	f001 f892 	bl	800690c <xTaskCheckForTimeOut>
 80057e8:	4603      	mov	r3, r0
 80057ea:	2b00      	cmp	r3, #0
 80057ec:	d123      	bne.n	8005836 <xQueueReceive+0x192>
 80057ee:	6ab8      	ldr	r0, [r7, #40]	; 0x28
 80057f0:	f000 fa36 	bl	8005c60 <prvIsQueueEmpty>
 80057f4:	4603      	mov	r3, r0
 80057f6:	2b00      	cmp	r3, #0
 80057f8:	d017      	beq.n	800582a <xQueueReceive+0x186>
 80057fa:	6abb      	ldr	r3, [r7, #40]	; 0x28
 80057fc:	3324      	adds	r3, #36	; 0x24
 80057fe:	687a      	ldr	r2, [r7, #4]
 8005800:	4611      	mov	r1, r2
 8005802:	4618      	mov	r0, r3
 8005804:	f000 ffbc 	bl	8006780 <vTaskPlaceOnEventList>
 8005808:	6ab8      	ldr	r0, [r7, #40]	; 0x28
 800580a:	f000 f9d7 	bl	8005bbc <prvUnlockQueue>
 800580e:	f000 fdb3 	bl	8006378 <xTaskResumeAll>
 8005812:	4603      	mov	r3, r0
 8005814:	2b00      	cmp	r3, #0
 8005816:	d189      	bne.n	800572c <xQueueReceive+0x88>
 8005818:	4b0f      	ldr	r3, [pc, #60]	; (8005858 <xQueueReceive+0x1b4>)
 800581a:	f04f 5280 	mov.w	r2, #268435456	; 0x10000000
 800581e:	601a      	str	r2, [r3, #0]
 8005820:	f3bf 8f4f 	dsb	sy
 8005824:	f3bf 8f6f 	isb	sy
 8005828:	e780      	b.n	800572c <xQueueReceive+0x88>
 800582a:	6ab8      	ldr	r0, [r7, #40]	; 0x28
 800582c:	f000 f9c6 	bl	8005bbc <prvUnlockQueue>
 8005830:	f000 fda2 	bl	8006378 <xTaskResumeAll>
 8005834:	e77a      	b.n	800572c <xQueueReceive+0x88>
 8005836:	6ab8      	ldr	r0, [r7, #40]	; 0x28
 8005838:	f000 f9c0 	bl	8005bbc <prvUnlockQueue>
 800583c:	f000 fd9c 	bl	8006378 <xTaskResumeAll>
 8005840:	6ab8      	ldr	r0, [r7, #40]	; 0x28
 8005842:	f000 fa0d 	bl	8005c60 <prvIsQueueEmpty>
 8005846:	4603      	mov	r3, r0
 8005848:	2b00      	cmp	r3, #0
 800584a:	f43f af6f 	beq.w	800572c <xQueueReceive+0x88>
 800584e:	2300      	movs	r3, #0
 8005850:	4618      	mov	r0, r3
 8005852:	3730      	adds	r7, #48	; 0x30
 8005854:	46bd      	mov	sp, r7
 8005856:	bd80      	pop	{r7, pc}
 8005858:	e000ed04 	.word	0xe000ed04

0800585c <xQueueSemaphoreTake>:
 800585c:	b580      	push	{r7, lr}
 800585e:	b08e      	sub	sp, #56	; 0x38
 8005860:	af00      	add	r7, sp, #0
 8005862:	6078      	str	r0, [r7, #4]
 8005864:	6039      	str	r1, [r7, #0]
 8005866:	2300      	movs	r3, #0
 8005868:	637b      	str	r3, [r7, #52]	; 0x34
 800586a:	687b      	ldr	r3, [r7, #4]
 800586c:	62fb      	str	r3, [r7, #44]	; 0x2c
 800586e:	2300      	movs	r3, #0
 8005870:	633b      	str	r3, [r7, #48]	; 0x30
 8005872:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 8005874:	2b00      	cmp	r3, #0
 8005876:	d109      	bne.n	800588c <xQueueSemaphoreTake+0x30>
 8005878:	f04f 0350 	mov.w	r3, #80	; 0x50
 800587c:	f383 8811 	msr	BASEPRI, r3
 8005880:	f3bf 8f6f 	isb	sy
 8005884:	f3bf 8f4f 	dsb	sy
 8005888:	623b      	str	r3, [r7, #32]
 800588a:	e7fe      	b.n	800588a <xQueueSemaphoreTake+0x2e>
 800588c:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 800588e:	6c1b      	ldr	r3, [r3, #64]	; 0x40
 8005890:	2b00      	cmp	r3, #0
 8005892:	d009      	beq.n	80058a8 <xQueueSemaphoreTake+0x4c>
 8005894:	f04f 0350 	mov.w	r3, #80	; 0x50
 8005898:	f383 8811 	msr	BASEPRI, r3
 800589c:	f3bf 8f6f 	isb	sy
 80058a0:	f3bf 8f4f 	dsb	sy
 80058a4:	61fb      	str	r3, [r7, #28]
 80058a6:	e7fe      	b.n	80058a6 <xQueueSemaphoreTake+0x4a>
 80058a8:	f001 f986 	bl	8006bb8 <xTaskGetSchedulerState>
 80058ac:	4603      	mov	r3, r0
 80058ae:	2b00      	cmp	r3, #0
 80058b0:	d102      	bne.n	80058b8 <xQueueSemaphoreTake+0x5c>
 80058b2:	683b      	ldr	r3, [r7, #0]
 80058b4:	2b00      	cmp	r3, #0
 80058b6:	d101      	bne.n	80058bc <xQueueSemaphoreTake+0x60>
 80058b8:	2301      	movs	r3, #1
 80058ba:	e000      	b.n	80058be <xQueueSemaphoreTake+0x62>
 80058bc:	2300      	movs	r3, #0
 80058be:	2b00      	cmp	r3, #0
 80058c0:	d109      	bne.n	80058d6 <xQueueSemaphoreTake+0x7a>
 80058c2:	f04f 0350 	mov.w	r3, #80	; 0x50
 80058c6:	f383 8811 	msr	BASEPRI, r3
 80058ca:	f3bf 8f6f 	isb	sy
 80058ce:	f3bf 8f4f 	dsb	sy
 80058d2:	61bb      	str	r3, [r7, #24]
 80058d4:	e7fe      	b.n	80058d4 <xQueueSemaphoreTake+0x78>
 80058d6:	f002 f951 	bl	8007b7c <vPortEnterCritical>
 80058da:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 80058dc:	6b9b      	ldr	r3, [r3, #56]	; 0x38
 80058de:	62bb      	str	r3, [r7, #40]	; 0x28
 80058e0:	6abb      	ldr	r3, [r7, #40]	; 0x28
 80058e2:	2b00      	cmp	r3, #0
 80058e4:	d024      	beq.n	8005930 <xQueueSemaphoreTake+0xd4>
 80058e6:	6abb      	ldr	r3, [r7, #40]	; 0x28
 80058e8:	1e5a      	subs	r2, r3, #1
 80058ea:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 80058ec:	639a      	str	r2, [r3, #56]	; 0x38
 80058ee:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 80058f0:	681b      	ldr	r3, [r3, #0]
 80058f2:	2b00      	cmp	r3, #0
 80058f4:	d104      	bne.n	8005900 <xQueueSemaphoreTake+0xa4>
 80058f6:	f001 fb19 	bl	8006f2c <pvTaskIncrementMutexHeldCount>
 80058fa:	4602      	mov	r2, r0
 80058fc:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 80058fe:	609a      	str	r2, [r3, #8]
 8005900:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 8005902:	691b      	ldr	r3, [r3, #16]
 8005904:	2b00      	cmp	r3, #0
 8005906:	d00f      	beq.n	8005928 <xQueueSemaphoreTake+0xcc>
 8005908:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 800590a:	3310      	adds	r3, #16
 800590c:	4618      	mov	r0, r3
 800590e:	f000 ff85 	bl	800681c <xTaskRemoveFromEventList>
 8005912:	4603      	mov	r3, r0
 8005914:	2b00      	cmp	r3, #0
 8005916:	d007      	beq.n	8005928 <xQueueSemaphoreTake+0xcc>
 8005918:	4b53      	ldr	r3, [pc, #332]	; (8005a68 <xQueueSemaphoreTake+0x20c>)
 800591a:	f04f 5280 	mov.w	r2, #268435456	; 0x10000000
 800591e:	601a      	str	r2, [r3, #0]
 8005920:	f3bf 8f4f 	dsb	sy
 8005924:	f3bf 8f6f 	isb	sy
 8005928:	f002 f956 	bl	8007bd8 <vPortExitCritical>
 800592c:	2301      	movs	r3, #1
 800592e:	e096      	b.n	8005a5e <xQueueSemaphoreTake+0x202>
 8005930:	683b      	ldr	r3, [r7, #0]
 8005932:	2b00      	cmp	r3, #0
 8005934:	d110      	bne.n	8005958 <xQueueSemaphoreTake+0xfc>
 8005936:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 8005938:	2b00      	cmp	r3, #0
 800593a:	d009      	beq.n	8005950 <xQueueSemaphoreTake+0xf4>
 800593c:	f04f 0350 	mov.w	r3, #80	; 0x50
 8005940:	f383 8811 	msr	BASEPRI, r3
 8005944:	f3bf 8f6f 	isb	sy
 8005948:	f3bf 8f4f 	dsb	sy
 800594c:	617b      	str	r3, [r7, #20]
 800594e:	e7fe      	b.n	800594e <xQueueSemaphoreTake+0xf2>
 8005950:	f002 f942 	bl	8007bd8 <vPortExitCritical>
 8005954:	2300      	movs	r3, #0
 8005956:	e082      	b.n	8005a5e <xQueueSemaphoreTake+0x202>
 8005958:	6b7b      	ldr	r3, [r7, #52]	; 0x34
 800595a:	2b00      	cmp	r3, #0
 800595c:	d106      	bne.n	800596c <xQueueSemaphoreTake+0x110>
 800595e:	f107 030c 	add.w	r3, r7, #12
 8005962:	4618      	mov	r0, r3
 8005964:	f000 ffbc 	bl	80068e0 <vTaskInternalSetTimeOutState>
 8005968:	2301      	movs	r3, #1
 800596a:	637b      	str	r3, [r7, #52]	; 0x34
 800596c:	f002 f934 	bl	8007bd8 <vPortExitCritical>
 8005970:	f000 fcf4 	bl	800635c <vTaskSuspendAll>
 8005974:	f002 f902 	bl	8007b7c <vPortEnterCritical>
 8005978:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 800597a:	f893 3044 	ldrb.w	r3, [r3, #68]	; 0x44
 800597e:	b25b      	sxtb	r3, r3
 8005980:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
 8005984:	d103      	bne.n	800598e <xQueueSemaphoreTake+0x132>
 8005986:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 8005988:	2200      	movs	r2, #0
 800598a:	f883 2044 	strb.w	r2, [r3, #68]	; 0x44
 800598e:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 8005990:	f893 3045 	ldrb.w	r3, [r3, #69]	; 0x45
 8005994:	b25b      	sxtb	r3, r3
 8005996:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
 800599a:	d103      	bne.n	80059a4 <xQueueSemaphoreTake+0x148>
 800599c:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 800599e:	2200      	movs	r2, #0
 80059a0:	f883 2045 	strb.w	r2, [r3, #69]	; 0x45
 80059a4:	f002 f918 	bl	8007bd8 <vPortExitCritical>
 80059a8:	463a      	mov	r2, r7
 80059aa:	f107 030c 	add.w	r3, r7, #12
 80059ae:	4611      	mov	r1, r2
 80059b0:	4618      	mov	r0, r3
 80059b2:	f000 ffab 	bl	800690c <xTaskCheckForTimeOut>
 80059b6:	4603      	mov	r3, r0
 80059b8:	2b00      	cmp	r3, #0
 80059ba:	d132      	bne.n	8005a22 <xQueueSemaphoreTake+0x1c6>
 80059bc:	6af8      	ldr	r0, [r7, #44]	; 0x2c
 80059be:	f000 f94f 	bl	8005c60 <prvIsQueueEmpty>
 80059c2:	4603      	mov	r3, r0
 80059c4:	2b00      	cmp	r3, #0
 80059c6:	d026      	beq.n	8005a16 <xQueueSemaphoreTake+0x1ba>
 80059c8:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 80059ca:	681b      	ldr	r3, [r3, #0]
 80059cc:	2b00      	cmp	r3, #0
 80059ce:	d109      	bne.n	80059e4 <xQueueSemaphoreTake+0x188>
 80059d0:	f002 f8d4 	bl	8007b7c <vPortEnterCritical>
 80059d4:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 80059d6:	689b      	ldr	r3, [r3, #8]
 80059d8:	4618      	mov	r0, r3
 80059da:	f001 f90b 	bl	8006bf4 <xTaskPriorityInherit>
 80059de:	6338      	str	r0, [r7, #48]	; 0x30
 80059e0:	f002 f8fa 	bl	8007bd8 <vPortExitCritical>
 80059e4:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 80059e6:	3324      	adds	r3, #36	; 0x24
 80059e8:	683a      	ldr	r2, [r7, #0]
 80059ea:	4611      	mov	r1, r2
 80059ec:	4618      	mov	r0, r3
 80059ee:	f000 fec7 	bl	8006780 <vTaskPlaceOnEventList>
 80059f2:	6af8      	ldr	r0, [r7, #44]	; 0x2c
 80059f4:	f000 f8e2 	bl	8005bbc <prvUnlockQueue>
 80059f8:	f000 fcbe 	bl	8006378 <xTaskResumeAll>
 80059fc:	4603      	mov	r3, r0
 80059fe:	2b00      	cmp	r3, #0
 8005a00:	f47f af69 	bne.w	80058d6 <xQueueSemaphoreTake+0x7a>
 8005a04:	4b18      	ldr	r3, [pc, #96]	; (8005a68 <xQueueSemaphoreTake+0x20c>)
 8005a06:	f04f 5280 	mov.w	r2, #268435456	; 0x10000000
 8005a0a:	601a      	str	r2, [r3, #0]
 8005a0c:	f3bf 8f4f 	dsb	sy
 8005a10:	f3bf 8f6f 	isb	sy
 8005a14:	e75f      	b.n	80058d6 <xQueueSemaphoreTake+0x7a>
 8005a16:	6af8      	ldr	r0, [r7, #44]	; 0x2c
 8005a18:	f000 f8d0 	bl	8005bbc <prvUnlockQueue>
 8005a1c:	f000 fcac 	bl	8006378 <xTaskResumeAll>
 8005a20:	e759      	b.n	80058d6 <xQueueSemaphoreTake+0x7a>
 8005a22:	6af8      	ldr	r0, [r7, #44]	; 0x2c
 8005a24:	f000 f8ca 	bl	8005bbc <prvUnlockQueue>
 8005a28:	f000 fca6 	bl	8006378 <xTaskResumeAll>
 8005a2c:	6af8      	ldr	r0, [r7, #44]	; 0x2c
 8005a2e:	f000 f917 	bl	8005c60 <prvIsQueueEmpty>
 8005a32:	4603      	mov	r3, r0
 8005a34:	2b00      	cmp	r3, #0
 8005a36:	f43f af4e 	beq.w	80058d6 <xQueueSemaphoreTake+0x7a>
 8005a3a:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 8005a3c:	2b00      	cmp	r3, #0
 8005a3e:	d00d      	beq.n	8005a5c <xQueueSemaphoreTake+0x200>
 8005a40:	f002 f89c 	bl	8007b7c <vPortEnterCritical>
 8005a44:	6af8      	ldr	r0, [r7, #44]	; 0x2c
 8005a46:	f000 f811 	bl	8005a6c <prvGetDisinheritPriorityAfterTimeout>
 8005a4a:	6278      	str	r0, [r7, #36]	; 0x24
 8005a4c:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 8005a4e:	689b      	ldr	r3, [r3, #8]
 8005a50:	6a79      	ldr	r1, [r7, #36]	; 0x24
 8005a52:	4618      	mov	r0, r3
 8005a54:	f001 f9d2 	bl	8006dfc <vTaskPriorityDisinheritAfterTimeout>
 8005a58:	f002 f8be 	bl	8007bd8 <vPortExitCritical>
 8005a5c:	2300      	movs	r3, #0
 8005a5e:	4618      	mov	r0, r3
 8005a60:	3738      	adds	r7, #56	; 0x38
 8005a62:	46bd      	mov	sp, r7
 8005a64:	bd80      	pop	{r7, pc}
 8005a66:	bf00      	nop
 8005a68:	e000ed04 	.word	0xe000ed04

08005a6c <prvGetDisinheritPriorityAfterTimeout>:
 8005a6c:	b480      	push	{r7}
 8005a6e:	b085      	sub	sp, #20
 8005a70:	af00      	add	r7, sp, #0
 8005a72:	6078      	str	r0, [r7, #4]
 8005a74:	687b      	ldr	r3, [r7, #4]
 8005a76:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 8005a78:	2b00      	cmp	r3, #0
 8005a7a:	d006      	beq.n	8005a8a <prvGetDisinheritPriorityAfterTimeout+0x1e>
 8005a7c:	687b      	ldr	r3, [r7, #4]
 8005a7e:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8005a80:	681b      	ldr	r3, [r3, #0]
 8005a82:	f1c3 0305 	rsb	r3, r3, #5
 8005a86:	60fb      	str	r3, [r7, #12]
 8005a88:	e001      	b.n	8005a8e <prvGetDisinheritPriorityAfterTimeout+0x22>
 8005a8a:	2300      	movs	r3, #0
 8005a8c:	60fb      	str	r3, [r7, #12]
 8005a8e:	68fb      	ldr	r3, [r7, #12]
 8005a90:	4618      	mov	r0, r3
 8005a92:	3714      	adds	r7, #20
 8005a94:	46bd      	mov	sp, r7
 8005a96:	f85d 7b04 	ldr.w	r7, [sp], #4
 8005a9a:	4770      	bx	lr

08005a9c <prvCopyDataToQueue>:
 8005a9c:	b580      	push	{r7, lr}
 8005a9e:	b086      	sub	sp, #24
 8005aa0:	af00      	add	r7, sp, #0
 8005aa2:	60f8      	str	r0, [r7, #12]
 8005aa4:	60b9      	str	r1, [r7, #8]
 8005aa6:	607a      	str	r2, [r7, #4]
 8005aa8:	2300      	movs	r3, #0
 8005aaa:	617b      	str	r3, [r7, #20]
 8005aac:	68fb      	ldr	r3, [r7, #12]
 8005aae:	6b9b      	ldr	r3, [r3, #56]	; 0x38
 8005ab0:	613b      	str	r3, [r7, #16]
 8005ab2:	68fb      	ldr	r3, [r7, #12]
 8005ab4:	6c1b      	ldr	r3, [r3, #64]	; 0x40
 8005ab6:	2b00      	cmp	r3, #0
 8005ab8:	d10d      	bne.n	8005ad6 <prvCopyDataToQueue+0x3a>
 8005aba:	68fb      	ldr	r3, [r7, #12]
 8005abc:	681b      	ldr	r3, [r3, #0]
 8005abe:	2b00      	cmp	r3, #0
 8005ac0:	d14d      	bne.n	8005b5e <prvCopyDataToQueue+0xc2>
 8005ac2:	68fb      	ldr	r3, [r7, #12]
 8005ac4:	689b      	ldr	r3, [r3, #8]
 8005ac6:	4618      	mov	r0, r3
 8005ac8:	f001 f914 	bl	8006cf4 <xTaskPriorityDisinherit>
 8005acc:	6178      	str	r0, [r7, #20]
 8005ace:	68fb      	ldr	r3, [r7, #12]
 8005ad0:	2200      	movs	r2, #0
 8005ad2:	609a      	str	r2, [r3, #8]
 8005ad4:	e043      	b.n	8005b5e <prvCopyDataToQueue+0xc2>
 8005ad6:	687b      	ldr	r3, [r7, #4]
 8005ad8:	2b00      	cmp	r3, #0
 8005ada:	d119      	bne.n	8005b10 <prvCopyDataToQueue+0x74>
 8005adc:	68fb      	ldr	r3, [r7, #12]
 8005ade:	6858      	ldr	r0, [r3, #4]
 8005ae0:	68fb      	ldr	r3, [r7, #12]
 8005ae2:	6c1b      	ldr	r3, [r3, #64]	; 0x40
 8005ae4:	461a      	mov	r2, r3
 8005ae6:	68b9      	ldr	r1, [r7, #8]
 8005ae8:	f002 ffec 	bl	8008ac4 <memcpy>
 8005aec:	68fb      	ldr	r3, [r7, #12]
 8005aee:	685a      	ldr	r2, [r3, #4]
 8005af0:	68fb      	ldr	r3, [r7, #12]
 8005af2:	6c1b      	ldr	r3, [r3, #64]	; 0x40
 8005af4:	441a      	add	r2, r3
 8005af6:	68fb      	ldr	r3, [r7, #12]
 8005af8:	605a      	str	r2, [r3, #4]
 8005afa:	68fb      	ldr	r3, [r7, #12]
 8005afc:	685a      	ldr	r2, [r3, #4]
 8005afe:	68fb      	ldr	r3, [r7, #12]
 8005b00:	689b      	ldr	r3, [r3, #8]
 8005b02:	429a      	cmp	r2, r3
 8005b04:	d32b      	bcc.n	8005b5e <prvCopyDataToQueue+0xc2>
 8005b06:	68fb      	ldr	r3, [r7, #12]
 8005b08:	681a      	ldr	r2, [r3, #0]
 8005b0a:	68fb      	ldr	r3, [r7, #12]
 8005b0c:	605a      	str	r2, [r3, #4]
 8005b0e:	e026      	b.n	8005b5e <prvCopyDataToQueue+0xc2>
 8005b10:	68fb      	ldr	r3, [r7, #12]
 8005b12:	68d8      	ldr	r0, [r3, #12]
 8005b14:	68fb      	ldr	r3, [r7, #12]
 8005b16:	6c1b      	ldr	r3, [r3, #64]	; 0x40
 8005b18:	461a      	mov	r2, r3
 8005b1a:	68b9      	ldr	r1, [r7, #8]
 8005b1c:	f002 ffd2 	bl	8008ac4 <memcpy>
 8005b20:	68fb      	ldr	r3, [r7, #12]
 8005b22:	68da      	ldr	r2, [r3, #12]
 8005b24:	68fb      	ldr	r3, [r7, #12]
 8005b26:	6c1b      	ldr	r3, [r3, #64]	; 0x40
 8005b28:	425b      	negs	r3, r3
 8005b2a:	441a      	add	r2, r3
 8005b2c:	68fb      	ldr	r3, [r7, #12]
 8005b2e:	60da      	str	r2, [r3, #12]
 8005b30:	68fb      	ldr	r3, [r7, #12]
 8005b32:	68da      	ldr	r2, [r3, #12]
 8005b34:	68fb      	ldr	r3, [r7, #12]
 8005b36:	681b      	ldr	r3, [r3, #0]
 8005b38:	429a      	cmp	r2, r3
 8005b3a:	d207      	bcs.n	8005b4c <prvCopyDataToQueue+0xb0>
 8005b3c:	68fb      	ldr	r3, [r7, #12]
 8005b3e:	689a      	ldr	r2, [r3, #8]
 8005b40:	68fb      	ldr	r3, [r7, #12]
 8005b42:	6c1b      	ldr	r3, [r3, #64]	; 0x40
 8005b44:	425b      	negs	r3, r3
 8005b46:	441a      	add	r2, r3
 8005b48:	68fb      	ldr	r3, [r7, #12]
 8005b4a:	60da      	str	r2, [r3, #12]
 8005b4c:	687b      	ldr	r3, [r7, #4]
 8005b4e:	2b02      	cmp	r3, #2
 8005b50:	d105      	bne.n	8005b5e <prvCopyDataToQueue+0xc2>
 8005b52:	693b      	ldr	r3, [r7, #16]
 8005b54:	2b00      	cmp	r3, #0
 8005b56:	d002      	beq.n	8005b5e <prvCopyDataToQueue+0xc2>
 8005b58:	693b      	ldr	r3, [r7, #16]
 8005b5a:	3b01      	subs	r3, #1
 8005b5c:	613b      	str	r3, [r7, #16]
 8005b5e:	693b      	ldr	r3, [r7, #16]
 8005b60:	1c5a      	adds	r2, r3, #1
 8005b62:	68fb      	ldr	r3, [r7, #12]
 8005b64:	639a      	str	r2, [r3, #56]	; 0x38
 8005b66:	697b      	ldr	r3, [r7, #20]
 8005b68:	4618      	mov	r0, r3
 8005b6a:	3718      	adds	r7, #24
 8005b6c:	46bd      	mov	sp, r7
 8005b6e:	bd80      	pop	{r7, pc}

08005b70 <prvCopyDataFromQueue>:
 8005b70:	b580      	push	{r7, lr}
 8005b72:	b082      	sub	sp, #8
 8005b74:	af00      	add	r7, sp, #0
 8005b76:	6078      	str	r0, [r7, #4]
 8005b78:	6039      	str	r1, [r7, #0]
 8005b7a:	687b      	ldr	r3, [r7, #4]
 8005b7c:	6c1b      	ldr	r3, [r3, #64]	; 0x40
 8005b7e:	2b00      	cmp	r3, #0
 8005b80:	d018      	beq.n	8005bb4 <prvCopyDataFromQueue+0x44>
 8005b82:	687b      	ldr	r3, [r7, #4]
 8005b84:	68da      	ldr	r2, [r3, #12]
 8005b86:	687b      	ldr	r3, [r7, #4]
 8005b88:	6c1b      	ldr	r3, [r3, #64]	; 0x40
 8005b8a:	441a      	add	r2, r3
 8005b8c:	687b      	ldr	r3, [r7, #4]
 8005b8e:	60da      	str	r2, [r3, #12]
 8005b90:	687b      	ldr	r3, [r7, #4]
 8005b92:	68da      	ldr	r2, [r3, #12]
 8005b94:	687b      	ldr	r3, [r7, #4]
 8005b96:	689b      	ldr	r3, [r3, #8]
 8005b98:	429a      	cmp	r2, r3
 8005b9a:	d303      	bcc.n	8005ba4 <prvCopyDataFromQueue+0x34>
 8005b9c:	687b      	ldr	r3, [r7, #4]
 8005b9e:	681a      	ldr	r2, [r3, #0]
 8005ba0:	687b      	ldr	r3, [r7, #4]
 8005ba2:	60da      	str	r2, [r3, #12]
 8005ba4:	687b      	ldr	r3, [r7, #4]
 8005ba6:	68d9      	ldr	r1, [r3, #12]
 8005ba8:	687b      	ldr	r3, [r7, #4]
 8005baa:	6c1b      	ldr	r3, [r3, #64]	; 0x40
 8005bac:	461a      	mov	r2, r3
 8005bae:	6838      	ldr	r0, [r7, #0]
 8005bb0:	f002 ff88 	bl	8008ac4 <memcpy>
 8005bb4:	bf00      	nop
 8005bb6:	3708      	adds	r7, #8
 8005bb8:	46bd      	mov	sp, r7
 8005bba:	bd80      	pop	{r7, pc}

08005bbc <prvUnlockQueue>:
 8005bbc:	b580      	push	{r7, lr}
 8005bbe:	b084      	sub	sp, #16
 8005bc0:	af00      	add	r7, sp, #0
 8005bc2:	6078      	str	r0, [r7, #4]
 8005bc4:	f001 ffda 	bl	8007b7c <vPortEnterCritical>
 8005bc8:	687b      	ldr	r3, [r7, #4]
 8005bca:	f893 3045 	ldrb.w	r3, [r3, #69]	; 0x45
 8005bce:	73fb      	strb	r3, [r7, #15]
 8005bd0:	e011      	b.n	8005bf6 <prvUnlockQueue+0x3a>
 8005bd2:	687b      	ldr	r3, [r7, #4]
 8005bd4:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 8005bd6:	2b00      	cmp	r3, #0
 8005bd8:	d012      	beq.n	8005c00 <prvUnlockQueue+0x44>
 8005bda:	687b      	ldr	r3, [r7, #4]
 8005bdc:	3324      	adds	r3, #36	; 0x24
 8005bde:	4618      	mov	r0, r3
 8005be0:	f000 fe1c 	bl	800681c <xTaskRemoveFromEventList>
 8005be4:	4603      	mov	r3, r0
 8005be6:	2b00      	cmp	r3, #0
 8005be8:	d001      	beq.n	8005bee <prvUnlockQueue+0x32>
 8005bea:	f000 feef 	bl	80069cc <vTaskMissedYield>
 8005bee:	7bfb      	ldrb	r3, [r7, #15]
 8005bf0:	3b01      	subs	r3, #1
 8005bf2:	b2db      	uxtb	r3, r3
 8005bf4:	73fb      	strb	r3, [r7, #15]
 8005bf6:	f997 300f 	ldrsb.w	r3, [r7, #15]
 8005bfa:	2b00      	cmp	r3, #0
 8005bfc:	dce9      	bgt.n	8005bd2 <prvUnlockQueue+0x16>
 8005bfe:	e000      	b.n	8005c02 <prvUnlockQueue+0x46>
 8005c00:	bf00      	nop
 8005c02:	687b      	ldr	r3, [r7, #4]
 8005c04:	22ff      	movs	r2, #255	; 0xff
 8005c06:	f883 2045 	strb.w	r2, [r3, #69]	; 0x45
 8005c0a:	f001 ffe5 	bl	8007bd8 <vPortExitCritical>
 8005c0e:	f001 ffb5 	bl	8007b7c <vPortEnterCritical>
 8005c12:	687b      	ldr	r3, [r7, #4]
 8005c14:	f893 3044 	ldrb.w	r3, [r3, #68]	; 0x44
 8005c18:	73bb      	strb	r3, [r7, #14]
 8005c1a:	e011      	b.n	8005c40 <prvUnlockQueue+0x84>
 8005c1c:	687b      	ldr	r3, [r7, #4]
 8005c1e:	691b      	ldr	r3, [r3, #16]
 8005c20:	2b00      	cmp	r3, #0
 8005c22:	d012      	beq.n	8005c4a <prvUnlockQueue+0x8e>
 8005c24:	687b      	ldr	r3, [r7, #4]
 8005c26:	3310      	adds	r3, #16
 8005c28:	4618      	mov	r0, r3
 8005c2a:	f000 fdf7 	bl	800681c <xTaskRemoveFromEventList>
 8005c2e:	4603      	mov	r3, r0
 8005c30:	2b00      	cmp	r3, #0
 8005c32:	d001      	beq.n	8005c38 <prvUnlockQueue+0x7c>
 8005c34:	f000 feca 	bl	80069cc <vTaskMissedYield>
 8005c38:	7bbb      	ldrb	r3, [r7, #14]
 8005c3a:	3b01      	subs	r3, #1
 8005c3c:	b2db      	uxtb	r3, r3
 8005c3e:	73bb      	strb	r3, [r7, #14]
 8005c40:	f997 300e 	ldrsb.w	r3, [r7, #14]
 8005c44:	2b00      	cmp	r3, #0
 8005c46:	dce9      	bgt.n	8005c1c <prvUnlockQueue+0x60>
 8005c48:	e000      	b.n	8005c4c <prvUnlockQueue+0x90>
 8005c4a:	bf00      	nop
 8005c4c:	687b      	ldr	r3, [r7, #4]
 8005c4e:	22ff      	movs	r2, #255	; 0xff
 8005c50:	f883 2044 	strb.w	r2, [r3, #68]	; 0x44
 8005c54:	f001 ffc0 	bl	8007bd8 <vPortExitCritical>
 8005c58:	bf00      	nop
 8005c5a:	3710      	adds	r7, #16
 8005c5c:	46bd      	mov	sp, r7
 8005c5e:	bd80      	pop	{r7, pc}

08005c60 <prvIsQueueEmpty>:
 8005c60:	b580      	push	{r7, lr}
 8005c62:	b084      	sub	sp, #16
 8005c64:	af00      	add	r7, sp, #0
 8005c66:	6078      	str	r0, [r7, #4]
 8005c68:	f001 ff88 	bl	8007b7c <vPortEnterCritical>
 8005c6c:	687b      	ldr	r3, [r7, #4]
 8005c6e:	6b9b      	ldr	r3, [r3, #56]	; 0x38
 8005c70:	2b00      	cmp	r3, #0
 8005c72:	d102      	bne.n	8005c7a <prvIsQueueEmpty+0x1a>
 8005c74:	2301      	movs	r3, #1
 8005c76:	60fb      	str	r3, [r7, #12]
 8005c78:	e001      	b.n	8005c7e <prvIsQueueEmpty+0x1e>
 8005c7a:	2300      	movs	r3, #0
 8005c7c:	60fb      	str	r3, [r7, #12]
 8005c7e:	f001 ffab 	bl	8007bd8 <vPortExitCritical>
 8005c82:	68fb      	ldr	r3, [r7, #12]
 8005c84:	4618      	mov	r0, r3
 8005c86:	3710      	adds	r7, #16
 8005c88:	46bd      	mov	sp, r7
 8005c8a:	bd80      	pop	{r7, pc}

08005c8c <prvIsQueueFull>:
 8005c8c:	b580      	push	{r7, lr}
 8005c8e:	b084      	sub	sp, #16
 8005c90:	af00      	add	r7, sp, #0
 8005c92:	6078      	str	r0, [r7, #4]
 8005c94:	f001 ff72 	bl	8007b7c <vPortEnterCritical>
 8005c98:	687b      	ldr	r3, [r7, #4]
 8005c9a:	6b9a      	ldr	r2, [r3, #56]	; 0x38
 8005c9c:	687b      	ldr	r3, [r7, #4]
 8005c9e:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
 8005ca0:	429a      	cmp	r2, r3
 8005ca2:	d102      	bne.n	8005caa <prvIsQueueFull+0x1e>
 8005ca4:	2301      	movs	r3, #1
 8005ca6:	60fb      	str	r3, [r7, #12]
 8005ca8:	e001      	b.n	8005cae <prvIsQueueFull+0x22>
 8005caa:	2300      	movs	r3, #0
 8005cac:	60fb      	str	r3, [r7, #12]
 8005cae:	f001 ff93 	bl	8007bd8 <vPortExitCritical>
 8005cb2:	68fb      	ldr	r3, [r7, #12]
 8005cb4:	4618      	mov	r0, r3
 8005cb6:	3710      	adds	r7, #16
 8005cb8:	46bd      	mov	sp, r7
 8005cba:	bd80      	pop	{r7, pc}

08005cbc <vQueueAddToRegistry>:
 8005cbc:	b480      	push	{r7}
 8005cbe:	b085      	sub	sp, #20
 8005cc0:	af00      	add	r7, sp, #0
 8005cc2:	6078      	str	r0, [r7, #4]
 8005cc4:	6039      	str	r1, [r7, #0]
 8005cc6:	2300      	movs	r3, #0
 8005cc8:	60fb      	str	r3, [r7, #12]
 8005cca:	e014      	b.n	8005cf6 <vQueueAddToRegistry+0x3a>
 8005ccc:	4a0e      	ldr	r2, [pc, #56]	; (8005d08 <vQueueAddToRegistry+0x4c>)
 8005cce:	68fb      	ldr	r3, [r7, #12]
 8005cd0:	f852 3033 	ldr.w	r3, [r2, r3, lsl #3]
 8005cd4:	2b00      	cmp	r3, #0
 8005cd6:	d10b      	bne.n	8005cf0 <vQueueAddToRegistry+0x34>
 8005cd8:	490b      	ldr	r1, [pc, #44]	; (8005d08 <vQueueAddToRegistry+0x4c>)
 8005cda:	68fb      	ldr	r3, [r7, #12]
 8005cdc:	683a      	ldr	r2, [r7, #0]
 8005cde:	f841 2033 	str.w	r2, [r1, r3, lsl #3]
 8005ce2:	4a09      	ldr	r2, [pc, #36]	; (8005d08 <vQueueAddToRegistry+0x4c>)
 8005ce4:	68fb      	ldr	r3, [r7, #12]
 8005ce6:	00db      	lsls	r3, r3, #3
 8005ce8:	4413      	add	r3, r2
 8005cea:	687a      	ldr	r2, [r7, #4]
 8005cec:	605a      	str	r2, [r3, #4]
 8005cee:	e005      	b.n	8005cfc <vQueueAddToRegistry+0x40>
 8005cf0:	68fb      	ldr	r3, [r7, #12]
 8005cf2:	3301      	adds	r3, #1
 8005cf4:	60fb      	str	r3, [r7, #12]
 8005cf6:	68fb      	ldr	r3, [r7, #12]
 8005cf8:	2b07      	cmp	r3, #7
 8005cfa:	d9e7      	bls.n	8005ccc <vQueueAddToRegistry+0x10>
 8005cfc:	bf00      	nop
 8005cfe:	3714      	adds	r7, #20
 8005d00:	46bd      	mov	sp, r7
 8005d02:	f85d 7b04 	ldr.w	r7, [sp], #4
 8005d06:	4770      	bx	lr
 8005d08:	200192d0 	.word	0x200192d0

08005d0c <vQueueWaitForMessageRestricted>:
 8005d0c:	b580      	push	{r7, lr}
 8005d0e:	b086      	sub	sp, #24
 8005d10:	af00      	add	r7, sp, #0
 8005d12:	60f8      	str	r0, [r7, #12]
 8005d14:	60b9      	str	r1, [r7, #8]
 8005d16:	607a      	str	r2, [r7, #4]
 8005d18:	68fb      	ldr	r3, [r7, #12]
 8005d1a:	617b      	str	r3, [r7, #20]
 8005d1c:	f001 ff2e 	bl	8007b7c <vPortEnterCritical>
 8005d20:	697b      	ldr	r3, [r7, #20]
 8005d22:	f893 3044 	ldrb.w	r3, [r3, #68]	; 0x44
 8005d26:	b25b      	sxtb	r3, r3
 8005d28:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
 8005d2c:	d103      	bne.n	8005d36 <vQueueWaitForMessageRestricted+0x2a>
 8005d2e:	697b      	ldr	r3, [r7, #20]
 8005d30:	2200      	movs	r2, #0
 8005d32:	f883 2044 	strb.w	r2, [r3, #68]	; 0x44
 8005d36:	697b      	ldr	r3, [r7, #20]
 8005d38:	f893 3045 	ldrb.w	r3, [r3, #69]	; 0x45
 8005d3c:	b25b      	sxtb	r3, r3
 8005d3e:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
 8005d42:	d103      	bne.n	8005d4c <vQueueWaitForMessageRestricted+0x40>
 8005d44:	697b      	ldr	r3, [r7, #20]
 8005d46:	2200      	movs	r2, #0
 8005d48:	f883 2045 	strb.w	r2, [r3, #69]	; 0x45
 8005d4c:	f001 ff44 	bl	8007bd8 <vPortExitCritical>
 8005d50:	697b      	ldr	r3, [r7, #20]
 8005d52:	6b9b      	ldr	r3, [r3, #56]	; 0x38
 8005d54:	2b00      	cmp	r3, #0
 8005d56:	d106      	bne.n	8005d66 <vQueueWaitForMessageRestricted+0x5a>
 8005d58:	697b      	ldr	r3, [r7, #20]
 8005d5a:	3324      	adds	r3, #36	; 0x24
 8005d5c:	687a      	ldr	r2, [r7, #4]
 8005d5e:	68b9      	ldr	r1, [r7, #8]
 8005d60:	4618      	mov	r0, r3
 8005d62:	f000 fd31 	bl	80067c8 <vTaskPlaceOnEventListRestricted>
 8005d66:	6978      	ldr	r0, [r7, #20]
 8005d68:	f7ff ff28 	bl	8005bbc <prvUnlockQueue>
 8005d6c:	bf00      	nop
 8005d6e:	3718      	adds	r7, #24
 8005d70:	46bd      	mov	sp, r7
 8005d72:	bd80      	pop	{r7, pc}

08005d74 <vListInitialise>:
 8005d74:	b480      	push	{r7}
 8005d76:	b083      	sub	sp, #12
 8005d78:	af00      	add	r7, sp, #0
 8005d7a:	6078      	str	r0, [r7, #4]
 8005d7c:	687b      	ldr	r3, [r7, #4]
 8005d7e:	f103 0208 	add.w	r2, r3, #8
 8005d82:	687b      	ldr	r3, [r7, #4]
 8005d84:	605a      	str	r2, [r3, #4]
 8005d86:	687b      	ldr	r3, [r7, #4]
 8005d88:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
 8005d8c:	609a      	str	r2, [r3, #8]
 8005d8e:	687b      	ldr	r3, [r7, #4]
 8005d90:	f103 0208 	add.w	r2, r3, #8
 8005d94:	687b      	ldr	r3, [r7, #4]
 8005d96:	60da      	str	r2, [r3, #12]
 8005d98:	687b      	ldr	r3, [r7, #4]
 8005d9a:	f103 0208 	add.w	r2, r3, #8
 8005d9e:	687b      	ldr	r3, [r7, #4]
 8005da0:	611a      	str	r2, [r3, #16]
 8005da2:	687b      	ldr	r3, [r7, #4]
 8005da4:	2200      	movs	r2, #0
 8005da6:	601a      	str	r2, [r3, #0]
 8005da8:	bf00      	nop
 8005daa:	370c      	adds	r7, #12
 8005dac:	46bd      	mov	sp, r7
 8005dae:	f85d 7b04 	ldr.w	r7, [sp], #4
 8005db2:	4770      	bx	lr

08005db4 <vListInitialiseItem>:
 8005db4:	b480      	push	{r7}
 8005db6:	b083      	sub	sp, #12
 8005db8:	af00      	add	r7, sp, #0
 8005dba:	6078      	str	r0, [r7, #4]
 8005dbc:	687b      	ldr	r3, [r7, #4]
 8005dbe:	2200      	movs	r2, #0
 8005dc0:	611a      	str	r2, [r3, #16]
 8005dc2:	bf00      	nop
 8005dc4:	370c      	adds	r7, #12
 8005dc6:	46bd      	mov	sp, r7
 8005dc8:	f85d 7b04 	ldr.w	r7, [sp], #4
 8005dcc:	4770      	bx	lr

08005dce <vListInsertEnd>:
 8005dce:	b480      	push	{r7}
 8005dd0:	b085      	sub	sp, #20
 8005dd2:	af00      	add	r7, sp, #0
 8005dd4:	6078      	str	r0, [r7, #4]
 8005dd6:	6039      	str	r1, [r7, #0]
 8005dd8:	687b      	ldr	r3, [r7, #4]
 8005dda:	685b      	ldr	r3, [r3, #4]
 8005ddc:	60fb      	str	r3, [r7, #12]
 8005dde:	683b      	ldr	r3, [r7, #0]
 8005de0:	68fa      	ldr	r2, [r7, #12]
 8005de2:	605a      	str	r2, [r3, #4]
 8005de4:	68fb      	ldr	r3, [r7, #12]
 8005de6:	689a      	ldr	r2, [r3, #8]
 8005de8:	683b      	ldr	r3, [r7, #0]
 8005dea:	609a      	str	r2, [r3, #8]
 8005dec:	68fb      	ldr	r3, [r7, #12]
 8005dee:	689b      	ldr	r3, [r3, #8]
 8005df0:	683a      	ldr	r2, [r7, #0]
 8005df2:	605a      	str	r2, [r3, #4]
 8005df4:	68fb      	ldr	r3, [r7, #12]
 8005df6:	683a      	ldr	r2, [r7, #0]
 8005df8:	609a      	str	r2, [r3, #8]
 8005dfa:	683b      	ldr	r3, [r7, #0]
 8005dfc:	687a      	ldr	r2, [r7, #4]
 8005dfe:	611a      	str	r2, [r3, #16]
 8005e00:	687b      	ldr	r3, [r7, #4]
 8005e02:	681b      	ldr	r3, [r3, #0]
 8005e04:	1c5a      	adds	r2, r3, #1
 8005e06:	687b      	ldr	r3, [r7, #4]
 8005e08:	601a      	str	r2, [r3, #0]
 8005e0a:	bf00      	nop
 8005e0c:	3714      	adds	r7, #20
 8005e0e:	46bd      	mov	sp, r7
 8005e10:	f85d 7b04 	ldr.w	r7, [sp], #4
 8005e14:	4770      	bx	lr

08005e16 <vListInsert>:
 8005e16:	b480      	push	{r7}
 8005e18:	b085      	sub	sp, #20
 8005e1a:	af00      	add	r7, sp, #0
 8005e1c:	6078      	str	r0, [r7, #4]
 8005e1e:	6039      	str	r1, [r7, #0]
 8005e20:	683b      	ldr	r3, [r7, #0]
 8005e22:	681b      	ldr	r3, [r3, #0]
 8005e24:	60bb      	str	r3, [r7, #8]
 8005e26:	68bb      	ldr	r3, [r7, #8]
 8005e28:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
 8005e2c:	d103      	bne.n	8005e36 <vListInsert+0x20>
 8005e2e:	687b      	ldr	r3, [r7, #4]
 8005e30:	691b      	ldr	r3, [r3, #16]
 8005e32:	60fb      	str	r3, [r7, #12]
 8005e34:	e00c      	b.n	8005e50 <vListInsert+0x3a>
 8005e36:	687b      	ldr	r3, [r7, #4]
 8005e38:	3308      	adds	r3, #8
 8005e3a:	60fb      	str	r3, [r7, #12]
 8005e3c:	e002      	b.n	8005e44 <vListInsert+0x2e>
 8005e3e:	68fb      	ldr	r3, [r7, #12]
 8005e40:	685b      	ldr	r3, [r3, #4]
 8005e42:	60fb      	str	r3, [r7, #12]
 8005e44:	68fb      	ldr	r3, [r7, #12]
 8005e46:	685b      	ldr	r3, [r3, #4]
 8005e48:	681b      	ldr	r3, [r3, #0]
 8005e4a:	68ba      	ldr	r2, [r7, #8]
 8005e4c:	429a      	cmp	r2, r3
 8005e4e:	d2f6      	bcs.n	8005e3e <vListInsert+0x28>
 8005e50:	68fb      	ldr	r3, [r7, #12]
 8005e52:	685a      	ldr	r2, [r3, #4]
 8005e54:	683b      	ldr	r3, [r7, #0]
 8005e56:	605a      	str	r2, [r3, #4]
 8005e58:	683b      	ldr	r3, [r7, #0]
 8005e5a:	685b      	ldr	r3, [r3, #4]
 8005e5c:	683a      	ldr	r2, [r7, #0]
 8005e5e:	609a      	str	r2, [r3, #8]
 8005e60:	683b      	ldr	r3, [r7, #0]
 8005e62:	68fa      	ldr	r2, [r7, #12]
 8005e64:	609a      	str	r2, [r3, #8]
 8005e66:	68fb      	ldr	r3, [r7, #12]
 8005e68:	683a      	ldr	r2, [r7, #0]
 8005e6a:	605a      	str	r2, [r3, #4]
 8005e6c:	683b      	ldr	r3, [r7, #0]
 8005e6e:	687a      	ldr	r2, [r7, #4]
 8005e70:	611a      	str	r2, [r3, #16]
 8005e72:	687b      	ldr	r3, [r7, #4]
 8005e74:	681b      	ldr	r3, [r3, #0]
 8005e76:	1c5a      	adds	r2, r3, #1
 8005e78:	687b      	ldr	r3, [r7, #4]
 8005e7a:	601a      	str	r2, [r3, #0]
 8005e7c:	bf00      	nop
 8005e7e:	3714      	adds	r7, #20
 8005e80:	46bd      	mov	sp, r7
 8005e82:	f85d 7b04 	ldr.w	r7, [sp], #4
 8005e86:	4770      	bx	lr

08005e88 <uxListRemove>:
 8005e88:	b480      	push	{r7}
 8005e8a:	b085      	sub	sp, #20
 8005e8c:	af00      	add	r7, sp, #0
 8005e8e:	6078      	str	r0, [r7, #4]
 8005e90:	687b      	ldr	r3, [r7, #4]
 8005e92:	691b      	ldr	r3, [r3, #16]
 8005e94:	60fb      	str	r3, [r7, #12]
 8005e96:	687b      	ldr	r3, [r7, #4]
 8005e98:	685b      	ldr	r3, [r3, #4]
 8005e9a:	687a      	ldr	r2, [r7, #4]
 8005e9c:	6892      	ldr	r2, [r2, #8]
 8005e9e:	609a      	str	r2, [r3, #8]
 8005ea0:	687b      	ldr	r3, [r7, #4]
 8005ea2:	689b      	ldr	r3, [r3, #8]
 8005ea4:	687a      	ldr	r2, [r7, #4]
 8005ea6:	6852      	ldr	r2, [r2, #4]
 8005ea8:	605a      	str	r2, [r3, #4]
 8005eaa:	68fb      	ldr	r3, [r7, #12]
 8005eac:	685b      	ldr	r3, [r3, #4]
 8005eae:	687a      	ldr	r2, [r7, #4]
 8005eb0:	429a      	cmp	r2, r3
 8005eb2:	d103      	bne.n	8005ebc <uxListRemove+0x34>
 8005eb4:	687b      	ldr	r3, [r7, #4]
 8005eb6:	689a      	ldr	r2, [r3, #8]
 8005eb8:	68fb      	ldr	r3, [r7, #12]
 8005eba:	605a      	str	r2, [r3, #4]
 8005ebc:	687b      	ldr	r3, [r7, #4]
 8005ebe:	2200      	movs	r2, #0
 8005ec0:	611a      	str	r2, [r3, #16]
 8005ec2:	68fb      	ldr	r3, [r7, #12]
 8005ec4:	681b      	ldr	r3, [r3, #0]
 8005ec6:	1e5a      	subs	r2, r3, #1
 8005ec8:	68fb      	ldr	r3, [r7, #12]
 8005eca:	601a      	str	r2, [r3, #0]
 8005ecc:	68fb      	ldr	r3, [r7, #12]
 8005ece:	681b      	ldr	r3, [r3, #0]
 8005ed0:	4618      	mov	r0, r3
 8005ed2:	3714      	adds	r7, #20
 8005ed4:	46bd      	mov	sp, r7
 8005ed6:	f85d 7b04 	ldr.w	r7, [sp], #4
 8005eda:	4770      	bx	lr

08005edc <xTaskCreateStatic>:
 8005edc:	b580      	push	{r7, lr}
 8005ede:	b08e      	sub	sp, #56	; 0x38
 8005ee0:	af04      	add	r7, sp, #16
 8005ee2:	60f8      	str	r0, [r7, #12]
 8005ee4:	60b9      	str	r1, [r7, #8]
 8005ee6:	607a      	str	r2, [r7, #4]
 8005ee8:	603b      	str	r3, [r7, #0]
 8005eea:	6b7b      	ldr	r3, [r7, #52]	; 0x34
 8005eec:	2b00      	cmp	r3, #0
 8005eee:	d109      	bne.n	8005f04 <xTaskCreateStatic+0x28>
 8005ef0:	f04f 0350 	mov.w	r3, #80	; 0x50
 8005ef4:	f383 8811 	msr	BASEPRI, r3
 8005ef8:	f3bf 8f6f 	isb	sy
 8005efc:	f3bf 8f4f 	dsb	sy
 8005f00:	623b      	str	r3, [r7, #32]
 8005f02:	e7fe      	b.n	8005f02 <xTaskCreateStatic+0x26>
 8005f04:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 8005f06:	2b00      	cmp	r3, #0
 8005f08:	d109      	bne.n	8005f1e <xTaskCreateStatic+0x42>
 8005f0a:	f04f 0350 	mov.w	r3, #80	; 0x50
 8005f0e:	f383 8811 	msr	BASEPRI, r3
 8005f12:	f3bf 8f6f 	isb	sy
 8005f16:	f3bf 8f4f 	dsb	sy
 8005f1a:	61fb      	str	r3, [r7, #28]
 8005f1c:	e7fe      	b.n	8005f1c <xTaskCreateStatic+0x40>
 8005f1e:	f44f 6390 	mov.w	r3, #1152	; 0x480
 8005f22:	613b      	str	r3, [r7, #16]
 8005f24:	693b      	ldr	r3, [r7, #16]
 8005f26:	f5b3 6f90 	cmp.w	r3, #1152	; 0x480
 8005f2a:	d009      	beq.n	8005f40 <xTaskCreateStatic+0x64>
 8005f2c:	f04f 0350 	mov.w	r3, #80	; 0x50
 8005f30:	f383 8811 	msr	BASEPRI, r3
 8005f34:	f3bf 8f6f 	isb	sy
 8005f38:	f3bf 8f4f 	dsb	sy
 8005f3c:	61bb      	str	r3, [r7, #24]
 8005f3e:	e7fe      	b.n	8005f3e <xTaskCreateStatic+0x62>
 8005f40:	693b      	ldr	r3, [r7, #16]
 8005f42:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 8005f44:	2b00      	cmp	r3, #0
 8005f46:	d01e      	beq.n	8005f86 <xTaskCreateStatic+0xaa>
 8005f48:	6b7b      	ldr	r3, [r7, #52]	; 0x34
 8005f4a:	2b00      	cmp	r3, #0
 8005f4c:	d01b      	beq.n	8005f86 <xTaskCreateStatic+0xaa>
 8005f4e:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 8005f50:	627b      	str	r3, [r7, #36]	; 0x24
 8005f52:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8005f54:	6b7a      	ldr	r2, [r7, #52]	; 0x34
 8005f56:	631a      	str	r2, [r3, #48]	; 0x30
 8005f58:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8005f5a:	2202      	movs	r2, #2
 8005f5c:	f883 247d 	strb.w	r2, [r3, #1149]	; 0x47d
 8005f60:	2300      	movs	r3, #0
 8005f62:	9303      	str	r3, [sp, #12]
 8005f64:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8005f66:	9302      	str	r3, [sp, #8]
 8005f68:	f107 0314 	add.w	r3, r7, #20
 8005f6c:	9301      	str	r3, [sp, #4]
 8005f6e:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 8005f70:	9300      	str	r3, [sp, #0]
 8005f72:	683b      	ldr	r3, [r7, #0]
 8005f74:	687a      	ldr	r2, [r7, #4]
 8005f76:	68b9      	ldr	r1, [r7, #8]
 8005f78:	68f8      	ldr	r0, [r7, #12]
 8005f7a:	f000 f80b 	bl	8005f94 <prvInitialiseNewTask>
 8005f7e:	6a78      	ldr	r0, [r7, #36]	; 0x24
 8005f80:	f000 f8dc 	bl	800613c <prvAddNewTaskToReadyList>
 8005f84:	e001      	b.n	8005f8a <xTaskCreateStatic+0xae>
 8005f86:	2300      	movs	r3, #0
 8005f88:	617b      	str	r3, [r7, #20]
 8005f8a:	697b      	ldr	r3, [r7, #20]
 8005f8c:	4618      	mov	r0, r3
 8005f8e:	3728      	adds	r7, #40	; 0x28
 8005f90:	46bd      	mov	sp, r7
 8005f92:	bd80      	pop	{r7, pc}

08005f94 <prvInitialiseNewTask>:
 8005f94:	b590      	push	{r4, r7, lr}
 8005f96:	b089      	sub	sp, #36	; 0x24
 8005f98:	af00      	add	r7, sp, #0
 8005f9a:	60f8      	str	r0, [r7, #12]
 8005f9c:	60b9      	str	r1, [r7, #8]
 8005f9e:	607a      	str	r2, [r7, #4]
 8005fa0:	603b      	str	r3, [r7, #0]
 8005fa2:	68bb      	ldr	r3, [r7, #8]
 8005fa4:	2b00      	cmp	r3, #0
 8005fa6:	d109      	bne.n	8005fbc <prvInitialiseNewTask+0x28>
 8005fa8:	f04f 0350 	mov.w	r3, #80	; 0x50
 8005fac:	f383 8811 	msr	BASEPRI, r3
 8005fb0:	f3bf 8f6f 	isb	sy
 8005fb4:	f3bf 8f4f 	dsb	sy
 8005fb8:	617b      	str	r3, [r7, #20]
 8005fba:	e7fe      	b.n	8005fba <prvInitialiseNewTask+0x26>
 8005fbc:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 8005fbe:	6b18      	ldr	r0, [r3, #48]	; 0x30
 8005fc0:	687b      	ldr	r3, [r7, #4]
 8005fc2:	009b      	lsls	r3, r3, #2
 8005fc4:	461a      	mov	r2, r3
 8005fc6:	21a5      	movs	r1, #165	; 0xa5
 8005fc8:	f002 fd87 	bl	8008ada <memset>
 8005fcc:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 8005fce:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8005fd0:	687b      	ldr	r3, [r7, #4]
 8005fd2:	f103 4380 	add.w	r3, r3, #1073741824	; 0x40000000
 8005fd6:	3b01      	subs	r3, #1
 8005fd8:	009b      	lsls	r3, r3, #2
 8005fda:	4413      	add	r3, r2
 8005fdc:	61bb      	str	r3, [r7, #24]
 8005fde:	69bb      	ldr	r3, [r7, #24]
 8005fe0:	f023 0307 	bic.w	r3, r3, #7
 8005fe4:	61bb      	str	r3, [r7, #24]
 8005fe6:	69bb      	ldr	r3, [r7, #24]
 8005fe8:	f003 0307 	and.w	r3, r3, #7
 8005fec:	2b00      	cmp	r3, #0
 8005fee:	d009      	beq.n	8006004 <prvInitialiseNewTask+0x70>
 8005ff0:	f04f 0350 	mov.w	r3, #80	; 0x50
 8005ff4:	f383 8811 	msr	BASEPRI, r3
 8005ff8:	f3bf 8f6f 	isb	sy
 8005ffc:	f3bf 8f4f 	dsb	sy
 8006000:	613b      	str	r3, [r7, #16]
 8006002:	e7fe      	b.n	8006002 <prvInitialiseNewTask+0x6e>
 8006004:	2300      	movs	r3, #0
 8006006:	61fb      	str	r3, [r7, #28]
 8006008:	e012      	b.n	8006030 <prvInitialiseNewTask+0x9c>
 800600a:	68ba      	ldr	r2, [r7, #8]
 800600c:	69fb      	ldr	r3, [r7, #28]
 800600e:	4413      	add	r3, r2
 8006010:	7819      	ldrb	r1, [r3, #0]
 8006012:	6bba      	ldr	r2, [r7, #56]	; 0x38
 8006014:	69fb      	ldr	r3, [r7, #28]
 8006016:	4413      	add	r3, r2
 8006018:	3334      	adds	r3, #52	; 0x34
 800601a:	460a      	mov	r2, r1
 800601c:	701a      	strb	r2, [r3, #0]
 800601e:	68ba      	ldr	r2, [r7, #8]
 8006020:	69fb      	ldr	r3, [r7, #28]
 8006022:	4413      	add	r3, r2
 8006024:	781b      	ldrb	r3, [r3, #0]
 8006026:	2b00      	cmp	r3, #0
 8006028:	d006      	beq.n	8006038 <prvInitialiseNewTask+0xa4>
 800602a:	69fb      	ldr	r3, [r7, #28]
 800602c:	3301      	adds	r3, #1
 800602e:	61fb      	str	r3, [r7, #28]
 8006030:	69fb      	ldr	r3, [r7, #28]
 8006032:	2b09      	cmp	r3, #9
 8006034:	d9e9      	bls.n	800600a <prvInitialiseNewTask+0x76>
 8006036:	e000      	b.n	800603a <prvInitialiseNewTask+0xa6>
 8006038:	bf00      	nop
 800603a:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 800603c:	2200      	movs	r2, #0
 800603e:	f883 203d 	strb.w	r2, [r3, #61]	; 0x3d
 8006042:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 8006044:	2b04      	cmp	r3, #4
 8006046:	d901      	bls.n	800604c <prvInitialiseNewTask+0xb8>
 8006048:	2304      	movs	r3, #4
 800604a:	633b      	str	r3, [r7, #48]	; 0x30
 800604c:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 800604e:	6b3a      	ldr	r2, [r7, #48]	; 0x30
 8006050:	62da      	str	r2, [r3, #44]	; 0x2c
 8006052:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 8006054:	6b3a      	ldr	r2, [r7, #48]	; 0x30
 8006056:	649a      	str	r2, [r3, #72]	; 0x48
 8006058:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 800605a:	2200      	movs	r2, #0
 800605c:	64da      	str	r2, [r3, #76]	; 0x4c
 800605e:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 8006060:	3304      	adds	r3, #4
 8006062:	4618      	mov	r0, r3
 8006064:	f7ff fea6 	bl	8005db4 <vListInitialiseItem>
 8006068:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 800606a:	3318      	adds	r3, #24
 800606c:	4618      	mov	r0, r3
 800606e:	f7ff fea1 	bl	8005db4 <vListInitialiseItem>
 8006072:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 8006074:	6bba      	ldr	r2, [r7, #56]	; 0x38
 8006076:	611a      	str	r2, [r3, #16]
 8006078:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 800607a:	f1c3 0205 	rsb	r2, r3, #5
 800607e:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 8006080:	619a      	str	r2, [r3, #24]
 8006082:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 8006084:	6bba      	ldr	r2, [r7, #56]	; 0x38
 8006086:	625a      	str	r2, [r3, #36]	; 0x24
 8006088:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 800608a:	2200      	movs	r2, #0
 800608c:	f8c3 2478 	str.w	r2, [r3, #1144]	; 0x478
 8006090:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 8006092:	2200      	movs	r2, #0
 8006094:	f883 247c 	strb.w	r2, [r3, #1148]	; 0x47c
 8006098:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 800609a:	3350      	adds	r3, #80	; 0x50
 800609c:	f44f 6285 	mov.w	r2, #1064	; 0x428
 80060a0:	2100      	movs	r1, #0
 80060a2:	4618      	mov	r0, r3
 80060a4:	f002 fd19 	bl	8008ada <memset>
 80060a8:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 80060aa:	f503 724f 	add.w	r2, r3, #828	; 0x33c
 80060ae:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 80060b0:	655a      	str	r2, [r3, #84]	; 0x54
 80060b2:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 80060b4:	f503 7269 	add.w	r2, r3, #932	; 0x3a4
 80060b8:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 80060ba:	659a      	str	r2, [r3, #88]	; 0x58
 80060bc:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 80060be:	f203 420c 	addw	r2, r3, #1036	; 0x40c
 80060c2:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 80060c4:	65da      	str	r2, [r3, #92]	; 0x5c
 80060c6:	6bba      	ldr	r2, [r7, #56]	; 0x38
 80060c8:	f04f 0301 	mov.w	r3, #1
 80060cc:	f04f 0400 	mov.w	r4, #0
 80060d0:	e9c2 343e 	strd	r3, r4, [r2, #248]	; 0xf8
 80060d4:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 80060d6:	f243 320e 	movw	r2, #13070	; 0x330e
 80060da:	f8a3 2100 	strh.w	r2, [r3, #256]	; 0x100
 80060de:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 80060e0:	f64a 32cd 	movw	r2, #43981	; 0xabcd
 80060e4:	f8a3 2102 	strh.w	r2, [r3, #258]	; 0x102
 80060e8:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 80060ea:	f241 2234 	movw	r2, #4660	; 0x1234
 80060ee:	f8a3 2104 	strh.w	r2, [r3, #260]	; 0x104
 80060f2:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 80060f4:	f24e 626d 	movw	r2, #58989	; 0xe66d
 80060f8:	f8a3 2106 	strh.w	r2, [r3, #262]	; 0x106
 80060fc:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 80060fe:	f64d 62ec 	movw	r2, #57068	; 0xdeec
 8006102:	f8a3 2108 	strh.w	r2, [r3, #264]	; 0x108
 8006106:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 8006108:	2205      	movs	r2, #5
 800610a:	f8a3 210a 	strh.w	r2, [r3, #266]	; 0x10a
 800610e:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 8006110:	220b      	movs	r2, #11
 8006112:	f8a3 210c 	strh.w	r2, [r3, #268]	; 0x10c
 8006116:	683a      	ldr	r2, [r7, #0]
 8006118:	68f9      	ldr	r1, [r7, #12]
 800611a:	69b8      	ldr	r0, [r7, #24]
 800611c:	f001 fc08 	bl	8007930 <pxPortInitialiseStack>
 8006120:	4602      	mov	r2, r0
 8006122:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 8006124:	601a      	str	r2, [r3, #0]
 8006126:	6b7b      	ldr	r3, [r7, #52]	; 0x34
 8006128:	2b00      	cmp	r3, #0
 800612a:	d002      	beq.n	8006132 <prvInitialiseNewTask+0x19e>
 800612c:	6b7b      	ldr	r3, [r7, #52]	; 0x34
 800612e:	6bba      	ldr	r2, [r7, #56]	; 0x38
 8006130:	601a      	str	r2, [r3, #0]
 8006132:	bf00      	nop
 8006134:	3724      	adds	r7, #36	; 0x24
 8006136:	46bd      	mov	sp, r7
 8006138:	bd90      	pop	{r4, r7, pc}
	...

0800613c <prvAddNewTaskToReadyList>:
 800613c:	b580      	push	{r7, lr}
 800613e:	b082      	sub	sp, #8
 8006140:	af00      	add	r7, sp, #0
 8006142:	6078      	str	r0, [r7, #4]
 8006144:	f001 fd1a 	bl	8007b7c <vPortEnterCritical>
 8006148:	4b2c      	ldr	r3, [pc, #176]	; (80061fc <prvAddNewTaskToReadyList+0xc0>)
 800614a:	681b      	ldr	r3, [r3, #0]
 800614c:	3301      	adds	r3, #1
 800614e:	4a2b      	ldr	r2, [pc, #172]	; (80061fc <prvAddNewTaskToReadyList+0xc0>)
 8006150:	6013      	str	r3, [r2, #0]
 8006152:	4b2b      	ldr	r3, [pc, #172]	; (8006200 <prvAddNewTaskToReadyList+0xc4>)
 8006154:	681b      	ldr	r3, [r3, #0]
 8006156:	2b00      	cmp	r3, #0
 8006158:	d109      	bne.n	800616e <prvAddNewTaskToReadyList+0x32>
 800615a:	4a29      	ldr	r2, [pc, #164]	; (8006200 <prvAddNewTaskToReadyList+0xc4>)
 800615c:	687b      	ldr	r3, [r7, #4]
 800615e:	6013      	str	r3, [r2, #0]
 8006160:	4b26      	ldr	r3, [pc, #152]	; (80061fc <prvAddNewTaskToReadyList+0xc0>)
 8006162:	681b      	ldr	r3, [r3, #0]
 8006164:	2b01      	cmp	r3, #1
 8006166:	d110      	bne.n	800618a <prvAddNewTaskToReadyList+0x4e>
 8006168:	f000 fc56 	bl	8006a18 <prvInitialiseTaskLists>
 800616c:	e00d      	b.n	800618a <prvAddNewTaskToReadyList+0x4e>
 800616e:	4b25      	ldr	r3, [pc, #148]	; (8006204 <prvAddNewTaskToReadyList+0xc8>)
 8006170:	681b      	ldr	r3, [r3, #0]
 8006172:	2b00      	cmp	r3, #0
 8006174:	d109      	bne.n	800618a <prvAddNewTaskToReadyList+0x4e>
 8006176:	4b22      	ldr	r3, [pc, #136]	; (8006200 <prvAddNewTaskToReadyList+0xc4>)
 8006178:	681b      	ldr	r3, [r3, #0]
 800617a:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 800617c:	687b      	ldr	r3, [r7, #4]
 800617e:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 8006180:	429a      	cmp	r2, r3
 8006182:	d802      	bhi.n	800618a <prvAddNewTaskToReadyList+0x4e>
 8006184:	4a1e      	ldr	r2, [pc, #120]	; (8006200 <prvAddNewTaskToReadyList+0xc4>)
 8006186:	687b      	ldr	r3, [r7, #4]
 8006188:	6013      	str	r3, [r2, #0]
 800618a:	4b1f      	ldr	r3, [pc, #124]	; (8006208 <prvAddNewTaskToReadyList+0xcc>)
 800618c:	681b      	ldr	r3, [r3, #0]
 800618e:	3301      	adds	r3, #1
 8006190:	4a1d      	ldr	r2, [pc, #116]	; (8006208 <prvAddNewTaskToReadyList+0xcc>)
 8006192:	6013      	str	r3, [r2, #0]
 8006194:	4b1c      	ldr	r3, [pc, #112]	; (8006208 <prvAddNewTaskToReadyList+0xcc>)
 8006196:	681a      	ldr	r2, [r3, #0]
 8006198:	687b      	ldr	r3, [r7, #4]
 800619a:	641a      	str	r2, [r3, #64]	; 0x40
 800619c:	687b      	ldr	r3, [r7, #4]
 800619e:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 80061a0:	2201      	movs	r2, #1
 80061a2:	409a      	lsls	r2, r3
 80061a4:	4b19      	ldr	r3, [pc, #100]	; (800620c <prvAddNewTaskToReadyList+0xd0>)
 80061a6:	681b      	ldr	r3, [r3, #0]
 80061a8:	4313      	orrs	r3, r2
 80061aa:	4a18      	ldr	r2, [pc, #96]	; (800620c <prvAddNewTaskToReadyList+0xd0>)
 80061ac:	6013      	str	r3, [r2, #0]
 80061ae:	687b      	ldr	r3, [r7, #4]
 80061b0:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 80061b2:	4613      	mov	r3, r2
 80061b4:	009b      	lsls	r3, r3, #2
 80061b6:	4413      	add	r3, r2
 80061b8:	009b      	lsls	r3, r3, #2
 80061ba:	4a15      	ldr	r2, [pc, #84]	; (8006210 <prvAddNewTaskToReadyList+0xd4>)
 80061bc:	441a      	add	r2, r3
 80061be:	687b      	ldr	r3, [r7, #4]
 80061c0:	3304      	adds	r3, #4
 80061c2:	4619      	mov	r1, r3
 80061c4:	4610      	mov	r0, r2
 80061c6:	f7ff fe02 	bl	8005dce <vListInsertEnd>
 80061ca:	f001 fd05 	bl	8007bd8 <vPortExitCritical>
 80061ce:	4b0d      	ldr	r3, [pc, #52]	; (8006204 <prvAddNewTaskToReadyList+0xc8>)
 80061d0:	681b      	ldr	r3, [r3, #0]
 80061d2:	2b00      	cmp	r3, #0
 80061d4:	d00e      	beq.n	80061f4 <prvAddNewTaskToReadyList+0xb8>
 80061d6:	4b0a      	ldr	r3, [pc, #40]	; (8006200 <prvAddNewTaskToReadyList+0xc4>)
 80061d8:	681b      	ldr	r3, [r3, #0]
 80061da:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 80061dc:	687b      	ldr	r3, [r7, #4]
 80061de:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 80061e0:	429a      	cmp	r2, r3
 80061e2:	d207      	bcs.n	80061f4 <prvAddNewTaskToReadyList+0xb8>
 80061e4:	4b0b      	ldr	r3, [pc, #44]	; (8006214 <prvAddNewTaskToReadyList+0xd8>)
 80061e6:	f04f 5280 	mov.w	r2, #268435456	; 0x10000000
 80061ea:	601a      	str	r2, [r3, #0]
 80061ec:	f3bf 8f4f 	dsb	sy
 80061f0:	f3bf 8f6f 	isb	sy
 80061f4:	bf00      	nop
 80061f6:	3708      	adds	r7, #8
 80061f8:	46bd      	mov	sp, r7
 80061fa:	bd80      	pop	{r7, pc}
 80061fc:	20000c9c 	.word	0x20000c9c
 8006200:	20000bc4 	.word	0x20000bc4
 8006204:	20000ca8 	.word	0x20000ca8
 8006208:	20000cb8 	.word	0x20000cb8
 800620c:	20000ca4 	.word	0x20000ca4
 8006210:	20000bc8 	.word	0x20000bc8
 8006214:	e000ed04 	.word	0xe000ed04

08006218 <vTaskDelay>:
 8006218:	b580      	push	{r7, lr}
 800621a:	b084      	sub	sp, #16
 800621c:	af00      	add	r7, sp, #0
 800621e:	6078      	str	r0, [r7, #4]
 8006220:	2300      	movs	r3, #0
 8006222:	60fb      	str	r3, [r7, #12]
 8006224:	687b      	ldr	r3, [r7, #4]
 8006226:	2b00      	cmp	r3, #0
 8006228:	d016      	beq.n	8006258 <vTaskDelay+0x40>
 800622a:	4b13      	ldr	r3, [pc, #76]	; (8006278 <vTaskDelay+0x60>)
 800622c:	681b      	ldr	r3, [r3, #0]
 800622e:	2b00      	cmp	r3, #0
 8006230:	d009      	beq.n	8006246 <vTaskDelay+0x2e>
 8006232:	f04f 0350 	mov.w	r3, #80	; 0x50
 8006236:	f383 8811 	msr	BASEPRI, r3
 800623a:	f3bf 8f6f 	isb	sy
 800623e:	f3bf 8f4f 	dsb	sy
 8006242:	60bb      	str	r3, [r7, #8]
 8006244:	e7fe      	b.n	8006244 <vTaskDelay+0x2c>
 8006246:	f000 f889 	bl	800635c <vTaskSuspendAll>
 800624a:	2100      	movs	r1, #0
 800624c:	6878      	ldr	r0, [r7, #4]
 800624e:	f001 f819 	bl	8007284 <prvAddCurrentTaskToDelayedList>
 8006252:	f000 f891 	bl	8006378 <xTaskResumeAll>
 8006256:	60f8      	str	r0, [r7, #12]
 8006258:	68fb      	ldr	r3, [r7, #12]
 800625a:	2b00      	cmp	r3, #0
 800625c:	d107      	bne.n	800626e <vTaskDelay+0x56>
 800625e:	4b07      	ldr	r3, [pc, #28]	; (800627c <vTaskDelay+0x64>)
 8006260:	f04f 5280 	mov.w	r2, #268435456	; 0x10000000
 8006264:	601a      	str	r2, [r3, #0]
 8006266:	f3bf 8f4f 	dsb	sy
 800626a:	f3bf 8f6f 	isb	sy
 800626e:	bf00      	nop
 8006270:	3710      	adds	r7, #16
 8006272:	46bd      	mov	sp, r7
 8006274:	bd80      	pop	{r7, pc}
 8006276:	bf00      	nop
 8006278:	20000cc4 	.word	0x20000cc4
 800627c:	e000ed04 	.word	0xe000ed04

08006280 <vTaskStartScheduler>:
 8006280:	b580      	push	{r7, lr}
 8006282:	b08a      	sub	sp, #40	; 0x28
 8006284:	af04      	add	r7, sp, #16
 8006286:	2300      	movs	r3, #0
 8006288:	60bb      	str	r3, [r7, #8]
 800628a:	2300      	movs	r3, #0
 800628c:	607b      	str	r3, [r7, #4]
 800628e:	463a      	mov	r2, r7
 8006290:	1d39      	adds	r1, r7, #4
 8006292:	f107 0308 	add.w	r3, r7, #8
 8006296:	4618      	mov	r0, r3
 8006298:	f7fd f890 	bl	80033bc <vApplicationGetIdleTaskMemory>
 800629c:	6839      	ldr	r1, [r7, #0]
 800629e:	687b      	ldr	r3, [r7, #4]
 80062a0:	68ba      	ldr	r2, [r7, #8]
 80062a2:	9202      	str	r2, [sp, #8]
 80062a4:	9301      	str	r3, [sp, #4]
 80062a6:	2300      	movs	r3, #0
 80062a8:	9300      	str	r3, [sp, #0]
 80062aa:	2300      	movs	r3, #0
 80062ac:	460a      	mov	r2, r1
 80062ae:	4923      	ldr	r1, [pc, #140]	; (800633c <vTaskStartScheduler+0xbc>)
 80062b0:	4823      	ldr	r0, [pc, #140]	; (8006340 <vTaskStartScheduler+0xc0>)
 80062b2:	f7ff fe13 	bl	8005edc <xTaskCreateStatic>
 80062b6:	4602      	mov	r2, r0
 80062b8:	4b22      	ldr	r3, [pc, #136]	; (8006344 <vTaskStartScheduler+0xc4>)
 80062ba:	601a      	str	r2, [r3, #0]
 80062bc:	4b21      	ldr	r3, [pc, #132]	; (8006344 <vTaskStartScheduler+0xc4>)
 80062be:	681b      	ldr	r3, [r3, #0]
 80062c0:	2b00      	cmp	r3, #0
 80062c2:	d002      	beq.n	80062ca <vTaskStartScheduler+0x4a>
 80062c4:	2301      	movs	r3, #1
 80062c6:	617b      	str	r3, [r7, #20]
 80062c8:	e001      	b.n	80062ce <vTaskStartScheduler+0x4e>
 80062ca:	2300      	movs	r3, #0
 80062cc:	617b      	str	r3, [r7, #20]
 80062ce:	697b      	ldr	r3, [r7, #20]
 80062d0:	2b01      	cmp	r3, #1
 80062d2:	d102      	bne.n	80062da <vTaskStartScheduler+0x5a>
 80062d4:	f001 f83c 	bl	8007350 <xTimerCreateTimerTask>
 80062d8:	6178      	str	r0, [r7, #20]
 80062da:	697b      	ldr	r3, [r7, #20]
 80062dc:	2b01      	cmp	r3, #1
 80062de:	d11a      	bne.n	8006316 <vTaskStartScheduler+0x96>
 80062e0:	f04f 0350 	mov.w	r3, #80	; 0x50
 80062e4:	f383 8811 	msr	BASEPRI, r3
 80062e8:	f3bf 8f6f 	isb	sy
 80062ec:	f3bf 8f4f 	dsb	sy
 80062f0:	613b      	str	r3, [r7, #16]
 80062f2:	4b15      	ldr	r3, [pc, #84]	; (8006348 <vTaskStartScheduler+0xc8>)
 80062f4:	681b      	ldr	r3, [r3, #0]
 80062f6:	3350      	adds	r3, #80	; 0x50
 80062f8:	4a14      	ldr	r2, [pc, #80]	; (800634c <vTaskStartScheduler+0xcc>)
 80062fa:	6013      	str	r3, [r2, #0]
 80062fc:	4b14      	ldr	r3, [pc, #80]	; (8006350 <vTaskStartScheduler+0xd0>)
 80062fe:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
 8006302:	601a      	str	r2, [r3, #0]
 8006304:	4b13      	ldr	r3, [pc, #76]	; (8006354 <vTaskStartScheduler+0xd4>)
 8006306:	2201      	movs	r2, #1
 8006308:	601a      	str	r2, [r3, #0]
 800630a:	4b13      	ldr	r3, [pc, #76]	; (8006358 <vTaskStartScheduler+0xd8>)
 800630c:	2200      	movs	r2, #0
 800630e:	601a      	str	r2, [r3, #0]
 8006310:	f001 fb96 	bl	8007a40 <xPortStartScheduler>
 8006314:	e00d      	b.n	8006332 <vTaskStartScheduler+0xb2>
 8006316:	697b      	ldr	r3, [r7, #20]
 8006318:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
 800631c:	d109      	bne.n	8006332 <vTaskStartScheduler+0xb2>
 800631e:	f04f 0350 	mov.w	r3, #80	; 0x50
 8006322:	f383 8811 	msr	BASEPRI, r3
 8006326:	f3bf 8f6f 	isb	sy
 800632a:	f3bf 8f4f 	dsb	sy
 800632e:	60fb      	str	r3, [r7, #12]
 8006330:	e7fe      	b.n	8006330 <vTaskStartScheduler+0xb0>
 8006332:	bf00      	nop
 8006334:	3718      	adds	r7, #24
 8006336:	46bd      	mov	sp, r7
 8006338:	bd80      	pop	{r7, pc}
 800633a:	bf00      	nop
 800633c:	0800b2d8 	.word	0x0800b2d8
 8006340:	080069e5 	.word	0x080069e5
 8006344:	20000cc0 	.word	0x20000cc0
 8006348:	20000bc4 	.word	0x20000bc4
 800634c:	20000080 	.word	0x20000080
 8006350:	20000cbc 	.word	0x20000cbc
 8006354:	20000ca8 	.word	0x20000ca8
 8006358:	20000ca0 	.word	0x20000ca0

0800635c <vTaskSuspendAll>:
 800635c:	b480      	push	{r7}
 800635e:	af00      	add	r7, sp, #0
 8006360:	4b04      	ldr	r3, [pc, #16]	; (8006374 <vTaskSuspendAll+0x18>)
 8006362:	681b      	ldr	r3, [r3, #0]
 8006364:	3301      	adds	r3, #1
 8006366:	4a03      	ldr	r2, [pc, #12]	; (8006374 <vTaskSuspendAll+0x18>)
 8006368:	6013      	str	r3, [r2, #0]
 800636a:	bf00      	nop
 800636c:	46bd      	mov	sp, r7
 800636e:	f85d 7b04 	ldr.w	r7, [sp], #4
 8006372:	4770      	bx	lr
 8006374:	20000cc4 	.word	0x20000cc4

08006378 <xTaskResumeAll>:
 8006378:	b580      	push	{r7, lr}
 800637a:	b084      	sub	sp, #16
 800637c:	af00      	add	r7, sp, #0
 800637e:	2300      	movs	r3, #0
 8006380:	60fb      	str	r3, [r7, #12]
 8006382:	2300      	movs	r3, #0
 8006384:	60bb      	str	r3, [r7, #8]
 8006386:	4b41      	ldr	r3, [pc, #260]	; (800648c <xTaskResumeAll+0x114>)
 8006388:	681b      	ldr	r3, [r3, #0]
 800638a:	2b00      	cmp	r3, #0
 800638c:	d109      	bne.n	80063a2 <xTaskResumeAll+0x2a>
 800638e:	f04f 0350 	mov.w	r3, #80	; 0x50
 8006392:	f383 8811 	msr	BASEPRI, r3
 8006396:	f3bf 8f6f 	isb	sy
 800639a:	f3bf 8f4f 	dsb	sy
 800639e:	603b      	str	r3, [r7, #0]
 80063a0:	e7fe      	b.n	80063a0 <xTaskResumeAll+0x28>
 80063a2:	f001 fbeb 	bl	8007b7c <vPortEnterCritical>
 80063a6:	4b39      	ldr	r3, [pc, #228]	; (800648c <xTaskResumeAll+0x114>)
 80063a8:	681b      	ldr	r3, [r3, #0]
 80063aa:	3b01      	subs	r3, #1
 80063ac:	4a37      	ldr	r2, [pc, #220]	; (800648c <xTaskResumeAll+0x114>)
 80063ae:	6013      	str	r3, [r2, #0]
 80063b0:	4b36      	ldr	r3, [pc, #216]	; (800648c <xTaskResumeAll+0x114>)
 80063b2:	681b      	ldr	r3, [r3, #0]
 80063b4:	2b00      	cmp	r3, #0
 80063b6:	d161      	bne.n	800647c <xTaskResumeAll+0x104>
 80063b8:	4b35      	ldr	r3, [pc, #212]	; (8006490 <xTaskResumeAll+0x118>)
 80063ba:	681b      	ldr	r3, [r3, #0]
 80063bc:	2b00      	cmp	r3, #0
 80063be:	d05d      	beq.n	800647c <xTaskResumeAll+0x104>
 80063c0:	e02e      	b.n	8006420 <xTaskResumeAll+0xa8>
 80063c2:	4b34      	ldr	r3, [pc, #208]	; (8006494 <xTaskResumeAll+0x11c>)
 80063c4:	68db      	ldr	r3, [r3, #12]
 80063c6:	68db      	ldr	r3, [r3, #12]
 80063c8:	60fb      	str	r3, [r7, #12]
 80063ca:	68fb      	ldr	r3, [r7, #12]
 80063cc:	3318      	adds	r3, #24
 80063ce:	4618      	mov	r0, r3
 80063d0:	f7ff fd5a 	bl	8005e88 <uxListRemove>
 80063d4:	68fb      	ldr	r3, [r7, #12]
 80063d6:	3304      	adds	r3, #4
 80063d8:	4618      	mov	r0, r3
 80063da:	f7ff fd55 	bl	8005e88 <uxListRemove>
 80063de:	68fb      	ldr	r3, [r7, #12]
 80063e0:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 80063e2:	2201      	movs	r2, #1
 80063e4:	409a      	lsls	r2, r3
 80063e6:	4b2c      	ldr	r3, [pc, #176]	; (8006498 <xTaskResumeAll+0x120>)
 80063e8:	681b      	ldr	r3, [r3, #0]
 80063ea:	4313      	orrs	r3, r2
 80063ec:	4a2a      	ldr	r2, [pc, #168]	; (8006498 <xTaskResumeAll+0x120>)
 80063ee:	6013      	str	r3, [r2, #0]
 80063f0:	68fb      	ldr	r3, [r7, #12]
 80063f2:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 80063f4:	4613      	mov	r3, r2
 80063f6:	009b      	lsls	r3, r3, #2
 80063f8:	4413      	add	r3, r2
 80063fa:	009b      	lsls	r3, r3, #2
 80063fc:	4a27      	ldr	r2, [pc, #156]	; (800649c <xTaskResumeAll+0x124>)
 80063fe:	441a      	add	r2, r3
 8006400:	68fb      	ldr	r3, [r7, #12]
 8006402:	3304      	adds	r3, #4
 8006404:	4619      	mov	r1, r3
 8006406:	4610      	mov	r0, r2
 8006408:	f7ff fce1 	bl	8005dce <vListInsertEnd>
 800640c:	68fb      	ldr	r3, [r7, #12]
 800640e:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8006410:	4b23      	ldr	r3, [pc, #140]	; (80064a0 <xTaskResumeAll+0x128>)
 8006412:	681b      	ldr	r3, [r3, #0]
 8006414:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 8006416:	429a      	cmp	r2, r3
 8006418:	d302      	bcc.n	8006420 <xTaskResumeAll+0xa8>
 800641a:	4b22      	ldr	r3, [pc, #136]	; (80064a4 <xTaskResumeAll+0x12c>)
 800641c:	2201      	movs	r2, #1
 800641e:	601a      	str	r2, [r3, #0]
 8006420:	4b1c      	ldr	r3, [pc, #112]	; (8006494 <xTaskResumeAll+0x11c>)
 8006422:	681b      	ldr	r3, [r3, #0]
 8006424:	2b00      	cmp	r3, #0
 8006426:	d1cc      	bne.n	80063c2 <xTaskResumeAll+0x4a>
 8006428:	68fb      	ldr	r3, [r7, #12]
 800642a:	2b00      	cmp	r3, #0
 800642c:	d001      	beq.n	8006432 <xTaskResumeAll+0xba>
 800642e:	f000 fb93 	bl	8006b58 <prvResetNextTaskUnblockTime>
 8006432:	4b1d      	ldr	r3, [pc, #116]	; (80064a8 <xTaskResumeAll+0x130>)
 8006434:	681b      	ldr	r3, [r3, #0]
 8006436:	607b      	str	r3, [r7, #4]
 8006438:	687b      	ldr	r3, [r7, #4]
 800643a:	2b00      	cmp	r3, #0
 800643c:	d010      	beq.n	8006460 <xTaskResumeAll+0xe8>
 800643e:	f000 f859 	bl	80064f4 <xTaskIncrementTick>
 8006442:	4603      	mov	r3, r0
 8006444:	2b00      	cmp	r3, #0
 8006446:	d002      	beq.n	800644e <xTaskResumeAll+0xd6>
 8006448:	4b16      	ldr	r3, [pc, #88]	; (80064a4 <xTaskResumeAll+0x12c>)
 800644a:	2201      	movs	r2, #1
 800644c:	601a      	str	r2, [r3, #0]
 800644e:	687b      	ldr	r3, [r7, #4]
 8006450:	3b01      	subs	r3, #1
 8006452:	607b      	str	r3, [r7, #4]
 8006454:	687b      	ldr	r3, [r7, #4]
 8006456:	2b00      	cmp	r3, #0
 8006458:	d1f1      	bne.n	800643e <xTaskResumeAll+0xc6>
 800645a:	4b13      	ldr	r3, [pc, #76]	; (80064a8 <xTaskResumeAll+0x130>)
 800645c:	2200      	movs	r2, #0
 800645e:	601a      	str	r2, [r3, #0]
 8006460:	4b10      	ldr	r3, [pc, #64]	; (80064a4 <xTaskResumeAll+0x12c>)
 8006462:	681b      	ldr	r3, [r3, #0]
 8006464:	2b00      	cmp	r3, #0
 8006466:	d009      	beq.n	800647c <xTaskResumeAll+0x104>
 8006468:	2301      	movs	r3, #1
 800646a:	60bb      	str	r3, [r7, #8]
 800646c:	4b0f      	ldr	r3, [pc, #60]	; (80064ac <xTaskResumeAll+0x134>)
 800646e:	f04f 5280 	mov.w	r2, #268435456	; 0x10000000
 8006472:	601a      	str	r2, [r3, #0]
 8006474:	f3bf 8f4f 	dsb	sy
 8006478:	f3bf 8f6f 	isb	sy
 800647c:	f001 fbac 	bl	8007bd8 <vPortExitCritical>
 8006480:	68bb      	ldr	r3, [r7, #8]
 8006482:	4618      	mov	r0, r3
 8006484:	3710      	adds	r7, #16
 8006486:	46bd      	mov	sp, r7
 8006488:	bd80      	pop	{r7, pc}
 800648a:	bf00      	nop
 800648c:	20000cc4 	.word	0x20000cc4
 8006490:	20000c9c 	.word	0x20000c9c
 8006494:	20000c5c 	.word	0x20000c5c
 8006498:	20000ca4 	.word	0x20000ca4
 800649c:	20000bc8 	.word	0x20000bc8
 80064a0:	20000bc4 	.word	0x20000bc4
 80064a4:	20000cb0 	.word	0x20000cb0
 80064a8:	20000cac 	.word	0x20000cac
 80064ac:	e000ed04 	.word	0xe000ed04

080064b0 <xTaskGetTickCount>:
 80064b0:	b480      	push	{r7}
 80064b2:	b083      	sub	sp, #12
 80064b4:	af00      	add	r7, sp, #0
 80064b6:	4b05      	ldr	r3, [pc, #20]	; (80064cc <xTaskGetTickCount+0x1c>)
 80064b8:	681b      	ldr	r3, [r3, #0]
 80064ba:	607b      	str	r3, [r7, #4]
 80064bc:	687b      	ldr	r3, [r7, #4]
 80064be:	4618      	mov	r0, r3
 80064c0:	370c      	adds	r7, #12
 80064c2:	46bd      	mov	sp, r7
 80064c4:	f85d 7b04 	ldr.w	r7, [sp], #4
 80064c8:	4770      	bx	lr
 80064ca:	bf00      	nop
 80064cc:	20000ca0 	.word	0x20000ca0

080064d0 <xTaskGetTickCountFromISR>:
 80064d0:	b580      	push	{r7, lr}
 80064d2:	b082      	sub	sp, #8
 80064d4:	af00      	add	r7, sp, #0
 80064d6:	f001 fc2d 	bl	8007d34 <vPortValidateInterruptPriority>
 80064da:	2300      	movs	r3, #0
 80064dc:	607b      	str	r3, [r7, #4]
 80064de:	4b04      	ldr	r3, [pc, #16]	; (80064f0 <xTaskGetTickCountFromISR+0x20>)
 80064e0:	681b      	ldr	r3, [r3, #0]
 80064e2:	603b      	str	r3, [r7, #0]
 80064e4:	683b      	ldr	r3, [r7, #0]
 80064e6:	4618      	mov	r0, r3
 80064e8:	3708      	adds	r7, #8
 80064ea:	46bd      	mov	sp, r7
 80064ec:	bd80      	pop	{r7, pc}
 80064ee:	bf00      	nop
 80064f0:	20000ca0 	.word	0x20000ca0

080064f4 <xTaskIncrementTick>:
 80064f4:	b580      	push	{r7, lr}
 80064f6:	b086      	sub	sp, #24
 80064f8:	af00      	add	r7, sp, #0
 80064fa:	2300      	movs	r3, #0
 80064fc:	617b      	str	r3, [r7, #20]
 80064fe:	4b52      	ldr	r3, [pc, #328]	; (8006648 <xTaskIncrementTick+0x154>)
 8006500:	681b      	ldr	r3, [r3, #0]
 8006502:	2b00      	cmp	r3, #0
 8006504:	f040 808d 	bne.w	8006622 <xTaskIncrementTick+0x12e>
 8006508:	4b50      	ldr	r3, [pc, #320]	; (800664c <xTaskIncrementTick+0x158>)
 800650a:	681b      	ldr	r3, [r3, #0]
 800650c:	3301      	adds	r3, #1
 800650e:	613b      	str	r3, [r7, #16]
 8006510:	4a4e      	ldr	r2, [pc, #312]	; (800664c <xTaskIncrementTick+0x158>)
 8006512:	693b      	ldr	r3, [r7, #16]
 8006514:	6013      	str	r3, [r2, #0]
 8006516:	693b      	ldr	r3, [r7, #16]
 8006518:	2b00      	cmp	r3, #0
 800651a:	d11f      	bne.n	800655c <xTaskIncrementTick+0x68>
 800651c:	4b4c      	ldr	r3, [pc, #304]	; (8006650 <xTaskIncrementTick+0x15c>)
 800651e:	681b      	ldr	r3, [r3, #0]
 8006520:	681b      	ldr	r3, [r3, #0]
 8006522:	2b00      	cmp	r3, #0
 8006524:	d009      	beq.n	800653a <xTaskIncrementTick+0x46>
 8006526:	f04f 0350 	mov.w	r3, #80	; 0x50
 800652a:	f383 8811 	msr	BASEPRI, r3
 800652e:	f3bf 8f6f 	isb	sy
 8006532:	f3bf 8f4f 	dsb	sy
 8006536:	603b      	str	r3, [r7, #0]
 8006538:	e7fe      	b.n	8006538 <xTaskIncrementTick+0x44>
 800653a:	4b45      	ldr	r3, [pc, #276]	; (8006650 <xTaskIncrementTick+0x15c>)
 800653c:	681b      	ldr	r3, [r3, #0]
 800653e:	60fb      	str	r3, [r7, #12]
 8006540:	4b44      	ldr	r3, [pc, #272]	; (8006654 <xTaskIncrementTick+0x160>)
 8006542:	681b      	ldr	r3, [r3, #0]
 8006544:	4a42      	ldr	r2, [pc, #264]	; (8006650 <xTaskIncrementTick+0x15c>)
 8006546:	6013      	str	r3, [r2, #0]
 8006548:	4a42      	ldr	r2, [pc, #264]	; (8006654 <xTaskIncrementTick+0x160>)
 800654a:	68fb      	ldr	r3, [r7, #12]
 800654c:	6013      	str	r3, [r2, #0]
 800654e:	4b42      	ldr	r3, [pc, #264]	; (8006658 <xTaskIncrementTick+0x164>)
 8006550:	681b      	ldr	r3, [r3, #0]
 8006552:	3301      	adds	r3, #1
 8006554:	4a40      	ldr	r2, [pc, #256]	; (8006658 <xTaskIncrementTick+0x164>)
 8006556:	6013      	str	r3, [r2, #0]
 8006558:	f000 fafe 	bl	8006b58 <prvResetNextTaskUnblockTime>
 800655c:	4b3f      	ldr	r3, [pc, #252]	; (800665c <xTaskIncrementTick+0x168>)
 800655e:	681b      	ldr	r3, [r3, #0]
 8006560:	693a      	ldr	r2, [r7, #16]
 8006562:	429a      	cmp	r2, r3
 8006564:	d348      	bcc.n	80065f8 <xTaskIncrementTick+0x104>
 8006566:	4b3a      	ldr	r3, [pc, #232]	; (8006650 <xTaskIncrementTick+0x15c>)
 8006568:	681b      	ldr	r3, [r3, #0]
 800656a:	681b      	ldr	r3, [r3, #0]
 800656c:	2b00      	cmp	r3, #0
 800656e:	d104      	bne.n	800657a <xTaskIncrementTick+0x86>
 8006570:	4b3a      	ldr	r3, [pc, #232]	; (800665c <xTaskIncrementTick+0x168>)
 8006572:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
 8006576:	601a      	str	r2, [r3, #0]
 8006578:	e03e      	b.n	80065f8 <xTaskIncrementTick+0x104>
 800657a:	4b35      	ldr	r3, [pc, #212]	; (8006650 <xTaskIncrementTick+0x15c>)
 800657c:	681b      	ldr	r3, [r3, #0]
 800657e:	68db      	ldr	r3, [r3, #12]
 8006580:	68db      	ldr	r3, [r3, #12]
 8006582:	60bb      	str	r3, [r7, #8]
 8006584:	68bb      	ldr	r3, [r7, #8]
 8006586:	685b      	ldr	r3, [r3, #4]
 8006588:	607b      	str	r3, [r7, #4]
 800658a:	693a      	ldr	r2, [r7, #16]
 800658c:	687b      	ldr	r3, [r7, #4]
 800658e:	429a      	cmp	r2, r3
 8006590:	d203      	bcs.n	800659a <xTaskIncrementTick+0xa6>
 8006592:	4a32      	ldr	r2, [pc, #200]	; (800665c <xTaskIncrementTick+0x168>)
 8006594:	687b      	ldr	r3, [r7, #4]
 8006596:	6013      	str	r3, [r2, #0]
 8006598:	e02e      	b.n	80065f8 <xTaskIncrementTick+0x104>
 800659a:	68bb      	ldr	r3, [r7, #8]
 800659c:	3304      	adds	r3, #4
 800659e:	4618      	mov	r0, r3
 80065a0:	f7ff fc72 	bl	8005e88 <uxListRemove>
 80065a4:	68bb      	ldr	r3, [r7, #8]
 80065a6:	6a9b      	ldr	r3, [r3, #40]	; 0x28
 80065a8:	2b00      	cmp	r3, #0
 80065aa:	d004      	beq.n	80065b6 <xTaskIncrementTick+0xc2>
 80065ac:	68bb      	ldr	r3, [r7, #8]
 80065ae:	3318      	adds	r3, #24
 80065b0:	4618      	mov	r0, r3
 80065b2:	f7ff fc69 	bl	8005e88 <uxListRemove>
 80065b6:	68bb      	ldr	r3, [r7, #8]
 80065b8:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 80065ba:	2201      	movs	r2, #1
 80065bc:	409a      	lsls	r2, r3
 80065be:	4b28      	ldr	r3, [pc, #160]	; (8006660 <xTaskIncrementTick+0x16c>)
 80065c0:	681b      	ldr	r3, [r3, #0]
 80065c2:	4313      	orrs	r3, r2
 80065c4:	4a26      	ldr	r2, [pc, #152]	; (8006660 <xTaskIncrementTick+0x16c>)
 80065c6:	6013      	str	r3, [r2, #0]
 80065c8:	68bb      	ldr	r3, [r7, #8]
 80065ca:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 80065cc:	4613      	mov	r3, r2
 80065ce:	009b      	lsls	r3, r3, #2
 80065d0:	4413      	add	r3, r2
 80065d2:	009b      	lsls	r3, r3, #2
 80065d4:	4a23      	ldr	r2, [pc, #140]	; (8006664 <xTaskIncrementTick+0x170>)
 80065d6:	441a      	add	r2, r3
 80065d8:	68bb      	ldr	r3, [r7, #8]
 80065da:	3304      	adds	r3, #4
 80065dc:	4619      	mov	r1, r3
 80065de:	4610      	mov	r0, r2
 80065e0:	f7ff fbf5 	bl	8005dce <vListInsertEnd>
 80065e4:	68bb      	ldr	r3, [r7, #8]
 80065e6:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 80065e8:	4b1f      	ldr	r3, [pc, #124]	; (8006668 <xTaskIncrementTick+0x174>)
 80065ea:	681b      	ldr	r3, [r3, #0]
 80065ec:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 80065ee:	429a      	cmp	r2, r3
 80065f0:	d3b9      	bcc.n	8006566 <xTaskIncrementTick+0x72>
 80065f2:	2301      	movs	r3, #1
 80065f4:	617b      	str	r3, [r7, #20]
 80065f6:	e7b6      	b.n	8006566 <xTaskIncrementTick+0x72>
 80065f8:	4b1b      	ldr	r3, [pc, #108]	; (8006668 <xTaskIncrementTick+0x174>)
 80065fa:	681b      	ldr	r3, [r3, #0]
 80065fc:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 80065fe:	4919      	ldr	r1, [pc, #100]	; (8006664 <xTaskIncrementTick+0x170>)
 8006600:	4613      	mov	r3, r2
 8006602:	009b      	lsls	r3, r3, #2
 8006604:	4413      	add	r3, r2
 8006606:	009b      	lsls	r3, r3, #2
 8006608:	440b      	add	r3, r1
 800660a:	681b      	ldr	r3, [r3, #0]
 800660c:	2b01      	cmp	r3, #1
 800660e:	d901      	bls.n	8006614 <xTaskIncrementTick+0x120>
 8006610:	2301      	movs	r3, #1
 8006612:	617b      	str	r3, [r7, #20]
 8006614:	4b15      	ldr	r3, [pc, #84]	; (800666c <xTaskIncrementTick+0x178>)
 8006616:	681b      	ldr	r3, [r3, #0]
 8006618:	2b00      	cmp	r3, #0
 800661a:	d109      	bne.n	8006630 <xTaskIncrementTick+0x13c>
 800661c:	f7fc feb8 	bl	8003390 <vApplicationTickHook>
 8006620:	e006      	b.n	8006630 <xTaskIncrementTick+0x13c>
 8006622:	4b12      	ldr	r3, [pc, #72]	; (800666c <xTaskIncrementTick+0x178>)
 8006624:	681b      	ldr	r3, [r3, #0]
 8006626:	3301      	adds	r3, #1
 8006628:	4a10      	ldr	r2, [pc, #64]	; (800666c <xTaskIncrementTick+0x178>)
 800662a:	6013      	str	r3, [r2, #0]
 800662c:	f7fc feb0 	bl	8003390 <vApplicationTickHook>
 8006630:	4b0f      	ldr	r3, [pc, #60]	; (8006670 <xTaskIncrementTick+0x17c>)
 8006632:	681b      	ldr	r3, [r3, #0]
 8006634:	2b00      	cmp	r3, #0
 8006636:	d001      	beq.n	800663c <xTaskIncrementTick+0x148>
 8006638:	2301      	movs	r3, #1
 800663a:	617b      	str	r3, [r7, #20]
 800663c:	697b      	ldr	r3, [r7, #20]
 800663e:	4618      	mov	r0, r3
 8006640:	3718      	adds	r7, #24
 8006642:	46bd      	mov	sp, r7
 8006644:	bd80      	pop	{r7, pc}
 8006646:	bf00      	nop
 8006648:	20000cc4 	.word	0x20000cc4
 800664c:	20000ca0 	.word	0x20000ca0
 8006650:	20000c54 	.word	0x20000c54
 8006654:	20000c58 	.word	0x20000c58
 8006658:	20000cb4 	.word	0x20000cb4
 800665c:	20000cbc 	.word	0x20000cbc
 8006660:	20000ca4 	.word	0x20000ca4
 8006664:	20000bc8 	.word	0x20000bc8
 8006668:	20000bc4 	.word	0x20000bc4
 800666c:	20000cac 	.word	0x20000cac
 8006670:	20000cb0 	.word	0x20000cb0

08006674 <vTaskSwitchContext>:
 8006674:	b580      	push	{r7, lr}
 8006676:	b088      	sub	sp, #32
 8006678:	af00      	add	r7, sp, #0
 800667a:	4b3b      	ldr	r3, [pc, #236]	; (8006768 <vTaskSwitchContext+0xf4>)
 800667c:	681b      	ldr	r3, [r3, #0]
 800667e:	2b00      	cmp	r3, #0
 8006680:	d003      	beq.n	800668a <vTaskSwitchContext+0x16>
 8006682:	4b3a      	ldr	r3, [pc, #232]	; (800676c <vTaskSwitchContext+0xf8>)
 8006684:	2201      	movs	r2, #1
 8006686:	601a      	str	r2, [r3, #0]
 8006688:	e06a      	b.n	8006760 <vTaskSwitchContext+0xec>
 800668a:	4b38      	ldr	r3, [pc, #224]	; (800676c <vTaskSwitchContext+0xf8>)
 800668c:	2200      	movs	r2, #0
 800668e:	601a      	str	r2, [r3, #0]
 8006690:	4b37      	ldr	r3, [pc, #220]	; (8006770 <vTaskSwitchContext+0xfc>)
 8006692:	681b      	ldr	r3, [r3, #0]
 8006694:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8006696:	61fb      	str	r3, [r7, #28]
 8006698:	f04f 33a5 	mov.w	r3, #2779096485	; 0xa5a5a5a5
 800669c:	61bb      	str	r3, [r7, #24]
 800669e:	69fb      	ldr	r3, [r7, #28]
 80066a0:	681b      	ldr	r3, [r3, #0]
 80066a2:	69ba      	ldr	r2, [r7, #24]
 80066a4:	429a      	cmp	r2, r3
 80066a6:	d111      	bne.n	80066cc <vTaskSwitchContext+0x58>
 80066a8:	69fb      	ldr	r3, [r7, #28]
 80066aa:	3304      	adds	r3, #4
 80066ac:	681b      	ldr	r3, [r3, #0]
 80066ae:	69ba      	ldr	r2, [r7, #24]
 80066b0:	429a      	cmp	r2, r3
 80066b2:	d10b      	bne.n	80066cc <vTaskSwitchContext+0x58>
 80066b4:	69fb      	ldr	r3, [r7, #28]
 80066b6:	3308      	adds	r3, #8
 80066b8:	681b      	ldr	r3, [r3, #0]
 80066ba:	69ba      	ldr	r2, [r7, #24]
 80066bc:	429a      	cmp	r2, r3
 80066be:	d105      	bne.n	80066cc <vTaskSwitchContext+0x58>
 80066c0:	69fb      	ldr	r3, [r7, #28]
 80066c2:	330c      	adds	r3, #12
 80066c4:	681b      	ldr	r3, [r3, #0]
 80066c6:	69ba      	ldr	r2, [r7, #24]
 80066c8:	429a      	cmp	r2, r3
 80066ca:	d008      	beq.n	80066de <vTaskSwitchContext+0x6a>
 80066cc:	4b28      	ldr	r3, [pc, #160]	; (8006770 <vTaskSwitchContext+0xfc>)
 80066ce:	681a      	ldr	r2, [r3, #0]
 80066d0:	4b27      	ldr	r3, [pc, #156]	; (8006770 <vTaskSwitchContext+0xfc>)
 80066d2:	681b      	ldr	r3, [r3, #0]
 80066d4:	3334      	adds	r3, #52	; 0x34
 80066d6:	4619      	mov	r1, r3
 80066d8:	4610      	mov	r0, r2
 80066da:	f7fc fe60 	bl	800339e <vApplicationStackOverflowHook>
 80066de:	4b25      	ldr	r3, [pc, #148]	; (8006774 <vTaskSwitchContext+0x100>)
 80066e0:	681b      	ldr	r3, [r3, #0]
 80066e2:	60fb      	str	r3, [r7, #12]
 80066e4:	68fb      	ldr	r3, [r7, #12]
 80066e6:	fab3 f383 	clz	r3, r3
 80066ea:	72fb      	strb	r3, [r7, #11]
 80066ec:	7afb      	ldrb	r3, [r7, #11]
 80066ee:	f1c3 031f 	rsb	r3, r3, #31
 80066f2:	617b      	str	r3, [r7, #20]
 80066f4:	4920      	ldr	r1, [pc, #128]	; (8006778 <vTaskSwitchContext+0x104>)
 80066f6:	697a      	ldr	r2, [r7, #20]
 80066f8:	4613      	mov	r3, r2
 80066fa:	009b      	lsls	r3, r3, #2
 80066fc:	4413      	add	r3, r2
 80066fe:	009b      	lsls	r3, r3, #2
 8006700:	440b      	add	r3, r1
 8006702:	681b      	ldr	r3, [r3, #0]
 8006704:	2b00      	cmp	r3, #0
 8006706:	d109      	bne.n	800671c <vTaskSwitchContext+0xa8>
 8006708:	f04f 0350 	mov.w	r3, #80	; 0x50
 800670c:	f383 8811 	msr	BASEPRI, r3
 8006710:	f3bf 8f6f 	isb	sy
 8006714:	f3bf 8f4f 	dsb	sy
 8006718:	607b      	str	r3, [r7, #4]
 800671a:	e7fe      	b.n	800671a <vTaskSwitchContext+0xa6>
 800671c:	697a      	ldr	r2, [r7, #20]
 800671e:	4613      	mov	r3, r2
 8006720:	009b      	lsls	r3, r3, #2
 8006722:	4413      	add	r3, r2
 8006724:	009b      	lsls	r3, r3, #2
 8006726:	4a14      	ldr	r2, [pc, #80]	; (8006778 <vTaskSwitchContext+0x104>)
 8006728:	4413      	add	r3, r2
 800672a:	613b      	str	r3, [r7, #16]
 800672c:	693b      	ldr	r3, [r7, #16]
 800672e:	685b      	ldr	r3, [r3, #4]
 8006730:	685a      	ldr	r2, [r3, #4]
 8006732:	693b      	ldr	r3, [r7, #16]
 8006734:	605a      	str	r2, [r3, #4]
 8006736:	693b      	ldr	r3, [r7, #16]
 8006738:	685a      	ldr	r2, [r3, #4]
 800673a:	693b      	ldr	r3, [r7, #16]
 800673c:	3308      	adds	r3, #8
 800673e:	429a      	cmp	r2, r3
 8006740:	d104      	bne.n	800674c <vTaskSwitchContext+0xd8>
 8006742:	693b      	ldr	r3, [r7, #16]
 8006744:	685b      	ldr	r3, [r3, #4]
 8006746:	685a      	ldr	r2, [r3, #4]
 8006748:	693b      	ldr	r3, [r7, #16]
 800674a:	605a      	str	r2, [r3, #4]
 800674c:	693b      	ldr	r3, [r7, #16]
 800674e:	685b      	ldr	r3, [r3, #4]
 8006750:	68db      	ldr	r3, [r3, #12]
 8006752:	4a07      	ldr	r2, [pc, #28]	; (8006770 <vTaskSwitchContext+0xfc>)
 8006754:	6013      	str	r3, [r2, #0]
 8006756:	4b06      	ldr	r3, [pc, #24]	; (8006770 <vTaskSwitchContext+0xfc>)
 8006758:	681b      	ldr	r3, [r3, #0]
 800675a:	3350      	adds	r3, #80	; 0x50
 800675c:	4a07      	ldr	r2, [pc, #28]	; (800677c <vTaskSwitchContext+0x108>)
 800675e:	6013      	str	r3, [r2, #0]
 8006760:	bf00      	nop
 8006762:	3720      	adds	r7, #32
 8006764:	46bd      	mov	sp, r7
 8006766:	bd80      	pop	{r7, pc}
 8006768:	20000cc4 	.word	0x20000cc4
 800676c:	20000cb0 	.word	0x20000cb0
 8006770:	20000bc4 	.word	0x20000bc4
 8006774:	20000ca4 	.word	0x20000ca4
 8006778:	20000bc8 	.word	0x20000bc8
 800677c:	20000080 	.word	0x20000080

08006780 <vTaskPlaceOnEventList>:
 8006780:	b580      	push	{r7, lr}
 8006782:	b084      	sub	sp, #16
 8006784:	af00      	add	r7, sp, #0
 8006786:	6078      	str	r0, [r7, #4]
 8006788:	6039      	str	r1, [r7, #0]
 800678a:	687b      	ldr	r3, [r7, #4]
 800678c:	2b00      	cmp	r3, #0
 800678e:	d109      	bne.n	80067a4 <vTaskPlaceOnEventList+0x24>
 8006790:	f04f 0350 	mov.w	r3, #80	; 0x50
 8006794:	f383 8811 	msr	BASEPRI, r3
 8006798:	f3bf 8f6f 	isb	sy
 800679c:	f3bf 8f4f 	dsb	sy
 80067a0:	60fb      	str	r3, [r7, #12]
 80067a2:	e7fe      	b.n	80067a2 <vTaskPlaceOnEventList+0x22>
 80067a4:	4b07      	ldr	r3, [pc, #28]	; (80067c4 <vTaskPlaceOnEventList+0x44>)
 80067a6:	681b      	ldr	r3, [r3, #0]
 80067a8:	3318      	adds	r3, #24
 80067aa:	4619      	mov	r1, r3
 80067ac:	6878      	ldr	r0, [r7, #4]
 80067ae:	f7ff fb32 	bl	8005e16 <vListInsert>
 80067b2:	2101      	movs	r1, #1
 80067b4:	6838      	ldr	r0, [r7, #0]
 80067b6:	f000 fd65 	bl	8007284 <prvAddCurrentTaskToDelayedList>
 80067ba:	bf00      	nop
 80067bc:	3710      	adds	r7, #16
 80067be:	46bd      	mov	sp, r7
 80067c0:	bd80      	pop	{r7, pc}
 80067c2:	bf00      	nop
 80067c4:	20000bc4 	.word	0x20000bc4

080067c8 <vTaskPlaceOnEventListRestricted>:
 80067c8:	b580      	push	{r7, lr}
 80067ca:	b086      	sub	sp, #24
 80067cc:	af00      	add	r7, sp, #0
 80067ce:	60f8      	str	r0, [r7, #12]
 80067d0:	60b9      	str	r1, [r7, #8]
 80067d2:	607a      	str	r2, [r7, #4]
 80067d4:	68fb      	ldr	r3, [r7, #12]
 80067d6:	2b00      	cmp	r3, #0
 80067d8:	d109      	bne.n	80067ee <vTaskPlaceOnEventListRestricted+0x26>
 80067da:	f04f 0350 	mov.w	r3, #80	; 0x50
 80067de:	f383 8811 	msr	BASEPRI, r3
 80067e2:	f3bf 8f6f 	isb	sy
 80067e6:	f3bf 8f4f 	dsb	sy
 80067ea:	617b      	str	r3, [r7, #20]
 80067ec:	e7fe      	b.n	80067ec <vTaskPlaceOnEventListRestricted+0x24>
 80067ee:	4b0a      	ldr	r3, [pc, #40]	; (8006818 <vTaskPlaceOnEventListRestricted+0x50>)
 80067f0:	681b      	ldr	r3, [r3, #0]
 80067f2:	3318      	adds	r3, #24
 80067f4:	4619      	mov	r1, r3
 80067f6:	68f8      	ldr	r0, [r7, #12]
 80067f8:	f7ff fae9 	bl	8005dce <vListInsertEnd>
 80067fc:	687b      	ldr	r3, [r7, #4]
 80067fe:	2b00      	cmp	r3, #0
 8006800:	d002      	beq.n	8006808 <vTaskPlaceOnEventListRestricted+0x40>
 8006802:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
 8006806:	60bb      	str	r3, [r7, #8]
 8006808:	6879      	ldr	r1, [r7, #4]
 800680a:	68b8      	ldr	r0, [r7, #8]
 800680c:	f000 fd3a 	bl	8007284 <prvAddCurrentTaskToDelayedList>
 8006810:	bf00      	nop
 8006812:	3718      	adds	r7, #24
 8006814:	46bd      	mov	sp, r7
 8006816:	bd80      	pop	{r7, pc}
 8006818:	20000bc4 	.word	0x20000bc4

0800681c <xTaskRemoveFromEventList>:
 800681c:	b580      	push	{r7, lr}
 800681e:	b086      	sub	sp, #24
 8006820:	af00      	add	r7, sp, #0
 8006822:	6078      	str	r0, [r7, #4]
 8006824:	687b      	ldr	r3, [r7, #4]
 8006826:	68db      	ldr	r3, [r3, #12]
 8006828:	68db      	ldr	r3, [r3, #12]
 800682a:	613b      	str	r3, [r7, #16]
 800682c:	693b      	ldr	r3, [r7, #16]
 800682e:	2b00      	cmp	r3, #0
 8006830:	d109      	bne.n	8006846 <xTaskRemoveFromEventList+0x2a>
 8006832:	f04f 0350 	mov.w	r3, #80	; 0x50
 8006836:	f383 8811 	msr	BASEPRI, r3
 800683a:	f3bf 8f6f 	isb	sy
 800683e:	f3bf 8f4f 	dsb	sy
 8006842:	60fb      	str	r3, [r7, #12]
 8006844:	e7fe      	b.n	8006844 <xTaskRemoveFromEventList+0x28>
 8006846:	693b      	ldr	r3, [r7, #16]
 8006848:	3318      	adds	r3, #24
 800684a:	4618      	mov	r0, r3
 800684c:	f7ff fb1c 	bl	8005e88 <uxListRemove>
 8006850:	4b1d      	ldr	r3, [pc, #116]	; (80068c8 <xTaskRemoveFromEventList+0xac>)
 8006852:	681b      	ldr	r3, [r3, #0]
 8006854:	2b00      	cmp	r3, #0
 8006856:	d11c      	bne.n	8006892 <xTaskRemoveFromEventList+0x76>
 8006858:	693b      	ldr	r3, [r7, #16]
 800685a:	3304      	adds	r3, #4
 800685c:	4618      	mov	r0, r3
 800685e:	f7ff fb13 	bl	8005e88 <uxListRemove>
 8006862:	693b      	ldr	r3, [r7, #16]
 8006864:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 8006866:	2201      	movs	r2, #1
 8006868:	409a      	lsls	r2, r3
 800686a:	4b18      	ldr	r3, [pc, #96]	; (80068cc <xTaskRemoveFromEventList+0xb0>)
 800686c:	681b      	ldr	r3, [r3, #0]
 800686e:	4313      	orrs	r3, r2
 8006870:	4a16      	ldr	r2, [pc, #88]	; (80068cc <xTaskRemoveFromEventList+0xb0>)
 8006872:	6013      	str	r3, [r2, #0]
 8006874:	693b      	ldr	r3, [r7, #16]
 8006876:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8006878:	4613      	mov	r3, r2
 800687a:	009b      	lsls	r3, r3, #2
 800687c:	4413      	add	r3, r2
 800687e:	009b      	lsls	r3, r3, #2
 8006880:	4a13      	ldr	r2, [pc, #76]	; (80068d0 <xTaskRemoveFromEventList+0xb4>)
 8006882:	441a      	add	r2, r3
 8006884:	693b      	ldr	r3, [r7, #16]
 8006886:	3304      	adds	r3, #4
 8006888:	4619      	mov	r1, r3
 800688a:	4610      	mov	r0, r2
 800688c:	f7ff fa9f 	bl	8005dce <vListInsertEnd>
 8006890:	e005      	b.n	800689e <xTaskRemoveFromEventList+0x82>
 8006892:	693b      	ldr	r3, [r7, #16]
 8006894:	3318      	adds	r3, #24
 8006896:	4619      	mov	r1, r3
 8006898:	480e      	ldr	r0, [pc, #56]	; (80068d4 <xTaskRemoveFromEventList+0xb8>)
 800689a:	f7ff fa98 	bl	8005dce <vListInsertEnd>
 800689e:	693b      	ldr	r3, [r7, #16]
 80068a0:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 80068a2:	4b0d      	ldr	r3, [pc, #52]	; (80068d8 <xTaskRemoveFromEventList+0xbc>)
 80068a4:	681b      	ldr	r3, [r3, #0]
 80068a6:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 80068a8:	429a      	cmp	r2, r3
 80068aa:	d905      	bls.n	80068b8 <xTaskRemoveFromEventList+0x9c>
 80068ac:	2301      	movs	r3, #1
 80068ae:	617b      	str	r3, [r7, #20]
 80068b0:	4b0a      	ldr	r3, [pc, #40]	; (80068dc <xTaskRemoveFromEventList+0xc0>)
 80068b2:	2201      	movs	r2, #1
 80068b4:	601a      	str	r2, [r3, #0]
 80068b6:	e001      	b.n	80068bc <xTaskRemoveFromEventList+0xa0>
 80068b8:	2300      	movs	r3, #0
 80068ba:	617b      	str	r3, [r7, #20]
 80068bc:	697b      	ldr	r3, [r7, #20]
 80068be:	4618      	mov	r0, r3
 80068c0:	3718      	adds	r7, #24
 80068c2:	46bd      	mov	sp, r7
 80068c4:	bd80      	pop	{r7, pc}
 80068c6:	bf00      	nop
 80068c8:	20000cc4 	.word	0x20000cc4
 80068cc:	20000ca4 	.word	0x20000ca4
 80068d0:	20000bc8 	.word	0x20000bc8
 80068d4:	20000c5c 	.word	0x20000c5c
 80068d8:	20000bc4 	.word	0x20000bc4
 80068dc:	20000cb0 	.word	0x20000cb0

080068e0 <vTaskInternalSetTimeOutState>:
 80068e0:	b480      	push	{r7}
 80068e2:	b083      	sub	sp, #12
 80068e4:	af00      	add	r7, sp, #0
 80068e6:	6078      	str	r0, [r7, #4]
 80068e8:	4b06      	ldr	r3, [pc, #24]	; (8006904 <vTaskInternalSetTimeOutState+0x24>)
 80068ea:	681a      	ldr	r2, [r3, #0]
 80068ec:	687b      	ldr	r3, [r7, #4]
 80068ee:	601a      	str	r2, [r3, #0]
 80068f0:	4b05      	ldr	r3, [pc, #20]	; (8006908 <vTaskInternalSetTimeOutState+0x28>)
 80068f2:	681a      	ldr	r2, [r3, #0]
 80068f4:	687b      	ldr	r3, [r7, #4]
 80068f6:	605a      	str	r2, [r3, #4]
 80068f8:	bf00      	nop
 80068fa:	370c      	adds	r7, #12
 80068fc:	46bd      	mov	sp, r7
 80068fe:	f85d 7b04 	ldr.w	r7, [sp], #4
 8006902:	4770      	bx	lr
 8006904:	20000cb4 	.word	0x20000cb4
 8006908:	20000ca0 	.word	0x20000ca0

0800690c <xTaskCheckForTimeOut>:
 800690c:	b580      	push	{r7, lr}
 800690e:	b088      	sub	sp, #32
 8006910:	af00      	add	r7, sp, #0
 8006912:	6078      	str	r0, [r7, #4]
 8006914:	6039      	str	r1, [r7, #0]
 8006916:	687b      	ldr	r3, [r7, #4]
 8006918:	2b00      	cmp	r3, #0
 800691a:	d109      	bne.n	8006930 <xTaskCheckForTimeOut+0x24>
 800691c:	f04f 0350 	mov.w	r3, #80	; 0x50
 8006920:	f383 8811 	msr	BASEPRI, r3
 8006924:	f3bf 8f6f 	isb	sy
 8006928:	f3bf 8f4f 	dsb	sy
 800692c:	613b      	str	r3, [r7, #16]
 800692e:	e7fe      	b.n	800692e <xTaskCheckForTimeOut+0x22>
 8006930:	683b      	ldr	r3, [r7, #0]
 8006932:	2b00      	cmp	r3, #0
 8006934:	d109      	bne.n	800694a <xTaskCheckForTimeOut+0x3e>
 8006936:	f04f 0350 	mov.w	r3, #80	; 0x50
 800693a:	f383 8811 	msr	BASEPRI, r3
 800693e:	f3bf 8f6f 	isb	sy
 8006942:	f3bf 8f4f 	dsb	sy
 8006946:	60fb      	str	r3, [r7, #12]
 8006948:	e7fe      	b.n	8006948 <xTaskCheckForTimeOut+0x3c>
 800694a:	f001 f917 	bl	8007b7c <vPortEnterCritical>
 800694e:	4b1d      	ldr	r3, [pc, #116]	; (80069c4 <xTaskCheckForTimeOut+0xb8>)
 8006950:	681b      	ldr	r3, [r3, #0]
 8006952:	61bb      	str	r3, [r7, #24]
 8006954:	687b      	ldr	r3, [r7, #4]
 8006956:	685b      	ldr	r3, [r3, #4]
 8006958:	69ba      	ldr	r2, [r7, #24]
 800695a:	1ad3      	subs	r3, r2, r3
 800695c:	617b      	str	r3, [r7, #20]
 800695e:	683b      	ldr	r3, [r7, #0]
 8006960:	681b      	ldr	r3, [r3, #0]
 8006962:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
 8006966:	d102      	bne.n	800696e <xTaskCheckForTimeOut+0x62>
 8006968:	2300      	movs	r3, #0
 800696a:	61fb      	str	r3, [r7, #28]
 800696c:	e023      	b.n	80069b6 <xTaskCheckForTimeOut+0xaa>
 800696e:	687b      	ldr	r3, [r7, #4]
 8006970:	681a      	ldr	r2, [r3, #0]
 8006972:	4b15      	ldr	r3, [pc, #84]	; (80069c8 <xTaskCheckForTimeOut+0xbc>)
 8006974:	681b      	ldr	r3, [r3, #0]
 8006976:	429a      	cmp	r2, r3
 8006978:	d007      	beq.n	800698a <xTaskCheckForTimeOut+0x7e>
 800697a:	687b      	ldr	r3, [r7, #4]
 800697c:	685b      	ldr	r3, [r3, #4]
 800697e:	69ba      	ldr	r2, [r7, #24]
 8006980:	429a      	cmp	r2, r3
 8006982:	d302      	bcc.n	800698a <xTaskCheckForTimeOut+0x7e>
 8006984:	2301      	movs	r3, #1
 8006986:	61fb      	str	r3, [r7, #28]
 8006988:	e015      	b.n	80069b6 <xTaskCheckForTimeOut+0xaa>
 800698a:	683b      	ldr	r3, [r7, #0]
 800698c:	681b      	ldr	r3, [r3, #0]
 800698e:	697a      	ldr	r2, [r7, #20]
 8006990:	429a      	cmp	r2, r3
 8006992:	d20b      	bcs.n	80069ac <xTaskCheckForTimeOut+0xa0>
 8006994:	683b      	ldr	r3, [r7, #0]
 8006996:	681a      	ldr	r2, [r3, #0]
 8006998:	697b      	ldr	r3, [r7, #20]
 800699a:	1ad2      	subs	r2, r2, r3
 800699c:	683b      	ldr	r3, [r7, #0]
 800699e:	601a      	str	r2, [r3, #0]
 80069a0:	6878      	ldr	r0, [r7, #4]
 80069a2:	f7ff ff9d 	bl	80068e0 <vTaskInternalSetTimeOutState>
 80069a6:	2300      	movs	r3, #0
 80069a8:	61fb      	str	r3, [r7, #28]
 80069aa:	e004      	b.n	80069b6 <xTaskCheckForTimeOut+0xaa>
 80069ac:	683b      	ldr	r3, [r7, #0]
 80069ae:	2200      	movs	r2, #0
 80069b0:	601a      	str	r2, [r3, #0]
 80069b2:	2301      	movs	r3, #1
 80069b4:	61fb      	str	r3, [r7, #28]
 80069b6:	f001 f90f 	bl	8007bd8 <vPortExitCritical>
 80069ba:	69fb      	ldr	r3, [r7, #28]
 80069bc:	4618      	mov	r0, r3
 80069be:	3720      	adds	r7, #32
 80069c0:	46bd      	mov	sp, r7
 80069c2:	bd80      	pop	{r7, pc}
 80069c4:	20000ca0 	.word	0x20000ca0
 80069c8:	20000cb4 	.word	0x20000cb4

080069cc <vTaskMissedYield>:
 80069cc:	b480      	push	{r7}
 80069ce:	af00      	add	r7, sp, #0
 80069d0:	4b03      	ldr	r3, [pc, #12]	; (80069e0 <vTaskMissedYield+0x14>)
 80069d2:	2201      	movs	r2, #1
 80069d4:	601a      	str	r2, [r3, #0]
 80069d6:	bf00      	nop
 80069d8:	46bd      	mov	sp, r7
 80069da:	f85d 7b04 	ldr.w	r7, [sp], #4
 80069de:	4770      	bx	lr
 80069e0:	20000cb0 	.word	0x20000cb0

080069e4 <prvIdleTask>:
 80069e4:	b580      	push	{r7, lr}
 80069e6:	b082      	sub	sp, #8
 80069e8:	af00      	add	r7, sp, #0
 80069ea:	6078      	str	r0, [r7, #4]
 80069ec:	f000 f854 	bl	8006a98 <prvCheckTasksWaitingTermination>
 80069f0:	4b07      	ldr	r3, [pc, #28]	; (8006a10 <prvIdleTask+0x2c>)
 80069f2:	681b      	ldr	r3, [r3, #0]
 80069f4:	2b01      	cmp	r3, #1
 80069f6:	d907      	bls.n	8006a08 <prvIdleTask+0x24>
 80069f8:	4b06      	ldr	r3, [pc, #24]	; (8006a14 <prvIdleTask+0x30>)
 80069fa:	f04f 5280 	mov.w	r2, #268435456	; 0x10000000
 80069fe:	601a      	str	r2, [r3, #0]
 8006a00:	f3bf 8f4f 	dsb	sy
 8006a04:	f3bf 8f6f 	isb	sy
 8006a08:	f7fc fcbb 	bl	8003382 <vApplicationIdleHook>
 8006a0c:	e7ee      	b.n	80069ec <prvIdleTask+0x8>
 8006a0e:	bf00      	nop
 8006a10:	20000bc8 	.word	0x20000bc8
 8006a14:	e000ed04 	.word	0xe000ed04

08006a18 <prvInitialiseTaskLists>:
 8006a18:	b580      	push	{r7, lr}
 8006a1a:	b082      	sub	sp, #8
 8006a1c:	af00      	add	r7, sp, #0
 8006a1e:	2300      	movs	r3, #0
 8006a20:	607b      	str	r3, [r7, #4]
 8006a22:	e00c      	b.n	8006a3e <prvInitialiseTaskLists+0x26>
 8006a24:	687a      	ldr	r2, [r7, #4]
 8006a26:	4613      	mov	r3, r2
 8006a28:	009b      	lsls	r3, r3, #2
 8006a2a:	4413      	add	r3, r2
 8006a2c:	009b      	lsls	r3, r3, #2
 8006a2e:	4a12      	ldr	r2, [pc, #72]	; (8006a78 <prvInitialiseTaskLists+0x60>)
 8006a30:	4413      	add	r3, r2
 8006a32:	4618      	mov	r0, r3
 8006a34:	f7ff f99e 	bl	8005d74 <vListInitialise>
 8006a38:	687b      	ldr	r3, [r7, #4]
 8006a3a:	3301      	adds	r3, #1
 8006a3c:	607b      	str	r3, [r7, #4]
 8006a3e:	687b      	ldr	r3, [r7, #4]
 8006a40:	2b04      	cmp	r3, #4
 8006a42:	d9ef      	bls.n	8006a24 <prvInitialiseTaskLists+0xc>
 8006a44:	480d      	ldr	r0, [pc, #52]	; (8006a7c <prvInitialiseTaskLists+0x64>)
 8006a46:	f7ff f995 	bl	8005d74 <vListInitialise>
 8006a4a:	480d      	ldr	r0, [pc, #52]	; (8006a80 <prvInitialiseTaskLists+0x68>)
 8006a4c:	f7ff f992 	bl	8005d74 <vListInitialise>
 8006a50:	480c      	ldr	r0, [pc, #48]	; (8006a84 <prvInitialiseTaskLists+0x6c>)
 8006a52:	f7ff f98f 	bl	8005d74 <vListInitialise>
 8006a56:	480c      	ldr	r0, [pc, #48]	; (8006a88 <prvInitialiseTaskLists+0x70>)
 8006a58:	f7ff f98c 	bl	8005d74 <vListInitialise>
 8006a5c:	480b      	ldr	r0, [pc, #44]	; (8006a8c <prvInitialiseTaskLists+0x74>)
 8006a5e:	f7ff f989 	bl	8005d74 <vListInitialise>
 8006a62:	4b0b      	ldr	r3, [pc, #44]	; (8006a90 <prvInitialiseTaskLists+0x78>)
 8006a64:	4a05      	ldr	r2, [pc, #20]	; (8006a7c <prvInitialiseTaskLists+0x64>)
 8006a66:	601a      	str	r2, [r3, #0]
 8006a68:	4b0a      	ldr	r3, [pc, #40]	; (8006a94 <prvInitialiseTaskLists+0x7c>)
 8006a6a:	4a05      	ldr	r2, [pc, #20]	; (8006a80 <prvInitialiseTaskLists+0x68>)
 8006a6c:	601a      	str	r2, [r3, #0]
 8006a6e:	bf00      	nop
 8006a70:	3708      	adds	r7, #8
 8006a72:	46bd      	mov	sp, r7
 8006a74:	bd80      	pop	{r7, pc}
 8006a76:	bf00      	nop
 8006a78:	20000bc8 	.word	0x20000bc8
 8006a7c:	20000c2c 	.word	0x20000c2c
 8006a80:	20000c40 	.word	0x20000c40
 8006a84:	20000c5c 	.word	0x20000c5c
 8006a88:	20000c70 	.word	0x20000c70
 8006a8c:	20000c88 	.word	0x20000c88
 8006a90:	20000c54 	.word	0x20000c54
 8006a94:	20000c58 	.word	0x20000c58

08006a98 <prvCheckTasksWaitingTermination>:
 8006a98:	b580      	push	{r7, lr}
 8006a9a:	b082      	sub	sp, #8
 8006a9c:	af00      	add	r7, sp, #0
 8006a9e:	e019      	b.n	8006ad4 <prvCheckTasksWaitingTermination+0x3c>
 8006aa0:	f001 f86c 	bl	8007b7c <vPortEnterCritical>
 8006aa4:	4b0f      	ldr	r3, [pc, #60]	; (8006ae4 <prvCheckTasksWaitingTermination+0x4c>)
 8006aa6:	68db      	ldr	r3, [r3, #12]
 8006aa8:	68db      	ldr	r3, [r3, #12]
 8006aaa:	607b      	str	r3, [r7, #4]
 8006aac:	687b      	ldr	r3, [r7, #4]
 8006aae:	3304      	adds	r3, #4
 8006ab0:	4618      	mov	r0, r3
 8006ab2:	f7ff f9e9 	bl	8005e88 <uxListRemove>
 8006ab6:	4b0c      	ldr	r3, [pc, #48]	; (8006ae8 <prvCheckTasksWaitingTermination+0x50>)
 8006ab8:	681b      	ldr	r3, [r3, #0]
 8006aba:	3b01      	subs	r3, #1
 8006abc:	4a0a      	ldr	r2, [pc, #40]	; (8006ae8 <prvCheckTasksWaitingTermination+0x50>)
 8006abe:	6013      	str	r3, [r2, #0]
 8006ac0:	4b0a      	ldr	r3, [pc, #40]	; (8006aec <prvCheckTasksWaitingTermination+0x54>)
 8006ac2:	681b      	ldr	r3, [r3, #0]
 8006ac4:	3b01      	subs	r3, #1
 8006ac6:	4a09      	ldr	r2, [pc, #36]	; (8006aec <prvCheckTasksWaitingTermination+0x54>)
 8006ac8:	6013      	str	r3, [r2, #0]
 8006aca:	f001 f885 	bl	8007bd8 <vPortExitCritical>
 8006ace:	6878      	ldr	r0, [r7, #4]
 8006ad0:	f000 f80e 	bl	8006af0 <prvDeleteTCB>
 8006ad4:	4b05      	ldr	r3, [pc, #20]	; (8006aec <prvCheckTasksWaitingTermination+0x54>)
 8006ad6:	681b      	ldr	r3, [r3, #0]
 8006ad8:	2b00      	cmp	r3, #0
 8006ada:	d1e1      	bne.n	8006aa0 <prvCheckTasksWaitingTermination+0x8>
 8006adc:	bf00      	nop
 8006ade:	3708      	adds	r7, #8
 8006ae0:	46bd      	mov	sp, r7
 8006ae2:	bd80      	pop	{r7, pc}
 8006ae4:	20000c70 	.word	0x20000c70
 8006ae8:	20000c9c 	.word	0x20000c9c
 8006aec:	20000c84 	.word	0x20000c84

08006af0 <prvDeleteTCB>:
 8006af0:	b580      	push	{r7, lr}
 8006af2:	b084      	sub	sp, #16
 8006af4:	af00      	add	r7, sp, #0
 8006af6:	6078      	str	r0, [r7, #4]
 8006af8:	687b      	ldr	r3, [r7, #4]
 8006afa:	3350      	adds	r3, #80	; 0x50
 8006afc:	4618      	mov	r0, r3
 8006afe:	f002 fb4b 	bl	8009198 <_reclaim_reent>
 8006b02:	687b      	ldr	r3, [r7, #4]
 8006b04:	f893 347d 	ldrb.w	r3, [r3, #1149]	; 0x47d
 8006b08:	2b00      	cmp	r3, #0
 8006b0a:	d108      	bne.n	8006b1e <prvDeleteTCB+0x2e>
 8006b0c:	687b      	ldr	r3, [r7, #4]
 8006b0e:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8006b10:	4618      	mov	r0, r3
 8006b12:	f001 fa13 	bl	8007f3c <vPortFree>
 8006b16:	6878      	ldr	r0, [r7, #4]
 8006b18:	f001 fa10 	bl	8007f3c <vPortFree>
 8006b1c:	e017      	b.n	8006b4e <prvDeleteTCB+0x5e>
 8006b1e:	687b      	ldr	r3, [r7, #4]
 8006b20:	f893 347d 	ldrb.w	r3, [r3, #1149]	; 0x47d
 8006b24:	2b01      	cmp	r3, #1
 8006b26:	d103      	bne.n	8006b30 <prvDeleteTCB+0x40>
 8006b28:	6878      	ldr	r0, [r7, #4]
 8006b2a:	f001 fa07 	bl	8007f3c <vPortFree>
 8006b2e:	e00e      	b.n	8006b4e <prvDeleteTCB+0x5e>
 8006b30:	687b      	ldr	r3, [r7, #4]
 8006b32:	f893 347d 	ldrb.w	r3, [r3, #1149]	; 0x47d
 8006b36:	2b02      	cmp	r3, #2
 8006b38:	d009      	beq.n	8006b4e <prvDeleteTCB+0x5e>
 8006b3a:	f04f 0350 	mov.w	r3, #80	; 0x50
 8006b3e:	f383 8811 	msr	BASEPRI, r3
 8006b42:	f3bf 8f6f 	isb	sy
 8006b46:	f3bf 8f4f 	dsb	sy
 8006b4a:	60fb      	str	r3, [r7, #12]
 8006b4c:	e7fe      	b.n	8006b4c <prvDeleteTCB+0x5c>
 8006b4e:	bf00      	nop
 8006b50:	3710      	adds	r7, #16
 8006b52:	46bd      	mov	sp, r7
 8006b54:	bd80      	pop	{r7, pc}
	...

08006b58 <prvResetNextTaskUnblockTime>:
 8006b58:	b480      	push	{r7}
 8006b5a:	b083      	sub	sp, #12
 8006b5c:	af00      	add	r7, sp, #0
 8006b5e:	4b0c      	ldr	r3, [pc, #48]	; (8006b90 <prvResetNextTaskUnblockTime+0x38>)
 8006b60:	681b      	ldr	r3, [r3, #0]
 8006b62:	681b      	ldr	r3, [r3, #0]
 8006b64:	2b00      	cmp	r3, #0
 8006b66:	d104      	bne.n	8006b72 <prvResetNextTaskUnblockTime+0x1a>
 8006b68:	4b0a      	ldr	r3, [pc, #40]	; (8006b94 <prvResetNextTaskUnblockTime+0x3c>)
 8006b6a:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
 8006b6e:	601a      	str	r2, [r3, #0]
 8006b70:	e008      	b.n	8006b84 <prvResetNextTaskUnblockTime+0x2c>
 8006b72:	4b07      	ldr	r3, [pc, #28]	; (8006b90 <prvResetNextTaskUnblockTime+0x38>)
 8006b74:	681b      	ldr	r3, [r3, #0]
 8006b76:	68db      	ldr	r3, [r3, #12]
 8006b78:	68db      	ldr	r3, [r3, #12]
 8006b7a:	607b      	str	r3, [r7, #4]
 8006b7c:	687b      	ldr	r3, [r7, #4]
 8006b7e:	685b      	ldr	r3, [r3, #4]
 8006b80:	4a04      	ldr	r2, [pc, #16]	; (8006b94 <prvResetNextTaskUnblockTime+0x3c>)
 8006b82:	6013      	str	r3, [r2, #0]
 8006b84:	bf00      	nop
 8006b86:	370c      	adds	r7, #12
 8006b88:	46bd      	mov	sp, r7
 8006b8a:	f85d 7b04 	ldr.w	r7, [sp], #4
 8006b8e:	4770      	bx	lr
 8006b90:	20000c54 	.word	0x20000c54
 8006b94:	20000cbc 	.word	0x20000cbc

08006b98 <xTaskGetCurrentTaskHandle>:
 8006b98:	b480      	push	{r7}
 8006b9a:	b083      	sub	sp, #12
 8006b9c:	af00      	add	r7, sp, #0
 8006b9e:	4b05      	ldr	r3, [pc, #20]	; (8006bb4 <xTaskGetCurrentTaskHandle+0x1c>)
 8006ba0:	681b      	ldr	r3, [r3, #0]
 8006ba2:	607b      	str	r3, [r7, #4]
 8006ba4:	687b      	ldr	r3, [r7, #4]
 8006ba6:	4618      	mov	r0, r3
 8006ba8:	370c      	adds	r7, #12
 8006baa:	46bd      	mov	sp, r7
 8006bac:	f85d 7b04 	ldr.w	r7, [sp], #4
 8006bb0:	4770      	bx	lr
 8006bb2:	bf00      	nop
 8006bb4:	20000bc4 	.word	0x20000bc4

08006bb8 <xTaskGetSchedulerState>:
 8006bb8:	b480      	push	{r7}
 8006bba:	b083      	sub	sp, #12
 8006bbc:	af00      	add	r7, sp, #0
 8006bbe:	4b0b      	ldr	r3, [pc, #44]	; (8006bec <xTaskGetSchedulerState+0x34>)
 8006bc0:	681b      	ldr	r3, [r3, #0]
 8006bc2:	2b00      	cmp	r3, #0
 8006bc4:	d102      	bne.n	8006bcc <xTaskGetSchedulerState+0x14>
 8006bc6:	2301      	movs	r3, #1
 8006bc8:	607b      	str	r3, [r7, #4]
 8006bca:	e008      	b.n	8006bde <xTaskGetSchedulerState+0x26>
 8006bcc:	4b08      	ldr	r3, [pc, #32]	; (8006bf0 <xTaskGetSchedulerState+0x38>)
 8006bce:	681b      	ldr	r3, [r3, #0]
 8006bd0:	2b00      	cmp	r3, #0
 8006bd2:	d102      	bne.n	8006bda <xTaskGetSchedulerState+0x22>
 8006bd4:	2302      	movs	r3, #2
 8006bd6:	607b      	str	r3, [r7, #4]
 8006bd8:	e001      	b.n	8006bde <xTaskGetSchedulerState+0x26>
 8006bda:	2300      	movs	r3, #0
 8006bdc:	607b      	str	r3, [r7, #4]
 8006bde:	687b      	ldr	r3, [r7, #4]
 8006be0:	4618      	mov	r0, r3
 8006be2:	370c      	adds	r7, #12
 8006be4:	46bd      	mov	sp, r7
 8006be6:	f85d 7b04 	ldr.w	r7, [sp], #4
 8006bea:	4770      	bx	lr
 8006bec:	20000ca8 	.word	0x20000ca8
 8006bf0:	20000cc4 	.word	0x20000cc4

08006bf4 <xTaskPriorityInherit>:
 8006bf4:	b580      	push	{r7, lr}
 8006bf6:	b084      	sub	sp, #16
 8006bf8:	af00      	add	r7, sp, #0
 8006bfa:	6078      	str	r0, [r7, #4]
 8006bfc:	687b      	ldr	r3, [r7, #4]
 8006bfe:	60bb      	str	r3, [r7, #8]
 8006c00:	2300      	movs	r3, #0
 8006c02:	60fb      	str	r3, [r7, #12]
 8006c04:	687b      	ldr	r3, [r7, #4]
 8006c06:	2b00      	cmp	r3, #0
 8006c08:	d069      	beq.n	8006cde <xTaskPriorityInherit+0xea>
 8006c0a:	68bb      	ldr	r3, [r7, #8]
 8006c0c:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8006c0e:	4b36      	ldr	r3, [pc, #216]	; (8006ce8 <xTaskPriorityInherit+0xf4>)
 8006c10:	681b      	ldr	r3, [r3, #0]
 8006c12:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 8006c14:	429a      	cmp	r2, r3
 8006c16:	d259      	bcs.n	8006ccc <xTaskPriorityInherit+0xd8>
 8006c18:	68bb      	ldr	r3, [r7, #8]
 8006c1a:	699b      	ldr	r3, [r3, #24]
 8006c1c:	2b00      	cmp	r3, #0
 8006c1e:	db06      	blt.n	8006c2e <xTaskPriorityInherit+0x3a>
 8006c20:	4b31      	ldr	r3, [pc, #196]	; (8006ce8 <xTaskPriorityInherit+0xf4>)
 8006c22:	681b      	ldr	r3, [r3, #0]
 8006c24:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 8006c26:	f1c3 0205 	rsb	r2, r3, #5
 8006c2a:	68bb      	ldr	r3, [r7, #8]
 8006c2c:	619a      	str	r2, [r3, #24]
 8006c2e:	68bb      	ldr	r3, [r7, #8]
 8006c30:	6959      	ldr	r1, [r3, #20]
 8006c32:	68bb      	ldr	r3, [r7, #8]
 8006c34:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8006c36:	4613      	mov	r3, r2
 8006c38:	009b      	lsls	r3, r3, #2
 8006c3a:	4413      	add	r3, r2
 8006c3c:	009b      	lsls	r3, r3, #2
 8006c3e:	4a2b      	ldr	r2, [pc, #172]	; (8006cec <xTaskPriorityInherit+0xf8>)
 8006c40:	4413      	add	r3, r2
 8006c42:	4299      	cmp	r1, r3
 8006c44:	d13a      	bne.n	8006cbc <xTaskPriorityInherit+0xc8>
 8006c46:	68bb      	ldr	r3, [r7, #8]
 8006c48:	3304      	adds	r3, #4
 8006c4a:	4618      	mov	r0, r3
 8006c4c:	f7ff f91c 	bl	8005e88 <uxListRemove>
 8006c50:	4603      	mov	r3, r0
 8006c52:	2b00      	cmp	r3, #0
 8006c54:	d115      	bne.n	8006c82 <xTaskPriorityInherit+0x8e>
 8006c56:	68bb      	ldr	r3, [r7, #8]
 8006c58:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8006c5a:	4924      	ldr	r1, [pc, #144]	; (8006cec <xTaskPriorityInherit+0xf8>)
 8006c5c:	4613      	mov	r3, r2
 8006c5e:	009b      	lsls	r3, r3, #2
 8006c60:	4413      	add	r3, r2
 8006c62:	009b      	lsls	r3, r3, #2
 8006c64:	440b      	add	r3, r1
 8006c66:	681b      	ldr	r3, [r3, #0]
 8006c68:	2b00      	cmp	r3, #0
 8006c6a:	d10a      	bne.n	8006c82 <xTaskPriorityInherit+0x8e>
 8006c6c:	68bb      	ldr	r3, [r7, #8]
 8006c6e:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 8006c70:	2201      	movs	r2, #1
 8006c72:	fa02 f303 	lsl.w	r3, r2, r3
 8006c76:	43da      	mvns	r2, r3
 8006c78:	4b1d      	ldr	r3, [pc, #116]	; (8006cf0 <xTaskPriorityInherit+0xfc>)
 8006c7a:	681b      	ldr	r3, [r3, #0]
 8006c7c:	4013      	ands	r3, r2
 8006c7e:	4a1c      	ldr	r2, [pc, #112]	; (8006cf0 <xTaskPriorityInherit+0xfc>)
 8006c80:	6013      	str	r3, [r2, #0]
 8006c82:	4b19      	ldr	r3, [pc, #100]	; (8006ce8 <xTaskPriorityInherit+0xf4>)
 8006c84:	681b      	ldr	r3, [r3, #0]
 8006c86:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8006c88:	68bb      	ldr	r3, [r7, #8]
 8006c8a:	62da      	str	r2, [r3, #44]	; 0x2c
 8006c8c:	68bb      	ldr	r3, [r7, #8]
 8006c8e:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 8006c90:	2201      	movs	r2, #1
 8006c92:	409a      	lsls	r2, r3
 8006c94:	4b16      	ldr	r3, [pc, #88]	; (8006cf0 <xTaskPriorityInherit+0xfc>)
 8006c96:	681b      	ldr	r3, [r3, #0]
 8006c98:	4313      	orrs	r3, r2
 8006c9a:	4a15      	ldr	r2, [pc, #84]	; (8006cf0 <xTaskPriorityInherit+0xfc>)
 8006c9c:	6013      	str	r3, [r2, #0]
 8006c9e:	68bb      	ldr	r3, [r7, #8]
 8006ca0:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8006ca2:	4613      	mov	r3, r2
 8006ca4:	009b      	lsls	r3, r3, #2
 8006ca6:	4413      	add	r3, r2
 8006ca8:	009b      	lsls	r3, r3, #2
 8006caa:	4a10      	ldr	r2, [pc, #64]	; (8006cec <xTaskPriorityInherit+0xf8>)
 8006cac:	441a      	add	r2, r3
 8006cae:	68bb      	ldr	r3, [r7, #8]
 8006cb0:	3304      	adds	r3, #4
 8006cb2:	4619      	mov	r1, r3
 8006cb4:	4610      	mov	r0, r2
 8006cb6:	f7ff f88a 	bl	8005dce <vListInsertEnd>
 8006cba:	e004      	b.n	8006cc6 <xTaskPriorityInherit+0xd2>
 8006cbc:	4b0a      	ldr	r3, [pc, #40]	; (8006ce8 <xTaskPriorityInherit+0xf4>)
 8006cbe:	681b      	ldr	r3, [r3, #0]
 8006cc0:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8006cc2:	68bb      	ldr	r3, [r7, #8]
 8006cc4:	62da      	str	r2, [r3, #44]	; 0x2c
 8006cc6:	2301      	movs	r3, #1
 8006cc8:	60fb      	str	r3, [r7, #12]
 8006cca:	e008      	b.n	8006cde <xTaskPriorityInherit+0xea>
 8006ccc:	68bb      	ldr	r3, [r7, #8]
 8006cce:	6c9a      	ldr	r2, [r3, #72]	; 0x48
 8006cd0:	4b05      	ldr	r3, [pc, #20]	; (8006ce8 <xTaskPriorityInherit+0xf4>)
 8006cd2:	681b      	ldr	r3, [r3, #0]
 8006cd4:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 8006cd6:	429a      	cmp	r2, r3
 8006cd8:	d201      	bcs.n	8006cde <xTaskPriorityInherit+0xea>
 8006cda:	2301      	movs	r3, #1
 8006cdc:	60fb      	str	r3, [r7, #12]
 8006cde:	68fb      	ldr	r3, [r7, #12]
 8006ce0:	4618      	mov	r0, r3
 8006ce2:	3710      	adds	r7, #16
 8006ce4:	46bd      	mov	sp, r7
 8006ce6:	bd80      	pop	{r7, pc}
 8006ce8:	20000bc4 	.word	0x20000bc4
 8006cec:	20000bc8 	.word	0x20000bc8
 8006cf0:	20000ca4 	.word	0x20000ca4

08006cf4 <xTaskPriorityDisinherit>:
 8006cf4:	b580      	push	{r7, lr}
 8006cf6:	b086      	sub	sp, #24
 8006cf8:	af00      	add	r7, sp, #0
 8006cfa:	6078      	str	r0, [r7, #4]
 8006cfc:	687b      	ldr	r3, [r7, #4]
 8006cfe:	613b      	str	r3, [r7, #16]
 8006d00:	2300      	movs	r3, #0
 8006d02:	617b      	str	r3, [r7, #20]
 8006d04:	687b      	ldr	r3, [r7, #4]
 8006d06:	2b00      	cmp	r3, #0
 8006d08:	d06c      	beq.n	8006de4 <xTaskPriorityDisinherit+0xf0>
 8006d0a:	4b39      	ldr	r3, [pc, #228]	; (8006df0 <xTaskPriorityDisinherit+0xfc>)
 8006d0c:	681b      	ldr	r3, [r3, #0]
 8006d0e:	693a      	ldr	r2, [r7, #16]
 8006d10:	429a      	cmp	r2, r3
 8006d12:	d009      	beq.n	8006d28 <xTaskPriorityDisinherit+0x34>
 8006d14:	f04f 0350 	mov.w	r3, #80	; 0x50
 8006d18:	f383 8811 	msr	BASEPRI, r3
 8006d1c:	f3bf 8f6f 	isb	sy
 8006d20:	f3bf 8f4f 	dsb	sy
 8006d24:	60fb      	str	r3, [r7, #12]
 8006d26:	e7fe      	b.n	8006d26 <xTaskPriorityDisinherit+0x32>
 8006d28:	693b      	ldr	r3, [r7, #16]
 8006d2a:	6cdb      	ldr	r3, [r3, #76]	; 0x4c
 8006d2c:	2b00      	cmp	r3, #0
 8006d2e:	d109      	bne.n	8006d44 <xTaskPriorityDisinherit+0x50>
 8006d30:	f04f 0350 	mov.w	r3, #80	; 0x50
 8006d34:	f383 8811 	msr	BASEPRI, r3
 8006d38:	f3bf 8f6f 	isb	sy
 8006d3c:	f3bf 8f4f 	dsb	sy
 8006d40:	60bb      	str	r3, [r7, #8]
 8006d42:	e7fe      	b.n	8006d42 <xTaskPriorityDisinherit+0x4e>
 8006d44:	693b      	ldr	r3, [r7, #16]
 8006d46:	6cdb      	ldr	r3, [r3, #76]	; 0x4c
 8006d48:	1e5a      	subs	r2, r3, #1
 8006d4a:	693b      	ldr	r3, [r7, #16]
 8006d4c:	64da      	str	r2, [r3, #76]	; 0x4c
 8006d4e:	693b      	ldr	r3, [r7, #16]
 8006d50:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8006d52:	693b      	ldr	r3, [r7, #16]
 8006d54:	6c9b      	ldr	r3, [r3, #72]	; 0x48
 8006d56:	429a      	cmp	r2, r3
 8006d58:	d044      	beq.n	8006de4 <xTaskPriorityDisinherit+0xf0>
 8006d5a:	693b      	ldr	r3, [r7, #16]
 8006d5c:	6cdb      	ldr	r3, [r3, #76]	; 0x4c
 8006d5e:	2b00      	cmp	r3, #0
 8006d60:	d140      	bne.n	8006de4 <xTaskPriorityDisinherit+0xf0>
 8006d62:	693b      	ldr	r3, [r7, #16]
 8006d64:	3304      	adds	r3, #4
 8006d66:	4618      	mov	r0, r3
 8006d68:	f7ff f88e 	bl	8005e88 <uxListRemove>
 8006d6c:	4603      	mov	r3, r0
 8006d6e:	2b00      	cmp	r3, #0
 8006d70:	d115      	bne.n	8006d9e <xTaskPriorityDisinherit+0xaa>
 8006d72:	693b      	ldr	r3, [r7, #16]
 8006d74:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8006d76:	491f      	ldr	r1, [pc, #124]	; (8006df4 <xTaskPriorityDisinherit+0x100>)
 8006d78:	4613      	mov	r3, r2
 8006d7a:	009b      	lsls	r3, r3, #2
 8006d7c:	4413      	add	r3, r2
 8006d7e:	009b      	lsls	r3, r3, #2
 8006d80:	440b      	add	r3, r1
 8006d82:	681b      	ldr	r3, [r3, #0]
 8006d84:	2b00      	cmp	r3, #0
 8006d86:	d10a      	bne.n	8006d9e <xTaskPriorityDisinherit+0xaa>
 8006d88:	693b      	ldr	r3, [r7, #16]
 8006d8a:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 8006d8c:	2201      	movs	r2, #1
 8006d8e:	fa02 f303 	lsl.w	r3, r2, r3
 8006d92:	43da      	mvns	r2, r3
 8006d94:	4b18      	ldr	r3, [pc, #96]	; (8006df8 <xTaskPriorityDisinherit+0x104>)
 8006d96:	681b      	ldr	r3, [r3, #0]
 8006d98:	4013      	ands	r3, r2
 8006d9a:	4a17      	ldr	r2, [pc, #92]	; (8006df8 <xTaskPriorityDisinherit+0x104>)
 8006d9c:	6013      	str	r3, [r2, #0]
 8006d9e:	693b      	ldr	r3, [r7, #16]
 8006da0:	6c9a      	ldr	r2, [r3, #72]	; 0x48
 8006da2:	693b      	ldr	r3, [r7, #16]
 8006da4:	62da      	str	r2, [r3, #44]	; 0x2c
 8006da6:	693b      	ldr	r3, [r7, #16]
 8006da8:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 8006daa:	f1c3 0205 	rsb	r2, r3, #5
 8006dae:	693b      	ldr	r3, [r7, #16]
 8006db0:	619a      	str	r2, [r3, #24]
 8006db2:	693b      	ldr	r3, [r7, #16]
 8006db4:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 8006db6:	2201      	movs	r2, #1
 8006db8:	409a      	lsls	r2, r3
 8006dba:	4b0f      	ldr	r3, [pc, #60]	; (8006df8 <xTaskPriorityDisinherit+0x104>)
 8006dbc:	681b      	ldr	r3, [r3, #0]
 8006dbe:	4313      	orrs	r3, r2
 8006dc0:	4a0d      	ldr	r2, [pc, #52]	; (8006df8 <xTaskPriorityDisinherit+0x104>)
 8006dc2:	6013      	str	r3, [r2, #0]
 8006dc4:	693b      	ldr	r3, [r7, #16]
 8006dc6:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8006dc8:	4613      	mov	r3, r2
 8006dca:	009b      	lsls	r3, r3, #2
 8006dcc:	4413      	add	r3, r2
 8006dce:	009b      	lsls	r3, r3, #2
 8006dd0:	4a08      	ldr	r2, [pc, #32]	; (8006df4 <xTaskPriorityDisinherit+0x100>)
 8006dd2:	441a      	add	r2, r3
 8006dd4:	693b      	ldr	r3, [r7, #16]
 8006dd6:	3304      	adds	r3, #4
 8006dd8:	4619      	mov	r1, r3
 8006dda:	4610      	mov	r0, r2
 8006ddc:	f7fe fff7 	bl	8005dce <vListInsertEnd>
 8006de0:	2301      	movs	r3, #1
 8006de2:	617b      	str	r3, [r7, #20]
 8006de4:	697b      	ldr	r3, [r7, #20]
 8006de6:	4618      	mov	r0, r3
 8006de8:	3718      	adds	r7, #24
 8006dea:	46bd      	mov	sp, r7
 8006dec:	bd80      	pop	{r7, pc}
 8006dee:	bf00      	nop
 8006df0:	20000bc4 	.word	0x20000bc4
 8006df4:	20000bc8 	.word	0x20000bc8
 8006df8:	20000ca4 	.word	0x20000ca4

08006dfc <vTaskPriorityDisinheritAfterTimeout>:
 8006dfc:	b580      	push	{r7, lr}
 8006dfe:	b088      	sub	sp, #32
 8006e00:	af00      	add	r7, sp, #0
 8006e02:	6078      	str	r0, [r7, #4]
 8006e04:	6039      	str	r1, [r7, #0]
 8006e06:	687b      	ldr	r3, [r7, #4]
 8006e08:	61bb      	str	r3, [r7, #24]
 8006e0a:	2301      	movs	r3, #1
 8006e0c:	617b      	str	r3, [r7, #20]
 8006e0e:	687b      	ldr	r3, [r7, #4]
 8006e10:	2b00      	cmp	r3, #0
 8006e12:	f000 8081 	beq.w	8006f18 <vTaskPriorityDisinheritAfterTimeout+0x11c>
 8006e16:	69bb      	ldr	r3, [r7, #24]
 8006e18:	6cdb      	ldr	r3, [r3, #76]	; 0x4c
 8006e1a:	2b00      	cmp	r3, #0
 8006e1c:	d109      	bne.n	8006e32 <vTaskPriorityDisinheritAfterTimeout+0x36>
 8006e1e:	f04f 0350 	mov.w	r3, #80	; 0x50
 8006e22:	f383 8811 	msr	BASEPRI, r3
 8006e26:	f3bf 8f6f 	isb	sy
 8006e2a:	f3bf 8f4f 	dsb	sy
 8006e2e:	60fb      	str	r3, [r7, #12]
 8006e30:	e7fe      	b.n	8006e30 <vTaskPriorityDisinheritAfterTimeout+0x34>
 8006e32:	69bb      	ldr	r3, [r7, #24]
 8006e34:	6c9b      	ldr	r3, [r3, #72]	; 0x48
 8006e36:	683a      	ldr	r2, [r7, #0]
 8006e38:	429a      	cmp	r2, r3
 8006e3a:	d902      	bls.n	8006e42 <vTaskPriorityDisinheritAfterTimeout+0x46>
 8006e3c:	683b      	ldr	r3, [r7, #0]
 8006e3e:	61fb      	str	r3, [r7, #28]
 8006e40:	e002      	b.n	8006e48 <vTaskPriorityDisinheritAfterTimeout+0x4c>
 8006e42:	69bb      	ldr	r3, [r7, #24]
 8006e44:	6c9b      	ldr	r3, [r3, #72]	; 0x48
 8006e46:	61fb      	str	r3, [r7, #28]
 8006e48:	69bb      	ldr	r3, [r7, #24]
 8006e4a:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 8006e4c:	69fa      	ldr	r2, [r7, #28]
 8006e4e:	429a      	cmp	r2, r3
 8006e50:	d062      	beq.n	8006f18 <vTaskPriorityDisinheritAfterTimeout+0x11c>
 8006e52:	69bb      	ldr	r3, [r7, #24]
 8006e54:	6cdb      	ldr	r3, [r3, #76]	; 0x4c
 8006e56:	697a      	ldr	r2, [r7, #20]
 8006e58:	429a      	cmp	r2, r3
 8006e5a:	d15d      	bne.n	8006f18 <vTaskPriorityDisinheritAfterTimeout+0x11c>
 8006e5c:	4b30      	ldr	r3, [pc, #192]	; (8006f20 <vTaskPriorityDisinheritAfterTimeout+0x124>)
 8006e5e:	681b      	ldr	r3, [r3, #0]
 8006e60:	69ba      	ldr	r2, [r7, #24]
 8006e62:	429a      	cmp	r2, r3
 8006e64:	d109      	bne.n	8006e7a <vTaskPriorityDisinheritAfterTimeout+0x7e>
 8006e66:	f04f 0350 	mov.w	r3, #80	; 0x50
 8006e6a:	f383 8811 	msr	BASEPRI, r3
 8006e6e:	f3bf 8f6f 	isb	sy
 8006e72:	f3bf 8f4f 	dsb	sy
 8006e76:	60bb      	str	r3, [r7, #8]
 8006e78:	e7fe      	b.n	8006e78 <vTaskPriorityDisinheritAfterTimeout+0x7c>
 8006e7a:	69bb      	ldr	r3, [r7, #24]
 8006e7c:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 8006e7e:	613b      	str	r3, [r7, #16]
 8006e80:	69bb      	ldr	r3, [r7, #24]
 8006e82:	69fa      	ldr	r2, [r7, #28]
 8006e84:	62da      	str	r2, [r3, #44]	; 0x2c
 8006e86:	69bb      	ldr	r3, [r7, #24]
 8006e88:	699b      	ldr	r3, [r3, #24]
 8006e8a:	2b00      	cmp	r3, #0
 8006e8c:	db04      	blt.n	8006e98 <vTaskPriorityDisinheritAfterTimeout+0x9c>
 8006e8e:	69fb      	ldr	r3, [r7, #28]
 8006e90:	f1c3 0205 	rsb	r2, r3, #5
 8006e94:	69bb      	ldr	r3, [r7, #24]
 8006e96:	619a      	str	r2, [r3, #24]
 8006e98:	69bb      	ldr	r3, [r7, #24]
 8006e9a:	6959      	ldr	r1, [r3, #20]
 8006e9c:	693a      	ldr	r2, [r7, #16]
 8006e9e:	4613      	mov	r3, r2
 8006ea0:	009b      	lsls	r3, r3, #2
 8006ea2:	4413      	add	r3, r2
 8006ea4:	009b      	lsls	r3, r3, #2
 8006ea6:	4a1f      	ldr	r2, [pc, #124]	; (8006f24 <vTaskPriorityDisinheritAfterTimeout+0x128>)
 8006ea8:	4413      	add	r3, r2
 8006eaa:	4299      	cmp	r1, r3
 8006eac:	d134      	bne.n	8006f18 <vTaskPriorityDisinheritAfterTimeout+0x11c>
 8006eae:	69bb      	ldr	r3, [r7, #24]
 8006eb0:	3304      	adds	r3, #4
 8006eb2:	4618      	mov	r0, r3
 8006eb4:	f7fe ffe8 	bl	8005e88 <uxListRemove>
 8006eb8:	4603      	mov	r3, r0
 8006eba:	2b00      	cmp	r3, #0
 8006ebc:	d115      	bne.n	8006eea <vTaskPriorityDisinheritAfterTimeout+0xee>
 8006ebe:	69bb      	ldr	r3, [r7, #24]
 8006ec0:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8006ec2:	4918      	ldr	r1, [pc, #96]	; (8006f24 <vTaskPriorityDisinheritAfterTimeout+0x128>)
 8006ec4:	4613      	mov	r3, r2
 8006ec6:	009b      	lsls	r3, r3, #2
 8006ec8:	4413      	add	r3, r2
 8006eca:	009b      	lsls	r3, r3, #2
 8006ecc:	440b      	add	r3, r1
 8006ece:	681b      	ldr	r3, [r3, #0]
 8006ed0:	2b00      	cmp	r3, #0
 8006ed2:	d10a      	bne.n	8006eea <vTaskPriorityDisinheritAfterTimeout+0xee>
 8006ed4:	69bb      	ldr	r3, [r7, #24]
 8006ed6:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 8006ed8:	2201      	movs	r2, #1
 8006eda:	fa02 f303 	lsl.w	r3, r2, r3
 8006ede:	43da      	mvns	r2, r3
 8006ee0:	4b11      	ldr	r3, [pc, #68]	; (8006f28 <vTaskPriorityDisinheritAfterTimeout+0x12c>)
 8006ee2:	681b      	ldr	r3, [r3, #0]
 8006ee4:	4013      	ands	r3, r2
 8006ee6:	4a10      	ldr	r2, [pc, #64]	; (8006f28 <vTaskPriorityDisinheritAfterTimeout+0x12c>)
 8006ee8:	6013      	str	r3, [r2, #0]
 8006eea:	69bb      	ldr	r3, [r7, #24]
 8006eec:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 8006eee:	2201      	movs	r2, #1
 8006ef0:	409a      	lsls	r2, r3
 8006ef2:	4b0d      	ldr	r3, [pc, #52]	; (8006f28 <vTaskPriorityDisinheritAfterTimeout+0x12c>)
 8006ef4:	681b      	ldr	r3, [r3, #0]
 8006ef6:	4313      	orrs	r3, r2
 8006ef8:	4a0b      	ldr	r2, [pc, #44]	; (8006f28 <vTaskPriorityDisinheritAfterTimeout+0x12c>)
 8006efa:	6013      	str	r3, [r2, #0]
 8006efc:	69bb      	ldr	r3, [r7, #24]
 8006efe:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8006f00:	4613      	mov	r3, r2
 8006f02:	009b      	lsls	r3, r3, #2
 8006f04:	4413      	add	r3, r2
 8006f06:	009b      	lsls	r3, r3, #2
 8006f08:	4a06      	ldr	r2, [pc, #24]	; (8006f24 <vTaskPriorityDisinheritAfterTimeout+0x128>)
 8006f0a:	441a      	add	r2, r3
 8006f0c:	69bb      	ldr	r3, [r7, #24]
 8006f0e:	3304      	adds	r3, #4
 8006f10:	4619      	mov	r1, r3
 8006f12:	4610      	mov	r0, r2
 8006f14:	f7fe ff5b 	bl	8005dce <vListInsertEnd>
 8006f18:	bf00      	nop
 8006f1a:	3720      	adds	r7, #32
 8006f1c:	46bd      	mov	sp, r7
 8006f1e:	bd80      	pop	{r7, pc}
 8006f20:	20000bc4 	.word	0x20000bc4
 8006f24:	20000bc8 	.word	0x20000bc8
 8006f28:	20000ca4 	.word	0x20000ca4

08006f2c <pvTaskIncrementMutexHeldCount>:
 8006f2c:	b480      	push	{r7}
 8006f2e:	af00      	add	r7, sp, #0
 8006f30:	4b07      	ldr	r3, [pc, #28]	; (8006f50 <pvTaskIncrementMutexHeldCount+0x24>)
 8006f32:	681b      	ldr	r3, [r3, #0]
 8006f34:	2b00      	cmp	r3, #0
 8006f36:	d004      	beq.n	8006f42 <pvTaskIncrementMutexHeldCount+0x16>
 8006f38:	4b05      	ldr	r3, [pc, #20]	; (8006f50 <pvTaskIncrementMutexHeldCount+0x24>)
 8006f3a:	681b      	ldr	r3, [r3, #0]
 8006f3c:	6cda      	ldr	r2, [r3, #76]	; 0x4c
 8006f3e:	3201      	adds	r2, #1
 8006f40:	64da      	str	r2, [r3, #76]	; 0x4c
 8006f42:	4b03      	ldr	r3, [pc, #12]	; (8006f50 <pvTaskIncrementMutexHeldCount+0x24>)
 8006f44:	681b      	ldr	r3, [r3, #0]
 8006f46:	4618      	mov	r0, r3
 8006f48:	46bd      	mov	sp, r7
 8006f4a:	f85d 7b04 	ldr.w	r7, [sp], #4
 8006f4e:	4770      	bx	lr
 8006f50:	20000bc4 	.word	0x20000bc4

08006f54 <ulTaskNotifyTake>:
 8006f54:	b580      	push	{r7, lr}
 8006f56:	b084      	sub	sp, #16
 8006f58:	af00      	add	r7, sp, #0
 8006f5a:	6078      	str	r0, [r7, #4]
 8006f5c:	6039      	str	r1, [r7, #0]
 8006f5e:	f000 fe0d 	bl	8007b7c <vPortEnterCritical>
 8006f62:	4b20      	ldr	r3, [pc, #128]	; (8006fe4 <ulTaskNotifyTake+0x90>)
 8006f64:	681b      	ldr	r3, [r3, #0]
 8006f66:	f8d3 3478 	ldr.w	r3, [r3, #1144]	; 0x478
 8006f6a:	2b00      	cmp	r3, #0
 8006f6c:	d113      	bne.n	8006f96 <ulTaskNotifyTake+0x42>
 8006f6e:	4b1d      	ldr	r3, [pc, #116]	; (8006fe4 <ulTaskNotifyTake+0x90>)
 8006f70:	681b      	ldr	r3, [r3, #0]
 8006f72:	2201      	movs	r2, #1
 8006f74:	f883 247c 	strb.w	r2, [r3, #1148]	; 0x47c
 8006f78:	683b      	ldr	r3, [r7, #0]
 8006f7a:	2b00      	cmp	r3, #0
 8006f7c:	d00b      	beq.n	8006f96 <ulTaskNotifyTake+0x42>
 8006f7e:	2101      	movs	r1, #1
 8006f80:	6838      	ldr	r0, [r7, #0]
 8006f82:	f000 f97f 	bl	8007284 <prvAddCurrentTaskToDelayedList>
 8006f86:	4b18      	ldr	r3, [pc, #96]	; (8006fe8 <ulTaskNotifyTake+0x94>)
 8006f88:	f04f 5280 	mov.w	r2, #268435456	; 0x10000000
 8006f8c:	601a      	str	r2, [r3, #0]
 8006f8e:	f3bf 8f4f 	dsb	sy
 8006f92:	f3bf 8f6f 	isb	sy
 8006f96:	f000 fe1f 	bl	8007bd8 <vPortExitCritical>
 8006f9a:	f000 fdef 	bl	8007b7c <vPortEnterCritical>
 8006f9e:	4b11      	ldr	r3, [pc, #68]	; (8006fe4 <ulTaskNotifyTake+0x90>)
 8006fa0:	681b      	ldr	r3, [r3, #0]
 8006fa2:	f8d3 3478 	ldr.w	r3, [r3, #1144]	; 0x478
 8006fa6:	60fb      	str	r3, [r7, #12]
 8006fa8:	68fb      	ldr	r3, [r7, #12]
 8006faa:	2b00      	cmp	r3, #0
 8006fac:	d00e      	beq.n	8006fcc <ulTaskNotifyTake+0x78>
 8006fae:	687b      	ldr	r3, [r7, #4]
 8006fb0:	2b00      	cmp	r3, #0
 8006fb2:	d005      	beq.n	8006fc0 <ulTaskNotifyTake+0x6c>
 8006fb4:	4b0b      	ldr	r3, [pc, #44]	; (8006fe4 <ulTaskNotifyTake+0x90>)
 8006fb6:	681b      	ldr	r3, [r3, #0]
 8006fb8:	2200      	movs	r2, #0
 8006fba:	f8c3 2478 	str.w	r2, [r3, #1144]	; 0x478
 8006fbe:	e005      	b.n	8006fcc <ulTaskNotifyTake+0x78>
 8006fc0:	4b08      	ldr	r3, [pc, #32]	; (8006fe4 <ulTaskNotifyTake+0x90>)
 8006fc2:	681b      	ldr	r3, [r3, #0]
 8006fc4:	68fa      	ldr	r2, [r7, #12]
 8006fc6:	3a01      	subs	r2, #1
 8006fc8:	f8c3 2478 	str.w	r2, [r3, #1144]	; 0x478
 8006fcc:	4b05      	ldr	r3, [pc, #20]	; (8006fe4 <ulTaskNotifyTake+0x90>)
 8006fce:	681b      	ldr	r3, [r3, #0]
 8006fd0:	2200      	movs	r2, #0
 8006fd2:	f883 247c 	strb.w	r2, [r3, #1148]	; 0x47c
 8006fd6:	f000 fdff 	bl	8007bd8 <vPortExitCritical>
 8006fda:	68fb      	ldr	r3, [r7, #12]
 8006fdc:	4618      	mov	r0, r3
 8006fde:	3710      	adds	r7, #16
 8006fe0:	46bd      	mov	sp, r7
 8006fe2:	bd80      	pop	{r7, pc}
 8006fe4:	20000bc4 	.word	0x20000bc4
 8006fe8:	e000ed04 	.word	0xe000ed04

08006fec <xTaskGenericNotify>:
 8006fec:	b580      	push	{r7, lr}
 8006fee:	b08a      	sub	sp, #40	; 0x28
 8006ff0:	af00      	add	r7, sp, #0
 8006ff2:	60f8      	str	r0, [r7, #12]
 8006ff4:	60b9      	str	r1, [r7, #8]
 8006ff6:	603b      	str	r3, [r7, #0]
 8006ff8:	4613      	mov	r3, r2
 8006ffa:	71fb      	strb	r3, [r7, #7]
 8006ffc:	2301      	movs	r3, #1
 8006ffe:	627b      	str	r3, [r7, #36]	; 0x24
 8007000:	68fb      	ldr	r3, [r7, #12]
 8007002:	2b00      	cmp	r3, #0
 8007004:	d109      	bne.n	800701a <xTaskGenericNotify+0x2e>
 8007006:	f04f 0350 	mov.w	r3, #80	; 0x50
 800700a:	f383 8811 	msr	BASEPRI, r3
 800700e:	f3bf 8f6f 	isb	sy
 8007012:	f3bf 8f4f 	dsb	sy
 8007016:	61bb      	str	r3, [r7, #24]
 8007018:	e7fe      	b.n	8007018 <xTaskGenericNotify+0x2c>
 800701a:	68fb      	ldr	r3, [r7, #12]
 800701c:	623b      	str	r3, [r7, #32]
 800701e:	f000 fdad 	bl	8007b7c <vPortEnterCritical>
 8007022:	683b      	ldr	r3, [r7, #0]
 8007024:	2b00      	cmp	r3, #0
 8007026:	d004      	beq.n	8007032 <xTaskGenericNotify+0x46>
 8007028:	6a3b      	ldr	r3, [r7, #32]
 800702a:	f8d3 2478 	ldr.w	r2, [r3, #1144]	; 0x478
 800702e:	683b      	ldr	r3, [r7, #0]
 8007030:	601a      	str	r2, [r3, #0]
 8007032:	6a3b      	ldr	r3, [r7, #32]
 8007034:	f893 347c 	ldrb.w	r3, [r3, #1148]	; 0x47c
 8007038:	77fb      	strb	r3, [r7, #31]
 800703a:	6a3b      	ldr	r3, [r7, #32]
 800703c:	2202      	movs	r2, #2
 800703e:	f883 247c 	strb.w	r2, [r3, #1148]	; 0x47c
 8007042:	79fb      	ldrb	r3, [r7, #7]
 8007044:	2b04      	cmp	r3, #4
 8007046:	d82e      	bhi.n	80070a6 <xTaskGenericNotify+0xba>
 8007048:	a201      	add	r2, pc, #4	; (adr r2, 8007050 <xTaskGenericNotify+0x64>)
 800704a:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
 800704e:	bf00      	nop
 8007050:	080070c7 	.word	0x080070c7
 8007054:	08007065 	.word	0x08007065
 8007058:	08007077 	.word	0x08007077
 800705c:	08007087 	.word	0x08007087
 8007060:	08007091 	.word	0x08007091
 8007064:	6a3b      	ldr	r3, [r7, #32]
 8007066:	f8d3 2478 	ldr.w	r2, [r3, #1144]	; 0x478
 800706a:	68bb      	ldr	r3, [r7, #8]
 800706c:	431a      	orrs	r2, r3
 800706e:	6a3b      	ldr	r3, [r7, #32]
 8007070:	f8c3 2478 	str.w	r2, [r3, #1144]	; 0x478
 8007074:	e02a      	b.n	80070cc <xTaskGenericNotify+0xe0>
 8007076:	6a3b      	ldr	r3, [r7, #32]
 8007078:	f8d3 3478 	ldr.w	r3, [r3, #1144]	; 0x478
 800707c:	1c5a      	adds	r2, r3, #1
 800707e:	6a3b      	ldr	r3, [r7, #32]
 8007080:	f8c3 2478 	str.w	r2, [r3, #1144]	; 0x478
 8007084:	e022      	b.n	80070cc <xTaskGenericNotify+0xe0>
 8007086:	6a3b      	ldr	r3, [r7, #32]
 8007088:	68ba      	ldr	r2, [r7, #8]
 800708a:	f8c3 2478 	str.w	r2, [r3, #1144]	; 0x478
 800708e:	e01d      	b.n	80070cc <xTaskGenericNotify+0xe0>
 8007090:	7ffb      	ldrb	r3, [r7, #31]
 8007092:	2b02      	cmp	r3, #2
 8007094:	d004      	beq.n	80070a0 <xTaskGenericNotify+0xb4>
 8007096:	6a3b      	ldr	r3, [r7, #32]
 8007098:	68ba      	ldr	r2, [r7, #8]
 800709a:	f8c3 2478 	str.w	r2, [r3, #1144]	; 0x478
 800709e:	e015      	b.n	80070cc <xTaskGenericNotify+0xe0>
 80070a0:	2300      	movs	r3, #0
 80070a2:	627b      	str	r3, [r7, #36]	; 0x24
 80070a4:	e012      	b.n	80070cc <xTaskGenericNotify+0xe0>
 80070a6:	6a3b      	ldr	r3, [r7, #32]
 80070a8:	f8d3 3478 	ldr.w	r3, [r3, #1144]	; 0x478
 80070ac:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
 80070b0:	d00b      	beq.n	80070ca <xTaskGenericNotify+0xde>
 80070b2:	f04f 0350 	mov.w	r3, #80	; 0x50
 80070b6:	f383 8811 	msr	BASEPRI, r3
 80070ba:	f3bf 8f6f 	isb	sy
 80070be:	f3bf 8f4f 	dsb	sy
 80070c2:	617b      	str	r3, [r7, #20]
 80070c4:	e7fe      	b.n	80070c4 <xTaskGenericNotify+0xd8>
 80070c6:	bf00      	nop
 80070c8:	e000      	b.n	80070cc <xTaskGenericNotify+0xe0>
 80070ca:	bf00      	nop
 80070cc:	7ffb      	ldrb	r3, [r7, #31]
 80070ce:	2b01      	cmp	r3, #1
 80070d0:	d138      	bne.n	8007144 <xTaskGenericNotify+0x158>
 80070d2:	6a3b      	ldr	r3, [r7, #32]
 80070d4:	3304      	adds	r3, #4
 80070d6:	4618      	mov	r0, r3
 80070d8:	f7fe fed6 	bl	8005e88 <uxListRemove>
 80070dc:	6a3b      	ldr	r3, [r7, #32]
 80070de:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 80070e0:	2201      	movs	r2, #1
 80070e2:	409a      	lsls	r2, r3
 80070e4:	4b1b      	ldr	r3, [pc, #108]	; (8007154 <xTaskGenericNotify+0x168>)
 80070e6:	681b      	ldr	r3, [r3, #0]
 80070e8:	4313      	orrs	r3, r2
 80070ea:	4a1a      	ldr	r2, [pc, #104]	; (8007154 <xTaskGenericNotify+0x168>)
 80070ec:	6013      	str	r3, [r2, #0]
 80070ee:	6a3b      	ldr	r3, [r7, #32]
 80070f0:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 80070f2:	4613      	mov	r3, r2
 80070f4:	009b      	lsls	r3, r3, #2
 80070f6:	4413      	add	r3, r2
 80070f8:	009b      	lsls	r3, r3, #2
 80070fa:	4a17      	ldr	r2, [pc, #92]	; (8007158 <xTaskGenericNotify+0x16c>)
 80070fc:	441a      	add	r2, r3
 80070fe:	6a3b      	ldr	r3, [r7, #32]
 8007100:	3304      	adds	r3, #4
 8007102:	4619      	mov	r1, r3
 8007104:	4610      	mov	r0, r2
 8007106:	f7fe fe62 	bl	8005dce <vListInsertEnd>
 800710a:	6a3b      	ldr	r3, [r7, #32]
 800710c:	6a9b      	ldr	r3, [r3, #40]	; 0x28
 800710e:	2b00      	cmp	r3, #0
 8007110:	d009      	beq.n	8007126 <xTaskGenericNotify+0x13a>
 8007112:	f04f 0350 	mov.w	r3, #80	; 0x50
 8007116:	f383 8811 	msr	BASEPRI, r3
 800711a:	f3bf 8f6f 	isb	sy
 800711e:	f3bf 8f4f 	dsb	sy
 8007122:	613b      	str	r3, [r7, #16]
 8007124:	e7fe      	b.n	8007124 <xTaskGenericNotify+0x138>
 8007126:	6a3b      	ldr	r3, [r7, #32]
 8007128:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 800712a:	4b0c      	ldr	r3, [pc, #48]	; (800715c <xTaskGenericNotify+0x170>)
 800712c:	681b      	ldr	r3, [r3, #0]
 800712e:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 8007130:	429a      	cmp	r2, r3
 8007132:	d907      	bls.n	8007144 <xTaskGenericNotify+0x158>
 8007134:	4b0a      	ldr	r3, [pc, #40]	; (8007160 <xTaskGenericNotify+0x174>)
 8007136:	f04f 5280 	mov.w	r2, #268435456	; 0x10000000
 800713a:	601a      	str	r2, [r3, #0]
 800713c:	f3bf 8f4f 	dsb	sy
 8007140:	f3bf 8f6f 	isb	sy
 8007144:	f000 fd48 	bl	8007bd8 <vPortExitCritical>
 8007148:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 800714a:	4618      	mov	r0, r3
 800714c:	3728      	adds	r7, #40	; 0x28
 800714e:	46bd      	mov	sp, r7
 8007150:	bd80      	pop	{r7, pc}
 8007152:	bf00      	nop
 8007154:	20000ca4 	.word	0x20000ca4
 8007158:	20000bc8 	.word	0x20000bc8
 800715c:	20000bc4 	.word	0x20000bc4
 8007160:	e000ed04 	.word	0xe000ed04

08007164 <vTaskNotifyGiveFromISR>:
 8007164:	b580      	push	{r7, lr}
 8007166:	b08a      	sub	sp, #40	; 0x28
 8007168:	af00      	add	r7, sp, #0
 800716a:	6078      	str	r0, [r7, #4]
 800716c:	6039      	str	r1, [r7, #0]
 800716e:	687b      	ldr	r3, [r7, #4]
 8007170:	2b00      	cmp	r3, #0
 8007172:	d109      	bne.n	8007188 <vTaskNotifyGiveFromISR+0x24>
 8007174:	f04f 0350 	mov.w	r3, #80	; 0x50
 8007178:	f383 8811 	msr	BASEPRI, r3
 800717c:	f3bf 8f6f 	isb	sy
 8007180:	f3bf 8f4f 	dsb	sy
 8007184:	61bb      	str	r3, [r7, #24]
 8007186:	e7fe      	b.n	8007186 <vTaskNotifyGiveFromISR+0x22>
 8007188:	f000 fdd4 	bl	8007d34 <vPortValidateInterruptPriority>
 800718c:	687b      	ldr	r3, [r7, #4]
 800718e:	627b      	str	r3, [r7, #36]	; 0x24
 8007190:	f3ef 8211 	mrs	r2, BASEPRI
 8007194:	f04f 0350 	mov.w	r3, #80	; 0x50
 8007198:	f383 8811 	msr	BASEPRI, r3
 800719c:	f3bf 8f6f 	isb	sy
 80071a0:	f3bf 8f4f 	dsb	sy
 80071a4:	617a      	str	r2, [r7, #20]
 80071a6:	613b      	str	r3, [r7, #16]
 80071a8:	697b      	ldr	r3, [r7, #20]
 80071aa:	623b      	str	r3, [r7, #32]
 80071ac:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 80071ae:	f893 347c 	ldrb.w	r3, [r3, #1148]	; 0x47c
 80071b2:	77fb      	strb	r3, [r7, #31]
 80071b4:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 80071b6:	2202      	movs	r2, #2
 80071b8:	f883 247c 	strb.w	r2, [r3, #1148]	; 0x47c
 80071bc:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 80071be:	f8d3 3478 	ldr.w	r3, [r3, #1144]	; 0x478
 80071c2:	1c5a      	adds	r2, r3, #1
 80071c4:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 80071c6:	f8c3 2478 	str.w	r2, [r3, #1144]	; 0x478
 80071ca:	7ffb      	ldrb	r3, [r7, #31]
 80071cc:	2b01      	cmp	r3, #1
 80071ce:	d144      	bne.n	800725a <vTaskNotifyGiveFromISR+0xf6>
 80071d0:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 80071d2:	6a9b      	ldr	r3, [r3, #40]	; 0x28
 80071d4:	2b00      	cmp	r3, #0
 80071d6:	d009      	beq.n	80071ec <vTaskNotifyGiveFromISR+0x88>
 80071d8:	f04f 0350 	mov.w	r3, #80	; 0x50
 80071dc:	f383 8811 	msr	BASEPRI, r3
 80071e0:	f3bf 8f6f 	isb	sy
 80071e4:	f3bf 8f4f 	dsb	sy
 80071e8:	60fb      	str	r3, [r7, #12]
 80071ea:	e7fe      	b.n	80071ea <vTaskNotifyGiveFromISR+0x86>
 80071ec:	4b1f      	ldr	r3, [pc, #124]	; (800726c <vTaskNotifyGiveFromISR+0x108>)
 80071ee:	681b      	ldr	r3, [r3, #0]
 80071f0:	2b00      	cmp	r3, #0
 80071f2:	d11c      	bne.n	800722e <vTaskNotifyGiveFromISR+0xca>
 80071f4:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 80071f6:	3304      	adds	r3, #4
 80071f8:	4618      	mov	r0, r3
 80071fa:	f7fe fe45 	bl	8005e88 <uxListRemove>
 80071fe:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8007200:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 8007202:	2201      	movs	r2, #1
 8007204:	409a      	lsls	r2, r3
 8007206:	4b1a      	ldr	r3, [pc, #104]	; (8007270 <vTaskNotifyGiveFromISR+0x10c>)
 8007208:	681b      	ldr	r3, [r3, #0]
 800720a:	4313      	orrs	r3, r2
 800720c:	4a18      	ldr	r2, [pc, #96]	; (8007270 <vTaskNotifyGiveFromISR+0x10c>)
 800720e:	6013      	str	r3, [r2, #0]
 8007210:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8007212:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8007214:	4613      	mov	r3, r2
 8007216:	009b      	lsls	r3, r3, #2
 8007218:	4413      	add	r3, r2
 800721a:	009b      	lsls	r3, r3, #2
 800721c:	4a15      	ldr	r2, [pc, #84]	; (8007274 <vTaskNotifyGiveFromISR+0x110>)
 800721e:	441a      	add	r2, r3
 8007220:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8007222:	3304      	adds	r3, #4
 8007224:	4619      	mov	r1, r3
 8007226:	4610      	mov	r0, r2
 8007228:	f7fe fdd1 	bl	8005dce <vListInsertEnd>
 800722c:	e005      	b.n	800723a <vTaskNotifyGiveFromISR+0xd6>
 800722e:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8007230:	3318      	adds	r3, #24
 8007232:	4619      	mov	r1, r3
 8007234:	4810      	ldr	r0, [pc, #64]	; (8007278 <vTaskNotifyGiveFromISR+0x114>)
 8007236:	f7fe fdca 	bl	8005dce <vListInsertEnd>
 800723a:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 800723c:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 800723e:	4b0f      	ldr	r3, [pc, #60]	; (800727c <vTaskNotifyGiveFromISR+0x118>)
 8007240:	681b      	ldr	r3, [r3, #0]
 8007242:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 8007244:	429a      	cmp	r2, r3
 8007246:	d908      	bls.n	800725a <vTaskNotifyGiveFromISR+0xf6>
 8007248:	683b      	ldr	r3, [r7, #0]
 800724a:	2b00      	cmp	r3, #0
 800724c:	d002      	beq.n	8007254 <vTaskNotifyGiveFromISR+0xf0>
 800724e:	683b      	ldr	r3, [r7, #0]
 8007250:	2201      	movs	r2, #1
 8007252:	601a      	str	r2, [r3, #0]
 8007254:	4b0a      	ldr	r3, [pc, #40]	; (8007280 <vTaskNotifyGiveFromISR+0x11c>)
 8007256:	2201      	movs	r2, #1
 8007258:	601a      	str	r2, [r3, #0]
 800725a:	6a3b      	ldr	r3, [r7, #32]
 800725c:	60bb      	str	r3, [r7, #8]
 800725e:	68bb      	ldr	r3, [r7, #8]
 8007260:	f383 8811 	msr	BASEPRI, r3
 8007264:	bf00      	nop
 8007266:	3728      	adds	r7, #40	; 0x28
 8007268:	46bd      	mov	sp, r7
 800726a:	bd80      	pop	{r7, pc}
 800726c:	20000cc4 	.word	0x20000cc4
 8007270:	20000ca4 	.word	0x20000ca4
 8007274:	20000bc8 	.word	0x20000bc8
 8007278:	20000c5c 	.word	0x20000c5c
 800727c:	20000bc4 	.word	0x20000bc4
 8007280:	20000cb0 	.word	0x20000cb0

08007284 <prvAddCurrentTaskToDelayedList>:
 8007284:	b580      	push	{r7, lr}
 8007286:	b084      	sub	sp, #16
 8007288:	af00      	add	r7, sp, #0
 800728a:	6078      	str	r0, [r7, #4]
 800728c:	6039      	str	r1, [r7, #0]
 800728e:	4b29      	ldr	r3, [pc, #164]	; (8007334 <prvAddCurrentTaskToDelayedList+0xb0>)
 8007290:	681b      	ldr	r3, [r3, #0]
 8007292:	60fb      	str	r3, [r7, #12]
 8007294:	4b28      	ldr	r3, [pc, #160]	; (8007338 <prvAddCurrentTaskToDelayedList+0xb4>)
 8007296:	681b      	ldr	r3, [r3, #0]
 8007298:	3304      	adds	r3, #4
 800729a:	4618      	mov	r0, r3
 800729c:	f7fe fdf4 	bl	8005e88 <uxListRemove>
 80072a0:	4603      	mov	r3, r0
 80072a2:	2b00      	cmp	r3, #0
 80072a4:	d10b      	bne.n	80072be <prvAddCurrentTaskToDelayedList+0x3a>
 80072a6:	4b24      	ldr	r3, [pc, #144]	; (8007338 <prvAddCurrentTaskToDelayedList+0xb4>)
 80072a8:	681b      	ldr	r3, [r3, #0]
 80072aa:	6adb      	ldr	r3, [r3, #44]	; 0x2c
 80072ac:	2201      	movs	r2, #1
 80072ae:	fa02 f303 	lsl.w	r3, r2, r3
 80072b2:	43da      	mvns	r2, r3
 80072b4:	4b21      	ldr	r3, [pc, #132]	; (800733c <prvAddCurrentTaskToDelayedList+0xb8>)
 80072b6:	681b      	ldr	r3, [r3, #0]
 80072b8:	4013      	ands	r3, r2
 80072ba:	4a20      	ldr	r2, [pc, #128]	; (800733c <prvAddCurrentTaskToDelayedList+0xb8>)
 80072bc:	6013      	str	r3, [r2, #0]
 80072be:	687b      	ldr	r3, [r7, #4]
 80072c0:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
 80072c4:	d10a      	bne.n	80072dc <prvAddCurrentTaskToDelayedList+0x58>
 80072c6:	683b      	ldr	r3, [r7, #0]
 80072c8:	2b00      	cmp	r3, #0
 80072ca:	d007      	beq.n	80072dc <prvAddCurrentTaskToDelayedList+0x58>
 80072cc:	4b1a      	ldr	r3, [pc, #104]	; (8007338 <prvAddCurrentTaskToDelayedList+0xb4>)
 80072ce:	681b      	ldr	r3, [r3, #0]
 80072d0:	3304      	adds	r3, #4
 80072d2:	4619      	mov	r1, r3
 80072d4:	481a      	ldr	r0, [pc, #104]	; (8007340 <prvAddCurrentTaskToDelayedList+0xbc>)
 80072d6:	f7fe fd7a 	bl	8005dce <vListInsertEnd>
 80072da:	e026      	b.n	800732a <prvAddCurrentTaskToDelayedList+0xa6>
 80072dc:	68fa      	ldr	r2, [r7, #12]
 80072de:	687b      	ldr	r3, [r7, #4]
 80072e0:	4413      	add	r3, r2
 80072e2:	60bb      	str	r3, [r7, #8]
 80072e4:	4b14      	ldr	r3, [pc, #80]	; (8007338 <prvAddCurrentTaskToDelayedList+0xb4>)
 80072e6:	681b      	ldr	r3, [r3, #0]
 80072e8:	68ba      	ldr	r2, [r7, #8]
 80072ea:	605a      	str	r2, [r3, #4]
 80072ec:	68ba      	ldr	r2, [r7, #8]
 80072ee:	68fb      	ldr	r3, [r7, #12]
 80072f0:	429a      	cmp	r2, r3
 80072f2:	d209      	bcs.n	8007308 <prvAddCurrentTaskToDelayedList+0x84>
 80072f4:	4b13      	ldr	r3, [pc, #76]	; (8007344 <prvAddCurrentTaskToDelayedList+0xc0>)
 80072f6:	681a      	ldr	r2, [r3, #0]
 80072f8:	4b0f      	ldr	r3, [pc, #60]	; (8007338 <prvAddCurrentTaskToDelayedList+0xb4>)
 80072fa:	681b      	ldr	r3, [r3, #0]
 80072fc:	3304      	adds	r3, #4
 80072fe:	4619      	mov	r1, r3
 8007300:	4610      	mov	r0, r2
 8007302:	f7fe fd88 	bl	8005e16 <vListInsert>
 8007306:	e010      	b.n	800732a <prvAddCurrentTaskToDelayedList+0xa6>
 8007308:	4b0f      	ldr	r3, [pc, #60]	; (8007348 <prvAddCurrentTaskToDelayedList+0xc4>)
 800730a:	681a      	ldr	r2, [r3, #0]
 800730c:	4b0a      	ldr	r3, [pc, #40]	; (8007338 <prvAddCurrentTaskToDelayedList+0xb4>)
 800730e:	681b      	ldr	r3, [r3, #0]
 8007310:	3304      	adds	r3, #4
 8007312:	4619      	mov	r1, r3
 8007314:	4610      	mov	r0, r2
 8007316:	f7fe fd7e 	bl	8005e16 <vListInsert>
 800731a:	4b0c      	ldr	r3, [pc, #48]	; (800734c <prvAddCurrentTaskToDelayedList+0xc8>)
 800731c:	681b      	ldr	r3, [r3, #0]
 800731e:	68ba      	ldr	r2, [r7, #8]
 8007320:	429a      	cmp	r2, r3
 8007322:	d202      	bcs.n	800732a <prvAddCurrentTaskToDelayedList+0xa6>
 8007324:	4a09      	ldr	r2, [pc, #36]	; (800734c <prvAddCurrentTaskToDelayedList+0xc8>)
 8007326:	68bb      	ldr	r3, [r7, #8]
 8007328:	6013      	str	r3, [r2, #0]
 800732a:	bf00      	nop
 800732c:	3710      	adds	r7, #16
 800732e:	46bd      	mov	sp, r7
 8007330:	bd80      	pop	{r7, pc}
 8007332:	bf00      	nop
 8007334:	20000ca0 	.word	0x20000ca0
 8007338:	20000bc4 	.word	0x20000bc4
 800733c:	20000ca4 	.word	0x20000ca4
 8007340:	20000c88 	.word	0x20000c88
 8007344:	20000c58 	.word	0x20000c58
 8007348:	20000c54 	.word	0x20000c54
 800734c:	20000cbc 	.word	0x20000cbc

08007350 <xTimerCreateTimerTask>:
 8007350:	b580      	push	{r7, lr}
 8007352:	b08a      	sub	sp, #40	; 0x28
 8007354:	af04      	add	r7, sp, #16
 8007356:	2300      	movs	r3, #0
 8007358:	617b      	str	r3, [r7, #20]
 800735a:	f000 faa9 	bl	80078b0 <prvCheckForValidListAndQueue>
 800735e:	4b1c      	ldr	r3, [pc, #112]	; (80073d0 <xTimerCreateTimerTask+0x80>)
 8007360:	681b      	ldr	r3, [r3, #0]
 8007362:	2b00      	cmp	r3, #0
 8007364:	d021      	beq.n	80073aa <xTimerCreateTimerTask+0x5a>
 8007366:	2300      	movs	r3, #0
 8007368:	60fb      	str	r3, [r7, #12]
 800736a:	2300      	movs	r3, #0
 800736c:	60bb      	str	r3, [r7, #8]
 800736e:	1d3a      	adds	r2, r7, #4
 8007370:	f107 0108 	add.w	r1, r7, #8
 8007374:	f107 030c 	add.w	r3, r7, #12
 8007378:	4618      	mov	r0, r3
 800737a:	f7fc f839 	bl	80033f0 <vApplicationGetTimerTaskMemory>
 800737e:	6879      	ldr	r1, [r7, #4]
 8007380:	68bb      	ldr	r3, [r7, #8]
 8007382:	68fa      	ldr	r2, [r7, #12]
 8007384:	9202      	str	r2, [sp, #8]
 8007386:	9301      	str	r3, [sp, #4]
 8007388:	2302      	movs	r3, #2
 800738a:	9300      	str	r3, [sp, #0]
 800738c:	2300      	movs	r3, #0
 800738e:	460a      	mov	r2, r1
 8007390:	4910      	ldr	r1, [pc, #64]	; (80073d4 <xTimerCreateTimerTask+0x84>)
 8007392:	4811      	ldr	r0, [pc, #68]	; (80073d8 <xTimerCreateTimerTask+0x88>)
 8007394:	f7fe fda2 	bl	8005edc <xTaskCreateStatic>
 8007398:	4602      	mov	r2, r0
 800739a:	4b10      	ldr	r3, [pc, #64]	; (80073dc <xTimerCreateTimerTask+0x8c>)
 800739c:	601a      	str	r2, [r3, #0]
 800739e:	4b0f      	ldr	r3, [pc, #60]	; (80073dc <xTimerCreateTimerTask+0x8c>)
 80073a0:	681b      	ldr	r3, [r3, #0]
 80073a2:	2b00      	cmp	r3, #0
 80073a4:	d001      	beq.n	80073aa <xTimerCreateTimerTask+0x5a>
 80073a6:	2301      	movs	r3, #1
 80073a8:	617b      	str	r3, [r7, #20]
 80073aa:	697b      	ldr	r3, [r7, #20]
 80073ac:	2b00      	cmp	r3, #0
 80073ae:	d109      	bne.n	80073c4 <xTimerCreateTimerTask+0x74>
 80073b0:	f04f 0350 	mov.w	r3, #80	; 0x50
 80073b4:	f383 8811 	msr	BASEPRI, r3
 80073b8:	f3bf 8f6f 	isb	sy
 80073bc:	f3bf 8f4f 	dsb	sy
 80073c0:	613b      	str	r3, [r7, #16]
 80073c2:	e7fe      	b.n	80073c2 <xTimerCreateTimerTask+0x72>
 80073c4:	697b      	ldr	r3, [r7, #20]
 80073c6:	4618      	mov	r0, r3
 80073c8:	3718      	adds	r7, #24
 80073ca:	46bd      	mov	sp, r7
 80073cc:	bd80      	pop	{r7, pc}
 80073ce:	bf00      	nop
 80073d0:	20000cf8 	.word	0x20000cf8
 80073d4:	0800b2e0 	.word	0x0800b2e0
 80073d8:	080074f9 	.word	0x080074f9
 80073dc:	20000cfc 	.word	0x20000cfc

080073e0 <xTimerGenericCommand>:
 80073e0:	b580      	push	{r7, lr}
 80073e2:	b08a      	sub	sp, #40	; 0x28
 80073e4:	af00      	add	r7, sp, #0
 80073e6:	60f8      	str	r0, [r7, #12]
 80073e8:	60b9      	str	r1, [r7, #8]
 80073ea:	607a      	str	r2, [r7, #4]
 80073ec:	603b      	str	r3, [r7, #0]
 80073ee:	2300      	movs	r3, #0
 80073f0:	627b      	str	r3, [r7, #36]	; 0x24
 80073f2:	68fb      	ldr	r3, [r7, #12]
 80073f4:	2b00      	cmp	r3, #0
 80073f6:	d109      	bne.n	800740c <xTimerGenericCommand+0x2c>
 80073f8:	f04f 0350 	mov.w	r3, #80	; 0x50
 80073fc:	f383 8811 	msr	BASEPRI, r3
 8007400:	f3bf 8f6f 	isb	sy
 8007404:	f3bf 8f4f 	dsb	sy
 8007408:	623b      	str	r3, [r7, #32]
 800740a:	e7fe      	b.n	800740a <xTimerGenericCommand+0x2a>
 800740c:	4b19      	ldr	r3, [pc, #100]	; (8007474 <xTimerGenericCommand+0x94>)
 800740e:	681b      	ldr	r3, [r3, #0]
 8007410:	2b00      	cmp	r3, #0
 8007412:	d02a      	beq.n	800746a <xTimerGenericCommand+0x8a>
 8007414:	68bb      	ldr	r3, [r7, #8]
 8007416:	617b      	str	r3, [r7, #20]
 8007418:	687b      	ldr	r3, [r7, #4]
 800741a:	61bb      	str	r3, [r7, #24]
 800741c:	68fb      	ldr	r3, [r7, #12]
 800741e:	61fb      	str	r3, [r7, #28]
 8007420:	68bb      	ldr	r3, [r7, #8]
 8007422:	2b05      	cmp	r3, #5
 8007424:	dc18      	bgt.n	8007458 <xTimerGenericCommand+0x78>
 8007426:	f7ff fbc7 	bl	8006bb8 <xTaskGetSchedulerState>
 800742a:	4603      	mov	r3, r0
 800742c:	2b02      	cmp	r3, #2
 800742e:	d109      	bne.n	8007444 <xTimerGenericCommand+0x64>
 8007430:	4b10      	ldr	r3, [pc, #64]	; (8007474 <xTimerGenericCommand+0x94>)
 8007432:	6818      	ldr	r0, [r3, #0]
 8007434:	f107 0114 	add.w	r1, r7, #20
 8007438:	2300      	movs	r3, #0
 800743a:	6b3a      	ldr	r2, [r7, #48]	; 0x30
 800743c:	f7fd ffa4 	bl	8005388 <xQueueGenericSend>
 8007440:	6278      	str	r0, [r7, #36]	; 0x24
 8007442:	e012      	b.n	800746a <xTimerGenericCommand+0x8a>
 8007444:	4b0b      	ldr	r3, [pc, #44]	; (8007474 <xTimerGenericCommand+0x94>)
 8007446:	6818      	ldr	r0, [r3, #0]
 8007448:	f107 0114 	add.w	r1, r7, #20
 800744c:	2300      	movs	r3, #0
 800744e:	2200      	movs	r2, #0
 8007450:	f7fd ff9a 	bl	8005388 <xQueueGenericSend>
 8007454:	6278      	str	r0, [r7, #36]	; 0x24
 8007456:	e008      	b.n	800746a <xTimerGenericCommand+0x8a>
 8007458:	4b06      	ldr	r3, [pc, #24]	; (8007474 <xTimerGenericCommand+0x94>)
 800745a:	6818      	ldr	r0, [r3, #0]
 800745c:	f107 0114 	add.w	r1, r7, #20
 8007460:	2300      	movs	r3, #0
 8007462:	683a      	ldr	r2, [r7, #0]
 8007464:	f7fe f88a 	bl	800557c <xQueueGenericSendFromISR>
 8007468:	6278      	str	r0, [r7, #36]	; 0x24
 800746a:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 800746c:	4618      	mov	r0, r3
 800746e:	3728      	adds	r7, #40	; 0x28
 8007470:	46bd      	mov	sp, r7
 8007472:	bd80      	pop	{r7, pc}
 8007474:	20000cf8 	.word	0x20000cf8

08007478 <prvProcessExpiredTimer>:
 8007478:	b580      	push	{r7, lr}
 800747a:	b088      	sub	sp, #32
 800747c:	af02      	add	r7, sp, #8
 800747e:	6078      	str	r0, [r7, #4]
 8007480:	6039      	str	r1, [r7, #0]
 8007482:	4b1c      	ldr	r3, [pc, #112]	; (80074f4 <prvProcessExpiredTimer+0x7c>)
 8007484:	681b      	ldr	r3, [r3, #0]
 8007486:	68db      	ldr	r3, [r3, #12]
 8007488:	68db      	ldr	r3, [r3, #12]
 800748a:	617b      	str	r3, [r7, #20]
 800748c:	697b      	ldr	r3, [r7, #20]
 800748e:	3304      	adds	r3, #4
 8007490:	4618      	mov	r0, r3
 8007492:	f7fe fcf9 	bl	8005e88 <uxListRemove>
 8007496:	697b      	ldr	r3, [r7, #20]
 8007498:	69db      	ldr	r3, [r3, #28]
 800749a:	2b01      	cmp	r3, #1
 800749c:	d121      	bne.n	80074e2 <prvProcessExpiredTimer+0x6a>
 800749e:	697b      	ldr	r3, [r7, #20]
 80074a0:	699a      	ldr	r2, [r3, #24]
 80074a2:	687b      	ldr	r3, [r7, #4]
 80074a4:	18d1      	adds	r1, r2, r3
 80074a6:	687b      	ldr	r3, [r7, #4]
 80074a8:	683a      	ldr	r2, [r7, #0]
 80074aa:	6978      	ldr	r0, [r7, #20]
 80074ac:	f000 f8c8 	bl	8007640 <prvInsertTimerInActiveList>
 80074b0:	4603      	mov	r3, r0
 80074b2:	2b00      	cmp	r3, #0
 80074b4:	d015      	beq.n	80074e2 <prvProcessExpiredTimer+0x6a>
 80074b6:	2300      	movs	r3, #0
 80074b8:	9300      	str	r3, [sp, #0]
 80074ba:	2300      	movs	r3, #0
 80074bc:	687a      	ldr	r2, [r7, #4]
 80074be:	2100      	movs	r1, #0
 80074c0:	6978      	ldr	r0, [r7, #20]
 80074c2:	f7ff ff8d 	bl	80073e0 <xTimerGenericCommand>
 80074c6:	6138      	str	r0, [r7, #16]
 80074c8:	693b      	ldr	r3, [r7, #16]
 80074ca:	2b00      	cmp	r3, #0
 80074cc:	d109      	bne.n	80074e2 <prvProcessExpiredTimer+0x6a>
 80074ce:	f04f 0350 	mov.w	r3, #80	; 0x50
 80074d2:	f383 8811 	msr	BASEPRI, r3
 80074d6:	f3bf 8f6f 	isb	sy
 80074da:	f3bf 8f4f 	dsb	sy
 80074de:	60fb      	str	r3, [r7, #12]
 80074e0:	e7fe      	b.n	80074e0 <prvProcessExpiredTimer+0x68>
 80074e2:	697b      	ldr	r3, [r7, #20]
 80074e4:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 80074e6:	6978      	ldr	r0, [r7, #20]
 80074e8:	4798      	blx	r3
 80074ea:	bf00      	nop
 80074ec:	3718      	adds	r7, #24
 80074ee:	46bd      	mov	sp, r7
 80074f0:	bd80      	pop	{r7, pc}
 80074f2:	bf00      	nop
 80074f4:	20000cf0 	.word	0x20000cf0

080074f8 <prvTimerTask>:
 80074f8:	b580      	push	{r7, lr}
 80074fa:	b084      	sub	sp, #16
 80074fc:	af00      	add	r7, sp, #0
 80074fe:	6078      	str	r0, [r7, #4]
 8007500:	f107 0308 	add.w	r3, r7, #8
 8007504:	4618      	mov	r0, r3
 8007506:	f000 f857 	bl	80075b8 <prvGetNextExpireTime>
 800750a:	60f8      	str	r0, [r7, #12]
 800750c:	68bb      	ldr	r3, [r7, #8]
 800750e:	4619      	mov	r1, r3
 8007510:	68f8      	ldr	r0, [r7, #12]
 8007512:	f000 f803 	bl	800751c <prvProcessTimerOrBlockTask>
 8007516:	f000 f8d5 	bl	80076c4 <prvProcessReceivedCommands>
 800751a:	e7f1      	b.n	8007500 <prvTimerTask+0x8>

0800751c <prvProcessTimerOrBlockTask>:
 800751c:	b580      	push	{r7, lr}
 800751e:	b084      	sub	sp, #16
 8007520:	af00      	add	r7, sp, #0
 8007522:	6078      	str	r0, [r7, #4]
 8007524:	6039      	str	r1, [r7, #0]
 8007526:	f7fe ff19 	bl	800635c <vTaskSuspendAll>
 800752a:	f107 0308 	add.w	r3, r7, #8
 800752e:	4618      	mov	r0, r3
 8007530:	f000 f866 	bl	8007600 <prvSampleTimeNow>
 8007534:	60f8      	str	r0, [r7, #12]
 8007536:	68bb      	ldr	r3, [r7, #8]
 8007538:	2b00      	cmp	r3, #0
 800753a:	d130      	bne.n	800759e <prvProcessTimerOrBlockTask+0x82>
 800753c:	683b      	ldr	r3, [r7, #0]
 800753e:	2b00      	cmp	r3, #0
 8007540:	d10a      	bne.n	8007558 <prvProcessTimerOrBlockTask+0x3c>
 8007542:	687a      	ldr	r2, [r7, #4]
 8007544:	68fb      	ldr	r3, [r7, #12]
 8007546:	429a      	cmp	r2, r3
 8007548:	d806      	bhi.n	8007558 <prvProcessTimerOrBlockTask+0x3c>
 800754a:	f7fe ff15 	bl	8006378 <xTaskResumeAll>
 800754e:	68f9      	ldr	r1, [r7, #12]
 8007550:	6878      	ldr	r0, [r7, #4]
 8007552:	f7ff ff91 	bl	8007478 <prvProcessExpiredTimer>
 8007556:	e024      	b.n	80075a2 <prvProcessTimerOrBlockTask+0x86>
 8007558:	683b      	ldr	r3, [r7, #0]
 800755a:	2b00      	cmp	r3, #0
 800755c:	d008      	beq.n	8007570 <prvProcessTimerOrBlockTask+0x54>
 800755e:	4b13      	ldr	r3, [pc, #76]	; (80075ac <prvProcessTimerOrBlockTask+0x90>)
 8007560:	681b      	ldr	r3, [r3, #0]
 8007562:	681b      	ldr	r3, [r3, #0]
 8007564:	2b00      	cmp	r3, #0
 8007566:	d101      	bne.n	800756c <prvProcessTimerOrBlockTask+0x50>
 8007568:	2301      	movs	r3, #1
 800756a:	e000      	b.n	800756e <prvProcessTimerOrBlockTask+0x52>
 800756c:	2300      	movs	r3, #0
 800756e:	603b      	str	r3, [r7, #0]
 8007570:	4b0f      	ldr	r3, [pc, #60]	; (80075b0 <prvProcessTimerOrBlockTask+0x94>)
 8007572:	6818      	ldr	r0, [r3, #0]
 8007574:	687a      	ldr	r2, [r7, #4]
 8007576:	68fb      	ldr	r3, [r7, #12]
 8007578:	1ad3      	subs	r3, r2, r3
 800757a:	683a      	ldr	r2, [r7, #0]
 800757c:	4619      	mov	r1, r3
 800757e:	f7fe fbc5 	bl	8005d0c <vQueueWaitForMessageRestricted>
 8007582:	f7fe fef9 	bl	8006378 <xTaskResumeAll>
 8007586:	4603      	mov	r3, r0
 8007588:	2b00      	cmp	r3, #0
 800758a:	d10a      	bne.n	80075a2 <prvProcessTimerOrBlockTask+0x86>
 800758c:	4b09      	ldr	r3, [pc, #36]	; (80075b4 <prvProcessTimerOrBlockTask+0x98>)
 800758e:	f04f 5280 	mov.w	r2, #268435456	; 0x10000000
 8007592:	601a      	str	r2, [r3, #0]
 8007594:	f3bf 8f4f 	dsb	sy
 8007598:	f3bf 8f6f 	isb	sy
 800759c:	e001      	b.n	80075a2 <prvProcessTimerOrBlockTask+0x86>
 800759e:	f7fe feeb 	bl	8006378 <xTaskResumeAll>
 80075a2:	bf00      	nop
 80075a4:	3710      	adds	r7, #16
 80075a6:	46bd      	mov	sp, r7
 80075a8:	bd80      	pop	{r7, pc}
 80075aa:	bf00      	nop
 80075ac:	20000cf4 	.word	0x20000cf4
 80075b0:	20000cf8 	.word	0x20000cf8
 80075b4:	e000ed04 	.word	0xe000ed04

080075b8 <prvGetNextExpireTime>:
 80075b8:	b480      	push	{r7}
 80075ba:	b085      	sub	sp, #20
 80075bc:	af00      	add	r7, sp, #0
 80075be:	6078      	str	r0, [r7, #4]
 80075c0:	4b0e      	ldr	r3, [pc, #56]	; (80075fc <prvGetNextExpireTime+0x44>)
 80075c2:	681b      	ldr	r3, [r3, #0]
 80075c4:	681b      	ldr	r3, [r3, #0]
 80075c6:	2b00      	cmp	r3, #0
 80075c8:	d101      	bne.n	80075ce <prvGetNextExpireTime+0x16>
 80075ca:	2201      	movs	r2, #1
 80075cc:	e000      	b.n	80075d0 <prvGetNextExpireTime+0x18>
 80075ce:	2200      	movs	r2, #0
 80075d0:	687b      	ldr	r3, [r7, #4]
 80075d2:	601a      	str	r2, [r3, #0]
 80075d4:	687b      	ldr	r3, [r7, #4]
 80075d6:	681b      	ldr	r3, [r3, #0]
 80075d8:	2b00      	cmp	r3, #0
 80075da:	d105      	bne.n	80075e8 <prvGetNextExpireTime+0x30>
 80075dc:	4b07      	ldr	r3, [pc, #28]	; (80075fc <prvGetNextExpireTime+0x44>)
 80075de:	681b      	ldr	r3, [r3, #0]
 80075e0:	68db      	ldr	r3, [r3, #12]
 80075e2:	681b      	ldr	r3, [r3, #0]
 80075e4:	60fb      	str	r3, [r7, #12]
 80075e6:	e001      	b.n	80075ec <prvGetNextExpireTime+0x34>
 80075e8:	2300      	movs	r3, #0
 80075ea:	60fb      	str	r3, [r7, #12]
 80075ec:	68fb      	ldr	r3, [r7, #12]
 80075ee:	4618      	mov	r0, r3
 80075f0:	3714      	adds	r7, #20
 80075f2:	46bd      	mov	sp, r7
 80075f4:	f85d 7b04 	ldr.w	r7, [sp], #4
 80075f8:	4770      	bx	lr
 80075fa:	bf00      	nop
 80075fc:	20000cf0 	.word	0x20000cf0

08007600 <prvSampleTimeNow>:
 8007600:	b580      	push	{r7, lr}
 8007602:	b084      	sub	sp, #16
 8007604:	af00      	add	r7, sp, #0
 8007606:	6078      	str	r0, [r7, #4]
 8007608:	f7fe ff52 	bl	80064b0 <xTaskGetTickCount>
 800760c:	60f8      	str	r0, [r7, #12]
 800760e:	4b0b      	ldr	r3, [pc, #44]	; (800763c <prvSampleTimeNow+0x3c>)
 8007610:	681b      	ldr	r3, [r3, #0]
 8007612:	68fa      	ldr	r2, [r7, #12]
 8007614:	429a      	cmp	r2, r3
 8007616:	d205      	bcs.n	8007624 <prvSampleTimeNow+0x24>
 8007618:	f000 f8ea 	bl	80077f0 <prvSwitchTimerLists>
 800761c:	687b      	ldr	r3, [r7, #4]
 800761e:	2201      	movs	r2, #1
 8007620:	601a      	str	r2, [r3, #0]
 8007622:	e002      	b.n	800762a <prvSampleTimeNow+0x2a>
 8007624:	687b      	ldr	r3, [r7, #4]
 8007626:	2200      	movs	r2, #0
 8007628:	601a      	str	r2, [r3, #0]
 800762a:	4a04      	ldr	r2, [pc, #16]	; (800763c <prvSampleTimeNow+0x3c>)
 800762c:	68fb      	ldr	r3, [r7, #12]
 800762e:	6013      	str	r3, [r2, #0]
 8007630:	68fb      	ldr	r3, [r7, #12]
 8007632:	4618      	mov	r0, r3
 8007634:	3710      	adds	r7, #16
 8007636:	46bd      	mov	sp, r7
 8007638:	bd80      	pop	{r7, pc}
 800763a:	bf00      	nop
 800763c:	20000d00 	.word	0x20000d00

08007640 <prvInsertTimerInActiveList>:
 8007640:	b580      	push	{r7, lr}
 8007642:	b086      	sub	sp, #24
 8007644:	af00      	add	r7, sp, #0
 8007646:	60f8      	str	r0, [r7, #12]
 8007648:	60b9      	str	r1, [r7, #8]
 800764a:	607a      	str	r2, [r7, #4]
 800764c:	603b      	str	r3, [r7, #0]
 800764e:	2300      	movs	r3, #0
 8007650:	617b      	str	r3, [r7, #20]
 8007652:	68fb      	ldr	r3, [r7, #12]
 8007654:	68ba      	ldr	r2, [r7, #8]
 8007656:	605a      	str	r2, [r3, #4]
 8007658:	68fb      	ldr	r3, [r7, #12]
 800765a:	68fa      	ldr	r2, [r7, #12]
 800765c:	611a      	str	r2, [r3, #16]
 800765e:	68ba      	ldr	r2, [r7, #8]
 8007660:	687b      	ldr	r3, [r7, #4]
 8007662:	429a      	cmp	r2, r3
 8007664:	d812      	bhi.n	800768c <prvInsertTimerInActiveList+0x4c>
 8007666:	687a      	ldr	r2, [r7, #4]
 8007668:	683b      	ldr	r3, [r7, #0]
 800766a:	1ad2      	subs	r2, r2, r3
 800766c:	68fb      	ldr	r3, [r7, #12]
 800766e:	699b      	ldr	r3, [r3, #24]
 8007670:	429a      	cmp	r2, r3
 8007672:	d302      	bcc.n	800767a <prvInsertTimerInActiveList+0x3a>
 8007674:	2301      	movs	r3, #1
 8007676:	617b      	str	r3, [r7, #20]
 8007678:	e01b      	b.n	80076b2 <prvInsertTimerInActiveList+0x72>
 800767a:	4b10      	ldr	r3, [pc, #64]	; (80076bc <prvInsertTimerInActiveList+0x7c>)
 800767c:	681a      	ldr	r2, [r3, #0]
 800767e:	68fb      	ldr	r3, [r7, #12]
 8007680:	3304      	adds	r3, #4
 8007682:	4619      	mov	r1, r3
 8007684:	4610      	mov	r0, r2
 8007686:	f7fe fbc6 	bl	8005e16 <vListInsert>
 800768a:	e012      	b.n	80076b2 <prvInsertTimerInActiveList+0x72>
 800768c:	687a      	ldr	r2, [r7, #4]
 800768e:	683b      	ldr	r3, [r7, #0]
 8007690:	429a      	cmp	r2, r3
 8007692:	d206      	bcs.n	80076a2 <prvInsertTimerInActiveList+0x62>
 8007694:	68ba      	ldr	r2, [r7, #8]
 8007696:	683b      	ldr	r3, [r7, #0]
 8007698:	429a      	cmp	r2, r3
 800769a:	d302      	bcc.n	80076a2 <prvInsertTimerInActiveList+0x62>
 800769c:	2301      	movs	r3, #1
 800769e:	617b      	str	r3, [r7, #20]
 80076a0:	e007      	b.n	80076b2 <prvInsertTimerInActiveList+0x72>
 80076a2:	4b07      	ldr	r3, [pc, #28]	; (80076c0 <prvInsertTimerInActiveList+0x80>)
 80076a4:	681a      	ldr	r2, [r3, #0]
 80076a6:	68fb      	ldr	r3, [r7, #12]
 80076a8:	3304      	adds	r3, #4
 80076aa:	4619      	mov	r1, r3
 80076ac:	4610      	mov	r0, r2
 80076ae:	f7fe fbb2 	bl	8005e16 <vListInsert>
 80076b2:	697b      	ldr	r3, [r7, #20]
 80076b4:	4618      	mov	r0, r3
 80076b6:	3718      	adds	r7, #24
 80076b8:	46bd      	mov	sp, r7
 80076ba:	bd80      	pop	{r7, pc}
 80076bc:	20000cf4 	.word	0x20000cf4
 80076c0:	20000cf0 	.word	0x20000cf0

080076c4 <prvProcessReceivedCommands>:
 80076c4:	b580      	push	{r7, lr}
 80076c6:	b08c      	sub	sp, #48	; 0x30
 80076c8:	af02      	add	r7, sp, #8
 80076ca:	e07f      	b.n	80077cc <prvProcessReceivedCommands+0x108>
 80076cc:	68bb      	ldr	r3, [r7, #8]
 80076ce:	2b00      	cmp	r3, #0
 80076d0:	db7b      	blt.n	80077ca <prvProcessReceivedCommands+0x106>
 80076d2:	693b      	ldr	r3, [r7, #16]
 80076d4:	627b      	str	r3, [r7, #36]	; 0x24
 80076d6:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 80076d8:	695b      	ldr	r3, [r3, #20]
 80076da:	2b00      	cmp	r3, #0
 80076dc:	d004      	beq.n	80076e8 <prvProcessReceivedCommands+0x24>
 80076de:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 80076e0:	3304      	adds	r3, #4
 80076e2:	4618      	mov	r0, r3
 80076e4:	f7fe fbd0 	bl	8005e88 <uxListRemove>
 80076e8:	1d3b      	adds	r3, r7, #4
 80076ea:	4618      	mov	r0, r3
 80076ec:	f7ff ff88 	bl	8007600 <prvSampleTimeNow>
 80076f0:	6238      	str	r0, [r7, #32]
 80076f2:	68bb      	ldr	r3, [r7, #8]
 80076f4:	2b09      	cmp	r3, #9
 80076f6:	d869      	bhi.n	80077cc <prvProcessReceivedCommands+0x108>
 80076f8:	a201      	add	r2, pc, #4	; (adr r2, 8007700 <prvProcessReceivedCommands+0x3c>)
 80076fa:	f852 f023 	ldr.w	pc, [r2, r3, lsl #2]
 80076fe:	bf00      	nop
 8007700:	08007729 	.word	0x08007729
 8007704:	08007729 	.word	0x08007729
 8007708:	08007729 	.word	0x08007729
 800770c:	080077cd 	.word	0x080077cd
 8007710:	08007783 	.word	0x08007783
 8007714:	080077b9 	.word	0x080077b9
 8007718:	08007729 	.word	0x08007729
 800771c:	08007729 	.word	0x08007729
 8007720:	080077cd 	.word	0x080077cd
 8007724:	08007783 	.word	0x08007783
 8007728:	68fa      	ldr	r2, [r7, #12]
 800772a:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 800772c:	699b      	ldr	r3, [r3, #24]
 800772e:	18d1      	adds	r1, r2, r3
 8007730:	68fb      	ldr	r3, [r7, #12]
 8007732:	6a3a      	ldr	r2, [r7, #32]
 8007734:	6a78      	ldr	r0, [r7, #36]	; 0x24
 8007736:	f7ff ff83 	bl	8007640 <prvInsertTimerInActiveList>
 800773a:	4603      	mov	r3, r0
 800773c:	2b00      	cmp	r3, #0
 800773e:	d045      	beq.n	80077cc <prvProcessReceivedCommands+0x108>
 8007740:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8007742:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 8007744:	6a78      	ldr	r0, [r7, #36]	; 0x24
 8007746:	4798      	blx	r3
 8007748:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 800774a:	69db      	ldr	r3, [r3, #28]
 800774c:	2b01      	cmp	r3, #1
 800774e:	d13d      	bne.n	80077cc <prvProcessReceivedCommands+0x108>
 8007750:	68fa      	ldr	r2, [r7, #12]
 8007752:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8007754:	699b      	ldr	r3, [r3, #24]
 8007756:	441a      	add	r2, r3
 8007758:	2300      	movs	r3, #0
 800775a:	9300      	str	r3, [sp, #0]
 800775c:	2300      	movs	r3, #0
 800775e:	2100      	movs	r1, #0
 8007760:	6a78      	ldr	r0, [r7, #36]	; 0x24
 8007762:	f7ff fe3d 	bl	80073e0 <xTimerGenericCommand>
 8007766:	61f8      	str	r0, [r7, #28]
 8007768:	69fb      	ldr	r3, [r7, #28]
 800776a:	2b00      	cmp	r3, #0
 800776c:	d12e      	bne.n	80077cc <prvProcessReceivedCommands+0x108>
 800776e:	f04f 0350 	mov.w	r3, #80	; 0x50
 8007772:	f383 8811 	msr	BASEPRI, r3
 8007776:	f3bf 8f6f 	isb	sy
 800777a:	f3bf 8f4f 	dsb	sy
 800777e:	61bb      	str	r3, [r7, #24]
 8007780:	e7fe      	b.n	8007780 <prvProcessReceivedCommands+0xbc>
 8007782:	68fa      	ldr	r2, [r7, #12]
 8007784:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8007786:	619a      	str	r2, [r3, #24]
 8007788:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 800778a:	699b      	ldr	r3, [r3, #24]
 800778c:	2b00      	cmp	r3, #0
 800778e:	d109      	bne.n	80077a4 <prvProcessReceivedCommands+0xe0>
 8007790:	f04f 0350 	mov.w	r3, #80	; 0x50
 8007794:	f383 8811 	msr	BASEPRI, r3
 8007798:	f3bf 8f6f 	isb	sy
 800779c:	f3bf 8f4f 	dsb	sy
 80077a0:	617b      	str	r3, [r7, #20]
 80077a2:	e7fe      	b.n	80077a2 <prvProcessReceivedCommands+0xde>
 80077a4:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 80077a6:	699a      	ldr	r2, [r3, #24]
 80077a8:	6a3b      	ldr	r3, [r7, #32]
 80077aa:	18d1      	adds	r1, r2, r3
 80077ac:	6a3b      	ldr	r3, [r7, #32]
 80077ae:	6a3a      	ldr	r2, [r7, #32]
 80077b0:	6a78      	ldr	r0, [r7, #36]	; 0x24
 80077b2:	f7ff ff45 	bl	8007640 <prvInsertTimerInActiveList>
 80077b6:	e009      	b.n	80077cc <prvProcessReceivedCommands+0x108>
 80077b8:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 80077ba:	f893 302c 	ldrb.w	r3, [r3, #44]	; 0x2c
 80077be:	2b00      	cmp	r3, #0
 80077c0:	d104      	bne.n	80077cc <prvProcessReceivedCommands+0x108>
 80077c2:	6a78      	ldr	r0, [r7, #36]	; 0x24
 80077c4:	f000 fbba 	bl	8007f3c <vPortFree>
 80077c8:	e000      	b.n	80077cc <prvProcessReceivedCommands+0x108>
 80077ca:	bf00      	nop
 80077cc:	4b07      	ldr	r3, [pc, #28]	; (80077ec <prvProcessReceivedCommands+0x128>)
 80077ce:	681b      	ldr	r3, [r3, #0]
 80077d0:	f107 0108 	add.w	r1, r7, #8
 80077d4:	2200      	movs	r2, #0
 80077d6:	4618      	mov	r0, r3
 80077d8:	f7fd ff64 	bl	80056a4 <xQueueReceive>
 80077dc:	4603      	mov	r3, r0
 80077de:	2b00      	cmp	r3, #0
 80077e0:	f47f af74 	bne.w	80076cc <prvProcessReceivedCommands+0x8>
 80077e4:	bf00      	nop
 80077e6:	3728      	adds	r7, #40	; 0x28
 80077e8:	46bd      	mov	sp, r7
 80077ea:	bd80      	pop	{r7, pc}
 80077ec:	20000cf8 	.word	0x20000cf8

080077f0 <prvSwitchTimerLists>:
 80077f0:	b580      	push	{r7, lr}
 80077f2:	b088      	sub	sp, #32
 80077f4:	af02      	add	r7, sp, #8
 80077f6:	e044      	b.n	8007882 <prvSwitchTimerLists+0x92>
 80077f8:	4b2b      	ldr	r3, [pc, #172]	; (80078a8 <prvSwitchTimerLists+0xb8>)
 80077fa:	681b      	ldr	r3, [r3, #0]
 80077fc:	68db      	ldr	r3, [r3, #12]
 80077fe:	681b      	ldr	r3, [r3, #0]
 8007800:	613b      	str	r3, [r7, #16]
 8007802:	4b29      	ldr	r3, [pc, #164]	; (80078a8 <prvSwitchTimerLists+0xb8>)
 8007804:	681b      	ldr	r3, [r3, #0]
 8007806:	68db      	ldr	r3, [r3, #12]
 8007808:	68db      	ldr	r3, [r3, #12]
 800780a:	60fb      	str	r3, [r7, #12]
 800780c:	68fb      	ldr	r3, [r7, #12]
 800780e:	3304      	adds	r3, #4
 8007810:	4618      	mov	r0, r3
 8007812:	f7fe fb39 	bl	8005e88 <uxListRemove>
 8007816:	68fb      	ldr	r3, [r7, #12]
 8007818:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 800781a:	68f8      	ldr	r0, [r7, #12]
 800781c:	4798      	blx	r3
 800781e:	68fb      	ldr	r3, [r7, #12]
 8007820:	69db      	ldr	r3, [r3, #28]
 8007822:	2b01      	cmp	r3, #1
 8007824:	d12d      	bne.n	8007882 <prvSwitchTimerLists+0x92>
 8007826:	68fb      	ldr	r3, [r7, #12]
 8007828:	699b      	ldr	r3, [r3, #24]
 800782a:	693a      	ldr	r2, [r7, #16]
 800782c:	4413      	add	r3, r2
 800782e:	60bb      	str	r3, [r7, #8]
 8007830:	68ba      	ldr	r2, [r7, #8]
 8007832:	693b      	ldr	r3, [r7, #16]
 8007834:	429a      	cmp	r2, r3
 8007836:	d90e      	bls.n	8007856 <prvSwitchTimerLists+0x66>
 8007838:	68fb      	ldr	r3, [r7, #12]
 800783a:	68ba      	ldr	r2, [r7, #8]
 800783c:	605a      	str	r2, [r3, #4]
 800783e:	68fb      	ldr	r3, [r7, #12]
 8007840:	68fa      	ldr	r2, [r7, #12]
 8007842:	611a      	str	r2, [r3, #16]
 8007844:	4b18      	ldr	r3, [pc, #96]	; (80078a8 <prvSwitchTimerLists+0xb8>)
 8007846:	681a      	ldr	r2, [r3, #0]
 8007848:	68fb      	ldr	r3, [r7, #12]
 800784a:	3304      	adds	r3, #4
 800784c:	4619      	mov	r1, r3
 800784e:	4610      	mov	r0, r2
 8007850:	f7fe fae1 	bl	8005e16 <vListInsert>
 8007854:	e015      	b.n	8007882 <prvSwitchTimerLists+0x92>
 8007856:	2300      	movs	r3, #0
 8007858:	9300      	str	r3, [sp, #0]
 800785a:	2300      	movs	r3, #0
 800785c:	693a      	ldr	r2, [r7, #16]
 800785e:	2100      	movs	r1, #0
 8007860:	68f8      	ldr	r0, [r7, #12]
 8007862:	f7ff fdbd 	bl	80073e0 <xTimerGenericCommand>
 8007866:	6078      	str	r0, [r7, #4]
 8007868:	687b      	ldr	r3, [r7, #4]
 800786a:	2b00      	cmp	r3, #0
 800786c:	d109      	bne.n	8007882 <prvSwitchTimerLists+0x92>
 800786e:	f04f 0350 	mov.w	r3, #80	; 0x50
 8007872:	f383 8811 	msr	BASEPRI, r3
 8007876:	f3bf 8f6f 	isb	sy
 800787a:	f3bf 8f4f 	dsb	sy
 800787e:	603b      	str	r3, [r7, #0]
 8007880:	e7fe      	b.n	8007880 <prvSwitchTimerLists+0x90>
 8007882:	4b09      	ldr	r3, [pc, #36]	; (80078a8 <prvSwitchTimerLists+0xb8>)
 8007884:	681b      	ldr	r3, [r3, #0]
 8007886:	681b      	ldr	r3, [r3, #0]
 8007888:	2b00      	cmp	r3, #0
 800788a:	d1b5      	bne.n	80077f8 <prvSwitchTimerLists+0x8>
 800788c:	4b06      	ldr	r3, [pc, #24]	; (80078a8 <prvSwitchTimerLists+0xb8>)
 800788e:	681b      	ldr	r3, [r3, #0]
 8007890:	617b      	str	r3, [r7, #20]
 8007892:	4b06      	ldr	r3, [pc, #24]	; (80078ac <prvSwitchTimerLists+0xbc>)
 8007894:	681b      	ldr	r3, [r3, #0]
 8007896:	4a04      	ldr	r2, [pc, #16]	; (80078a8 <prvSwitchTimerLists+0xb8>)
 8007898:	6013      	str	r3, [r2, #0]
 800789a:	4a04      	ldr	r2, [pc, #16]	; (80078ac <prvSwitchTimerLists+0xbc>)
 800789c:	697b      	ldr	r3, [r7, #20]
 800789e:	6013      	str	r3, [r2, #0]
 80078a0:	bf00      	nop
 80078a2:	3718      	adds	r7, #24
 80078a4:	46bd      	mov	sp, r7
 80078a6:	bd80      	pop	{r7, pc}
 80078a8:	20000cf0 	.word	0x20000cf0
 80078ac:	20000cf4 	.word	0x20000cf4

080078b0 <prvCheckForValidListAndQueue>:
 80078b0:	b580      	push	{r7, lr}
 80078b2:	b082      	sub	sp, #8
 80078b4:	af02      	add	r7, sp, #8
 80078b6:	f000 f961 	bl	8007b7c <vPortEnterCritical>
 80078ba:	4b15      	ldr	r3, [pc, #84]	; (8007910 <prvCheckForValidListAndQueue+0x60>)
 80078bc:	681b      	ldr	r3, [r3, #0]
 80078be:	2b00      	cmp	r3, #0
 80078c0:	d120      	bne.n	8007904 <prvCheckForValidListAndQueue+0x54>
 80078c2:	4814      	ldr	r0, [pc, #80]	; (8007914 <prvCheckForValidListAndQueue+0x64>)
 80078c4:	f7fe fa56 	bl	8005d74 <vListInitialise>
 80078c8:	4813      	ldr	r0, [pc, #76]	; (8007918 <prvCheckForValidListAndQueue+0x68>)
 80078ca:	f7fe fa53 	bl	8005d74 <vListInitialise>
 80078ce:	4b13      	ldr	r3, [pc, #76]	; (800791c <prvCheckForValidListAndQueue+0x6c>)
 80078d0:	4a10      	ldr	r2, [pc, #64]	; (8007914 <prvCheckForValidListAndQueue+0x64>)
 80078d2:	601a      	str	r2, [r3, #0]
 80078d4:	4b12      	ldr	r3, [pc, #72]	; (8007920 <prvCheckForValidListAndQueue+0x70>)
 80078d6:	4a10      	ldr	r2, [pc, #64]	; (8007918 <prvCheckForValidListAndQueue+0x68>)
 80078d8:	601a      	str	r2, [r3, #0]
 80078da:	2300      	movs	r3, #0
 80078dc:	9300      	str	r3, [sp, #0]
 80078de:	4b11      	ldr	r3, [pc, #68]	; (8007924 <prvCheckForValidListAndQueue+0x74>)
 80078e0:	4a11      	ldr	r2, [pc, #68]	; (8007928 <prvCheckForValidListAndQueue+0x78>)
 80078e2:	210c      	movs	r1, #12
 80078e4:	200a      	movs	r0, #10
 80078e6:	f7fd fc83 	bl	80051f0 <xQueueGenericCreateStatic>
 80078ea:	4602      	mov	r2, r0
 80078ec:	4b08      	ldr	r3, [pc, #32]	; (8007910 <prvCheckForValidListAndQueue+0x60>)
 80078ee:	601a      	str	r2, [r3, #0]
 80078f0:	4b07      	ldr	r3, [pc, #28]	; (8007910 <prvCheckForValidListAndQueue+0x60>)
 80078f2:	681b      	ldr	r3, [r3, #0]
 80078f4:	2b00      	cmp	r3, #0
 80078f6:	d005      	beq.n	8007904 <prvCheckForValidListAndQueue+0x54>
 80078f8:	4b05      	ldr	r3, [pc, #20]	; (8007910 <prvCheckForValidListAndQueue+0x60>)
 80078fa:	681b      	ldr	r3, [r3, #0]
 80078fc:	490b      	ldr	r1, [pc, #44]	; (800792c <prvCheckForValidListAndQueue+0x7c>)
 80078fe:	4618      	mov	r0, r3
 8007900:	f7fe f9dc 	bl	8005cbc <vQueueAddToRegistry>
 8007904:	f000 f968 	bl	8007bd8 <vPortExitCritical>
 8007908:	bf00      	nop
 800790a:	46bd      	mov	sp, r7
 800790c:	bd80      	pop	{r7, pc}
 800790e:	bf00      	nop
 8007910:	20000cf8 	.word	0x20000cf8
 8007914:	20000cc8 	.word	0x20000cc8
 8007918:	20000cdc 	.word	0x20000cdc
 800791c:	20000cf0 	.word	0x20000cf0
 8007920:	20000cf4 	.word	0x20000cf4
 8007924:	20000d7c 	.word	0x20000d7c
 8007928:	20000d04 	.word	0x20000d04
 800792c:	0800b2e8 	.word	0x0800b2e8

08007930 <pxPortInitialiseStack>:
 8007930:	b480      	push	{r7}
 8007932:	b085      	sub	sp, #20
 8007934:	af00      	add	r7, sp, #0
 8007936:	60f8      	str	r0, [r7, #12]
 8007938:	60b9      	str	r1, [r7, #8]
 800793a:	607a      	str	r2, [r7, #4]
 800793c:	68fb      	ldr	r3, [r7, #12]
 800793e:	3b04      	subs	r3, #4
 8007940:	60fb      	str	r3, [r7, #12]
 8007942:	68fb      	ldr	r3, [r7, #12]
 8007944:	f04f 7280 	mov.w	r2, #16777216	; 0x1000000
 8007948:	601a      	str	r2, [r3, #0]
 800794a:	68fb      	ldr	r3, [r7, #12]
 800794c:	3b04      	subs	r3, #4
 800794e:	60fb      	str	r3, [r7, #12]
 8007950:	68bb      	ldr	r3, [r7, #8]
 8007952:	f023 0201 	bic.w	r2, r3, #1
 8007956:	68fb      	ldr	r3, [r7, #12]
 8007958:	601a      	str	r2, [r3, #0]
 800795a:	68fb      	ldr	r3, [r7, #12]
 800795c:	3b04      	subs	r3, #4
 800795e:	60fb      	str	r3, [r7, #12]
 8007960:	4a0c      	ldr	r2, [pc, #48]	; (8007994 <pxPortInitialiseStack+0x64>)
 8007962:	68fb      	ldr	r3, [r7, #12]
 8007964:	601a      	str	r2, [r3, #0]
 8007966:	68fb      	ldr	r3, [r7, #12]
 8007968:	3b14      	subs	r3, #20
 800796a:	60fb      	str	r3, [r7, #12]
 800796c:	687a      	ldr	r2, [r7, #4]
 800796e:	68fb      	ldr	r3, [r7, #12]
 8007970:	601a      	str	r2, [r3, #0]
 8007972:	68fb      	ldr	r3, [r7, #12]
 8007974:	3b04      	subs	r3, #4
 8007976:	60fb      	str	r3, [r7, #12]
 8007978:	68fb      	ldr	r3, [r7, #12]
 800797a:	f06f 0202 	mvn.w	r2, #2
 800797e:	601a      	str	r2, [r3, #0]
 8007980:	68fb      	ldr	r3, [r7, #12]
 8007982:	3b20      	subs	r3, #32
 8007984:	60fb      	str	r3, [r7, #12]
 8007986:	68fb      	ldr	r3, [r7, #12]
 8007988:	4618      	mov	r0, r3
 800798a:	3714      	adds	r7, #20
 800798c:	46bd      	mov	sp, r7
 800798e:	f85d 7b04 	ldr.w	r7, [sp], #4
 8007992:	4770      	bx	lr
 8007994:	08007999 	.word	0x08007999

08007998 <prvTaskExitError>:
 8007998:	b480      	push	{r7}
 800799a:	b085      	sub	sp, #20
 800799c:	af00      	add	r7, sp, #0
 800799e:	2300      	movs	r3, #0
 80079a0:	607b      	str	r3, [r7, #4]
 80079a2:	4b11      	ldr	r3, [pc, #68]	; (80079e8 <prvTaskExitError+0x50>)
 80079a4:	681b      	ldr	r3, [r3, #0]
 80079a6:	f1b3 3fff 	cmp.w	r3, #4294967295	; 0xffffffff
 80079aa:	d009      	beq.n	80079c0 <prvTaskExitError+0x28>
 80079ac:	f04f 0350 	mov.w	r3, #80	; 0x50
 80079b0:	f383 8811 	msr	BASEPRI, r3
 80079b4:	f3bf 8f6f 	isb	sy
 80079b8:	f3bf 8f4f 	dsb	sy
 80079bc:	60fb      	str	r3, [r7, #12]
 80079be:	e7fe      	b.n	80079be <prvTaskExitError+0x26>
 80079c0:	f04f 0350 	mov.w	r3, #80	; 0x50
 80079c4:	f383 8811 	msr	BASEPRI, r3
 80079c8:	f3bf 8f6f 	isb	sy
 80079cc:	f3bf 8f4f 	dsb	sy
 80079d0:	60bb      	str	r3, [r7, #8]
 80079d2:	bf00      	nop
 80079d4:	687b      	ldr	r3, [r7, #4]
 80079d6:	2b00      	cmp	r3, #0
 80079d8:	d0fc      	beq.n	80079d4 <prvTaskExitError+0x3c>
 80079da:	bf00      	nop
 80079dc:	3714      	adds	r7, #20
 80079de:	46bd      	mov	sp, r7
 80079e0:	f85d 7b04 	ldr.w	r7, [sp], #4
 80079e4:	4770      	bx	lr
 80079e6:	bf00      	nop
 80079e8:	20000078 	.word	0x20000078
 80079ec:	00000000 	.word	0x00000000

080079f0 <SVC_Handler>:
 80079f0:	4b07      	ldr	r3, [pc, #28]	; (8007a10 <pxCurrentTCBConst2>)
 80079f2:	6819      	ldr	r1, [r3, #0]
 80079f4:	6808      	ldr	r0, [r1, #0]
 80079f6:	e8b0 4ff0 	ldmia.w	r0!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 80079fa:	f380 8809 	msr	PSP, r0
 80079fe:	f3bf 8f6f 	isb	sy
 8007a02:	f04f 0000 	mov.w	r0, #0
 8007a06:	f380 8811 	msr	BASEPRI, r0
 8007a0a:	4770      	bx	lr
 8007a0c:	f3af 8000 	nop.w

08007a10 <pxCurrentTCBConst2>:
 8007a10:	20000bc4 	.word	0x20000bc4
 8007a14:	bf00      	nop
 8007a16:	bf00      	nop

08007a18 <prvPortStartFirstTask>:
 8007a18:	4808      	ldr	r0, [pc, #32]	; (8007a3c <prvPortStartFirstTask+0x24>)
 8007a1a:	6800      	ldr	r0, [r0, #0]
 8007a1c:	6800      	ldr	r0, [r0, #0]
 8007a1e:	f380 8808 	msr	MSP, r0
 8007a22:	f04f 0000 	mov.w	r0, #0
 8007a26:	f380 8814 	msr	CONTROL, r0
 8007a2a:	b662      	cpsie	i
 8007a2c:	b661      	cpsie	f
 8007a2e:	f3bf 8f4f 	dsb	sy
 8007a32:	f3bf 8f6f 	isb	sy
 8007a36:	df00      	svc	0
 8007a38:	bf00      	nop
 8007a3a:	bf00      	nop
 8007a3c:	e000ed08 	.word	0xe000ed08

08007a40 <xPortStartScheduler>:
 8007a40:	b580      	push	{r7, lr}
 8007a42:	b086      	sub	sp, #24
 8007a44:	af00      	add	r7, sp, #0
 8007a46:	4b44      	ldr	r3, [pc, #272]	; (8007b58 <xPortStartScheduler+0x118>)
 8007a48:	681b      	ldr	r3, [r3, #0]
 8007a4a:	4a44      	ldr	r2, [pc, #272]	; (8007b5c <xPortStartScheduler+0x11c>)
 8007a4c:	4293      	cmp	r3, r2
 8007a4e:	d109      	bne.n	8007a64 <xPortStartScheduler+0x24>
 8007a50:	f04f 0350 	mov.w	r3, #80	; 0x50
 8007a54:	f383 8811 	msr	BASEPRI, r3
 8007a58:	f3bf 8f6f 	isb	sy
 8007a5c:	f3bf 8f4f 	dsb	sy
 8007a60:	613b      	str	r3, [r7, #16]
 8007a62:	e7fe      	b.n	8007a62 <xPortStartScheduler+0x22>
 8007a64:	4b3c      	ldr	r3, [pc, #240]	; (8007b58 <xPortStartScheduler+0x118>)
 8007a66:	681b      	ldr	r3, [r3, #0]
 8007a68:	4a3d      	ldr	r2, [pc, #244]	; (8007b60 <xPortStartScheduler+0x120>)
 8007a6a:	4293      	cmp	r3, r2
 8007a6c:	d109      	bne.n	8007a82 <xPortStartScheduler+0x42>
 8007a6e:	f04f 0350 	mov.w	r3, #80	; 0x50
 8007a72:	f383 8811 	msr	BASEPRI, r3
 8007a76:	f3bf 8f6f 	isb	sy
 8007a7a:	f3bf 8f4f 	dsb	sy
 8007a7e:	60fb      	str	r3, [r7, #12]
 8007a80:	e7fe      	b.n	8007a80 <xPortStartScheduler+0x40>
 8007a82:	4b38      	ldr	r3, [pc, #224]	; (8007b64 <xPortStartScheduler+0x124>)
 8007a84:	617b      	str	r3, [r7, #20]
 8007a86:	697b      	ldr	r3, [r7, #20]
 8007a88:	781b      	ldrb	r3, [r3, #0]
 8007a8a:	b2db      	uxtb	r3, r3
 8007a8c:	607b      	str	r3, [r7, #4]
 8007a8e:	697b      	ldr	r3, [r7, #20]
 8007a90:	22ff      	movs	r2, #255	; 0xff
 8007a92:	701a      	strb	r2, [r3, #0]
 8007a94:	697b      	ldr	r3, [r7, #20]
 8007a96:	781b      	ldrb	r3, [r3, #0]
 8007a98:	b2db      	uxtb	r3, r3
 8007a9a:	70fb      	strb	r3, [r7, #3]
 8007a9c:	78fb      	ldrb	r3, [r7, #3]
 8007a9e:	b2db      	uxtb	r3, r3
 8007aa0:	f003 0350 	and.w	r3, r3, #80	; 0x50
 8007aa4:	b2da      	uxtb	r2, r3
 8007aa6:	4b30      	ldr	r3, [pc, #192]	; (8007b68 <xPortStartScheduler+0x128>)
 8007aa8:	701a      	strb	r2, [r3, #0]
 8007aaa:	4b30      	ldr	r3, [pc, #192]	; (8007b6c <xPortStartScheduler+0x12c>)
 8007aac:	2207      	movs	r2, #7
 8007aae:	601a      	str	r2, [r3, #0]
 8007ab0:	e009      	b.n	8007ac6 <xPortStartScheduler+0x86>
 8007ab2:	4b2e      	ldr	r3, [pc, #184]	; (8007b6c <xPortStartScheduler+0x12c>)
 8007ab4:	681b      	ldr	r3, [r3, #0]
 8007ab6:	3b01      	subs	r3, #1
 8007ab8:	4a2c      	ldr	r2, [pc, #176]	; (8007b6c <xPortStartScheduler+0x12c>)
 8007aba:	6013      	str	r3, [r2, #0]
 8007abc:	78fb      	ldrb	r3, [r7, #3]
 8007abe:	b2db      	uxtb	r3, r3
 8007ac0:	005b      	lsls	r3, r3, #1
 8007ac2:	b2db      	uxtb	r3, r3
 8007ac4:	70fb      	strb	r3, [r7, #3]
 8007ac6:	78fb      	ldrb	r3, [r7, #3]
 8007ac8:	b2db      	uxtb	r3, r3
 8007aca:	f003 0380 	and.w	r3, r3, #128	; 0x80
 8007ace:	2b80      	cmp	r3, #128	; 0x80
 8007ad0:	d0ef      	beq.n	8007ab2 <xPortStartScheduler+0x72>
 8007ad2:	4b26      	ldr	r3, [pc, #152]	; (8007b6c <xPortStartScheduler+0x12c>)
 8007ad4:	681b      	ldr	r3, [r3, #0]
 8007ad6:	f1c3 0307 	rsb	r3, r3, #7
 8007ada:	2b04      	cmp	r3, #4
 8007adc:	d009      	beq.n	8007af2 <xPortStartScheduler+0xb2>
 8007ade:	f04f 0350 	mov.w	r3, #80	; 0x50
 8007ae2:	f383 8811 	msr	BASEPRI, r3
 8007ae6:	f3bf 8f6f 	isb	sy
 8007aea:	f3bf 8f4f 	dsb	sy
 8007aee:	60bb      	str	r3, [r7, #8]
 8007af0:	e7fe      	b.n	8007af0 <xPortStartScheduler+0xb0>
 8007af2:	4b1e      	ldr	r3, [pc, #120]	; (8007b6c <xPortStartScheduler+0x12c>)
 8007af4:	681b      	ldr	r3, [r3, #0]
 8007af6:	021b      	lsls	r3, r3, #8
 8007af8:	4a1c      	ldr	r2, [pc, #112]	; (8007b6c <xPortStartScheduler+0x12c>)
 8007afa:	6013      	str	r3, [r2, #0]
 8007afc:	4b1b      	ldr	r3, [pc, #108]	; (8007b6c <xPortStartScheduler+0x12c>)
 8007afe:	681b      	ldr	r3, [r3, #0]
 8007b00:	f403 63e0 	and.w	r3, r3, #1792	; 0x700
 8007b04:	4a19      	ldr	r2, [pc, #100]	; (8007b6c <xPortStartScheduler+0x12c>)
 8007b06:	6013      	str	r3, [r2, #0]
 8007b08:	687b      	ldr	r3, [r7, #4]
 8007b0a:	b2da      	uxtb	r2, r3
 8007b0c:	697b      	ldr	r3, [r7, #20]
 8007b0e:	701a      	strb	r2, [r3, #0]
 8007b10:	4b17      	ldr	r3, [pc, #92]	; (8007b70 <xPortStartScheduler+0x130>)
 8007b12:	681b      	ldr	r3, [r3, #0]
 8007b14:	4a16      	ldr	r2, [pc, #88]	; (8007b70 <xPortStartScheduler+0x130>)
 8007b16:	f443 0370 	orr.w	r3, r3, #15728640	; 0xf00000
 8007b1a:	6013      	str	r3, [r2, #0]
 8007b1c:	4b14      	ldr	r3, [pc, #80]	; (8007b70 <xPortStartScheduler+0x130>)
 8007b1e:	681b      	ldr	r3, [r3, #0]
 8007b20:	4a13      	ldr	r2, [pc, #76]	; (8007b70 <xPortStartScheduler+0x130>)
 8007b22:	f043 4370 	orr.w	r3, r3, #4026531840	; 0xf0000000
 8007b26:	6013      	str	r3, [r2, #0]
 8007b28:	f000 f8d6 	bl	8007cd8 <vPortSetupTimerInterrupt>
 8007b2c:	4b11      	ldr	r3, [pc, #68]	; (8007b74 <xPortStartScheduler+0x134>)
 8007b2e:	2200      	movs	r2, #0
 8007b30:	601a      	str	r2, [r3, #0]
 8007b32:	f000 f8f5 	bl	8007d20 <vPortEnableVFP>
 8007b36:	4b10      	ldr	r3, [pc, #64]	; (8007b78 <xPortStartScheduler+0x138>)
 8007b38:	681b      	ldr	r3, [r3, #0]
 8007b3a:	4a0f      	ldr	r2, [pc, #60]	; (8007b78 <xPortStartScheduler+0x138>)
 8007b3c:	f043 4340 	orr.w	r3, r3, #3221225472	; 0xc0000000
 8007b40:	6013      	str	r3, [r2, #0]
 8007b42:	f7ff ff69 	bl	8007a18 <prvPortStartFirstTask>
 8007b46:	f7fe fd95 	bl	8006674 <vTaskSwitchContext>
 8007b4a:	f7ff ff25 	bl	8007998 <prvTaskExitError>
 8007b4e:	2300      	movs	r3, #0
 8007b50:	4618      	mov	r0, r3
 8007b52:	3718      	adds	r7, #24
 8007b54:	46bd      	mov	sp, r7
 8007b56:	bd80      	pop	{r7, pc}
 8007b58:	e000ed00 	.word	0xe000ed00
 8007b5c:	410fc271 	.word	0x410fc271
 8007b60:	410fc270 	.word	0x410fc270
 8007b64:	e000e400 	.word	0xe000e400
 8007b68:	20000dcc 	.word	0x20000dcc
 8007b6c:	20000dd0 	.word	0x20000dd0
 8007b70:	e000ed20 	.word	0xe000ed20
 8007b74:	20000078 	.word	0x20000078
 8007b78:	e000ef34 	.word	0xe000ef34

08007b7c <vPortEnterCritical>:
 8007b7c:	b480      	push	{r7}
 8007b7e:	b083      	sub	sp, #12
 8007b80:	af00      	add	r7, sp, #0
 8007b82:	f04f 0350 	mov.w	r3, #80	; 0x50
 8007b86:	f383 8811 	msr	BASEPRI, r3
 8007b8a:	f3bf 8f6f 	isb	sy
 8007b8e:	f3bf 8f4f 	dsb	sy
 8007b92:	607b      	str	r3, [r7, #4]
 8007b94:	4b0e      	ldr	r3, [pc, #56]	; (8007bd0 <vPortEnterCritical+0x54>)
 8007b96:	681b      	ldr	r3, [r3, #0]
 8007b98:	3301      	adds	r3, #1
 8007b9a:	4a0d      	ldr	r2, [pc, #52]	; (8007bd0 <vPortEnterCritical+0x54>)
 8007b9c:	6013      	str	r3, [r2, #0]
 8007b9e:	4b0c      	ldr	r3, [pc, #48]	; (8007bd0 <vPortEnterCritical+0x54>)
 8007ba0:	681b      	ldr	r3, [r3, #0]
 8007ba2:	2b01      	cmp	r3, #1
 8007ba4:	d10e      	bne.n	8007bc4 <vPortEnterCritical+0x48>
 8007ba6:	4b0b      	ldr	r3, [pc, #44]	; (8007bd4 <vPortEnterCritical+0x58>)
 8007ba8:	681b      	ldr	r3, [r3, #0]
 8007baa:	b2db      	uxtb	r3, r3
 8007bac:	2b00      	cmp	r3, #0
 8007bae:	d009      	beq.n	8007bc4 <vPortEnterCritical+0x48>
 8007bb0:	f04f 0350 	mov.w	r3, #80	; 0x50
 8007bb4:	f383 8811 	msr	BASEPRI, r3
 8007bb8:	f3bf 8f6f 	isb	sy
 8007bbc:	f3bf 8f4f 	dsb	sy
 8007bc0:	603b      	str	r3, [r7, #0]
 8007bc2:	e7fe      	b.n	8007bc2 <vPortEnterCritical+0x46>
 8007bc4:	bf00      	nop
 8007bc6:	370c      	adds	r7, #12
 8007bc8:	46bd      	mov	sp, r7
 8007bca:	f85d 7b04 	ldr.w	r7, [sp], #4
 8007bce:	4770      	bx	lr
 8007bd0:	20000078 	.word	0x20000078
 8007bd4:	e000ed04 	.word	0xe000ed04

08007bd8 <vPortExitCritical>:
 8007bd8:	b480      	push	{r7}
 8007bda:	b083      	sub	sp, #12
 8007bdc:	af00      	add	r7, sp, #0
 8007bde:	4b11      	ldr	r3, [pc, #68]	; (8007c24 <vPortExitCritical+0x4c>)
 8007be0:	681b      	ldr	r3, [r3, #0]
 8007be2:	2b00      	cmp	r3, #0
 8007be4:	d109      	bne.n	8007bfa <vPortExitCritical+0x22>
 8007be6:	f04f 0350 	mov.w	r3, #80	; 0x50
 8007bea:	f383 8811 	msr	BASEPRI, r3
 8007bee:	f3bf 8f6f 	isb	sy
 8007bf2:	f3bf 8f4f 	dsb	sy
 8007bf6:	607b      	str	r3, [r7, #4]
 8007bf8:	e7fe      	b.n	8007bf8 <vPortExitCritical+0x20>
 8007bfa:	4b0a      	ldr	r3, [pc, #40]	; (8007c24 <vPortExitCritical+0x4c>)
 8007bfc:	681b      	ldr	r3, [r3, #0]
 8007bfe:	3b01      	subs	r3, #1
 8007c00:	4a08      	ldr	r2, [pc, #32]	; (8007c24 <vPortExitCritical+0x4c>)
 8007c02:	6013      	str	r3, [r2, #0]
 8007c04:	4b07      	ldr	r3, [pc, #28]	; (8007c24 <vPortExitCritical+0x4c>)
 8007c06:	681b      	ldr	r3, [r3, #0]
 8007c08:	2b00      	cmp	r3, #0
 8007c0a:	d104      	bne.n	8007c16 <vPortExitCritical+0x3e>
 8007c0c:	2300      	movs	r3, #0
 8007c0e:	603b      	str	r3, [r7, #0]
 8007c10:	683b      	ldr	r3, [r7, #0]
 8007c12:	f383 8811 	msr	BASEPRI, r3
 8007c16:	bf00      	nop
 8007c18:	370c      	adds	r7, #12
 8007c1a:	46bd      	mov	sp, r7
 8007c1c:	f85d 7b04 	ldr.w	r7, [sp], #4
 8007c20:	4770      	bx	lr
 8007c22:	bf00      	nop
 8007c24:	20000078 	.word	0x20000078
	...

08007c30 <PendSV_Handler>:
 8007c30:	f3ef 8009 	mrs	r0, PSP
 8007c34:	f3bf 8f6f 	isb	sy
 8007c38:	4b15      	ldr	r3, [pc, #84]	; (8007c90 <pxCurrentTCBConst>)
 8007c3a:	681a      	ldr	r2, [r3, #0]
 8007c3c:	f01e 0f10 	tst.w	lr, #16
 8007c40:	bf08      	it	eq
 8007c42:	ed20 8a10 	vstmdbeq	r0!, {s16-s31}
 8007c46:	e920 4ff0 	stmdb	r0!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8007c4a:	6010      	str	r0, [r2, #0]
 8007c4c:	e92d 0009 	stmdb	sp!, {r0, r3}
 8007c50:	f04f 0050 	mov.w	r0, #80	; 0x50
 8007c54:	f380 8811 	msr	BASEPRI, r0
 8007c58:	f3bf 8f4f 	dsb	sy
 8007c5c:	f3bf 8f6f 	isb	sy
 8007c60:	f7fe fd08 	bl	8006674 <vTaskSwitchContext>
 8007c64:	f04f 0000 	mov.w	r0, #0
 8007c68:	f380 8811 	msr	BASEPRI, r0
 8007c6c:	bc09      	pop	{r0, r3}
 8007c6e:	6819      	ldr	r1, [r3, #0]
 8007c70:	6808      	ldr	r0, [r1, #0]
 8007c72:	e8b0 4ff0 	ldmia.w	r0!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8007c76:	f01e 0f10 	tst.w	lr, #16
 8007c7a:	bf08      	it	eq
 8007c7c:	ecb0 8a10 	vldmiaeq	r0!, {s16-s31}
 8007c80:	f380 8809 	msr	PSP, r0
 8007c84:	f3bf 8f6f 	isb	sy
 8007c88:	4770      	bx	lr
 8007c8a:	bf00      	nop
 8007c8c:	f3af 8000 	nop.w

08007c90 <pxCurrentTCBConst>:
 8007c90:	20000bc4 	.word	0x20000bc4
 8007c94:	bf00      	nop
 8007c96:	bf00      	nop

08007c98 <SysTick_Handler>:
 8007c98:	b580      	push	{r7, lr}
 8007c9a:	b082      	sub	sp, #8
 8007c9c:	af00      	add	r7, sp, #0
 8007c9e:	f04f 0350 	mov.w	r3, #80	; 0x50
 8007ca2:	f383 8811 	msr	BASEPRI, r3
 8007ca6:	f3bf 8f6f 	isb	sy
 8007caa:	f3bf 8f4f 	dsb	sy
 8007cae:	607b      	str	r3, [r7, #4]
 8007cb0:	f7fe fc20 	bl	80064f4 <xTaskIncrementTick>
 8007cb4:	4603      	mov	r3, r0
 8007cb6:	2b00      	cmp	r3, #0
 8007cb8:	d003      	beq.n	8007cc2 <SysTick_Handler+0x2a>
 8007cba:	4b06      	ldr	r3, [pc, #24]	; (8007cd4 <SysTick_Handler+0x3c>)
 8007cbc:	f04f 5280 	mov.w	r2, #268435456	; 0x10000000
 8007cc0:	601a      	str	r2, [r3, #0]
 8007cc2:	2300      	movs	r3, #0
 8007cc4:	603b      	str	r3, [r7, #0]
 8007cc6:	683b      	ldr	r3, [r7, #0]
 8007cc8:	f383 8811 	msr	BASEPRI, r3
 8007ccc:	bf00      	nop
 8007cce:	3708      	adds	r7, #8
 8007cd0:	46bd      	mov	sp, r7
 8007cd2:	bd80      	pop	{r7, pc}
 8007cd4:	e000ed04 	.word	0xe000ed04

08007cd8 <vPortSetupTimerInterrupt>:
 8007cd8:	b480      	push	{r7}
 8007cda:	af00      	add	r7, sp, #0
 8007cdc:	4b0b      	ldr	r3, [pc, #44]	; (8007d0c <vPortSetupTimerInterrupt+0x34>)
 8007cde:	2200      	movs	r2, #0
 8007ce0:	601a      	str	r2, [r3, #0]
 8007ce2:	4b0b      	ldr	r3, [pc, #44]	; (8007d10 <vPortSetupTimerInterrupt+0x38>)
 8007ce4:	2200      	movs	r2, #0
 8007ce6:	601a      	str	r2, [r3, #0]
 8007ce8:	4b0a      	ldr	r3, [pc, #40]	; (8007d14 <vPortSetupTimerInterrupt+0x3c>)
 8007cea:	681b      	ldr	r3, [r3, #0]
 8007cec:	4a0a      	ldr	r2, [pc, #40]	; (8007d18 <vPortSetupTimerInterrupt+0x40>)
 8007cee:	fba2 2303 	umull	r2, r3, r2, r3
 8007cf2:	099b      	lsrs	r3, r3, #6
 8007cf4:	4a09      	ldr	r2, [pc, #36]	; (8007d1c <vPortSetupTimerInterrupt+0x44>)
 8007cf6:	3b01      	subs	r3, #1
 8007cf8:	6013      	str	r3, [r2, #0]
 8007cfa:	4b04      	ldr	r3, [pc, #16]	; (8007d0c <vPortSetupTimerInterrupt+0x34>)
 8007cfc:	2207      	movs	r2, #7
 8007cfe:	601a      	str	r2, [r3, #0]
 8007d00:	bf00      	nop
 8007d02:	46bd      	mov	sp, r7
 8007d04:	f85d 7b04 	ldr.w	r7, [sp], #4
 8007d08:	4770      	bx	lr
 8007d0a:	bf00      	nop
 8007d0c:	e000e010 	.word	0xe000e010
 8007d10:	e000e018 	.word	0xe000e018
 8007d14:	2000007c 	.word	0x2000007c
 8007d18:	10624dd3 	.word	0x10624dd3
 8007d1c:	e000e014 	.word	0xe000e014

08007d20 <vPortEnableVFP>:
 8007d20:	f8df 000c 	ldr.w	r0, [pc, #12]	; 8007d30 <vPortEnableVFP+0x10>
 8007d24:	6801      	ldr	r1, [r0, #0]
 8007d26:	f441 0170 	orr.w	r1, r1, #15728640	; 0xf00000
 8007d2a:	6001      	str	r1, [r0, #0]
 8007d2c:	4770      	bx	lr
 8007d2e:	bf00      	nop
 8007d30:	e000ed88 	.word	0xe000ed88

08007d34 <vPortValidateInterruptPriority>:
 8007d34:	b480      	push	{r7}
 8007d36:	b085      	sub	sp, #20
 8007d38:	af00      	add	r7, sp, #0
 8007d3a:	f3ef 8305 	mrs	r3, IPSR
 8007d3e:	60fb      	str	r3, [r7, #12]
 8007d40:	68fb      	ldr	r3, [r7, #12]
 8007d42:	2b0f      	cmp	r3, #15
 8007d44:	d913      	bls.n	8007d6e <vPortValidateInterruptPriority+0x3a>
 8007d46:	4a16      	ldr	r2, [pc, #88]	; (8007da0 <vPortValidateInterruptPriority+0x6c>)
 8007d48:	68fb      	ldr	r3, [r7, #12]
 8007d4a:	4413      	add	r3, r2
 8007d4c:	781b      	ldrb	r3, [r3, #0]
 8007d4e:	72fb      	strb	r3, [r7, #11]
 8007d50:	4b14      	ldr	r3, [pc, #80]	; (8007da4 <vPortValidateInterruptPriority+0x70>)
 8007d52:	781b      	ldrb	r3, [r3, #0]
 8007d54:	7afa      	ldrb	r2, [r7, #11]
 8007d56:	429a      	cmp	r2, r3
 8007d58:	d209      	bcs.n	8007d6e <vPortValidateInterruptPriority+0x3a>
 8007d5a:	f04f 0350 	mov.w	r3, #80	; 0x50
 8007d5e:	f383 8811 	msr	BASEPRI, r3
 8007d62:	f3bf 8f6f 	isb	sy
 8007d66:	f3bf 8f4f 	dsb	sy
 8007d6a:	607b      	str	r3, [r7, #4]
 8007d6c:	e7fe      	b.n	8007d6c <vPortValidateInterruptPriority+0x38>
 8007d6e:	4b0e      	ldr	r3, [pc, #56]	; (8007da8 <vPortValidateInterruptPriority+0x74>)
 8007d70:	681b      	ldr	r3, [r3, #0]
 8007d72:	f403 62e0 	and.w	r2, r3, #1792	; 0x700
 8007d76:	4b0d      	ldr	r3, [pc, #52]	; (8007dac <vPortValidateInterruptPriority+0x78>)
 8007d78:	681b      	ldr	r3, [r3, #0]
 8007d7a:	429a      	cmp	r2, r3
 8007d7c:	d909      	bls.n	8007d92 <vPortValidateInterruptPriority+0x5e>
 8007d7e:	f04f 0350 	mov.w	r3, #80	; 0x50
 8007d82:	f383 8811 	msr	BASEPRI, r3
 8007d86:	f3bf 8f6f 	isb	sy
 8007d8a:	f3bf 8f4f 	dsb	sy
 8007d8e:	603b      	str	r3, [r7, #0]
 8007d90:	e7fe      	b.n	8007d90 <vPortValidateInterruptPriority+0x5c>
 8007d92:	bf00      	nop
 8007d94:	3714      	adds	r7, #20
 8007d96:	46bd      	mov	sp, r7
 8007d98:	f85d 7b04 	ldr.w	r7, [sp], #4
 8007d9c:	4770      	bx	lr
 8007d9e:	bf00      	nop
 8007da0:	e000e3f0 	.word	0xe000e3f0
 8007da4:	20000dcc 	.word	0x20000dcc
 8007da8:	e000ed0c 	.word	0xe000ed0c
 8007dac:	20000dd0 	.word	0x20000dd0

08007db0 <pvPortMalloc>:
 8007db0:	b580      	push	{r7, lr}
 8007db2:	b08a      	sub	sp, #40	; 0x28
 8007db4:	af00      	add	r7, sp, #0
 8007db6:	6078      	str	r0, [r7, #4]
 8007db8:	2300      	movs	r3, #0
 8007dba:	61fb      	str	r3, [r7, #28]
 8007dbc:	f7fe face 	bl	800635c <vTaskSuspendAll>
 8007dc0:	4b59      	ldr	r3, [pc, #356]	; (8007f28 <pvPortMalloc+0x178>)
 8007dc2:	681b      	ldr	r3, [r3, #0]
 8007dc4:	2b00      	cmp	r3, #0
 8007dc6:	d101      	bne.n	8007dcc <pvPortMalloc+0x1c>
 8007dc8:	f000 f910 	bl	8007fec <prvHeapInit>
 8007dcc:	4b57      	ldr	r3, [pc, #348]	; (8007f2c <pvPortMalloc+0x17c>)
 8007dce:	681a      	ldr	r2, [r3, #0]
 8007dd0:	687b      	ldr	r3, [r7, #4]
 8007dd2:	4013      	ands	r3, r2
 8007dd4:	2b00      	cmp	r3, #0
 8007dd6:	f040 808c 	bne.w	8007ef2 <pvPortMalloc+0x142>
 8007dda:	687b      	ldr	r3, [r7, #4]
 8007ddc:	2b00      	cmp	r3, #0
 8007dde:	d01c      	beq.n	8007e1a <pvPortMalloc+0x6a>
 8007de0:	2208      	movs	r2, #8
 8007de2:	687b      	ldr	r3, [r7, #4]
 8007de4:	4413      	add	r3, r2
 8007de6:	607b      	str	r3, [r7, #4]
 8007de8:	687b      	ldr	r3, [r7, #4]
 8007dea:	f003 0307 	and.w	r3, r3, #7
 8007dee:	2b00      	cmp	r3, #0
 8007df0:	d013      	beq.n	8007e1a <pvPortMalloc+0x6a>
 8007df2:	687b      	ldr	r3, [r7, #4]
 8007df4:	f023 0307 	bic.w	r3, r3, #7
 8007df8:	3308      	adds	r3, #8
 8007dfa:	607b      	str	r3, [r7, #4]
 8007dfc:	687b      	ldr	r3, [r7, #4]
 8007dfe:	f003 0307 	and.w	r3, r3, #7
 8007e02:	2b00      	cmp	r3, #0
 8007e04:	d009      	beq.n	8007e1a <pvPortMalloc+0x6a>
 8007e06:	f04f 0350 	mov.w	r3, #80	; 0x50
 8007e0a:	f383 8811 	msr	BASEPRI, r3
 8007e0e:	f3bf 8f6f 	isb	sy
 8007e12:	f3bf 8f4f 	dsb	sy
 8007e16:	617b      	str	r3, [r7, #20]
 8007e18:	e7fe      	b.n	8007e18 <pvPortMalloc+0x68>
 8007e1a:	687b      	ldr	r3, [r7, #4]
 8007e1c:	2b00      	cmp	r3, #0
 8007e1e:	d068      	beq.n	8007ef2 <pvPortMalloc+0x142>
 8007e20:	4b43      	ldr	r3, [pc, #268]	; (8007f30 <pvPortMalloc+0x180>)
 8007e22:	681b      	ldr	r3, [r3, #0]
 8007e24:	687a      	ldr	r2, [r7, #4]
 8007e26:	429a      	cmp	r2, r3
 8007e28:	d863      	bhi.n	8007ef2 <pvPortMalloc+0x142>
 8007e2a:	4b42      	ldr	r3, [pc, #264]	; (8007f34 <pvPortMalloc+0x184>)
 8007e2c:	623b      	str	r3, [r7, #32]
 8007e2e:	4b41      	ldr	r3, [pc, #260]	; (8007f34 <pvPortMalloc+0x184>)
 8007e30:	681b      	ldr	r3, [r3, #0]
 8007e32:	627b      	str	r3, [r7, #36]	; 0x24
 8007e34:	e004      	b.n	8007e40 <pvPortMalloc+0x90>
 8007e36:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8007e38:	623b      	str	r3, [r7, #32]
 8007e3a:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8007e3c:	681b      	ldr	r3, [r3, #0]
 8007e3e:	627b      	str	r3, [r7, #36]	; 0x24
 8007e40:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8007e42:	685b      	ldr	r3, [r3, #4]
 8007e44:	687a      	ldr	r2, [r7, #4]
 8007e46:	429a      	cmp	r2, r3
 8007e48:	d903      	bls.n	8007e52 <pvPortMalloc+0xa2>
 8007e4a:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8007e4c:	681b      	ldr	r3, [r3, #0]
 8007e4e:	2b00      	cmp	r3, #0
 8007e50:	d1f1      	bne.n	8007e36 <pvPortMalloc+0x86>
 8007e52:	4b35      	ldr	r3, [pc, #212]	; (8007f28 <pvPortMalloc+0x178>)
 8007e54:	681b      	ldr	r3, [r3, #0]
 8007e56:	6a7a      	ldr	r2, [r7, #36]	; 0x24
 8007e58:	429a      	cmp	r2, r3
 8007e5a:	d04a      	beq.n	8007ef2 <pvPortMalloc+0x142>
 8007e5c:	6a3b      	ldr	r3, [r7, #32]
 8007e5e:	681b      	ldr	r3, [r3, #0]
 8007e60:	2208      	movs	r2, #8
 8007e62:	4413      	add	r3, r2
 8007e64:	61fb      	str	r3, [r7, #28]
 8007e66:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8007e68:	681a      	ldr	r2, [r3, #0]
 8007e6a:	6a3b      	ldr	r3, [r7, #32]
 8007e6c:	601a      	str	r2, [r3, #0]
 8007e6e:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8007e70:	685a      	ldr	r2, [r3, #4]
 8007e72:	687b      	ldr	r3, [r7, #4]
 8007e74:	1ad2      	subs	r2, r2, r3
 8007e76:	2308      	movs	r3, #8
 8007e78:	005b      	lsls	r3, r3, #1
 8007e7a:	429a      	cmp	r2, r3
 8007e7c:	d91e      	bls.n	8007ebc <pvPortMalloc+0x10c>
 8007e7e:	6a7a      	ldr	r2, [r7, #36]	; 0x24
 8007e80:	687b      	ldr	r3, [r7, #4]
 8007e82:	4413      	add	r3, r2
 8007e84:	61bb      	str	r3, [r7, #24]
 8007e86:	69bb      	ldr	r3, [r7, #24]
 8007e88:	f003 0307 	and.w	r3, r3, #7
 8007e8c:	2b00      	cmp	r3, #0
 8007e8e:	d009      	beq.n	8007ea4 <pvPortMalloc+0xf4>
 8007e90:	f04f 0350 	mov.w	r3, #80	; 0x50
 8007e94:	f383 8811 	msr	BASEPRI, r3
 8007e98:	f3bf 8f6f 	isb	sy
 8007e9c:	f3bf 8f4f 	dsb	sy
 8007ea0:	613b      	str	r3, [r7, #16]
 8007ea2:	e7fe      	b.n	8007ea2 <pvPortMalloc+0xf2>
 8007ea4:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8007ea6:	685a      	ldr	r2, [r3, #4]
 8007ea8:	687b      	ldr	r3, [r7, #4]
 8007eaa:	1ad2      	subs	r2, r2, r3
 8007eac:	69bb      	ldr	r3, [r7, #24]
 8007eae:	605a      	str	r2, [r3, #4]
 8007eb0:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8007eb2:	687a      	ldr	r2, [r7, #4]
 8007eb4:	605a      	str	r2, [r3, #4]
 8007eb6:	69b8      	ldr	r0, [r7, #24]
 8007eb8:	f000 f8fa 	bl	80080b0 <prvInsertBlockIntoFreeList>
 8007ebc:	4b1c      	ldr	r3, [pc, #112]	; (8007f30 <pvPortMalloc+0x180>)
 8007ebe:	681a      	ldr	r2, [r3, #0]
 8007ec0:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8007ec2:	685b      	ldr	r3, [r3, #4]
 8007ec4:	1ad3      	subs	r3, r2, r3
 8007ec6:	4a1a      	ldr	r2, [pc, #104]	; (8007f30 <pvPortMalloc+0x180>)
 8007ec8:	6013      	str	r3, [r2, #0]
 8007eca:	4b19      	ldr	r3, [pc, #100]	; (8007f30 <pvPortMalloc+0x180>)
 8007ecc:	681a      	ldr	r2, [r3, #0]
 8007ece:	4b1a      	ldr	r3, [pc, #104]	; (8007f38 <pvPortMalloc+0x188>)
 8007ed0:	681b      	ldr	r3, [r3, #0]
 8007ed2:	429a      	cmp	r2, r3
 8007ed4:	d203      	bcs.n	8007ede <pvPortMalloc+0x12e>
 8007ed6:	4b16      	ldr	r3, [pc, #88]	; (8007f30 <pvPortMalloc+0x180>)
 8007ed8:	681b      	ldr	r3, [r3, #0]
 8007eda:	4a17      	ldr	r2, [pc, #92]	; (8007f38 <pvPortMalloc+0x188>)
 8007edc:	6013      	str	r3, [r2, #0]
 8007ede:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8007ee0:	685a      	ldr	r2, [r3, #4]
 8007ee2:	4b12      	ldr	r3, [pc, #72]	; (8007f2c <pvPortMalloc+0x17c>)
 8007ee4:	681b      	ldr	r3, [r3, #0]
 8007ee6:	431a      	orrs	r2, r3
 8007ee8:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8007eea:	605a      	str	r2, [r3, #4]
 8007eec:	6a7b      	ldr	r3, [r7, #36]	; 0x24
 8007eee:	2200      	movs	r2, #0
 8007ef0:	601a      	str	r2, [r3, #0]
 8007ef2:	f7fe fa41 	bl	8006378 <xTaskResumeAll>
 8007ef6:	69fb      	ldr	r3, [r7, #28]
 8007ef8:	2b00      	cmp	r3, #0
 8007efa:	d101      	bne.n	8007f00 <pvPortMalloc+0x150>
 8007efc:	f7fb fa3a 	bl	8003374 <vApplicationMallocFailedHook>
 8007f00:	69fb      	ldr	r3, [r7, #28]
 8007f02:	f003 0307 	and.w	r3, r3, #7
 8007f06:	2b00      	cmp	r3, #0
 8007f08:	d009      	beq.n	8007f1e <pvPortMalloc+0x16e>
 8007f0a:	f04f 0350 	mov.w	r3, #80	; 0x50
 8007f0e:	f383 8811 	msr	BASEPRI, r3
 8007f12:	f3bf 8f6f 	isb	sy
 8007f16:	f3bf 8f4f 	dsb	sy
 8007f1a:	60fb      	str	r3, [r7, #12]
 8007f1c:	e7fe      	b.n	8007f1c <pvPortMalloc+0x16c>
 8007f1e:	69fb      	ldr	r3, [r7, #28]
 8007f20:	4618      	mov	r0, r3
 8007f22:	3728      	adds	r7, #40	; 0x28
 8007f24:	46bd      	mov	sp, r7
 8007f26:	bd80      	pop	{r7, pc}
 8007f28:	200139dc 	.word	0x200139dc
 8007f2c:	200139e8 	.word	0x200139e8
 8007f30:	200139e0 	.word	0x200139e0
 8007f34:	200139d4 	.word	0x200139d4
 8007f38:	200139e4 	.word	0x200139e4

08007f3c <vPortFree>:
 8007f3c:	b580      	push	{r7, lr}
 8007f3e:	b086      	sub	sp, #24
 8007f40:	af00      	add	r7, sp, #0
 8007f42:	6078      	str	r0, [r7, #4]
 8007f44:	687b      	ldr	r3, [r7, #4]
 8007f46:	617b      	str	r3, [r7, #20]
 8007f48:	687b      	ldr	r3, [r7, #4]
 8007f4a:	2b00      	cmp	r3, #0
 8007f4c:	d046      	beq.n	8007fdc <vPortFree+0xa0>
 8007f4e:	2308      	movs	r3, #8
 8007f50:	425b      	negs	r3, r3
 8007f52:	697a      	ldr	r2, [r7, #20]
 8007f54:	4413      	add	r3, r2
 8007f56:	617b      	str	r3, [r7, #20]
 8007f58:	697b      	ldr	r3, [r7, #20]
 8007f5a:	613b      	str	r3, [r7, #16]
 8007f5c:	693b      	ldr	r3, [r7, #16]
 8007f5e:	685a      	ldr	r2, [r3, #4]
 8007f60:	4b20      	ldr	r3, [pc, #128]	; (8007fe4 <vPortFree+0xa8>)
 8007f62:	681b      	ldr	r3, [r3, #0]
 8007f64:	4013      	ands	r3, r2
 8007f66:	2b00      	cmp	r3, #0
 8007f68:	d109      	bne.n	8007f7e <vPortFree+0x42>
 8007f6a:	f04f 0350 	mov.w	r3, #80	; 0x50
 8007f6e:	f383 8811 	msr	BASEPRI, r3
 8007f72:	f3bf 8f6f 	isb	sy
 8007f76:	f3bf 8f4f 	dsb	sy
 8007f7a:	60fb      	str	r3, [r7, #12]
 8007f7c:	e7fe      	b.n	8007f7c <vPortFree+0x40>
 8007f7e:	693b      	ldr	r3, [r7, #16]
 8007f80:	681b      	ldr	r3, [r3, #0]
 8007f82:	2b00      	cmp	r3, #0
 8007f84:	d009      	beq.n	8007f9a <vPortFree+0x5e>
 8007f86:	f04f 0350 	mov.w	r3, #80	; 0x50
 8007f8a:	f383 8811 	msr	BASEPRI, r3
 8007f8e:	f3bf 8f6f 	isb	sy
 8007f92:	f3bf 8f4f 	dsb	sy
 8007f96:	60bb      	str	r3, [r7, #8]
 8007f98:	e7fe      	b.n	8007f98 <vPortFree+0x5c>
 8007f9a:	693b      	ldr	r3, [r7, #16]
 8007f9c:	685a      	ldr	r2, [r3, #4]
 8007f9e:	4b11      	ldr	r3, [pc, #68]	; (8007fe4 <vPortFree+0xa8>)
 8007fa0:	681b      	ldr	r3, [r3, #0]
 8007fa2:	4013      	ands	r3, r2
 8007fa4:	2b00      	cmp	r3, #0
 8007fa6:	d019      	beq.n	8007fdc <vPortFree+0xa0>
 8007fa8:	693b      	ldr	r3, [r7, #16]
 8007faa:	681b      	ldr	r3, [r3, #0]
 8007fac:	2b00      	cmp	r3, #0
 8007fae:	d115      	bne.n	8007fdc <vPortFree+0xa0>
 8007fb0:	693b      	ldr	r3, [r7, #16]
 8007fb2:	685a      	ldr	r2, [r3, #4]
 8007fb4:	4b0b      	ldr	r3, [pc, #44]	; (8007fe4 <vPortFree+0xa8>)
 8007fb6:	681b      	ldr	r3, [r3, #0]
 8007fb8:	43db      	mvns	r3, r3
 8007fba:	401a      	ands	r2, r3
 8007fbc:	693b      	ldr	r3, [r7, #16]
 8007fbe:	605a      	str	r2, [r3, #4]
 8007fc0:	f7fe f9cc 	bl	800635c <vTaskSuspendAll>
 8007fc4:	693b      	ldr	r3, [r7, #16]
 8007fc6:	685a      	ldr	r2, [r3, #4]
 8007fc8:	4b07      	ldr	r3, [pc, #28]	; (8007fe8 <vPortFree+0xac>)
 8007fca:	681b      	ldr	r3, [r3, #0]
 8007fcc:	4413      	add	r3, r2
 8007fce:	4a06      	ldr	r2, [pc, #24]	; (8007fe8 <vPortFree+0xac>)
 8007fd0:	6013      	str	r3, [r2, #0]
 8007fd2:	6938      	ldr	r0, [r7, #16]
 8007fd4:	f000 f86c 	bl	80080b0 <prvInsertBlockIntoFreeList>
 8007fd8:	f7fe f9ce 	bl	8006378 <xTaskResumeAll>
 8007fdc:	bf00      	nop
 8007fde:	3718      	adds	r7, #24
 8007fe0:	46bd      	mov	sp, r7
 8007fe2:	bd80      	pop	{r7, pc}
 8007fe4:	200139e8 	.word	0x200139e8
 8007fe8:	200139e0 	.word	0x200139e0

08007fec <prvHeapInit>:
 8007fec:	b480      	push	{r7}
 8007fee:	b085      	sub	sp, #20
 8007ff0:	af00      	add	r7, sp, #0
 8007ff2:	f44f 3396 	mov.w	r3, #76800	; 0x12c00
 8007ff6:	60bb      	str	r3, [r7, #8]
 8007ff8:	4b27      	ldr	r3, [pc, #156]	; (8008098 <prvHeapInit+0xac>)
 8007ffa:	60fb      	str	r3, [r7, #12]
 8007ffc:	68fb      	ldr	r3, [r7, #12]
 8007ffe:	f003 0307 	and.w	r3, r3, #7
 8008002:	2b00      	cmp	r3, #0
 8008004:	d00c      	beq.n	8008020 <prvHeapInit+0x34>
 8008006:	68fb      	ldr	r3, [r7, #12]
 8008008:	3307      	adds	r3, #7
 800800a:	60fb      	str	r3, [r7, #12]
 800800c:	68fb      	ldr	r3, [r7, #12]
 800800e:	f023 0307 	bic.w	r3, r3, #7
 8008012:	60fb      	str	r3, [r7, #12]
 8008014:	68ba      	ldr	r2, [r7, #8]
 8008016:	68fb      	ldr	r3, [r7, #12]
 8008018:	1ad3      	subs	r3, r2, r3
 800801a:	4a1f      	ldr	r2, [pc, #124]	; (8008098 <prvHeapInit+0xac>)
 800801c:	4413      	add	r3, r2
 800801e:	60bb      	str	r3, [r7, #8]
 8008020:	68fb      	ldr	r3, [r7, #12]
 8008022:	607b      	str	r3, [r7, #4]
 8008024:	4a1d      	ldr	r2, [pc, #116]	; (800809c <prvHeapInit+0xb0>)
 8008026:	687b      	ldr	r3, [r7, #4]
 8008028:	6013      	str	r3, [r2, #0]
 800802a:	4b1c      	ldr	r3, [pc, #112]	; (800809c <prvHeapInit+0xb0>)
 800802c:	2200      	movs	r2, #0
 800802e:	605a      	str	r2, [r3, #4]
 8008030:	687b      	ldr	r3, [r7, #4]
 8008032:	68ba      	ldr	r2, [r7, #8]
 8008034:	4413      	add	r3, r2
 8008036:	60fb      	str	r3, [r7, #12]
 8008038:	2208      	movs	r2, #8
 800803a:	68fb      	ldr	r3, [r7, #12]
 800803c:	1a9b      	subs	r3, r3, r2
 800803e:	60fb      	str	r3, [r7, #12]
 8008040:	68fb      	ldr	r3, [r7, #12]
 8008042:	f023 0307 	bic.w	r3, r3, #7
 8008046:	60fb      	str	r3, [r7, #12]
 8008048:	68fb      	ldr	r3, [r7, #12]
 800804a:	4a15      	ldr	r2, [pc, #84]	; (80080a0 <prvHeapInit+0xb4>)
 800804c:	6013      	str	r3, [r2, #0]
 800804e:	4b14      	ldr	r3, [pc, #80]	; (80080a0 <prvHeapInit+0xb4>)
 8008050:	681b      	ldr	r3, [r3, #0]
 8008052:	2200      	movs	r2, #0
 8008054:	605a      	str	r2, [r3, #4]
 8008056:	4b12      	ldr	r3, [pc, #72]	; (80080a0 <prvHeapInit+0xb4>)
 8008058:	681b      	ldr	r3, [r3, #0]
 800805a:	2200      	movs	r2, #0
 800805c:	601a      	str	r2, [r3, #0]
 800805e:	687b      	ldr	r3, [r7, #4]
 8008060:	603b      	str	r3, [r7, #0]
 8008062:	683b      	ldr	r3, [r7, #0]
 8008064:	68fa      	ldr	r2, [r7, #12]
 8008066:	1ad2      	subs	r2, r2, r3
 8008068:	683b      	ldr	r3, [r7, #0]
 800806a:	605a      	str	r2, [r3, #4]
 800806c:	4b0c      	ldr	r3, [pc, #48]	; (80080a0 <prvHeapInit+0xb4>)
 800806e:	681a      	ldr	r2, [r3, #0]
 8008070:	683b      	ldr	r3, [r7, #0]
 8008072:	601a      	str	r2, [r3, #0]
 8008074:	683b      	ldr	r3, [r7, #0]
 8008076:	685b      	ldr	r3, [r3, #4]
 8008078:	4a0a      	ldr	r2, [pc, #40]	; (80080a4 <prvHeapInit+0xb8>)
 800807a:	6013      	str	r3, [r2, #0]
 800807c:	683b      	ldr	r3, [r7, #0]
 800807e:	685b      	ldr	r3, [r3, #4]
 8008080:	4a09      	ldr	r2, [pc, #36]	; (80080a8 <prvHeapInit+0xbc>)
 8008082:	6013      	str	r3, [r2, #0]
 8008084:	4b09      	ldr	r3, [pc, #36]	; (80080ac <prvHeapInit+0xc0>)
 8008086:	f04f 4200 	mov.w	r2, #2147483648	; 0x80000000
 800808a:	601a      	str	r2, [r3, #0]
 800808c:	bf00      	nop
 800808e:	3714      	adds	r7, #20
 8008090:	46bd      	mov	sp, r7
 8008092:	f85d 7b04 	ldr.w	r7, [sp], #4
 8008096:	4770      	bx	lr
 8008098:	20000dd4 	.word	0x20000dd4
 800809c:	200139d4 	.word	0x200139d4
 80080a0:	200139dc 	.word	0x200139dc
 80080a4:	200139e4 	.word	0x200139e4
 80080a8:	200139e0 	.word	0x200139e0
 80080ac:	200139e8 	.word	0x200139e8

080080b0 <prvInsertBlockIntoFreeList>:
 80080b0:	b480      	push	{r7}
 80080b2:	b085      	sub	sp, #20
 80080b4:	af00      	add	r7, sp, #0
 80080b6:	6078      	str	r0, [r7, #4]
 80080b8:	4b28      	ldr	r3, [pc, #160]	; (800815c <prvInsertBlockIntoFreeList+0xac>)
 80080ba:	60fb      	str	r3, [r7, #12]
 80080bc:	e002      	b.n	80080c4 <prvInsertBlockIntoFreeList+0x14>
 80080be:	68fb      	ldr	r3, [r7, #12]
 80080c0:	681b      	ldr	r3, [r3, #0]
 80080c2:	60fb      	str	r3, [r7, #12]
 80080c4:	68fb      	ldr	r3, [r7, #12]
 80080c6:	681b      	ldr	r3, [r3, #0]
 80080c8:	687a      	ldr	r2, [r7, #4]
 80080ca:	429a      	cmp	r2, r3
 80080cc:	d8f7      	bhi.n	80080be <prvInsertBlockIntoFreeList+0xe>
 80080ce:	68fb      	ldr	r3, [r7, #12]
 80080d0:	60bb      	str	r3, [r7, #8]
 80080d2:	68fb      	ldr	r3, [r7, #12]
 80080d4:	685b      	ldr	r3, [r3, #4]
 80080d6:	68ba      	ldr	r2, [r7, #8]
 80080d8:	4413      	add	r3, r2
 80080da:	687a      	ldr	r2, [r7, #4]
 80080dc:	429a      	cmp	r2, r3
 80080de:	d108      	bne.n	80080f2 <prvInsertBlockIntoFreeList+0x42>
 80080e0:	68fb      	ldr	r3, [r7, #12]
 80080e2:	685a      	ldr	r2, [r3, #4]
 80080e4:	687b      	ldr	r3, [r7, #4]
 80080e6:	685b      	ldr	r3, [r3, #4]
 80080e8:	441a      	add	r2, r3
 80080ea:	68fb      	ldr	r3, [r7, #12]
 80080ec:	605a      	str	r2, [r3, #4]
 80080ee:	68fb      	ldr	r3, [r7, #12]
 80080f0:	607b      	str	r3, [r7, #4]
 80080f2:	687b      	ldr	r3, [r7, #4]
 80080f4:	60bb      	str	r3, [r7, #8]
 80080f6:	687b      	ldr	r3, [r7, #4]
 80080f8:	685b      	ldr	r3, [r3, #4]
 80080fa:	68ba      	ldr	r2, [r7, #8]
 80080fc:	441a      	add	r2, r3
 80080fe:	68fb      	ldr	r3, [r7, #12]
 8008100:	681b      	ldr	r3, [r3, #0]
 8008102:	429a      	cmp	r2, r3
 8008104:	d118      	bne.n	8008138 <prvInsertBlockIntoFreeList+0x88>
 8008106:	68fb      	ldr	r3, [r7, #12]
 8008108:	681a      	ldr	r2, [r3, #0]
 800810a:	4b15      	ldr	r3, [pc, #84]	; (8008160 <prvInsertBlockIntoFreeList+0xb0>)
 800810c:	681b      	ldr	r3, [r3, #0]
 800810e:	429a      	cmp	r2, r3
 8008110:	d00d      	beq.n	800812e <prvInsertBlockIntoFreeList+0x7e>
 8008112:	687b      	ldr	r3, [r7, #4]
 8008114:	685a      	ldr	r2, [r3, #4]
 8008116:	68fb      	ldr	r3, [r7, #12]
 8008118:	681b      	ldr	r3, [r3, #0]
 800811a:	685b      	ldr	r3, [r3, #4]
 800811c:	441a      	add	r2, r3
 800811e:	687b      	ldr	r3, [r7, #4]
 8008120:	605a      	str	r2, [r3, #4]
 8008122:	68fb      	ldr	r3, [r7, #12]
 8008124:	681b      	ldr	r3, [r3, #0]
 8008126:	681a      	ldr	r2, [r3, #0]
 8008128:	687b      	ldr	r3, [r7, #4]
 800812a:	601a      	str	r2, [r3, #0]
 800812c:	e008      	b.n	8008140 <prvInsertBlockIntoFreeList+0x90>
 800812e:	4b0c      	ldr	r3, [pc, #48]	; (8008160 <prvInsertBlockIntoFreeList+0xb0>)
 8008130:	681a      	ldr	r2, [r3, #0]
 8008132:	687b      	ldr	r3, [r7, #4]
 8008134:	601a      	str	r2, [r3, #0]
 8008136:	e003      	b.n	8008140 <prvInsertBlockIntoFreeList+0x90>
 8008138:	68fb      	ldr	r3, [r7, #12]
 800813a:	681a      	ldr	r2, [r3, #0]
 800813c:	687b      	ldr	r3, [r7, #4]
 800813e:	601a      	str	r2, [r3, #0]
 8008140:	68fa      	ldr	r2, [r7, #12]
 8008142:	687b      	ldr	r3, [r7, #4]
 8008144:	429a      	cmp	r2, r3
 8008146:	d002      	beq.n	800814e <prvInsertBlockIntoFreeList+0x9e>
 8008148:	68fb      	ldr	r3, [r7, #12]
 800814a:	687a      	ldr	r2, [r7, #4]
 800814c:	601a      	str	r2, [r3, #0]
 800814e:	bf00      	nop
 8008150:	3714      	adds	r7, #20
 8008152:	46bd      	mov	sp, r7
 8008154:	f85d 7b04 	ldr.w	r7, [sp], #4
 8008158:	4770      	bx	lr
 800815a:	bf00      	nop
 800815c:	200139d4 	.word	0x200139d4
 8008160:	200139dc 	.word	0x200139dc

08008164 <SystemInit>:
 8008164:	b480      	push	{r7}
 8008166:	af00      	add	r7, sp, #0
 8008168:	4b16      	ldr	r3, [pc, #88]	; (80081c4 <SystemInit+0x60>)
 800816a:	f8d3 3088 	ldr.w	r3, [r3, #136]	; 0x88
 800816e:	4a15      	ldr	r2, [pc, #84]	; (80081c4 <SystemInit+0x60>)
 8008170:	f443 0370 	orr.w	r3, r3, #15728640	; 0xf00000
 8008174:	f8c2 3088 	str.w	r3, [r2, #136]	; 0x88
 8008178:	4b13      	ldr	r3, [pc, #76]	; (80081c8 <SystemInit+0x64>)
 800817a:	681b      	ldr	r3, [r3, #0]
 800817c:	4a12      	ldr	r2, [pc, #72]	; (80081c8 <SystemInit+0x64>)
 800817e:	f043 0301 	orr.w	r3, r3, #1
 8008182:	6013      	str	r3, [r2, #0]
 8008184:	4b10      	ldr	r3, [pc, #64]	; (80081c8 <SystemInit+0x64>)
 8008186:	2200      	movs	r2, #0
 8008188:	609a      	str	r2, [r3, #8]
 800818a:	4b0f      	ldr	r3, [pc, #60]	; (80081c8 <SystemInit+0x64>)
 800818c:	681b      	ldr	r3, [r3, #0]
 800818e:	4a0e      	ldr	r2, [pc, #56]	; (80081c8 <SystemInit+0x64>)
 8008190:	f023 7384 	bic.w	r3, r3, #17301504	; 0x1080000
 8008194:	f423 3380 	bic.w	r3, r3, #65536	; 0x10000
 8008198:	6013      	str	r3, [r2, #0]
 800819a:	4b0b      	ldr	r3, [pc, #44]	; (80081c8 <SystemInit+0x64>)
 800819c:	4a0b      	ldr	r2, [pc, #44]	; (80081cc <SystemInit+0x68>)
 800819e:	605a      	str	r2, [r3, #4]
 80081a0:	4b09      	ldr	r3, [pc, #36]	; (80081c8 <SystemInit+0x64>)
 80081a2:	681b      	ldr	r3, [r3, #0]
 80081a4:	4a08      	ldr	r2, [pc, #32]	; (80081c8 <SystemInit+0x64>)
 80081a6:	f423 2380 	bic.w	r3, r3, #262144	; 0x40000
 80081aa:	6013      	str	r3, [r2, #0]
 80081ac:	4b06      	ldr	r3, [pc, #24]	; (80081c8 <SystemInit+0x64>)
 80081ae:	2200      	movs	r2, #0
 80081b0:	60da      	str	r2, [r3, #12]
 80081b2:	4b04      	ldr	r3, [pc, #16]	; (80081c4 <SystemInit+0x60>)
 80081b4:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 80081b8:	609a      	str	r2, [r3, #8]
 80081ba:	bf00      	nop
 80081bc:	46bd      	mov	sp, r7
 80081be:	f85d 7b04 	ldr.w	r7, [sp], #4
 80081c2:	4770      	bx	lr
 80081c4:	e000ed00 	.word	0xe000ed00
 80081c8:	40023800 	.word	0x40023800
 80081cc:	24003010 	.word	0x24003010

080081d0 <arm_mult_f32>:
 80081d0:	b480      	push	{r7}
 80081d2:	b093      	sub	sp, #76	; 0x4c
 80081d4:	af00      	add	r7, sp, #0
 80081d6:	60f8      	str	r0, [r7, #12]
 80081d8:	60b9      	str	r1, [r7, #8]
 80081da:	607a      	str	r2, [r7, #4]
 80081dc:	603b      	str	r3, [r7, #0]
 80081de:	683b      	ldr	r3, [r7, #0]
 80081e0:	089b      	lsrs	r3, r3, #2
 80081e2:	647b      	str	r3, [r7, #68]	; 0x44
 80081e4:	e052      	b.n	800828c <arm_mult_f32+0xbc>
 80081e6:	68fb      	ldr	r3, [r7, #12]
 80081e8:	681b      	ldr	r3, [r3, #0]
 80081ea:	643b      	str	r3, [r7, #64]	; 0x40
 80081ec:	68bb      	ldr	r3, [r7, #8]
 80081ee:	681b      	ldr	r3, [r3, #0]
 80081f0:	63fb      	str	r3, [r7, #60]	; 0x3c
 80081f2:	68fb      	ldr	r3, [r7, #12]
 80081f4:	685b      	ldr	r3, [r3, #4]
 80081f6:	63bb      	str	r3, [r7, #56]	; 0x38
 80081f8:	68bb      	ldr	r3, [r7, #8]
 80081fa:	685b      	ldr	r3, [r3, #4]
 80081fc:	637b      	str	r3, [r7, #52]	; 0x34
 80081fe:	ed97 7a10 	vldr	s14, [r7, #64]	; 0x40
 8008202:	edd7 7a0f 	vldr	s15, [r7, #60]	; 0x3c
 8008206:	ee67 7a27 	vmul.f32	s15, s14, s15
 800820a:	edc7 7a0c 	vstr	s15, [r7, #48]	; 0x30
 800820e:	68fb      	ldr	r3, [r7, #12]
 8008210:	689b      	ldr	r3, [r3, #8]
 8008212:	62fb      	str	r3, [r7, #44]	; 0x2c
 8008214:	68bb      	ldr	r3, [r7, #8]
 8008216:	689b      	ldr	r3, [r3, #8]
 8008218:	62bb      	str	r3, [r7, #40]	; 0x28
 800821a:	ed97 7a0e 	vldr	s14, [r7, #56]	; 0x38
 800821e:	edd7 7a0d 	vldr	s15, [r7, #52]	; 0x34
 8008222:	ee67 7a27 	vmul.f32	s15, s14, s15
 8008226:	edc7 7a09 	vstr	s15, [r7, #36]	; 0x24
 800822a:	68fb      	ldr	r3, [r7, #12]
 800822c:	68db      	ldr	r3, [r3, #12]
 800822e:	623b      	str	r3, [r7, #32]
 8008230:	687b      	ldr	r3, [r7, #4]
 8008232:	6b3a      	ldr	r2, [r7, #48]	; 0x30
 8008234:	601a      	str	r2, [r3, #0]
 8008236:	68bb      	ldr	r3, [r7, #8]
 8008238:	68db      	ldr	r3, [r3, #12]
 800823a:	61fb      	str	r3, [r7, #28]
 800823c:	ed97 7a0b 	vldr	s14, [r7, #44]	; 0x2c
 8008240:	edd7 7a0a 	vldr	s15, [r7, #40]	; 0x28
 8008244:	ee67 7a27 	vmul.f32	s15, s14, s15
 8008248:	edc7 7a06 	vstr	s15, [r7, #24]
 800824c:	687b      	ldr	r3, [r7, #4]
 800824e:	3304      	adds	r3, #4
 8008250:	6a7a      	ldr	r2, [r7, #36]	; 0x24
 8008252:	601a      	str	r2, [r3, #0]
 8008254:	ed97 7a08 	vldr	s14, [r7, #32]
 8008258:	edd7 7a07 	vldr	s15, [r7, #28]
 800825c:	ee67 7a27 	vmul.f32	s15, s14, s15
 8008260:	edc7 7a05 	vstr	s15, [r7, #20]
 8008264:	687b      	ldr	r3, [r7, #4]
 8008266:	3308      	adds	r3, #8
 8008268:	69ba      	ldr	r2, [r7, #24]
 800826a:	601a      	str	r2, [r3, #0]
 800826c:	687b      	ldr	r3, [r7, #4]
 800826e:	330c      	adds	r3, #12
 8008270:	697a      	ldr	r2, [r7, #20]
 8008272:	601a      	str	r2, [r3, #0]
 8008274:	68fb      	ldr	r3, [r7, #12]
 8008276:	3310      	adds	r3, #16
 8008278:	60fb      	str	r3, [r7, #12]
 800827a:	68bb      	ldr	r3, [r7, #8]
 800827c:	3310      	adds	r3, #16
 800827e:	60bb      	str	r3, [r7, #8]
 8008280:	687b      	ldr	r3, [r7, #4]
 8008282:	3310      	adds	r3, #16
 8008284:	607b      	str	r3, [r7, #4]
 8008286:	6c7b      	ldr	r3, [r7, #68]	; 0x44
 8008288:	3b01      	subs	r3, #1
 800828a:	647b      	str	r3, [r7, #68]	; 0x44
 800828c:	6c7b      	ldr	r3, [r7, #68]	; 0x44
 800828e:	2b00      	cmp	r3, #0
 8008290:	d1a9      	bne.n	80081e6 <arm_mult_f32+0x16>
 8008292:	683b      	ldr	r3, [r7, #0]
 8008294:	f003 0303 	and.w	r3, r3, #3
 8008298:	647b      	str	r3, [r7, #68]	; 0x44
 800829a:	e013      	b.n	80082c4 <arm_mult_f32+0xf4>
 800829c:	68fb      	ldr	r3, [r7, #12]
 800829e:	1d1a      	adds	r2, r3, #4
 80082a0:	60fa      	str	r2, [r7, #12]
 80082a2:	ed93 7a00 	vldr	s14, [r3]
 80082a6:	68bb      	ldr	r3, [r7, #8]
 80082a8:	1d1a      	adds	r2, r3, #4
 80082aa:	60ba      	str	r2, [r7, #8]
 80082ac:	edd3 7a00 	vldr	s15, [r3]
 80082b0:	687b      	ldr	r3, [r7, #4]
 80082b2:	1d1a      	adds	r2, r3, #4
 80082b4:	607a      	str	r2, [r7, #4]
 80082b6:	ee67 7a27 	vmul.f32	s15, s14, s15
 80082ba:	edc3 7a00 	vstr	s15, [r3]
 80082be:	6c7b      	ldr	r3, [r7, #68]	; 0x44
 80082c0:	3b01      	subs	r3, #1
 80082c2:	647b      	str	r3, [r7, #68]	; 0x44
 80082c4:	6c7b      	ldr	r3, [r7, #68]	; 0x44
 80082c6:	2b00      	cmp	r3, #0
 80082c8:	d1e8      	bne.n	800829c <arm_mult_f32+0xcc>
 80082ca:	bf00      	nop
 80082cc:	374c      	adds	r7, #76	; 0x4c
 80082ce:	46bd      	mov	sp, r7
 80082d0:	f85d 7b04 	ldr.w	r7, [sp], #4
 80082d4:	4770      	bx	lr

080082d6 <arm_max_f32>:
 80082d6:	b480      	push	{r7}
 80082d8:	b08b      	sub	sp, #44	; 0x2c
 80082da:	af00      	add	r7, sp, #0
 80082dc:	60f8      	str	r0, [r7, #12]
 80082de:	60b9      	str	r1, [r7, #8]
 80082e0:	607a      	str	r2, [r7, #4]
 80082e2:	603b      	str	r3, [r7, #0]
 80082e4:	2300      	movs	r3, #0
 80082e6:	61bb      	str	r3, [r7, #24]
 80082e8:	2300      	movs	r3, #0
 80082ea:	61fb      	str	r3, [r7, #28]
 80082ec:	68fb      	ldr	r3, [r7, #12]
 80082ee:	1d1a      	adds	r2, r3, #4
 80082f0:	60fa      	str	r2, [r7, #12]
 80082f2:	681b      	ldr	r3, [r3, #0]
 80082f4:	627b      	str	r3, [r7, #36]	; 0x24
 80082f6:	68bb      	ldr	r3, [r7, #8]
 80082f8:	3b01      	subs	r3, #1
 80082fa:	089b      	lsrs	r3, r3, #2
 80082fc:	623b      	str	r3, [r7, #32]
 80082fe:	e051      	b.n	80083a4 <arm_max_f32+0xce>
 8008300:	68fb      	ldr	r3, [r7, #12]
 8008302:	1d1a      	adds	r2, r3, #4
 8008304:	60fa      	str	r2, [r7, #12]
 8008306:	681b      	ldr	r3, [r3, #0]
 8008308:	617b      	str	r3, [r7, #20]
 800830a:	68fb      	ldr	r3, [r7, #12]
 800830c:	1d1a      	adds	r2, r3, #4
 800830e:	60fa      	str	r2, [r7, #12]
 8008310:	681b      	ldr	r3, [r3, #0]
 8008312:	613b      	str	r3, [r7, #16]
 8008314:	ed97 7a09 	vldr	s14, [r7, #36]	; 0x24
 8008318:	edd7 7a05 	vldr	s15, [r7, #20]
 800831c:	eeb4 7ae7 	vcmpe.f32	s14, s15
 8008320:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8008324:	d504      	bpl.n	8008330 <arm_max_f32+0x5a>
 8008326:	697b      	ldr	r3, [r7, #20]
 8008328:	627b      	str	r3, [r7, #36]	; 0x24
 800832a:	69bb      	ldr	r3, [r7, #24]
 800832c:	3301      	adds	r3, #1
 800832e:	61fb      	str	r3, [r7, #28]
 8008330:	68fb      	ldr	r3, [r7, #12]
 8008332:	1d1a      	adds	r2, r3, #4
 8008334:	60fa      	str	r2, [r7, #12]
 8008336:	681b      	ldr	r3, [r3, #0]
 8008338:	617b      	str	r3, [r7, #20]
 800833a:	ed97 7a09 	vldr	s14, [r7, #36]	; 0x24
 800833e:	edd7 7a04 	vldr	s15, [r7, #16]
 8008342:	eeb4 7ae7 	vcmpe.f32	s14, s15
 8008346:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 800834a:	d504      	bpl.n	8008356 <arm_max_f32+0x80>
 800834c:	693b      	ldr	r3, [r7, #16]
 800834e:	627b      	str	r3, [r7, #36]	; 0x24
 8008350:	69bb      	ldr	r3, [r7, #24]
 8008352:	3302      	adds	r3, #2
 8008354:	61fb      	str	r3, [r7, #28]
 8008356:	68fb      	ldr	r3, [r7, #12]
 8008358:	1d1a      	adds	r2, r3, #4
 800835a:	60fa      	str	r2, [r7, #12]
 800835c:	681b      	ldr	r3, [r3, #0]
 800835e:	613b      	str	r3, [r7, #16]
 8008360:	ed97 7a09 	vldr	s14, [r7, #36]	; 0x24
 8008364:	edd7 7a05 	vldr	s15, [r7, #20]
 8008368:	eeb4 7ae7 	vcmpe.f32	s14, s15
 800836c:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8008370:	d504      	bpl.n	800837c <arm_max_f32+0xa6>
 8008372:	697b      	ldr	r3, [r7, #20]
 8008374:	627b      	str	r3, [r7, #36]	; 0x24
 8008376:	69bb      	ldr	r3, [r7, #24]
 8008378:	3303      	adds	r3, #3
 800837a:	61fb      	str	r3, [r7, #28]
 800837c:	ed97 7a09 	vldr	s14, [r7, #36]	; 0x24
 8008380:	edd7 7a04 	vldr	s15, [r7, #16]
 8008384:	eeb4 7ae7 	vcmpe.f32	s14, s15
 8008388:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 800838c:	d504      	bpl.n	8008398 <arm_max_f32+0xc2>
 800838e:	693b      	ldr	r3, [r7, #16]
 8008390:	627b      	str	r3, [r7, #36]	; 0x24
 8008392:	69bb      	ldr	r3, [r7, #24]
 8008394:	3304      	adds	r3, #4
 8008396:	61fb      	str	r3, [r7, #28]
 8008398:	69bb      	ldr	r3, [r7, #24]
 800839a:	3304      	adds	r3, #4
 800839c:	61bb      	str	r3, [r7, #24]
 800839e:	6a3b      	ldr	r3, [r7, #32]
 80083a0:	3b01      	subs	r3, #1
 80083a2:	623b      	str	r3, [r7, #32]
 80083a4:	6a3b      	ldr	r3, [r7, #32]
 80083a6:	2b00      	cmp	r3, #0
 80083a8:	d1aa      	bne.n	8008300 <arm_max_f32+0x2a>
 80083aa:	68bb      	ldr	r3, [r7, #8]
 80083ac:	3b01      	subs	r3, #1
 80083ae:	f003 0303 	and.w	r3, r3, #3
 80083b2:	623b      	str	r3, [r7, #32]
 80083b4:	e016      	b.n	80083e4 <arm_max_f32+0x10e>
 80083b6:	68fb      	ldr	r3, [r7, #12]
 80083b8:	1d1a      	adds	r2, r3, #4
 80083ba:	60fa      	str	r2, [r7, #12]
 80083bc:	681b      	ldr	r3, [r3, #0]
 80083be:	617b      	str	r3, [r7, #20]
 80083c0:	ed97 7a09 	vldr	s14, [r7, #36]	; 0x24
 80083c4:	edd7 7a05 	vldr	s15, [r7, #20]
 80083c8:	eeb4 7ae7 	vcmpe.f32	s14, s15
 80083cc:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 80083d0:	d505      	bpl.n	80083de <arm_max_f32+0x108>
 80083d2:	697b      	ldr	r3, [r7, #20]
 80083d4:	627b      	str	r3, [r7, #36]	; 0x24
 80083d6:	68ba      	ldr	r2, [r7, #8]
 80083d8:	6a3b      	ldr	r3, [r7, #32]
 80083da:	1ad3      	subs	r3, r2, r3
 80083dc:	61fb      	str	r3, [r7, #28]
 80083de:	6a3b      	ldr	r3, [r7, #32]
 80083e0:	3b01      	subs	r3, #1
 80083e2:	623b      	str	r3, [r7, #32]
 80083e4:	6a3b      	ldr	r3, [r7, #32]
 80083e6:	2b00      	cmp	r3, #0
 80083e8:	d1e5      	bne.n	80083b6 <arm_max_f32+0xe0>
 80083ea:	687b      	ldr	r3, [r7, #4]
 80083ec:	6a7a      	ldr	r2, [r7, #36]	; 0x24
 80083ee:	601a      	str	r2, [r3, #0]
 80083f0:	683b      	ldr	r3, [r7, #0]
 80083f2:	2b00      	cmp	r3, #0
 80083f4:	d002      	beq.n	80083fc <arm_max_f32+0x126>
 80083f6:	683b      	ldr	r3, [r7, #0]
 80083f8:	69fa      	ldr	r2, [r7, #28]
 80083fa:	601a      	str	r2, [r3, #0]
 80083fc:	bf00      	nop
 80083fe:	372c      	adds	r7, #44	; 0x2c
 8008400:	46bd      	mov	sp, r7
 8008402:	f85d 7b04 	ldr.w	r7, [sp], #4
 8008406:	4770      	bx	lr

08008408 <arm_mat_mult_f32>:
 8008408:	b480      	push	{r7}
 800840a:	b095      	sub	sp, #84	; 0x54
 800840c:	af00      	add	r7, sp, #0
 800840e:	60f8      	str	r0, [r7, #12]
 8008410:	60b9      	str	r1, [r7, #8]
 8008412:	607a      	str	r2, [r7, #4]
 8008414:	68fb      	ldr	r3, [r7, #12]
 8008416:	685b      	ldr	r3, [r3, #4]
 8008418:	64fb      	str	r3, [r7, #76]	; 0x4c
 800841a:	68bb      	ldr	r3, [r7, #8]
 800841c:	685b      	ldr	r3, [r3, #4]
 800841e:	64bb      	str	r3, [r7, #72]	; 0x48
 8008420:	68fb      	ldr	r3, [r7, #12]
 8008422:	685b      	ldr	r3, [r3, #4]
 8008424:	647b      	str	r3, [r7, #68]	; 0x44
 8008426:	687b      	ldr	r3, [r7, #4]
 8008428:	685b      	ldr	r3, [r3, #4]
 800842a:	62fb      	str	r3, [r7, #44]	; 0x2c
 800842c:	68fb      	ldr	r3, [r7, #12]
 800842e:	881b      	ldrh	r3, [r3, #0]
 8008430:	857b      	strh	r3, [r7, #42]	; 0x2a
 8008432:	68bb      	ldr	r3, [r7, #8]
 8008434:	885b      	ldrh	r3, [r3, #2]
 8008436:	853b      	strh	r3, [r7, #40]	; 0x28
 8008438:	68fb      	ldr	r3, [r7, #12]
 800843a:	885b      	ldrh	r3, [r3, #2]
 800843c:	84fb      	strh	r3, [r7, #38]	; 0x26
 800843e:	2300      	movs	r3, #0
 8008440:	873b      	strh	r3, [r7, #56]	; 0x38
 8008442:	8d7b      	ldrh	r3, [r7, #42]	; 0x2a
 8008444:	86bb      	strh	r3, [r7, #52]	; 0x34
 8008446:	8f3b      	ldrh	r3, [r7, #56]	; 0x38
 8008448:	009b      	lsls	r3, r3, #2
 800844a:	6afa      	ldr	r2, [r7, #44]	; 0x2c
 800844c:	4413      	add	r3, r2
 800844e:	643b      	str	r3, [r7, #64]	; 0x40
 8008450:	8d3b      	ldrh	r3, [r7, #40]	; 0x28
 8008452:	877b      	strh	r3, [r7, #58]	; 0x3a
 8008454:	68bb      	ldr	r3, [r7, #8]
 8008456:	685b      	ldr	r3, [r3, #4]
 8008458:	64bb      	str	r3, [r7, #72]	; 0x48
 800845a:	2300      	movs	r3, #0
 800845c:	86fb      	strh	r3, [r7, #54]	; 0x36
 800845e:	f04f 0300 	mov.w	r3, #0
 8008462:	63fb      	str	r3, [r7, #60]	; 0x3c
 8008464:	6c7b      	ldr	r3, [r7, #68]	; 0x44
 8008466:	64fb      	str	r3, [r7, #76]	; 0x4c
 8008468:	8cfb      	ldrh	r3, [r7, #38]	; 0x26
 800846a:	089b      	lsrs	r3, r3, #2
 800846c:	867b      	strh	r3, [r7, #50]	; 0x32
 800846e:	e061      	b.n	8008534 <arm_mat_mult_f32+0x12c>
 8008470:	6cbb      	ldr	r3, [r7, #72]	; 0x48
 8008472:	681b      	ldr	r3, [r3, #0]
 8008474:	623b      	str	r3, [r7, #32]
 8008476:	8d3b      	ldrh	r3, [r7, #40]	; 0x28
 8008478:	009b      	lsls	r3, r3, #2
 800847a:	6cba      	ldr	r2, [r7, #72]	; 0x48
 800847c:	4413      	add	r3, r2
 800847e:	64bb      	str	r3, [r7, #72]	; 0x48
 8008480:	6cfb      	ldr	r3, [r7, #76]	; 0x4c
 8008482:	681b      	ldr	r3, [r3, #0]
 8008484:	61fb      	str	r3, [r7, #28]
 8008486:	6cfb      	ldr	r3, [r7, #76]	; 0x4c
 8008488:	685b      	ldr	r3, [r3, #4]
 800848a:	61bb      	str	r3, [r7, #24]
 800848c:	ed97 7a07 	vldr	s14, [r7, #28]
 8008490:	edd7 7a08 	vldr	s15, [r7, #32]
 8008494:	ee67 7a27 	vmul.f32	s15, s14, s15
 8008498:	ed97 7a0f 	vldr	s14, [r7, #60]	; 0x3c
 800849c:	ee77 7a27 	vadd.f32	s15, s14, s15
 80084a0:	edc7 7a0f 	vstr	s15, [r7, #60]	; 0x3c
 80084a4:	6cbb      	ldr	r3, [r7, #72]	; 0x48
 80084a6:	681b      	ldr	r3, [r3, #0]
 80084a8:	617b      	str	r3, [r7, #20]
 80084aa:	8d3b      	ldrh	r3, [r7, #40]	; 0x28
 80084ac:	009b      	lsls	r3, r3, #2
 80084ae:	6cba      	ldr	r2, [r7, #72]	; 0x48
 80084b0:	4413      	add	r3, r2
 80084b2:	64bb      	str	r3, [r7, #72]	; 0x48
 80084b4:	ed97 7a06 	vldr	s14, [r7, #24]
 80084b8:	edd7 7a05 	vldr	s15, [r7, #20]
 80084bc:	ee67 7a27 	vmul.f32	s15, s14, s15
 80084c0:	ed97 7a0f 	vldr	s14, [r7, #60]	; 0x3c
 80084c4:	ee77 7a27 	vadd.f32	s15, s14, s15
 80084c8:	edc7 7a0f 	vstr	s15, [r7, #60]	; 0x3c
 80084cc:	6cbb      	ldr	r3, [r7, #72]	; 0x48
 80084ce:	681b      	ldr	r3, [r3, #0]
 80084d0:	623b      	str	r3, [r7, #32]
 80084d2:	8d3b      	ldrh	r3, [r7, #40]	; 0x28
 80084d4:	009b      	lsls	r3, r3, #2
 80084d6:	6cba      	ldr	r2, [r7, #72]	; 0x48
 80084d8:	4413      	add	r3, r2
 80084da:	64bb      	str	r3, [r7, #72]	; 0x48
 80084dc:	6cfb      	ldr	r3, [r7, #76]	; 0x4c
 80084de:	689b      	ldr	r3, [r3, #8]
 80084e0:	61fb      	str	r3, [r7, #28]
 80084e2:	6cfb      	ldr	r3, [r7, #76]	; 0x4c
 80084e4:	68db      	ldr	r3, [r3, #12]
 80084e6:	61bb      	str	r3, [r7, #24]
 80084e8:	ed97 7a07 	vldr	s14, [r7, #28]
 80084ec:	edd7 7a08 	vldr	s15, [r7, #32]
 80084f0:	ee67 7a27 	vmul.f32	s15, s14, s15
 80084f4:	ed97 7a0f 	vldr	s14, [r7, #60]	; 0x3c
 80084f8:	ee77 7a27 	vadd.f32	s15, s14, s15
 80084fc:	edc7 7a0f 	vstr	s15, [r7, #60]	; 0x3c
 8008500:	6cbb      	ldr	r3, [r7, #72]	; 0x48
 8008502:	681b      	ldr	r3, [r3, #0]
 8008504:	617b      	str	r3, [r7, #20]
 8008506:	8d3b      	ldrh	r3, [r7, #40]	; 0x28
 8008508:	009b      	lsls	r3, r3, #2
 800850a:	6cba      	ldr	r2, [r7, #72]	; 0x48
 800850c:	4413      	add	r3, r2
 800850e:	64bb      	str	r3, [r7, #72]	; 0x48
 8008510:	ed97 7a06 	vldr	s14, [r7, #24]
 8008514:	edd7 7a05 	vldr	s15, [r7, #20]
 8008518:	ee67 7a27 	vmul.f32	s15, s14, s15
 800851c:	ed97 7a0f 	vldr	s14, [r7, #60]	; 0x3c
 8008520:	ee77 7a27 	vadd.f32	s15, s14, s15
 8008524:	edc7 7a0f 	vstr	s15, [r7, #60]	; 0x3c
 8008528:	6cfb      	ldr	r3, [r7, #76]	; 0x4c
 800852a:	3310      	adds	r3, #16
 800852c:	64fb      	str	r3, [r7, #76]	; 0x4c
 800852e:	8e7b      	ldrh	r3, [r7, #50]	; 0x32
 8008530:	3b01      	subs	r3, #1
 8008532:	867b      	strh	r3, [r7, #50]	; 0x32
 8008534:	8e7b      	ldrh	r3, [r7, #50]	; 0x32
 8008536:	2b00      	cmp	r3, #0
 8008538:	d19a      	bne.n	8008470 <arm_mat_mult_f32+0x68>
 800853a:	8cfb      	ldrh	r3, [r7, #38]	; 0x26
 800853c:	f003 0303 	and.w	r3, r3, #3
 8008540:	867b      	strh	r3, [r7, #50]	; 0x32
 8008542:	e017      	b.n	8008574 <arm_mat_mult_f32+0x16c>
 8008544:	6cfb      	ldr	r3, [r7, #76]	; 0x4c
 8008546:	1d1a      	adds	r2, r3, #4
 8008548:	64fa      	str	r2, [r7, #76]	; 0x4c
 800854a:	ed93 7a00 	vldr	s14, [r3]
 800854e:	6cbb      	ldr	r3, [r7, #72]	; 0x48
 8008550:	edd3 7a00 	vldr	s15, [r3]
 8008554:	ee67 7a27 	vmul.f32	s15, s14, s15
 8008558:	ed97 7a0f 	vldr	s14, [r7, #60]	; 0x3c
 800855c:	ee77 7a27 	vadd.f32	s15, s14, s15
 8008560:	edc7 7a0f 	vstr	s15, [r7, #60]	; 0x3c
 8008564:	8d3b      	ldrh	r3, [r7, #40]	; 0x28
 8008566:	009b      	lsls	r3, r3, #2
 8008568:	6cba      	ldr	r2, [r7, #72]	; 0x48
 800856a:	4413      	add	r3, r2
 800856c:	64bb      	str	r3, [r7, #72]	; 0x48
 800856e:	8e7b      	ldrh	r3, [r7, #50]	; 0x32
 8008570:	3b01      	subs	r3, #1
 8008572:	867b      	strh	r3, [r7, #50]	; 0x32
 8008574:	8e7b      	ldrh	r3, [r7, #50]	; 0x32
 8008576:	2b00      	cmp	r3, #0
 8008578:	d1e4      	bne.n	8008544 <arm_mat_mult_f32+0x13c>
 800857a:	6c3b      	ldr	r3, [r7, #64]	; 0x40
 800857c:	1d1a      	adds	r2, r3, #4
 800857e:	643a      	str	r2, [r7, #64]	; 0x40
 8008580:	6bfa      	ldr	r2, [r7, #60]	; 0x3c
 8008582:	601a      	str	r2, [r3, #0]
 8008584:	8efb      	ldrh	r3, [r7, #54]	; 0x36
 8008586:	3301      	adds	r3, #1
 8008588:	86fb      	strh	r3, [r7, #54]	; 0x36
 800858a:	68bb      	ldr	r3, [r7, #8]
 800858c:	685a      	ldr	r2, [r3, #4]
 800858e:	8efb      	ldrh	r3, [r7, #54]	; 0x36
 8008590:	009b      	lsls	r3, r3, #2
 8008592:	4413      	add	r3, r2
 8008594:	64bb      	str	r3, [r7, #72]	; 0x48
 8008596:	8f7b      	ldrh	r3, [r7, #58]	; 0x3a
 8008598:	3b01      	subs	r3, #1
 800859a:	877b      	strh	r3, [r7, #58]	; 0x3a
 800859c:	8f7b      	ldrh	r3, [r7, #58]	; 0x3a
 800859e:	2b00      	cmp	r3, #0
 80085a0:	f47f af5d 	bne.w	800845e <arm_mat_mult_f32+0x56>
 80085a4:	8f3a      	ldrh	r2, [r7, #56]	; 0x38
 80085a6:	8d3b      	ldrh	r3, [r7, #40]	; 0x28
 80085a8:	4413      	add	r3, r2
 80085aa:	873b      	strh	r3, [r7, #56]	; 0x38
 80085ac:	8cfb      	ldrh	r3, [r7, #38]	; 0x26
 80085ae:	009b      	lsls	r3, r3, #2
 80085b0:	6c7a      	ldr	r2, [r7, #68]	; 0x44
 80085b2:	4413      	add	r3, r2
 80085b4:	647b      	str	r3, [r7, #68]	; 0x44
 80085b6:	8ebb      	ldrh	r3, [r7, #52]	; 0x34
 80085b8:	3b01      	subs	r3, #1
 80085ba:	86bb      	strh	r3, [r7, #52]	; 0x34
 80085bc:	8ebb      	ldrh	r3, [r7, #52]	; 0x34
 80085be:	2b00      	cmp	r3, #0
 80085c0:	f47f af41 	bne.w	8008446 <arm_mat_mult_f32+0x3e>
 80085c4:	2300      	movs	r3, #0
 80085c6:	f887 3025 	strb.w	r3, [r7, #37]	; 0x25
 80085ca:	f997 3025 	ldrsb.w	r3, [r7, #37]	; 0x25
 80085ce:	4618      	mov	r0, r3
 80085d0:	3754      	adds	r7, #84	; 0x54
 80085d2:	46bd      	mov	sp, r7
 80085d4:	f85d 7b04 	ldr.w	r7, [sp], #4
 80085d8:	4770      	bx	lr

080085da <arm_mat_scale_f32>:
 80085da:	b480      	push	{r7}
 80085dc:	b093      	sub	sp, #76	; 0x4c
 80085de:	af00      	add	r7, sp, #0
 80085e0:	60f8      	str	r0, [r7, #12]
 80085e2:	ed87 0a02 	vstr	s0, [r7, #8]
 80085e6:	6079      	str	r1, [r7, #4]
 80085e8:	68fb      	ldr	r3, [r7, #12]
 80085ea:	685b      	ldr	r3, [r3, #4]
 80085ec:	647b      	str	r3, [r7, #68]	; 0x44
 80085ee:	687b      	ldr	r3, [r7, #4]
 80085f0:	685b      	ldr	r3, [r3, #4]
 80085f2:	643b      	str	r3, [r7, #64]	; 0x40
 80085f4:	68fb      	ldr	r3, [r7, #12]
 80085f6:	881b      	ldrh	r3, [r3, #0]
 80085f8:	461a      	mov	r2, r3
 80085fa:	68fb      	ldr	r3, [r7, #12]
 80085fc:	885b      	ldrh	r3, [r3, #2]
 80085fe:	fb03 f302 	mul.w	r3, r3, r2
 8008602:	63bb      	str	r3, [r7, #56]	; 0x38
 8008604:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 8008606:	089b      	lsrs	r3, r3, #2
 8008608:	63fb      	str	r3, [r7, #60]	; 0x3c
 800860a:	e043      	b.n	8008694 <arm_mat_scale_f32+0xba>
 800860c:	6c7b      	ldr	r3, [r7, #68]	; 0x44
 800860e:	681b      	ldr	r3, [r3, #0]
 8008610:	633b      	str	r3, [r7, #48]	; 0x30
 8008612:	6c7b      	ldr	r3, [r7, #68]	; 0x44
 8008614:	685b      	ldr	r3, [r3, #4]
 8008616:	62fb      	str	r3, [r7, #44]	; 0x2c
 8008618:	6c7b      	ldr	r3, [r7, #68]	; 0x44
 800861a:	689b      	ldr	r3, [r3, #8]
 800861c:	62bb      	str	r3, [r7, #40]	; 0x28
 800861e:	6c7b      	ldr	r3, [r7, #68]	; 0x44
 8008620:	68db      	ldr	r3, [r3, #12]
 8008622:	627b      	str	r3, [r7, #36]	; 0x24
 8008624:	ed97 7a0c 	vldr	s14, [r7, #48]	; 0x30
 8008628:	edd7 7a02 	vldr	s15, [r7, #8]
 800862c:	ee67 7a27 	vmul.f32	s15, s14, s15
 8008630:	edc7 7a08 	vstr	s15, [r7, #32]
 8008634:	ed97 7a0b 	vldr	s14, [r7, #44]	; 0x2c
 8008638:	edd7 7a02 	vldr	s15, [r7, #8]
 800863c:	ee67 7a27 	vmul.f32	s15, s14, s15
 8008640:	edc7 7a07 	vstr	s15, [r7, #28]
 8008644:	ed97 7a0a 	vldr	s14, [r7, #40]	; 0x28
 8008648:	edd7 7a02 	vldr	s15, [r7, #8]
 800864c:	ee67 7a27 	vmul.f32	s15, s14, s15
 8008650:	edc7 7a06 	vstr	s15, [r7, #24]
 8008654:	ed97 7a09 	vldr	s14, [r7, #36]	; 0x24
 8008658:	edd7 7a02 	vldr	s15, [r7, #8]
 800865c:	ee67 7a27 	vmul.f32	s15, s14, s15
 8008660:	edc7 7a05 	vstr	s15, [r7, #20]
 8008664:	6c3b      	ldr	r3, [r7, #64]	; 0x40
 8008666:	6a3a      	ldr	r2, [r7, #32]
 8008668:	601a      	str	r2, [r3, #0]
 800866a:	6c3b      	ldr	r3, [r7, #64]	; 0x40
 800866c:	3304      	adds	r3, #4
 800866e:	69fa      	ldr	r2, [r7, #28]
 8008670:	601a      	str	r2, [r3, #0]
 8008672:	6c3b      	ldr	r3, [r7, #64]	; 0x40
 8008674:	3308      	adds	r3, #8
 8008676:	69ba      	ldr	r2, [r7, #24]
 8008678:	601a      	str	r2, [r3, #0]
 800867a:	6c3b      	ldr	r3, [r7, #64]	; 0x40
 800867c:	330c      	adds	r3, #12
 800867e:	697a      	ldr	r2, [r7, #20]
 8008680:	601a      	str	r2, [r3, #0]
 8008682:	6c7b      	ldr	r3, [r7, #68]	; 0x44
 8008684:	3310      	adds	r3, #16
 8008686:	647b      	str	r3, [r7, #68]	; 0x44
 8008688:	6c3b      	ldr	r3, [r7, #64]	; 0x40
 800868a:	3310      	adds	r3, #16
 800868c:	643b      	str	r3, [r7, #64]	; 0x40
 800868e:	6bfb      	ldr	r3, [r7, #60]	; 0x3c
 8008690:	3b01      	subs	r3, #1
 8008692:	63fb      	str	r3, [r7, #60]	; 0x3c
 8008694:	6bfb      	ldr	r3, [r7, #60]	; 0x3c
 8008696:	2b00      	cmp	r3, #0
 8008698:	d1b8      	bne.n	800860c <arm_mat_scale_f32+0x32>
 800869a:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 800869c:	f003 0303 	and.w	r3, r3, #3
 80086a0:	63fb      	str	r3, [r7, #60]	; 0x3c
 80086a2:	e010      	b.n	80086c6 <arm_mat_scale_f32+0xec>
 80086a4:	6c7b      	ldr	r3, [r7, #68]	; 0x44
 80086a6:	1d1a      	adds	r2, r3, #4
 80086a8:	647a      	str	r2, [r7, #68]	; 0x44
 80086aa:	ed93 7a00 	vldr	s14, [r3]
 80086ae:	6c3b      	ldr	r3, [r7, #64]	; 0x40
 80086b0:	1d1a      	adds	r2, r3, #4
 80086b2:	643a      	str	r2, [r7, #64]	; 0x40
 80086b4:	edd7 7a02 	vldr	s15, [r7, #8]
 80086b8:	ee67 7a27 	vmul.f32	s15, s14, s15
 80086bc:	edc3 7a00 	vstr	s15, [r3]
 80086c0:	6bfb      	ldr	r3, [r7, #60]	; 0x3c
 80086c2:	3b01      	subs	r3, #1
 80086c4:	63fb      	str	r3, [r7, #60]	; 0x3c
 80086c6:	6bfb      	ldr	r3, [r7, #60]	; 0x3c
 80086c8:	2b00      	cmp	r3, #0
 80086ca:	d1eb      	bne.n	80086a4 <arm_mat_scale_f32+0xca>
 80086cc:	2300      	movs	r3, #0
 80086ce:	f887 3037 	strb.w	r3, [r7, #55]	; 0x37
 80086d2:	f997 3037 	ldrsb.w	r3, [r7, #55]	; 0x37
 80086d6:	4618      	mov	r0, r3
 80086d8:	374c      	adds	r7, #76	; 0x4c
 80086da:	46bd      	mov	sp, r7
 80086dc:	f85d 7b04 	ldr.w	r7, [sp], #4
 80086e0:	4770      	bx	lr

080086e2 <arm_add_f32>:
 80086e2:	b480      	push	{r7}
 80086e4:	b08f      	sub	sp, #60	; 0x3c
 80086e6:	af00      	add	r7, sp, #0
 80086e8:	60f8      	str	r0, [r7, #12]
 80086ea:	60b9      	str	r1, [r7, #8]
 80086ec:	607a      	str	r2, [r7, #4]
 80086ee:	603b      	str	r3, [r7, #0]
 80086f0:	683b      	ldr	r3, [r7, #0]
 80086f2:	089b      	lsrs	r3, r3, #2
 80086f4:	637b      	str	r3, [r7, #52]	; 0x34
 80086f6:	e04a      	b.n	800878e <arm_add_f32+0xac>
 80086f8:	68fb      	ldr	r3, [r7, #12]
 80086fa:	681b      	ldr	r3, [r3, #0]
 80086fc:	633b      	str	r3, [r7, #48]	; 0x30
 80086fe:	68bb      	ldr	r3, [r7, #8]
 8008700:	681b      	ldr	r3, [r3, #0]
 8008702:	62fb      	str	r3, [r7, #44]	; 0x2c
 8008704:	68fb      	ldr	r3, [r7, #12]
 8008706:	685b      	ldr	r3, [r3, #4]
 8008708:	62bb      	str	r3, [r7, #40]	; 0x28
 800870a:	68bb      	ldr	r3, [r7, #8]
 800870c:	685b      	ldr	r3, [r3, #4]
 800870e:	627b      	str	r3, [r7, #36]	; 0x24
 8008710:	68fb      	ldr	r3, [r7, #12]
 8008712:	689b      	ldr	r3, [r3, #8]
 8008714:	623b      	str	r3, [r7, #32]
 8008716:	68bb      	ldr	r3, [r7, #8]
 8008718:	689b      	ldr	r3, [r3, #8]
 800871a:	61fb      	str	r3, [r7, #28]
 800871c:	68fb      	ldr	r3, [r7, #12]
 800871e:	68db      	ldr	r3, [r3, #12]
 8008720:	61bb      	str	r3, [r7, #24]
 8008722:	68bb      	ldr	r3, [r7, #8]
 8008724:	68db      	ldr	r3, [r3, #12]
 8008726:	617b      	str	r3, [r7, #20]
 8008728:	ed97 7a0c 	vldr	s14, [r7, #48]	; 0x30
 800872c:	edd7 7a0b 	vldr	s15, [r7, #44]	; 0x2c
 8008730:	ee77 7a27 	vadd.f32	s15, s14, s15
 8008734:	687b      	ldr	r3, [r7, #4]
 8008736:	edc3 7a00 	vstr	s15, [r3]
 800873a:	687b      	ldr	r3, [r7, #4]
 800873c:	3304      	adds	r3, #4
 800873e:	ed97 7a0a 	vldr	s14, [r7, #40]	; 0x28
 8008742:	edd7 7a09 	vldr	s15, [r7, #36]	; 0x24
 8008746:	ee77 7a27 	vadd.f32	s15, s14, s15
 800874a:	edc3 7a00 	vstr	s15, [r3]
 800874e:	687b      	ldr	r3, [r7, #4]
 8008750:	3308      	adds	r3, #8
 8008752:	ed97 7a08 	vldr	s14, [r7, #32]
 8008756:	edd7 7a07 	vldr	s15, [r7, #28]
 800875a:	ee77 7a27 	vadd.f32	s15, s14, s15
 800875e:	edc3 7a00 	vstr	s15, [r3]
 8008762:	687b      	ldr	r3, [r7, #4]
 8008764:	330c      	adds	r3, #12
 8008766:	ed97 7a06 	vldr	s14, [r7, #24]
 800876a:	edd7 7a05 	vldr	s15, [r7, #20]
 800876e:	ee77 7a27 	vadd.f32	s15, s14, s15
 8008772:	edc3 7a00 	vstr	s15, [r3]
 8008776:	68fb      	ldr	r3, [r7, #12]
 8008778:	3310      	adds	r3, #16
 800877a:	60fb      	str	r3, [r7, #12]
 800877c:	68bb      	ldr	r3, [r7, #8]
 800877e:	3310      	adds	r3, #16
 8008780:	60bb      	str	r3, [r7, #8]
 8008782:	687b      	ldr	r3, [r7, #4]
 8008784:	3310      	adds	r3, #16
 8008786:	607b      	str	r3, [r7, #4]
 8008788:	6b7b      	ldr	r3, [r7, #52]	; 0x34
 800878a:	3b01      	subs	r3, #1
 800878c:	637b      	str	r3, [r7, #52]	; 0x34
 800878e:	6b7b      	ldr	r3, [r7, #52]	; 0x34
 8008790:	2b00      	cmp	r3, #0
 8008792:	d1b1      	bne.n	80086f8 <arm_add_f32+0x16>
 8008794:	683b      	ldr	r3, [r7, #0]
 8008796:	f003 0303 	and.w	r3, r3, #3
 800879a:	637b      	str	r3, [r7, #52]	; 0x34
 800879c:	e013      	b.n	80087c6 <arm_add_f32+0xe4>
 800879e:	68fb      	ldr	r3, [r7, #12]
 80087a0:	1d1a      	adds	r2, r3, #4
 80087a2:	60fa      	str	r2, [r7, #12]
 80087a4:	ed93 7a00 	vldr	s14, [r3]
 80087a8:	68bb      	ldr	r3, [r7, #8]
 80087aa:	1d1a      	adds	r2, r3, #4
 80087ac:	60ba      	str	r2, [r7, #8]
 80087ae:	edd3 7a00 	vldr	s15, [r3]
 80087b2:	687b      	ldr	r3, [r7, #4]
 80087b4:	1d1a      	adds	r2, r3, #4
 80087b6:	607a      	str	r2, [r7, #4]
 80087b8:	ee77 7a27 	vadd.f32	s15, s14, s15
 80087bc:	edc3 7a00 	vstr	s15, [r3]
 80087c0:	6b7b      	ldr	r3, [r7, #52]	; 0x34
 80087c2:	3b01      	subs	r3, #1
 80087c4:	637b      	str	r3, [r7, #52]	; 0x34
 80087c6:	6b7b      	ldr	r3, [r7, #52]	; 0x34
 80087c8:	2b00      	cmp	r3, #0
 80087ca:	d1e8      	bne.n	800879e <arm_add_f32+0xbc>
 80087cc:	bf00      	nop
 80087ce:	373c      	adds	r7, #60	; 0x3c
 80087d0:	46bd      	mov	sp, r7
 80087d2:	f85d 7b04 	ldr.w	r7, [sp], #4
 80087d6:	4770      	bx	lr

080087d8 <arm_min_f32>:
 80087d8:	b480      	push	{r7}
 80087da:	b08b      	sub	sp, #44	; 0x2c
 80087dc:	af00      	add	r7, sp, #0
 80087de:	60f8      	str	r0, [r7, #12]
 80087e0:	60b9      	str	r1, [r7, #8]
 80087e2:	607a      	str	r2, [r7, #4]
 80087e4:	603b      	str	r3, [r7, #0]
 80087e6:	2300      	movs	r3, #0
 80087e8:	61bb      	str	r3, [r7, #24]
 80087ea:	2300      	movs	r3, #0
 80087ec:	61fb      	str	r3, [r7, #28]
 80087ee:	68fb      	ldr	r3, [r7, #12]
 80087f0:	1d1a      	adds	r2, r3, #4
 80087f2:	60fa      	str	r2, [r7, #12]
 80087f4:	681b      	ldr	r3, [r3, #0]
 80087f6:	627b      	str	r3, [r7, #36]	; 0x24
 80087f8:	68bb      	ldr	r3, [r7, #8]
 80087fa:	3b01      	subs	r3, #1
 80087fc:	089b      	lsrs	r3, r3, #2
 80087fe:	623b      	str	r3, [r7, #32]
 8008800:	e051      	b.n	80088a6 <arm_min_f32+0xce>
 8008802:	68fb      	ldr	r3, [r7, #12]
 8008804:	1d1a      	adds	r2, r3, #4
 8008806:	60fa      	str	r2, [r7, #12]
 8008808:	681b      	ldr	r3, [r3, #0]
 800880a:	617b      	str	r3, [r7, #20]
 800880c:	68fb      	ldr	r3, [r7, #12]
 800880e:	1d1a      	adds	r2, r3, #4
 8008810:	60fa      	str	r2, [r7, #12]
 8008812:	681b      	ldr	r3, [r3, #0]
 8008814:	613b      	str	r3, [r7, #16]
 8008816:	ed97 7a09 	vldr	s14, [r7, #36]	; 0x24
 800881a:	edd7 7a05 	vldr	s15, [r7, #20]
 800881e:	eeb4 7ae7 	vcmpe.f32	s14, s15
 8008822:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8008826:	dd04      	ble.n	8008832 <arm_min_f32+0x5a>
 8008828:	697b      	ldr	r3, [r7, #20]
 800882a:	627b      	str	r3, [r7, #36]	; 0x24
 800882c:	69bb      	ldr	r3, [r7, #24]
 800882e:	3301      	adds	r3, #1
 8008830:	61fb      	str	r3, [r7, #28]
 8008832:	68fb      	ldr	r3, [r7, #12]
 8008834:	1d1a      	adds	r2, r3, #4
 8008836:	60fa      	str	r2, [r7, #12]
 8008838:	681b      	ldr	r3, [r3, #0]
 800883a:	617b      	str	r3, [r7, #20]
 800883c:	ed97 7a09 	vldr	s14, [r7, #36]	; 0x24
 8008840:	edd7 7a04 	vldr	s15, [r7, #16]
 8008844:	eeb4 7ae7 	vcmpe.f32	s14, s15
 8008848:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 800884c:	dd04      	ble.n	8008858 <arm_min_f32+0x80>
 800884e:	693b      	ldr	r3, [r7, #16]
 8008850:	627b      	str	r3, [r7, #36]	; 0x24
 8008852:	69bb      	ldr	r3, [r7, #24]
 8008854:	3302      	adds	r3, #2
 8008856:	61fb      	str	r3, [r7, #28]
 8008858:	68fb      	ldr	r3, [r7, #12]
 800885a:	1d1a      	adds	r2, r3, #4
 800885c:	60fa      	str	r2, [r7, #12]
 800885e:	681b      	ldr	r3, [r3, #0]
 8008860:	613b      	str	r3, [r7, #16]
 8008862:	ed97 7a09 	vldr	s14, [r7, #36]	; 0x24
 8008866:	edd7 7a05 	vldr	s15, [r7, #20]
 800886a:	eeb4 7ae7 	vcmpe.f32	s14, s15
 800886e:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8008872:	dd04      	ble.n	800887e <arm_min_f32+0xa6>
 8008874:	697b      	ldr	r3, [r7, #20]
 8008876:	627b      	str	r3, [r7, #36]	; 0x24
 8008878:	69bb      	ldr	r3, [r7, #24]
 800887a:	3303      	adds	r3, #3
 800887c:	61fb      	str	r3, [r7, #28]
 800887e:	ed97 7a09 	vldr	s14, [r7, #36]	; 0x24
 8008882:	edd7 7a04 	vldr	s15, [r7, #16]
 8008886:	eeb4 7ae7 	vcmpe.f32	s14, s15
 800888a:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 800888e:	dd04      	ble.n	800889a <arm_min_f32+0xc2>
 8008890:	693b      	ldr	r3, [r7, #16]
 8008892:	627b      	str	r3, [r7, #36]	; 0x24
 8008894:	69bb      	ldr	r3, [r7, #24]
 8008896:	3304      	adds	r3, #4
 8008898:	61fb      	str	r3, [r7, #28]
 800889a:	69bb      	ldr	r3, [r7, #24]
 800889c:	3304      	adds	r3, #4
 800889e:	61bb      	str	r3, [r7, #24]
 80088a0:	6a3b      	ldr	r3, [r7, #32]
 80088a2:	3b01      	subs	r3, #1
 80088a4:	623b      	str	r3, [r7, #32]
 80088a6:	6a3b      	ldr	r3, [r7, #32]
 80088a8:	2b00      	cmp	r3, #0
 80088aa:	d1aa      	bne.n	8008802 <arm_min_f32+0x2a>
 80088ac:	68bb      	ldr	r3, [r7, #8]
 80088ae:	3b01      	subs	r3, #1
 80088b0:	f003 0303 	and.w	r3, r3, #3
 80088b4:	623b      	str	r3, [r7, #32]
 80088b6:	e016      	b.n	80088e6 <arm_min_f32+0x10e>
 80088b8:	68fb      	ldr	r3, [r7, #12]
 80088ba:	1d1a      	adds	r2, r3, #4
 80088bc:	60fa      	str	r2, [r7, #12]
 80088be:	681b      	ldr	r3, [r3, #0]
 80088c0:	617b      	str	r3, [r7, #20]
 80088c2:	ed97 7a09 	vldr	s14, [r7, #36]	; 0x24
 80088c6:	edd7 7a05 	vldr	s15, [r7, #20]
 80088ca:	eeb4 7ae7 	vcmpe.f32	s14, s15
 80088ce:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 80088d2:	dd05      	ble.n	80088e0 <arm_min_f32+0x108>
 80088d4:	697b      	ldr	r3, [r7, #20]
 80088d6:	627b      	str	r3, [r7, #36]	; 0x24
 80088d8:	68ba      	ldr	r2, [r7, #8]
 80088da:	6a3b      	ldr	r3, [r7, #32]
 80088dc:	1ad3      	subs	r3, r2, r3
 80088de:	61fb      	str	r3, [r7, #28]
 80088e0:	6a3b      	ldr	r3, [r7, #32]
 80088e2:	3b01      	subs	r3, #1
 80088e4:	623b      	str	r3, [r7, #32]
 80088e6:	6a3b      	ldr	r3, [r7, #32]
 80088e8:	2b00      	cmp	r3, #0
 80088ea:	d1e5      	bne.n	80088b8 <arm_min_f32+0xe0>
 80088ec:	687b      	ldr	r3, [r7, #4]
 80088ee:	6a7a      	ldr	r2, [r7, #36]	; 0x24
 80088f0:	601a      	str	r2, [r3, #0]
 80088f2:	683b      	ldr	r3, [r7, #0]
 80088f4:	2b00      	cmp	r3, #0
 80088f6:	d002      	beq.n	80088fe <arm_min_f32+0x126>
 80088f8:	683b      	ldr	r3, [r7, #0]
 80088fa:	69fa      	ldr	r2, [r7, #28]
 80088fc:	601a      	str	r2, [r3, #0]
 80088fe:	bf00      	nop
 8008900:	372c      	adds	r7, #44	; 0x2c
 8008902:	46bd      	mov	sp, r7
 8008904:	f85d 7b04 	ldr.w	r7, [sp], #4
 8008908:	4770      	bx	lr

0800890a <arm_mat_init_f32>:
 800890a:	b480      	push	{r7}
 800890c:	b085      	sub	sp, #20
 800890e:	af00      	add	r7, sp, #0
 8008910:	60f8      	str	r0, [r7, #12]
 8008912:	607b      	str	r3, [r7, #4]
 8008914:	460b      	mov	r3, r1
 8008916:	817b      	strh	r3, [r7, #10]
 8008918:	4613      	mov	r3, r2
 800891a:	813b      	strh	r3, [r7, #8]
 800891c:	68fb      	ldr	r3, [r7, #12]
 800891e:	897a      	ldrh	r2, [r7, #10]
 8008920:	801a      	strh	r2, [r3, #0]
 8008922:	68fb      	ldr	r3, [r7, #12]
 8008924:	893a      	ldrh	r2, [r7, #8]
 8008926:	805a      	strh	r2, [r3, #2]
 8008928:	68fb      	ldr	r3, [r7, #12]
 800892a:	687a      	ldr	r2, [r7, #4]
 800892c:	605a      	str	r2, [r3, #4]
 800892e:	bf00      	nop
 8008930:	3714      	adds	r7, #20
 8008932:	46bd      	mov	sp, r7
 8008934:	f85d 7b04 	ldr.w	r7, [sp], #4
 8008938:	4770      	bx	lr

0800893a <arm_mat_add_f32>:
 800893a:	b480      	push	{r7}
 800893c:	b091      	sub	sp, #68	; 0x44
 800893e:	af00      	add	r7, sp, #0
 8008940:	60f8      	str	r0, [r7, #12]
 8008942:	60b9      	str	r1, [r7, #8]
 8008944:	607a      	str	r2, [r7, #4]
 8008946:	68fb      	ldr	r3, [r7, #12]
 8008948:	685b      	ldr	r3, [r3, #4]
 800894a:	63fb      	str	r3, [r7, #60]	; 0x3c
 800894c:	68bb      	ldr	r3, [r7, #8]
 800894e:	685b      	ldr	r3, [r3, #4]
 8008950:	63bb      	str	r3, [r7, #56]	; 0x38
 8008952:	687b      	ldr	r3, [r7, #4]
 8008954:	685b      	ldr	r3, [r3, #4]
 8008956:	637b      	str	r3, [r7, #52]	; 0x34
 8008958:	68fb      	ldr	r3, [r7, #12]
 800895a:	881b      	ldrh	r3, [r3, #0]
 800895c:	461a      	mov	r2, r3
 800895e:	68fb      	ldr	r3, [r7, #12]
 8008960:	885b      	ldrh	r3, [r3, #2]
 8008962:	fb03 f302 	mul.w	r3, r3, r2
 8008966:	62fb      	str	r3, [r7, #44]	; 0x2c
 8008968:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 800896a:	089b      	lsrs	r3, r3, #2
 800896c:	633b      	str	r3, [r7, #48]	; 0x30
 800896e:	e052      	b.n	8008a16 <arm_mat_add_f32+0xdc>
 8008970:	6bfb      	ldr	r3, [r7, #60]	; 0x3c
 8008972:	681b      	ldr	r3, [r3, #0]
 8008974:	627b      	str	r3, [r7, #36]	; 0x24
 8008976:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 8008978:	681b      	ldr	r3, [r3, #0]
 800897a:	623b      	str	r3, [r7, #32]
 800897c:	6bfb      	ldr	r3, [r7, #60]	; 0x3c
 800897e:	685b      	ldr	r3, [r3, #4]
 8008980:	61fb      	str	r3, [r7, #28]
 8008982:	ed97 7a09 	vldr	s14, [r7, #36]	; 0x24
 8008986:	edd7 7a08 	vldr	s15, [r7, #32]
 800898a:	ee77 7a27 	vadd.f32	s15, s14, s15
 800898e:	edc7 7a06 	vstr	s15, [r7, #24]
 8008992:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 8008994:	685b      	ldr	r3, [r3, #4]
 8008996:	617b      	str	r3, [r7, #20]
 8008998:	6bfb      	ldr	r3, [r7, #60]	; 0x3c
 800899a:	689b      	ldr	r3, [r3, #8]
 800899c:	627b      	str	r3, [r7, #36]	; 0x24
 800899e:	ed97 7a07 	vldr	s14, [r7, #28]
 80089a2:	edd7 7a05 	vldr	s15, [r7, #20]
 80089a6:	ee77 7a27 	vadd.f32	s15, s14, s15
 80089aa:	edc7 7a04 	vstr	s15, [r7, #16]
 80089ae:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 80089b0:	689b      	ldr	r3, [r3, #8]
 80089b2:	623b      	str	r3, [r7, #32]
 80089b4:	6b7b      	ldr	r3, [r7, #52]	; 0x34
 80089b6:	69ba      	ldr	r2, [r7, #24]
 80089b8:	601a      	str	r2, [r3, #0]
 80089ba:	6b7b      	ldr	r3, [r7, #52]	; 0x34
 80089bc:	3304      	adds	r3, #4
 80089be:	693a      	ldr	r2, [r7, #16]
 80089c0:	601a      	str	r2, [r3, #0]
 80089c2:	6bfb      	ldr	r3, [r7, #60]	; 0x3c
 80089c4:	68db      	ldr	r3, [r3, #12]
 80089c6:	61fb      	str	r3, [r7, #28]
 80089c8:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 80089ca:	68db      	ldr	r3, [r3, #12]
 80089cc:	617b      	str	r3, [r7, #20]
 80089ce:	ed97 7a09 	vldr	s14, [r7, #36]	; 0x24
 80089d2:	edd7 7a08 	vldr	s15, [r7, #32]
 80089d6:	ee77 7a27 	vadd.f32	s15, s14, s15
 80089da:	edc7 7a06 	vstr	s15, [r7, #24]
 80089de:	ed97 7a07 	vldr	s14, [r7, #28]
 80089e2:	edd7 7a05 	vldr	s15, [r7, #20]
 80089e6:	ee77 7a27 	vadd.f32	s15, s14, s15
 80089ea:	edc7 7a04 	vstr	s15, [r7, #16]
 80089ee:	6b7b      	ldr	r3, [r7, #52]	; 0x34
 80089f0:	3308      	adds	r3, #8
 80089f2:	69ba      	ldr	r2, [r7, #24]
 80089f4:	601a      	str	r2, [r3, #0]
 80089f6:	6b7b      	ldr	r3, [r7, #52]	; 0x34
 80089f8:	330c      	adds	r3, #12
 80089fa:	693a      	ldr	r2, [r7, #16]
 80089fc:	601a      	str	r2, [r3, #0]
 80089fe:	6bfb      	ldr	r3, [r7, #60]	; 0x3c
 8008a00:	3310      	adds	r3, #16
 8008a02:	63fb      	str	r3, [r7, #60]	; 0x3c
 8008a04:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 8008a06:	3310      	adds	r3, #16
 8008a08:	63bb      	str	r3, [r7, #56]	; 0x38
 8008a0a:	6b7b      	ldr	r3, [r7, #52]	; 0x34
 8008a0c:	3310      	adds	r3, #16
 8008a0e:	637b      	str	r3, [r7, #52]	; 0x34
 8008a10:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 8008a12:	3b01      	subs	r3, #1
 8008a14:	633b      	str	r3, [r7, #48]	; 0x30
 8008a16:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 8008a18:	2b00      	cmp	r3, #0
 8008a1a:	d1a9      	bne.n	8008970 <arm_mat_add_f32+0x36>
 8008a1c:	6afb      	ldr	r3, [r7, #44]	; 0x2c
 8008a1e:	f003 0303 	and.w	r3, r3, #3
 8008a22:	633b      	str	r3, [r7, #48]	; 0x30
 8008a24:	e013      	b.n	8008a4e <arm_mat_add_f32+0x114>
 8008a26:	6bfb      	ldr	r3, [r7, #60]	; 0x3c
 8008a28:	1d1a      	adds	r2, r3, #4
 8008a2a:	63fa      	str	r2, [r7, #60]	; 0x3c
 8008a2c:	ed93 7a00 	vldr	s14, [r3]
 8008a30:	6bbb      	ldr	r3, [r7, #56]	; 0x38
 8008a32:	1d1a      	adds	r2, r3, #4
 8008a34:	63ba      	str	r2, [r7, #56]	; 0x38
 8008a36:	edd3 7a00 	vldr	s15, [r3]
 8008a3a:	6b7b      	ldr	r3, [r7, #52]	; 0x34
 8008a3c:	1d1a      	adds	r2, r3, #4
 8008a3e:	637a      	str	r2, [r7, #52]	; 0x34
 8008a40:	ee77 7a27 	vadd.f32	s15, s14, s15
 8008a44:	edc3 7a00 	vstr	s15, [r3]
 8008a48:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 8008a4a:	3b01      	subs	r3, #1
 8008a4c:	633b      	str	r3, [r7, #48]	; 0x30
 8008a4e:	6b3b      	ldr	r3, [r7, #48]	; 0x30
 8008a50:	2b00      	cmp	r3, #0
 8008a52:	d1e8      	bne.n	8008a26 <arm_mat_add_f32+0xec>
 8008a54:	2300      	movs	r3, #0
 8008a56:	f887 302b 	strb.w	r3, [r7, #43]	; 0x2b
 8008a5a:	f997 302b 	ldrsb.w	r3, [r7, #43]	; 0x2b
 8008a5e:	4618      	mov	r0, r3
 8008a60:	3744      	adds	r7, #68	; 0x44
 8008a62:	46bd      	mov	sp, r7
 8008a64:	f85d 7b04 	ldr.w	r7, [sp], #4
 8008a68:	4770      	bx	lr
	...

08008a6c <__libc_init_array>:
 8008a6c:	b570      	push	{r4, r5, r6, lr}
 8008a6e:	4e0d      	ldr	r6, [pc, #52]	; (8008aa4 <__libc_init_array+0x38>)
 8008a70:	4c0d      	ldr	r4, [pc, #52]	; (8008aa8 <__libc_init_array+0x3c>)
 8008a72:	1ba4      	subs	r4, r4, r6
 8008a74:	10a4      	asrs	r4, r4, #2
 8008a76:	2500      	movs	r5, #0
 8008a78:	42a5      	cmp	r5, r4
 8008a7a:	d109      	bne.n	8008a90 <__libc_init_array+0x24>
 8008a7c:	4e0b      	ldr	r6, [pc, #44]	; (8008aac <__libc_init_array+0x40>)
 8008a7e:	4c0c      	ldr	r4, [pc, #48]	; (8008ab0 <__libc_init_array+0x44>)
 8008a80:	f002 fbd4 	bl	800b22c <_init>
 8008a84:	1ba4      	subs	r4, r4, r6
 8008a86:	10a4      	asrs	r4, r4, #2
 8008a88:	2500      	movs	r5, #0
 8008a8a:	42a5      	cmp	r5, r4
 8008a8c:	d105      	bne.n	8008a9a <__libc_init_array+0x2e>
 8008a8e:	bd70      	pop	{r4, r5, r6, pc}
 8008a90:	f856 3025 	ldr.w	r3, [r6, r5, lsl #2]
 8008a94:	4798      	blx	r3
 8008a96:	3501      	adds	r5, #1
 8008a98:	e7ee      	b.n	8008a78 <__libc_init_array+0xc>
 8008a9a:	f856 3025 	ldr.w	r3, [r6, r5, lsl #2]
 8008a9e:	4798      	blx	r3
 8008aa0:	3501      	adds	r5, #1
 8008aa2:	e7f2      	b.n	8008a8a <__libc_init_array+0x1e>
 8008aa4:	0800bb80 	.word	0x0800bb80
 8008aa8:	0800bb80 	.word	0x0800bb80
 8008aac:	0800bb80 	.word	0x0800bb80
 8008ab0:	0800bb84 	.word	0x0800bb84

08008ab4 <malloc>:
 8008ab4:	4b02      	ldr	r3, [pc, #8]	; (8008ac0 <malloc+0xc>)
 8008ab6:	4601      	mov	r1, r0
 8008ab8:	6818      	ldr	r0, [r3, #0]
 8008aba:	f7f8 bae9 	b.w	8001090 <_malloc_r>
 8008abe:	bf00      	nop
 8008ac0:	20000080 	.word	0x20000080

08008ac4 <memcpy>:
 8008ac4:	b510      	push	{r4, lr}
 8008ac6:	1e43      	subs	r3, r0, #1
 8008ac8:	440a      	add	r2, r1
 8008aca:	4291      	cmp	r1, r2
 8008acc:	d100      	bne.n	8008ad0 <memcpy+0xc>
 8008ace:	bd10      	pop	{r4, pc}
 8008ad0:	f811 4b01 	ldrb.w	r4, [r1], #1
 8008ad4:	f803 4f01 	strb.w	r4, [r3, #1]!
 8008ad8:	e7f7      	b.n	8008aca <memcpy+0x6>

08008ada <memset>:
 8008ada:	4402      	add	r2, r0
 8008adc:	4603      	mov	r3, r0
 8008ade:	4293      	cmp	r3, r2
 8008ae0:	d100      	bne.n	8008ae4 <memset+0xa>
 8008ae2:	4770      	bx	lr
 8008ae4:	f803 1b01 	strb.w	r1, [r3], #1
 8008ae8:	e7f9      	b.n	8008ade <memset+0x4>

08008aea <__cvt>:
 8008aea:	e92d 47ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, lr}
 8008aee:	ec55 4b10 	vmov	r4, r5, d0
 8008af2:	9f0d      	ldr	r7, [sp, #52]	; 0x34
 8008af4:	f8dd a030 	ldr.w	sl, [sp, #48]	; 0x30
 8008af8:	2d00      	cmp	r5, #0
 8008afa:	460e      	mov	r6, r1
 8008afc:	4691      	mov	r9, r2
 8008afe:	4619      	mov	r1, r3
 8008b00:	bfb8      	it	lt
 8008b02:	4622      	movlt	r2, r4
 8008b04:	462b      	mov	r3, r5
 8008b06:	f027 0720 	bic.w	r7, r7, #32
 8008b0a:	bfbb      	ittet	lt
 8008b0c:	f105 4300 	addlt.w	r3, r5, #2147483648	; 0x80000000
 8008b10:	461d      	movlt	r5, r3
 8008b12:	2300      	movge	r3, #0
 8008b14:	232d      	movlt	r3, #45	; 0x2d
 8008b16:	bfb8      	it	lt
 8008b18:	4614      	movlt	r4, r2
 8008b1a:	2f46      	cmp	r7, #70	; 0x46
 8008b1c:	700b      	strb	r3, [r1, #0]
 8008b1e:	d004      	beq.n	8008b2a <__cvt+0x40>
 8008b20:	2f45      	cmp	r7, #69	; 0x45
 8008b22:	d100      	bne.n	8008b26 <__cvt+0x3c>
 8008b24:	3601      	adds	r6, #1
 8008b26:	2102      	movs	r1, #2
 8008b28:	e000      	b.n	8008b2c <__cvt+0x42>
 8008b2a:	2103      	movs	r1, #3
 8008b2c:	ab03      	add	r3, sp, #12
 8008b2e:	9301      	str	r3, [sp, #4]
 8008b30:	ab02      	add	r3, sp, #8
 8008b32:	9300      	str	r3, [sp, #0]
 8008b34:	4632      	mov	r2, r6
 8008b36:	4653      	mov	r3, sl
 8008b38:	ec45 4b10 	vmov	d0, r4, r5
 8008b3c:	f000 fc14 	bl	8009368 <_dtoa_r>
 8008b40:	2f47      	cmp	r7, #71	; 0x47
 8008b42:	4680      	mov	r8, r0
 8008b44:	d102      	bne.n	8008b4c <__cvt+0x62>
 8008b46:	f019 0f01 	tst.w	r9, #1
 8008b4a:	d026      	beq.n	8008b9a <__cvt+0xb0>
 8008b4c:	2f46      	cmp	r7, #70	; 0x46
 8008b4e:	eb08 0906 	add.w	r9, r8, r6
 8008b52:	d111      	bne.n	8008b78 <__cvt+0x8e>
 8008b54:	f898 3000 	ldrb.w	r3, [r8]
 8008b58:	2b30      	cmp	r3, #48	; 0x30
 8008b5a:	d10a      	bne.n	8008b72 <__cvt+0x88>
 8008b5c:	2200      	movs	r2, #0
 8008b5e:	2300      	movs	r3, #0
 8008b60:	4620      	mov	r0, r4
 8008b62:	4629      	mov	r1, r5
 8008b64:	f7f7 ffb0 	bl	8000ac8 <__aeabi_dcmpeq>
 8008b68:	b918      	cbnz	r0, 8008b72 <__cvt+0x88>
 8008b6a:	f1c6 0601 	rsb	r6, r6, #1
 8008b6e:	f8ca 6000 	str.w	r6, [sl]
 8008b72:	f8da 3000 	ldr.w	r3, [sl]
 8008b76:	4499      	add	r9, r3
 8008b78:	2200      	movs	r2, #0
 8008b7a:	2300      	movs	r3, #0
 8008b7c:	4620      	mov	r0, r4
 8008b7e:	4629      	mov	r1, r5
 8008b80:	f7f7 ffa2 	bl	8000ac8 <__aeabi_dcmpeq>
 8008b84:	b938      	cbnz	r0, 8008b96 <__cvt+0xac>
 8008b86:	2230      	movs	r2, #48	; 0x30
 8008b88:	9b03      	ldr	r3, [sp, #12]
 8008b8a:	454b      	cmp	r3, r9
 8008b8c:	d205      	bcs.n	8008b9a <__cvt+0xb0>
 8008b8e:	1c59      	adds	r1, r3, #1
 8008b90:	9103      	str	r1, [sp, #12]
 8008b92:	701a      	strb	r2, [r3, #0]
 8008b94:	e7f8      	b.n	8008b88 <__cvt+0x9e>
 8008b96:	f8cd 900c 	str.w	r9, [sp, #12]
 8008b9a:	9b03      	ldr	r3, [sp, #12]
 8008b9c:	9a0e      	ldr	r2, [sp, #56]	; 0x38
 8008b9e:	eba3 0308 	sub.w	r3, r3, r8
 8008ba2:	4640      	mov	r0, r8
 8008ba4:	6013      	str	r3, [r2, #0]
 8008ba6:	b004      	add	sp, #16
 8008ba8:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}

08008bac <__exponent>:
 8008bac:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8008bae:	2900      	cmp	r1, #0
 8008bb0:	4604      	mov	r4, r0
 8008bb2:	bfba      	itte	lt
 8008bb4:	4249      	neglt	r1, r1
 8008bb6:	232d      	movlt	r3, #45	; 0x2d
 8008bb8:	232b      	movge	r3, #43	; 0x2b
 8008bba:	2909      	cmp	r1, #9
 8008bbc:	f804 2b02 	strb.w	r2, [r4], #2
 8008bc0:	7043      	strb	r3, [r0, #1]
 8008bc2:	dd20      	ble.n	8008c06 <__exponent+0x5a>
 8008bc4:	f10d 0307 	add.w	r3, sp, #7
 8008bc8:	461f      	mov	r7, r3
 8008bca:	260a      	movs	r6, #10
 8008bcc:	fb91 f5f6 	sdiv	r5, r1, r6
 8008bd0:	fb06 1115 	mls	r1, r6, r5, r1
 8008bd4:	3130      	adds	r1, #48	; 0x30
 8008bd6:	2d09      	cmp	r5, #9
 8008bd8:	f803 1c01 	strb.w	r1, [r3, #-1]
 8008bdc:	f103 32ff 	add.w	r2, r3, #4294967295	; 0xffffffff
 8008be0:	4629      	mov	r1, r5
 8008be2:	dc09      	bgt.n	8008bf8 <__exponent+0x4c>
 8008be4:	3130      	adds	r1, #48	; 0x30
 8008be6:	3b02      	subs	r3, #2
 8008be8:	f802 1c01 	strb.w	r1, [r2, #-1]
 8008bec:	42bb      	cmp	r3, r7
 8008bee:	4622      	mov	r2, r4
 8008bf0:	d304      	bcc.n	8008bfc <__exponent+0x50>
 8008bf2:	1a10      	subs	r0, r2, r0
 8008bf4:	b003      	add	sp, #12
 8008bf6:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8008bf8:	4613      	mov	r3, r2
 8008bfa:	e7e7      	b.n	8008bcc <__exponent+0x20>
 8008bfc:	f813 2b01 	ldrb.w	r2, [r3], #1
 8008c00:	f804 2b01 	strb.w	r2, [r4], #1
 8008c04:	e7f2      	b.n	8008bec <__exponent+0x40>
 8008c06:	2330      	movs	r3, #48	; 0x30
 8008c08:	4419      	add	r1, r3
 8008c0a:	7083      	strb	r3, [r0, #2]
 8008c0c:	1d02      	adds	r2, r0, #4
 8008c0e:	70c1      	strb	r1, [r0, #3]
 8008c10:	e7ef      	b.n	8008bf2 <__exponent+0x46>
	...

08008c14 <_printf_float>:
 8008c14:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8008c18:	b08d      	sub	sp, #52	; 0x34
 8008c1a:	460c      	mov	r4, r1
 8008c1c:	f8dd 8058 	ldr.w	r8, [sp, #88]	; 0x58
 8008c20:	4616      	mov	r6, r2
 8008c22:	461f      	mov	r7, r3
 8008c24:	4605      	mov	r5, r0
 8008c26:	f001 f957 	bl	8009ed8 <_localeconv_r>
 8008c2a:	6803      	ldr	r3, [r0, #0]
 8008c2c:	9304      	str	r3, [sp, #16]
 8008c2e:	4618      	mov	r0, r3
 8008c30:	f7f7 feec 	bl	8000a0c <strlen>
 8008c34:	2300      	movs	r3, #0
 8008c36:	930a      	str	r3, [sp, #40]	; 0x28
 8008c38:	f8d8 3000 	ldr.w	r3, [r8]
 8008c3c:	9005      	str	r0, [sp, #20]
 8008c3e:	3307      	adds	r3, #7
 8008c40:	f023 0307 	bic.w	r3, r3, #7
 8008c44:	f103 0208 	add.w	r2, r3, #8
 8008c48:	f894 a018 	ldrb.w	sl, [r4, #24]
 8008c4c:	f8d4 b000 	ldr.w	fp, [r4]
 8008c50:	f8c8 2000 	str.w	r2, [r8]
 8008c54:	e9d3 2300 	ldrd	r2, r3, [r3]
 8008c58:	e9c4 2312 	strd	r2, r3, [r4, #72]	; 0x48
 8008c5c:	e9d4 8912 	ldrd	r8, r9, [r4, #72]	; 0x48
 8008c60:	f029 4300 	bic.w	r3, r9, #2147483648	; 0x80000000
 8008c64:	9307      	str	r3, [sp, #28]
 8008c66:	f8cd 8018 	str.w	r8, [sp, #24]
 8008c6a:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
 8008c6e:	4ba7      	ldr	r3, [pc, #668]	; (8008f0c <_printf_float+0x2f8>)
 8008c70:	e9dd 0106 	ldrd	r0, r1, [sp, #24]
 8008c74:	f7f7 ff5a 	bl	8000b2c <__aeabi_dcmpun>
 8008c78:	bb70      	cbnz	r0, 8008cd8 <_printf_float+0xc4>
 8008c7a:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
 8008c7e:	4ba3      	ldr	r3, [pc, #652]	; (8008f0c <_printf_float+0x2f8>)
 8008c80:	e9dd 0106 	ldrd	r0, r1, [sp, #24]
 8008c84:	f7f7 ff34 	bl	8000af0 <__aeabi_dcmple>
 8008c88:	bb30      	cbnz	r0, 8008cd8 <_printf_float+0xc4>
 8008c8a:	2200      	movs	r2, #0
 8008c8c:	2300      	movs	r3, #0
 8008c8e:	4640      	mov	r0, r8
 8008c90:	4649      	mov	r1, r9
 8008c92:	f7f7 ff23 	bl	8000adc <__aeabi_dcmplt>
 8008c96:	b110      	cbz	r0, 8008c9e <_printf_float+0x8a>
 8008c98:	232d      	movs	r3, #45	; 0x2d
 8008c9a:	f884 3043 	strb.w	r3, [r4, #67]	; 0x43
 8008c9e:	4a9c      	ldr	r2, [pc, #624]	; (8008f10 <_printf_float+0x2fc>)
 8008ca0:	4b9c      	ldr	r3, [pc, #624]	; (8008f14 <_printf_float+0x300>)
 8008ca2:	f1ba 0f47 	cmp.w	sl, #71	; 0x47
 8008ca6:	bf8c      	ite	hi
 8008ca8:	4690      	movhi	r8, r2
 8008caa:	4698      	movls	r8, r3
 8008cac:	2303      	movs	r3, #3
 8008cae:	f02b 0204 	bic.w	r2, fp, #4
 8008cb2:	6123      	str	r3, [r4, #16]
 8008cb4:	6022      	str	r2, [r4, #0]
 8008cb6:	f04f 0900 	mov.w	r9, #0
 8008cba:	9700      	str	r7, [sp, #0]
 8008cbc:	4633      	mov	r3, r6
 8008cbe:	aa0b      	add	r2, sp, #44	; 0x2c
 8008cc0:	4621      	mov	r1, r4
 8008cc2:	4628      	mov	r0, r5
 8008cc4:	f000 f9e6 	bl	8009094 <_printf_common>
 8008cc8:	3001      	adds	r0, #1
 8008cca:	f040 808d 	bne.w	8008de8 <_printf_float+0x1d4>
 8008cce:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 8008cd2:	b00d      	add	sp, #52	; 0x34
 8008cd4:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 8008cd8:	4642      	mov	r2, r8
 8008cda:	464b      	mov	r3, r9
 8008cdc:	4640      	mov	r0, r8
 8008cde:	4649      	mov	r1, r9
 8008ce0:	f7f7 ff24 	bl	8000b2c <__aeabi_dcmpun>
 8008ce4:	b110      	cbz	r0, 8008cec <_printf_float+0xd8>
 8008ce6:	4a8c      	ldr	r2, [pc, #560]	; (8008f18 <_printf_float+0x304>)
 8008ce8:	4b8c      	ldr	r3, [pc, #560]	; (8008f1c <_printf_float+0x308>)
 8008cea:	e7da      	b.n	8008ca2 <_printf_float+0x8e>
 8008cec:	6861      	ldr	r1, [r4, #4]
 8008cee:	1c4b      	adds	r3, r1, #1
 8008cf0:	f44b 6280 	orr.w	r2, fp, #1024	; 0x400
 8008cf4:	a80a      	add	r0, sp, #40	; 0x28
 8008cf6:	d13e      	bne.n	8008d76 <_printf_float+0x162>
 8008cf8:	2306      	movs	r3, #6
 8008cfa:	6063      	str	r3, [r4, #4]
 8008cfc:	2300      	movs	r3, #0
 8008cfe:	e9cd 0302 	strd	r0, r3, [sp, #8]
 8008d02:	ab09      	add	r3, sp, #36	; 0x24
 8008d04:	9300      	str	r3, [sp, #0]
 8008d06:	ec49 8b10 	vmov	d0, r8, r9
 8008d0a:	f10d 0323 	add.w	r3, sp, #35	; 0x23
 8008d0e:	6022      	str	r2, [r4, #0]
 8008d10:	f8cd a004 	str.w	sl, [sp, #4]
 8008d14:	6861      	ldr	r1, [r4, #4]
 8008d16:	4628      	mov	r0, r5
 8008d18:	f7ff fee7 	bl	8008aea <__cvt>
 8008d1c:	f00a 03df 	and.w	r3, sl, #223	; 0xdf
 8008d20:	2b47      	cmp	r3, #71	; 0x47
 8008d22:	4680      	mov	r8, r0
 8008d24:	d109      	bne.n	8008d3a <_printf_float+0x126>
 8008d26:	9b09      	ldr	r3, [sp, #36]	; 0x24
 8008d28:	1cd8      	adds	r0, r3, #3
 8008d2a:	db02      	blt.n	8008d32 <_printf_float+0x11e>
 8008d2c:	6862      	ldr	r2, [r4, #4]
 8008d2e:	4293      	cmp	r3, r2
 8008d30:	dd47      	ble.n	8008dc2 <_printf_float+0x1ae>
 8008d32:	f1aa 0a02 	sub.w	sl, sl, #2
 8008d36:	fa5f fa8a 	uxtb.w	sl, sl
 8008d3a:	f1ba 0f65 	cmp.w	sl, #101	; 0x65
 8008d3e:	9909      	ldr	r1, [sp, #36]	; 0x24
 8008d40:	d824      	bhi.n	8008d8c <_printf_float+0x178>
 8008d42:	3901      	subs	r1, #1
 8008d44:	4652      	mov	r2, sl
 8008d46:	f104 0050 	add.w	r0, r4, #80	; 0x50
 8008d4a:	9109      	str	r1, [sp, #36]	; 0x24
 8008d4c:	f7ff ff2e 	bl	8008bac <__exponent>
 8008d50:	9a0a      	ldr	r2, [sp, #40]	; 0x28
 8008d52:	1813      	adds	r3, r2, r0
 8008d54:	2a01      	cmp	r2, #1
 8008d56:	4681      	mov	r9, r0
 8008d58:	6123      	str	r3, [r4, #16]
 8008d5a:	dc02      	bgt.n	8008d62 <_printf_float+0x14e>
 8008d5c:	6822      	ldr	r2, [r4, #0]
 8008d5e:	07d1      	lsls	r1, r2, #31
 8008d60:	d501      	bpl.n	8008d66 <_printf_float+0x152>
 8008d62:	3301      	adds	r3, #1
 8008d64:	6123      	str	r3, [r4, #16]
 8008d66:	f89d 3023 	ldrb.w	r3, [sp, #35]	; 0x23
 8008d6a:	2b00      	cmp	r3, #0
 8008d6c:	d0a5      	beq.n	8008cba <_printf_float+0xa6>
 8008d6e:	232d      	movs	r3, #45	; 0x2d
 8008d70:	f884 3043 	strb.w	r3, [r4, #67]	; 0x43
 8008d74:	e7a1      	b.n	8008cba <_printf_float+0xa6>
 8008d76:	f1ba 0f67 	cmp.w	sl, #103	; 0x67
 8008d7a:	f000 8177 	beq.w	800906c <_printf_float+0x458>
 8008d7e:	f1ba 0f47 	cmp.w	sl, #71	; 0x47
 8008d82:	d1bb      	bne.n	8008cfc <_printf_float+0xe8>
 8008d84:	2900      	cmp	r1, #0
 8008d86:	d1b9      	bne.n	8008cfc <_printf_float+0xe8>
 8008d88:	2301      	movs	r3, #1
 8008d8a:	e7b6      	b.n	8008cfa <_printf_float+0xe6>
 8008d8c:	f1ba 0f66 	cmp.w	sl, #102	; 0x66
 8008d90:	d119      	bne.n	8008dc6 <_printf_float+0x1b2>
 8008d92:	2900      	cmp	r1, #0
 8008d94:	6863      	ldr	r3, [r4, #4]
 8008d96:	dd0c      	ble.n	8008db2 <_printf_float+0x19e>
 8008d98:	6121      	str	r1, [r4, #16]
 8008d9a:	b913      	cbnz	r3, 8008da2 <_printf_float+0x18e>
 8008d9c:	6822      	ldr	r2, [r4, #0]
 8008d9e:	07d2      	lsls	r2, r2, #31
 8008da0:	d502      	bpl.n	8008da8 <_printf_float+0x194>
 8008da2:	3301      	adds	r3, #1
 8008da4:	440b      	add	r3, r1
 8008da6:	6123      	str	r3, [r4, #16]
 8008da8:	9b09      	ldr	r3, [sp, #36]	; 0x24
 8008daa:	65a3      	str	r3, [r4, #88]	; 0x58
 8008dac:	f04f 0900 	mov.w	r9, #0
 8008db0:	e7d9      	b.n	8008d66 <_printf_float+0x152>
 8008db2:	b913      	cbnz	r3, 8008dba <_printf_float+0x1a6>
 8008db4:	6822      	ldr	r2, [r4, #0]
 8008db6:	07d0      	lsls	r0, r2, #31
 8008db8:	d501      	bpl.n	8008dbe <_printf_float+0x1aa>
 8008dba:	3302      	adds	r3, #2
 8008dbc:	e7f3      	b.n	8008da6 <_printf_float+0x192>
 8008dbe:	2301      	movs	r3, #1
 8008dc0:	e7f1      	b.n	8008da6 <_printf_float+0x192>
 8008dc2:	f04f 0a67 	mov.w	sl, #103	; 0x67
 8008dc6:	e9dd 3209 	ldrd	r3, r2, [sp, #36]	; 0x24
 8008dca:	4293      	cmp	r3, r2
 8008dcc:	db05      	blt.n	8008dda <_printf_float+0x1c6>
 8008dce:	6822      	ldr	r2, [r4, #0]
 8008dd0:	6123      	str	r3, [r4, #16]
 8008dd2:	07d1      	lsls	r1, r2, #31
 8008dd4:	d5e8      	bpl.n	8008da8 <_printf_float+0x194>
 8008dd6:	3301      	adds	r3, #1
 8008dd8:	e7e5      	b.n	8008da6 <_printf_float+0x192>
 8008dda:	2b00      	cmp	r3, #0
 8008ddc:	bfd4      	ite	le
 8008dde:	f1c3 0302 	rsble	r3, r3, #2
 8008de2:	2301      	movgt	r3, #1
 8008de4:	4413      	add	r3, r2
 8008de6:	e7de      	b.n	8008da6 <_printf_float+0x192>
 8008de8:	6823      	ldr	r3, [r4, #0]
 8008dea:	055a      	lsls	r2, r3, #21
 8008dec:	d407      	bmi.n	8008dfe <_printf_float+0x1ea>
 8008dee:	6923      	ldr	r3, [r4, #16]
 8008df0:	4642      	mov	r2, r8
 8008df2:	4631      	mov	r1, r6
 8008df4:	4628      	mov	r0, r5
 8008df6:	47b8      	blx	r7
 8008df8:	3001      	adds	r0, #1
 8008dfa:	d12b      	bne.n	8008e54 <_printf_float+0x240>
 8008dfc:	e767      	b.n	8008cce <_printf_float+0xba>
 8008dfe:	f1ba 0f65 	cmp.w	sl, #101	; 0x65
 8008e02:	f240 80dc 	bls.w	8008fbe <_printf_float+0x3aa>
 8008e06:	2200      	movs	r2, #0
 8008e08:	2300      	movs	r3, #0
 8008e0a:	e9d4 0112 	ldrd	r0, r1, [r4, #72]	; 0x48
 8008e0e:	f7f7 fe5b 	bl	8000ac8 <__aeabi_dcmpeq>
 8008e12:	2800      	cmp	r0, #0
 8008e14:	d033      	beq.n	8008e7e <_printf_float+0x26a>
 8008e16:	2301      	movs	r3, #1
 8008e18:	4a41      	ldr	r2, [pc, #260]	; (8008f20 <_printf_float+0x30c>)
 8008e1a:	4631      	mov	r1, r6
 8008e1c:	4628      	mov	r0, r5
 8008e1e:	47b8      	blx	r7
 8008e20:	3001      	adds	r0, #1
 8008e22:	f43f af54 	beq.w	8008cce <_printf_float+0xba>
 8008e26:	e9dd 2309 	ldrd	r2, r3, [sp, #36]	; 0x24
 8008e2a:	429a      	cmp	r2, r3
 8008e2c:	db02      	blt.n	8008e34 <_printf_float+0x220>
 8008e2e:	6823      	ldr	r3, [r4, #0]
 8008e30:	07d8      	lsls	r0, r3, #31
 8008e32:	d50f      	bpl.n	8008e54 <_printf_float+0x240>
 8008e34:	e9dd 2304 	ldrd	r2, r3, [sp, #16]
 8008e38:	4631      	mov	r1, r6
 8008e3a:	4628      	mov	r0, r5
 8008e3c:	47b8      	blx	r7
 8008e3e:	3001      	adds	r0, #1
 8008e40:	f43f af45 	beq.w	8008cce <_printf_float+0xba>
 8008e44:	f04f 0800 	mov.w	r8, #0
 8008e48:	f104 091a 	add.w	r9, r4, #26
 8008e4c:	9b0a      	ldr	r3, [sp, #40]	; 0x28
 8008e4e:	3b01      	subs	r3, #1
 8008e50:	4543      	cmp	r3, r8
 8008e52:	dc09      	bgt.n	8008e68 <_printf_float+0x254>
 8008e54:	6823      	ldr	r3, [r4, #0]
 8008e56:	079b      	lsls	r3, r3, #30
 8008e58:	f100 8103 	bmi.w	8009062 <_printf_float+0x44e>
 8008e5c:	68e0      	ldr	r0, [r4, #12]
 8008e5e:	9b0b      	ldr	r3, [sp, #44]	; 0x2c
 8008e60:	4298      	cmp	r0, r3
 8008e62:	bfb8      	it	lt
 8008e64:	4618      	movlt	r0, r3
 8008e66:	e734      	b.n	8008cd2 <_printf_float+0xbe>
 8008e68:	2301      	movs	r3, #1
 8008e6a:	464a      	mov	r2, r9
 8008e6c:	4631      	mov	r1, r6
 8008e6e:	4628      	mov	r0, r5
 8008e70:	47b8      	blx	r7
 8008e72:	3001      	adds	r0, #1
 8008e74:	f43f af2b 	beq.w	8008cce <_printf_float+0xba>
 8008e78:	f108 0801 	add.w	r8, r8, #1
 8008e7c:	e7e6      	b.n	8008e4c <_printf_float+0x238>
 8008e7e:	9b09      	ldr	r3, [sp, #36]	; 0x24
 8008e80:	2b00      	cmp	r3, #0
 8008e82:	dc2b      	bgt.n	8008edc <_printf_float+0x2c8>
 8008e84:	2301      	movs	r3, #1
 8008e86:	4a26      	ldr	r2, [pc, #152]	; (8008f20 <_printf_float+0x30c>)
 8008e88:	4631      	mov	r1, r6
 8008e8a:	4628      	mov	r0, r5
 8008e8c:	47b8      	blx	r7
 8008e8e:	3001      	adds	r0, #1
 8008e90:	f43f af1d 	beq.w	8008cce <_printf_float+0xba>
 8008e94:	9b09      	ldr	r3, [sp, #36]	; 0x24
 8008e96:	b923      	cbnz	r3, 8008ea2 <_printf_float+0x28e>
 8008e98:	9b0a      	ldr	r3, [sp, #40]	; 0x28
 8008e9a:	b913      	cbnz	r3, 8008ea2 <_printf_float+0x28e>
 8008e9c:	6823      	ldr	r3, [r4, #0]
 8008e9e:	07d9      	lsls	r1, r3, #31
 8008ea0:	d5d8      	bpl.n	8008e54 <_printf_float+0x240>
 8008ea2:	e9dd 2304 	ldrd	r2, r3, [sp, #16]
 8008ea6:	4631      	mov	r1, r6
 8008ea8:	4628      	mov	r0, r5
 8008eaa:	47b8      	blx	r7
 8008eac:	3001      	adds	r0, #1
 8008eae:	f43f af0e 	beq.w	8008cce <_printf_float+0xba>
 8008eb2:	f04f 0900 	mov.w	r9, #0
 8008eb6:	f104 0a1a 	add.w	sl, r4, #26
 8008eba:	9b09      	ldr	r3, [sp, #36]	; 0x24
 8008ebc:	425b      	negs	r3, r3
 8008ebe:	454b      	cmp	r3, r9
 8008ec0:	dc01      	bgt.n	8008ec6 <_printf_float+0x2b2>
 8008ec2:	9b0a      	ldr	r3, [sp, #40]	; 0x28
 8008ec4:	e794      	b.n	8008df0 <_printf_float+0x1dc>
 8008ec6:	2301      	movs	r3, #1
 8008ec8:	4652      	mov	r2, sl
 8008eca:	4631      	mov	r1, r6
 8008ecc:	4628      	mov	r0, r5
 8008ece:	47b8      	blx	r7
 8008ed0:	3001      	adds	r0, #1
 8008ed2:	f43f aefc 	beq.w	8008cce <_printf_float+0xba>
 8008ed6:	f109 0901 	add.w	r9, r9, #1
 8008eda:	e7ee      	b.n	8008eba <_printf_float+0x2a6>
 8008edc:	9a0a      	ldr	r2, [sp, #40]	; 0x28
 8008ede:	6da3      	ldr	r3, [r4, #88]	; 0x58
 8008ee0:	429a      	cmp	r2, r3
 8008ee2:	bfa8      	it	ge
 8008ee4:	461a      	movge	r2, r3
 8008ee6:	2a00      	cmp	r2, #0
 8008ee8:	4691      	mov	r9, r2
 8008eea:	dd07      	ble.n	8008efc <_printf_float+0x2e8>
 8008eec:	4613      	mov	r3, r2
 8008eee:	4631      	mov	r1, r6
 8008ef0:	4642      	mov	r2, r8
 8008ef2:	4628      	mov	r0, r5
 8008ef4:	47b8      	blx	r7
 8008ef6:	3001      	adds	r0, #1
 8008ef8:	f43f aee9 	beq.w	8008cce <_printf_float+0xba>
 8008efc:	f104 031a 	add.w	r3, r4, #26
 8008f00:	f04f 0b00 	mov.w	fp, #0
 8008f04:	ea29 79e9 	bic.w	r9, r9, r9, asr #31
 8008f08:	9306      	str	r3, [sp, #24]
 8008f0a:	e015      	b.n	8008f38 <_printf_float+0x324>
 8008f0c:	7fefffff 	.word	0x7fefffff
 8008f10:	0800b527 	.word	0x0800b527
 8008f14:	0800b523 	.word	0x0800b523
 8008f18:	0800b52f 	.word	0x0800b52f
 8008f1c:	0800b52b 	.word	0x0800b52b
 8008f20:	0800b533 	.word	0x0800b533
 8008f24:	2301      	movs	r3, #1
 8008f26:	9a06      	ldr	r2, [sp, #24]
 8008f28:	4631      	mov	r1, r6
 8008f2a:	4628      	mov	r0, r5
 8008f2c:	47b8      	blx	r7
 8008f2e:	3001      	adds	r0, #1
 8008f30:	f43f aecd 	beq.w	8008cce <_printf_float+0xba>
 8008f34:	f10b 0b01 	add.w	fp, fp, #1
 8008f38:	f8d4 a058 	ldr.w	sl, [r4, #88]	; 0x58
 8008f3c:	ebaa 0309 	sub.w	r3, sl, r9
 8008f40:	455b      	cmp	r3, fp
 8008f42:	dcef      	bgt.n	8008f24 <_printf_float+0x310>
 8008f44:	e9dd 2309 	ldrd	r2, r3, [sp, #36]	; 0x24
 8008f48:	429a      	cmp	r2, r3
 8008f4a:	44d0      	add	r8, sl
 8008f4c:	db15      	blt.n	8008f7a <_printf_float+0x366>
 8008f4e:	6823      	ldr	r3, [r4, #0]
 8008f50:	07da      	lsls	r2, r3, #31
 8008f52:	d412      	bmi.n	8008f7a <_printf_float+0x366>
 8008f54:	9b0a      	ldr	r3, [sp, #40]	; 0x28
 8008f56:	9909      	ldr	r1, [sp, #36]	; 0x24
 8008f58:	eba3 020a 	sub.w	r2, r3, sl
 8008f5c:	eba3 0a01 	sub.w	sl, r3, r1
 8008f60:	4592      	cmp	sl, r2
 8008f62:	bfa8      	it	ge
 8008f64:	4692      	movge	sl, r2
 8008f66:	f1ba 0f00 	cmp.w	sl, #0
 8008f6a:	dc0e      	bgt.n	8008f8a <_printf_float+0x376>
 8008f6c:	f04f 0800 	mov.w	r8, #0
 8008f70:	ea2a 7aea 	bic.w	sl, sl, sl, asr #31
 8008f74:	f104 091a 	add.w	r9, r4, #26
 8008f78:	e019      	b.n	8008fae <_printf_float+0x39a>
 8008f7a:	e9dd 2304 	ldrd	r2, r3, [sp, #16]
 8008f7e:	4631      	mov	r1, r6
 8008f80:	4628      	mov	r0, r5
 8008f82:	47b8      	blx	r7
 8008f84:	3001      	adds	r0, #1
 8008f86:	d1e5      	bne.n	8008f54 <_printf_float+0x340>
 8008f88:	e6a1      	b.n	8008cce <_printf_float+0xba>
 8008f8a:	4653      	mov	r3, sl
 8008f8c:	4642      	mov	r2, r8
 8008f8e:	4631      	mov	r1, r6
 8008f90:	4628      	mov	r0, r5
 8008f92:	47b8      	blx	r7
 8008f94:	3001      	adds	r0, #1
 8008f96:	d1e9      	bne.n	8008f6c <_printf_float+0x358>
 8008f98:	e699      	b.n	8008cce <_printf_float+0xba>
 8008f9a:	2301      	movs	r3, #1
 8008f9c:	464a      	mov	r2, r9
 8008f9e:	4631      	mov	r1, r6
 8008fa0:	4628      	mov	r0, r5
 8008fa2:	47b8      	blx	r7
 8008fa4:	3001      	adds	r0, #1
 8008fa6:	f43f ae92 	beq.w	8008cce <_printf_float+0xba>
 8008faa:	f108 0801 	add.w	r8, r8, #1
 8008fae:	e9dd 2309 	ldrd	r2, r3, [sp, #36]	; 0x24
 8008fb2:	1a9b      	subs	r3, r3, r2
 8008fb4:	eba3 030a 	sub.w	r3, r3, sl
 8008fb8:	4543      	cmp	r3, r8
 8008fba:	dcee      	bgt.n	8008f9a <_printf_float+0x386>
 8008fbc:	e74a      	b.n	8008e54 <_printf_float+0x240>
 8008fbe:	9a0a      	ldr	r2, [sp, #40]	; 0x28
 8008fc0:	2a01      	cmp	r2, #1
 8008fc2:	dc01      	bgt.n	8008fc8 <_printf_float+0x3b4>
 8008fc4:	07db      	lsls	r3, r3, #31
 8008fc6:	d53a      	bpl.n	800903e <_printf_float+0x42a>
 8008fc8:	2301      	movs	r3, #1
 8008fca:	4642      	mov	r2, r8
 8008fcc:	4631      	mov	r1, r6
 8008fce:	4628      	mov	r0, r5
 8008fd0:	47b8      	blx	r7
 8008fd2:	3001      	adds	r0, #1
 8008fd4:	f43f ae7b 	beq.w	8008cce <_printf_float+0xba>
 8008fd8:	e9dd 2304 	ldrd	r2, r3, [sp, #16]
 8008fdc:	4631      	mov	r1, r6
 8008fde:	4628      	mov	r0, r5
 8008fe0:	47b8      	blx	r7
 8008fe2:	3001      	adds	r0, #1
 8008fe4:	f108 0801 	add.w	r8, r8, #1
 8008fe8:	f43f ae71 	beq.w	8008cce <_printf_float+0xba>
 8008fec:	9b0a      	ldr	r3, [sp, #40]	; 0x28
 8008fee:	2200      	movs	r2, #0
 8008ff0:	f103 3aff 	add.w	sl, r3, #4294967295	; 0xffffffff
 8008ff4:	e9d4 0112 	ldrd	r0, r1, [r4, #72]	; 0x48
 8008ff8:	2300      	movs	r3, #0
 8008ffa:	f7f7 fd65 	bl	8000ac8 <__aeabi_dcmpeq>
 8008ffe:	b9c8      	cbnz	r0, 8009034 <_printf_float+0x420>
 8009000:	4653      	mov	r3, sl
 8009002:	4642      	mov	r2, r8
 8009004:	4631      	mov	r1, r6
 8009006:	4628      	mov	r0, r5
 8009008:	47b8      	blx	r7
 800900a:	3001      	adds	r0, #1
 800900c:	d10e      	bne.n	800902c <_printf_float+0x418>
 800900e:	e65e      	b.n	8008cce <_printf_float+0xba>
 8009010:	2301      	movs	r3, #1
 8009012:	4652      	mov	r2, sl
 8009014:	4631      	mov	r1, r6
 8009016:	4628      	mov	r0, r5
 8009018:	47b8      	blx	r7
 800901a:	3001      	adds	r0, #1
 800901c:	f43f ae57 	beq.w	8008cce <_printf_float+0xba>
 8009020:	f108 0801 	add.w	r8, r8, #1
 8009024:	9b0a      	ldr	r3, [sp, #40]	; 0x28
 8009026:	3b01      	subs	r3, #1
 8009028:	4543      	cmp	r3, r8
 800902a:	dcf1      	bgt.n	8009010 <_printf_float+0x3fc>
 800902c:	464b      	mov	r3, r9
 800902e:	f104 0250 	add.w	r2, r4, #80	; 0x50
 8009032:	e6de      	b.n	8008df2 <_printf_float+0x1de>
 8009034:	f04f 0800 	mov.w	r8, #0
 8009038:	f104 0a1a 	add.w	sl, r4, #26
 800903c:	e7f2      	b.n	8009024 <_printf_float+0x410>
 800903e:	2301      	movs	r3, #1
 8009040:	e7df      	b.n	8009002 <_printf_float+0x3ee>
 8009042:	2301      	movs	r3, #1
 8009044:	464a      	mov	r2, r9
 8009046:	4631      	mov	r1, r6
 8009048:	4628      	mov	r0, r5
 800904a:	47b8      	blx	r7
 800904c:	3001      	adds	r0, #1
 800904e:	f43f ae3e 	beq.w	8008cce <_printf_float+0xba>
 8009052:	f108 0801 	add.w	r8, r8, #1
 8009056:	68e3      	ldr	r3, [r4, #12]
 8009058:	9a0b      	ldr	r2, [sp, #44]	; 0x2c
 800905a:	1a9b      	subs	r3, r3, r2
 800905c:	4543      	cmp	r3, r8
 800905e:	dcf0      	bgt.n	8009042 <_printf_float+0x42e>
 8009060:	e6fc      	b.n	8008e5c <_printf_float+0x248>
 8009062:	f04f 0800 	mov.w	r8, #0
 8009066:	f104 0919 	add.w	r9, r4, #25
 800906a:	e7f4      	b.n	8009056 <_printf_float+0x442>
 800906c:	2900      	cmp	r1, #0
 800906e:	f43f ae8b 	beq.w	8008d88 <_printf_float+0x174>
 8009072:	2300      	movs	r3, #0
 8009074:	e9cd 0302 	strd	r0, r3, [sp, #8]
 8009078:	ab09      	add	r3, sp, #36	; 0x24
 800907a:	9300      	str	r3, [sp, #0]
 800907c:	ec49 8b10 	vmov	d0, r8, r9
 8009080:	6022      	str	r2, [r4, #0]
 8009082:	f8cd a004 	str.w	sl, [sp, #4]
 8009086:	f10d 0323 	add.w	r3, sp, #35	; 0x23
 800908a:	4628      	mov	r0, r5
 800908c:	f7ff fd2d 	bl	8008aea <__cvt>
 8009090:	4680      	mov	r8, r0
 8009092:	e648      	b.n	8008d26 <_printf_float+0x112>

08009094 <_printf_common>:
 8009094:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
 8009098:	4691      	mov	r9, r2
 800909a:	461f      	mov	r7, r3
 800909c:	688a      	ldr	r2, [r1, #8]
 800909e:	690b      	ldr	r3, [r1, #16]
 80090a0:	f8dd 8020 	ldr.w	r8, [sp, #32]
 80090a4:	4293      	cmp	r3, r2
 80090a6:	bfb8      	it	lt
 80090a8:	4613      	movlt	r3, r2
 80090aa:	f8c9 3000 	str.w	r3, [r9]
 80090ae:	f891 2043 	ldrb.w	r2, [r1, #67]	; 0x43
 80090b2:	4606      	mov	r6, r0
 80090b4:	460c      	mov	r4, r1
 80090b6:	b112      	cbz	r2, 80090be <_printf_common+0x2a>
 80090b8:	3301      	adds	r3, #1
 80090ba:	f8c9 3000 	str.w	r3, [r9]
 80090be:	6823      	ldr	r3, [r4, #0]
 80090c0:	0699      	lsls	r1, r3, #26
 80090c2:	bf42      	ittt	mi
 80090c4:	f8d9 3000 	ldrmi.w	r3, [r9]
 80090c8:	3302      	addmi	r3, #2
 80090ca:	f8c9 3000 	strmi.w	r3, [r9]
 80090ce:	6825      	ldr	r5, [r4, #0]
 80090d0:	f015 0506 	ands.w	r5, r5, #6
 80090d4:	d107      	bne.n	80090e6 <_printf_common+0x52>
 80090d6:	f104 0a19 	add.w	sl, r4, #25
 80090da:	68e3      	ldr	r3, [r4, #12]
 80090dc:	f8d9 2000 	ldr.w	r2, [r9]
 80090e0:	1a9b      	subs	r3, r3, r2
 80090e2:	42ab      	cmp	r3, r5
 80090e4:	dc28      	bgt.n	8009138 <_printf_common+0xa4>
 80090e6:	f894 3043 	ldrb.w	r3, [r4, #67]	; 0x43
 80090ea:	6822      	ldr	r2, [r4, #0]
 80090ec:	3300      	adds	r3, #0
 80090ee:	bf18      	it	ne
 80090f0:	2301      	movne	r3, #1
 80090f2:	0692      	lsls	r2, r2, #26
 80090f4:	d42d      	bmi.n	8009152 <_printf_common+0xbe>
 80090f6:	f104 0243 	add.w	r2, r4, #67	; 0x43
 80090fa:	4639      	mov	r1, r7
 80090fc:	4630      	mov	r0, r6
 80090fe:	47c0      	blx	r8
 8009100:	3001      	adds	r0, #1
 8009102:	d020      	beq.n	8009146 <_printf_common+0xb2>
 8009104:	6823      	ldr	r3, [r4, #0]
 8009106:	68e5      	ldr	r5, [r4, #12]
 8009108:	f8d9 2000 	ldr.w	r2, [r9]
 800910c:	f003 0306 	and.w	r3, r3, #6
 8009110:	2b04      	cmp	r3, #4
 8009112:	bf08      	it	eq
 8009114:	1aad      	subeq	r5, r5, r2
 8009116:	68a3      	ldr	r3, [r4, #8]
 8009118:	6922      	ldr	r2, [r4, #16]
 800911a:	bf0c      	ite	eq
 800911c:	ea25 75e5 	biceq.w	r5, r5, r5, asr #31
 8009120:	2500      	movne	r5, #0
 8009122:	4293      	cmp	r3, r2
 8009124:	bfc4      	itt	gt
 8009126:	1a9b      	subgt	r3, r3, r2
 8009128:	18ed      	addgt	r5, r5, r3
 800912a:	f04f 0900 	mov.w	r9, #0
 800912e:	341a      	adds	r4, #26
 8009130:	454d      	cmp	r5, r9
 8009132:	d11a      	bne.n	800916a <_printf_common+0xd6>
 8009134:	2000      	movs	r0, #0
 8009136:	e008      	b.n	800914a <_printf_common+0xb6>
 8009138:	2301      	movs	r3, #1
 800913a:	4652      	mov	r2, sl
 800913c:	4639      	mov	r1, r7
 800913e:	4630      	mov	r0, r6
 8009140:	47c0      	blx	r8
 8009142:	3001      	adds	r0, #1
 8009144:	d103      	bne.n	800914e <_printf_common+0xba>
 8009146:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 800914a:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 800914e:	3501      	adds	r5, #1
 8009150:	e7c3      	b.n	80090da <_printf_common+0x46>
 8009152:	18e1      	adds	r1, r4, r3
 8009154:	1c5a      	adds	r2, r3, #1
 8009156:	2030      	movs	r0, #48	; 0x30
 8009158:	f881 0043 	strb.w	r0, [r1, #67]	; 0x43
 800915c:	4422      	add	r2, r4
 800915e:	f894 1045 	ldrb.w	r1, [r4, #69]	; 0x45
 8009162:	f882 1043 	strb.w	r1, [r2, #67]	; 0x43
 8009166:	3302      	adds	r3, #2
 8009168:	e7c5      	b.n	80090f6 <_printf_common+0x62>
 800916a:	2301      	movs	r3, #1
 800916c:	4622      	mov	r2, r4
 800916e:	4639      	mov	r1, r7
 8009170:	4630      	mov	r0, r6
 8009172:	47c0      	blx	r8
 8009174:	3001      	adds	r0, #1
 8009176:	d0e6      	beq.n	8009146 <_printf_common+0xb2>
 8009178:	f109 0901 	add.w	r9, r9, #1
 800917c:	e7d8      	b.n	8009130 <_printf_common+0x9c>

0800917e <cleanup_glue>:
 800917e:	b538      	push	{r3, r4, r5, lr}
 8009180:	460c      	mov	r4, r1
 8009182:	6809      	ldr	r1, [r1, #0]
 8009184:	4605      	mov	r5, r0
 8009186:	b109      	cbz	r1, 800918c <cleanup_glue+0xe>
 8009188:	f7ff fff9 	bl	800917e <cleanup_glue>
 800918c:	4621      	mov	r1, r4
 800918e:	4628      	mov	r0, r5
 8009190:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8009194:	f7f7 bf89 	b.w	80010aa <_free_r>

08009198 <_reclaim_reent>:
 8009198:	4b2c      	ldr	r3, [pc, #176]	; (800924c <_reclaim_reent+0xb4>)
 800919a:	681b      	ldr	r3, [r3, #0]
 800919c:	4283      	cmp	r3, r0
 800919e:	b570      	push	{r4, r5, r6, lr}
 80091a0:	4604      	mov	r4, r0
 80091a2:	d051      	beq.n	8009248 <_reclaim_reent+0xb0>
 80091a4:	6a43      	ldr	r3, [r0, #36]	; 0x24
 80091a6:	b143      	cbz	r3, 80091ba <_reclaim_reent+0x22>
 80091a8:	68db      	ldr	r3, [r3, #12]
 80091aa:	2b00      	cmp	r3, #0
 80091ac:	d14a      	bne.n	8009244 <_reclaim_reent+0xac>
 80091ae:	6a63      	ldr	r3, [r4, #36]	; 0x24
 80091b0:	6819      	ldr	r1, [r3, #0]
 80091b2:	b111      	cbz	r1, 80091ba <_reclaim_reent+0x22>
 80091b4:	4620      	mov	r0, r4
 80091b6:	f7f7 ff78 	bl	80010aa <_free_r>
 80091ba:	6961      	ldr	r1, [r4, #20]
 80091bc:	b111      	cbz	r1, 80091c4 <_reclaim_reent+0x2c>
 80091be:	4620      	mov	r0, r4
 80091c0:	f7f7 ff73 	bl	80010aa <_free_r>
 80091c4:	6a61      	ldr	r1, [r4, #36]	; 0x24
 80091c6:	b111      	cbz	r1, 80091ce <_reclaim_reent+0x36>
 80091c8:	4620      	mov	r0, r4
 80091ca:	f7f7 ff6e 	bl	80010aa <_free_r>
 80091ce:	6ba1      	ldr	r1, [r4, #56]	; 0x38
 80091d0:	b111      	cbz	r1, 80091d8 <_reclaim_reent+0x40>
 80091d2:	4620      	mov	r0, r4
 80091d4:	f7f7 ff69 	bl	80010aa <_free_r>
 80091d8:	6be1      	ldr	r1, [r4, #60]	; 0x3c
 80091da:	b111      	cbz	r1, 80091e2 <_reclaim_reent+0x4a>
 80091dc:	4620      	mov	r0, r4
 80091de:	f7f7 ff64 	bl	80010aa <_free_r>
 80091e2:	6c21      	ldr	r1, [r4, #64]	; 0x40
 80091e4:	b111      	cbz	r1, 80091ec <_reclaim_reent+0x54>
 80091e6:	4620      	mov	r0, r4
 80091e8:	f7f7 ff5f 	bl	80010aa <_free_r>
 80091ec:	6de1      	ldr	r1, [r4, #92]	; 0x5c
 80091ee:	b111      	cbz	r1, 80091f6 <_reclaim_reent+0x5e>
 80091f0:	4620      	mov	r0, r4
 80091f2:	f7f7 ff5a 	bl	80010aa <_free_r>
 80091f6:	6da1      	ldr	r1, [r4, #88]	; 0x58
 80091f8:	b111      	cbz	r1, 8009200 <_reclaim_reent+0x68>
 80091fa:	4620      	mov	r0, r4
 80091fc:	f7f7 ff55 	bl	80010aa <_free_r>
 8009200:	6b61      	ldr	r1, [r4, #52]	; 0x34
 8009202:	b111      	cbz	r1, 800920a <_reclaim_reent+0x72>
 8009204:	4620      	mov	r0, r4
 8009206:	f7f7 ff50 	bl	80010aa <_free_r>
 800920a:	69a3      	ldr	r3, [r4, #24]
 800920c:	b1e3      	cbz	r3, 8009248 <_reclaim_reent+0xb0>
 800920e:	6aa3      	ldr	r3, [r4, #40]	; 0x28
 8009210:	4620      	mov	r0, r4
 8009212:	4798      	blx	r3
 8009214:	6ca1      	ldr	r1, [r4, #72]	; 0x48
 8009216:	b1b9      	cbz	r1, 8009248 <_reclaim_reent+0xb0>
 8009218:	4620      	mov	r0, r4
 800921a:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 800921e:	f7ff bfae 	b.w	800917e <cleanup_glue>
 8009222:	5949      	ldr	r1, [r1, r5]
 8009224:	b941      	cbnz	r1, 8009238 <_reclaim_reent+0xa0>
 8009226:	3504      	adds	r5, #4
 8009228:	6a63      	ldr	r3, [r4, #36]	; 0x24
 800922a:	2d80      	cmp	r5, #128	; 0x80
 800922c:	68d9      	ldr	r1, [r3, #12]
 800922e:	d1f8      	bne.n	8009222 <_reclaim_reent+0x8a>
 8009230:	4620      	mov	r0, r4
 8009232:	f7f7 ff3a 	bl	80010aa <_free_r>
 8009236:	e7ba      	b.n	80091ae <_reclaim_reent+0x16>
 8009238:	680e      	ldr	r6, [r1, #0]
 800923a:	4620      	mov	r0, r4
 800923c:	f7f7 ff35 	bl	80010aa <_free_r>
 8009240:	4631      	mov	r1, r6
 8009242:	e7ef      	b.n	8009224 <_reclaim_reent+0x8c>
 8009244:	2500      	movs	r5, #0
 8009246:	e7ef      	b.n	8009228 <_reclaim_reent+0x90>
 8009248:	bd70      	pop	{r4, r5, r6, pc}
 800924a:	bf00      	nop
 800924c:	20000080 	.word	0x20000080

08009250 <quorem>:
 8009250:	e92d 4ff7 	stmdb	sp!, {r0, r1, r2, r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8009254:	6903      	ldr	r3, [r0, #16]
 8009256:	690c      	ldr	r4, [r1, #16]
 8009258:	42a3      	cmp	r3, r4
 800925a:	4680      	mov	r8, r0
 800925c:	f2c0 8082 	blt.w	8009364 <quorem+0x114>
 8009260:	3c01      	subs	r4, #1
 8009262:	f101 0714 	add.w	r7, r1, #20
 8009266:	ea4f 0c84 	mov.w	ip, r4, lsl #2
 800926a:	f100 0614 	add.w	r6, r0, #20
 800926e:	f857 5024 	ldr.w	r5, [r7, r4, lsl #2]
 8009272:	f856 0024 	ldr.w	r0, [r6, r4, lsl #2]
 8009276:	eb06 030c 	add.w	r3, r6, ip
 800927a:	3501      	adds	r5, #1
 800927c:	eb07 090c 	add.w	r9, r7, ip
 8009280:	9301      	str	r3, [sp, #4]
 8009282:	fbb0 f5f5 	udiv	r5, r0, r5
 8009286:	b395      	cbz	r5, 80092ee <quorem+0x9e>
 8009288:	f04f 0a00 	mov.w	sl, #0
 800928c:	4638      	mov	r0, r7
 800928e:	46b6      	mov	lr, r6
 8009290:	46d3      	mov	fp, sl
 8009292:	f850 2b04 	ldr.w	r2, [r0], #4
 8009296:	b293      	uxth	r3, r2
 8009298:	fb05 a303 	mla	r3, r5, r3, sl
 800929c:	ea4f 4a13 	mov.w	sl, r3, lsr #16
 80092a0:	b29b      	uxth	r3, r3
 80092a2:	ebab 0303 	sub.w	r3, fp, r3
 80092a6:	0c12      	lsrs	r2, r2, #16
 80092a8:	f8de b000 	ldr.w	fp, [lr]
 80092ac:	fb05 a202 	mla	r2, r5, r2, sl
 80092b0:	fa13 f38b 	uxtah	r3, r3, fp
 80092b4:	ea4f 4a12 	mov.w	sl, r2, lsr #16
 80092b8:	fa1f fb82 	uxth.w	fp, r2
 80092bc:	f8de 2000 	ldr.w	r2, [lr]
 80092c0:	ebcb 4212 	rsb	r2, fp, r2, lsr #16
 80092c4:	eb02 4223 	add.w	r2, r2, r3, asr #16
 80092c8:	b29b      	uxth	r3, r3
 80092ca:	ea43 4302 	orr.w	r3, r3, r2, lsl #16
 80092ce:	4581      	cmp	r9, r0
 80092d0:	ea4f 4b22 	mov.w	fp, r2, asr #16
 80092d4:	f84e 3b04 	str.w	r3, [lr], #4
 80092d8:	d2db      	bcs.n	8009292 <quorem+0x42>
 80092da:	f856 300c 	ldr.w	r3, [r6, ip]
 80092de:	b933      	cbnz	r3, 80092ee <quorem+0x9e>
 80092e0:	9b01      	ldr	r3, [sp, #4]
 80092e2:	3b04      	subs	r3, #4
 80092e4:	429e      	cmp	r6, r3
 80092e6:	461a      	mov	r2, r3
 80092e8:	d330      	bcc.n	800934c <quorem+0xfc>
 80092ea:	f8c8 4010 	str.w	r4, [r8, #16]
 80092ee:	4640      	mov	r0, r8
 80092f0:	f001 f816 	bl	800a320 <__mcmp>
 80092f4:	2800      	cmp	r0, #0
 80092f6:	db25      	blt.n	8009344 <quorem+0xf4>
 80092f8:	3501      	adds	r5, #1
 80092fa:	4630      	mov	r0, r6
 80092fc:	f04f 0c00 	mov.w	ip, #0
 8009300:	f857 2b04 	ldr.w	r2, [r7], #4
 8009304:	f8d0 e000 	ldr.w	lr, [r0]
 8009308:	b293      	uxth	r3, r2
 800930a:	ebac 0303 	sub.w	r3, ip, r3
 800930e:	0c12      	lsrs	r2, r2, #16
 8009310:	fa13 f38e 	uxtah	r3, r3, lr
 8009314:	ebc2 421e 	rsb	r2, r2, lr, lsr #16
 8009318:	eb02 4223 	add.w	r2, r2, r3, asr #16
 800931c:	b29b      	uxth	r3, r3
 800931e:	ea43 4302 	orr.w	r3, r3, r2, lsl #16
 8009322:	45b9      	cmp	r9, r7
 8009324:	ea4f 4c22 	mov.w	ip, r2, asr #16
 8009328:	f840 3b04 	str.w	r3, [r0], #4
 800932c:	d2e8      	bcs.n	8009300 <quorem+0xb0>
 800932e:	f856 2024 	ldr.w	r2, [r6, r4, lsl #2]
 8009332:	eb06 0384 	add.w	r3, r6, r4, lsl #2
 8009336:	b92a      	cbnz	r2, 8009344 <quorem+0xf4>
 8009338:	3b04      	subs	r3, #4
 800933a:	429e      	cmp	r6, r3
 800933c:	461a      	mov	r2, r3
 800933e:	d30b      	bcc.n	8009358 <quorem+0x108>
 8009340:	f8c8 4010 	str.w	r4, [r8, #16]
 8009344:	4628      	mov	r0, r5
 8009346:	b003      	add	sp, #12
 8009348:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 800934c:	6812      	ldr	r2, [r2, #0]
 800934e:	3b04      	subs	r3, #4
 8009350:	2a00      	cmp	r2, #0
 8009352:	d1ca      	bne.n	80092ea <quorem+0x9a>
 8009354:	3c01      	subs	r4, #1
 8009356:	e7c5      	b.n	80092e4 <quorem+0x94>
 8009358:	6812      	ldr	r2, [r2, #0]
 800935a:	3b04      	subs	r3, #4
 800935c:	2a00      	cmp	r2, #0
 800935e:	d1ef      	bne.n	8009340 <quorem+0xf0>
 8009360:	3c01      	subs	r4, #1
 8009362:	e7ea      	b.n	800933a <quorem+0xea>
 8009364:	2000      	movs	r0, #0
 8009366:	e7ee      	b.n	8009346 <quorem+0xf6>

08009368 <_dtoa_r>:
 8009368:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 800936c:	ec57 6b10 	vmov	r6, r7, d0
 8009370:	b097      	sub	sp, #92	; 0x5c
 8009372:	6a45      	ldr	r5, [r0, #36]	; 0x24
 8009374:	9106      	str	r1, [sp, #24]
 8009376:	4604      	mov	r4, r0
 8009378:	920b      	str	r2, [sp, #44]	; 0x2c
 800937a:	9312      	str	r3, [sp, #72]	; 0x48
 800937c:	f8dd 8080 	ldr.w	r8, [sp, #128]	; 0x80
 8009380:	e9cd 6700 	strd	r6, r7, [sp]
 8009384:	b93d      	cbnz	r5, 8009396 <_dtoa_r+0x2e>
 8009386:	2010      	movs	r0, #16
 8009388:	f7ff fb94 	bl	8008ab4 <malloc>
 800938c:	6260      	str	r0, [r4, #36]	; 0x24
 800938e:	e9c0 5501 	strd	r5, r5, [r0, #4]
 8009392:	6005      	str	r5, [r0, #0]
 8009394:	60c5      	str	r5, [r0, #12]
 8009396:	6a63      	ldr	r3, [r4, #36]	; 0x24
 8009398:	6819      	ldr	r1, [r3, #0]
 800939a:	b151      	cbz	r1, 80093b2 <_dtoa_r+0x4a>
 800939c:	685a      	ldr	r2, [r3, #4]
 800939e:	604a      	str	r2, [r1, #4]
 80093a0:	2301      	movs	r3, #1
 80093a2:	4093      	lsls	r3, r2
 80093a4:	608b      	str	r3, [r1, #8]
 80093a6:	4620      	mov	r0, r4
 80093a8:	f000 fdd8 	bl	8009f5c <_Bfree>
 80093ac:	6a63      	ldr	r3, [r4, #36]	; 0x24
 80093ae:	2200      	movs	r2, #0
 80093b0:	601a      	str	r2, [r3, #0]
 80093b2:	1e3b      	subs	r3, r7, #0
 80093b4:	bfbb      	ittet	lt
 80093b6:	f023 4300 	biclt.w	r3, r3, #2147483648	; 0x80000000
 80093ba:	9301      	strlt	r3, [sp, #4]
 80093bc:	2300      	movge	r3, #0
 80093be:	2201      	movlt	r2, #1
 80093c0:	bfac      	ite	ge
 80093c2:	f8c8 3000 	strge.w	r3, [r8]
 80093c6:	f8c8 2000 	strlt.w	r2, [r8]
 80093ca:	4baf      	ldr	r3, [pc, #700]	; (8009688 <_dtoa_r+0x320>)
 80093cc:	f8dd 8004 	ldr.w	r8, [sp, #4]
 80093d0:	ea33 0308 	bics.w	r3, r3, r8
 80093d4:	d114      	bne.n	8009400 <_dtoa_r+0x98>
 80093d6:	9a12      	ldr	r2, [sp, #72]	; 0x48
 80093d8:	f242 730f 	movw	r3, #9999	; 0x270f
 80093dc:	6013      	str	r3, [r2, #0]
 80093de:	9b00      	ldr	r3, [sp, #0]
 80093e0:	b923      	cbnz	r3, 80093ec <_dtoa_r+0x84>
 80093e2:	f3c8 0013 	ubfx	r0, r8, #0, #20
 80093e6:	2800      	cmp	r0, #0
 80093e8:	f000 8542 	beq.w	8009e70 <_dtoa_r+0xb08>
 80093ec:	9b21      	ldr	r3, [sp, #132]	; 0x84
 80093ee:	f8df b2ac 	ldr.w	fp, [pc, #684]	; 800969c <_dtoa_r+0x334>
 80093f2:	2b00      	cmp	r3, #0
 80093f4:	f000 8544 	beq.w	8009e80 <_dtoa_r+0xb18>
 80093f8:	f10b 0303 	add.w	r3, fp, #3
 80093fc:	f000 bd3e 	b.w	8009e7c <_dtoa_r+0xb14>
 8009400:	e9dd 6700 	ldrd	r6, r7, [sp]
 8009404:	2200      	movs	r2, #0
 8009406:	2300      	movs	r3, #0
 8009408:	4630      	mov	r0, r6
 800940a:	4639      	mov	r1, r7
 800940c:	f7f7 fb5c 	bl	8000ac8 <__aeabi_dcmpeq>
 8009410:	4681      	mov	r9, r0
 8009412:	b168      	cbz	r0, 8009430 <_dtoa_r+0xc8>
 8009414:	9a12      	ldr	r2, [sp, #72]	; 0x48
 8009416:	2301      	movs	r3, #1
 8009418:	6013      	str	r3, [r2, #0]
 800941a:	9b21      	ldr	r3, [sp, #132]	; 0x84
 800941c:	2b00      	cmp	r3, #0
 800941e:	f000 8524 	beq.w	8009e6a <_dtoa_r+0xb02>
 8009422:	4b9a      	ldr	r3, [pc, #616]	; (800968c <_dtoa_r+0x324>)
 8009424:	9a21      	ldr	r2, [sp, #132]	; 0x84
 8009426:	f103 3bff 	add.w	fp, r3, #4294967295	; 0xffffffff
 800942a:	6013      	str	r3, [r2, #0]
 800942c:	f000 bd28 	b.w	8009e80 <_dtoa_r+0xb18>
 8009430:	aa14      	add	r2, sp, #80	; 0x50
 8009432:	a915      	add	r1, sp, #84	; 0x54
 8009434:	ec47 6b10 	vmov	d0, r6, r7
 8009438:	4620      	mov	r0, r4
 800943a:	f000 ffe8 	bl	800a40e <__d2b>
 800943e:	f3c8 550a 	ubfx	r5, r8, #20, #11
 8009442:	9004      	str	r0, [sp, #16]
 8009444:	2d00      	cmp	r5, #0
 8009446:	d07c      	beq.n	8009542 <_dtoa_r+0x1da>
 8009448:	f3c7 0313 	ubfx	r3, r7, #0, #20
 800944c:	f043 5b7f 	orr.w	fp, r3, #1069547520	; 0x3fc00000
 8009450:	46b2      	mov	sl, r6
 8009452:	f44b 1b40 	orr.w	fp, fp, #3145728	; 0x300000
 8009456:	f2a5 35ff 	subw	r5, r5, #1023	; 0x3ff
 800945a:	f8cd 904c 	str.w	r9, [sp, #76]	; 0x4c
 800945e:	2200      	movs	r2, #0
 8009460:	4b8b      	ldr	r3, [pc, #556]	; (8009690 <_dtoa_r+0x328>)
 8009462:	4650      	mov	r0, sl
 8009464:	4659      	mov	r1, fp
 8009466:	f7f6 feb7 	bl	80001d8 <__aeabi_dsub>
 800946a:	a381      	add	r3, pc, #516	; (adr r3, 8009670 <_dtoa_r+0x308>)
 800946c:	e9d3 2300 	ldrd	r2, r3, [r3]
 8009470:	f7f7 f86a 	bl	8000548 <__aeabi_dmul>
 8009474:	a380      	add	r3, pc, #512	; (adr r3, 8009678 <_dtoa_r+0x310>)
 8009476:	e9d3 2300 	ldrd	r2, r3, [r3]
 800947a:	f7f6 feaf 	bl	80001dc <__adddf3>
 800947e:	4606      	mov	r6, r0
 8009480:	4628      	mov	r0, r5
 8009482:	460f      	mov	r7, r1
 8009484:	f7f6 fff6 	bl	8000474 <__aeabi_i2d>
 8009488:	a37d      	add	r3, pc, #500	; (adr r3, 8009680 <_dtoa_r+0x318>)
 800948a:	e9d3 2300 	ldrd	r2, r3, [r3]
 800948e:	f7f7 f85b 	bl	8000548 <__aeabi_dmul>
 8009492:	4602      	mov	r2, r0
 8009494:	460b      	mov	r3, r1
 8009496:	4630      	mov	r0, r6
 8009498:	4639      	mov	r1, r7
 800949a:	f7f6 fe9f 	bl	80001dc <__adddf3>
 800949e:	4606      	mov	r6, r0
 80094a0:	460f      	mov	r7, r1
 80094a2:	f7f7 fb59 	bl	8000b58 <__aeabi_d2iz>
 80094a6:	2200      	movs	r2, #0
 80094a8:	4682      	mov	sl, r0
 80094aa:	2300      	movs	r3, #0
 80094ac:	4630      	mov	r0, r6
 80094ae:	4639      	mov	r1, r7
 80094b0:	f7f7 fb14 	bl	8000adc <__aeabi_dcmplt>
 80094b4:	b148      	cbz	r0, 80094ca <_dtoa_r+0x162>
 80094b6:	4650      	mov	r0, sl
 80094b8:	f7f6 ffdc 	bl	8000474 <__aeabi_i2d>
 80094bc:	4632      	mov	r2, r6
 80094be:	463b      	mov	r3, r7
 80094c0:	f7f7 fb02 	bl	8000ac8 <__aeabi_dcmpeq>
 80094c4:	b908      	cbnz	r0, 80094ca <_dtoa_r+0x162>
 80094c6:	f10a 3aff 	add.w	sl, sl, #4294967295	; 0xffffffff
 80094ca:	f1ba 0f16 	cmp.w	sl, #22
 80094ce:	d859      	bhi.n	8009584 <_dtoa_r+0x21c>
 80094d0:	4970      	ldr	r1, [pc, #448]	; (8009694 <_dtoa_r+0x32c>)
 80094d2:	eb01 01ca 	add.w	r1, r1, sl, lsl #3
 80094d6:	e9dd 2300 	ldrd	r2, r3, [sp]
 80094da:	e9d1 0100 	ldrd	r0, r1, [r1]
 80094de:	f7f7 fb1b 	bl	8000b18 <__aeabi_dcmpgt>
 80094e2:	2800      	cmp	r0, #0
 80094e4:	d050      	beq.n	8009588 <_dtoa_r+0x220>
 80094e6:	f10a 3aff 	add.w	sl, sl, #4294967295	; 0xffffffff
 80094ea:	2300      	movs	r3, #0
 80094ec:	930f      	str	r3, [sp, #60]	; 0x3c
 80094ee:	9b14      	ldr	r3, [sp, #80]	; 0x50
 80094f0:	1b5d      	subs	r5, r3, r5
 80094f2:	f1b5 0801 	subs.w	r8, r5, #1
 80094f6:	bf49      	itett	mi
 80094f8:	f1c5 0301 	rsbmi	r3, r5, #1
 80094fc:	2300      	movpl	r3, #0
 80094fe:	9305      	strmi	r3, [sp, #20]
 8009500:	f04f 0800 	movmi.w	r8, #0
 8009504:	bf58      	it	pl
 8009506:	9305      	strpl	r3, [sp, #20]
 8009508:	f1ba 0f00 	cmp.w	sl, #0
 800950c:	db3e      	blt.n	800958c <_dtoa_r+0x224>
 800950e:	2300      	movs	r3, #0
 8009510:	44d0      	add	r8, sl
 8009512:	f8cd a038 	str.w	sl, [sp, #56]	; 0x38
 8009516:	9307      	str	r3, [sp, #28]
 8009518:	9b06      	ldr	r3, [sp, #24]
 800951a:	2b09      	cmp	r3, #9
 800951c:	f200 8090 	bhi.w	8009640 <_dtoa_r+0x2d8>
 8009520:	2b05      	cmp	r3, #5
 8009522:	bfc4      	itt	gt
 8009524:	3b04      	subgt	r3, #4
 8009526:	9306      	strgt	r3, [sp, #24]
 8009528:	9b06      	ldr	r3, [sp, #24]
 800952a:	f1a3 0302 	sub.w	r3, r3, #2
 800952e:	bfcc      	ite	gt
 8009530:	2500      	movgt	r5, #0
 8009532:	2501      	movle	r5, #1
 8009534:	2b03      	cmp	r3, #3
 8009536:	f200 808f 	bhi.w	8009658 <_dtoa_r+0x2f0>
 800953a:	e8df f003 	tbb	[pc, r3]
 800953e:	7f7d      	.short	0x7f7d
 8009540:	7131      	.short	0x7131
 8009542:	e9dd 5314 	ldrd	r5, r3, [sp, #80]	; 0x50
 8009546:	441d      	add	r5, r3
 8009548:	f205 4032 	addw	r0, r5, #1074	; 0x432
 800954c:	2820      	cmp	r0, #32
 800954e:	dd13      	ble.n	8009578 <_dtoa_r+0x210>
 8009550:	f1c0 0040 	rsb	r0, r0, #64	; 0x40
 8009554:	9b00      	ldr	r3, [sp, #0]
 8009556:	fa08 f800 	lsl.w	r8, r8, r0
 800955a:	f205 4012 	addw	r0, r5, #1042	; 0x412
 800955e:	fa23 f000 	lsr.w	r0, r3, r0
 8009562:	ea48 0000 	orr.w	r0, r8, r0
 8009566:	f7f6 ff75 	bl	8000454 <__aeabi_ui2d>
 800956a:	2301      	movs	r3, #1
 800956c:	4682      	mov	sl, r0
 800956e:	f1a1 7bf8 	sub.w	fp, r1, #32505856	; 0x1f00000
 8009572:	3d01      	subs	r5, #1
 8009574:	9313      	str	r3, [sp, #76]	; 0x4c
 8009576:	e772      	b.n	800945e <_dtoa_r+0xf6>
 8009578:	9b00      	ldr	r3, [sp, #0]
 800957a:	f1c0 0020 	rsb	r0, r0, #32
 800957e:	fa03 f000 	lsl.w	r0, r3, r0
 8009582:	e7f0      	b.n	8009566 <_dtoa_r+0x1fe>
 8009584:	2301      	movs	r3, #1
 8009586:	e7b1      	b.n	80094ec <_dtoa_r+0x184>
 8009588:	900f      	str	r0, [sp, #60]	; 0x3c
 800958a:	e7b0      	b.n	80094ee <_dtoa_r+0x186>
 800958c:	9b05      	ldr	r3, [sp, #20]
 800958e:	eba3 030a 	sub.w	r3, r3, sl
 8009592:	9305      	str	r3, [sp, #20]
 8009594:	f1ca 0300 	rsb	r3, sl, #0
 8009598:	9307      	str	r3, [sp, #28]
 800959a:	2300      	movs	r3, #0
 800959c:	930e      	str	r3, [sp, #56]	; 0x38
 800959e:	e7bb      	b.n	8009518 <_dtoa_r+0x1b0>
 80095a0:	2301      	movs	r3, #1
 80095a2:	930a      	str	r3, [sp, #40]	; 0x28
 80095a4:	9b0b      	ldr	r3, [sp, #44]	; 0x2c
 80095a6:	2b00      	cmp	r3, #0
 80095a8:	dd59      	ble.n	800965e <_dtoa_r+0x2f6>
 80095aa:	9302      	str	r3, [sp, #8]
 80095ac:	4699      	mov	r9, r3
 80095ae:	6a66      	ldr	r6, [r4, #36]	; 0x24
 80095b0:	2200      	movs	r2, #0
 80095b2:	6072      	str	r2, [r6, #4]
 80095b4:	2204      	movs	r2, #4
 80095b6:	f102 0014 	add.w	r0, r2, #20
 80095ba:	4298      	cmp	r0, r3
 80095bc:	6871      	ldr	r1, [r6, #4]
 80095be:	d953      	bls.n	8009668 <_dtoa_r+0x300>
 80095c0:	4620      	mov	r0, r4
 80095c2:	f000 fc97 	bl	8009ef4 <_Balloc>
 80095c6:	6a63      	ldr	r3, [r4, #36]	; 0x24
 80095c8:	6030      	str	r0, [r6, #0]
 80095ca:	f1b9 0f0e 	cmp.w	r9, #14
 80095ce:	f8d3 b000 	ldr.w	fp, [r3]
 80095d2:	f200 80e6 	bhi.w	80097a2 <_dtoa_r+0x43a>
 80095d6:	2d00      	cmp	r5, #0
 80095d8:	f000 80e3 	beq.w	80097a2 <_dtoa_r+0x43a>
 80095dc:	ed9d 7b00 	vldr	d7, [sp]
 80095e0:	f1ba 0f00 	cmp.w	sl, #0
 80095e4:	ed8d 7b10 	vstr	d7, [sp, #64]	; 0x40
 80095e8:	dd74      	ble.n	80096d4 <_dtoa_r+0x36c>
 80095ea:	4a2a      	ldr	r2, [pc, #168]	; (8009694 <_dtoa_r+0x32c>)
 80095ec:	f00a 030f 	and.w	r3, sl, #15
 80095f0:	eb02 03c3 	add.w	r3, r2, r3, lsl #3
 80095f4:	ed93 7b00 	vldr	d7, [r3]
 80095f8:	ea4f 162a 	mov.w	r6, sl, asr #4
 80095fc:	06f0      	lsls	r0, r6, #27
 80095fe:	ed8d 7b08 	vstr	d7, [sp, #32]
 8009602:	d565      	bpl.n	80096d0 <_dtoa_r+0x368>
 8009604:	4b24      	ldr	r3, [pc, #144]	; (8009698 <_dtoa_r+0x330>)
 8009606:	e9dd 0110 	ldrd	r0, r1, [sp, #64]	; 0x40
 800960a:	e9d3 2308 	ldrd	r2, r3, [r3, #32]
 800960e:	f7f7 f8c5 	bl	800079c <__aeabi_ddiv>
 8009612:	e9cd 0100 	strd	r0, r1, [sp]
 8009616:	f006 060f 	and.w	r6, r6, #15
 800961a:	2503      	movs	r5, #3
 800961c:	4f1e      	ldr	r7, [pc, #120]	; (8009698 <_dtoa_r+0x330>)
 800961e:	e04c      	b.n	80096ba <_dtoa_r+0x352>
 8009620:	2301      	movs	r3, #1
 8009622:	930a      	str	r3, [sp, #40]	; 0x28
 8009624:	9b0b      	ldr	r3, [sp, #44]	; 0x2c
 8009626:	4453      	add	r3, sl
 8009628:	f103 0901 	add.w	r9, r3, #1
 800962c:	9302      	str	r3, [sp, #8]
 800962e:	464b      	mov	r3, r9
 8009630:	2b01      	cmp	r3, #1
 8009632:	bfb8      	it	lt
 8009634:	2301      	movlt	r3, #1
 8009636:	e7ba      	b.n	80095ae <_dtoa_r+0x246>
 8009638:	2300      	movs	r3, #0
 800963a:	e7b2      	b.n	80095a2 <_dtoa_r+0x23a>
 800963c:	2300      	movs	r3, #0
 800963e:	e7f0      	b.n	8009622 <_dtoa_r+0x2ba>
 8009640:	2501      	movs	r5, #1
 8009642:	2300      	movs	r3, #0
 8009644:	9306      	str	r3, [sp, #24]
 8009646:	950a      	str	r5, [sp, #40]	; 0x28
 8009648:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
 800964c:	9302      	str	r3, [sp, #8]
 800964e:	4699      	mov	r9, r3
 8009650:	2200      	movs	r2, #0
 8009652:	2312      	movs	r3, #18
 8009654:	920b      	str	r2, [sp, #44]	; 0x2c
 8009656:	e7aa      	b.n	80095ae <_dtoa_r+0x246>
 8009658:	2301      	movs	r3, #1
 800965a:	930a      	str	r3, [sp, #40]	; 0x28
 800965c:	e7f4      	b.n	8009648 <_dtoa_r+0x2e0>
 800965e:	2301      	movs	r3, #1
 8009660:	9302      	str	r3, [sp, #8]
 8009662:	4699      	mov	r9, r3
 8009664:	461a      	mov	r2, r3
 8009666:	e7f5      	b.n	8009654 <_dtoa_r+0x2ec>
 8009668:	3101      	adds	r1, #1
 800966a:	6071      	str	r1, [r6, #4]
 800966c:	0052      	lsls	r2, r2, #1
 800966e:	e7a2      	b.n	80095b6 <_dtoa_r+0x24e>
 8009670:	636f4361 	.word	0x636f4361
 8009674:	3fd287a7 	.word	0x3fd287a7
 8009678:	8b60c8b3 	.word	0x8b60c8b3
 800967c:	3fc68a28 	.word	0x3fc68a28
 8009680:	509f79fb 	.word	0x509f79fb
 8009684:	3fd34413 	.word	0x3fd34413
 8009688:	7ff00000 	.word	0x7ff00000
 800968c:	0800b534 	.word	0x0800b534
 8009690:	3ff80000 	.word	0x3ff80000
 8009694:	0800b5d0 	.word	0x0800b5d0
 8009698:	0800b5a8 	.word	0x0800b5a8
 800969c:	0800b53e 	.word	0x0800b53e
 80096a0:	07f1      	lsls	r1, r6, #31
 80096a2:	d508      	bpl.n	80096b6 <_dtoa_r+0x34e>
 80096a4:	e9dd 0108 	ldrd	r0, r1, [sp, #32]
 80096a8:	e9d7 2300 	ldrd	r2, r3, [r7]
 80096ac:	f7f6 ff4c 	bl	8000548 <__aeabi_dmul>
 80096b0:	e9cd 0108 	strd	r0, r1, [sp, #32]
 80096b4:	3501      	adds	r5, #1
 80096b6:	1076      	asrs	r6, r6, #1
 80096b8:	3708      	adds	r7, #8
 80096ba:	2e00      	cmp	r6, #0
 80096bc:	d1f0      	bne.n	80096a0 <_dtoa_r+0x338>
 80096be:	e9dd 2308 	ldrd	r2, r3, [sp, #32]
 80096c2:	e9dd 0100 	ldrd	r0, r1, [sp]
 80096c6:	f7f7 f869 	bl	800079c <__aeabi_ddiv>
 80096ca:	e9cd 0100 	strd	r0, r1, [sp]
 80096ce:	e01a      	b.n	8009706 <_dtoa_r+0x39e>
 80096d0:	2502      	movs	r5, #2
 80096d2:	e7a3      	b.n	800961c <_dtoa_r+0x2b4>
 80096d4:	f000 80a0 	beq.w	8009818 <_dtoa_r+0x4b0>
 80096d8:	f1ca 0600 	rsb	r6, sl, #0
 80096dc:	4b9f      	ldr	r3, [pc, #636]	; (800995c <_dtoa_r+0x5f4>)
 80096de:	4fa0      	ldr	r7, [pc, #640]	; (8009960 <_dtoa_r+0x5f8>)
 80096e0:	f006 020f 	and.w	r2, r6, #15
 80096e4:	eb03 03c2 	add.w	r3, r3, r2, lsl #3
 80096e8:	e9d3 2300 	ldrd	r2, r3, [r3]
 80096ec:	e9dd 0110 	ldrd	r0, r1, [sp, #64]	; 0x40
 80096f0:	f7f6 ff2a 	bl	8000548 <__aeabi_dmul>
 80096f4:	e9cd 0100 	strd	r0, r1, [sp]
 80096f8:	1136      	asrs	r6, r6, #4
 80096fa:	2300      	movs	r3, #0
 80096fc:	2502      	movs	r5, #2
 80096fe:	2e00      	cmp	r6, #0
 8009700:	d17f      	bne.n	8009802 <_dtoa_r+0x49a>
 8009702:	2b00      	cmp	r3, #0
 8009704:	d1e1      	bne.n	80096ca <_dtoa_r+0x362>
 8009706:	9b0f      	ldr	r3, [sp, #60]	; 0x3c
 8009708:	2b00      	cmp	r3, #0
 800970a:	f000 8087 	beq.w	800981c <_dtoa_r+0x4b4>
 800970e:	e9dd 6700 	ldrd	r6, r7, [sp]
 8009712:	2200      	movs	r2, #0
 8009714:	4b93      	ldr	r3, [pc, #588]	; (8009964 <_dtoa_r+0x5fc>)
 8009716:	4630      	mov	r0, r6
 8009718:	4639      	mov	r1, r7
 800971a:	f7f7 f9df 	bl	8000adc <__aeabi_dcmplt>
 800971e:	2800      	cmp	r0, #0
 8009720:	d07c      	beq.n	800981c <_dtoa_r+0x4b4>
 8009722:	f1b9 0f00 	cmp.w	r9, #0
 8009726:	d079      	beq.n	800981c <_dtoa_r+0x4b4>
 8009728:	9b02      	ldr	r3, [sp, #8]
 800972a:	2b00      	cmp	r3, #0
 800972c:	dd35      	ble.n	800979a <_dtoa_r+0x432>
 800972e:	f10a 33ff 	add.w	r3, sl, #4294967295	; 0xffffffff
 8009732:	9308      	str	r3, [sp, #32]
 8009734:	4639      	mov	r1, r7
 8009736:	2200      	movs	r2, #0
 8009738:	4b8b      	ldr	r3, [pc, #556]	; (8009968 <_dtoa_r+0x600>)
 800973a:	4630      	mov	r0, r6
 800973c:	f7f6 ff04 	bl	8000548 <__aeabi_dmul>
 8009740:	e9cd 0100 	strd	r0, r1, [sp]
 8009744:	9f02      	ldr	r7, [sp, #8]
 8009746:	3501      	adds	r5, #1
 8009748:	4628      	mov	r0, r5
 800974a:	f7f6 fe93 	bl	8000474 <__aeabi_i2d>
 800974e:	e9dd 2300 	ldrd	r2, r3, [sp]
 8009752:	f7f6 fef9 	bl	8000548 <__aeabi_dmul>
 8009756:	2200      	movs	r2, #0
 8009758:	4b84      	ldr	r3, [pc, #528]	; (800996c <_dtoa_r+0x604>)
 800975a:	f7f6 fd3f 	bl	80001dc <__adddf3>
 800975e:	4605      	mov	r5, r0
 8009760:	f1a1 7650 	sub.w	r6, r1, #54525952	; 0x3400000
 8009764:	2f00      	cmp	r7, #0
 8009766:	d15d      	bne.n	8009824 <_dtoa_r+0x4bc>
 8009768:	2200      	movs	r2, #0
 800976a:	4b81      	ldr	r3, [pc, #516]	; (8009970 <_dtoa_r+0x608>)
 800976c:	e9dd 0100 	ldrd	r0, r1, [sp]
 8009770:	f7f6 fd32 	bl	80001d8 <__aeabi_dsub>
 8009774:	462a      	mov	r2, r5
 8009776:	4633      	mov	r3, r6
 8009778:	e9cd 0100 	strd	r0, r1, [sp]
 800977c:	f7f7 f9cc 	bl	8000b18 <__aeabi_dcmpgt>
 8009780:	2800      	cmp	r0, #0
 8009782:	f040 8288 	bne.w	8009c96 <_dtoa_r+0x92e>
 8009786:	462a      	mov	r2, r5
 8009788:	f106 4300 	add.w	r3, r6, #2147483648	; 0x80000000
 800978c:	e9dd 0100 	ldrd	r0, r1, [sp]
 8009790:	f7f7 f9a4 	bl	8000adc <__aeabi_dcmplt>
 8009794:	2800      	cmp	r0, #0
 8009796:	f040 827c 	bne.w	8009c92 <_dtoa_r+0x92a>
 800979a:	e9dd 2310 	ldrd	r2, r3, [sp, #64]	; 0x40
 800979e:	e9cd 2300 	strd	r2, r3, [sp]
 80097a2:	9b15      	ldr	r3, [sp, #84]	; 0x54
 80097a4:	2b00      	cmp	r3, #0
 80097a6:	f2c0 8150 	blt.w	8009a4a <_dtoa_r+0x6e2>
 80097aa:	f1ba 0f0e 	cmp.w	sl, #14
 80097ae:	f300 814c 	bgt.w	8009a4a <_dtoa_r+0x6e2>
 80097b2:	4b6a      	ldr	r3, [pc, #424]	; (800995c <_dtoa_r+0x5f4>)
 80097b4:	eb03 03ca 	add.w	r3, r3, sl, lsl #3
 80097b8:	ed93 7b00 	vldr	d7, [r3]
 80097bc:	9b0b      	ldr	r3, [sp, #44]	; 0x2c
 80097be:	2b00      	cmp	r3, #0
 80097c0:	ed8d 7b02 	vstr	d7, [sp, #8]
 80097c4:	f280 80d8 	bge.w	8009978 <_dtoa_r+0x610>
 80097c8:	f1b9 0f00 	cmp.w	r9, #0
 80097cc:	f300 80d4 	bgt.w	8009978 <_dtoa_r+0x610>
 80097d0:	f040 825e 	bne.w	8009c90 <_dtoa_r+0x928>
 80097d4:	2200      	movs	r2, #0
 80097d6:	4b66      	ldr	r3, [pc, #408]	; (8009970 <_dtoa_r+0x608>)
 80097d8:	ec51 0b17 	vmov	r0, r1, d7
 80097dc:	f7f6 feb4 	bl	8000548 <__aeabi_dmul>
 80097e0:	e9dd 2300 	ldrd	r2, r3, [sp]
 80097e4:	f7f7 f98e 	bl	8000b04 <__aeabi_dcmpge>
 80097e8:	464f      	mov	r7, r9
 80097ea:	464e      	mov	r6, r9
 80097ec:	2800      	cmp	r0, #0
 80097ee:	f040 8234 	bne.w	8009c5a <_dtoa_r+0x8f2>
 80097f2:	2331      	movs	r3, #49	; 0x31
 80097f4:	f10b 0501 	add.w	r5, fp, #1
 80097f8:	f88b 3000 	strb.w	r3, [fp]
 80097fc:	f10a 0a01 	add.w	sl, sl, #1
 8009800:	e22f      	b.n	8009c62 <_dtoa_r+0x8fa>
 8009802:	07f2      	lsls	r2, r6, #31
 8009804:	d505      	bpl.n	8009812 <_dtoa_r+0x4aa>
 8009806:	e9d7 2300 	ldrd	r2, r3, [r7]
 800980a:	f7f6 fe9d 	bl	8000548 <__aeabi_dmul>
 800980e:	3501      	adds	r5, #1
 8009810:	2301      	movs	r3, #1
 8009812:	1076      	asrs	r6, r6, #1
 8009814:	3708      	adds	r7, #8
 8009816:	e772      	b.n	80096fe <_dtoa_r+0x396>
 8009818:	2502      	movs	r5, #2
 800981a:	e774      	b.n	8009706 <_dtoa_r+0x39e>
 800981c:	f8cd a020 	str.w	sl, [sp, #32]
 8009820:	464f      	mov	r7, r9
 8009822:	e791      	b.n	8009748 <_dtoa_r+0x3e0>
 8009824:	4b4d      	ldr	r3, [pc, #308]	; (800995c <_dtoa_r+0x5f4>)
 8009826:	eb03 03c7 	add.w	r3, r3, r7, lsl #3
 800982a:	e953 0102 	ldrd	r0, r1, [r3, #-8]
 800982e:	9b0a      	ldr	r3, [sp, #40]	; 0x28
 8009830:	2b00      	cmp	r3, #0
 8009832:	d047      	beq.n	80098c4 <_dtoa_r+0x55c>
 8009834:	4602      	mov	r2, r0
 8009836:	460b      	mov	r3, r1
 8009838:	2000      	movs	r0, #0
 800983a:	494e      	ldr	r1, [pc, #312]	; (8009974 <_dtoa_r+0x60c>)
 800983c:	f7f6 ffae 	bl	800079c <__aeabi_ddiv>
 8009840:	462a      	mov	r2, r5
 8009842:	4633      	mov	r3, r6
 8009844:	f7f6 fcc8 	bl	80001d8 <__aeabi_dsub>
 8009848:	e9cd 010c 	strd	r0, r1, [sp, #48]	; 0x30
 800984c:	465d      	mov	r5, fp
 800984e:	e9dd 0100 	ldrd	r0, r1, [sp]
 8009852:	f7f7 f981 	bl	8000b58 <__aeabi_d2iz>
 8009856:	4606      	mov	r6, r0
 8009858:	f7f6 fe0c 	bl	8000474 <__aeabi_i2d>
 800985c:	4602      	mov	r2, r0
 800985e:	460b      	mov	r3, r1
 8009860:	e9dd 0100 	ldrd	r0, r1, [sp]
 8009864:	f7f6 fcb8 	bl	80001d8 <__aeabi_dsub>
 8009868:	3630      	adds	r6, #48	; 0x30
 800986a:	f805 6b01 	strb.w	r6, [r5], #1
 800986e:	e9dd 230c 	ldrd	r2, r3, [sp, #48]	; 0x30
 8009872:	e9cd 0100 	strd	r0, r1, [sp]
 8009876:	f7f7 f931 	bl	8000adc <__aeabi_dcmplt>
 800987a:	2800      	cmp	r0, #0
 800987c:	d163      	bne.n	8009946 <_dtoa_r+0x5de>
 800987e:	e9dd 2300 	ldrd	r2, r3, [sp]
 8009882:	2000      	movs	r0, #0
 8009884:	4937      	ldr	r1, [pc, #220]	; (8009964 <_dtoa_r+0x5fc>)
 8009886:	f7f6 fca7 	bl	80001d8 <__aeabi_dsub>
 800988a:	e9dd 230c 	ldrd	r2, r3, [sp, #48]	; 0x30
 800988e:	f7f7 f925 	bl	8000adc <__aeabi_dcmplt>
 8009892:	2800      	cmp	r0, #0
 8009894:	f040 80b7 	bne.w	8009a06 <_dtoa_r+0x69e>
 8009898:	eba5 030b 	sub.w	r3, r5, fp
 800989c:	429f      	cmp	r7, r3
 800989e:	f77f af7c 	ble.w	800979a <_dtoa_r+0x432>
 80098a2:	2200      	movs	r2, #0
 80098a4:	4b30      	ldr	r3, [pc, #192]	; (8009968 <_dtoa_r+0x600>)
 80098a6:	e9dd 010c 	ldrd	r0, r1, [sp, #48]	; 0x30
 80098aa:	f7f6 fe4d 	bl	8000548 <__aeabi_dmul>
 80098ae:	2200      	movs	r2, #0
 80098b0:	e9cd 010c 	strd	r0, r1, [sp, #48]	; 0x30
 80098b4:	4b2c      	ldr	r3, [pc, #176]	; (8009968 <_dtoa_r+0x600>)
 80098b6:	e9dd 0100 	ldrd	r0, r1, [sp]
 80098ba:	f7f6 fe45 	bl	8000548 <__aeabi_dmul>
 80098be:	e9cd 0100 	strd	r0, r1, [sp]
 80098c2:	e7c4      	b.n	800984e <_dtoa_r+0x4e6>
 80098c4:	462a      	mov	r2, r5
 80098c6:	4633      	mov	r3, r6
 80098c8:	f7f6 fe3e 	bl	8000548 <__aeabi_dmul>
 80098cc:	e9cd 010c 	strd	r0, r1, [sp, #48]	; 0x30
 80098d0:	eb0b 0507 	add.w	r5, fp, r7
 80098d4:	465e      	mov	r6, fp
 80098d6:	e9dd 0100 	ldrd	r0, r1, [sp]
 80098da:	f7f7 f93d 	bl	8000b58 <__aeabi_d2iz>
 80098de:	4607      	mov	r7, r0
 80098e0:	f7f6 fdc8 	bl	8000474 <__aeabi_i2d>
 80098e4:	3730      	adds	r7, #48	; 0x30
 80098e6:	4602      	mov	r2, r0
 80098e8:	460b      	mov	r3, r1
 80098ea:	e9dd 0100 	ldrd	r0, r1, [sp]
 80098ee:	f7f6 fc73 	bl	80001d8 <__aeabi_dsub>
 80098f2:	f806 7b01 	strb.w	r7, [r6], #1
 80098f6:	42ae      	cmp	r6, r5
 80098f8:	e9cd 0100 	strd	r0, r1, [sp]
 80098fc:	f04f 0200 	mov.w	r2, #0
 8009900:	d126      	bne.n	8009950 <_dtoa_r+0x5e8>
 8009902:	4b1c      	ldr	r3, [pc, #112]	; (8009974 <_dtoa_r+0x60c>)
 8009904:	e9dd 010c 	ldrd	r0, r1, [sp, #48]	; 0x30
 8009908:	f7f6 fc68 	bl	80001dc <__adddf3>
 800990c:	4602      	mov	r2, r0
 800990e:	460b      	mov	r3, r1
 8009910:	e9dd 0100 	ldrd	r0, r1, [sp]
 8009914:	f7f7 f900 	bl	8000b18 <__aeabi_dcmpgt>
 8009918:	2800      	cmp	r0, #0
 800991a:	d174      	bne.n	8009a06 <_dtoa_r+0x69e>
 800991c:	e9dd 230c 	ldrd	r2, r3, [sp, #48]	; 0x30
 8009920:	2000      	movs	r0, #0
 8009922:	4914      	ldr	r1, [pc, #80]	; (8009974 <_dtoa_r+0x60c>)
 8009924:	f7f6 fc58 	bl	80001d8 <__aeabi_dsub>
 8009928:	4602      	mov	r2, r0
 800992a:	460b      	mov	r3, r1
 800992c:	e9dd 0100 	ldrd	r0, r1, [sp]
 8009930:	f7f7 f8d4 	bl	8000adc <__aeabi_dcmplt>
 8009934:	2800      	cmp	r0, #0
 8009936:	f43f af30 	beq.w	800979a <_dtoa_r+0x432>
 800993a:	f815 3c01 	ldrb.w	r3, [r5, #-1]
 800993e:	2b30      	cmp	r3, #48	; 0x30
 8009940:	f105 32ff 	add.w	r2, r5, #4294967295	; 0xffffffff
 8009944:	d002      	beq.n	800994c <_dtoa_r+0x5e4>
 8009946:	f8dd a020 	ldr.w	sl, [sp, #32]
 800994a:	e04a      	b.n	80099e2 <_dtoa_r+0x67a>
 800994c:	4615      	mov	r5, r2
 800994e:	e7f4      	b.n	800993a <_dtoa_r+0x5d2>
 8009950:	4b05      	ldr	r3, [pc, #20]	; (8009968 <_dtoa_r+0x600>)
 8009952:	f7f6 fdf9 	bl	8000548 <__aeabi_dmul>
 8009956:	e9cd 0100 	strd	r0, r1, [sp]
 800995a:	e7bc      	b.n	80098d6 <_dtoa_r+0x56e>
 800995c:	0800b5d0 	.word	0x0800b5d0
 8009960:	0800b5a8 	.word	0x0800b5a8
 8009964:	3ff00000 	.word	0x3ff00000
 8009968:	40240000 	.word	0x40240000
 800996c:	401c0000 	.word	0x401c0000
 8009970:	40140000 	.word	0x40140000
 8009974:	3fe00000 	.word	0x3fe00000
 8009978:	e9dd 6700 	ldrd	r6, r7, [sp]
 800997c:	465d      	mov	r5, fp
 800997e:	e9dd 2302 	ldrd	r2, r3, [sp, #8]
 8009982:	4630      	mov	r0, r6
 8009984:	4639      	mov	r1, r7
 8009986:	f7f6 ff09 	bl	800079c <__aeabi_ddiv>
 800998a:	f7f7 f8e5 	bl	8000b58 <__aeabi_d2iz>
 800998e:	4680      	mov	r8, r0
 8009990:	f7f6 fd70 	bl	8000474 <__aeabi_i2d>
 8009994:	e9dd 2302 	ldrd	r2, r3, [sp, #8]
 8009998:	f7f6 fdd6 	bl	8000548 <__aeabi_dmul>
 800999c:	4602      	mov	r2, r0
 800999e:	460b      	mov	r3, r1
 80099a0:	4630      	mov	r0, r6
 80099a2:	4639      	mov	r1, r7
 80099a4:	f108 0630 	add.w	r6, r8, #48	; 0x30
 80099a8:	f7f6 fc16 	bl	80001d8 <__aeabi_dsub>
 80099ac:	f805 6b01 	strb.w	r6, [r5], #1
 80099b0:	eba5 060b 	sub.w	r6, r5, fp
 80099b4:	45b1      	cmp	r9, r6
 80099b6:	4602      	mov	r2, r0
 80099b8:	460b      	mov	r3, r1
 80099ba:	d139      	bne.n	8009a30 <_dtoa_r+0x6c8>
 80099bc:	f7f6 fc0e 	bl	80001dc <__adddf3>
 80099c0:	e9dd 2302 	ldrd	r2, r3, [sp, #8]
 80099c4:	4606      	mov	r6, r0
 80099c6:	460f      	mov	r7, r1
 80099c8:	f7f7 f8a6 	bl	8000b18 <__aeabi_dcmpgt>
 80099cc:	b9c8      	cbnz	r0, 8009a02 <_dtoa_r+0x69a>
 80099ce:	e9dd 2302 	ldrd	r2, r3, [sp, #8]
 80099d2:	4630      	mov	r0, r6
 80099d4:	4639      	mov	r1, r7
 80099d6:	f7f7 f877 	bl	8000ac8 <__aeabi_dcmpeq>
 80099da:	b110      	cbz	r0, 80099e2 <_dtoa_r+0x67a>
 80099dc:	f018 0f01 	tst.w	r8, #1
 80099e0:	d10f      	bne.n	8009a02 <_dtoa_r+0x69a>
 80099e2:	9904      	ldr	r1, [sp, #16]
 80099e4:	4620      	mov	r0, r4
 80099e6:	f000 fab9 	bl	8009f5c <_Bfree>
 80099ea:	2300      	movs	r3, #0
 80099ec:	9a12      	ldr	r2, [sp, #72]	; 0x48
 80099ee:	702b      	strb	r3, [r5, #0]
 80099f0:	f10a 0301 	add.w	r3, sl, #1
 80099f4:	6013      	str	r3, [r2, #0]
 80099f6:	9b21      	ldr	r3, [sp, #132]	; 0x84
 80099f8:	2b00      	cmp	r3, #0
 80099fa:	f000 8241 	beq.w	8009e80 <_dtoa_r+0xb18>
 80099fe:	601d      	str	r5, [r3, #0]
 8009a00:	e23e      	b.n	8009e80 <_dtoa_r+0xb18>
 8009a02:	f8cd a020 	str.w	sl, [sp, #32]
 8009a06:	f815 2c01 	ldrb.w	r2, [r5, #-1]
 8009a0a:	2a39      	cmp	r2, #57	; 0x39
 8009a0c:	f105 33ff 	add.w	r3, r5, #4294967295	; 0xffffffff
 8009a10:	d108      	bne.n	8009a24 <_dtoa_r+0x6bc>
 8009a12:	459b      	cmp	fp, r3
 8009a14:	d10a      	bne.n	8009a2c <_dtoa_r+0x6c4>
 8009a16:	9b08      	ldr	r3, [sp, #32]
 8009a18:	3301      	adds	r3, #1
 8009a1a:	9308      	str	r3, [sp, #32]
 8009a1c:	2330      	movs	r3, #48	; 0x30
 8009a1e:	f88b 3000 	strb.w	r3, [fp]
 8009a22:	465b      	mov	r3, fp
 8009a24:	781a      	ldrb	r2, [r3, #0]
 8009a26:	3201      	adds	r2, #1
 8009a28:	701a      	strb	r2, [r3, #0]
 8009a2a:	e78c      	b.n	8009946 <_dtoa_r+0x5de>
 8009a2c:	461d      	mov	r5, r3
 8009a2e:	e7ea      	b.n	8009a06 <_dtoa_r+0x69e>
 8009a30:	2200      	movs	r2, #0
 8009a32:	4b9b      	ldr	r3, [pc, #620]	; (8009ca0 <_dtoa_r+0x938>)
 8009a34:	f7f6 fd88 	bl	8000548 <__aeabi_dmul>
 8009a38:	2200      	movs	r2, #0
 8009a3a:	2300      	movs	r3, #0
 8009a3c:	4606      	mov	r6, r0
 8009a3e:	460f      	mov	r7, r1
 8009a40:	f7f7 f842 	bl	8000ac8 <__aeabi_dcmpeq>
 8009a44:	2800      	cmp	r0, #0
 8009a46:	d09a      	beq.n	800997e <_dtoa_r+0x616>
 8009a48:	e7cb      	b.n	80099e2 <_dtoa_r+0x67a>
 8009a4a:	9a0a      	ldr	r2, [sp, #40]	; 0x28
 8009a4c:	2a00      	cmp	r2, #0
 8009a4e:	f000 808b 	beq.w	8009b68 <_dtoa_r+0x800>
 8009a52:	9a06      	ldr	r2, [sp, #24]
 8009a54:	2a01      	cmp	r2, #1
 8009a56:	dc6e      	bgt.n	8009b36 <_dtoa_r+0x7ce>
 8009a58:	9a13      	ldr	r2, [sp, #76]	; 0x4c
 8009a5a:	2a00      	cmp	r2, #0
 8009a5c:	d067      	beq.n	8009b2e <_dtoa_r+0x7c6>
 8009a5e:	f203 4333 	addw	r3, r3, #1075	; 0x433
 8009a62:	9f07      	ldr	r7, [sp, #28]
 8009a64:	9d05      	ldr	r5, [sp, #20]
 8009a66:	9a05      	ldr	r2, [sp, #20]
 8009a68:	2101      	movs	r1, #1
 8009a6a:	441a      	add	r2, r3
 8009a6c:	4620      	mov	r0, r4
 8009a6e:	9205      	str	r2, [sp, #20]
 8009a70:	4498      	add	r8, r3
 8009a72:	f000 fb13 	bl	800a09c <__i2b>
 8009a76:	4606      	mov	r6, r0
 8009a78:	2d00      	cmp	r5, #0
 8009a7a:	dd0c      	ble.n	8009a96 <_dtoa_r+0x72e>
 8009a7c:	f1b8 0f00 	cmp.w	r8, #0
 8009a80:	dd09      	ble.n	8009a96 <_dtoa_r+0x72e>
 8009a82:	4545      	cmp	r5, r8
 8009a84:	9a05      	ldr	r2, [sp, #20]
 8009a86:	462b      	mov	r3, r5
 8009a88:	bfa8      	it	ge
 8009a8a:	4643      	movge	r3, r8
 8009a8c:	1ad2      	subs	r2, r2, r3
 8009a8e:	9205      	str	r2, [sp, #20]
 8009a90:	1aed      	subs	r5, r5, r3
 8009a92:	eba8 0803 	sub.w	r8, r8, r3
 8009a96:	9b07      	ldr	r3, [sp, #28]
 8009a98:	b1eb      	cbz	r3, 8009ad6 <_dtoa_r+0x76e>
 8009a9a:	9b0a      	ldr	r3, [sp, #40]	; 0x28
 8009a9c:	2b00      	cmp	r3, #0
 8009a9e:	d067      	beq.n	8009b70 <_dtoa_r+0x808>
 8009aa0:	b18f      	cbz	r7, 8009ac6 <_dtoa_r+0x75e>
 8009aa2:	4631      	mov	r1, r6
 8009aa4:	463a      	mov	r2, r7
 8009aa6:	4620      	mov	r0, r4
 8009aa8:	f000 fb98 	bl	800a1dc <__pow5mult>
 8009aac:	9a04      	ldr	r2, [sp, #16]
 8009aae:	4601      	mov	r1, r0
 8009ab0:	4606      	mov	r6, r0
 8009ab2:	4620      	mov	r0, r4
 8009ab4:	f000 fafb 	bl	800a0ae <__multiply>
 8009ab8:	9904      	ldr	r1, [sp, #16]
 8009aba:	9008      	str	r0, [sp, #32]
 8009abc:	4620      	mov	r0, r4
 8009abe:	f000 fa4d 	bl	8009f5c <_Bfree>
 8009ac2:	9b08      	ldr	r3, [sp, #32]
 8009ac4:	9304      	str	r3, [sp, #16]
 8009ac6:	9b07      	ldr	r3, [sp, #28]
 8009ac8:	1bda      	subs	r2, r3, r7
 8009aca:	d004      	beq.n	8009ad6 <_dtoa_r+0x76e>
 8009acc:	9904      	ldr	r1, [sp, #16]
 8009ace:	4620      	mov	r0, r4
 8009ad0:	f000 fb84 	bl	800a1dc <__pow5mult>
 8009ad4:	9004      	str	r0, [sp, #16]
 8009ad6:	2101      	movs	r1, #1
 8009ad8:	4620      	mov	r0, r4
 8009ada:	f000 fadf 	bl	800a09c <__i2b>
 8009ade:	9b0e      	ldr	r3, [sp, #56]	; 0x38
 8009ae0:	4607      	mov	r7, r0
 8009ae2:	2b00      	cmp	r3, #0
 8009ae4:	f000 81d0 	beq.w	8009e88 <_dtoa_r+0xb20>
 8009ae8:	461a      	mov	r2, r3
 8009aea:	4601      	mov	r1, r0
 8009aec:	4620      	mov	r0, r4
 8009aee:	f000 fb75 	bl	800a1dc <__pow5mult>
 8009af2:	9b06      	ldr	r3, [sp, #24]
 8009af4:	2b01      	cmp	r3, #1
 8009af6:	4607      	mov	r7, r0
 8009af8:	dc40      	bgt.n	8009b7c <_dtoa_r+0x814>
 8009afa:	9b00      	ldr	r3, [sp, #0]
 8009afc:	2b00      	cmp	r3, #0
 8009afe:	d139      	bne.n	8009b74 <_dtoa_r+0x80c>
 8009b00:	9b01      	ldr	r3, [sp, #4]
 8009b02:	f3c3 0313 	ubfx	r3, r3, #0, #20
 8009b06:	2b00      	cmp	r3, #0
 8009b08:	d136      	bne.n	8009b78 <_dtoa_r+0x810>
 8009b0a:	9b01      	ldr	r3, [sp, #4]
 8009b0c:	f023 4300 	bic.w	r3, r3, #2147483648	; 0x80000000
 8009b10:	0d1b      	lsrs	r3, r3, #20
 8009b12:	051b      	lsls	r3, r3, #20
 8009b14:	b12b      	cbz	r3, 8009b22 <_dtoa_r+0x7ba>
 8009b16:	9b05      	ldr	r3, [sp, #20]
 8009b18:	3301      	adds	r3, #1
 8009b1a:	9305      	str	r3, [sp, #20]
 8009b1c:	f108 0801 	add.w	r8, r8, #1
 8009b20:	2301      	movs	r3, #1
 8009b22:	9307      	str	r3, [sp, #28]
 8009b24:	9b0e      	ldr	r3, [sp, #56]	; 0x38
 8009b26:	2b00      	cmp	r3, #0
 8009b28:	d12a      	bne.n	8009b80 <_dtoa_r+0x818>
 8009b2a:	2001      	movs	r0, #1
 8009b2c:	e030      	b.n	8009b90 <_dtoa_r+0x828>
 8009b2e:	9b14      	ldr	r3, [sp, #80]	; 0x50
 8009b30:	f1c3 0336 	rsb	r3, r3, #54	; 0x36
 8009b34:	e795      	b.n	8009a62 <_dtoa_r+0x6fa>
 8009b36:	9b07      	ldr	r3, [sp, #28]
 8009b38:	f109 37ff 	add.w	r7, r9, #4294967295	; 0xffffffff
 8009b3c:	42bb      	cmp	r3, r7
 8009b3e:	bfbf      	itttt	lt
 8009b40:	9b07      	ldrlt	r3, [sp, #28]
 8009b42:	9707      	strlt	r7, [sp, #28]
 8009b44:	1afa      	sublt	r2, r7, r3
 8009b46:	9b0e      	ldrlt	r3, [sp, #56]	; 0x38
 8009b48:	bfbb      	ittet	lt
 8009b4a:	189b      	addlt	r3, r3, r2
 8009b4c:	930e      	strlt	r3, [sp, #56]	; 0x38
 8009b4e:	1bdf      	subge	r7, r3, r7
 8009b50:	2700      	movlt	r7, #0
 8009b52:	f1b9 0f00 	cmp.w	r9, #0
 8009b56:	bfb5      	itete	lt
 8009b58:	9b05      	ldrlt	r3, [sp, #20]
 8009b5a:	9d05      	ldrge	r5, [sp, #20]
 8009b5c:	eba3 0509 	sublt.w	r5, r3, r9
 8009b60:	464b      	movge	r3, r9
 8009b62:	bfb8      	it	lt
 8009b64:	2300      	movlt	r3, #0
 8009b66:	e77e      	b.n	8009a66 <_dtoa_r+0x6fe>
 8009b68:	9f07      	ldr	r7, [sp, #28]
 8009b6a:	9d05      	ldr	r5, [sp, #20]
 8009b6c:	9e0a      	ldr	r6, [sp, #40]	; 0x28
 8009b6e:	e783      	b.n	8009a78 <_dtoa_r+0x710>
 8009b70:	9a07      	ldr	r2, [sp, #28]
 8009b72:	e7ab      	b.n	8009acc <_dtoa_r+0x764>
 8009b74:	2300      	movs	r3, #0
 8009b76:	e7d4      	b.n	8009b22 <_dtoa_r+0x7ba>
 8009b78:	9b00      	ldr	r3, [sp, #0]
 8009b7a:	e7d2      	b.n	8009b22 <_dtoa_r+0x7ba>
 8009b7c:	2300      	movs	r3, #0
 8009b7e:	9307      	str	r3, [sp, #28]
 8009b80:	693b      	ldr	r3, [r7, #16]
 8009b82:	eb07 0383 	add.w	r3, r7, r3, lsl #2
 8009b86:	6918      	ldr	r0, [r3, #16]
 8009b88:	f000 fa3a 	bl	800a000 <__hi0bits>
 8009b8c:	f1c0 0020 	rsb	r0, r0, #32
 8009b90:	4440      	add	r0, r8
 8009b92:	f010 001f 	ands.w	r0, r0, #31
 8009b96:	d047      	beq.n	8009c28 <_dtoa_r+0x8c0>
 8009b98:	f1c0 0320 	rsb	r3, r0, #32
 8009b9c:	2b04      	cmp	r3, #4
 8009b9e:	dd3b      	ble.n	8009c18 <_dtoa_r+0x8b0>
 8009ba0:	9b05      	ldr	r3, [sp, #20]
 8009ba2:	f1c0 001c 	rsb	r0, r0, #28
 8009ba6:	4403      	add	r3, r0
 8009ba8:	9305      	str	r3, [sp, #20]
 8009baa:	4405      	add	r5, r0
 8009bac:	4480      	add	r8, r0
 8009bae:	9b05      	ldr	r3, [sp, #20]
 8009bb0:	2b00      	cmp	r3, #0
 8009bb2:	dd05      	ble.n	8009bc0 <_dtoa_r+0x858>
 8009bb4:	461a      	mov	r2, r3
 8009bb6:	9904      	ldr	r1, [sp, #16]
 8009bb8:	4620      	mov	r0, r4
 8009bba:	f000 fb5d 	bl	800a278 <__lshift>
 8009bbe:	9004      	str	r0, [sp, #16]
 8009bc0:	f1b8 0f00 	cmp.w	r8, #0
 8009bc4:	dd05      	ble.n	8009bd2 <_dtoa_r+0x86a>
 8009bc6:	4639      	mov	r1, r7
 8009bc8:	4642      	mov	r2, r8
 8009bca:	4620      	mov	r0, r4
 8009bcc:	f000 fb54 	bl	800a278 <__lshift>
 8009bd0:	4607      	mov	r7, r0
 8009bd2:	9b0f      	ldr	r3, [sp, #60]	; 0x3c
 8009bd4:	b353      	cbz	r3, 8009c2c <_dtoa_r+0x8c4>
 8009bd6:	4639      	mov	r1, r7
 8009bd8:	9804      	ldr	r0, [sp, #16]
 8009bda:	f000 fba1 	bl	800a320 <__mcmp>
 8009bde:	2800      	cmp	r0, #0
 8009be0:	da24      	bge.n	8009c2c <_dtoa_r+0x8c4>
 8009be2:	2300      	movs	r3, #0
 8009be4:	220a      	movs	r2, #10
 8009be6:	9904      	ldr	r1, [sp, #16]
 8009be8:	4620      	mov	r0, r4
 8009bea:	f000 f9ce 	bl	8009f8a <__multadd>
 8009bee:	9b0a      	ldr	r3, [sp, #40]	; 0x28
 8009bf0:	9004      	str	r0, [sp, #16]
 8009bf2:	f10a 3aff 	add.w	sl, sl, #4294967295	; 0xffffffff
 8009bf6:	2b00      	cmp	r3, #0
 8009bf8:	f000 814d 	beq.w	8009e96 <_dtoa_r+0xb2e>
 8009bfc:	2300      	movs	r3, #0
 8009bfe:	4631      	mov	r1, r6
 8009c00:	220a      	movs	r2, #10
 8009c02:	4620      	mov	r0, r4
 8009c04:	f000 f9c1 	bl	8009f8a <__multadd>
 8009c08:	9b02      	ldr	r3, [sp, #8]
 8009c0a:	2b00      	cmp	r3, #0
 8009c0c:	4606      	mov	r6, r0
 8009c0e:	dc4f      	bgt.n	8009cb0 <_dtoa_r+0x948>
 8009c10:	9b06      	ldr	r3, [sp, #24]
 8009c12:	2b02      	cmp	r3, #2
 8009c14:	dd4c      	ble.n	8009cb0 <_dtoa_r+0x948>
 8009c16:	e011      	b.n	8009c3c <_dtoa_r+0x8d4>
 8009c18:	d0c9      	beq.n	8009bae <_dtoa_r+0x846>
 8009c1a:	9a05      	ldr	r2, [sp, #20]
 8009c1c:	331c      	adds	r3, #28
 8009c1e:	441a      	add	r2, r3
 8009c20:	9205      	str	r2, [sp, #20]
 8009c22:	441d      	add	r5, r3
 8009c24:	4498      	add	r8, r3
 8009c26:	e7c2      	b.n	8009bae <_dtoa_r+0x846>
 8009c28:	4603      	mov	r3, r0
 8009c2a:	e7f6      	b.n	8009c1a <_dtoa_r+0x8b2>
 8009c2c:	f1b9 0f00 	cmp.w	r9, #0
 8009c30:	dc38      	bgt.n	8009ca4 <_dtoa_r+0x93c>
 8009c32:	9b06      	ldr	r3, [sp, #24]
 8009c34:	2b02      	cmp	r3, #2
 8009c36:	dd35      	ble.n	8009ca4 <_dtoa_r+0x93c>
 8009c38:	f8cd 9008 	str.w	r9, [sp, #8]
 8009c3c:	9b02      	ldr	r3, [sp, #8]
 8009c3e:	b963      	cbnz	r3, 8009c5a <_dtoa_r+0x8f2>
 8009c40:	4639      	mov	r1, r7
 8009c42:	2205      	movs	r2, #5
 8009c44:	4620      	mov	r0, r4
 8009c46:	f000 f9a0 	bl	8009f8a <__multadd>
 8009c4a:	4601      	mov	r1, r0
 8009c4c:	4607      	mov	r7, r0
 8009c4e:	9804      	ldr	r0, [sp, #16]
 8009c50:	f000 fb66 	bl	800a320 <__mcmp>
 8009c54:	2800      	cmp	r0, #0
 8009c56:	f73f adcc 	bgt.w	80097f2 <_dtoa_r+0x48a>
 8009c5a:	9b0b      	ldr	r3, [sp, #44]	; 0x2c
 8009c5c:	465d      	mov	r5, fp
 8009c5e:	ea6f 0a03 	mvn.w	sl, r3
 8009c62:	f04f 0900 	mov.w	r9, #0
 8009c66:	4639      	mov	r1, r7
 8009c68:	4620      	mov	r0, r4
 8009c6a:	f000 f977 	bl	8009f5c <_Bfree>
 8009c6e:	2e00      	cmp	r6, #0
 8009c70:	f43f aeb7 	beq.w	80099e2 <_dtoa_r+0x67a>
 8009c74:	f1b9 0f00 	cmp.w	r9, #0
 8009c78:	d005      	beq.n	8009c86 <_dtoa_r+0x91e>
 8009c7a:	45b1      	cmp	r9, r6
 8009c7c:	d003      	beq.n	8009c86 <_dtoa_r+0x91e>
 8009c7e:	4649      	mov	r1, r9
 8009c80:	4620      	mov	r0, r4
 8009c82:	f000 f96b 	bl	8009f5c <_Bfree>
 8009c86:	4631      	mov	r1, r6
 8009c88:	4620      	mov	r0, r4
 8009c8a:	f000 f967 	bl	8009f5c <_Bfree>
 8009c8e:	e6a8      	b.n	80099e2 <_dtoa_r+0x67a>
 8009c90:	2700      	movs	r7, #0
 8009c92:	463e      	mov	r6, r7
 8009c94:	e7e1      	b.n	8009c5a <_dtoa_r+0x8f2>
 8009c96:	f8dd a020 	ldr.w	sl, [sp, #32]
 8009c9a:	463e      	mov	r6, r7
 8009c9c:	e5a9      	b.n	80097f2 <_dtoa_r+0x48a>
 8009c9e:	bf00      	nop
 8009ca0:	40240000 	.word	0x40240000
 8009ca4:	9b0a      	ldr	r3, [sp, #40]	; 0x28
 8009ca6:	f8cd 9008 	str.w	r9, [sp, #8]
 8009caa:	2b00      	cmp	r3, #0
 8009cac:	f000 80fa 	beq.w	8009ea4 <_dtoa_r+0xb3c>
 8009cb0:	2d00      	cmp	r5, #0
 8009cb2:	dd05      	ble.n	8009cc0 <_dtoa_r+0x958>
 8009cb4:	4631      	mov	r1, r6
 8009cb6:	462a      	mov	r2, r5
 8009cb8:	4620      	mov	r0, r4
 8009cba:	f000 fadd 	bl	800a278 <__lshift>
 8009cbe:	4606      	mov	r6, r0
 8009cc0:	9b07      	ldr	r3, [sp, #28]
 8009cc2:	2b00      	cmp	r3, #0
 8009cc4:	d04c      	beq.n	8009d60 <_dtoa_r+0x9f8>
 8009cc6:	6871      	ldr	r1, [r6, #4]
 8009cc8:	4620      	mov	r0, r4
 8009cca:	f000 f913 	bl	8009ef4 <_Balloc>
 8009cce:	6932      	ldr	r2, [r6, #16]
 8009cd0:	3202      	adds	r2, #2
 8009cd2:	4605      	mov	r5, r0
 8009cd4:	0092      	lsls	r2, r2, #2
 8009cd6:	f106 010c 	add.w	r1, r6, #12
 8009cda:	300c      	adds	r0, #12
 8009cdc:	f7fe fef2 	bl	8008ac4 <memcpy>
 8009ce0:	2201      	movs	r2, #1
 8009ce2:	4629      	mov	r1, r5
 8009ce4:	4620      	mov	r0, r4
 8009ce6:	f000 fac7 	bl	800a278 <__lshift>
 8009cea:	9b00      	ldr	r3, [sp, #0]
 8009cec:	f8cd b014 	str.w	fp, [sp, #20]
 8009cf0:	f003 0301 	and.w	r3, r3, #1
 8009cf4:	46b1      	mov	r9, r6
 8009cf6:	9307      	str	r3, [sp, #28]
 8009cf8:	4606      	mov	r6, r0
 8009cfa:	4639      	mov	r1, r7
 8009cfc:	9804      	ldr	r0, [sp, #16]
 8009cfe:	f7ff faa7 	bl	8009250 <quorem>
 8009d02:	4649      	mov	r1, r9
 8009d04:	4605      	mov	r5, r0
 8009d06:	f100 0830 	add.w	r8, r0, #48	; 0x30
 8009d0a:	9804      	ldr	r0, [sp, #16]
 8009d0c:	f000 fb08 	bl	800a320 <__mcmp>
 8009d10:	4632      	mov	r2, r6
 8009d12:	9000      	str	r0, [sp, #0]
 8009d14:	4639      	mov	r1, r7
 8009d16:	4620      	mov	r0, r4
 8009d18:	f000 fb1c 	bl	800a354 <__mdiff>
 8009d1c:	68c3      	ldr	r3, [r0, #12]
 8009d1e:	4602      	mov	r2, r0
 8009d20:	bb03      	cbnz	r3, 8009d64 <_dtoa_r+0x9fc>
 8009d22:	4601      	mov	r1, r0
 8009d24:	9008      	str	r0, [sp, #32]
 8009d26:	9804      	ldr	r0, [sp, #16]
 8009d28:	f000 fafa 	bl	800a320 <__mcmp>
 8009d2c:	9a08      	ldr	r2, [sp, #32]
 8009d2e:	4603      	mov	r3, r0
 8009d30:	4611      	mov	r1, r2
 8009d32:	4620      	mov	r0, r4
 8009d34:	9308      	str	r3, [sp, #32]
 8009d36:	f000 f911 	bl	8009f5c <_Bfree>
 8009d3a:	9b08      	ldr	r3, [sp, #32]
 8009d3c:	b9a3      	cbnz	r3, 8009d68 <_dtoa_r+0xa00>
 8009d3e:	9a06      	ldr	r2, [sp, #24]
 8009d40:	b992      	cbnz	r2, 8009d68 <_dtoa_r+0xa00>
 8009d42:	9a07      	ldr	r2, [sp, #28]
 8009d44:	b982      	cbnz	r2, 8009d68 <_dtoa_r+0xa00>
 8009d46:	f1b8 0f39 	cmp.w	r8, #57	; 0x39
 8009d4a:	d029      	beq.n	8009da0 <_dtoa_r+0xa38>
 8009d4c:	9b00      	ldr	r3, [sp, #0]
 8009d4e:	2b00      	cmp	r3, #0
 8009d50:	dd01      	ble.n	8009d56 <_dtoa_r+0x9ee>
 8009d52:	f105 0831 	add.w	r8, r5, #49	; 0x31
 8009d56:	9b05      	ldr	r3, [sp, #20]
 8009d58:	1c5d      	adds	r5, r3, #1
 8009d5a:	f883 8000 	strb.w	r8, [r3]
 8009d5e:	e782      	b.n	8009c66 <_dtoa_r+0x8fe>
 8009d60:	4630      	mov	r0, r6
 8009d62:	e7c2      	b.n	8009cea <_dtoa_r+0x982>
 8009d64:	2301      	movs	r3, #1
 8009d66:	e7e3      	b.n	8009d30 <_dtoa_r+0x9c8>
 8009d68:	9a00      	ldr	r2, [sp, #0]
 8009d6a:	2a00      	cmp	r2, #0
 8009d6c:	db04      	blt.n	8009d78 <_dtoa_r+0xa10>
 8009d6e:	d125      	bne.n	8009dbc <_dtoa_r+0xa54>
 8009d70:	9a06      	ldr	r2, [sp, #24]
 8009d72:	bb1a      	cbnz	r2, 8009dbc <_dtoa_r+0xa54>
 8009d74:	9a07      	ldr	r2, [sp, #28]
 8009d76:	bb0a      	cbnz	r2, 8009dbc <_dtoa_r+0xa54>
 8009d78:	2b00      	cmp	r3, #0
 8009d7a:	ddec      	ble.n	8009d56 <_dtoa_r+0x9ee>
 8009d7c:	2201      	movs	r2, #1
 8009d7e:	9904      	ldr	r1, [sp, #16]
 8009d80:	4620      	mov	r0, r4
 8009d82:	f000 fa79 	bl	800a278 <__lshift>
 8009d86:	4639      	mov	r1, r7
 8009d88:	9004      	str	r0, [sp, #16]
 8009d8a:	f000 fac9 	bl	800a320 <__mcmp>
 8009d8e:	2800      	cmp	r0, #0
 8009d90:	dc03      	bgt.n	8009d9a <_dtoa_r+0xa32>
 8009d92:	d1e0      	bne.n	8009d56 <_dtoa_r+0x9ee>
 8009d94:	f018 0f01 	tst.w	r8, #1
 8009d98:	d0dd      	beq.n	8009d56 <_dtoa_r+0x9ee>
 8009d9a:	f1b8 0f39 	cmp.w	r8, #57	; 0x39
 8009d9e:	d1d8      	bne.n	8009d52 <_dtoa_r+0x9ea>
 8009da0:	9b05      	ldr	r3, [sp, #20]
 8009da2:	9a05      	ldr	r2, [sp, #20]
 8009da4:	1c5d      	adds	r5, r3, #1
 8009da6:	2339      	movs	r3, #57	; 0x39
 8009da8:	7013      	strb	r3, [r2, #0]
 8009daa:	f815 3c01 	ldrb.w	r3, [r5, #-1]
 8009dae:	2b39      	cmp	r3, #57	; 0x39
 8009db0:	f105 32ff 	add.w	r2, r5, #4294967295	; 0xffffffff
 8009db4:	d04f      	beq.n	8009e56 <_dtoa_r+0xaee>
 8009db6:	3301      	adds	r3, #1
 8009db8:	7013      	strb	r3, [r2, #0]
 8009dba:	e754      	b.n	8009c66 <_dtoa_r+0x8fe>
 8009dbc:	9a05      	ldr	r2, [sp, #20]
 8009dbe:	2b00      	cmp	r3, #0
 8009dc0:	f102 0501 	add.w	r5, r2, #1
 8009dc4:	dd06      	ble.n	8009dd4 <_dtoa_r+0xa6c>
 8009dc6:	f1b8 0f39 	cmp.w	r8, #57	; 0x39
 8009dca:	d0e9      	beq.n	8009da0 <_dtoa_r+0xa38>
 8009dcc:	f108 0801 	add.w	r8, r8, #1
 8009dd0:	9b05      	ldr	r3, [sp, #20]
 8009dd2:	e7c2      	b.n	8009d5a <_dtoa_r+0x9f2>
 8009dd4:	9a02      	ldr	r2, [sp, #8]
 8009dd6:	f805 8c01 	strb.w	r8, [r5, #-1]
 8009dda:	eba5 030b 	sub.w	r3, r5, fp
 8009dde:	4293      	cmp	r3, r2
 8009de0:	d021      	beq.n	8009e26 <_dtoa_r+0xabe>
 8009de2:	2300      	movs	r3, #0
 8009de4:	220a      	movs	r2, #10
 8009de6:	9904      	ldr	r1, [sp, #16]
 8009de8:	4620      	mov	r0, r4
 8009dea:	f000 f8ce 	bl	8009f8a <__multadd>
 8009dee:	45b1      	cmp	r9, r6
 8009df0:	9004      	str	r0, [sp, #16]
 8009df2:	f04f 0300 	mov.w	r3, #0
 8009df6:	f04f 020a 	mov.w	r2, #10
 8009dfa:	4649      	mov	r1, r9
 8009dfc:	4620      	mov	r0, r4
 8009dfe:	d105      	bne.n	8009e0c <_dtoa_r+0xaa4>
 8009e00:	f000 f8c3 	bl	8009f8a <__multadd>
 8009e04:	4681      	mov	r9, r0
 8009e06:	4606      	mov	r6, r0
 8009e08:	9505      	str	r5, [sp, #20]
 8009e0a:	e776      	b.n	8009cfa <_dtoa_r+0x992>
 8009e0c:	f000 f8bd 	bl	8009f8a <__multadd>
 8009e10:	4631      	mov	r1, r6
 8009e12:	4681      	mov	r9, r0
 8009e14:	2300      	movs	r3, #0
 8009e16:	220a      	movs	r2, #10
 8009e18:	4620      	mov	r0, r4
 8009e1a:	f000 f8b6 	bl	8009f8a <__multadd>
 8009e1e:	4606      	mov	r6, r0
 8009e20:	e7f2      	b.n	8009e08 <_dtoa_r+0xaa0>
 8009e22:	f04f 0900 	mov.w	r9, #0
 8009e26:	2201      	movs	r2, #1
 8009e28:	9904      	ldr	r1, [sp, #16]
 8009e2a:	4620      	mov	r0, r4
 8009e2c:	f000 fa24 	bl	800a278 <__lshift>
 8009e30:	4639      	mov	r1, r7
 8009e32:	9004      	str	r0, [sp, #16]
 8009e34:	f000 fa74 	bl	800a320 <__mcmp>
 8009e38:	2800      	cmp	r0, #0
 8009e3a:	dcb6      	bgt.n	8009daa <_dtoa_r+0xa42>
 8009e3c:	d102      	bne.n	8009e44 <_dtoa_r+0xadc>
 8009e3e:	f018 0f01 	tst.w	r8, #1
 8009e42:	d1b2      	bne.n	8009daa <_dtoa_r+0xa42>
 8009e44:	f815 3c01 	ldrb.w	r3, [r5, #-1]
 8009e48:	2b30      	cmp	r3, #48	; 0x30
 8009e4a:	f105 32ff 	add.w	r2, r5, #4294967295	; 0xffffffff
 8009e4e:	f47f af0a 	bne.w	8009c66 <_dtoa_r+0x8fe>
 8009e52:	4615      	mov	r5, r2
 8009e54:	e7f6      	b.n	8009e44 <_dtoa_r+0xadc>
 8009e56:	4593      	cmp	fp, r2
 8009e58:	d105      	bne.n	8009e66 <_dtoa_r+0xafe>
 8009e5a:	2331      	movs	r3, #49	; 0x31
 8009e5c:	f10a 0a01 	add.w	sl, sl, #1
 8009e60:	f88b 3000 	strb.w	r3, [fp]
 8009e64:	e6ff      	b.n	8009c66 <_dtoa_r+0x8fe>
 8009e66:	4615      	mov	r5, r2
 8009e68:	e79f      	b.n	8009daa <_dtoa_r+0xa42>
 8009e6a:	f8df b064 	ldr.w	fp, [pc, #100]	; 8009ed0 <_dtoa_r+0xb68>
 8009e6e:	e007      	b.n	8009e80 <_dtoa_r+0xb18>
 8009e70:	9b21      	ldr	r3, [sp, #132]	; 0x84
 8009e72:	f8df b060 	ldr.w	fp, [pc, #96]	; 8009ed4 <_dtoa_r+0xb6c>
 8009e76:	b11b      	cbz	r3, 8009e80 <_dtoa_r+0xb18>
 8009e78:	f10b 0308 	add.w	r3, fp, #8
 8009e7c:	9a21      	ldr	r2, [sp, #132]	; 0x84
 8009e7e:	6013      	str	r3, [r2, #0]
 8009e80:	4658      	mov	r0, fp
 8009e82:	b017      	add	sp, #92	; 0x5c
 8009e84:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 8009e88:	9b06      	ldr	r3, [sp, #24]
 8009e8a:	2b01      	cmp	r3, #1
 8009e8c:	f77f ae35 	ble.w	8009afa <_dtoa_r+0x792>
 8009e90:	9b0e      	ldr	r3, [sp, #56]	; 0x38
 8009e92:	9307      	str	r3, [sp, #28]
 8009e94:	e649      	b.n	8009b2a <_dtoa_r+0x7c2>
 8009e96:	9b02      	ldr	r3, [sp, #8]
 8009e98:	2b00      	cmp	r3, #0
 8009e9a:	dc03      	bgt.n	8009ea4 <_dtoa_r+0xb3c>
 8009e9c:	9b06      	ldr	r3, [sp, #24]
 8009e9e:	2b02      	cmp	r3, #2
 8009ea0:	f73f aecc 	bgt.w	8009c3c <_dtoa_r+0x8d4>
 8009ea4:	465d      	mov	r5, fp
 8009ea6:	4639      	mov	r1, r7
 8009ea8:	9804      	ldr	r0, [sp, #16]
 8009eaa:	f7ff f9d1 	bl	8009250 <quorem>
 8009eae:	f100 0830 	add.w	r8, r0, #48	; 0x30
 8009eb2:	f805 8b01 	strb.w	r8, [r5], #1
 8009eb6:	9a02      	ldr	r2, [sp, #8]
 8009eb8:	eba5 030b 	sub.w	r3, r5, fp
 8009ebc:	429a      	cmp	r2, r3
 8009ebe:	ddb0      	ble.n	8009e22 <_dtoa_r+0xaba>
 8009ec0:	2300      	movs	r3, #0
 8009ec2:	220a      	movs	r2, #10
 8009ec4:	9904      	ldr	r1, [sp, #16]
 8009ec6:	4620      	mov	r0, r4
 8009ec8:	f000 f85f 	bl	8009f8a <__multadd>
 8009ecc:	9004      	str	r0, [sp, #16]
 8009ece:	e7ea      	b.n	8009ea6 <_dtoa_r+0xb3e>
 8009ed0:	0800b533 	.word	0x0800b533
 8009ed4:	0800b535 	.word	0x0800b535

08009ed8 <_localeconv_r>:
 8009ed8:	4b04      	ldr	r3, [pc, #16]	; (8009eec <_localeconv_r+0x14>)
 8009eda:	681b      	ldr	r3, [r3, #0]
 8009edc:	6a18      	ldr	r0, [r3, #32]
 8009ede:	4b04      	ldr	r3, [pc, #16]	; (8009ef0 <_localeconv_r+0x18>)
 8009ee0:	2800      	cmp	r0, #0
 8009ee2:	bf08      	it	eq
 8009ee4:	4618      	moveq	r0, r3
 8009ee6:	30f0      	adds	r0, #240	; 0xf0
 8009ee8:	4770      	bx	lr
 8009eea:	bf00      	nop
 8009eec:	20000080 	.word	0x20000080
 8009ef0:	200000e4 	.word	0x200000e4

08009ef4 <_Balloc>:
 8009ef4:	b570      	push	{r4, r5, r6, lr}
 8009ef6:	6a45      	ldr	r5, [r0, #36]	; 0x24
 8009ef8:	4604      	mov	r4, r0
 8009efa:	460e      	mov	r6, r1
 8009efc:	b93d      	cbnz	r5, 8009f0e <_Balloc+0x1a>
 8009efe:	2010      	movs	r0, #16
 8009f00:	f7fe fdd8 	bl	8008ab4 <malloc>
 8009f04:	6260      	str	r0, [r4, #36]	; 0x24
 8009f06:	e9c0 5501 	strd	r5, r5, [r0, #4]
 8009f0a:	6005      	str	r5, [r0, #0]
 8009f0c:	60c5      	str	r5, [r0, #12]
 8009f0e:	6a65      	ldr	r5, [r4, #36]	; 0x24
 8009f10:	68eb      	ldr	r3, [r5, #12]
 8009f12:	b183      	cbz	r3, 8009f36 <_Balloc+0x42>
 8009f14:	6a63      	ldr	r3, [r4, #36]	; 0x24
 8009f16:	68db      	ldr	r3, [r3, #12]
 8009f18:	f853 0026 	ldr.w	r0, [r3, r6, lsl #2]
 8009f1c:	b9b8      	cbnz	r0, 8009f4e <_Balloc+0x5a>
 8009f1e:	2101      	movs	r1, #1
 8009f20:	fa01 f506 	lsl.w	r5, r1, r6
 8009f24:	1d6a      	adds	r2, r5, #5
 8009f26:	0092      	lsls	r2, r2, #2
 8009f28:	4620      	mov	r0, r4
 8009f2a:	f000 fabf 	bl	800a4ac <_calloc_r>
 8009f2e:	b160      	cbz	r0, 8009f4a <_Balloc+0x56>
 8009f30:	e9c0 6501 	strd	r6, r5, [r0, #4]
 8009f34:	e00e      	b.n	8009f54 <_Balloc+0x60>
 8009f36:	2221      	movs	r2, #33	; 0x21
 8009f38:	2104      	movs	r1, #4
 8009f3a:	4620      	mov	r0, r4
 8009f3c:	f000 fab6 	bl	800a4ac <_calloc_r>
 8009f40:	6a63      	ldr	r3, [r4, #36]	; 0x24
 8009f42:	60e8      	str	r0, [r5, #12]
 8009f44:	68db      	ldr	r3, [r3, #12]
 8009f46:	2b00      	cmp	r3, #0
 8009f48:	d1e4      	bne.n	8009f14 <_Balloc+0x20>
 8009f4a:	2000      	movs	r0, #0
 8009f4c:	bd70      	pop	{r4, r5, r6, pc}
 8009f4e:	6802      	ldr	r2, [r0, #0]
 8009f50:	f843 2026 	str.w	r2, [r3, r6, lsl #2]
 8009f54:	2300      	movs	r3, #0
 8009f56:	e9c0 3303 	strd	r3, r3, [r0, #12]
 8009f5a:	e7f7      	b.n	8009f4c <_Balloc+0x58>

08009f5c <_Bfree>:
 8009f5c:	b570      	push	{r4, r5, r6, lr}
 8009f5e:	6a44      	ldr	r4, [r0, #36]	; 0x24
 8009f60:	4606      	mov	r6, r0
 8009f62:	460d      	mov	r5, r1
 8009f64:	b93c      	cbnz	r4, 8009f76 <_Bfree+0x1a>
 8009f66:	2010      	movs	r0, #16
 8009f68:	f7fe fda4 	bl	8008ab4 <malloc>
 8009f6c:	6270      	str	r0, [r6, #36]	; 0x24
 8009f6e:	e9c0 4401 	strd	r4, r4, [r0, #4]
 8009f72:	6004      	str	r4, [r0, #0]
 8009f74:	60c4      	str	r4, [r0, #12]
 8009f76:	b13d      	cbz	r5, 8009f88 <_Bfree+0x2c>
 8009f78:	6a73      	ldr	r3, [r6, #36]	; 0x24
 8009f7a:	686a      	ldr	r2, [r5, #4]
 8009f7c:	68db      	ldr	r3, [r3, #12]
 8009f7e:	f853 1022 	ldr.w	r1, [r3, r2, lsl #2]
 8009f82:	6029      	str	r1, [r5, #0]
 8009f84:	f843 5022 	str.w	r5, [r3, r2, lsl #2]
 8009f88:	bd70      	pop	{r4, r5, r6, pc}

08009f8a <__multadd>:
 8009f8a:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8009f8e:	690d      	ldr	r5, [r1, #16]
 8009f90:	461f      	mov	r7, r3
 8009f92:	4606      	mov	r6, r0
 8009f94:	460c      	mov	r4, r1
 8009f96:	f101 0c14 	add.w	ip, r1, #20
 8009f9a:	2300      	movs	r3, #0
 8009f9c:	f8dc 0000 	ldr.w	r0, [ip]
 8009fa0:	b281      	uxth	r1, r0
 8009fa2:	fb02 7101 	mla	r1, r2, r1, r7
 8009fa6:	0c0f      	lsrs	r7, r1, #16
 8009fa8:	0c00      	lsrs	r0, r0, #16
 8009faa:	fb02 7000 	mla	r0, r2, r0, r7
 8009fae:	b289      	uxth	r1, r1
 8009fb0:	3301      	adds	r3, #1
 8009fb2:	eb01 4100 	add.w	r1, r1, r0, lsl #16
 8009fb6:	429d      	cmp	r5, r3
 8009fb8:	ea4f 4710 	mov.w	r7, r0, lsr #16
 8009fbc:	f84c 1b04 	str.w	r1, [ip], #4
 8009fc0:	dcec      	bgt.n	8009f9c <__multadd+0x12>
 8009fc2:	b1d7      	cbz	r7, 8009ffa <__multadd+0x70>
 8009fc4:	68a3      	ldr	r3, [r4, #8]
 8009fc6:	42ab      	cmp	r3, r5
 8009fc8:	dc12      	bgt.n	8009ff0 <__multadd+0x66>
 8009fca:	6861      	ldr	r1, [r4, #4]
 8009fcc:	4630      	mov	r0, r6
 8009fce:	3101      	adds	r1, #1
 8009fd0:	f7ff ff90 	bl	8009ef4 <_Balloc>
 8009fd4:	6922      	ldr	r2, [r4, #16]
 8009fd6:	3202      	adds	r2, #2
 8009fd8:	f104 010c 	add.w	r1, r4, #12
 8009fdc:	4680      	mov	r8, r0
 8009fde:	0092      	lsls	r2, r2, #2
 8009fe0:	300c      	adds	r0, #12
 8009fe2:	f7fe fd6f 	bl	8008ac4 <memcpy>
 8009fe6:	4621      	mov	r1, r4
 8009fe8:	4630      	mov	r0, r6
 8009fea:	f7ff ffb7 	bl	8009f5c <_Bfree>
 8009fee:	4644      	mov	r4, r8
 8009ff0:	eb04 0385 	add.w	r3, r4, r5, lsl #2
 8009ff4:	3501      	adds	r5, #1
 8009ff6:	615f      	str	r7, [r3, #20]
 8009ff8:	6125      	str	r5, [r4, #16]
 8009ffa:	4620      	mov	r0, r4
 8009ffc:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

0800a000 <__hi0bits>:
 800a000:	0c02      	lsrs	r2, r0, #16
 800a002:	0412      	lsls	r2, r2, #16
 800a004:	4603      	mov	r3, r0
 800a006:	b9b2      	cbnz	r2, 800a036 <__hi0bits+0x36>
 800a008:	0403      	lsls	r3, r0, #16
 800a00a:	2010      	movs	r0, #16
 800a00c:	f013 4f7f 	tst.w	r3, #4278190080	; 0xff000000
 800a010:	bf04      	itt	eq
 800a012:	021b      	lsleq	r3, r3, #8
 800a014:	3008      	addeq	r0, #8
 800a016:	f013 4f70 	tst.w	r3, #4026531840	; 0xf0000000
 800a01a:	bf04      	itt	eq
 800a01c:	011b      	lsleq	r3, r3, #4
 800a01e:	3004      	addeq	r0, #4
 800a020:	f013 4f40 	tst.w	r3, #3221225472	; 0xc0000000
 800a024:	bf04      	itt	eq
 800a026:	009b      	lsleq	r3, r3, #2
 800a028:	3002      	addeq	r0, #2
 800a02a:	2b00      	cmp	r3, #0
 800a02c:	db06      	blt.n	800a03c <__hi0bits+0x3c>
 800a02e:	005b      	lsls	r3, r3, #1
 800a030:	d503      	bpl.n	800a03a <__hi0bits+0x3a>
 800a032:	3001      	adds	r0, #1
 800a034:	4770      	bx	lr
 800a036:	2000      	movs	r0, #0
 800a038:	e7e8      	b.n	800a00c <__hi0bits+0xc>
 800a03a:	2020      	movs	r0, #32
 800a03c:	4770      	bx	lr

0800a03e <__lo0bits>:
 800a03e:	6803      	ldr	r3, [r0, #0]
 800a040:	f013 0207 	ands.w	r2, r3, #7
 800a044:	4601      	mov	r1, r0
 800a046:	d00b      	beq.n	800a060 <__lo0bits+0x22>
 800a048:	07da      	lsls	r2, r3, #31
 800a04a:	d423      	bmi.n	800a094 <__lo0bits+0x56>
 800a04c:	0798      	lsls	r0, r3, #30
 800a04e:	bf49      	itett	mi
 800a050:	085b      	lsrmi	r3, r3, #1
 800a052:	089b      	lsrpl	r3, r3, #2
 800a054:	2001      	movmi	r0, #1
 800a056:	600b      	strmi	r3, [r1, #0]
 800a058:	bf5c      	itt	pl
 800a05a:	600b      	strpl	r3, [r1, #0]
 800a05c:	2002      	movpl	r0, #2
 800a05e:	4770      	bx	lr
 800a060:	b298      	uxth	r0, r3
 800a062:	b9a8      	cbnz	r0, 800a090 <__lo0bits+0x52>
 800a064:	0c1b      	lsrs	r3, r3, #16
 800a066:	2010      	movs	r0, #16
 800a068:	f013 0fff 	tst.w	r3, #255	; 0xff
 800a06c:	bf04      	itt	eq
 800a06e:	0a1b      	lsreq	r3, r3, #8
 800a070:	3008      	addeq	r0, #8
 800a072:	071a      	lsls	r2, r3, #28
 800a074:	bf04      	itt	eq
 800a076:	091b      	lsreq	r3, r3, #4
 800a078:	3004      	addeq	r0, #4
 800a07a:	079a      	lsls	r2, r3, #30
 800a07c:	bf04      	itt	eq
 800a07e:	089b      	lsreq	r3, r3, #2
 800a080:	3002      	addeq	r0, #2
 800a082:	07da      	lsls	r2, r3, #31
 800a084:	d402      	bmi.n	800a08c <__lo0bits+0x4e>
 800a086:	085b      	lsrs	r3, r3, #1
 800a088:	d006      	beq.n	800a098 <__lo0bits+0x5a>
 800a08a:	3001      	adds	r0, #1
 800a08c:	600b      	str	r3, [r1, #0]
 800a08e:	4770      	bx	lr
 800a090:	4610      	mov	r0, r2
 800a092:	e7e9      	b.n	800a068 <__lo0bits+0x2a>
 800a094:	2000      	movs	r0, #0
 800a096:	4770      	bx	lr
 800a098:	2020      	movs	r0, #32
 800a09a:	4770      	bx	lr

0800a09c <__i2b>:
 800a09c:	b510      	push	{r4, lr}
 800a09e:	460c      	mov	r4, r1
 800a0a0:	2101      	movs	r1, #1
 800a0a2:	f7ff ff27 	bl	8009ef4 <_Balloc>
 800a0a6:	2201      	movs	r2, #1
 800a0a8:	6144      	str	r4, [r0, #20]
 800a0aa:	6102      	str	r2, [r0, #16]
 800a0ac:	bd10      	pop	{r4, pc}

0800a0ae <__multiply>:
 800a0ae:	e92d 4ff7 	stmdb	sp!, {r0, r1, r2, r4, r5, r6, r7, r8, r9, sl, fp, lr}
 800a0b2:	4614      	mov	r4, r2
 800a0b4:	690a      	ldr	r2, [r1, #16]
 800a0b6:	6923      	ldr	r3, [r4, #16]
 800a0b8:	429a      	cmp	r2, r3
 800a0ba:	bfb8      	it	lt
 800a0bc:	460b      	movlt	r3, r1
 800a0be:	4688      	mov	r8, r1
 800a0c0:	bfbc      	itt	lt
 800a0c2:	46a0      	movlt	r8, r4
 800a0c4:	461c      	movlt	r4, r3
 800a0c6:	f8d8 7010 	ldr.w	r7, [r8, #16]
 800a0ca:	f8d4 9010 	ldr.w	r9, [r4, #16]
 800a0ce:	f8d8 3008 	ldr.w	r3, [r8, #8]
 800a0d2:	f8d8 1004 	ldr.w	r1, [r8, #4]
 800a0d6:	eb07 0609 	add.w	r6, r7, r9
 800a0da:	42b3      	cmp	r3, r6
 800a0dc:	bfb8      	it	lt
 800a0de:	3101      	addlt	r1, #1
 800a0e0:	f7ff ff08 	bl	8009ef4 <_Balloc>
 800a0e4:	f100 0514 	add.w	r5, r0, #20
 800a0e8:	eb05 0e86 	add.w	lr, r5, r6, lsl #2
 800a0ec:	462b      	mov	r3, r5
 800a0ee:	2200      	movs	r2, #0
 800a0f0:	4573      	cmp	r3, lr
 800a0f2:	d316      	bcc.n	800a122 <__multiply+0x74>
 800a0f4:	f104 0214 	add.w	r2, r4, #20
 800a0f8:	f108 0114 	add.w	r1, r8, #20
 800a0fc:	eb02 0389 	add.w	r3, r2, r9, lsl #2
 800a100:	eb01 0787 	add.w	r7, r1, r7, lsl #2
 800a104:	9300      	str	r3, [sp, #0]
 800a106:	9b00      	ldr	r3, [sp, #0]
 800a108:	9201      	str	r2, [sp, #4]
 800a10a:	4293      	cmp	r3, r2
 800a10c:	d80c      	bhi.n	800a128 <__multiply+0x7a>
 800a10e:	2e00      	cmp	r6, #0
 800a110:	dd03      	ble.n	800a11a <__multiply+0x6c>
 800a112:	f85e 3d04 	ldr.w	r3, [lr, #-4]!
 800a116:	2b00      	cmp	r3, #0
 800a118:	d05d      	beq.n	800a1d6 <__multiply+0x128>
 800a11a:	6106      	str	r6, [r0, #16]
 800a11c:	b003      	add	sp, #12
 800a11e:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 800a122:	f843 2b04 	str.w	r2, [r3], #4
 800a126:	e7e3      	b.n	800a0f0 <__multiply+0x42>
 800a128:	f8b2 b000 	ldrh.w	fp, [r2]
 800a12c:	f1bb 0f00 	cmp.w	fp, #0
 800a130:	d023      	beq.n	800a17a <__multiply+0xcc>
 800a132:	4689      	mov	r9, r1
 800a134:	46ac      	mov	ip, r5
 800a136:	f04f 0800 	mov.w	r8, #0
 800a13a:	f859 4b04 	ldr.w	r4, [r9], #4
 800a13e:	f8dc a000 	ldr.w	sl, [ip]
 800a142:	b2a3      	uxth	r3, r4
 800a144:	fa1f fa8a 	uxth.w	sl, sl
 800a148:	fb0b a303 	mla	r3, fp, r3, sl
 800a14c:	ea4f 4a14 	mov.w	sl, r4, lsr #16
 800a150:	f8dc 4000 	ldr.w	r4, [ip]
 800a154:	4443      	add	r3, r8
 800a156:	ea4f 4814 	mov.w	r8, r4, lsr #16
 800a15a:	fb0b 840a 	mla	r4, fp, sl, r8
 800a15e:	eb04 4413 	add.w	r4, r4, r3, lsr #16
 800a162:	46e2      	mov	sl, ip
 800a164:	b29b      	uxth	r3, r3
 800a166:	ea43 4304 	orr.w	r3, r3, r4, lsl #16
 800a16a:	454f      	cmp	r7, r9
 800a16c:	ea4f 4814 	mov.w	r8, r4, lsr #16
 800a170:	f84a 3b04 	str.w	r3, [sl], #4
 800a174:	d82b      	bhi.n	800a1ce <__multiply+0x120>
 800a176:	f8cc 8004 	str.w	r8, [ip, #4]
 800a17a:	9b01      	ldr	r3, [sp, #4]
 800a17c:	f8b3 a002 	ldrh.w	sl, [r3, #2]
 800a180:	3204      	adds	r2, #4
 800a182:	f1ba 0f00 	cmp.w	sl, #0
 800a186:	d020      	beq.n	800a1ca <__multiply+0x11c>
 800a188:	682b      	ldr	r3, [r5, #0]
 800a18a:	4689      	mov	r9, r1
 800a18c:	46a8      	mov	r8, r5
 800a18e:	f04f 0b00 	mov.w	fp, #0
 800a192:	f8b9 c000 	ldrh.w	ip, [r9]
 800a196:	f8b8 4002 	ldrh.w	r4, [r8, #2]
 800a19a:	fb0a 440c 	mla	r4, sl, ip, r4
 800a19e:	445c      	add	r4, fp
 800a1a0:	46c4      	mov	ip, r8
 800a1a2:	b29b      	uxth	r3, r3
 800a1a4:	ea43 4304 	orr.w	r3, r3, r4, lsl #16
 800a1a8:	f84c 3b04 	str.w	r3, [ip], #4
 800a1ac:	f859 3b04 	ldr.w	r3, [r9], #4
 800a1b0:	f8b8 b004 	ldrh.w	fp, [r8, #4]
 800a1b4:	0c1b      	lsrs	r3, r3, #16
 800a1b6:	fb0a b303 	mla	r3, sl, r3, fp
 800a1ba:	eb03 4314 	add.w	r3, r3, r4, lsr #16
 800a1be:	454f      	cmp	r7, r9
 800a1c0:	ea4f 4b13 	mov.w	fp, r3, lsr #16
 800a1c4:	d805      	bhi.n	800a1d2 <__multiply+0x124>
 800a1c6:	f8c8 3004 	str.w	r3, [r8, #4]
 800a1ca:	3504      	adds	r5, #4
 800a1cc:	e79b      	b.n	800a106 <__multiply+0x58>
 800a1ce:	46d4      	mov	ip, sl
 800a1d0:	e7b3      	b.n	800a13a <__multiply+0x8c>
 800a1d2:	46e0      	mov	r8, ip
 800a1d4:	e7dd      	b.n	800a192 <__multiply+0xe4>
 800a1d6:	3e01      	subs	r6, #1
 800a1d8:	e799      	b.n	800a10e <__multiply+0x60>
	...

0800a1dc <__pow5mult>:
 800a1dc:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
 800a1e0:	4615      	mov	r5, r2
 800a1e2:	f012 0203 	ands.w	r2, r2, #3
 800a1e6:	4606      	mov	r6, r0
 800a1e8:	460f      	mov	r7, r1
 800a1ea:	d007      	beq.n	800a1fc <__pow5mult+0x20>
 800a1ec:	3a01      	subs	r2, #1
 800a1ee:	4c21      	ldr	r4, [pc, #132]	; (800a274 <__pow5mult+0x98>)
 800a1f0:	2300      	movs	r3, #0
 800a1f2:	f854 2022 	ldr.w	r2, [r4, r2, lsl #2]
 800a1f6:	f7ff fec8 	bl	8009f8a <__multadd>
 800a1fa:	4607      	mov	r7, r0
 800a1fc:	10ad      	asrs	r5, r5, #2
 800a1fe:	d035      	beq.n	800a26c <__pow5mult+0x90>
 800a200:	6a74      	ldr	r4, [r6, #36]	; 0x24
 800a202:	b93c      	cbnz	r4, 800a214 <__pow5mult+0x38>
 800a204:	2010      	movs	r0, #16
 800a206:	f7fe fc55 	bl	8008ab4 <malloc>
 800a20a:	6270      	str	r0, [r6, #36]	; 0x24
 800a20c:	e9c0 4401 	strd	r4, r4, [r0, #4]
 800a210:	6004      	str	r4, [r0, #0]
 800a212:	60c4      	str	r4, [r0, #12]
 800a214:	f8d6 8024 	ldr.w	r8, [r6, #36]	; 0x24
 800a218:	f8d8 4008 	ldr.w	r4, [r8, #8]
 800a21c:	b94c      	cbnz	r4, 800a232 <__pow5mult+0x56>
 800a21e:	f240 2171 	movw	r1, #625	; 0x271
 800a222:	4630      	mov	r0, r6
 800a224:	f7ff ff3a 	bl	800a09c <__i2b>
 800a228:	2300      	movs	r3, #0
 800a22a:	f8c8 0008 	str.w	r0, [r8, #8]
 800a22e:	4604      	mov	r4, r0
 800a230:	6003      	str	r3, [r0, #0]
 800a232:	f04f 0800 	mov.w	r8, #0
 800a236:	07eb      	lsls	r3, r5, #31
 800a238:	d50a      	bpl.n	800a250 <__pow5mult+0x74>
 800a23a:	4639      	mov	r1, r7
 800a23c:	4622      	mov	r2, r4
 800a23e:	4630      	mov	r0, r6
 800a240:	f7ff ff35 	bl	800a0ae <__multiply>
 800a244:	4639      	mov	r1, r7
 800a246:	4681      	mov	r9, r0
 800a248:	4630      	mov	r0, r6
 800a24a:	f7ff fe87 	bl	8009f5c <_Bfree>
 800a24e:	464f      	mov	r7, r9
 800a250:	106d      	asrs	r5, r5, #1
 800a252:	d00b      	beq.n	800a26c <__pow5mult+0x90>
 800a254:	6820      	ldr	r0, [r4, #0]
 800a256:	b938      	cbnz	r0, 800a268 <__pow5mult+0x8c>
 800a258:	4622      	mov	r2, r4
 800a25a:	4621      	mov	r1, r4
 800a25c:	4630      	mov	r0, r6
 800a25e:	f7ff ff26 	bl	800a0ae <__multiply>
 800a262:	6020      	str	r0, [r4, #0]
 800a264:	f8c0 8000 	str.w	r8, [r0]
 800a268:	4604      	mov	r4, r0
 800a26a:	e7e4      	b.n	800a236 <__pow5mult+0x5a>
 800a26c:	4638      	mov	r0, r7
 800a26e:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
 800a272:	bf00      	nop
 800a274:	0800b698 	.word	0x0800b698

0800a278 <__lshift>:
 800a278:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
 800a27c:	460c      	mov	r4, r1
 800a27e:	ea4f 1a62 	mov.w	sl, r2, asr #5
 800a282:	6923      	ldr	r3, [r4, #16]
 800a284:	6849      	ldr	r1, [r1, #4]
 800a286:	eb0a 0903 	add.w	r9, sl, r3
 800a28a:	68a3      	ldr	r3, [r4, #8]
 800a28c:	4607      	mov	r7, r0
 800a28e:	4616      	mov	r6, r2
 800a290:	f109 0501 	add.w	r5, r9, #1
 800a294:	42ab      	cmp	r3, r5
 800a296:	db32      	blt.n	800a2fe <__lshift+0x86>
 800a298:	4638      	mov	r0, r7
 800a29a:	f7ff fe2b 	bl	8009ef4 <_Balloc>
 800a29e:	2300      	movs	r3, #0
 800a2a0:	4680      	mov	r8, r0
 800a2a2:	f100 0114 	add.w	r1, r0, #20
 800a2a6:	461a      	mov	r2, r3
 800a2a8:	4553      	cmp	r3, sl
 800a2aa:	db2b      	blt.n	800a304 <__lshift+0x8c>
 800a2ac:	6920      	ldr	r0, [r4, #16]
 800a2ae:	ea2a 7aea 	bic.w	sl, sl, sl, asr #31
 800a2b2:	f104 0314 	add.w	r3, r4, #20
 800a2b6:	f016 021f 	ands.w	r2, r6, #31
 800a2ba:	eb01 018a 	add.w	r1, r1, sl, lsl #2
 800a2be:	eb03 0c80 	add.w	ip, r3, r0, lsl #2
 800a2c2:	d025      	beq.n	800a310 <__lshift+0x98>
 800a2c4:	f1c2 0e20 	rsb	lr, r2, #32
 800a2c8:	2000      	movs	r0, #0
 800a2ca:	681e      	ldr	r6, [r3, #0]
 800a2cc:	468a      	mov	sl, r1
 800a2ce:	4096      	lsls	r6, r2
 800a2d0:	4330      	orrs	r0, r6
 800a2d2:	f84a 0b04 	str.w	r0, [sl], #4
 800a2d6:	f853 0b04 	ldr.w	r0, [r3], #4
 800a2da:	459c      	cmp	ip, r3
 800a2dc:	fa20 f00e 	lsr.w	r0, r0, lr
 800a2e0:	d814      	bhi.n	800a30c <__lshift+0x94>
 800a2e2:	6048      	str	r0, [r1, #4]
 800a2e4:	b108      	cbz	r0, 800a2ea <__lshift+0x72>
 800a2e6:	f109 0502 	add.w	r5, r9, #2
 800a2ea:	3d01      	subs	r5, #1
 800a2ec:	4638      	mov	r0, r7
 800a2ee:	f8c8 5010 	str.w	r5, [r8, #16]
 800a2f2:	4621      	mov	r1, r4
 800a2f4:	f7ff fe32 	bl	8009f5c <_Bfree>
 800a2f8:	4640      	mov	r0, r8
 800a2fa:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 800a2fe:	3101      	adds	r1, #1
 800a300:	005b      	lsls	r3, r3, #1
 800a302:	e7c7      	b.n	800a294 <__lshift+0x1c>
 800a304:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
 800a308:	3301      	adds	r3, #1
 800a30a:	e7cd      	b.n	800a2a8 <__lshift+0x30>
 800a30c:	4651      	mov	r1, sl
 800a30e:	e7dc      	b.n	800a2ca <__lshift+0x52>
 800a310:	3904      	subs	r1, #4
 800a312:	f853 2b04 	ldr.w	r2, [r3], #4
 800a316:	f841 2f04 	str.w	r2, [r1, #4]!
 800a31a:	459c      	cmp	ip, r3
 800a31c:	d8f9      	bhi.n	800a312 <__lshift+0x9a>
 800a31e:	e7e4      	b.n	800a2ea <__lshift+0x72>

0800a320 <__mcmp>:
 800a320:	6903      	ldr	r3, [r0, #16]
 800a322:	690a      	ldr	r2, [r1, #16]
 800a324:	1a9b      	subs	r3, r3, r2
 800a326:	b530      	push	{r4, r5, lr}
 800a328:	d10c      	bne.n	800a344 <__mcmp+0x24>
 800a32a:	0092      	lsls	r2, r2, #2
 800a32c:	3014      	adds	r0, #20
 800a32e:	3114      	adds	r1, #20
 800a330:	1884      	adds	r4, r0, r2
 800a332:	4411      	add	r1, r2
 800a334:	f854 5d04 	ldr.w	r5, [r4, #-4]!
 800a338:	f851 2d04 	ldr.w	r2, [r1, #-4]!
 800a33c:	4295      	cmp	r5, r2
 800a33e:	d003      	beq.n	800a348 <__mcmp+0x28>
 800a340:	d305      	bcc.n	800a34e <__mcmp+0x2e>
 800a342:	2301      	movs	r3, #1
 800a344:	4618      	mov	r0, r3
 800a346:	bd30      	pop	{r4, r5, pc}
 800a348:	42a0      	cmp	r0, r4
 800a34a:	d3f3      	bcc.n	800a334 <__mcmp+0x14>
 800a34c:	e7fa      	b.n	800a344 <__mcmp+0x24>
 800a34e:	f04f 33ff 	mov.w	r3, #4294967295	; 0xffffffff
 800a352:	e7f7      	b.n	800a344 <__mcmp+0x24>

0800a354 <__mdiff>:
 800a354:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
 800a358:	460d      	mov	r5, r1
 800a35a:	4607      	mov	r7, r0
 800a35c:	4611      	mov	r1, r2
 800a35e:	4628      	mov	r0, r5
 800a360:	4614      	mov	r4, r2
 800a362:	f7ff ffdd 	bl	800a320 <__mcmp>
 800a366:	1e06      	subs	r6, r0, #0
 800a368:	d108      	bne.n	800a37c <__mdiff+0x28>
 800a36a:	4631      	mov	r1, r6
 800a36c:	4638      	mov	r0, r7
 800a36e:	f7ff fdc1 	bl	8009ef4 <_Balloc>
 800a372:	2301      	movs	r3, #1
 800a374:	e9c0 3604 	strd	r3, r6, [r0, #16]
 800a378:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 800a37c:	bfa4      	itt	ge
 800a37e:	4623      	movge	r3, r4
 800a380:	462c      	movge	r4, r5
 800a382:	4638      	mov	r0, r7
 800a384:	6861      	ldr	r1, [r4, #4]
 800a386:	bfa6      	itte	ge
 800a388:	461d      	movge	r5, r3
 800a38a:	2600      	movge	r6, #0
 800a38c:	2601      	movlt	r6, #1
 800a38e:	f7ff fdb1 	bl	8009ef4 <_Balloc>
 800a392:	692b      	ldr	r3, [r5, #16]
 800a394:	60c6      	str	r6, [r0, #12]
 800a396:	6926      	ldr	r6, [r4, #16]
 800a398:	f105 0914 	add.w	r9, r5, #20
 800a39c:	f104 0214 	add.w	r2, r4, #20
 800a3a0:	eb02 0786 	add.w	r7, r2, r6, lsl #2
 800a3a4:	eb09 0883 	add.w	r8, r9, r3, lsl #2
 800a3a8:	f100 0514 	add.w	r5, r0, #20
 800a3ac:	f04f 0e00 	mov.w	lr, #0
 800a3b0:	f852 ab04 	ldr.w	sl, [r2], #4
 800a3b4:	f859 4b04 	ldr.w	r4, [r9], #4
 800a3b8:	fa1e f18a 	uxtah	r1, lr, sl
 800a3bc:	b2a3      	uxth	r3, r4
 800a3be:	1ac9      	subs	r1, r1, r3
 800a3c0:	0c23      	lsrs	r3, r4, #16
 800a3c2:	ebc3 431a 	rsb	r3, r3, sl, lsr #16
 800a3c6:	eb03 4321 	add.w	r3, r3, r1, asr #16
 800a3ca:	b289      	uxth	r1, r1
 800a3cc:	ea4f 4e23 	mov.w	lr, r3, asr #16
 800a3d0:	45c8      	cmp	r8, r9
 800a3d2:	ea41 4303 	orr.w	r3, r1, r3, lsl #16
 800a3d6:	4694      	mov	ip, r2
 800a3d8:	f845 3b04 	str.w	r3, [r5], #4
 800a3dc:	d8e8      	bhi.n	800a3b0 <__mdiff+0x5c>
 800a3de:	45bc      	cmp	ip, r7
 800a3e0:	d304      	bcc.n	800a3ec <__mdiff+0x98>
 800a3e2:	f855 3d04 	ldr.w	r3, [r5, #-4]!
 800a3e6:	b183      	cbz	r3, 800a40a <__mdiff+0xb6>
 800a3e8:	6106      	str	r6, [r0, #16]
 800a3ea:	e7c5      	b.n	800a378 <__mdiff+0x24>
 800a3ec:	f85c 1b04 	ldr.w	r1, [ip], #4
 800a3f0:	fa1e f381 	uxtah	r3, lr, r1
 800a3f4:	141a      	asrs	r2, r3, #16
 800a3f6:	eb02 4211 	add.w	r2, r2, r1, lsr #16
 800a3fa:	b29b      	uxth	r3, r3
 800a3fc:	ea43 4302 	orr.w	r3, r3, r2, lsl #16
 800a400:	ea4f 4e22 	mov.w	lr, r2, asr #16
 800a404:	f845 3b04 	str.w	r3, [r5], #4
 800a408:	e7e9      	b.n	800a3de <__mdiff+0x8a>
 800a40a:	3e01      	subs	r6, #1
 800a40c:	e7e9      	b.n	800a3e2 <__mdiff+0x8e>

0800a40e <__d2b>:
 800a40e:	e92d 43f7 	stmdb	sp!, {r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
 800a412:	460e      	mov	r6, r1
 800a414:	2101      	movs	r1, #1
 800a416:	ec59 8b10 	vmov	r8, r9, d0
 800a41a:	4615      	mov	r5, r2
 800a41c:	f7ff fd6a 	bl	8009ef4 <_Balloc>
 800a420:	f3c9 540a 	ubfx	r4, r9, #20, #11
 800a424:	4607      	mov	r7, r0
 800a426:	f3c9 0313 	ubfx	r3, r9, #0, #20
 800a42a:	bb34      	cbnz	r4, 800a47a <__d2b+0x6c>
 800a42c:	9301      	str	r3, [sp, #4]
 800a42e:	f1b8 0300 	subs.w	r3, r8, #0
 800a432:	d027      	beq.n	800a484 <__d2b+0x76>
 800a434:	a802      	add	r0, sp, #8
 800a436:	f840 3d08 	str.w	r3, [r0, #-8]!
 800a43a:	f7ff fe00 	bl	800a03e <__lo0bits>
 800a43e:	9900      	ldr	r1, [sp, #0]
 800a440:	b1f0      	cbz	r0, 800a480 <__d2b+0x72>
 800a442:	9a01      	ldr	r2, [sp, #4]
 800a444:	f1c0 0320 	rsb	r3, r0, #32
 800a448:	fa02 f303 	lsl.w	r3, r2, r3
 800a44c:	430b      	orrs	r3, r1
 800a44e:	40c2      	lsrs	r2, r0
 800a450:	617b      	str	r3, [r7, #20]
 800a452:	9201      	str	r2, [sp, #4]
 800a454:	9b01      	ldr	r3, [sp, #4]
 800a456:	61bb      	str	r3, [r7, #24]
 800a458:	2b00      	cmp	r3, #0
 800a45a:	bf14      	ite	ne
 800a45c:	2102      	movne	r1, #2
 800a45e:	2101      	moveq	r1, #1
 800a460:	6139      	str	r1, [r7, #16]
 800a462:	b1c4      	cbz	r4, 800a496 <__d2b+0x88>
 800a464:	f2a4 4433 	subw	r4, r4, #1075	; 0x433
 800a468:	4404      	add	r4, r0
 800a46a:	6034      	str	r4, [r6, #0]
 800a46c:	f1c0 0035 	rsb	r0, r0, #53	; 0x35
 800a470:	6028      	str	r0, [r5, #0]
 800a472:	4638      	mov	r0, r7
 800a474:	b003      	add	sp, #12
 800a476:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 800a47a:	f443 1380 	orr.w	r3, r3, #1048576	; 0x100000
 800a47e:	e7d5      	b.n	800a42c <__d2b+0x1e>
 800a480:	6179      	str	r1, [r7, #20]
 800a482:	e7e7      	b.n	800a454 <__d2b+0x46>
 800a484:	a801      	add	r0, sp, #4
 800a486:	f7ff fdda 	bl	800a03e <__lo0bits>
 800a48a:	9b01      	ldr	r3, [sp, #4]
 800a48c:	617b      	str	r3, [r7, #20]
 800a48e:	2101      	movs	r1, #1
 800a490:	6139      	str	r1, [r7, #16]
 800a492:	3020      	adds	r0, #32
 800a494:	e7e5      	b.n	800a462 <__d2b+0x54>
 800a496:	eb07 0381 	add.w	r3, r7, r1, lsl #2
 800a49a:	f2a0 4032 	subw	r0, r0, #1074	; 0x432
 800a49e:	6030      	str	r0, [r6, #0]
 800a4a0:	6918      	ldr	r0, [r3, #16]
 800a4a2:	f7ff fdad 	bl	800a000 <__hi0bits>
 800a4a6:	ebc0 1041 	rsb	r0, r0, r1, lsl #5
 800a4aa:	e7e1      	b.n	800a470 <__d2b+0x62>

0800a4ac <_calloc_r>:
 800a4ac:	b538      	push	{r3, r4, r5, lr}
 800a4ae:	fb02 f401 	mul.w	r4, r2, r1
 800a4b2:	4621      	mov	r1, r4
 800a4b4:	f7f6 fdec 	bl	8001090 <_malloc_r>
 800a4b8:	4605      	mov	r5, r0
 800a4ba:	b118      	cbz	r0, 800a4c4 <_calloc_r+0x18>
 800a4bc:	4622      	mov	r2, r4
 800a4be:	2100      	movs	r1, #0
 800a4c0:	f7fe fb0b 	bl	8008ada <memset>
 800a4c4:	4628      	mov	r0, r5
 800a4c6:	bd38      	pop	{r3, r4, r5, pc}

0800a4c8 <__ascii_mbtowc>:
 800a4c8:	b082      	sub	sp, #8
 800a4ca:	b901      	cbnz	r1, 800a4ce <__ascii_mbtowc+0x6>
 800a4cc:	a901      	add	r1, sp, #4
 800a4ce:	b142      	cbz	r2, 800a4e2 <__ascii_mbtowc+0x1a>
 800a4d0:	b14b      	cbz	r3, 800a4e6 <__ascii_mbtowc+0x1e>
 800a4d2:	7813      	ldrb	r3, [r2, #0]
 800a4d4:	600b      	str	r3, [r1, #0]
 800a4d6:	7812      	ldrb	r2, [r2, #0]
 800a4d8:	1c10      	adds	r0, r2, #0
 800a4da:	bf18      	it	ne
 800a4dc:	2001      	movne	r0, #1
 800a4de:	b002      	add	sp, #8
 800a4e0:	4770      	bx	lr
 800a4e2:	4610      	mov	r0, r2
 800a4e4:	e7fb      	b.n	800a4de <__ascii_mbtowc+0x16>
 800a4e6:	f06f 0001 	mvn.w	r0, #1
 800a4ea:	e7f8      	b.n	800a4de <__ascii_mbtowc+0x16>

0800a4ec <__ascii_wctomb>:
 800a4ec:	b149      	cbz	r1, 800a502 <__ascii_wctomb+0x16>
 800a4ee:	2aff      	cmp	r2, #255	; 0xff
 800a4f0:	bf85      	ittet	hi
 800a4f2:	238a      	movhi	r3, #138	; 0x8a
 800a4f4:	6003      	strhi	r3, [r0, #0]
 800a4f6:	700a      	strbls	r2, [r1, #0]
 800a4f8:	f04f 30ff 	movhi.w	r0, #4294967295	; 0xffffffff
 800a4fc:	bf98      	it	ls
 800a4fe:	2001      	movls	r0, #1
 800a500:	4770      	bx	lr
 800a502:	4608      	mov	r0, r1
 800a504:	4770      	bx	lr
	...

0800a508 <cosf>:
 800a508:	b500      	push	{lr}
 800a50a:	ee10 3a10 	vmov	r3, s0
 800a50e:	4a20      	ldr	r2, [pc, #128]	; (800a590 <cosf+0x88>)
 800a510:	f023 4300 	bic.w	r3, r3, #2147483648	; 0x80000000
 800a514:	4293      	cmp	r3, r2
 800a516:	b083      	sub	sp, #12
 800a518:	dd19      	ble.n	800a54e <cosf+0x46>
 800a51a:	f1b3 4fff 	cmp.w	r3, #2139095040	; 0x7f800000
 800a51e:	db04      	blt.n	800a52a <cosf+0x22>
 800a520:	ee30 0a40 	vsub.f32	s0, s0, s0
 800a524:	b003      	add	sp, #12
 800a526:	f85d fb04 	ldr.w	pc, [sp], #4
 800a52a:	4668      	mov	r0, sp
 800a52c:	f000 f87e 	bl	800a62c <__ieee754_rem_pio2f>
 800a530:	f000 0003 	and.w	r0, r0, #3
 800a534:	2801      	cmp	r0, #1
 800a536:	d011      	beq.n	800a55c <cosf+0x54>
 800a538:	2802      	cmp	r0, #2
 800a53a:	d01f      	beq.n	800a57c <cosf+0x74>
 800a53c:	b1b8      	cbz	r0, 800a56e <cosf+0x66>
 800a53e:	2001      	movs	r0, #1
 800a540:	eddd 0a01 	vldr	s1, [sp, #4]
 800a544:	ed9d 0a00 	vldr	s0, [sp]
 800a548:	f000 fd66 	bl	800b018 <__kernel_sinf>
 800a54c:	e7ea      	b.n	800a524 <cosf+0x1c>
 800a54e:	eddf 0a11 	vldr	s1, [pc, #68]	; 800a594 <cosf+0x8c>
 800a552:	f000 f9b7 	bl	800a8c4 <__kernel_cosf>
 800a556:	b003      	add	sp, #12
 800a558:	f85d fb04 	ldr.w	pc, [sp], #4
 800a55c:	eddd 0a01 	vldr	s1, [sp, #4]
 800a560:	ed9d 0a00 	vldr	s0, [sp]
 800a564:	f000 fd58 	bl	800b018 <__kernel_sinf>
 800a568:	eeb1 0a40 	vneg.f32	s0, s0
 800a56c:	e7da      	b.n	800a524 <cosf+0x1c>
 800a56e:	eddd 0a01 	vldr	s1, [sp, #4]
 800a572:	ed9d 0a00 	vldr	s0, [sp]
 800a576:	f000 f9a5 	bl	800a8c4 <__kernel_cosf>
 800a57a:	e7d3      	b.n	800a524 <cosf+0x1c>
 800a57c:	eddd 0a01 	vldr	s1, [sp, #4]
 800a580:	ed9d 0a00 	vldr	s0, [sp]
 800a584:	f000 f99e 	bl	800a8c4 <__kernel_cosf>
 800a588:	eeb1 0a40 	vneg.f32	s0, s0
 800a58c:	e7ca      	b.n	800a524 <cosf+0x1c>
 800a58e:	bf00      	nop
 800a590:	3f490fd8 	.word	0x3f490fd8
 800a594:	00000000 	.word	0x00000000

0800a598 <sinf>:
 800a598:	b500      	push	{lr}
 800a59a:	ee10 3a10 	vmov	r3, s0
 800a59e:	4a21      	ldr	r2, [pc, #132]	; (800a624 <sinf+0x8c>)
 800a5a0:	f023 4300 	bic.w	r3, r3, #2147483648	; 0x80000000
 800a5a4:	4293      	cmp	r3, r2
 800a5a6:	b083      	sub	sp, #12
 800a5a8:	dd1a      	ble.n	800a5e0 <sinf+0x48>
 800a5aa:	f1b3 4fff 	cmp.w	r3, #2139095040	; 0x7f800000
 800a5ae:	db04      	blt.n	800a5ba <sinf+0x22>
 800a5b0:	ee30 0a40 	vsub.f32	s0, s0, s0
 800a5b4:	b003      	add	sp, #12
 800a5b6:	f85d fb04 	ldr.w	pc, [sp], #4
 800a5ba:	4668      	mov	r0, sp
 800a5bc:	f000 f836 	bl	800a62c <__ieee754_rem_pio2f>
 800a5c0:	f000 0003 	and.w	r0, r0, #3
 800a5c4:	2801      	cmp	r0, #1
 800a5c6:	d013      	beq.n	800a5f0 <sinf+0x58>
 800a5c8:	2802      	cmp	r0, #2
 800a5ca:	d020      	beq.n	800a60e <sinf+0x76>
 800a5cc:	b1b8      	cbz	r0, 800a5fe <sinf+0x66>
 800a5ce:	eddd 0a01 	vldr	s1, [sp, #4]
 800a5d2:	ed9d 0a00 	vldr	s0, [sp]
 800a5d6:	f000 f975 	bl	800a8c4 <__kernel_cosf>
 800a5da:	eeb1 0a40 	vneg.f32	s0, s0
 800a5de:	e7e9      	b.n	800a5b4 <sinf+0x1c>
 800a5e0:	2000      	movs	r0, #0
 800a5e2:	eddf 0a11 	vldr	s1, [pc, #68]	; 800a628 <sinf+0x90>
 800a5e6:	f000 fd17 	bl	800b018 <__kernel_sinf>
 800a5ea:	b003      	add	sp, #12
 800a5ec:	f85d fb04 	ldr.w	pc, [sp], #4
 800a5f0:	eddd 0a01 	vldr	s1, [sp, #4]
 800a5f4:	ed9d 0a00 	vldr	s0, [sp]
 800a5f8:	f000 f964 	bl	800a8c4 <__kernel_cosf>
 800a5fc:	e7da      	b.n	800a5b4 <sinf+0x1c>
 800a5fe:	2001      	movs	r0, #1
 800a600:	eddd 0a01 	vldr	s1, [sp, #4]
 800a604:	ed9d 0a00 	vldr	s0, [sp]
 800a608:	f000 fd06 	bl	800b018 <__kernel_sinf>
 800a60c:	e7d2      	b.n	800a5b4 <sinf+0x1c>
 800a60e:	2001      	movs	r0, #1
 800a610:	eddd 0a01 	vldr	s1, [sp, #4]
 800a614:	ed9d 0a00 	vldr	s0, [sp]
 800a618:	f000 fcfe 	bl	800b018 <__kernel_sinf>
 800a61c:	eeb1 0a40 	vneg.f32	s0, s0
 800a620:	e7c8      	b.n	800a5b4 <sinf+0x1c>
 800a622:	bf00      	nop
 800a624:	3f490fd8 	.word	0x3f490fd8
 800a628:	00000000 	.word	0x00000000

0800a62c <__ieee754_rem_pio2f>:
 800a62c:	b570      	push	{r4, r5, r6, lr}
 800a62e:	ee10 3a10 	vmov	r3, s0
 800a632:	4a96      	ldr	r2, [pc, #600]	; (800a88c <__ieee754_rem_pio2f+0x260>)
 800a634:	f023 4400 	bic.w	r4, r3, #2147483648	; 0x80000000
 800a638:	4294      	cmp	r4, r2
 800a63a:	b086      	sub	sp, #24
 800a63c:	4605      	mov	r5, r0
 800a63e:	dd69      	ble.n	800a714 <__ieee754_rem_pio2f+0xe8>
 800a640:	4a93      	ldr	r2, [pc, #588]	; (800a890 <__ieee754_rem_pio2f+0x264>)
 800a642:	4294      	cmp	r4, r2
 800a644:	ee10 6a10 	vmov	r6, s0
 800a648:	dc1a      	bgt.n	800a680 <__ieee754_rem_pio2f+0x54>
 800a64a:	2b00      	cmp	r3, #0
 800a64c:	f024 040f 	bic.w	r4, r4, #15
 800a650:	eddf 7a90 	vldr	s15, [pc, #576]	; 800a894 <__ieee754_rem_pio2f+0x268>
 800a654:	4a90      	ldr	r2, [pc, #576]	; (800a898 <__ieee754_rem_pio2f+0x26c>)
 800a656:	dd64      	ble.n	800a722 <__ieee754_rem_pio2f+0xf6>
 800a658:	4294      	cmp	r4, r2
 800a65a:	ee70 7a67 	vsub.f32	s15, s0, s15
 800a65e:	f000 80cf 	beq.w	800a800 <__ieee754_rem_pio2f+0x1d4>
 800a662:	ed9f 7a8e 	vldr	s14, [pc, #568]	; 800a89c <__ieee754_rem_pio2f+0x270>
 800a666:	ee77 6ac7 	vsub.f32	s13, s15, s14
 800a66a:	2001      	movs	r0, #1
 800a66c:	ee77 7ae6 	vsub.f32	s15, s15, s13
 800a670:	edc5 6a00 	vstr	s13, [r5]
 800a674:	ee77 7ac7 	vsub.f32	s15, s15, s14
 800a678:	edc5 7a01 	vstr	s15, [r5, #4]
 800a67c:	b006      	add	sp, #24
 800a67e:	bd70      	pop	{r4, r5, r6, pc}
 800a680:	4a87      	ldr	r2, [pc, #540]	; (800a8a0 <__ieee754_rem_pio2f+0x274>)
 800a682:	4294      	cmp	r4, r2
 800a684:	dd61      	ble.n	800a74a <__ieee754_rem_pio2f+0x11e>
 800a686:	f1b4 4fff 	cmp.w	r4, #2139095040	; 0x7f800000
 800a68a:	f280 80b1 	bge.w	800a7f0 <__ieee754_rem_pio2f+0x1c4>
 800a68e:	15e2      	asrs	r2, r4, #23
 800a690:	3a86      	subs	r2, #134	; 0x86
 800a692:	eba4 53c2 	sub.w	r3, r4, r2, lsl #23
 800a696:	ee07 3a90 	vmov	s15, r3
 800a69a:	eebd 7ae7 	vcvt.s32.f32	s14, s15
 800a69e:	eddf 6a81 	vldr	s13, [pc, #516]	; 800a8a4 <__ieee754_rem_pio2f+0x278>
 800a6a2:	eeb8 7ac7 	vcvt.f32.s32	s14, s14
 800a6a6:	ee77 7ac7 	vsub.f32	s15, s15, s14
 800a6aa:	ed8d 7a03 	vstr	s14, [sp, #12]
 800a6ae:	ee67 7aa6 	vmul.f32	s15, s15, s13
 800a6b2:	eebd 7ae7 	vcvt.s32.f32	s14, s15
 800a6b6:	eeb8 7ac7 	vcvt.f32.s32	s14, s14
 800a6ba:	ee77 7ac7 	vsub.f32	s15, s15, s14
 800a6be:	ed8d 7a04 	vstr	s14, [sp, #16]
 800a6c2:	ee67 7aa6 	vmul.f32	s15, s15, s13
 800a6c6:	eef5 7a40 	vcmp.f32	s15, #0.0
 800a6ca:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 800a6ce:	edcd 7a05 	vstr	s15, [sp, #20]
 800a6d2:	f040 80c7 	bne.w	800a864 <__ieee754_rem_pio2f+0x238>
 800a6d6:	eeb5 7a40 	vcmp.f32	s14, #0.0
 800a6da:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 800a6de:	bf0c      	ite	eq
 800a6e0:	2301      	moveq	r3, #1
 800a6e2:	2302      	movne	r3, #2
 800a6e4:	4970      	ldr	r1, [pc, #448]	; (800a8a8 <__ieee754_rem_pio2f+0x27c>)
 800a6e6:	9101      	str	r1, [sp, #4]
 800a6e8:	2102      	movs	r1, #2
 800a6ea:	9100      	str	r1, [sp, #0]
 800a6ec:	a803      	add	r0, sp, #12
 800a6ee:	4629      	mov	r1, r5
 800a6f0:	f000 f96a 	bl	800a9c8 <__kernel_rem_pio2f>
 800a6f4:	2e00      	cmp	r6, #0
 800a6f6:	da12      	bge.n	800a71e <__ieee754_rem_pio2f+0xf2>
 800a6f8:	ed95 7a00 	vldr	s14, [r5]
 800a6fc:	edd5 7a01 	vldr	s15, [r5, #4]
 800a700:	eeb1 7a47 	vneg.f32	s14, s14
 800a704:	eef1 7a67 	vneg.f32	s15, s15
 800a708:	4240      	negs	r0, r0
 800a70a:	ed85 7a00 	vstr	s14, [r5]
 800a70e:	edc5 7a01 	vstr	s15, [r5, #4]
 800a712:	e004      	b.n	800a71e <__ieee754_rem_pio2f+0xf2>
 800a714:	2200      	movs	r2, #0
 800a716:	ed85 0a00 	vstr	s0, [r5]
 800a71a:	6042      	str	r2, [r0, #4]
 800a71c:	2000      	movs	r0, #0
 800a71e:	b006      	add	sp, #24
 800a720:	bd70      	pop	{r4, r5, r6, pc}
 800a722:	4294      	cmp	r4, r2
 800a724:	ee70 7a27 	vadd.f32	s15, s0, s15
 800a728:	f000 8089 	beq.w	800a83e <__ieee754_rem_pio2f+0x212>
 800a72c:	ed9f 7a5b 	vldr	s14, [pc, #364]	; 800a89c <__ieee754_rem_pio2f+0x270>
 800a730:	ee77 6a87 	vadd.f32	s13, s15, s14
 800a734:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 800a738:	ee77 7ae6 	vsub.f32	s15, s15, s13
 800a73c:	edc5 6a00 	vstr	s13, [r5]
 800a740:	ee77 7a87 	vadd.f32	s15, s15, s14
 800a744:	edc5 7a01 	vstr	s15, [r5, #4]
 800a748:	e7e9      	b.n	800a71e <__ieee754_rem_pio2f+0xf2>
 800a74a:	f000 fcad 	bl	800b0a8 <fabsf>
 800a74e:	eddf 6a57 	vldr	s13, [pc, #348]	; 800a8ac <__ieee754_rem_pio2f+0x280>
 800a752:	eddf 5a50 	vldr	s11, [pc, #320]	; 800a894 <__ieee754_rem_pio2f+0x268>
 800a756:	ed9f 7a51 	vldr	s14, [pc, #324]	; 800a89c <__ieee754_rem_pio2f+0x270>
 800a75a:	eef6 7a00 	vmov.f32	s15, #96	; 0x3f000000  0.5
 800a75e:	eee0 7a26 	vfma.f32	s15, s0, s13
 800a762:	eefd 7ae7 	vcvt.s32.f32	s15, s15
 800a766:	ee17 0a90 	vmov	r0, s15
 800a76a:	eef8 6ae7 	vcvt.f32.s32	s13, s15
 800a76e:	281f      	cmp	r0, #31
 800a770:	eeb1 6a66 	vneg.f32	s12, s13
 800a774:	eea6 0a25 	vfma.f32	s0, s12, s11
 800a778:	ee66 7a87 	vmul.f32	s15, s13, s14
 800a77c:	dd52      	ble.n	800a824 <__ieee754_rem_pio2f+0x1f8>
 800a77e:	ee30 7a67 	vsub.f32	s14, s0, s15
 800a782:	ee17 3a10 	vmov	r3, s14
 800a786:	15e4      	asrs	r4, r4, #23
 800a788:	f3c3 53c7 	ubfx	r3, r3, #23, #8
 800a78c:	1ae3      	subs	r3, r4, r3
 800a78e:	2b08      	cmp	r3, #8
 800a790:	dd52      	ble.n	800a838 <__ieee754_rem_pio2f+0x20c>
 800a792:	eddf 7a47 	vldr	s15, [pc, #284]	; 800a8b0 <__ieee754_rem_pio2f+0x284>
 800a796:	ed9f 7a47 	vldr	s14, [pc, #284]	; 800a8b4 <__ieee754_rem_pio2f+0x288>
 800a79a:	eef0 5a40 	vmov.f32	s11, s0
 800a79e:	eee6 5a27 	vfma.f32	s11, s12, s15
 800a7a2:	ee30 0a65 	vsub.f32	s0, s0, s11
 800a7a6:	eea6 0a27 	vfma.f32	s0, s12, s15
 800a7aa:	eef0 7a40 	vmov.f32	s15, s0
 800a7ae:	eed6 7a87 	vfnms.f32	s15, s13, s14
 800a7b2:	ee35 7ae7 	vsub.f32	s14, s11, s15
 800a7b6:	ee17 3a10 	vmov	r3, s14
 800a7ba:	f3c3 53c7 	ubfx	r3, r3, #23, #8
 800a7be:	1ae4      	subs	r4, r4, r3
 800a7c0:	2c19      	cmp	r4, #25
 800a7c2:	dc51      	bgt.n	800a868 <__ieee754_rem_pio2f+0x23c>
 800a7c4:	ed85 7a00 	vstr	s14, [r5]
 800a7c8:	eeb0 0a65 	vmov.f32	s0, s11
 800a7cc:	ee30 0a47 	vsub.f32	s0, s0, s14
 800a7d0:	2e00      	cmp	r6, #0
 800a7d2:	ee30 0a67 	vsub.f32	s0, s0, s15
 800a7d6:	ed85 0a01 	vstr	s0, [r5, #4]
 800a7da:	daa0      	bge.n	800a71e <__ieee754_rem_pio2f+0xf2>
 800a7dc:	eeb1 7a47 	vneg.f32	s14, s14
 800a7e0:	eeb1 0a40 	vneg.f32	s0, s0
 800a7e4:	ed85 7a00 	vstr	s14, [r5]
 800a7e8:	ed85 0a01 	vstr	s0, [r5, #4]
 800a7ec:	4240      	negs	r0, r0
 800a7ee:	e796      	b.n	800a71e <__ieee754_rem_pio2f+0xf2>
 800a7f0:	ee70 7a40 	vsub.f32	s15, s0, s0
 800a7f4:	2000      	movs	r0, #0
 800a7f6:	edc5 7a01 	vstr	s15, [r5, #4]
 800a7fa:	edc5 7a00 	vstr	s15, [r5]
 800a7fe:	e78e      	b.n	800a71e <__ieee754_rem_pio2f+0xf2>
 800a800:	eddf 6a2b 	vldr	s13, [pc, #172]	; 800a8b0 <__ieee754_rem_pio2f+0x284>
 800a804:	ed9f 7a2b 	vldr	s14, [pc, #172]	; 800a8b4 <__ieee754_rem_pio2f+0x288>
 800a808:	ee77 7ae6 	vsub.f32	s15, s15, s13
 800a80c:	2001      	movs	r0, #1
 800a80e:	ee77 6ac7 	vsub.f32	s13, s15, s14
 800a812:	ee77 7ae6 	vsub.f32	s15, s15, s13
 800a816:	edc5 6a00 	vstr	s13, [r5]
 800a81a:	ee77 7ac7 	vsub.f32	s15, s15, s14
 800a81e:	edc5 7a01 	vstr	s15, [r5, #4]
 800a822:	e77c      	b.n	800a71e <__ieee754_rem_pio2f+0xf2>
 800a824:	1e42      	subs	r2, r0, #1
 800a826:	4b24      	ldr	r3, [pc, #144]	; (800a8b8 <__ieee754_rem_pio2f+0x28c>)
 800a828:	f853 3022 	ldr.w	r3, [r3, r2, lsl #2]
 800a82c:	f024 02ff 	bic.w	r2, r4, #255	; 0xff
 800a830:	429a      	cmp	r2, r3
 800a832:	ee30 7a67 	vsub.f32	s14, s0, s15
 800a836:	d0a4      	beq.n	800a782 <__ieee754_rem_pio2f+0x156>
 800a838:	ed85 7a00 	vstr	s14, [r5]
 800a83c:	e7c6      	b.n	800a7cc <__ieee754_rem_pio2f+0x1a0>
 800a83e:	eddf 6a1c 	vldr	s13, [pc, #112]	; 800a8b0 <__ieee754_rem_pio2f+0x284>
 800a842:	ed9f 7a1c 	vldr	s14, [pc, #112]	; 800a8b4 <__ieee754_rem_pio2f+0x288>
 800a846:	ee77 7aa6 	vadd.f32	s15, s15, s13
 800a84a:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
 800a84e:	ee77 6a87 	vadd.f32	s13, s15, s14
 800a852:	ee77 7ae6 	vsub.f32	s15, s15, s13
 800a856:	edc5 6a00 	vstr	s13, [r5]
 800a85a:	ee77 7a87 	vadd.f32	s15, s15, s14
 800a85e:	edc5 7a01 	vstr	s15, [r5, #4]
 800a862:	e75c      	b.n	800a71e <__ieee754_rem_pio2f+0xf2>
 800a864:	2303      	movs	r3, #3
 800a866:	e73d      	b.n	800a6e4 <__ieee754_rem_pio2f+0xb8>
 800a868:	ed9f 7a14 	vldr	s14, [pc, #80]	; 800a8bc <__ieee754_rem_pio2f+0x290>
 800a86c:	ed9f 5a14 	vldr	s10, [pc, #80]	; 800a8c0 <__ieee754_rem_pio2f+0x294>
 800a870:	eeb0 0a65 	vmov.f32	s0, s11
 800a874:	eea6 0a07 	vfma.f32	s0, s12, s14
 800a878:	ee75 7ac0 	vsub.f32	s15, s11, s0
 800a87c:	eee6 7a07 	vfma.f32	s15, s12, s14
 800a880:	eed6 7a85 	vfnms.f32	s15, s13, s10
 800a884:	ee30 7a67 	vsub.f32	s14, s0, s15
 800a888:	e7d6      	b.n	800a838 <__ieee754_rem_pio2f+0x20c>
 800a88a:	bf00      	nop
 800a88c:	3f490fd8 	.word	0x3f490fd8
 800a890:	4016cbe3 	.word	0x4016cbe3
 800a894:	3fc90f80 	.word	0x3fc90f80
 800a898:	3fc90fd0 	.word	0x3fc90fd0
 800a89c:	37354443 	.word	0x37354443
 800a8a0:	43490f80 	.word	0x43490f80
 800a8a4:	43800000 	.word	0x43800000
 800a8a8:	0800b830 	.word	0x0800b830
 800a8ac:	3f22f984 	.word	0x3f22f984
 800a8b0:	37354400 	.word	0x37354400
 800a8b4:	2e85a308 	.word	0x2e85a308
 800a8b8:	0800b7b0 	.word	0x0800b7b0
 800a8bc:	2e85a300 	.word	0x2e85a300
 800a8c0:	248d3132 	.word	0x248d3132

0800a8c4 <__kernel_cosf>:
 800a8c4:	ee10 3a10 	vmov	r3, s0
 800a8c8:	f023 4300 	bic.w	r3, r3, #2147483648	; 0x80000000
 800a8cc:	f1b3 5f48 	cmp.w	r3, #838860800	; 0x32000000
 800a8d0:	da2c      	bge.n	800a92c <__kernel_cosf+0x68>
 800a8d2:	eefd 7ac0 	vcvt.s32.f32	s15, s0
 800a8d6:	ee17 3a90 	vmov	r3, s15
 800a8da:	2b00      	cmp	r3, #0
 800a8dc:	d05b      	beq.n	800a996 <__kernel_cosf+0xd2>
 800a8de:	ee20 7a00 	vmul.f32	s14, s0, s0
 800a8e2:	eddf 4a31 	vldr	s9, [pc, #196]	; 800a9a8 <__kernel_cosf+0xe4>
 800a8e6:	ed9f 5a31 	vldr	s10, [pc, #196]	; 800a9ac <__kernel_cosf+0xe8>
 800a8ea:	eddf 5a31 	vldr	s11, [pc, #196]	; 800a9b0 <__kernel_cosf+0xec>
 800a8ee:	ed9f 6a31 	vldr	s12, [pc, #196]	; 800a9b4 <__kernel_cosf+0xf0>
 800a8f2:	eddf 7a31 	vldr	s15, [pc, #196]	; 800a9b8 <__kernel_cosf+0xf4>
 800a8f6:	eddf 6a31 	vldr	s13, [pc, #196]	; 800a9bc <__kernel_cosf+0xf8>
 800a8fa:	eea7 5a24 	vfma.f32	s10, s14, s9
 800a8fe:	eee7 5a05 	vfma.f32	s11, s14, s10
 800a902:	eea7 6a25 	vfma.f32	s12, s14, s11
 800a906:	eee7 7a06 	vfma.f32	s15, s14, s12
 800a90a:	eee7 6a27 	vfma.f32	s13, s14, s15
 800a90e:	ee66 6a87 	vmul.f32	s13, s13, s14
 800a912:	ee60 0ac0 	vnmul.f32	s1, s1, s0
 800a916:	eeb6 6a00 	vmov.f32	s12, #96	; 0x3f000000  0.5
 800a91a:	eee7 0a26 	vfma.f32	s1, s14, s13
 800a91e:	eef7 7a00 	vmov.f32	s15, #112	; 0x3f800000  1.0
 800a922:	eed7 0a06 	vfnms.f32	s1, s14, s12
 800a926:	ee37 0ae0 	vsub.f32	s0, s15, s1
 800a92a:	4770      	bx	lr
 800a92c:	ee20 7a00 	vmul.f32	s14, s0, s0
 800a930:	eddf 4a1d 	vldr	s9, [pc, #116]	; 800a9a8 <__kernel_cosf+0xe4>
 800a934:	ed9f 5a1d 	vldr	s10, [pc, #116]	; 800a9ac <__kernel_cosf+0xe8>
 800a938:	eddf 5a1d 	vldr	s11, [pc, #116]	; 800a9b0 <__kernel_cosf+0xec>
 800a93c:	ed9f 6a1d 	vldr	s12, [pc, #116]	; 800a9b4 <__kernel_cosf+0xf0>
 800a940:	eddf 7a1d 	vldr	s15, [pc, #116]	; 800a9b8 <__kernel_cosf+0xf4>
 800a944:	eddf 6a1d 	vldr	s13, [pc, #116]	; 800a9bc <__kernel_cosf+0xf8>
 800a948:	4a1d      	ldr	r2, [pc, #116]	; (800a9c0 <__kernel_cosf+0xfc>)
 800a94a:	eea7 5a24 	vfma.f32	s10, s14, s9
 800a94e:	4293      	cmp	r3, r2
 800a950:	eee5 5a07 	vfma.f32	s11, s10, s14
 800a954:	eea5 6a87 	vfma.f32	s12, s11, s14
 800a958:	eee6 7a07 	vfma.f32	s15, s12, s14
 800a95c:	eee7 6a87 	vfma.f32	s13, s15, s14
 800a960:	ee66 6a87 	vmul.f32	s13, s13, s14
 800a964:	ddd5      	ble.n	800a912 <__kernel_cosf+0x4e>
 800a966:	4a17      	ldr	r2, [pc, #92]	; (800a9c4 <__kernel_cosf+0x100>)
 800a968:	4293      	cmp	r3, r2
 800a96a:	dc17      	bgt.n	800a99c <__kernel_cosf+0xd8>
 800a96c:	f103 437f 	add.w	r3, r3, #4278190080	; 0xff000000
 800a970:	ee07 3a90 	vmov	s15, r3
 800a974:	eeb7 6a00 	vmov.f32	s12, #112	; 0x3f800000  1.0
 800a978:	ee36 6a67 	vsub.f32	s12, s12, s15
 800a97c:	ee60 0ac0 	vnmul.f32	s1, s1, s0
 800a980:	eef6 5a00 	vmov.f32	s11, #96	; 0x3f000000  0.5
 800a984:	eee7 0a26 	vfma.f32	s1, s14, s13
 800a988:	eed7 7a25 	vfnms.f32	s15, s14, s11
 800a98c:	ee77 7ae0 	vsub.f32	s15, s15, s1
 800a990:	ee36 0a67 	vsub.f32	s0, s12, s15
 800a994:	4770      	bx	lr
 800a996:	eeb7 0a00 	vmov.f32	s0, #112	; 0x3f800000  1.0
 800a99a:	4770      	bx	lr
 800a99c:	eeb6 6a07 	vmov.f32	s12, #103	; 0x3f380000  0.7187500
 800a9a0:	eef5 7a02 	vmov.f32	s15, #82	; 0x3e900000  0.2812500
 800a9a4:	e7ea      	b.n	800a97c <__kernel_cosf+0xb8>
 800a9a6:	bf00      	nop
 800a9a8:	ad47d74e 	.word	0xad47d74e
 800a9ac:	310f74f6 	.word	0x310f74f6
 800a9b0:	b493f27c 	.word	0xb493f27c
 800a9b4:	37d00d01 	.word	0x37d00d01
 800a9b8:	bab60b61 	.word	0xbab60b61
 800a9bc:	3d2aaaab 	.word	0x3d2aaaab
 800a9c0:	3e999999 	.word	0x3e999999
 800a9c4:	3f480000 	.word	0x3f480000

0800a9c8 <__kernel_rem_pio2f>:
 800a9c8:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
 800a9cc:	ed2d 8b04 	vpush	{d8-d9}
 800a9d0:	b0d7      	sub	sp, #348	; 0x15c
 800a9d2:	f103 39ff 	add.w	r9, r3, #4294967295	; 0xffffffff
 800a9d6:	9302      	str	r3, [sp, #8]
 800a9d8:	1ed3      	subs	r3, r2, #3
 800a9da:	bf48      	it	mi
 800a9dc:	1d13      	addmi	r3, r2, #4
 800a9de:	4cb2      	ldr	r4, [pc, #712]	; (800aca8 <__kernel_rem_pio2f+0x2e0>)
 800a9e0:	9d64      	ldr	r5, [sp, #400]	; 0x190
 800a9e2:	9105      	str	r1, [sp, #20]
 800a9e4:	10db      	asrs	r3, r3, #3
 800a9e6:	ea23 73e3 	bic.w	r3, r3, r3, asr #31
 800a9ea:	f854 6025 	ldr.w	r6, [r4, r5, lsl #2]
 800a9ee:	9303      	str	r3, [sp, #12]
 800a9f0:	f103 0801 	add.w	r8, r3, #1
 800a9f4:	eba2 08c8 	sub.w	r8, r2, r8, lsl #3
 800a9f8:	eb16 0209 	adds.w	r2, r6, r9
 800a9fc:	4686      	mov	lr, r0
 800a9fe:	eba3 0309 	sub.w	r3, r3, r9
 800aa02:	d416      	bmi.n	800aa32 <__kernel_rem_pio2f+0x6a>
 800aa04:	441a      	add	r2, r3
 800aa06:	ed9f 7aa9 	vldr	s14, [pc, #676]	; 800acac <__kernel_rem_pio2f+0x2e4>
 800aa0a:	9865      	ldr	r0, [sp, #404]	; 0x194
 800aa0c:	1c51      	adds	r1, r2, #1
 800aa0e:	aa1a      	add	r2, sp, #104	; 0x68
 800aa10:	2b00      	cmp	r3, #0
 800aa12:	bfa4      	itt	ge
 800aa14:	f850 4023 	ldrge.w	r4, [r0, r3, lsl #2]
 800aa18:	ee07 4a90 	vmovge	s15, r4
 800aa1c:	f103 0301 	add.w	r3, r3, #1
 800aa20:	bfac      	ite	ge
 800aa22:	eef8 7ae7 	vcvtge.f32.s32	s15, s15
 800aa26:	eef0 7a47 	vmovlt.f32	s15, s14
 800aa2a:	428b      	cmp	r3, r1
 800aa2c:	ece2 7a01 	vstmia	r2!, {s15}
 800aa30:	d1ee      	bne.n	800aa10 <__kernel_rem_pio2f+0x48>
 800aa32:	9b02      	ldr	r3, [sp, #8]
 800aa34:	2e00      	cmp	r6, #0
 800aa36:	ea4f 0483 	mov.w	r4, r3, lsl #2
 800aa3a:	ea4f 0a86 	mov.w	sl, r6, lsl #2
 800aa3e:	db1d      	blt.n	800aa7c <__kernel_rem_pio2f+0xb4>
 800aa40:	ab1a      	add	r3, sp, #104	; 0x68
 800aa42:	1918      	adds	r0, r3, r4
 800aa44:	aa43      	add	r2, sp, #268	; 0x10c
 800aa46:	4673      	mov	r3, lr
 800aa48:	1919      	adds	r1, r3, r4
 800aa4a:	eb02 070a 	add.w	r7, r2, sl
 800aa4e:	ad42      	add	r5, sp, #264	; 0x108
 800aa50:	46f4      	mov	ip, lr
 800aa52:	f1b9 0f00 	cmp.w	r9, #0
 800aa56:	eddf 7a95 	vldr	s15, [pc, #596]	; 800acac <__kernel_rem_pio2f+0x2e4>
 800aa5a:	db09      	blt.n	800aa70 <__kernel_rem_pio2f+0xa8>
 800aa5c:	4602      	mov	r2, r0
 800aa5e:	4663      	mov	r3, ip
 800aa60:	ecf3 6a01 	vldmia	r3!, {s13}
 800aa64:	ed32 7a01 	vldmdb	r2!, {s14}
 800aa68:	428b      	cmp	r3, r1
 800aa6a:	eee6 7a87 	vfma.f32	s15, s13, s14
 800aa6e:	d1f7      	bne.n	800aa60 <__kernel_rem_pio2f+0x98>
 800aa70:	ece5 7a01 	vstmia	r5!, {s15}
 800aa74:	42bd      	cmp	r5, r7
 800aa76:	f100 0004 	add.w	r0, r0, #4
 800aa7a:	d1ea      	bne.n	800aa52 <__kernel_rem_pio2f+0x8a>
 800aa7c:	f1aa 0308 	sub.w	r3, sl, #8
 800aa80:	ad06      	add	r5, sp, #24
 800aa82:	18eb      	adds	r3, r5, r3
 800aa84:	9304      	str	r3, [sp, #16]
 800aa86:	ed9f 9a8b 	vldr	s18, [pc, #556]	; 800acb4 <__kernel_rem_pio2f+0x2ec>
 800aa8a:	eddf 8a89 	vldr	s17, [pc, #548]	; 800acb0 <__kernel_rem_pio2f+0x2e8>
 800aa8e:	9600      	str	r6, [sp, #0]
 800aa90:	ab05      	add	r3, sp, #20
 800aa92:	46b3      	mov	fp, r6
 800aa94:	4474      	add	r4, lr
 800aa96:	449a      	add	sl, r3
 800aa98:	af42      	add	r7, sp, #264	; 0x108
 800aa9a:	4676      	mov	r6, lr
 800aa9c:	ea4f 018b 	mov.w	r1, fp, lsl #2
 800aaa0:	ab56      	add	r3, sp, #344	; 0x158
 800aaa2:	440b      	add	r3, r1
 800aaa4:	f1bb 0f00 	cmp.w	fp, #0
 800aaa8:	ed13 0a14 	vldr	s0, [r3, #-80]	; 0xffffffb0
 800aaac:	dd16      	ble.n	800aadc <__kernel_rem_pio2f+0x114>
 800aaae:	eb07 038b 	add.w	r3, r7, fp, lsl #2
 800aab2:	462a      	mov	r2, r5
 800aab4:	ee60 7a09 	vmul.f32	s15, s0, s18
 800aab8:	eeb0 7a40 	vmov.f32	s14, s0
 800aabc:	eefd 7ae7 	vcvt.s32.f32	s15, s15
 800aac0:	ed73 6a01 	vldmdb	r3!, {s13}
 800aac4:	eef8 7ae7 	vcvt.f32.s32	s15, s15
 800aac8:	42bb      	cmp	r3, r7
 800aaca:	eea7 7ae8 	vfms.f32	s14, s15, s17
 800aace:	ee37 0aa6 	vadd.f32	s0, s15, s13
 800aad2:	eebd 7ac7 	vcvt.s32.f32	s14, s14
 800aad6:	eca2 7a01 	vstmia	r2!, {s14}
 800aada:	d1eb      	bne.n	800aab4 <__kernel_rem_pio2f+0xec>
 800aadc:	4640      	mov	r0, r8
 800aade:	9101      	str	r1, [sp, #4]
 800aae0:	f000 fb30 	bl	800b144 <scalbnf>
 800aae4:	eeb0 8a40 	vmov.f32	s16, s0
 800aae8:	eeb4 0a00 	vmov.f32	s0, #64	; 0x3e000000  0.125
 800aaec:	ee28 0a00 	vmul.f32	s0, s16, s0
 800aaf0:	f000 fae2 	bl	800b0b8 <floorf>
 800aaf4:	eef2 7a00 	vmov.f32	s15, #32	; 0x41000000  8.0
 800aaf8:	eea0 8a67 	vfms.f32	s16, s0, s15
 800aafc:	f1b8 0f00 	cmp.w	r8, #0
 800ab00:	9901      	ldr	r1, [sp, #4]
 800ab02:	eefd 9ac8 	vcvt.s32.f32	s19, s16
 800ab06:	eef8 7ae9 	vcvt.f32.s32	s15, s19
 800ab0a:	ee38 8a67 	vsub.f32	s16, s16, s15
 800ab0e:	f340 80c4 	ble.w	800ac9a <__kernel_rem_pio2f+0x2d2>
 800ab12:	f10b 3cff 	add.w	ip, fp, #4294967295	; 0xffffffff
 800ab16:	f1c8 0308 	rsb	r3, r8, #8
 800ab1a:	f855 202c 	ldr.w	r2, [r5, ip, lsl #2]
 800ab1e:	fa42 f003 	asr.w	r0, r2, r3
 800ab22:	fa00 f303 	lsl.w	r3, r0, r3
 800ab26:	1ad3      	subs	r3, r2, r3
 800ab28:	f845 302c 	str.w	r3, [r5, ip, lsl #2]
 800ab2c:	ee19 ca90 	vmov	ip, s19
 800ab30:	4484      	add	ip, r0
 800ab32:	f1c8 0207 	rsb	r2, r8, #7
 800ab36:	ee09 ca90 	vmov	s19, ip
 800ab3a:	fa43 f202 	asr.w	r2, r3, r2
 800ab3e:	2a00      	cmp	r2, #0
 800ab40:	dd31      	ble.n	800aba6 <__kernel_rem_pio2f+0x1de>
 800ab42:	ee19 3a90 	vmov	r3, s19
 800ab46:	f1bb 0f00 	cmp.w	fp, #0
 800ab4a:	f103 0301 	add.w	r3, r3, #1
 800ab4e:	ee09 3a90 	vmov	s19, r3
 800ab52:	f340 8229 	ble.w	800afa8 <__kernel_rem_pio2f+0x5e0>
 800ab56:	6828      	ldr	r0, [r5, #0]
 800ab58:	2800      	cmp	r0, #0
 800ab5a:	f040 8086 	bne.w	800ac6a <__kernel_rem_pio2f+0x2a2>
 800ab5e:	f1bb 0f01 	cmp.w	fp, #1
 800ab62:	d00b      	beq.n	800ab7c <__kernel_rem_pio2f+0x1b4>
 800ab64:	46ae      	mov	lr, r5
 800ab66:	f04f 0c01 	mov.w	ip, #1
 800ab6a:	f85e 0f04 	ldr.w	r0, [lr, #4]!
 800ab6e:	f10c 0301 	add.w	r3, ip, #1
 800ab72:	2800      	cmp	r0, #0
 800ab74:	d17c      	bne.n	800ac70 <__kernel_rem_pio2f+0x2a8>
 800ab76:	459b      	cmp	fp, r3
 800ab78:	469c      	mov	ip, r3
 800ab7a:	d1f6      	bne.n	800ab6a <__kernel_rem_pio2f+0x1a2>
 800ab7c:	f1b8 0f00 	cmp.w	r8, #0
 800ab80:	dd0e      	ble.n	800aba0 <__kernel_rem_pio2f+0x1d8>
 800ab82:	f1b8 0f01 	cmp.w	r8, #1
 800ab86:	f000 8132 	beq.w	800adee <__kernel_rem_pio2f+0x426>
 800ab8a:	f1b8 0f02 	cmp.w	r8, #2
 800ab8e:	d107      	bne.n	800aba0 <__kernel_rem_pio2f+0x1d8>
 800ab90:	f10b 31ff 	add.w	r1, fp, #4294967295	; 0xffffffff
 800ab94:	f855 3021 	ldr.w	r3, [r5, r1, lsl #2]
 800ab98:	f003 033f 	and.w	r3, r3, #63	; 0x3f
 800ab9c:	f845 3021 	str.w	r3, [r5, r1, lsl #2]
 800aba0:	2a02      	cmp	r2, #2
 800aba2:	f000 8112 	beq.w	800adca <__kernel_rem_pio2f+0x402>
 800aba6:	eeb5 8a40 	vcmp.f32	s16, #0.0
 800abaa:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 800abae:	f040 8095 	bne.w	800acdc <__kernel_rem_pio2f+0x314>
 800abb2:	9b00      	ldr	r3, [sp, #0]
 800abb4:	f10b 3cff 	add.w	ip, fp, #4294967295	; 0xffffffff
 800abb8:	4563      	cmp	r3, ip
 800abba:	dc0e      	bgt.n	800abda <__kernel_rem_pio2f+0x212>
 800abbc:	f10b 4180 	add.w	r1, fp, #1073741824	; 0x40000000
 800abc0:	3901      	subs	r1, #1
 800abc2:	eb05 0181 	add.w	r1, r5, r1, lsl #2
 800abc6:	2000      	movs	r0, #0
 800abc8:	f851 3904 	ldr.w	r3, [r1], #-4
 800abcc:	4551      	cmp	r1, sl
 800abce:	ea40 0003 	orr.w	r0, r0, r3
 800abd2:	d1f9      	bne.n	800abc8 <__kernel_rem_pio2f+0x200>
 800abd4:	2800      	cmp	r0, #0
 800abd6:	f040 8113 	bne.w	800ae00 <__kernel_rem_pio2f+0x438>
 800abda:	9b00      	ldr	r3, [sp, #0]
 800abdc:	3b01      	subs	r3, #1
 800abde:	f855 3023 	ldr.w	r3, [r5, r3, lsl #2]
 800abe2:	2b00      	cmp	r3, #0
 800abe4:	f040 8100 	bne.w	800ade8 <__kernel_rem_pio2f+0x420>
 800abe8:	9b04      	ldr	r3, [sp, #16]
 800abea:	f04f 0c01 	mov.w	ip, #1
 800abee:	f853 2904 	ldr.w	r2, [r3], #-4
 800abf2:	f10c 0c01 	add.w	ip, ip, #1
 800abf6:	2a00      	cmp	r2, #0
 800abf8:	d0f9      	beq.n	800abee <__kernel_rem_pio2f+0x226>
 800abfa:	44dc      	add	ip, fp
 800abfc:	f10b 0e01 	add.w	lr, fp, #1
 800ac00:	45e6      	cmp	lr, ip
 800ac02:	dc30      	bgt.n	800ac66 <__kernel_rem_pio2f+0x29e>
 800ac04:	9b03      	ldr	r3, [sp, #12]
 800ac06:	9a02      	ldr	r2, [sp, #8]
 800ac08:	eb0e 0103 	add.w	r1, lr, r3
 800ac0c:	445a      	add	r2, fp
 800ac0e:	eb03 0b0c 	add.w	fp, r3, ip
 800ac12:	ab1a      	add	r3, sp, #104	; 0x68
 800ac14:	f101 4180 	add.w	r1, r1, #1073741824	; 0x40000000
 800ac18:	eb03 0282 	add.w	r2, r3, r2, lsl #2
 800ac1c:	9b65      	ldr	r3, [sp, #404]	; 0x194
 800ac1e:	3901      	subs	r1, #1
 800ac20:	eb03 0181 	add.w	r1, r3, r1, lsl #2
 800ac24:	eb07 0e8e 	add.w	lr, r7, lr, lsl #2
 800ac28:	eb03 0b8b 	add.w	fp, r3, fp, lsl #2
 800ac2c:	f851 3f04 	ldr.w	r3, [r1, #4]!
 800ac30:	ed9f 7a1e 	vldr	s14, [pc, #120]	; 800acac <__kernel_rem_pio2f+0x2e4>
 800ac34:	ee07 3a90 	vmov	s15, r3
 800ac38:	eef8 7ae7 	vcvt.f32.s32	s15, s15
 800ac3c:	4610      	mov	r0, r2
 800ac3e:	f1b9 0f00 	cmp.w	r9, #0
 800ac42:	ece0 7a01 	vstmia	r0!, {s15}
 800ac46:	db09      	blt.n	800ac5c <__kernel_rem_pio2f+0x294>
 800ac48:	4633      	mov	r3, r6
 800ac4a:	e001      	b.n	800ac50 <__kernel_rem_pio2f+0x288>
 800ac4c:	ed72 7a01 	vldmdb	r2!, {s15}
 800ac50:	ecf3 6a01 	vldmia	r3!, {s13}
 800ac54:	42a3      	cmp	r3, r4
 800ac56:	eea6 7aa7 	vfma.f32	s14, s13, s15
 800ac5a:	d1f7      	bne.n	800ac4c <__kernel_rem_pio2f+0x284>
 800ac5c:	4559      	cmp	r1, fp
 800ac5e:	ecae 7a01 	vstmia	lr!, {s14}
 800ac62:	4602      	mov	r2, r0
 800ac64:	d1e2      	bne.n	800ac2c <__kernel_rem_pio2f+0x264>
 800ac66:	46e3      	mov	fp, ip
 800ac68:	e718      	b.n	800aa9c <__kernel_rem_pio2f+0xd4>
 800ac6a:	2301      	movs	r3, #1
 800ac6c:	f04f 0c00 	mov.w	ip, #0
 800ac70:	f5c0 7080 	rsb	r0, r0, #256	; 0x100
 800ac74:	459b      	cmp	fp, r3
 800ac76:	f845 002c 	str.w	r0, [r5, ip, lsl #2]
 800ac7a:	dd0c      	ble.n	800ac96 <__kernel_rem_pio2f+0x2ce>
 800ac7c:	f855 0023 	ldr.w	r0, [r5, r3, lsl #2]
 800ac80:	4429      	add	r1, r5
 800ac82:	eb05 0383 	add.w	r3, r5, r3, lsl #2
 800ac86:	e000      	b.n	800ac8a <__kernel_rem_pio2f+0x2c2>
 800ac88:	6818      	ldr	r0, [r3, #0]
 800ac8a:	f1c0 00ff 	rsb	r0, r0, #255	; 0xff
 800ac8e:	f843 0b04 	str.w	r0, [r3], #4
 800ac92:	428b      	cmp	r3, r1
 800ac94:	d1f8      	bne.n	800ac88 <__kernel_rem_pio2f+0x2c0>
 800ac96:	2001      	movs	r0, #1
 800ac98:	e770      	b.n	800ab7c <__kernel_rem_pio2f+0x1b4>
 800ac9a:	d10f      	bne.n	800acbc <__kernel_rem_pio2f+0x2f4>
 800ac9c:	f10b 33ff 	add.w	r3, fp, #4294967295	; 0xffffffff
 800aca0:	f855 2023 	ldr.w	r2, [r5, r3, lsl #2]
 800aca4:	1212      	asrs	r2, r2, #8
 800aca6:	e74a      	b.n	800ab3e <__kernel_rem_pio2f+0x176>
 800aca8:	0800bb74 	.word	0x0800bb74
 800acac:	00000000 	.word	0x00000000
 800acb0:	43800000 	.word	0x43800000
 800acb4:	3b800000 	.word	0x3b800000
 800acb8:	3fc90000 	.word	0x3fc90000
 800acbc:	eef6 7a00 	vmov.f32	s15, #96	; 0x3f000000  0.5
 800acc0:	eeb4 8ae7 	vcmpe.f32	s16, s15
 800acc4:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 800acc8:	f280 8158 	bge.w	800af7c <__kernel_rem_pio2f+0x5b4>
 800accc:	eeb5 8a40 	vcmp.f32	s16, #0.0
 800acd0:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 800acd4:	f04f 0200 	mov.w	r2, #0
 800acd8:	f43f af6b 	beq.w	800abb2 <__kernel_rem_pio2f+0x1ea>
 800acdc:	eeb0 0a48 	vmov.f32	s0, s16
 800ace0:	f1c8 0000 	rsb	r0, r8, #0
 800ace4:	4691      	mov	r9, r2
 800ace6:	9e00      	ldr	r6, [sp, #0]
 800ace8:	f000 fa2c 	bl	800b144 <scalbnf>
 800acec:	ed1f 7a10 	vldr	s14, [pc, #-64]	; 800acb0 <__kernel_rem_pio2f+0x2e8>
 800acf0:	eeb4 0ac7 	vcmpe.f32	s0, s14
 800acf4:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 800acf8:	f2c0 8158 	blt.w	800afac <__kernel_rem_pio2f+0x5e4>
 800acfc:	ed5f 7a13 	vldr	s15, [pc, #-76]	; 800acb4 <__kernel_rem_pio2f+0x2ec>
 800ad00:	ee60 7a27 	vmul.f32	s15, s0, s15
 800ad04:	f10b 0301 	add.w	r3, fp, #1
 800ad08:	eefd 7ae7 	vcvt.s32.f32	s15, s15
 800ad0c:	f108 0808 	add.w	r8, r8, #8
 800ad10:	eef8 7ae7 	vcvt.f32.s32	s15, s15
 800ad14:	eea7 0ac7 	vfms.f32	s0, s15, s14
 800ad18:	eefd 7ae7 	vcvt.s32.f32	s15, s15
 800ad1c:	eebd 0ac0 	vcvt.s32.f32	s0, s0
 800ad20:	ee10 2a10 	vmov	r2, s0
 800ad24:	f845 202b 	str.w	r2, [r5, fp, lsl #2]
 800ad28:	ee17 2a90 	vmov	r2, s15
 800ad2c:	f845 2023 	str.w	r2, [r5, r3, lsl #2]
 800ad30:	4640      	mov	r0, r8
 800ad32:	eeb7 0a00 	vmov.f32	s0, #112	; 0x3f800000  1.0
 800ad36:	9300      	str	r3, [sp, #0]
 800ad38:	f000 fa04 	bl	800b144 <scalbnf>
 800ad3c:	9b00      	ldr	r3, [sp, #0]
 800ad3e:	2b00      	cmp	r3, #0
 800ad40:	f2c0 814b 	blt.w	800afda <__kernel_rem_pio2f+0x612>
 800ad44:	0098      	lsls	r0, r3, #2
 800ad46:	aa42      	add	r2, sp, #264	; 0x108
 800ad48:	f100 0c04 	add.w	ip, r0, #4
 800ad4c:	ed1f 7a27 	vldr	s14, [pc, #-156]	; 800acb4 <__kernel_rem_pio2f+0x2ec>
 800ad50:	4410      	add	r0, r2
 800ad52:	1d01      	adds	r1, r0, #4
 800ad54:	eb05 020c 	add.w	r2, r5, ip
 800ad58:	ed72 7a01 	vldmdb	r2!, {s15}
 800ad5c:	eef8 7ae7 	vcvt.f32.s32	s15, s15
 800ad60:	42aa      	cmp	r2, r5
 800ad62:	ee67 7a80 	vmul.f32	s15, s15, s0
 800ad66:	ee20 0a07 	vmul.f32	s0, s0, s14
 800ad6a:	ed61 7a01 	vstmdb	r1!, {s15}
 800ad6e:	d1f3      	bne.n	800ad58 <__kernel_rem_pio2f+0x390>
 800ad70:	f10d 0eb8 	add.w	lr, sp, #184	; 0xb8
 800ad74:	ed1f 6a30 	vldr	s12, [pc, #-192]	; 800acb8 <__kernel_rem_pio2f+0x2f0>
 800ad78:	4605      	mov	r5, r0
 800ad7a:	4677      	mov	r7, lr
 800ad7c:	f103 0801 	add.w	r8, r3, #1
 800ad80:	2400      	movs	r4, #0
 800ad82:	2e00      	cmp	r6, #0
 800ad84:	f2c0 8105 	blt.w	800af92 <__kernel_rem_pio2f+0x5ca>
 800ad88:	48a1      	ldr	r0, [pc, #644]	; (800b010 <__kernel_rem_pio2f+0x648>)
 800ad8a:	eddf 7aa2 	vldr	s15, [pc, #648]	; 800b014 <__kernel_rem_pio2f+0x64c>
 800ad8e:	4629      	mov	r1, r5
 800ad90:	eeb0 7a46 	vmov.f32	s14, s12
 800ad94:	2200      	movs	r2, #0
 800ad96:	e003      	b.n	800ada0 <__kernel_rem_pio2f+0x3d8>
 800ad98:	42a2      	cmp	r2, r4
 800ad9a:	dc08      	bgt.n	800adae <__kernel_rem_pio2f+0x3e6>
 800ad9c:	ecb0 7a01 	vldmia	r0!, {s14}
 800ada0:	ecf1 6a01 	vldmia	r1!, {s13}
 800ada4:	3201      	adds	r2, #1
 800ada6:	4296      	cmp	r6, r2
 800ada8:	eee6 7a87 	vfma.f32	s15, s13, s14
 800adac:	daf4      	bge.n	800ad98 <__kernel_rem_pio2f+0x3d0>
 800adae:	3401      	adds	r4, #1
 800adb0:	4544      	cmp	r4, r8
 800adb2:	ece7 7a01 	vstmia	r7!, {s15}
 800adb6:	f1a5 0504 	sub.w	r5, r5, #4
 800adba:	d1e2      	bne.n	800ad82 <__kernel_rem_pio2f+0x3ba>
 800adbc:	9a64      	ldr	r2, [sp, #400]	; 0x190
 800adbe:	2a03      	cmp	r2, #3
 800adc0:	d853      	bhi.n	800ae6a <__kernel_rem_pio2f+0x4a2>
 800adc2:	e8df f002 	tbb	[pc, r2]
 800adc6:	b6ca      	.short	0xb6ca
 800adc8:	5bb6      	.short	0x5bb6
 800adca:	eeb7 0a00 	vmov.f32	s0, #112	; 0x3f800000  1.0
 800adce:	ee30 8a48 	vsub.f32	s16, s0, s16
 800add2:	2800      	cmp	r0, #0
 800add4:	f43f aee7 	beq.w	800aba6 <__kernel_rem_pio2f+0x1de>
 800add8:	4640      	mov	r0, r8
 800adda:	9201      	str	r2, [sp, #4]
 800addc:	f000 f9b2 	bl	800b144 <scalbnf>
 800ade0:	9a01      	ldr	r2, [sp, #4]
 800ade2:	ee38 8a40 	vsub.f32	s16, s16, s0
 800ade6:	e6de      	b.n	800aba6 <__kernel_rem_pio2f+0x1de>
 800ade8:	f04f 0c01 	mov.w	ip, #1
 800adec:	e705      	b.n	800abfa <__kernel_rem_pio2f+0x232>
 800adee:	f10b 31ff 	add.w	r1, fp, #4294967295	; 0xffffffff
 800adf2:	f855 3021 	ldr.w	r3, [r5, r1, lsl #2]
 800adf6:	f003 037f 	and.w	r3, r3, #127	; 0x7f
 800adfa:	f845 3021 	str.w	r3, [r5, r1, lsl #2]
 800adfe:	e6cf      	b.n	800aba0 <__kernel_rem_pio2f+0x1d8>
 800ae00:	4691      	mov	r9, r2
 800ae02:	f855 202c 	ldr.w	r2, [r5, ip, lsl #2]
 800ae06:	9e00      	ldr	r6, [sp, #0]
 800ae08:	4663      	mov	r3, ip
 800ae0a:	f1a8 0808 	sub.w	r8, r8, #8
 800ae0e:	2a00      	cmp	r2, #0
 800ae10:	d18e      	bne.n	800ad30 <__kernel_rem_pio2f+0x368>
 800ae12:	f10c 4280 	add.w	r2, ip, #1073741824	; 0x40000000
 800ae16:	3a01      	subs	r2, #1
 800ae18:	eb05 0282 	add.w	r2, r5, r2, lsl #2
 800ae1c:	f852 1904 	ldr.w	r1, [r2], #-4
 800ae20:	3b01      	subs	r3, #1
 800ae22:	f1a8 0808 	sub.w	r8, r8, #8
 800ae26:	2900      	cmp	r1, #0
 800ae28:	d0f8      	beq.n	800ae1c <__kernel_rem_pio2f+0x454>
 800ae2a:	e781      	b.n	800ad30 <__kernel_rem_pio2f+0x368>
 800ae2c:	464a      	mov	r2, r9
 800ae2e:	eddf 7a79 	vldr	s15, [pc, #484]	; 800b014 <__kernel_rem_pio2f+0x64c>
 800ae32:	2a00      	cmp	r2, #0
 800ae34:	f040 80c2 	bne.w	800afbc <__kernel_rem_pio2f+0x5f4>
 800ae38:	ed9d 7a2e 	vldr	s14, [sp, #184]	; 0xb8
 800ae3c:	9a05      	ldr	r2, [sp, #20]
 800ae3e:	2b00      	cmp	r3, #0
 800ae40:	edc2 7a00 	vstr	s15, [r2]
 800ae44:	ee77 7a67 	vsub.f32	s15, s14, s15
 800ae48:	dd0c      	ble.n	800ae64 <__kernel_rem_pio2f+0x49c>
 800ae4a:	a92f      	add	r1, sp, #188	; 0xbc
 800ae4c:	2201      	movs	r2, #1
 800ae4e:	ecb1 7a01 	vldmia	r1!, {s14}
 800ae52:	3201      	adds	r2, #1
 800ae54:	4293      	cmp	r3, r2
 800ae56:	ee77 7a87 	vadd.f32	s15, s15, s14
 800ae5a:	daf8      	bge.n	800ae4e <__kernel_rem_pio2f+0x486>
 800ae5c:	464b      	mov	r3, r9
 800ae5e:	2b00      	cmp	r3, #0
 800ae60:	f040 80b8 	bne.w	800afd4 <__kernel_rem_pio2f+0x60c>
 800ae64:	9b05      	ldr	r3, [sp, #20]
 800ae66:	edc3 7a01 	vstr	s15, [r3, #4]
 800ae6a:	ee19 3a90 	vmov	r3, s19
 800ae6e:	f003 0007 	and.w	r0, r3, #7
 800ae72:	b057      	add	sp, #348	; 0x15c
 800ae74:	ecbd 8b04 	vpop	{d8-d9}
 800ae78:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 800ae7c:	2b00      	cmp	r3, #0
 800ae7e:	f340 80c4 	ble.w	800b00a <__kernel_rem_pio2f+0x642>
 800ae82:	0098      	lsls	r0, r3, #2
 800ae84:	aa56      	add	r2, sp, #344	; 0x158
 800ae86:	4402      	add	r2, r0
 800ae88:	f10d 0eb8 	add.w	lr, sp, #184	; 0xb8
 800ae8c:	f103 4180 	add.w	r1, r3, #1073741824	; 0x40000000
 800ae90:	ed52 6a28 	vldr	s13, [r2, #-160]	; 0xffffff60
 800ae94:	3901      	subs	r1, #1
 800ae96:	eb0e 0283 	add.w	r2, lr, r3, lsl #2
 800ae9a:	ed72 7a01 	vldmdb	r2!, {s15}
 800ae9e:	ee37 7aa6 	vadd.f32	s14, s15, s13
 800aea2:	4596      	cmp	lr, r2
 800aea4:	ee77 7ac7 	vsub.f32	s15, s15, s14
 800aea8:	ed82 7a00 	vstr	s14, [r2]
 800aeac:	ee77 7aa6 	vadd.f32	s15, s15, s13
 800aeb0:	eef0 6a47 	vmov.f32	s13, s14
 800aeb4:	edc2 7a01 	vstr	s15, [r2, #4]
 800aeb8:	d1ef      	bne.n	800ae9a <__kernel_rem_pio2f+0x4d2>
 800aeba:	2b01      	cmp	r3, #1
 800aebc:	f340 80a5 	ble.w	800b00a <__kernel_rem_pio2f+0x642>
 800aec0:	ab56      	add	r3, sp, #344	; 0x158
 800aec2:	4418      	add	r0, r3
 800aec4:	0089      	lsls	r1, r1, #2
 800aec6:	1d0b      	adds	r3, r1, #4
 800aec8:	ed50 6a28 	vldr	s13, [r0, #-160]	; 0xffffff60
 800aecc:	4473      	add	r3, lr
 800aece:	aa2f      	add	r2, sp, #188	; 0xbc
 800aed0:	ed73 7a01 	vldmdb	r3!, {s15}
 800aed4:	ee37 7aa6 	vadd.f32	s14, s15, s13
 800aed8:	429a      	cmp	r2, r3
 800aeda:	ee77 7ac7 	vsub.f32	s15, s15, s14
 800aede:	ed83 7a00 	vstr	s14, [r3]
 800aee2:	ee77 7aa6 	vadd.f32	s15, s15, s13
 800aee6:	eef0 6a47 	vmov.f32	s13, s14
 800aeea:	edc3 7a01 	vstr	s15, [r3, #4]
 800aeee:	d1ef      	bne.n	800aed0 <__kernel_rem_pio2f+0x508>
 800aef0:	3108      	adds	r1, #8
 800aef2:	eddf 7a48 	vldr	s15, [pc, #288]	; 800b014 <__kernel_rem_pio2f+0x64c>
 800aef6:	eb0e 0301 	add.w	r3, lr, r1
 800aefa:	f10e 0e08 	add.w	lr, lr, #8
 800aefe:	ed33 7a01 	vldmdb	r3!, {s14}
 800af02:	459e      	cmp	lr, r3
 800af04:	ee77 7a87 	vadd.f32	s15, s15, s14
 800af08:	d1f9      	bne.n	800aefe <__kernel_rem_pio2f+0x536>
 800af0a:	464b      	mov	r3, r9
 800af0c:	eddd 6a2e 	vldr	s13, [sp, #184]	; 0xb8
 800af10:	ed9d 7a2f 	vldr	s14, [sp, #188]	; 0xbc
 800af14:	b12b      	cbz	r3, 800af22 <__kernel_rem_pio2f+0x55a>
 800af16:	eef1 6a66 	vneg.f32	s13, s13
 800af1a:	eeb1 7a47 	vneg.f32	s14, s14
 800af1e:	eef1 7a67 	vneg.f32	s15, s15
 800af22:	9b05      	ldr	r3, [sp, #20]
 800af24:	edc3 6a00 	vstr	s13, [r3]
 800af28:	ed83 7a01 	vstr	s14, [r3, #4]
 800af2c:	edc3 7a02 	vstr	s15, [r3, #8]
 800af30:	e79b      	b.n	800ae6a <__kernel_rem_pio2f+0x4a2>
 800af32:	2b00      	cmp	r3, #0
 800af34:	f6ff af7a 	blt.w	800ae2c <__kernel_rem_pio2f+0x464>
 800af38:	a92e      	add	r1, sp, #184	; 0xb8
 800af3a:	eb01 0283 	add.w	r2, r1, r3, lsl #2
 800af3e:	eddf 7a35 	vldr	s15, [pc, #212]	; 800b014 <__kernel_rem_pio2f+0x64c>
 800af42:	3204      	adds	r2, #4
 800af44:	ed32 7a01 	vldmdb	r2!, {s14}
 800af48:	4291      	cmp	r1, r2
 800af4a:	ee77 7a87 	vadd.f32	s15, s15, s14
 800af4e:	d1f9      	bne.n	800af44 <__kernel_rem_pio2f+0x57c>
 800af50:	464a      	mov	r2, r9
 800af52:	2a00      	cmp	r2, #0
 800af54:	f43f af70 	beq.w	800ae38 <__kernel_rem_pio2f+0x470>
 800af58:	e030      	b.n	800afbc <__kernel_rem_pio2f+0x5f4>
 800af5a:	eddf 7a2e 	vldr	s15, [pc, #184]	; 800b014 <__kernel_rem_pio2f+0x64c>
 800af5e:	44f4      	add	ip, lr
 800af60:	ed3c 7a01 	vldmdb	ip!, {s14}
 800af64:	45e6      	cmp	lr, ip
 800af66:	ee77 7a87 	vadd.f32	s15, s15, s14
 800af6a:	d1f9      	bne.n	800af60 <__kernel_rem_pio2f+0x598>
 800af6c:	464b      	mov	r3, r9
 800af6e:	b10b      	cbz	r3, 800af74 <__kernel_rem_pio2f+0x5ac>
 800af70:	eef1 7a67 	vneg.f32	s15, s15
 800af74:	9b05      	ldr	r3, [sp, #20]
 800af76:	edc3 7a00 	vstr	s15, [r3]
 800af7a:	e776      	b.n	800ae6a <__kernel_rem_pio2f+0x4a2>
 800af7c:	ee19 3a90 	vmov	r3, s19
 800af80:	f1bb 0f00 	cmp.w	fp, #0
 800af84:	f103 0301 	add.w	r3, r3, #1
 800af88:	ee09 3a90 	vmov	s19, r3
 800af8c:	dd37      	ble.n	800affe <__kernel_rem_pio2f+0x636>
 800af8e:	2202      	movs	r2, #2
 800af90:	e5e1      	b.n	800ab56 <__kernel_rem_pio2f+0x18e>
 800af92:	eddf 7a20 	vldr	s15, [pc, #128]	; 800b014 <__kernel_rem_pio2f+0x64c>
 800af96:	3401      	adds	r4, #1
 800af98:	4544      	cmp	r4, r8
 800af9a:	ece7 7a01 	vstmia	r7!, {s15}
 800af9e:	f1a5 0504 	sub.w	r5, r5, #4
 800afa2:	f47f aeee 	bne.w	800ad82 <__kernel_rem_pio2f+0x3ba>
 800afa6:	e709      	b.n	800adbc <__kernel_rem_pio2f+0x3f4>
 800afa8:	2000      	movs	r0, #0
 800afaa:	e5e7      	b.n	800ab7c <__kernel_rem_pio2f+0x1b4>
 800afac:	eebd 0ac0 	vcvt.s32.f32	s0, s0
 800afb0:	465b      	mov	r3, fp
 800afb2:	ee10 2a10 	vmov	r2, s0
 800afb6:	f845 202b 	str.w	r2, [r5, fp, lsl #2]
 800afba:	e6b9      	b.n	800ad30 <__kernel_rem_pio2f+0x368>
 800afbc:	eddd 6a2e 	vldr	s13, [sp, #184]	; 0xb8
 800afc0:	9a05      	ldr	r2, [sp, #20]
 800afc2:	eeb1 7a67 	vneg.f32	s14, s15
 800afc6:	2b00      	cmp	r3, #0
 800afc8:	ee76 7ae7 	vsub.f32	s15, s13, s15
 800afcc:	ed82 7a00 	vstr	s14, [r2]
 800afd0:	f73f af3b 	bgt.w	800ae4a <__kernel_rem_pio2f+0x482>
 800afd4:	eef1 7a67 	vneg.f32	s15, s15
 800afd8:	e744      	b.n	800ae64 <__kernel_rem_pio2f+0x49c>
 800afda:	9a64      	ldr	r2, [sp, #400]	; 0x190
 800afdc:	2a03      	cmp	r2, #3
 800afde:	f63f af44 	bhi.w	800ae6a <__kernel_rem_pio2f+0x4a2>
 800afe2:	a101      	add	r1, pc, #4	; (adr r1, 800afe8 <__kernel_rem_pio2f+0x620>)
 800afe4:	f851 f022 	ldr.w	pc, [r1, r2, lsl #2]
 800afe8:	0800aff9 	.word	0x0800aff9
 800afec:	0800af33 	.word	0x0800af33
 800aff0:	0800af33 	.word	0x0800af33
 800aff4:	0800ae7d 	.word	0x0800ae7d
 800aff8:	eddf 7a06 	vldr	s15, [pc, #24]	; 800b014 <__kernel_rem_pio2f+0x64c>
 800affc:	e7b6      	b.n	800af6c <__kernel_rem_pio2f+0x5a4>
 800affe:	eef7 7a00 	vmov.f32	s15, #112	; 0x3f800000  1.0
 800b002:	ee37 8ac8 	vsub.f32	s16, s15, s16
 800b006:	2202      	movs	r2, #2
 800b008:	e5cd      	b.n	800aba6 <__kernel_rem_pio2f+0x1de>
 800b00a:	eddf 7a02 	vldr	s15, [pc, #8]	; 800b014 <__kernel_rem_pio2f+0x64c>
 800b00e:	e77c      	b.n	800af0a <__kernel_rem_pio2f+0x542>
 800b010:	0800bb4c 	.word	0x0800bb4c
 800b014:	00000000 	.word	0x00000000

0800b018 <__kernel_sinf>:
 800b018:	ee10 3a10 	vmov	r3, s0
 800b01c:	f023 4300 	bic.w	r3, r3, #2147483648	; 0x80000000
 800b020:	f1b3 5f48 	cmp.w	r3, #838860800	; 0x32000000
 800b024:	da04      	bge.n	800b030 <__kernel_sinf+0x18>
 800b026:	eefd 7ac0 	vcvt.s32.f32	s15, s0
 800b02a:	ee17 3a90 	vmov	r3, s15
 800b02e:	b323      	cbz	r3, 800b07a <__kernel_sinf+0x62>
 800b030:	ee60 7a00 	vmul.f32	s15, s0, s0
 800b034:	ed9f 5a15 	vldr	s10, [pc, #84]	; 800b08c <__kernel_sinf+0x74>
 800b038:	eddf 5a15 	vldr	s11, [pc, #84]	; 800b090 <__kernel_sinf+0x78>
 800b03c:	ed9f 6a15 	vldr	s12, [pc, #84]	; 800b094 <__kernel_sinf+0x7c>
 800b040:	eddf 6a15 	vldr	s13, [pc, #84]	; 800b098 <__kernel_sinf+0x80>
 800b044:	ed9f 7a15 	vldr	s14, [pc, #84]	; 800b09c <__kernel_sinf+0x84>
 800b048:	eee7 5a85 	vfma.f32	s11, s15, s10
 800b04c:	ee20 5a27 	vmul.f32	s10, s0, s15
 800b050:	eea5 6aa7 	vfma.f32	s12, s11, s15
 800b054:	eee6 6a27 	vfma.f32	s13, s12, s15
 800b058:	eea6 7aa7 	vfma.f32	s14, s13, s15
 800b05c:	b170      	cbz	r0, 800b07c <__kernel_sinf+0x64>
 800b05e:	ee27 7a45 	vnmul.f32	s14, s14, s10
 800b062:	eef6 6a00 	vmov.f32	s13, #96	; 0x3f000000  0.5
 800b066:	eea0 7aa6 	vfma.f32	s14, s1, s13
 800b06a:	eddf 6a0d 	vldr	s13, [pc, #52]	; 800b0a0 <__kernel_sinf+0x88>
 800b06e:	eed7 0a27 	vfnms.f32	s1, s14, s15
 800b072:	eee5 0a26 	vfma.f32	s1, s10, s13
 800b076:	ee30 0a60 	vsub.f32	s0, s0, s1
 800b07a:	4770      	bx	lr
 800b07c:	eddf 6a09 	vldr	s13, [pc, #36]	; 800b0a4 <__kernel_sinf+0x8c>
 800b080:	eee7 6a87 	vfma.f32	s13, s15, s14
 800b084:	eea6 0a85 	vfma.f32	s0, s13, s10
 800b088:	4770      	bx	lr
 800b08a:	bf00      	nop
 800b08c:	2f2ec9d3 	.word	0x2f2ec9d3
 800b090:	b2d72f34 	.word	0xb2d72f34
 800b094:	3638ef1b 	.word	0x3638ef1b
 800b098:	b9500d01 	.word	0xb9500d01
 800b09c:	3c088889 	.word	0x3c088889
 800b0a0:	3e2aaaab 	.word	0x3e2aaaab
 800b0a4:	be2aaaab 	.word	0xbe2aaaab

0800b0a8 <fabsf>:
 800b0a8:	ee10 3a10 	vmov	r3, s0
 800b0ac:	f023 4300 	bic.w	r3, r3, #2147483648	; 0x80000000
 800b0b0:	ee00 3a10 	vmov	s0, r3
 800b0b4:	4770      	bx	lr
 800b0b6:	bf00      	nop

0800b0b8 <floorf>:
 800b0b8:	ee10 2a10 	vmov	r2, s0
 800b0bc:	f022 4100 	bic.w	r1, r2, #2147483648	; 0x80000000
 800b0c0:	0dcb      	lsrs	r3, r1, #23
 800b0c2:	3b7f      	subs	r3, #127	; 0x7f
 800b0c4:	2b16      	cmp	r3, #22
 800b0c6:	dc1c      	bgt.n	800b102 <floorf+0x4a>
 800b0c8:	2b00      	cmp	r3, #0
 800b0ca:	ee10 0a10 	vmov	r0, s0
 800b0ce:	db1e      	blt.n	800b10e <floorf+0x56>
 800b0d0:	4919      	ldr	r1, [pc, #100]	; (800b138 <floorf+0x80>)
 800b0d2:	4119      	asrs	r1, r3
 800b0d4:	420a      	tst	r2, r1
 800b0d6:	d027      	beq.n	800b128 <floorf+0x70>
 800b0d8:	eddf 7a18 	vldr	s15, [pc, #96]	; 800b13c <floorf+0x84>
 800b0dc:	ee70 7a27 	vadd.f32	s15, s0, s15
 800b0e0:	eef5 7ac0 	vcmpe.f32	s15, #0.0
 800b0e4:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 800b0e8:	dd1e      	ble.n	800b128 <floorf+0x70>
 800b0ea:	2a00      	cmp	r2, #0
 800b0ec:	da04      	bge.n	800b0f8 <floorf+0x40>
 800b0ee:	f44f 0200 	mov.w	r2, #8388608	; 0x800000
 800b0f2:	fa42 f303 	asr.w	r3, r2, r3
 800b0f6:	4418      	add	r0, r3
 800b0f8:	ea20 0301 	bic.w	r3, r0, r1
 800b0fc:	ee00 3a10 	vmov	s0, r3
 800b100:	4770      	bx	lr
 800b102:	f1b1 4fff 	cmp.w	r1, #2139095040	; 0x7f800000
 800b106:	d30f      	bcc.n	800b128 <floorf+0x70>
 800b108:	ee30 0a00 	vadd.f32	s0, s0, s0
 800b10c:	4770      	bx	lr
 800b10e:	eddf 7a0b 	vldr	s15, [pc, #44]	; 800b13c <floorf+0x84>
 800b112:	ee70 7a27 	vadd.f32	s15, s0, s15
 800b116:	eef5 7ac0 	vcmpe.f32	s15, #0.0
 800b11a:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 800b11e:	dd03      	ble.n	800b128 <floorf+0x70>
 800b120:	2a00      	cmp	r2, #0
 800b122:	db02      	blt.n	800b12a <floorf+0x72>
 800b124:	ed9f 0a06 	vldr	s0, [pc, #24]	; 800b140 <floorf+0x88>
 800b128:	4770      	bx	lr
 800b12a:	2900      	cmp	r1, #0
 800b12c:	eeff 7a00 	vmov.f32	s15, #240	; 0xbf800000 -1.0
 800b130:	bf18      	it	ne
 800b132:	eeb0 0a67 	vmovne.f32	s0, s15
 800b136:	4770      	bx	lr
 800b138:	007fffff 	.word	0x007fffff
 800b13c:	7149f2ca 	.word	0x7149f2ca
 800b140:	00000000 	.word	0x00000000

0800b144 <scalbnf>:
 800b144:	b508      	push	{r3, lr}
 800b146:	ee10 3a10 	vmov	r3, s0
 800b14a:	f033 4200 	bics.w	r2, r3, #2147483648	; 0x80000000
 800b14e:	ed2d 8b02 	vpush	{d8}
 800b152:	d011      	beq.n	800b178 <scalbnf+0x34>
 800b154:	f1b2 4fff 	cmp.w	r2, #2139095040	; 0x7f800000
 800b158:	d211      	bcs.n	800b17e <scalbnf+0x3a>
 800b15a:	f5b2 0f00 	cmp.w	r2, #8388608	; 0x800000
 800b15e:	d313      	bcc.n	800b188 <scalbnf+0x44>
 800b160:	0dd2      	lsrs	r2, r2, #23
 800b162:	4402      	add	r2, r0
 800b164:	2afe      	cmp	r2, #254	; 0xfe
 800b166:	dc1c      	bgt.n	800b1a2 <scalbnf+0x5e>
 800b168:	2a00      	cmp	r2, #0
 800b16a:	dd2a      	ble.n	800b1c2 <scalbnf+0x7e>
 800b16c:	f023 43ff 	bic.w	r3, r3, #2139095040	; 0x7f800000
 800b170:	ea43 53c2 	orr.w	r3, r3, r2, lsl #23
 800b174:	ee00 3a10 	vmov	s0, r3
 800b178:	ecbd 8b02 	vpop	{d8}
 800b17c:	bd08      	pop	{r3, pc}
 800b17e:	ecbd 8b02 	vpop	{d8}
 800b182:	ee30 0a00 	vadd.f32	s0, s0, s0
 800b186:	bd08      	pop	{r3, pc}
 800b188:	4b1d      	ldr	r3, [pc, #116]	; (800b200 <scalbnf+0xbc>)
 800b18a:	eddf 7a1e 	vldr	s15, [pc, #120]	; 800b204 <scalbnf+0xc0>
 800b18e:	4298      	cmp	r0, r3
 800b190:	ee20 0a27 	vmul.f32	s0, s0, s15
 800b194:	db10      	blt.n	800b1b8 <scalbnf+0x74>
 800b196:	ee10 3a10 	vmov	r3, s0
 800b19a:	f3c3 52c7 	ubfx	r2, r3, #23, #8
 800b19e:	3a19      	subs	r2, #25
 800b1a0:	e7df      	b.n	800b162 <scalbnf+0x1e>
 800b1a2:	ed9f 8a19 	vldr	s16, [pc, #100]	; 800b208 <scalbnf+0xc4>
 800b1a6:	eef0 0a40 	vmov.f32	s1, s0
 800b1aa:	eeb0 0a48 	vmov.f32	s0, s16
 800b1ae:	f000 f831 	bl	800b214 <copysignf>
 800b1b2:	ee20 0a08 	vmul.f32	s0, s0, s16
 800b1b6:	e7df      	b.n	800b178 <scalbnf+0x34>
 800b1b8:	eddf 0a14 	vldr	s1, [pc, #80]	; 800b20c <scalbnf+0xc8>
 800b1bc:	ee20 0a20 	vmul.f32	s0, s0, s1
 800b1c0:	e7da      	b.n	800b178 <scalbnf+0x34>
 800b1c2:	f112 0f16 	cmn.w	r2, #22
 800b1c6:	da0e      	bge.n	800b1e6 <scalbnf+0xa2>
 800b1c8:	f24c 3350 	movw	r3, #50000	; 0xc350
 800b1cc:	4298      	cmp	r0, r3
 800b1ce:	dce8      	bgt.n	800b1a2 <scalbnf+0x5e>
 800b1d0:	ed9f 8a0e 	vldr	s16, [pc, #56]	; 800b20c <scalbnf+0xc8>
 800b1d4:	eef0 0a40 	vmov.f32	s1, s0
 800b1d8:	eeb0 0a48 	vmov.f32	s0, s16
 800b1dc:	f000 f81a 	bl	800b214 <copysignf>
 800b1e0:	ee20 0a08 	vmul.f32	s0, s0, s16
 800b1e4:	e7c8      	b.n	800b178 <scalbnf+0x34>
 800b1e6:	3219      	adds	r2, #25
 800b1e8:	f023 43ff 	bic.w	r3, r3, #2139095040	; 0x7f800000
 800b1ec:	ea43 53c2 	orr.w	r3, r3, r2, lsl #23
 800b1f0:	eddf 7a07 	vldr	s15, [pc, #28]	; 800b210 <scalbnf+0xcc>
 800b1f4:	ee00 3a10 	vmov	s0, r3
 800b1f8:	ee20 0a27 	vmul.f32	s0, s0, s15
 800b1fc:	e7bc      	b.n	800b178 <scalbnf+0x34>
 800b1fe:	bf00      	nop
 800b200:	ffff3cb0 	.word	0xffff3cb0
 800b204:	4c000000 	.word	0x4c000000
 800b208:	7149f2ca 	.word	0x7149f2ca
 800b20c:	0da24260 	.word	0x0da24260
 800b210:	33000000 	.word	0x33000000

0800b214 <copysignf>:
 800b214:	ee10 3a10 	vmov	r3, s0
 800b218:	ee10 2a90 	vmov	r2, s1
 800b21c:	f023 4300 	bic.w	r3, r3, #2147483648	; 0x80000000
 800b220:	f002 4200 	and.w	r2, r2, #2147483648	; 0x80000000
 800b224:	4313      	orrs	r3, r2
 800b226:	ee00 3a10 	vmov	s0, r3
 800b22a:	4770      	bx	lr

0800b22c <_init>:
 800b22c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800b22e:	bf00      	nop
 800b230:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800b232:	bc08      	pop	{r3}
 800b234:	469e      	mov	lr, r3
 800b236:	4770      	bx	lr

0800b238 <_fini>:
 800b238:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800b23a:	bf00      	nop
 800b23c:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800b23e:	bc08      	pop	{r3}
 800b240:	469e      	mov	lr, r3
 800b242:	4770      	bx	lr
