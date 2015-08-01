0010 <__trap_interrupt>
0010:  3041           ret
4400 <__init_stack>
4400:  3140 0044      mov	#0x4400, sp
4404 <__low_level_init>
4404:  1542 5c01      mov	&0x015c, r5
4408:  75f3           and.b	#-0x1, r5
440a:  35d0 085a      bis	#0x5a08, r5
440e <__do_copy_data>
440e:  3f40 0400      mov	#0x4, r15
4412:  0f93           tst	r15
4414:  0724           jz	#0x4424 <__do_clear_bss+0x0>
4416:  8245 5c01      mov	r5, &0x015c
441a:  2f83           decd	r15
441c:  9f4f 6a47 0024 mov	0x476a(r15), 0x2400(r15)
4422:  f923           jnz	#0x4416 <__do_copy_data+0x8>
4424 <__do_clear_bss>
4424:  3f40 6400      mov	#0x64, r15
4428:  0f93           tst	r15
442a:  0624           jz	#0x4438 <main+0x0>
442c:  8245 5c01      mov	r5, &0x015c
4430:  1f83           dec	r15
4432:  cf43 0424      mov.b	#0x0, 0x2404(r15)
4436:  fa23           jnz	#0x442c <__do_clear_bss+0x8>
4438 <main>
4438:  3150 ceff      add	#0xffce, sp
443c:  b012 5045      call	#0x4550 <login>
4440 <__stop_progExec__>
4440:  32d0 f000      bis	#0xf0, sr
4444:  fd3f           jmp	#0x4440 <__stop_progExec__+0x0>
4446 <__ctors_end>
4446:  3040 6847      br	#0x4768 <_unexpected_>
444a <unlock_door>
444a:  3012 7f00      push	#0x7f
444e:  b012 c446      call	#0x46c4 <INT>
4452:  2153           incd	sp
4454:  3041           ret
4456 <test_username_and_password_valid>
4456:  0412           push	r4
4458:  0441           mov	sp, r4
445a:  2453           incd	r4
445c:  2183           decd	sp
445e:  c443 fcff      mov.b	#0x0, -0x4(r4)
4462:  3d40 fcff      mov	#0xfffc, r13
4466:  0d54           add	r4, r13
4468:  0d12           push	r13
446a:  0e12           push	r14
446c:  0f12           push	r15
446e:  3012 7d00      push	#0x7d
4472:  b012 c446      call	#0x46c4 <INT>
4476:  5f44 fcff      mov.b	-0x4(r4), r15
447a:  8f11           sxt	r15
447c:  3150 0a00      add	#0xa, sp
4480:  3441           pop	r4
4482:  3041           ret
4484 .strings:
4484: "Authentication now requires a username and password."
44b9: "Remember: both are between 8 and 16 characters."
44e9: "Please enter your username:"
4505: "Please enter your password:"
4521: "Access granted."
4531: "That password is not correct."
454f: ""
4550 <login>
4550:  0b12           push	r11
4552:  0412           push	r4
4554:  0441           mov	sp, r4
4556:  2452           add	#0x4, r4
4558:  3150 d8ff      add	#0xffd8, sp
455c:  c443 faff      mov.b	#0x0, -0x6(r4)
4560:  f442 e7ff      mov.b	#0x8, -0x19(r4)
4564:  f440 1000 e8ff mov.b	#0x10, -0x18(r4)
456a:  3f40 8444      mov	#0x4484 "Authentication now requires a username and password.", r15
456e:  b012 2847      call	#0x4728 <puts>
4572:  3f40 b944      mov	#0x44b9 "Remember: both are between 8 and 16 characters.", r15
4576:  b012 2847      call	#0x4728 <puts>
457a:  3f40 e944      mov	#0x44e9 "Please enter your username:", r15
457e:  b012 2847      call	#0x4728 <puts>
4582:  3e40 6300      mov	#0x63, r14
4586:  3f40 0424      mov	#0x2404, r15
458a:  b012 1847      call	#0x4718 <getsn>
458e:  3f40 0424      mov	#0x2404, r15
4592:  b012 2847      call	#0x4728 <puts>
4596:  3e40 0424      mov	#0x2404, r14
459a:  0f44           mov	r4, r15
459c:  3f50 d6ff      add	#0xffd6, r15
45a0:  b012 5447      call	#0x4754 <strcpy>
45a4:  3f40 0545      mov	#0x4505 "Please enter your password:", r15
45a8:  b012 2847      call	#0x4728 <puts>
45ac:  3e40 6300      mov	#0x63, r14
45b0:  3f40 0424      mov	#0x2404, r15
45b4:  b012 1847      call	#0x4718 <getsn>
45b8:  3f40 0424      mov	#0x2404, r15
45bc:  b012 2847      call	#0x4728 <puts>
45c0:  0b44           mov	r4, r11
45c2:  3b50 e9ff      add	#0xffe9, r11
45c6:  3e40 0424      mov	#0x2404, r14
45ca:  0f4b           mov	r11, r15
45cc:  b012 5447      call	#0x4754 <strcpy>
45d0:  0f4b           mov	r11, r15
45d2:  0e44           mov	r4, r14
45d4:  3e50 e8ff      add	#0xffe8, r14
45d8:  1e53           inc	r14
45da:  ce93 0000      tst.b	0x0(r14)
45de:  fc23           jnz	#0x45d8 <login+0x88>
45e0:  0b4e           mov	r14, r11
45e2:  0b8f           sub	r15, r11
45e4:  5f44 e8ff      mov.b	-0x18(r4), r15
45e8:  8f11           sxt	r15
45ea:  0b9f           cmp	r15, r11
45ec:  0628           jnc	#0x45fa <login+0xaa>
45ee:  1f42 0024      mov	&0x2400, r15
45f2:  b012 2847      call	#0x4728 <puts>
45f6:  3040 4044      br	#0x4440 <__stop_progExec__>
45fa:  5f44 e7ff      mov.b	-0x19(r4), r15
45fe:  8f11           sxt	r15
4600:  0b9f           cmp	r15, r11
4602:  062c           jc	#0x4610 <login+0xc0>
4604:  1f42 0224      mov	&0x2402, r15
4608:  b012 2847      call	#0x4728 <puts>
460c:  3040 4044      br	#0x4440 <__stop_progExec__>
4610:  c443 d4ff      mov.b	#0x0, -0x2c(r4)
4614:  3f40 d4ff      mov	#0xffd4, r15
4618:  0f54           add	r4, r15
461a:  0f12           push	r15
461c:  0f44           mov	r4, r15
461e:  3f50 e9ff      add	#0xffe9, r15
4622:  0f12           push	r15
4624:  3f50 edff      add	#0xffed, r15
4628:  0f12           push	r15
462a:  3012 7d00      push	#0x7d
462e:  b012 c446      call	#0x46c4 <INT>
4632:  3152           add	#0x8, sp
4634:  c493 d4ff      tst.b	-0x2c(r4)
4638:  0524           jz	#0x4644 <login+0xf4>
463a:  b012 4a44      call	#0x444a <unlock_door>
463e:  3f40 2145      mov	#0x4521 "Access granted.", r15
4642:  023c           jmp	#0x4648 <login+0xf8>
4644:  3f40 3145      mov	#0x4531 "That password is not correct.", r15
4648:  b012 2847      call	#0x4728 <puts>
464c:  c493 faff      tst.b	-0x6(r4)
4650:  0624           jz	#0x465e <login+0x10e>
4652:  1f42 0024      mov	&0x2400, r15
4656:  b012 2847      call	#0x4728 <puts>
465a:  3040 4044      br	#0x4440 <__stop_progExec__>
465e:  3150 2800      add	#0x28, sp
4662:  3441           pop	r4
4664:  3b41           pop	r11
4666:  3041           ret
4668 <__do_nothing>
4668:  3041           ret
466a:  496e           addc.b	r14, r9
466c:  7661           addc.b	@sp+, r6
466e:  6c69           addc.b	@r9, r12
4670:  6420           jnz	#0x473a <puts+0x12>
4672:  5061 7373      addc.b	0x7373(sp), pc
4676:  776f           addc.b	@r15+, r7
4678:  7264           addc.b	@r4+, sr
467a:  204c           br	@r12
467c:  656e           addc.b	@r14, r5
467e:  6774           subc.b	@r4, r7
4680:  683a           jl	#0x4352 <__none__+0x4352>
4682:  2070           subc	@pc, pc
4684:  6173           subc.b	#0x2, sp
4686:  7377           .word	0x7773
4688:  6f72           subc.b	#0x4, r15
468a:  6420           jnz	#0x4754 <strcpy+0x0>
468c:  746f           addc.b	@r15+, r4
468e:  6f20           jnz	#0x476e <_unexpected_+0x6>
4690:  6c6f           addc.b	@r15, r12
4692:  6e67           addc.b	@r7, r14
4694:  2e00           .word	0x002e
4696:  496e           addc.b	r14, r9
4698:  7661           addc.b	@sp+, r6
469a:  6c69           addc.b	@r9, r12
469c:  6420           jnz	#0x4766 <strcpy+0x12>
469e:  5061 7373      addc.b	0x7373(sp), pc
46a2:  776f           addc.b	@r15+, r7
46a4:  7264           addc.b	@r4+, sr
46a6:  204c           br	@r12
46a8:  656e           addc.b	@r14, r5
46aa:  6774           subc.b	@r4, r7
46ac:  683a           jl	#0x437e <__none__+0x437e>
46ae:  2070           subc	@pc, pc
46b0:  6173           subc.b	#0x2, sp
46b2:  7377           .word	0x7773
46b4:  6f72           subc.b	#0x4, r15
46b6:  6420           jnz	#0x4780 <_unexpected_+0x18>
46b8:  746f           addc.b	@r15+, r4
46ba:  6f20           jnz	#0x479a <_unexpected_+0x32>
46bc:  7368           .word	0x6873
46be:  6f72           subc.b	#0x4, r15
46c0:  742e           jc	#0x43aa <__none__+0x43aa>
...
46c4 <INT>
46c4:  1e41 0200      mov	0x2(sp), r14
46c8:  0212           push	sr
46ca:  0f4e           mov	r14, r15
46cc:  8f10           swpb	r15
46ce:  024f           mov	r15, sr
46d0:  32d0 0080      bis	#0x8000, sr
46d4:  b012 1000      call	#0x10
46d8:  3241           pop	sr
46da:  3041           ret
46dc <putchar>
46dc:  2183           decd	sp
46de:  0f12           push	r15
46e0:  0312           push	#0x0
46e2:  814f 0400      mov	r15, 0x4(sp)
46e6:  b012 c446      call	#0x46c4 <INT>
46ea:  1f41 0400      mov	0x4(sp), r15
46ee:  3150 0600      add	#0x6, sp
46f2:  3041           ret
46f4 <getchar>
46f4:  0412           push	r4
46f6:  0441           mov	sp, r4
46f8:  2453           incd	r4
46fa:  2183           decd	sp
46fc:  3f40 fcff      mov	#0xfffc, r15
4700:  0f54           add	r4, r15
4702:  0f12           push	r15
4704:  1312           push	#0x1
4706:  b012 c446      call	#0x46c4 <INT>
470a:  5f44 fcff      mov.b	-0x4(r4), r15
470e:  8f11           sxt	r15
4710:  3150 0600      add	#0x6, sp
4714:  3441           pop	r4
4716:  3041           ret
4718 <getsn>
4718:  0e12           push	r14
471a:  0f12           push	r15
471c:  2312           push	#0x2
471e:  b012 c446      call	#0x46c4 <INT>
4722:  3150 0600      add	#0x6, sp
4726:  3041           ret
4728 <puts>
4728:  0b12           push	r11
472a:  0b4f           mov	r15, r11
472c:  073c           jmp	#0x473c <puts+0x14>
472e:  1b53           inc	r11
4730:  8f11           sxt	r15
4732:  0f12           push	r15
4734:  0312           push	#0x0
4736:  b012 c446      call	#0x46c4 <INT>
473a:  2152           add	#0x4, sp
473c:  6f4b           mov.b	@r11, r15
473e:  4f93           tst.b	r15
4740:  f623           jnz	#0x472e <puts+0x6>
4742:  3012 0a00      push	#0xa
4746:  0312           push	#0x0
4748:  b012 c446      call	#0x46c4 <INT>
474c:  2152           add	#0x4, sp
474e:  0f43           clr	r15
4750:  3b41           pop	r11
4752:  3041           ret
4754 <strcpy>
4754:  0d4f           mov	r15, r13
4756:  023c           jmp	#0x475c <strcpy+0x8>
4758:  1e53           inc	r14
475a:  1d53           inc	r13
475c:  6c4e           mov.b	@r14, r12
475e:  cd4c 0000      mov.b	r12, 0x0(r13)
4762:  4c93           tst.b	r12
4764:  f923           jnz	#0x4758 <strcpy+0x4>
4766:  3041           ret
4768 <_unexpected_>
4768:  0013           reti	pc
