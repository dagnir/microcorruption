0010 <__trap_interrupt>
0010:	  3041           ret
4400 <__init_stack>
4400:	  3140 0044      mov	#0x4400, sp
4404 <__low_level_init>
4404:	  1542 5c01      mov	&0x015c, r5
4408:	  75f3           and.b	#-0x1, r5
440a:	  35d0 085a      bis	#0x5a08, r5
440e <__do_copy_data>
440e:	  3f40 0200      mov	#0x2, r15
4412:	  0f93           tst	r15
4414:	  0724           jz	#0x4424 <__do_clear_bss+0x0>
4416:	  8245 5c01      mov	r5, &0x015c
441a:	  2f83           decd	r15
441c:	  9f4f 0a47 0024 mov	0x470a(r15), 0x2400(r15)
4422:	  f923           jnz	#0x4416 <__do_copy_data+0x8>
4424 <__do_clear_bss>
4424:	  3f40 0004      mov	#0x400, r15
4428:	  0f93           tst	r15
442a:	  0624           jz	#0x4438 <main+0x0>
442c:	  8245 5c01      mov	r5, &0x015c
4430:	  1f83           dec	r15
4432:	  cf43 0224      mov.b	#0x0, 0x2402(r15)
4436:	  fa23           jnz	#0x442c <__do_clear_bss+0x8>
4438 <main>
4438:	  3150 18fc      add	#0xfc18, sp
443c:	  b012 6045      call	#0x4560 <login>
4440:	  0f43           clr	r15
4442 <__stop_progExec__>
4442:	  32d0 f000      bis	#0xf0, sr
4446:	  fd3f           jmp	#0x4442 <__stop_progExec__+0x0>
4448 <__ctors_end>
4448:	  3040 0847      br	#0x4708 <_unexpected_>
444c <unlock_door>
444c:	  3012 7f00      push	#0x7f
4450:	  b012 6446      call	#0x4664 <INT>
4454:	  2153           incd	sp
4456:	  3041           ret
4458 <test_username_and_password_valid>
4458:	  0412           push	r4
445a:	  0441           mov	sp, r4
445c:	  2453           incd	r4
445e:	  2183           decd	sp
4460:	  c443 fcff      mov.b	#0x0, -0x4(r4)
4464:	  3e40 fcff      mov	#0xfffc, r14
4468:	  0e54           add	r4, r14
446a:	  0e12           push	r14
446c:	  0f12           push	r15
446e:	  3012 7d00      push	#0x7d
4472:	  b012 6446      call	#0x4664 <INT>
4476:	  5f44 fcff      mov.b	-0x4(r4), r15
447a:	  8f11           sxt	r15
447c:	  3152           add	#0x8, sp
447e:	  3441           pop	r4
4480:	  3041           ret
4482 .strings:
4482:	 "Authentication requires a username and password."
44b3:	 "Your username and password together may be no more than 32 characters."
44fa:	 "Please enter your username:"
4516:	 "Please enter your password:"
4532:	 "Access granted."
4542:	 "That password is not correct."
4560 <login>
4560:	  0b12           push	r11
4562:	  3150 deff      add	#0xffde, sp
4566:	  3f40 8244      mov	#0x4482 "Authentication requires a username and password.", r15
456a:	  b012 c846      call	#0x46c8 <puts>
456e:	  3f40 b344      mov	#0x44b3 "Your username and password together may be no more than 32 characters.", r15
4572:	  b012 c846      call	#0x46c8 <puts>
4576:	  3f40 fa44      mov	#0x44fa "Please enter your username:", r15
457a:	  b012 c846      call	#0x46c8 <puts>
457e:	  3e40 ff00      mov	#0xff, r14
4582:	  3f40 0224      mov	#0x2402, r15
4586:	  b012 b846      call	#0x46b8 <getsn>
458a:	  3f40 0224      mov	#0x2402, r15
458e:	  b012 c846      call	#0x46c8 <puts>
4592:	  3f40 0124      mov	#0x2401, r15
4596:	  1f53           inc	r15
4598:	  cf93 0000      tst.b	0x0(r15)
459c:	  fc23           jnz	#0x4596 <login+0x36>
459e:	  0b4f           mov	r15, r11
45a0:	  3b80 0224      sub	#0x2402, r11
45a4:	  3e40 0224      mov	#0x2402, r14
45a8:	  0f41           mov	sp, r15
45aa:	  b012 f446      call	#0x46f4 <strcpy>
45ae:	  7b90 2100      cmp.b	#0x21, r11
45b2:	  0628           jnc	#0x45c0 <login+0x60>
45b4:	  1f42 0024      mov	&0x2400, r15
45b8:	  b012 c846      call	#0x46c8 <puts>
45bc:	  3040 4244      br	#0x4442 <__stop_progExec__>
45c0:	  3f40 1645      mov	#0x4516 "Please enter your password:", r15
45c4:	  b012 c846      call	#0x46c8 <puts>
45c8:	  3e40 1f00      mov	#0x1f, r14
45cc:	  0e8b           sub	r11, r14
45ce:	  3ef0 ff01      and	#0x1ff, r14
45d2:	  3f40 0224      mov	#0x2402, r15
45d6:	  b012 b846      call	#0x46b8 <getsn>
45da:	  3f40 0224      mov	#0x2402, r15
45de:	  b012 c846      call	#0x46c8 <puts>
45e2:	  3e40 0224      mov	#0x2402, r14
45e6:	  0f41           mov	sp, r15
45e8:	  0f5b           add	r11, r15
45ea:	  b012 f446      call	#0x46f4 <strcpy>
45ee:	  3f40 0124      mov	#0x2401, r15
45f2:	  1f53           inc	r15
45f4:	  cf93 0000      tst.b	0x0(r15)
45f8:	  fc23           jnz	#0x45f2 <login+0x92>
45fa:	  3f80 0224      sub	#0x2402, r15
45fe:	  0f5b           add	r11, r15
4600:	  7f90 2100      cmp.b	#0x21, r15
4604:	  0628           jnc	#0x4612 <login+0xb2>
4606:	  1f42 0024      mov	&0x2400, r15
460a:	  b012 c846      call	#0x46c8 <puts>
460e:	  3040 4244      br	#0x4442 <__stop_progExec__>
4612:	  0f41           mov	sp, r15
4614:	  b012 5844      call	#0x4458 <test_username_and_password_valid>
4618:	  0f93           tst	r15
461a:	  0524           jz	#0x4626 <login+0xc6>
461c:	  b012 4c44      call	#0x444c <unlock_door>
4620:	  3f40 3245      mov	#0x4532 "Access granted.", r15
4624:	  023c           jmp	#0x462a <login+0xca>
4626:	  3f40 4245      mov	#0x4542 "That password is not correct.", r15
462a:	  b012 c846      call	#0x46c8 <puts>
462e:	  3150 2200      add	#0x22, sp
4632:	  3b41           pop	r11
4634:	  3041           ret
4636 <__do_nothing>
4636:	  3041           ret
4638:	  496e           addc.b	r14, r9
463a:	  7661           addc.b	@sp+, r6
463c:	  6c69           addc.b	@r9, r12
463e:	  6420           jnz	#0x4708 <_unexpected_+0x0>
4640:	  5061 7373      addc.b	0x7373(sp), pc
4644:	  776f           addc.b	@r15+, r7
4646:	  7264           addc.b	@r4+, sr
4648:	  204c           br	@r12
464a:	  656e           addc.b	@r14, r5
464c:	  6774           subc.b	@r4, r7
464e:	  683a           jl	#0x4320 <__none__+0x4320>
4650:	  2070           subc	@pc, pc
4652:	  6173           subc.b	#0x2, sp
4654:	  7377           .word	0x7773
4656:	  6f72           subc.b	#0x4, r15
4658:	  6420           jnz	#0x4722 <_unexpected_+0x1a>
465a:	  746f           addc.b	@r15+, r4
465c:	  6f20           jnz	#0x473c <_unexpected_+0x34>
465e:	  6c6f           addc.b	@r15, r12
4660:	  6e67           addc.b	@r7, r14
4662:	  2e00           .word	0x002e
4664 <INT>
4664:	  1e41 0200      mov	0x2(sp), r14
4668:	  0212           push	sr
466a:	  0f4e           mov	r14, r15
466c:	  8f10           swpb	r15
466e:	  024f           mov	r15, sr
4670:	  32d0 0080      bis	#0x8000, sr
4674:	  b012 1000      call	#0x10
4678:	  3241           pop	sr
467a:	  3041           ret
467c <putchar>
467c:	  2183           decd	sp
467e:	  0f12           push	r15
4680:	  0312           push	#0x0
4682:	  814f 0400      mov	r15, 0x4(sp)
4686:	  b012 6446      call	#0x4664 <INT>
468a:	  1f41 0400      mov	0x4(sp), r15
468e:	  3150 0600      add	#0x6, sp
4692:	  3041           ret
4694 <getchar>
4694:	  0412           push	r4
4696:	  0441           mov	sp, r4
4698:	  2453           incd	r4
469a:	  2183           decd	sp
469c:	  3f40 fcff      mov	#0xfffc, r15
46a0:	  0f54           add	r4, r15
46a2:	  0f12           push	r15
46a4:	  1312           push	#0x1
46a6:	  b012 6446      call	#0x4664 <INT>
46aa:	  5f44 fcff      mov.b	-0x4(r4), r15
46ae:	  8f11           sxt	r15
46b0:	  3150 0600      add	#0x6, sp
46b4:	  3441           pop	r4
46b6:	  3041           ret
46b8 <getsn>
46b8:	  0e12           push	r14
46ba:	  0f12           push	r15
46bc:	  2312           push	#0x2
46be:	  b012 6446      call	#0x4664 <INT>
46c2:	  3150 0600      add	#0x6, sp
46c6:	  3041           ret
46c8 <puts>
46c8:	  0b12           push	r11
46ca:	  0b4f           mov	r15, r11
46cc:	  073c           jmp	#0x46dc <puts+0x14>
46ce:	  1b53           inc	r11
46d0:	  8f11           sxt	r15
46d2:	  0f12           push	r15
46d4:	  0312           push	#0x0
46d6:	  b012 6446      call	#0x4664 <INT>
46da:	  2152           add	#0x4, sp
46dc:	  6f4b           mov.b	@r11, r15
46de:	  4f93           tst.b	r15
46e0:	  f623           jnz	#0x46ce <puts+0x6>
46e2:	  3012 0a00      push	#0xa
46e6:	  0312           push	#0x0
46e8:	  b012 6446      call	#0x4664 <INT>
46ec:	  2152           add	#0x4, sp
46ee:	  0f43           clr	r15
46f0:	  3b41           pop	r11
46f2:	  3041           ret
46f4 <strcpy>
46f4:	  0d4f           mov	r15, r13
46f6:	  023c           jmp	#0x46fc <strcpy+0x8>
46f8:	  1e53           inc	r14
46fa:	  1d53           inc	r13
46fc:	  6c4e           mov.b	@r14, r12
46fe:	  cd4c 0000      mov.b	r12, 0x0(r13)
4702:	  4c93           tst.b	r12
4704:	  f923           jnz	#0x46f8 <strcpy+0x4>
4706:	  3041           ret
4708 <_unexpected_>
4708:	  0013           reti	pc
