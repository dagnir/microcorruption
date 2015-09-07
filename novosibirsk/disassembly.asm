0010 <__trap_interrupt>
0010:  3041           ret
4400 <__init_stack>
4400:  3140 0044      mov	#0x4400, sp
4404 <__low_level_init>
4404:  1542 5c01      mov	&0x015c, r5
4408:  75f3           and.b	#-0x1, r5
440a:  35d0 085a      bis	#0x5a08, r5
440e <__do_copy_data>
440e:  3f40 0000      clr	r15
4412:  0f93           tst	r15
4414:  0724           jz	#0x4424 <__do_clear_bss+0x0>
4416:  8245 5c01      mov	r5, &0x015c
441a:  2f83           decd	r15
441c:  9f4f f246 0024 mov	0x46f2(r15), 0x2400(r15)
4422:  f923           jnz	#0x4416 <__do_copy_data+0x8>
4424 <__do_clear_bss>
4424:  3f40 f401      mov	#0x1f4, r15
4428:  0f93           tst	r15
442a:  0624           jz	#0x4438 <main+0x0>
442c:  8245 5c01      mov	r5, &0x015c
4430:  1f83           dec	r15
4432:  cf43 0024      mov.b	#0x0, 0x2400(r15)
4436:  fa23           jnz	#0x442c <__do_clear_bss+0x8>
4438 <main>
4438:  0441           mov	sp, r4
443a:  2453           incd	r4
443c:  3150 0cfe      add	#0xfe0c, sp
4440:  3012 da44      push	#0x44da "Enter your username below to authenticate.\n"
4444:  b012 c645      call	#0x45c6 <printf>
4448:  b140 0645 0000 mov	#0x4506 ">> ", 0x0(sp)
444e:  b012 c645      call	#0x45c6 <printf>
4452:  2153           incd	sp
4454:  3e40 f401      mov	#0x1f4, r14
4458:  3f40 0024      mov	#0x2400, r15
445c:  b012 8a45      call	#0x458a <getsn>
4460:  3e40 0024      mov	#0x2400, r14
4464:  0f44           mov	r4, r15
4466:  3f50 0afe      add	#0xfe0a, r15
446a:  b012 dc46      call	#0x46dc <strcpy>
446e:  3f40 0afe      mov	#0xfe0a, r15
4472:  0f54           add	r4, r15
4474:  0f12           push	r15
4476:  b012 c645      call	#0x45c6 <printf>
447a:  2153           incd	sp
447c:  3f40 0a00      mov	#0xa, r15
4480:  b012 4e45      call	#0x454e <putchar>
4484:  0f44           mov	r4, r15
4486:  3f50 0afe      add	#0xfe0a, r15
448a:  b012 b044      call	#0x44b0 <conditional_unlock_door>
448e:  0f93           tst	r15
4490:  0324           jz	#0x4498 <main+0x60>
4492:  3012 0a45      push	#0x450a "Access Granted!"
4496:  023c           jmp	#0x449c <main+0x64>
4498:  3012 1a45      push	#0x451a "That username is not valid."
449c:  b012 c645      call	#0x45c6 <printf>
44a0:  0f43           clr	r15
44a2:  3150 f601      add	#0x1f6, sp
44a6 <__stop_progExec__>
44a6:  32d0 f000      bis	#0xf0, sr
44aa:  fd3f           jmp	#0x44a6 <__stop_progExec__+0x0>
44ac <__ctors_end>
44ac:  3040 f046      br	#0x46f0 <_unexpected_>
44b0 <conditional_unlock_door>
44b0:  0412           push	r4
44b2:  0441           mov	sp, r4
44b4:  2453           incd	r4
44b6:  2183           decd	sp
44b8:  c443 fcff      mov.b	#0x0, -0x4(r4)
44bc:  3e40 fcff      mov	#0xfffc, r14
44c0:  0e54           add	r4, r14
44c2:  0e12           push	r14
44c4:  0f12           push	r15
44c6:  3012 7e00      push	#0x7e
44ca:  b012 3645      call	#0x4536 <INT>
44ce:  5f44 fcff      mov.b	-0x4(r4), r15
44d2:  8f11           sxt	r15
44d4:  3152           add	#0x8, sp
44d6:  3441           pop	r4
44d8:  3041           ret
44da .strings:
44da: "Enter your username below to authenticate.\n"
4506: ">> "
450a: "Access Granted!"
451a: "That username is not valid."
4536 <INT>
4536:  1e41 0200      mov	0x2(sp), r14
453a:  0212           push	sr
453c:  0f4e           mov	r14, r15
453e:  8f10           swpb	r15
4540:  024f           mov	r15, sr
4542:  32d0 0080      bis	#0x8000, sr
4546:  b012 1000      call	#0x10
454a:  3241           pop	sr
454c:  3041           ret
454e <putchar>
454e:  2183           decd	sp
4550:  0f12           push	r15
4552:  0312           push	#0x0
4554:  814f 0400      mov	r15, 0x4(sp)
4558:  b012 3645      call	#0x4536 <INT>
455c:  1f41 0400      mov	0x4(sp), r15
4560:  3150 0600      add	#0x6, sp
4564:  3041           ret
4566 <getchar>
4566:  0412           push	r4
4568:  0441           mov	sp, r4
456a:  2453           incd	r4
456c:  2183           decd	sp
456e:  3f40 fcff      mov	#0xfffc, r15
4572:  0f54           add	r4, r15
4574:  0f12           push	r15
4576:  1312           push	#0x1
4578:  b012 3645      call	#0x4536 <INT>
457c:  5f44 fcff      mov.b	-0x4(r4), r15
4580:  8f11           sxt	r15
4582:  3150 0600      add	#0x6, sp
4586:  3441           pop	r4
4588:  3041           ret
458a <getsn>
458a:  0e12           push	r14
458c:  0f12           push	r15
458e:  2312           push	#0x2
4590:  b012 3645      call	#0x4536 <INT>
4594:  3150 0600      add	#0x6, sp
4598:  3041           ret
459a <puts>
459a:  0b12           push	r11
459c:  0b4f           mov	r15, r11
459e:  073c           jmp	#0x45ae <puts+0x14>
45a0:  1b53           inc	r11
45a2:  8f11           sxt	r15
45a4:  0f12           push	r15
45a6:  0312           push	#0x0
45a8:  b012 3645      call	#0x4536 <INT>
45ac:  2152           add	#0x4, sp
45ae:  6f4b           mov.b	@r11, r15
45b0:  4f93           tst.b	r15
45b2:  f623           jnz	#0x45a0 <puts+0x6>
45b4:  3012 0a00      push	#0xa
45b8:  0312           push	#0x0
45ba:  b012 3645      call	#0x4536 <INT>
45be:  2152           add	#0x4, sp
45c0:  0f43           clr	r15
45c2:  3b41           pop	r11
45c4:  3041           ret
45c6 <printf>
45c6:  0b12           push	r11
45c8:  0a12           push	r10
45ca:  0912           push	r9
45cc:  0812           push	r8
45ce:  0712           push	r7
45d0:  0412           push	r4
45d2:  0441           mov	sp, r4
45d4:  3450 0c00      add	#0xc, r4
45d8:  2183           decd	sp
45da:  1b44 0200      mov	0x2(r4), r11
45de:  8441 f2ff      mov	sp, -0xe(r4)
45e2:  0f4b           mov	r11, r15
45e4:  0e43           clr	r14
45e6:  0b3c           jmp	#0x45fe <printf+0x38>
45e8:  1f53           inc	r15
45ea:  7d90 2500      cmp.b	#0x25, r13
45ee:  0720           jne	#0x45fe <printf+0x38>
45f0:  6d9f           cmp.b	@r15, r13
45f2:  0320           jne	#0x45fa <printf+0x34>
45f4:  1f53           inc	r15
45f6:  0d43           clr	r13
45f8:  013c           jmp	#0x45fc <printf+0x36>
45fa:  1d43           mov	#0x1, r13
45fc:  0e5d           add	r13, r14
45fe:  6d4f           mov.b	@r15, r13
4600:  4d93           tst.b	r13
4602:  f223           jnz	#0x45e8 <printf+0x22>
4604:  0f4e           mov	r14, r15
4606:  0f5f           add	r15, r15
4608:  2f53           incd	r15
460a:  018f           sub	r15, sp
460c:  0941           mov	sp, r9
460e:  0c44           mov	r4, r12
4610:  2c52           add	#0x4, r12
4612:  0f41           mov	sp, r15
4614:  0d43           clr	r13
4616:  053c           jmp	#0x4622 <printf+0x5c>
4618:  af4c 0000      mov	@r12, 0x0(r15)
461c:  1d53           inc	r13
461e:  2f53           incd	r15
4620:  2c53           incd	r12
4622:  0d9e           cmp	r14, r13
4624:  f93b           jl	#0x4618 <printf+0x52>
4626:  0a43           clr	r10
4628:  3740 0900      mov	#0x9, r7
462c:  4a3c           jmp	#0x46c2 <printf+0xfc>
462e:  084b           mov	r11, r8
4630:  1853           inc	r8
4632:  7f90 2500      cmp.b	#0x25, r15
4636:  0624           jeq	#0x4644 <printf+0x7e>
4638:  1a53           inc	r10
463a:  0b48           mov	r8, r11
463c:  8f11           sxt	r15
463e:  b012 4e45      call	#0x454e <putchar>
4642:  3f3c           jmp	#0x46c2 <printf+0xfc>
4644:  6e48           mov.b	@r8, r14
4646:  4e9f           cmp.b	r15, r14
4648:  0620           jne	#0x4656 <printf+0x90>
464a:  1a53           inc	r10
464c:  3f40 2500      mov	#0x25, r15
4650:  b012 4e45      call	#0x454e <putchar>
4654:  333c           jmp	#0x46bc <printf+0xf6>
4656:  7e90 7300      cmp.b	#0x73, r14
465a:  0b20           jne	#0x4672 <printf+0xac>
465c:  2b49           mov	@r9, r11
465e:  053c           jmp	#0x466a <printf+0xa4>
4660:  1a53           inc	r10
4662:  1b53           inc	r11
4664:  8f11           sxt	r15
4666:  b012 4e45      call	#0x454e <putchar>
466a:  6f4b           mov.b	@r11, r15
466c:  4f93           tst.b	r15
466e:  f823           jnz	#0x4660 <printf+0x9a>
4670:  253c           jmp	#0x46bc <printf+0xf6>
4672:  7e90 7800      cmp.b	#0x78, r14
4676:  1c20           jne	#0x46b0 <printf+0xea>
4678:  2b49           mov	@r9, r11
467a:  173c           jmp	#0x46aa <printf+0xe4>
467c:  0f4b           mov	r11, r15
467e:  8f10           swpb	r15
4680:  3ff0 ff00      and	#0xff, r15
4684:  12c3           clrc
4686:  0f10           rrc	r15
4688:  0f11           rra	r15
468a:  0f11           rra	r15
468c:  0f11           rra	r15
468e:  1a53           inc	r10
4690:  079f           cmp	r15, r7
4692:  0338           jl	#0x469a <printf+0xd4>
4694:  3f50 3000      add	#0x30, r15
4698:  023c           jmp	#0x469e <printf+0xd8>
469a:  3f50 5700      add	#0x57, r15
469e:  b012 4e45      call	#0x454e <putchar>
46a2:  0b5b           add	r11, r11
46a4:  0b5b           add	r11, r11
46a6:  0b5b           add	r11, r11
46a8:  0b5b           add	r11, r11
46aa:  0b93           tst	r11
46ac:  e723           jnz	#0x467c <printf+0xb6>
46ae:  063c           jmp	#0x46bc <printf+0xf6>
46b0:  7e90 6e00      cmp.b	#0x6e, r14
46b4:  0320           jne	#0x46bc <printf+0xf6>
46b6:  2f49           mov	@r9, r15
46b8:  8f4a 0000      mov	r10, 0x0(r15)
46bc:  2953           incd	r9
46be:  0b48           mov	r8, r11
46c0:  1b53           inc	r11
46c2:  6f4b           mov.b	@r11, r15
46c4:  4f93           tst.b	r15
46c6:  b323           jnz	#0x462e <printf+0x68>
46c8:  1144 f2ff      mov	-0xe(r4), sp
46cc:  2153           incd	sp
46ce:  3441           pop	r4
46d0:  3741           pop	r7
46d2:  3841           pop	r8
46d4:  3941           pop	r9
46d6:  3a41           pop	r10
46d8:  3b41           pop	r11
46da:  3041           ret
46dc <strcpy>
46dc:  0d4f           mov	r15, r13
46de:  023c           jmp	#0x46e4 <strcpy+0x8>
46e0:  1e53           inc	r14
46e2:  1d53           inc	r13
46e4:  6c4e           mov.b	@r14, r12
46e6:  cd4c 0000      mov.b	r12, 0x0(r13)
46ea:  4c93           tst.b	r12
46ec:  f923           jnz	#0x46e0 <strcpy+0x4>
46ee:  3041           ret
46f0 <_unexpected_>
46f0:  0013           reti	pc
