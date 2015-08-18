0010 <__trap_interrupt>
0010:	  3041           ret
	4400 <__init_stack>
4400:	  3140 9240      mov	#0x4092, sp
	4404 <__low_level_init>
4404:	  1542 5c01      mov	&0x015c, r5
4408:	  75f3           and.b	#-0x1, r5
440a:	  35d0 085a      bis	#0x5a08, r5
	440e <__do_copy_data>
440e:	  3f40 0000      clr	r15
4412:	  0f93           tst	r15
4414:	  0724           jz	#0x4424 <__do_clear_bss+0x0>
4416:	  8245 5c01      mov	r5, &0x015c
441a:	  2f83           decd	r15
441c:	  9f4f f446 0024 mov	0x46f4(r15), 0x2400(r15)
4422:	  f923           jnz	#0x4416 <__do_copy_data+0x8>
	4424 <__do_clear_bss>
4424:	  3f40 1400      mov	#0x14, r15
4428:	  0f93           tst	r15
442a:	  0624           jz	#0x4438 <main+0x0>
442c:	  8245 5c01      mov	r5, &0x015c
4430:	  1f83           dec	r15
4432:	  cf43 0024      mov.b	#0x0, 0x2400(r15)
4436:	  fa23           jnz	#0x442c <__do_clear_bss+0x8>
	4438 <main>
4438:	  3150 eaff      add	#0xffea, sp
443c:	  8143 0000      clr	0x0(sp)
4440:	  3012 e644      push	#0x44e6 "Login with username:password below to authenticate.\n"
4444:	  b012 c845      call	#0x45c8 <printf>
4448:	  b140 1b45 0000 mov	#0x451b ">> ", 0x0(sp)
444e:	  b012 c845      call	#0x45c8 <printf>
4452:	  2153           incd	sp
4454:	  3e40 1300      mov	#0x13, r14
4458:	  3f40 0024      mov	#0x2400, r15
445c:	  b012 8c45      call	#0x458c <getsn>
4460:	  0b41           mov	sp, r11
4462:	  2b53           incd	r11
4464:	  3e40 0024      mov	#0x2400, r14
4468:	  0f4b           mov	r11, r15
446a:	  b012 de46      call	#0x46de <strcpy>
446e:	  3f40 0024      mov	#0x2400, r15
4472:	  b012 b044      call	#0x44b0 <test_password_valid>
4476:	  814f 0000      mov	r15, 0x0(sp)
447a:	  0b12           push	r11
447c:	  b012 c845      call	#0x45c8 <printf>
4480:	  2153           incd	sp
4482:	  3f40 0a00      mov	#0xa, r15
4486:	  b012 5045      call	#0x4550 <putchar>
448a:	  8193 0000      tst	0x0(sp)
448e:	  0324           jz	#0x4496 <main+0x5e>
4490:	  b012 da44      call	#0x44da <unlock_door>
4494:	  053c           jmp	#0x44a0 <main+0x68>
4496:	  3012 1f45      push	#0x451f "That entry is not valid."
449a:	  b012 c845      call	#0x45c8 <printf>
449e:	  2153           incd	sp
44a0:	  0f43           clr	r15
44a2:	  3150 1600      add	#0x16, sp
	44a6 <__stop_progExec__>
44a6:	  32d0 f000      bis	#0xf0, sr
44aa:	  fd3f           jmp	#0x44a6 <__stop_progExec__+0x0>
	44ac <__ctors_end>
44ac:	  3040 f246      br	#0x46f2 <_unexpected_>
	44b0 <test_password_valid>
44b0:	  0412           push	r4
44b2:	  0441           mov	sp, r4
44b4:	  2453           incd	r4
44b6:	  2183           decd	sp
44b8:	  c443 fcff      mov.b	#0x0, -0x4(r4)
44bc:	  3e40 fcff      mov	#0xfffc, r14
44c0:	  0e54           add	r4, r14
44c2:	  0e12           push	r14
44c4:	  0f12           push	r15
44c6:	  3012 7d00      push	#0x7d
44ca:	  b012 3845      call	#0x4538 <INT>
44ce:	  5f44 fcff      mov.b	-0x4(r4), r15
44d2:	  8f11           sxt	r15
44d4:	  3152           add	#0x8, sp
44d6:	  3441           pop	r4
44d8:	  3041           ret
	44da <unlock_door>
44da:	  3012 7f00      push	#0x7f
44de:	  b012 3845      call	#0x4538 <INT>
44e2:	  2153           incd	sp
44e4:	  3041           ret
	44e6 .strings:
44e6:	 "Login with username:password below to authenticate.\n"
451b:	 ">> "
451f:	 "That entry is not valid."
	4538 <INT>
