0010 <__trap_interrupt>
0010:	  3041           ret
	4400 <__init_stack>
4400:	  3140 0044      mov	#0x4400, sp
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
441c:	  9f4f 5846 0024 mov	0x4658(r15), 0x2400(r15)
4422:	  f923           jnz	#0x4416 <__do_copy_data+0x8>
	4424 <__do_clear_bss>
4424:	  3f40 6400      mov	#0x64, r15
4428:	  0f93           tst	r15
442a:	  0624           jz	#0x4438 <main+0x0>
442c:	  8245 5c01      mov	r5, &0x015c
4430:	  1f83           dec	r15
4432:	  cf43 0024      mov.b	#0x0, 0x2400(r15)
4436:	  fa23           jnz	#0x442c <__do_clear_bss+0x8>
	4438 <main>
4438:	  b012 f444      call	#0x44f4 <login>
	443c <__stop_progExec__>
443c:	  32d0 f000      bis	#0xf0, sr
4440:	  fd3f           jmp	#0x443c <__stop_progExec__+0x0>
	4442 <__ctors_end>
4442:	  3040 5646      br	#0x4656 <_unexpected_>
	4446 <conditional_unlock_door>
4446:	  0412           push	r4
4448:	  0441           mov	sp, r4
444a:	  2453           incd	r4
444c:	  2183           decd	sp
444e:	  c443 fcff      mov.b	#0x0, -0x4(r4)
4452:	  3e40 fcff      mov	#0xfffc, r14
4456:	  0e54           add	r4, r14
4458:	  0e12           push	r14
445a:	  0f12           push	r15
445c:	  3012 7e00      push	#0x7e
4460:	  b012 4c45      call	#0x454c <INT>
4464:	  5f44 fcff      mov.b	-0x4(r4), r15
4468:	  8f11           sxt	r15
446a:	  3152           add	#0x8, sp
446c:	  3441           pop	r4
446e:	  3041           ret
	4470 .strings:
4470:	 "Enter the password to continue."
4490:	 "Remember: passwords are between 8 and 16 characters."
44c5:	 "Access granted."
44d5:	 "That password is not correct."
44f3:	 ""
	44f4 <login>
44f4:	  3150 f0ff      add	#0xfff0, sp
44f8:	  3f40 7044      mov	#0x4470 "Enter the password to continue.", r15
44fc:	  b012 b045      call	#0x45b0 <puts>
4500:	  3f40 9044      mov	#0x4490 "Remember: passwords are between 8 and 16 characters.", r15
4504:	  b012 b045      call	#0x45b0 <puts>
4508:	  3e40 3000      mov	#0x30, r14
450c:	  3f40 0024      mov	#0x2400, r15
4510:	  b012 a045      call	#0x45a0 <getsn>
4514:	  3e40 0024      mov	#0x2400, r14
4518:	  0f41           mov	sp, r15
451a:	  b012 dc45      call	#0x45dc <strcpy>
451e:	  3d40 6400      mov	#0x64, r13
4522:	  0e43           clr	r14
4524:	  3f40 0024      mov	#0x2400, r15
4528:	  b012 f045      call	#0x45f0 <memset>
452c:	  0f41           mov	sp, r15
452e:	  b012 4644      call	#0x4446 <conditional_unlock_door>
4532:	  0f93           tst	r15
4534:	  0324           jz	#0x453c <login+0x48>
4536:	  3f40 c544      mov	#0x44c5 "Access granted.", r15
453a:	  023c           jmp	#0x4540 <login+0x4c>
453c:	  3f40 d544      mov	#0x44d5 "That password is not correct.", r15
4540:	  b012 b045      call	#0x45b0 <puts>
4544:	  3150 1000      add	#0x10, sp
4548:	  3041           ret
	454a <__do_nothing>
454a:	  3041           ret
	454c <INT>
454c:	  1e41 0200      mov	0x2(sp), r14
4550:	  0212           push	sr
4552:	  0f4e           mov	r14, r15
4554:	  8f10           swpb	r15
4556:	  024f           mov	r15, sr
4558:	  32d0 0080      bis	#0x8000, sr
455c:	  b012 1000      call	#0x10
4560:	  3241           pop	sr
4562:	  3041           ret
	4564 <putchar>
4564:	  2183           decd	sp
4566:	  0f12           push	r15
4568:	  0312           push	#0x0
456a:	  814f 0400      mov	r15, 0x4(sp)
456e:	  b012 4c45      call	#0x454c <INT>
4572:	  1f41 0400      mov	0x4(sp), r15
4576:	  3150 0600      add	#0x6, sp
457a:	  3041           ret
	457c <getchar>