4538:	  1e41 0200      mov	0x2(sp), r14
453c:	  0212           push	sr
453e:	  0f4e           mov	r14, r15
4540:	  8f10           swpb	r15
4542:	  024f           mov	r15, sr
4544:	  32d0 0080      bis	#0x8000, sr
4548:	  b012 1000      call	#0x10
454c:	  3241           pop	sr
454e:	  3041           ret
	4550 <putchar>
4550:	  2183           decd	sp
4552:	  0f12           push	r15
4554:	  0312           push	#0x0
4556:	  814f 0400      mov	r15, 0x4(sp)
455a:	  b012 3845      call	#0x4538 <INT>
455e:	  1f41 0400      mov	0x4(sp), r15
4562:	  3150 0600      add	#0x6, sp
4566:	  3041           ret
	4568 <getchar>
4568:	  0412           push	r4
456a:	  0441           mov	sp, r4
456c:	  2453           incd	r4
456e:	  2183           decd	sp
4570:	  3f40 fcff      mov	#0xfffc, r15
4574:	  0f54           add	r4, r15
4576:	  0f12           push	r15
4578:	  1312           push	#0x1
457a:	  b012 3845      call	#0x4538 <INT>
457e:	  5f44 fcff      mov.b	-0x4(r4), r15
4582:	  8f11           sxt	r15
4584:	  3150 0600      add	#0x6, sp
4588:	  3441           pop	r4
458a:	  3041           ret
	458c <getsn>
458c:	  0e12           push	r14
458e:	  0f12           push	r15
4590:	  2312           push	#0x2
4592:	  b012 3845      call	#0x4538 <INT>
4596:	  3150 0600      add	#0x6, sp
459a:	  3041           ret
	459c <puts>
459c:	  0b12           push	r11
459e:	  0b4f           mov	r15, r11
45a0:	  073c           jmp	#0x45b0 <puts+0x14>
45a2:	  1b53           inc	r11
45a4:	  8f11           sxt	r15
45a6:	  0f12           push	r15
45a8:	  0312           push	#0x0
45aa:	  b012 3845      call	#0x4538 <INT>
45ae:	  2152           add	#0x4, sp
45b0:	  6f4b           mov.b	@r11, r15
45b2:	  4f93           tst.b	r15
45b4:	  f623           jnz	#0x45a2 <puts+0x6>
45b6:	  3012 0a00      push	#0xa
45ba:	  0312           push	#0x0
45bc:	  b012 3845      call	#0x4538 <INT>
45c0:	  2152           add	#0x4, sp
45c2:	  0f43           clr	r15
45c4:	  3b41           pop	r11
45c6:	  3041           ret
	45c8 <printf>