457c:	  0412           push	r4
457e:	  0441           mov	sp, r4
4580:	  2453           incd	r4
4582:	  2183           decd	sp
4584:	  3f40 fcff      mov	#0xfffc, r15
4588:	  0f54           add	r4, r15
458a:	  0f12           push	r15
458c:	  1312           push	#0x1
458e:	  b012 4c45      call	#0x454c <INT>
4592:	  5f44 fcff      mov.b	-0x4(r4), r15
4596:	  8f11           sxt	r15
4598:	  3150 0600      add	#0x6, sp
459c:	  3441           pop	r4
459e:	  3041           ret
	45a0 <getsn>
45a0:	  0e12           push	r14
45a2:	  0f12           push	r15
45a4:	  2312           push	#0x2
45a6:	  b012 4c45      call	#0x454c <INT>
45aa:	  3150 0600      add	#0x6, sp
45ae:	  3041           ret
	45b0 <puts>
45b0:	  0b12           push	r11
45b2:	  0b4f           mov	r15, r11
45b4:	  073c           jmp	#0x45c4 <puts+0x14>
45b6:	  1b53           inc	r11
45b8:	  8f11           sxt	r15
45ba:	  0f12           push	r15
45bc:	  0312           push	#0x0
45be:	  b012 4c45      call	#0x454c <INT>
45c2:	  2152           add	#0x4, sp
45c4:	  6f4b           mov.b	@r11, r15
45c6:	  4f93           tst.b	r15
45c8:	  f623           jnz	#0x45b6 <puts+0x6>
45ca:	  3012 0a00      push	#0xa
45ce:	  0312           push	#0x0
45d0:	  b012 4c45      call	#0x454c <INT>
45d4:	  2152           add	#0x4, sp
45d6:	  0f43           clr	r15
45d8:	  3b41           pop	r11
45da:	  3041           ret
	45dc <strcpy>
45dc:	  0d4f           mov	r15, r13
45de:	  023c           jmp	#0x45e4 <strcpy+0x8>
45e0:	  1e53           inc	r14
45e2:	  1d53           inc	r13
45e4:	  6c4e           mov.b	@r14, r12
45e6:	  cd4c 0000      mov.b	r12, 0x0(r13)
45ea:	  4c93           tst.b	r12
45ec:	  f923           jnz	#0x45e0 <strcpy+0x4>
45ee:	  3041           ret
	45f0 <memset>
45f0:	  0b12           push	r11
45f2:	  0a12           push	r10
45f4:	  0912           push	r9
45f6:	  0812           push	r8
45f8:	  0b4f           mov	r15, r11
45fa:	  3d90 0600      cmp	#0x6, r13
45fe:	  082c           jc	#0x4610 <memset+0x20>
4600:	  043c           jmp	#0x460a <memset+0x1a>
4602:	  cb4e 0000      mov.b	r14, 0x0(r11)
4606:	  1b53           inc	r11
4608:	  3d53           add	#-0x1, r13
460a:	  0d93           tst	r13
460c:	  fa23           jnz	#0x4602 <memset+0x12>
460e:	  1e3c           jmp	#0x464c <memset+0x5c>
4610:	  4a4e           mov.b	r14, r10
4612:	  0a93           tst	r10
4614:	  0324           jz	#0x461c <memset+0x2c>
4616:	  0c4a           mov	r10, r12
4618:	  8c10           swpb	r12
461a:	  0adc           bis	r12, r10
461c:	  1fb3           bit	#0x1, r15
461e:	  0524           jz	#0x462a <memset+0x3a>
4620:	  3d53           add	#-0x1, r13
4622:	  cf4e 0000      mov.b	r14, 0x0(r15)
4626:	  0b4f           mov	r15, r11
4628:	  1b53           inc	r11
462a:	  0c4d           mov	r13, r12
462c:	  12c3           clrc
462e:	  0c10           rrc	r12
4630:	  084b           mov	r11, r8
4632:	  094c           mov	r12, r9
4634:	  884a 0000      mov	r10, 0x0(r8)
4638:	  2853           incd	r8
463a:	  3953           add	#-0x1, r9
463c:	  fb23           jnz	#0x4634 <memset+0x44>
463e:	  0c5c           add	r12, r12
4640:	  0c5b           add	r11, r12
4642:	  1df3           and	#0x1, r13
4644:	  0d99           cmp	r9, r13
4646:	  0224           jeq	#0x464c <memset+0x5c>
4648:	  cc4e 0000      mov.b	r14, 0x0(r12)
464c:	  3841           pop	r8
464e:	  3941           pop	r9
4650:	  3a41           pop	r10
4652:	  3b41           pop	r11
4654:	  3041           ret
	4656 <_unexpected_>
4656:	  0013           reti	pc