45c8:	  0b12           push	r11
45ca:	  0a12           push	r10
45cc:	  0912           push	r9
45ce:	  0812           push	r8
45d0:	  0712           push	r7
45d2:	  0412           push	r4
45d4:	  0441           mov	sp, r4
45d6:	  3450 0c00      add	#0xc, r4
45da:	  2183           decd	sp
45dc:	  1b44 0200      mov	0x2(r4), r11
45e0:	  8441 f2ff      mov	sp, -0xe(r4)
45e4:	  0f4b           mov	r11, r15
45e6:	  0e43           clr	r14
45e8:	  0b3c           jmp	#0x4600 <printf+0x38>
45ea:	  1f53           inc	r15
45ec:	  7d90 2500      cmp.b	#0x25, r13
45f0:	  0720           jne	#0x4600 <printf+0x38>
45f2:	  6d9f           cmp.b	@r15, r13
45f4:	  0320           jne	#0x45fc <printf+0x34>
45f6:	  1f53           inc	r15
45f8:	  0d43           clr	r13
45fa:	  013c           jmp	#0x45fe <printf+0x36>
45fc:	  1d43           mov	#0x1, r13
45fe:	  0e5d           add	r13, r14
4600:	  6d4f           mov.b	@r15, r13
4602:	  4d93           tst.b	r13
4604:	  f223           jnz	#0x45ea <printf+0x22>
4606:	  0f4e           mov	r14, r15
4608:	  0f5f           add	r15, r15
460a:	  2f53           incd	r15
460c:	  018f           sub	r15, sp
460e:	  0941           mov	sp, r9
4610:	  0c44           mov	r4, r12
4612:	  2c52           add	#0x4, r12
4614:	  0f41           mov	sp, r15
4616:	  0d43           clr	r13
4618:	  053c           jmp	#0x4624 <printf+0x5c>
461a:	  af4c 0000      mov	@r12, 0x0(r15)
461e:	  1d53           inc	r13
4620:	  2f53           incd	r15
4622:	  2c53           incd	r12
4624:	  0d9e           cmp	r14, r13
4626:	  f93b           jl	#0x461a <printf+0x52>
4628:	  0a43           clr	r10
462a:	  3740 0900      mov	#0x9, r7
462e:	  4a3c           jmp	#0x46c4 <printf+0xfc>
4630:	  084b           mov	r11, r8
4632:	  1853           inc	r8
4634:	  7f90 2500      cmp.b	#0x25, r15
4638:	  0624           jeq	#0x4646 <printf+0x7e>
463a:	  1a53           inc	r10
463c:	  0b48           mov	r8, r11
463e:	  8f11           sxt	r15
4640:	  b012 5045      call	#0x4550 <putchar>
4644:	  3f3c           jmp	#0x46c4 <printf+0xfc>
4646:	  6e48           mov.b	@r8, r14
4648:	  4e9f           cmp.b	r15, r14
464a:	  0620           jne	#0x4658 <printf+0x90>
464c:	  1a53           inc	r10
464e:	  3f40 2500      mov	#0x25, r15
4652:	  b012 5045      call	#0x4550 <putchar>
4656:	  333c           jmp	#0x46be <printf+0xf6>
4658:	  7e90 7300      cmp.b	#0x73, r14
465c:	  0b20           jne	#0x4674 <printf+0xac>
465e:	  2b49           mov	@r9, r11
4660:	  053c           jmp	#0x466c <printf+0xa4>
4662:	  1a53           inc	r10
4664:	  1b53           inc	r11
4666:	  8f11           sxt	r15
4668:	  b012 5045      call	#0x4550 <putchar>
466c:	  6f4b           mov.b	@r11, r15
466e:	  4f93           tst.b	r15
4670:	  f823           jnz	#0x4662 <printf+0x9a>
4672:	  253c           jmp	#0x46be <printf+0xf6>
4674:	  7e90 7800      cmp.b	#0x78, r14
4678:	  1c20           jne	#0x46b2 <printf+0xea>
467a:	  2b49           mov	@r9, r11
467c:	  173c           jmp	#0x46ac <printf+0xe4>
467e:	  0f4b           mov	r11, r15
4680:	  8f10           swpb	r15
4682:	  3ff0 ff00      and	#0xff, r15
4686:	  12c3           clrc
4688:	  0f10           rrc	r15
468a:	  0f11           rra	r15
468c:	  0f11           rra	r15
468e:	  0f11           rra	r15
4690:	  1a53           inc	r10
4692:	  079f           cmp	r15, r7
4694:	  0338           jl	#0x469c <printf+0xd4>
4696:	  3f50 3000      add	#0x30, r15
469a:	  023c           jmp	#0x46a0 <printf+0xd8>
469c:	  3f50 5700      add	#0x57, r15
46a0:	  b012 5045      call	#0x4550 <putchar>
46a4:	  0b5b           add	r11, r11
46a6:	  0b5b           add	r11, r11
46a8:	  0b5b           add	r11, r11
46aa:	  0b5b           add	r11, r11
46ac:	  0b93           tst	r11
46ae:	  e723           jnz	#0x467e <printf+0xb6>
46b0:	  063c           jmp	#0x46be <printf+0xf6>
46b2:	  7e90 6e00      cmp.b	#0x6e, r14
46b6:	  0320           jne	#0x46be <printf+0xf6>
46b8:	  2f49           mov	@r9, r15
46ba:	  8f4a 0000      mov	r10, 0x0(r15)
46be:	  2953           incd	r9
46c0:	  0b48           mov	r8, r11
46c2:	  1b53           inc	r11
46c4:	  6f4b           mov.b	@r11, r15
46c6:	  4f93           tst.b	r15
46c8:	  b323           jnz	#0x4630 <printf+0x68>
46ca:	  1144 f2ff      mov	-0xe(r4), sp
46ce:	  2153           incd	sp
46d0:	  3441           pop	r4
46d2:	  3741           pop	r7
46d4:	  3841           pop	r8
46d6:	  3941           pop	r9
46d8:	  3a41           pop	r10
46da:	  3b41           pop	r11
46dc:	  3041           ret
	46de <strcpy>
46de:	  0d4f           mov	r15, r13
46e0:	  023c           jmp	#0x46e6 <strcpy+0x8>
46e2:	  1e53           inc	r14
46e4:	  1d53           inc	r13
46e6:	  6c4e           mov.b	@r14, r12
46e8:	  cd4c 0000      mov.b	r12, 0x0(r13)
46ec:	  4c93           tst.b	r12
46ee:	  f923           jnz	#0x46e2 <strcpy+0x4>
46f0:	  3041           ret
	46f2 <_unexpected_>
46f2:	  0013           reti	pc
