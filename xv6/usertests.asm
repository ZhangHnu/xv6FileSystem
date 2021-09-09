
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return randstate;
}

int
main(int argc, char *argv[])
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 e4 f0             	and    $0xfffffff0,%esp
       6:	83 ec 10             	sub    $0x10,%esp
  printf(1, "usertests starting\n");
       9:	c7 44 24 04 be 50 00 	movl   $0x50be,0x4(%esp)
      10:	00 
      11:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
      18:	e8 d3 3d 00 00       	call   3df0 <printf>

  if(open("usertests.ran", 0) >= 0){
      1d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
      24:	00 
      25:	c7 04 24 d2 50 00 00 	movl   $0x50d2,(%esp)
      2c:	e8 a3 3c 00 00       	call   3cd4 <open>
      31:	85 c0                	test   %eax,%eax
      33:	78 19                	js     4e <main+0x4e>
    printf(1, "already ran user tests -- rebuild fs.img\n");
      35:	c7 44 24 04 3c 58 00 	movl   $0x583c,0x4(%esp)
      3c:	00 
      3d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
      44:	e8 a7 3d 00 00       	call   3df0 <printf>
    exit();
      49:	e8 46 3c 00 00       	call   3c94 <exit>
  }
  close(open("usertests.ran", O_CREATE));
      4e:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
      55:	00 
      56:	c7 04 24 d2 50 00 00 	movl   $0x50d2,(%esp)
      5d:	e8 72 3c 00 00       	call   3cd4 <open>
      62:	89 04 24             	mov    %eax,(%esp)
      65:	e8 52 3c 00 00       	call   3cbc <close>

  argptest();
      6a:	e8 51 39 00 00       	call   39c0 <argptest>
  createdelete();
      6f:	e8 6c 12 00 00       	call   12e0 <createdelete>
  linkunlink();
      74:	e8 f7 1b 00 00       	call   1c70 <linkunlink>
  concreate();
      79:	e8 d2 18 00 00       	call   1950 <concreate>
      7e:	66 90                	xchg   %ax,%ax
  fourfiles();
      80:	e8 3b 10 00 00       	call   10c0 <fourfiles>
  sharedfd();
      85:	e8 76 0e 00 00       	call   f00 <sharedfd>

  bigargtest();
      8a:	e8 91 35 00 00       	call   3620 <bigargtest>
      8f:	90                   	nop
  bigwrite();
      90:	e8 cb 25 00 00       	call   2660 <bigwrite>
  bigargtest();
      95:	e8 86 35 00 00       	call   3620 <bigargtest>
  bsstest();
      9a:	e8 01 35 00 00       	call   35a0 <bsstest>
      9f:	90                   	nop
  sbrktest();
      a0:	e8 db 2f 00 00       	call   3080 <sbrktest>
  validatetest();
      a5:	e8 46 34 00 00       	call   34f0 <validatetest>

  opentest();
      aa:	e8 61 03 00 00       	call   410 <opentest>
      af:	90                   	nop
  writetest();
      b0:	e8 fb 03 00 00       	call   4b0 <writetest>
  writetest1();
      b5:	e8 06 06 00 00       	call   6c0 <writetest1>
  createtest();
      ba:	e8 f1 07 00 00       	call   8b0 <createtest>
      bf:	90                   	nop

  openiputtest();
      c0:	e8 3b 02 00 00       	call   300 <openiputtest>
  exitiputtest();
      c5:	e8 46 01 00 00       	call   210 <exitiputtest>
  iputtest();
      ca:	e8 61 00 00 00       	call   130 <iputtest>
      cf:	90                   	nop

  mem();
      d0:	e8 5b 0d 00 00       	call   e30 <mem>
  pipe1();
      d5:	e8 b6 09 00 00       	call   a90 <pipe1>
  preempt();
      da:	e8 61 0b 00 00       	call   c40 <preempt>
      df:	90                   	nop
  exitwait();
      e0:	e8 bb 0c 00 00       	call   da0 <exitwait>

  rmdot();
      e5:	e8 d6 29 00 00       	call   2ac0 <rmdot>
  fourteen();
      ea:	e8 71 28 00 00       	call   2960 <fourteen>
      ef:	90                   	nop
  bigfile();
      f0:	e8 6b 26 00 00       	call   2760 <bigfile>
  subdir();
      f5:	e8 d6 1d 00 00       	call   1ed0 <subdir>
  linktest();
      fa:	e8 f1 15 00 00       	call   16f0 <linktest>
      ff:	90                   	nop
  unlinkread();
     100:	e8 1b 14 00 00       	call   1520 <unlinkread>
  dirfile();
     105:	e8 46 2b 00 00       	call   2c50 <dirfile>
  iref();
     10a:	e8 81 2d 00 00       	call   2e90 <iref>
     10f:	90                   	nop
  forktest();
     110:	e8 9b 2e 00 00       	call   2fb0 <forktest>
  bigdir(); // slow
     115:	e8 66 1c 00 00       	call   1d80 <bigdir>

  uio();
     11a:	e8 11 38 00 00       	call   3930 <uio>
     11f:	90                   	nop

  exectest();
     120:	e8 1b 09 00 00       	call   a40 <exectest>

  exit();
     125:	e8 6a 3b 00 00       	call   3c94 <exit>
     12a:	90                   	nop
     12b:	90                   	nop
     12c:	90                   	nop
     12d:	90                   	nop
     12e:	90                   	nop
     12f:	90                   	nop

00000130 <iputtest>:
int stdout = 1;

// does chdir() call iput(p->cwd) in a transaction?
void
iputtest(void)
{
     130:	55                   	push   %ebp
     131:	89 e5                	mov    %esp,%ebp
     133:	83 ec 18             	sub    $0x18,%esp
  printf(stdout, "iput test\n");
     136:	a1 70 61 00 00       	mov    0x6170,%eax
     13b:	c7 44 24 04 64 41 00 	movl   $0x4164,0x4(%esp)
     142:	00 
     143:	89 04 24             	mov    %eax,(%esp)
     146:	e8 a5 3c 00 00       	call   3df0 <printf>

  if(mkdir("iputdir") < 0){
     14b:	c7 04 24 f7 40 00 00 	movl   $0x40f7,(%esp)
     152:	e8 a5 3b 00 00       	call   3cfc <mkdir>
     157:	85 c0                	test   %eax,%eax
     159:	78 4b                	js     1a6 <iputtest+0x76>
    printf(stdout, "mkdir failed\n");
    exit();
  }
  if(chdir("iputdir") < 0){
     15b:	c7 04 24 f7 40 00 00 	movl   $0x40f7,(%esp)
     162:	e8 9d 3b 00 00       	call   3d04 <chdir>
     167:	85 c0                	test   %eax,%eax
     169:	0f 88 85 00 00 00    	js     1f4 <iputtest+0xc4>
    printf(stdout, "chdir iputdir failed\n");
    exit();
  }
  if(unlink("../iputdir") < 0){
     16f:	c7 04 24 f4 40 00 00 	movl   $0x40f4,(%esp)
     176:	e8 69 3b 00 00       	call   3ce4 <unlink>
     17b:	85 c0                	test   %eax,%eax
     17d:	78 5b                	js     1da <iputtest+0xaa>
    printf(stdout, "unlink ../iputdir failed\n");
    exit();
  }
  if(chdir("/") < 0){
     17f:	c7 04 24 19 41 00 00 	movl   $0x4119,(%esp)
     186:	e8 79 3b 00 00       	call   3d04 <chdir>
     18b:	85 c0                	test   %eax,%eax
     18d:	78 31                	js     1c0 <iputtest+0x90>
    printf(stdout, "chdir / failed\n");
    exit();
  }
  printf(stdout, "iput test ok\n");
     18f:	a1 70 61 00 00       	mov    0x6170,%eax
     194:	c7 44 24 04 9c 41 00 	movl   $0x419c,0x4(%esp)
     19b:	00 
     19c:	89 04 24             	mov    %eax,(%esp)
     19f:	e8 4c 3c 00 00       	call   3df0 <printf>
}
     1a4:	c9                   	leave  
     1a5:	c3                   	ret    
iputtest(void)
{
  printf(stdout, "iput test\n");

  if(mkdir("iputdir") < 0){
    printf(stdout, "mkdir failed\n");
     1a6:	a1 70 61 00 00       	mov    0x6170,%eax
     1ab:	c7 44 24 04 d0 40 00 	movl   $0x40d0,0x4(%esp)
     1b2:	00 
     1b3:	89 04 24             	mov    %eax,(%esp)
     1b6:	e8 35 3c 00 00       	call   3df0 <printf>
    exit();
     1bb:	e8 d4 3a 00 00       	call   3c94 <exit>
  if(unlink("../iputdir") < 0){
    printf(stdout, "unlink ../iputdir failed\n");
    exit();
  }
  if(chdir("/") < 0){
    printf(stdout, "chdir / failed\n");
     1c0:	a1 70 61 00 00       	mov    0x6170,%eax
     1c5:	c7 44 24 04 1b 41 00 	movl   $0x411b,0x4(%esp)
     1cc:	00 
     1cd:	89 04 24             	mov    %eax,(%esp)
     1d0:	e8 1b 3c 00 00       	call   3df0 <printf>
    exit();
     1d5:	e8 ba 3a 00 00       	call   3c94 <exit>
  if(chdir("iputdir") < 0){
    printf(stdout, "chdir iputdir failed\n");
    exit();
  }
  if(unlink("../iputdir") < 0){
    printf(stdout, "unlink ../iputdir failed\n");
     1da:	a1 70 61 00 00       	mov    0x6170,%eax
     1df:	c7 44 24 04 ff 40 00 	movl   $0x40ff,0x4(%esp)
     1e6:	00 
     1e7:	89 04 24             	mov    %eax,(%esp)
     1ea:	e8 01 3c 00 00       	call   3df0 <printf>
    exit();
     1ef:	e8 a0 3a 00 00       	call   3c94 <exit>
  if(mkdir("iputdir") < 0){
    printf(stdout, "mkdir failed\n");
    exit();
  }
  if(chdir("iputdir") < 0){
    printf(stdout, "chdir iputdir failed\n");
     1f4:	a1 70 61 00 00       	mov    0x6170,%eax
     1f9:	c7 44 24 04 de 40 00 	movl   $0x40de,0x4(%esp)
     200:	00 
     201:	89 04 24             	mov    %eax,(%esp)
     204:	e8 e7 3b 00 00       	call   3df0 <printf>
    exit();
     209:	e8 86 3a 00 00       	call   3c94 <exit>
     20e:	66 90                	xchg   %ax,%ax

00000210 <exitiputtest>:
}

// does exit() call iput(p->cwd) in a transaction?
void
exitiputtest(void)
{
     210:	55                   	push   %ebp
     211:	89 e5                	mov    %esp,%ebp
     213:	83 ec 18             	sub    $0x18,%esp
  int pid;

  printf(stdout, "exitiput test\n");
     216:	a1 70 61 00 00       	mov    0x6170,%eax
     21b:	c7 44 24 04 2b 41 00 	movl   $0x412b,0x4(%esp)
     222:	00 
     223:	89 04 24             	mov    %eax,(%esp)
     226:	e8 c5 3b 00 00       	call   3df0 <printf>

  pid = fork();
     22b:	e8 5c 3a 00 00       	call   3c8c <fork>
  if(pid < 0){
     230:	83 f8 00             	cmp    $0x0,%eax
     233:	7c 75                	jl     2aa <exitiputtest+0x9a>
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
     235:	75 39                	jne    270 <exitiputtest+0x60>
    if(mkdir("iputdir") < 0){
     237:	c7 04 24 f7 40 00 00 	movl   $0x40f7,(%esp)
     23e:	e8 b9 3a 00 00       	call   3cfc <mkdir>
     243:	85 c0                	test   %eax,%eax
     245:	0f 88 93 00 00 00    	js     2de <exitiputtest+0xce>
      printf(stdout, "mkdir failed\n");
      exit();
    }
    if(chdir("iputdir") < 0){
     24b:	c7 04 24 f7 40 00 00 	movl   $0x40f7,(%esp)
     252:	e8 ad 3a 00 00       	call   3d04 <chdir>
     257:	85 c0                	test   %eax,%eax
     259:	78 69                	js     2c4 <exitiputtest+0xb4>
      printf(stdout, "child chdir failed\n");
      exit();
    }
    if(unlink("../iputdir") < 0){
     25b:	c7 04 24 f4 40 00 00 	movl   $0x40f4,(%esp)
     262:	e8 7d 3a 00 00       	call   3ce4 <unlink>
     267:	85 c0                	test   %eax,%eax
     269:	78 25                	js     290 <exitiputtest+0x80>
      printf(stdout, "unlink ../iputdir failed\n");
      exit();
    }
    exit();
     26b:	e8 24 3a 00 00       	call   3c94 <exit>
  }
  wait();
     270:	e8 27 3a 00 00       	call   3c9c <wait>
  printf(stdout, "exitiput test ok\n");
     275:	a1 70 61 00 00       	mov    0x6170,%eax
     27a:	c7 44 24 04 4e 41 00 	movl   $0x414e,0x4(%esp)
     281:	00 
     282:	89 04 24             	mov    %eax,(%esp)
     285:	e8 66 3b 00 00       	call   3df0 <printf>
}
     28a:	c9                   	leave  
     28b:	c3                   	ret    
     28c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(chdir("iputdir") < 0){
      printf(stdout, "child chdir failed\n");
      exit();
    }
    if(unlink("../iputdir") < 0){
      printf(stdout, "unlink ../iputdir failed\n");
     290:	a1 70 61 00 00       	mov    0x6170,%eax
     295:	c7 44 24 04 ff 40 00 	movl   $0x40ff,0x4(%esp)
     29c:	00 
     29d:	89 04 24             	mov    %eax,(%esp)
     2a0:	e8 4b 3b 00 00       	call   3df0 <printf>
      exit();
     2a5:	e8 ea 39 00 00       	call   3c94 <exit>

  printf(stdout, "exitiput test\n");

  pid = fork();
  if(pid < 0){
    printf(stdout, "fork failed\n");
     2aa:	a1 70 61 00 00       	mov    0x6170,%eax
     2af:	c7 44 24 04 11 50 00 	movl   $0x5011,0x4(%esp)
     2b6:	00 
     2b7:	89 04 24             	mov    %eax,(%esp)
     2ba:	e8 31 3b 00 00       	call   3df0 <printf>
    exit();
     2bf:	e8 d0 39 00 00       	call   3c94 <exit>
    if(mkdir("iputdir") < 0){
      printf(stdout, "mkdir failed\n");
      exit();
    }
    if(chdir("iputdir") < 0){
      printf(stdout, "child chdir failed\n");
     2c4:	a1 70 61 00 00       	mov    0x6170,%eax
     2c9:	c7 44 24 04 3a 41 00 	movl   $0x413a,0x4(%esp)
     2d0:	00 
     2d1:	89 04 24             	mov    %eax,(%esp)
     2d4:	e8 17 3b 00 00       	call   3df0 <printf>
      exit();
     2d9:	e8 b6 39 00 00       	call   3c94 <exit>
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
    if(mkdir("iputdir") < 0){
      printf(stdout, "mkdir failed\n");
     2de:	a1 70 61 00 00       	mov    0x6170,%eax
     2e3:	c7 44 24 04 d0 40 00 	movl   $0x40d0,0x4(%esp)
     2ea:	00 
     2eb:	89 04 24             	mov    %eax,(%esp)
     2ee:	e8 fd 3a 00 00       	call   3df0 <printf>
      exit();
     2f3:	e8 9c 39 00 00       	call   3c94 <exit>
     2f8:	90                   	nop
     2f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000300 <openiputtest>:
//      for(i = 0; i < 10000; i++)
//        yield();
//    }
void
openiputtest(void)
{
     300:	55                   	push   %ebp
     301:	89 e5                	mov    %esp,%ebp
     303:	83 ec 18             	sub    $0x18,%esp
  int pid;

  printf(stdout, "openiput test\n");
     306:	a1 70 61 00 00       	mov    0x6170,%eax
     30b:	c7 44 24 04 60 41 00 	movl   $0x4160,0x4(%esp)
     312:	00 
     313:	89 04 24             	mov    %eax,(%esp)
     316:	e8 d5 3a 00 00       	call   3df0 <printf>
  if(mkdir("oidir") < 0){
     31b:	c7 04 24 6f 41 00 00 	movl   $0x416f,(%esp)
     322:	e8 d5 39 00 00       	call   3cfc <mkdir>
     327:	85 c0                	test   %eax,%eax
     329:	0f 88 9e 00 00 00    	js     3cd <openiputtest+0xcd>
    printf(stdout, "mkdir oidir failed\n");
    exit();
  }
  pid = fork();
     32f:	e8 58 39 00 00       	call   3c8c <fork>
  if(pid < 0){
     334:	83 f8 00             	cmp    $0x0,%eax
     337:	0f 8c aa 00 00 00    	jl     3e7 <openiputtest+0xe7>
     33d:	8d 76 00             	lea    0x0(%esi),%esi
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
     340:	75 36                	jne    378 <openiputtest+0x78>
    int fd = open("oidir", O_RDWR);
     342:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
     349:	00 
     34a:	c7 04 24 6f 41 00 00 	movl   $0x416f,(%esp)
     351:	e8 7e 39 00 00       	call   3cd4 <open>
    if(fd >= 0){
     356:	85 c0                	test   %eax,%eax
     358:	78 6e                	js     3c8 <openiputtest+0xc8>
      printf(stdout, "open directory for write succeeded\n");
     35a:	a1 70 61 00 00       	mov    0x6170,%eax
     35f:	c7 44 24 04 f4 50 00 	movl   $0x50f4,0x4(%esp)
     366:	00 
     367:	89 04 24             	mov    %eax,(%esp)
     36a:	e8 81 3a 00 00       	call   3df0 <printf>
      exit();
     36f:	e8 20 39 00 00       	call   3c94 <exit>
     374:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    exit();
  }
  sleep(1);
     378:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     37f:	e8 a0 39 00 00       	call   3d24 <sleep>
  if(unlink("oidir") != 0){
     384:	c7 04 24 6f 41 00 00 	movl   $0x416f,(%esp)
     38b:	e8 54 39 00 00       	call   3ce4 <unlink>
     390:	85 c0                	test   %eax,%eax
     392:	75 1c                	jne    3b0 <openiputtest+0xb0>
    printf(stdout, "unlink failed\n");
    exit();
  }
  wait();
     394:	e8 03 39 00 00       	call   3c9c <wait>
  printf(stdout, "openiput test ok\n");
     399:	a1 70 61 00 00       	mov    0x6170,%eax
     39e:	c7 44 24 04 98 41 00 	movl   $0x4198,0x4(%esp)
     3a5:	00 
     3a6:	89 04 24             	mov    %eax,(%esp)
     3a9:	e8 42 3a 00 00       	call   3df0 <printf>
}
     3ae:	c9                   	leave  
     3af:	c3                   	ret    
    }
    exit();
  }
  sleep(1);
  if(unlink("oidir") != 0){
    printf(stdout, "unlink failed\n");
     3b0:	a1 70 61 00 00       	mov    0x6170,%eax
     3b5:	c7 44 24 04 89 41 00 	movl   $0x4189,0x4(%esp)
     3bc:	00 
     3bd:	89 04 24             	mov    %eax,(%esp)
     3c0:	e8 2b 3a 00 00       	call   3df0 <printf>
     3c5:	8d 76 00             	lea    0x0(%esi),%esi
    exit();
     3c8:	e8 c7 38 00 00       	call   3c94 <exit>
{
  int pid;

  printf(stdout, "openiput test\n");
  if(mkdir("oidir") < 0){
    printf(stdout, "mkdir oidir failed\n");
     3cd:	a1 70 61 00 00       	mov    0x6170,%eax
     3d2:	c7 44 24 04 75 41 00 	movl   $0x4175,0x4(%esp)
     3d9:	00 
     3da:	89 04 24             	mov    %eax,(%esp)
     3dd:	e8 0e 3a 00 00       	call   3df0 <printf>
    exit();
     3e2:	e8 ad 38 00 00       	call   3c94 <exit>
  }
  pid = fork();
  if(pid < 0){
    printf(stdout, "fork failed\n");
     3e7:	a1 70 61 00 00       	mov    0x6170,%eax
     3ec:	c7 44 24 04 11 50 00 	movl   $0x5011,0x4(%esp)
     3f3:	00 
     3f4:	89 04 24             	mov    %eax,(%esp)
     3f7:	e8 f4 39 00 00       	call   3df0 <printf>
    exit();
     3fc:	e8 93 38 00 00       	call   3c94 <exit>
     401:	eb 0d                	jmp    410 <opentest>
     403:	90                   	nop
     404:	90                   	nop
     405:	90                   	nop
     406:	90                   	nop
     407:	90                   	nop
     408:	90                   	nop
     409:	90                   	nop
     40a:	90                   	nop
     40b:	90                   	nop
     40c:	90                   	nop
     40d:	90                   	nop
     40e:	90                   	nop
     40f:	90                   	nop

00000410 <opentest>:

// simple file system tests

void
opentest(void)
{
     410:	55                   	push   %ebp
     411:	89 e5                	mov    %esp,%ebp
     413:	83 ec 18             	sub    $0x18,%esp
  int fd;

  printf(stdout, "open test\n");
     416:	a1 70 61 00 00       	mov    0x6170,%eax
     41b:	c7 44 24 04 aa 41 00 	movl   $0x41aa,0x4(%esp)
     422:	00 
     423:	89 04 24             	mov    %eax,(%esp)
     426:	e8 c5 39 00 00       	call   3df0 <printf>
  fd = open("echo", 0);
     42b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     432:	00 
     433:	c7 04 24 b5 41 00 00 	movl   $0x41b5,(%esp)
     43a:	e8 95 38 00 00       	call   3cd4 <open>
  if(fd < 0){
     43f:	85 c0                	test   %eax,%eax
     441:	78 37                	js     47a <opentest+0x6a>
    printf(stdout, "open echo failed!\n");
    exit();
  }
  close(fd);
     443:	89 04 24             	mov    %eax,(%esp)
     446:	e8 71 38 00 00       	call   3cbc <close>
  fd = open("doesnotexist", 0);
     44b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     452:	00 
     453:	c7 04 24 cd 41 00 00 	movl   $0x41cd,(%esp)
     45a:	e8 75 38 00 00       	call   3cd4 <open>
  if(fd >= 0){
     45f:	85 c0                	test   %eax,%eax
     461:	79 31                	jns    494 <opentest+0x84>
    printf(stdout, "open doesnotexist succeeded!\n");
    exit();
  }
  printf(stdout, "open test ok\n");
     463:	a1 70 61 00 00       	mov    0x6170,%eax
     468:	c7 44 24 04 f8 41 00 	movl   $0x41f8,0x4(%esp)
     46f:	00 
     470:	89 04 24             	mov    %eax,(%esp)
     473:	e8 78 39 00 00       	call   3df0 <printf>
}
     478:	c9                   	leave  
     479:	c3                   	ret    
  int fd;

  printf(stdout, "open test\n");
  fd = open("echo", 0);
  if(fd < 0){
    printf(stdout, "open echo failed!\n");
     47a:	a1 70 61 00 00       	mov    0x6170,%eax
     47f:	c7 44 24 04 ba 41 00 	movl   $0x41ba,0x4(%esp)
     486:	00 
     487:	89 04 24             	mov    %eax,(%esp)
     48a:	e8 61 39 00 00       	call   3df0 <printf>
    exit();
     48f:	e8 00 38 00 00       	call   3c94 <exit>
  }
  close(fd);
  fd = open("doesnotexist", 0);
  if(fd >= 0){
    printf(stdout, "open doesnotexist succeeded!\n");
     494:	a1 70 61 00 00       	mov    0x6170,%eax
     499:	c7 44 24 04 da 41 00 	movl   $0x41da,0x4(%esp)
     4a0:	00 
     4a1:	89 04 24             	mov    %eax,(%esp)
     4a4:	e8 47 39 00 00       	call   3df0 <printf>
    exit();
     4a9:	e8 e6 37 00 00       	call   3c94 <exit>
     4ae:	66 90                	xchg   %ax,%ax

000004b0 <writetest>:
  printf(stdout, "open test ok\n");
}

void
writetest(void)
{
     4b0:	55                   	push   %ebp
     4b1:	89 e5                	mov    %esp,%ebp
     4b3:	56                   	push   %esi
     4b4:	53                   	push   %ebx
     4b5:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int i;

  printf(stdout, "small file test\n");
     4b8:	a1 70 61 00 00       	mov    0x6170,%eax
     4bd:	c7 44 24 04 06 42 00 	movl   $0x4206,0x4(%esp)
     4c4:	00 
     4c5:	89 04 24             	mov    %eax,(%esp)
     4c8:	e8 23 39 00 00       	call   3df0 <printf>
  fd = open("small", O_CREATE|O_RDWR);
     4cd:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
     4d4:	00 
     4d5:	c7 04 24 17 42 00 00 	movl   $0x4217,(%esp)
     4dc:	e8 f3 37 00 00       	call   3cd4 <open>
  if(fd >= 0){
     4e1:	85 c0                	test   %eax,%eax
{
  int fd;
  int i;

  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
     4e3:	89 c6                	mov    %eax,%esi
  if(fd >= 0){
     4e5:	0f 88 b1 01 00 00    	js     69c <writetest+0x1ec>
    printf(stdout, "creat small succeeded; ok\n");
     4eb:	a1 70 61 00 00       	mov    0x6170,%eax
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     4f0:	31 db                	xor    %ebx,%ebx
  int i;

  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
     4f2:	c7 44 24 04 1d 42 00 	movl   $0x421d,0x4(%esp)
     4f9:	00 
     4fa:	89 04 24             	mov    %eax,(%esp)
     4fd:	e8 ee 38 00 00       	call   3df0 <printf>
     502:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     508:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     50f:	00 
     510:	c7 44 24 04 54 42 00 	movl   $0x4254,0x4(%esp)
     517:	00 
     518:	89 34 24             	mov    %esi,(%esp)
     51b:	e8 94 37 00 00       	call   3cb4 <write>
     520:	83 f8 0a             	cmp    $0xa,%eax
     523:	0f 85 e9 00 00 00    	jne    612 <writetest+0x162>
      printf(stdout, "error: write aa %d new file failed\n", i);
      exit();
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     529:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     530:	00 
     531:	c7 44 24 04 5f 42 00 	movl   $0x425f,0x4(%esp)
     538:	00 
     539:	89 34 24             	mov    %esi,(%esp)
     53c:	e8 73 37 00 00       	call   3cb4 <write>
     541:	83 f8 0a             	cmp    $0xa,%eax
     544:	0f 85 e6 00 00 00    	jne    630 <writetest+0x180>
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     54a:	83 c3 01             	add    $0x1,%ebx
     54d:	83 fb 64             	cmp    $0x64,%ebx
     550:	75 b6                	jne    508 <writetest+0x58>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
      exit();
    }
  }
  printf(stdout, "writes ok\n");
     552:	a1 70 61 00 00       	mov    0x6170,%eax
     557:	c7 44 24 04 6a 42 00 	movl   $0x426a,0x4(%esp)
     55e:	00 
     55f:	89 04 24             	mov    %eax,(%esp)
     562:	e8 89 38 00 00       	call   3df0 <printf>
  close(fd);
     567:	89 34 24             	mov    %esi,(%esp)
     56a:	e8 4d 37 00 00       	call   3cbc <close>
  fd = open("small", O_RDONLY);
     56f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     576:	00 
     577:	c7 04 24 17 42 00 00 	movl   $0x4217,(%esp)
     57e:	e8 51 37 00 00       	call   3cd4 <open>
  if(fd >= 0){
     583:	85 c0                	test   %eax,%eax
      exit();
    }
  }
  printf(stdout, "writes ok\n");
  close(fd);
  fd = open("small", O_RDONLY);
     585:	89 c3                	mov    %eax,%ebx
  if(fd >= 0){
     587:	0f 88 c1 00 00 00    	js     64e <writetest+0x19e>
    printf(stdout, "open small succeeded ok\n");
     58d:	a1 70 61 00 00       	mov    0x6170,%eax
     592:	c7 44 24 04 75 42 00 	movl   $0x4275,0x4(%esp)
     599:	00 
     59a:	89 04 24             	mov    %eax,(%esp)
     59d:	e8 4e 38 00 00       	call   3df0 <printf>
  } else {
    printf(stdout, "error: open small failed!\n");
    exit();
  }
  i = read(fd, buf, 2000);
     5a2:	c7 44 24 08 d0 07 00 	movl   $0x7d0,0x8(%esp)
     5a9:	00 
     5aa:	c7 44 24 04 60 89 00 	movl   $0x8960,0x4(%esp)
     5b1:	00 
     5b2:	89 1c 24             	mov    %ebx,(%esp)
     5b5:	e8 f2 36 00 00       	call   3cac <read>
  if(i == 2000){
     5ba:	3d d0 07 00 00       	cmp    $0x7d0,%eax
     5bf:	0f 85 a3 00 00 00    	jne    668 <writetest+0x1b8>
    printf(stdout, "read succeeded ok\n");
     5c5:	a1 70 61 00 00       	mov    0x6170,%eax
     5ca:	c7 44 24 04 a9 42 00 	movl   $0x42a9,0x4(%esp)
     5d1:	00 
     5d2:	89 04 24             	mov    %eax,(%esp)
     5d5:	e8 16 38 00 00       	call   3df0 <printf>
  } else {
    printf(stdout, "read failed\n");
    exit();
  }
  close(fd);
     5da:	89 1c 24             	mov    %ebx,(%esp)
     5dd:	e8 da 36 00 00       	call   3cbc <close>

  if(unlink("small") < 0){
     5e2:	c7 04 24 17 42 00 00 	movl   $0x4217,(%esp)
     5e9:	e8 f6 36 00 00       	call   3ce4 <unlink>
     5ee:	85 c0                	test   %eax,%eax
     5f0:	0f 88 8c 00 00 00    	js     682 <writetest+0x1d2>
    printf(stdout, "unlink small failed\n");
    exit();
  }
  printf(stdout, "small file test ok\n");
     5f6:	a1 70 61 00 00       	mov    0x6170,%eax
     5fb:	c7 44 24 04 d1 42 00 	movl   $0x42d1,0x4(%esp)
     602:	00 
     603:	89 04 24             	mov    %eax,(%esp)
     606:	e8 e5 37 00 00       	call   3df0 <printf>
}
     60b:	83 c4 10             	add    $0x10,%esp
     60e:	5b                   	pop    %ebx
     60f:	5e                   	pop    %esi
     610:	5d                   	pop    %ebp
     611:	c3                   	ret    
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
      printf(stdout, "error: write aa %d new file failed\n", i);
     612:	a1 70 61 00 00       	mov    0x6170,%eax
     617:	89 5c 24 08          	mov    %ebx,0x8(%esp)
     61b:	c7 44 24 04 18 51 00 	movl   $0x5118,0x4(%esp)
     622:	00 
     623:	89 04 24             	mov    %eax,(%esp)
     626:	e8 c5 37 00 00       	call   3df0 <printf>
      exit();
     62b:	e8 64 36 00 00       	call   3c94 <exit>
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
     630:	a1 70 61 00 00       	mov    0x6170,%eax
     635:	89 5c 24 08          	mov    %ebx,0x8(%esp)
     639:	c7 44 24 04 3c 51 00 	movl   $0x513c,0x4(%esp)
     640:	00 
     641:	89 04 24             	mov    %eax,(%esp)
     644:	e8 a7 37 00 00       	call   3df0 <printf>
      exit();
     649:	e8 46 36 00 00       	call   3c94 <exit>
  close(fd);
  fd = open("small", O_RDONLY);
  if(fd >= 0){
    printf(stdout, "open small succeeded ok\n");
  } else {
    printf(stdout, "error: open small failed!\n");
     64e:	a1 70 61 00 00       	mov    0x6170,%eax
     653:	c7 44 24 04 8e 42 00 	movl   $0x428e,0x4(%esp)
     65a:	00 
     65b:	89 04 24             	mov    %eax,(%esp)
     65e:	e8 8d 37 00 00       	call   3df0 <printf>
    exit();
     663:	e8 2c 36 00 00       	call   3c94 <exit>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
  } else {
    printf(stdout, "read failed\n");
     668:	a1 70 61 00 00       	mov    0x6170,%eax
     66d:	c7 44 24 04 d5 45 00 	movl   $0x45d5,0x4(%esp)
     674:	00 
     675:	89 04 24             	mov    %eax,(%esp)
     678:	e8 73 37 00 00       	call   3df0 <printf>
    exit();
     67d:	e8 12 36 00 00       	call   3c94 <exit>
  }
  close(fd);

  if(unlink("small") < 0){
    printf(stdout, "unlink small failed\n");
     682:	a1 70 61 00 00       	mov    0x6170,%eax
     687:	c7 44 24 04 bc 42 00 	movl   $0x42bc,0x4(%esp)
     68e:	00 
     68f:	89 04 24             	mov    %eax,(%esp)
     692:	e8 59 37 00 00       	call   3df0 <printf>
    exit();
     697:	e8 f8 35 00 00       	call   3c94 <exit>
  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
     69c:	a1 70 61 00 00       	mov    0x6170,%eax
     6a1:	c7 44 24 04 38 42 00 	movl   $0x4238,0x4(%esp)
     6a8:	00 
     6a9:	89 04 24             	mov    %eax,(%esp)
     6ac:	e8 3f 37 00 00       	call   3df0 <printf>
    exit();
     6b1:	e8 de 35 00 00       	call   3c94 <exit>
     6b6:	8d 76 00             	lea    0x0(%esi),%esi
     6b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006c0 <writetest1>:
  printf(stdout, "small file test ok\n");
}

void
writetest1(void)
{
     6c0:	55                   	push   %ebp
     6c1:	89 e5                	mov    %esp,%ebp
     6c3:	56                   	push   %esi
     6c4:	53                   	push   %ebx
     6c5:	83 ec 10             	sub    $0x10,%esp
  int i, fd, n;

  printf(stdout, "big files test\n");
     6c8:	a1 70 61 00 00       	mov    0x6170,%eax
     6cd:	c7 44 24 04 e5 42 00 	movl   $0x42e5,0x4(%esp)
     6d4:	00 
     6d5:	89 04 24             	mov    %eax,(%esp)
     6d8:	e8 13 37 00 00       	call   3df0 <printf>

  fd = open("big", O_CREATE|O_RDWR);
     6dd:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
     6e4:	00 
     6e5:	c7 04 24 5f 43 00 00 	movl   $0x435f,(%esp)
     6ec:	e8 e3 35 00 00       	call   3cd4 <open>
  if(fd < 0){
     6f1:	85 c0                	test   %eax,%eax
{
  int i, fd, n;

  printf(stdout, "big files test\n");

  fd = open("big", O_CREATE|O_RDWR);
     6f3:	89 c6                	mov    %eax,%esi
  if(fd < 0){
     6f5:	0f 88 7a 01 00 00    	js     875 <writetest1+0x1b5>
     6fb:	31 db                	xor    %ebx,%ebx
     6fd:	8d 76 00             	lea    0x0(%esi),%esi
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
     700:	89 1d 60 89 00 00    	mov    %ebx,0x8960
    if(write(fd, buf, 512) != 512){
     706:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
     70d:	00 
     70e:	c7 44 24 04 60 89 00 	movl   $0x8960,0x4(%esp)
     715:	00 
     716:	89 34 24             	mov    %esi,(%esp)
     719:	e8 96 35 00 00       	call   3cb4 <write>
     71e:	3d 00 02 00 00       	cmp    $0x200,%eax
     723:	0f 85 b2 00 00 00    	jne    7db <writetest1+0x11b>
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
     729:	83 c3 01             	add    $0x1,%ebx
     72c:	81 fb 8c 00 00 00    	cmp    $0x8c,%ebx
     732:	75 cc                	jne    700 <writetest1+0x40>
      printf(stdout, "error: write big file failed\n", i);
      exit();
    }
  }

  close(fd);
     734:	89 34 24             	mov    %esi,(%esp)
     737:	e8 80 35 00 00       	call   3cbc <close>

  fd = open("big", O_RDONLY);
     73c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     743:	00 
     744:	c7 04 24 5f 43 00 00 	movl   $0x435f,(%esp)
     74b:	e8 84 35 00 00       	call   3cd4 <open>
  if(fd < 0){
     750:	85 c0                	test   %eax,%eax
    }
  }

  close(fd);

  fd = open("big", O_RDONLY);
     752:	89 c6                	mov    %eax,%esi
  if(fd < 0){
     754:	0f 88 01 01 00 00    	js     85b <writetest1+0x19b>
     75a:	31 db                	xor    %ebx,%ebx
     75c:	eb 1d                	jmp    77b <writetest1+0xbb>
     75e:	66 90                	xchg   %ax,%ax
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
    } else if(i != 512){
     760:	3d 00 02 00 00       	cmp    $0x200,%eax
     765:	0f 85 b0 00 00 00    	jne    81b <writetest1+0x15b>
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
     76b:	a1 60 89 00 00       	mov    0x8960,%eax
     770:	39 d8                	cmp    %ebx,%eax
     772:	0f 85 81 00 00 00    	jne    7f9 <writetest1+0x139>
      printf(stdout, "read content of block %d is %d\n",
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
     778:	83 c3 01             	add    $0x1,%ebx
    exit();
  }

  n = 0;
  for(;;){
    i = read(fd, buf, 512);
     77b:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
     782:	00 
     783:	c7 44 24 04 60 89 00 	movl   $0x8960,0x4(%esp)
     78a:	00 
     78b:	89 34 24             	mov    %esi,(%esp)
     78e:	e8 19 35 00 00       	call   3cac <read>
    if(i == 0){
     793:	85 c0                	test   %eax,%eax
     795:	75 c9                	jne    760 <writetest1+0xa0>
      if(n == MAXFILE - 1){
     797:	81 fb 8b 00 00 00    	cmp    $0x8b,%ebx
     79d:	0f 84 96 00 00 00    	je     839 <writetest1+0x179>
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
  }
  close(fd);
     7a3:	89 34 24             	mov    %esi,(%esp)
     7a6:	e8 11 35 00 00       	call   3cbc <close>
  if(unlink("big") < 0){
     7ab:	c7 04 24 5f 43 00 00 	movl   $0x435f,(%esp)
     7b2:	e8 2d 35 00 00       	call   3ce4 <unlink>
     7b7:	85 c0                	test   %eax,%eax
     7b9:	0f 88 d0 00 00 00    	js     88f <writetest1+0x1cf>
    printf(stdout, "unlink big failed\n");
    exit();
  }
  printf(stdout, "big files ok\n");
     7bf:	a1 70 61 00 00       	mov    0x6170,%eax
     7c4:	c7 44 24 04 86 43 00 	movl   $0x4386,0x4(%esp)
     7cb:	00 
     7cc:	89 04 24             	mov    %eax,(%esp)
     7cf:	e8 1c 36 00 00       	call   3df0 <printf>
}
     7d4:	83 c4 10             	add    $0x10,%esp
     7d7:	5b                   	pop    %ebx
     7d8:	5e                   	pop    %esi
     7d9:	5d                   	pop    %ebp
     7da:	c3                   	ret    
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
    if(write(fd, buf, 512) != 512){
      printf(stdout, "error: write big file failed\n", i);
     7db:	a1 70 61 00 00       	mov    0x6170,%eax
     7e0:	89 5c 24 08          	mov    %ebx,0x8(%esp)
     7e4:	c7 44 24 04 0f 43 00 	movl   $0x430f,0x4(%esp)
     7eb:	00 
     7ec:	89 04 24             	mov    %eax,(%esp)
     7ef:	e8 fc 35 00 00       	call   3df0 <printf>
      exit();
     7f4:	e8 9b 34 00 00       	call   3c94 <exit>
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
      printf(stdout, "read content of block %d is %d\n",
     7f9:	89 44 24 0c          	mov    %eax,0xc(%esp)
     7fd:	a1 70 61 00 00       	mov    0x6170,%eax
     802:	89 5c 24 08          	mov    %ebx,0x8(%esp)
     806:	c7 44 24 04 60 51 00 	movl   $0x5160,0x4(%esp)
     80d:	00 
     80e:	89 04 24             	mov    %eax,(%esp)
     811:	e8 da 35 00 00       	call   3df0 <printf>
             n, ((int*)buf)[0]);
      exit();
     816:	e8 79 34 00 00       	call   3c94 <exit>
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
     81b:	89 44 24 08          	mov    %eax,0x8(%esp)
     81f:	a1 70 61 00 00       	mov    0x6170,%eax
     824:	c7 44 24 04 63 43 00 	movl   $0x4363,0x4(%esp)
     82b:	00 
     82c:	89 04 24             	mov    %eax,(%esp)
     82f:	e8 bc 35 00 00       	call   3df0 <printf>
      exit();
     834:	e8 5b 34 00 00       	call   3c94 <exit>
  n = 0;
  for(;;){
    i = read(fd, buf, 512);
    if(i == 0){
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
     839:	a1 70 61 00 00       	mov    0x6170,%eax
     83e:	c7 44 24 08 8b 00 00 	movl   $0x8b,0x8(%esp)
     845:	00 
     846:	c7 44 24 04 46 43 00 	movl   $0x4346,0x4(%esp)
     84d:	00 
     84e:	89 04 24             	mov    %eax,(%esp)
     851:	e8 9a 35 00 00       	call   3df0 <printf>
        exit();
     856:	e8 39 34 00 00       	call   3c94 <exit>

  close(fd);

  fd = open("big", O_RDONLY);
  if(fd < 0){
    printf(stdout, "error: open big failed!\n");
     85b:	a1 70 61 00 00       	mov    0x6170,%eax
     860:	c7 44 24 04 2d 43 00 	movl   $0x432d,0x4(%esp)
     867:	00 
     868:	89 04 24             	mov    %eax,(%esp)
     86b:	e8 80 35 00 00       	call   3df0 <printf>
    exit();
     870:	e8 1f 34 00 00       	call   3c94 <exit>

  printf(stdout, "big files test\n");

  fd = open("big", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
     875:	a1 70 61 00 00       	mov    0x6170,%eax
     87a:	c7 44 24 04 f5 42 00 	movl   $0x42f5,0x4(%esp)
     881:	00 
     882:	89 04 24             	mov    %eax,(%esp)
     885:	e8 66 35 00 00       	call   3df0 <printf>
    exit();
     88a:	e8 05 34 00 00       	call   3c94 <exit>
    }
    n++;
  }
  close(fd);
  if(unlink("big") < 0){
    printf(stdout, "unlink big failed\n");
     88f:	a1 70 61 00 00       	mov    0x6170,%eax
     894:	c7 44 24 04 73 43 00 	movl   $0x4373,0x4(%esp)
     89b:	00 
     89c:	89 04 24             	mov    %eax,(%esp)
     89f:	e8 4c 35 00 00       	call   3df0 <printf>
    exit();
     8a4:	e8 eb 33 00 00       	call   3c94 <exit>
     8a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000008b0 <createtest>:
  printf(stdout, "big files ok\n");
}

void
createtest(void)
{
     8b0:	55                   	push   %ebp
     8b1:	89 e5                	mov    %esp,%ebp
     8b3:	53                   	push   %ebx
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
     8b4:	bb 30 00 00 00       	mov    $0x30,%ebx
  printf(stdout, "big files ok\n");
}

void
createtest(void)
{
     8b9:	83 ec 14             	sub    $0x14,%esp
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");
     8bc:	a1 70 61 00 00       	mov    0x6170,%eax
     8c1:	c7 44 24 04 80 51 00 	movl   $0x5180,0x4(%esp)
     8c8:	00 
     8c9:	89 04 24             	mov    %eax,(%esp)
     8cc:	e8 1f 35 00 00       	call   3df0 <printf>

  name[0] = 'a';
     8d1:	c6 05 60 a9 00 00 61 	movb   $0x61,0xa960
  name[2] = '\0';
     8d8:	c6 05 62 a9 00 00 00 	movb   $0x0,0xa962
     8df:	90                   	nop
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
     8e0:	88 1d 61 a9 00 00    	mov    %bl,0xa961
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
     8e6:	83 c3 01             	add    $0x1,%ebx

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
     8e9:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
     8f0:	00 
     8f1:	c7 04 24 60 a9 00 00 	movl   $0xa960,(%esp)
     8f8:	e8 d7 33 00 00       	call   3cd4 <open>
    close(fd);
     8fd:	89 04 24             	mov    %eax,(%esp)
     900:	e8 b7 33 00 00       	call   3cbc <close>

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     905:	80 fb 64             	cmp    $0x64,%bl
     908:	75 d6                	jne    8e0 <createtest+0x30>
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
     90a:	c6 05 60 a9 00 00 61 	movb   $0x61,0xa960
  name[2] = '\0';
     911:	bb 30 00 00 00       	mov    $0x30,%ebx
     916:	c6 05 62 a9 00 00 00 	movb   $0x0,0xa962
     91d:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
     920:	88 1d 61 a9 00 00    	mov    %bl,0xa961
    unlink(name);
     926:	83 c3 01             	add    $0x1,%ebx
     929:	c7 04 24 60 a9 00 00 	movl   $0xa960,(%esp)
     930:	e8 af 33 00 00       	call   3ce4 <unlink>
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     935:	80 fb 64             	cmp    $0x64,%bl
     938:	75 e6                	jne    920 <createtest+0x70>
    name[1] = '0' + i;
    unlink(name);
  }
  printf(stdout, "many creates, followed by unlink; ok\n");
     93a:	a1 70 61 00 00       	mov    0x6170,%eax
     93f:	c7 44 24 04 a8 51 00 	movl   $0x51a8,0x4(%esp)
     946:	00 
     947:	89 04 24             	mov    %eax,(%esp)
     94a:	e8 a1 34 00 00       	call   3df0 <printf>
}
     94f:	83 c4 14             	add    $0x14,%esp
     952:	5b                   	pop    %ebx
     953:	5d                   	pop    %ebp
     954:	c3                   	ret    
     955:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000960 <dirtest>:

void dirtest(void)
{
     960:	55                   	push   %ebp
     961:	89 e5                	mov    %esp,%ebp
     963:	83 ec 18             	sub    $0x18,%esp
  printf(stdout, "mkdir test\n");
     966:	a1 70 61 00 00       	mov    0x6170,%eax
     96b:	c7 44 24 04 94 43 00 	movl   $0x4394,0x4(%esp)
     972:	00 
     973:	89 04 24             	mov    %eax,(%esp)
     976:	e8 75 34 00 00       	call   3df0 <printf>

  if(mkdir("dir0") < 0){
     97b:	c7 04 24 a0 43 00 00 	movl   $0x43a0,(%esp)
     982:	e8 75 33 00 00       	call   3cfc <mkdir>
     987:	85 c0                	test   %eax,%eax
     989:	78 4b                	js     9d6 <dirtest+0x76>
    printf(stdout, "mkdir failed\n");
    exit();
  }

  if(chdir("dir0") < 0){
     98b:	c7 04 24 a0 43 00 00 	movl   $0x43a0,(%esp)
     992:	e8 6d 33 00 00       	call   3d04 <chdir>
     997:	85 c0                	test   %eax,%eax
     999:	0f 88 85 00 00 00    	js     a24 <dirtest+0xc4>
    printf(stdout, "chdir dir0 failed\n");
    exit();
  }

  if(chdir("..") < 0){
     99f:	c7 04 24 45 49 00 00 	movl   $0x4945,(%esp)
     9a6:	e8 59 33 00 00       	call   3d04 <chdir>
     9ab:	85 c0                	test   %eax,%eax
     9ad:	78 5b                	js     a0a <dirtest+0xaa>
    printf(stdout, "chdir .. failed\n");
    exit();
  }

  if(unlink("dir0") < 0){
     9af:	c7 04 24 a0 43 00 00 	movl   $0x43a0,(%esp)
     9b6:	e8 29 33 00 00       	call   3ce4 <unlink>
     9bb:	85 c0                	test   %eax,%eax
     9bd:	78 31                	js     9f0 <dirtest+0x90>
    printf(stdout, "unlink dir0 failed\n");
    exit();
  }
  printf(stdout, "mkdir test ok\n");
     9bf:	a1 70 61 00 00       	mov    0x6170,%eax
     9c4:	c7 44 24 04 dd 43 00 	movl   $0x43dd,0x4(%esp)
     9cb:	00 
     9cc:	89 04 24             	mov    %eax,(%esp)
     9cf:	e8 1c 34 00 00       	call   3df0 <printf>
}
     9d4:	c9                   	leave  
     9d5:	c3                   	ret    
void dirtest(void)
{
  printf(stdout, "mkdir test\n");

  if(mkdir("dir0") < 0){
    printf(stdout, "mkdir failed\n");
     9d6:	a1 70 61 00 00       	mov    0x6170,%eax
     9db:	c7 44 24 04 d0 40 00 	movl   $0x40d0,0x4(%esp)
     9e2:	00 
     9e3:	89 04 24             	mov    %eax,(%esp)
     9e6:	e8 05 34 00 00       	call   3df0 <printf>
    exit();
     9eb:	e8 a4 32 00 00       	call   3c94 <exit>
    printf(stdout, "chdir .. failed\n");
    exit();
  }

  if(unlink("dir0") < 0){
    printf(stdout, "unlink dir0 failed\n");
     9f0:	a1 70 61 00 00       	mov    0x6170,%eax
     9f5:	c7 44 24 04 c9 43 00 	movl   $0x43c9,0x4(%esp)
     9fc:	00 
     9fd:	89 04 24             	mov    %eax,(%esp)
     a00:	e8 eb 33 00 00       	call   3df0 <printf>
    exit();
     a05:	e8 8a 32 00 00       	call   3c94 <exit>
    printf(stdout, "chdir dir0 failed\n");
    exit();
  }

  if(chdir("..") < 0){
    printf(stdout, "chdir .. failed\n");
     a0a:	a1 70 61 00 00       	mov    0x6170,%eax
     a0f:	c7 44 24 04 b8 43 00 	movl   $0x43b8,0x4(%esp)
     a16:	00 
     a17:	89 04 24             	mov    %eax,(%esp)
     a1a:	e8 d1 33 00 00       	call   3df0 <printf>
    exit();
     a1f:	e8 70 32 00 00       	call   3c94 <exit>
    printf(stdout, "mkdir failed\n");
    exit();
  }

  if(chdir("dir0") < 0){
    printf(stdout, "chdir dir0 failed\n");
     a24:	a1 70 61 00 00       	mov    0x6170,%eax
     a29:	c7 44 24 04 a5 43 00 	movl   $0x43a5,0x4(%esp)
     a30:	00 
     a31:	89 04 24             	mov    %eax,(%esp)
     a34:	e8 b7 33 00 00       	call   3df0 <printf>
    exit();
     a39:	e8 56 32 00 00       	call   3c94 <exit>
     a3e:	66 90                	xchg   %ax,%ax

00000a40 <exectest>:
  printf(stdout, "mkdir test ok\n");
}

void
exectest(void)
{
     a40:	55                   	push   %ebp
     a41:	89 e5                	mov    %esp,%ebp
     a43:	83 ec 18             	sub    $0x18,%esp
  printf(stdout, "exec test\n");
     a46:	a1 70 61 00 00       	mov    0x6170,%eax
     a4b:	c7 44 24 04 ec 43 00 	movl   $0x43ec,0x4(%esp)
     a52:	00 
     a53:	89 04 24             	mov    %eax,(%esp)
     a56:	e8 95 33 00 00       	call   3df0 <printf>
  if(exec("echo", echoargv) < 0){
     a5b:	c7 44 24 04 74 61 00 	movl   $0x6174,0x4(%esp)
     a62:	00 
     a63:	c7 04 24 b5 41 00 00 	movl   $0x41b5,(%esp)
     a6a:	e8 5d 32 00 00       	call   3ccc <exec>
     a6f:	85 c0                	test   %eax,%eax
     a71:	78 02                	js     a75 <exectest+0x35>
    printf(stdout, "exec echo failed\n");
    exit();
  }
}
     a73:	c9                   	leave  
     a74:	c3                   	ret    
void
exectest(void)
{
  printf(stdout, "exec test\n");
  if(exec("echo", echoargv) < 0){
    printf(stdout, "exec echo failed\n");
     a75:	a1 70 61 00 00       	mov    0x6170,%eax
     a7a:	c7 44 24 04 f7 43 00 	movl   $0x43f7,0x4(%esp)
     a81:	00 
     a82:	89 04 24             	mov    %eax,(%esp)
     a85:	e8 66 33 00 00       	call   3df0 <printf>
    exit();
     a8a:	e8 05 32 00 00       	call   3c94 <exit>
     a8f:	90                   	nop

00000a90 <pipe1>:

// simple fork and pipe read/write

void
pipe1(void)
{
     a90:	55                   	push   %ebp
     a91:	89 e5                	mov    %esp,%ebp
     a93:	57                   	push   %edi
     a94:	56                   	push   %esi
     a95:	53                   	push   %ebx
     a96:	83 ec 2c             	sub    $0x2c,%esp
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     a99:	8d 45 e0             	lea    -0x20(%ebp),%eax
     a9c:	89 04 24             	mov    %eax,(%esp)
     a9f:	e8 00 32 00 00       	call   3ca4 <pipe>
     aa4:	85 c0                	test   %eax,%eax
     aa6:	0f 85 42 01 00 00    	jne    bee <pipe1+0x15e>
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork();
     aac:	e8 db 31 00 00       	call   3c8c <fork>
  seq = 0;
  if(pid == 0){
     ab1:	83 f8 00             	cmp    $0x0,%eax
     ab4:	0f 84 86 00 00 00    	je     b40 <pipe1+0xb0>
        printf(1, "pipe1 oops 1\n");
        exit();
      }
    }
    exit();
  } else if(pid > 0){
     aba:	0f 8e 47 01 00 00    	jle    c07 <pipe1+0x177>
    close(fds[1]);
     ac0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    total = 0;
     ac3:	31 ff                	xor    %edi,%edi
    cc = 1;
     ac5:	be 01 00 00 00       	mov    $0x1,%esi
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork();
  seq = 0;
     aca:	31 db                	xor    %ebx,%ebx
        exit();
      }
    }
    exit();
  } else if(pid > 0){
    close(fds[1]);
     acc:	89 04 24             	mov    %eax,(%esp)
     acf:	e8 e8 31 00 00       	call   3cbc <close>
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     ad4:	8b 45 e0             	mov    -0x20(%ebp),%eax
     ad7:	89 74 24 08          	mov    %esi,0x8(%esp)
     adb:	c7 44 24 04 60 89 00 	movl   $0x8960,0x4(%esp)
     ae2:	00 
     ae3:	89 04 24             	mov    %eax,(%esp)
     ae6:	e8 c1 31 00 00       	call   3cac <read>
     aeb:	85 c0                	test   %eax,%eax
     aed:	0f 8e b0 00 00 00    	jle    ba3 <pipe1+0x113>
}

// simple fork and pipe read/write

void
pipe1(void)
     af3:	89 da                	mov    %ebx,%edx
     af5:	8d 0c 03             	lea    (%ebx,%eax,1),%ecx
     af8:	f7 da                	neg    %edx
     afa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     b00:	38 9c 13 60 89 00 00 	cmp    %bl,0x8960(%ebx,%edx,1)
     b07:	75 1b                	jne    b24 <pipe1+0x94>
     b09:	83 c3 01             	add    $0x1,%ebx
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
     b0c:	39 cb                	cmp    %ecx,%ebx
     b0e:	75 f0                	jne    b00 <pipe1+0x70>
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
      cc = cc * 2;
     b10:	01 f6                	add    %esi,%esi
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
     b12:	01 c7                	add    %eax,%edi
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
     b14:	81 fe 01 20 00 00    	cmp    $0x2001,%esi
     b1a:	b8 00 20 00 00       	mov    $0x2000,%eax
     b1f:	0f 43 f0             	cmovae %eax,%esi
     b22:	eb b0                	jmp    ad4 <pipe1+0x44>
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
     b24:	c7 44 24 04 26 44 00 	movl   $0x4426,0x4(%esp)
     b2b:	00 
     b2c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     b33:	e8 b8 32 00 00       	call   3df0 <printf>
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
}
     b38:	83 c4 2c             	add    $0x2c,%esp
     b3b:	5b                   	pop    %ebx
     b3c:	5e                   	pop    %esi
     b3d:	5f                   	pop    %edi
     b3e:	5d                   	pop    %ebp
     b3f:	c3                   	ret    
    exit();
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
     b40:	8b 45 e0             	mov    -0x20(%ebp),%eax
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork();
  seq = 0;
     b43:	31 f6                	xor    %esi,%esi
  if(pid == 0){
    close(fds[0]);
     b45:	89 04 24             	mov    %eax,(%esp)
     b48:	e8 6f 31 00 00       	call   3cbc <close>
}

// simple fork and pipe read/write

void
pipe1(void)
     b4d:	89 f0                	mov    %esi,%eax
     b4f:	89 f3                	mov    %esi,%ebx
     b51:	8d 96 09 04 00 00    	lea    0x409(%esi),%edx
     b57:	f7 d8                	neg    %eax
     b59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
     b60:	88 9c 18 60 89 00 00 	mov    %bl,0x8960(%eax,%ebx,1)
     b67:	83 c3 01             	add    $0x1,%ebx
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
     b6a:	39 d3                	cmp    %edx,%ebx
     b6c:	75 f2                	jne    b60 <pipe1+0xd0>
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
     b6e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
     b71:	89 de                	mov    %ebx,%esi
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
     b73:	c7 44 24 08 09 04 00 	movl   $0x409,0x8(%esp)
     b7a:	00 
     b7b:	c7 44 24 04 60 89 00 	movl   $0x8960,0x4(%esp)
     b82:	00 
     b83:	89 04 24             	mov    %eax,(%esp)
     b86:	e8 29 31 00 00       	call   3cb4 <write>
     b8b:	3d 09 04 00 00       	cmp    $0x409,%eax
     b90:	0f 85 8a 00 00 00    	jne    c20 <pipe1+0x190>
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
     b96:	81 fb 2d 14 00 00    	cmp    $0x142d,%ebx
     b9c:	75 af                	jne    b4d <pipe1+0xbd>
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
      printf(1, "pipe1 oops 3 total %d\n", total);
      exit();
     b9e:	e8 f1 30 00 00       	call   3c94 <exit>
      total += n;
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
     ba3:	81 ff 2d 14 00 00    	cmp    $0x142d,%edi
     ba9:	75 29                	jne    bd4 <pipe1+0x144>
      printf(1, "pipe1 oops 3 total %d\n", total);
      exit();
    }
    close(fds[0]);
     bab:	8b 45 e0             	mov    -0x20(%ebp),%eax
     bae:	89 04 24             	mov    %eax,(%esp)
     bb1:	e8 06 31 00 00       	call   3cbc <close>
    wait();
     bb6:	e8 e1 30 00 00       	call   3c9c <wait>
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
     bbb:	c7 44 24 04 4b 44 00 	movl   $0x444b,0x4(%esp)
     bc2:	00 
     bc3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     bca:	e8 21 32 00 00       	call   3df0 <printf>
     bcf:	e9 64 ff ff ff       	jmp    b38 <pipe1+0xa8>
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
      printf(1, "pipe1 oops 3 total %d\n", total);
     bd4:	89 7c 24 08          	mov    %edi,0x8(%esp)
     bd8:	c7 44 24 04 34 44 00 	movl   $0x4434,0x4(%esp)
     bdf:	00 
     be0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     be7:	e8 04 32 00 00       	call   3df0 <printf>
     bec:	eb b0                	jmp    b9e <pipe1+0x10e>
{
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
     bee:	c7 44 24 04 09 44 00 	movl   $0x4409,0x4(%esp)
     bf5:	00 
     bf6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     bfd:	e8 ee 31 00 00       	call   3df0 <printf>
    exit();
     c02:	e8 8d 30 00 00       	call   3c94 <exit>
      exit();
    }
    close(fds[0]);
    wait();
  } else {
    printf(1, "fork() failed\n");
     c07:	c7 44 24 04 55 44 00 	movl   $0x4455,0x4(%esp)
     c0e:	00 
     c0f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     c16:	e8 d5 31 00 00       	call   3df0 <printf>
    exit();
     c1b:	e8 74 30 00 00       	call   3c94 <exit>
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
     c20:	c7 44 24 04 18 44 00 	movl   $0x4418,0x4(%esp)
     c27:	00 
     c28:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     c2f:	e8 bc 31 00 00       	call   3df0 <printf>
        exit();
     c34:	e8 5b 30 00 00       	call   3c94 <exit>
     c39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c40 <preempt>:
}

// meant to be run w/ at most two CPUs
void
preempt(void)
{
     c40:	55                   	push   %ebp
     c41:	89 e5                	mov    %esp,%ebp
     c43:	57                   	push   %edi
     c44:	56                   	push   %esi
     c45:	53                   	push   %ebx
     c46:	83 ec 2c             	sub    $0x2c,%esp
  int pid1, pid2, pid3;
  int pfds[2];

  printf(1, "preempt: ");
     c49:	c7 44 24 04 64 44 00 	movl   $0x4464,0x4(%esp)
     c50:	00 
     c51:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     c58:	e8 93 31 00 00       	call   3df0 <printf>
  pid1 = fork();
     c5d:	e8 2a 30 00 00       	call   3c8c <fork>
  if(pid1 == 0)
     c62:	85 c0                	test   %eax,%eax
{
  int pid1, pid2, pid3;
  int pfds[2];

  printf(1, "preempt: ");
  pid1 = fork();
     c64:	89 c7                	mov    %eax,%edi
  if(pid1 == 0)
     c66:	75 02                	jne    c6a <preempt+0x2a>
     c68:	eb fe                	jmp    c68 <preempt+0x28>
     c6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    for(;;)
      ;

  pid2 = fork();
     c70:	e8 17 30 00 00       	call   3c8c <fork>
  if(pid2 == 0)
     c75:	85 c0                	test   %eax,%eax
  pid1 = fork();
  if(pid1 == 0)
    for(;;)
      ;

  pid2 = fork();
     c77:	89 c6                	mov    %eax,%esi
  if(pid2 == 0)
     c79:	75 02                	jne    c7d <preempt+0x3d>
     c7b:	eb fe                	jmp    c7b <preempt+0x3b>
    for(;;)
      ;

  pipe(pfds);
     c7d:	8d 45 e0             	lea    -0x20(%ebp),%eax
     c80:	89 04 24             	mov    %eax,(%esp)
     c83:	e8 1c 30 00 00       	call   3ca4 <pipe>
  pid3 = fork();
     c88:	e8 ff 2f 00 00       	call   3c8c <fork>
  if(pid3 == 0){
     c8d:	85 c0                	test   %eax,%eax
  if(pid2 == 0)
    for(;;)
      ;

  pipe(pfds);
  pid3 = fork();
     c8f:	89 c3                	mov    %eax,%ebx
  if(pid3 == 0){
     c91:	75 4c                	jne    cdf <preempt+0x9f>
    close(pfds[0]);
     c93:	8b 45 e0             	mov    -0x20(%ebp),%eax
     c96:	89 04 24             	mov    %eax,(%esp)
     c99:	e8 1e 30 00 00       	call   3cbc <close>
    if(write(pfds[1], "x", 1) != 1)
     c9e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     ca1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     ca8:	00 
     ca9:	c7 44 24 04 29 4a 00 	movl   $0x4a29,0x4(%esp)
     cb0:	00 
     cb1:	89 04 24             	mov    %eax,(%esp)
     cb4:	e8 fb 2f 00 00       	call   3cb4 <write>
     cb9:	83 f8 01             	cmp    $0x1,%eax
     cbc:	74 14                	je     cd2 <preempt+0x92>
      printf(1, "preempt write error");
     cbe:	c7 44 24 04 6e 44 00 	movl   $0x446e,0x4(%esp)
     cc5:	00 
     cc6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     ccd:	e8 1e 31 00 00       	call   3df0 <printf>
    close(pfds[1]);
     cd2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     cd5:	89 04 24             	mov    %eax,(%esp)
     cd8:	e8 df 2f 00 00       	call   3cbc <close>
     cdd:	eb fe                	jmp    cdd <preempt+0x9d>
    for(;;)
      ;
  }

  close(pfds[1]);
     cdf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     ce2:	89 04 24             	mov    %eax,(%esp)
     ce5:	e8 d2 2f 00 00       	call   3cbc <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     cea:	8b 45 e0             	mov    -0x20(%ebp),%eax
     ced:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
     cf4:	00 
     cf5:	c7 44 24 04 60 89 00 	movl   $0x8960,0x4(%esp)
     cfc:	00 
     cfd:	89 04 24             	mov    %eax,(%esp)
     d00:	e8 a7 2f 00 00       	call   3cac <read>
     d05:	83 f8 01             	cmp    $0x1,%eax
     d08:	74 1c                	je     d26 <preempt+0xe6>
    printf(1, "preempt read error");
     d0a:	c7 44 24 04 82 44 00 	movl   $0x4482,0x4(%esp)
     d11:	00 
     d12:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     d19:	e8 d2 30 00 00       	call   3df0 <printf>
  printf(1, "wait... ");
  wait();
  wait();
  wait();
  printf(1, "preempt ok\n");
}
     d1e:	83 c4 2c             	add    $0x2c,%esp
     d21:	5b                   	pop    %ebx
     d22:	5e                   	pop    %esi
     d23:	5f                   	pop    %edi
     d24:	5d                   	pop    %ebp
     d25:	c3                   	ret    
  close(pfds[1]);
  if(read(pfds[0], buf, sizeof(buf)) != 1){
    printf(1, "preempt read error");
    return;
  }
  close(pfds[0]);
     d26:	8b 45 e0             	mov    -0x20(%ebp),%eax
     d29:	89 04 24             	mov    %eax,(%esp)
     d2c:	e8 8b 2f 00 00       	call   3cbc <close>
  printf(1, "kill... ");
     d31:	c7 44 24 04 95 44 00 	movl   $0x4495,0x4(%esp)
     d38:	00 
     d39:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     d40:	e8 ab 30 00 00       	call   3df0 <printf>
  kill(pid1);
     d45:	89 3c 24             	mov    %edi,(%esp)
     d48:	e8 77 2f 00 00       	call   3cc4 <kill>
  kill(pid2);
     d4d:	89 34 24             	mov    %esi,(%esp)
     d50:	e8 6f 2f 00 00       	call   3cc4 <kill>
  kill(pid3);
     d55:	89 1c 24             	mov    %ebx,(%esp)
     d58:	e8 67 2f 00 00       	call   3cc4 <kill>
  printf(1, "wait... ");
     d5d:	c7 44 24 04 9e 44 00 	movl   $0x449e,0x4(%esp)
     d64:	00 
     d65:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     d6c:	e8 7f 30 00 00       	call   3df0 <printf>
  wait();
     d71:	e8 26 2f 00 00       	call   3c9c <wait>
  wait();
     d76:	e8 21 2f 00 00       	call   3c9c <wait>
     d7b:	90                   	nop
     d7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  wait();
     d80:	e8 17 2f 00 00       	call   3c9c <wait>
  printf(1, "preempt ok\n");
     d85:	c7 44 24 04 a7 44 00 	movl   $0x44a7,0x4(%esp)
     d8c:	00 
     d8d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     d94:	e8 57 30 00 00       	call   3df0 <printf>
     d99:	eb 83                	jmp    d1e <preempt+0xde>
     d9b:	90                   	nop
     d9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000da0 <exitwait>:
}

// try to find any races between exit and wait
void
exitwait(void)
{
     da0:	55                   	push   %ebp
     da1:	89 e5                	mov    %esp,%ebp
     da3:	56                   	push   %esi
     da4:	be 64 00 00 00       	mov    $0x64,%esi
     da9:	53                   	push   %ebx
     daa:	83 ec 10             	sub    $0x10,%esp
     dad:	eb 13                	jmp    dc2 <exitwait+0x22>
     daf:	90                   	nop
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
      return;
    }
    if(pid){
     db0:	74 79                	je     e2b <exitwait+0x8b>
      if(wait() != pid){
     db2:	e8 e5 2e 00 00       	call   3c9c <wait>
     db7:	39 d8                	cmp    %ebx,%eax
     db9:	75 35                	jne    df0 <exitwait+0x50>
void
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
     dbb:	83 ee 01             	sub    $0x1,%esi
     dbe:	66 90                	xchg   %ax,%ax
     dc0:	74 4e                	je     e10 <exitwait+0x70>
    pid = fork();
     dc2:	e8 c5 2e 00 00       	call   3c8c <fork>
    if(pid < 0){
     dc7:	83 f8 00             	cmp    $0x0,%eax
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
    pid = fork();
     dca:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
     dcc:	7d e2                	jge    db0 <exitwait+0x10>
      printf(1, "fork failed\n");
     dce:	c7 44 24 04 11 50 00 	movl   $0x5011,0x4(%esp)
     dd5:	00 
     dd6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     ddd:	e8 0e 30 00 00       	call   3df0 <printf>
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
}
     de2:	83 c4 10             	add    $0x10,%esp
     de5:	5b                   	pop    %ebx
     de6:	5e                   	pop    %esi
     de7:	5d                   	pop    %ebp
     de8:	c3                   	ret    
     de9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      printf(1, "fork failed\n");
      return;
    }
    if(pid){
      if(wait() != pid){
        printf(1, "wait wrong pid\n");
     df0:	c7 44 24 04 b3 44 00 	movl   $0x44b3,0x4(%esp)
     df7:	00 
     df8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     dff:	e8 ec 2f 00 00       	call   3df0 <printf>
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
}
     e04:	83 c4 10             	add    $0x10,%esp
     e07:	5b                   	pop    %ebx
     e08:	5e                   	pop    %esi
     e09:	5d                   	pop    %ebp
     e0a:	c3                   	ret    
     e0b:	90                   	nop
     e0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      }
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
     e10:	c7 44 24 04 c3 44 00 	movl   $0x44c3,0x4(%esp)
     e17:	00 
     e18:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     e1f:	e8 cc 2f 00 00       	call   3df0 <printf>
}
     e24:	83 c4 10             	add    $0x10,%esp
     e27:	5b                   	pop    %ebx
     e28:	5e                   	pop    %esi
     e29:	5d                   	pop    %ebp
     e2a:	c3                   	ret    
      if(wait() != pid){
        printf(1, "wait wrong pid\n");
        return;
      }
    } else {
      exit();
     e2b:	e8 64 2e 00 00       	call   3c94 <exit>

00000e30 <mem>:
  printf(1, "exitwait ok\n");
}

void
mem(void)
{
     e30:	55                   	push   %ebp
     e31:	89 e5                	mov    %esp,%ebp
     e33:	57                   	push   %edi
     e34:	56                   	push   %esi
     e35:	53                   	push   %ebx
  void *m1, *m2;
  int pid, ppid;

  printf(1, "mem test\n");
  ppid = getpid();
  if((pid = fork()) == 0){
     e36:	31 db                	xor    %ebx,%ebx
  printf(1, "exitwait ok\n");
}

void
mem(void)
{
     e38:	83 ec 1c             	sub    $0x1c,%esp
  void *m1, *m2;
  int pid, ppid;

  printf(1, "mem test\n");
     e3b:	c7 44 24 04 d0 44 00 	movl   $0x44d0,0x4(%esp)
     e42:	00 
     e43:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     e4a:	e8 a1 2f 00 00       	call   3df0 <printf>
  ppid = getpid();
     e4f:	e8 c0 2e 00 00       	call   3d14 <getpid>
     e54:	89 c6                	mov    %eax,%esi
  if((pid = fork()) == 0){
     e56:	e8 31 2e 00 00       	call   3c8c <fork>
     e5b:	85 c0                	test   %eax,%eax
     e5d:	74 0d                	je     e6c <mem+0x3c>
     e5f:	90                   	nop
     e60:	eb 67                	jmp    ec9 <mem+0x99>
     e62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
     e68:	89 18                	mov    %ebx,(%eax)
     e6a:	89 c3                	mov    %eax,%ebx

  printf(1, "mem test\n");
  ppid = getpid();
  if((pid = fork()) == 0){
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
     e6c:	c7 04 24 11 27 00 00 	movl   $0x2711,(%esp)
     e73:	e8 68 31 00 00       	call   3fe0 <malloc>
     e78:	85 c0                	test   %eax,%eax
     e7a:	75 ec                	jne    e68 <mem+0x38>
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     e7c:	85 db                	test   %ebx,%ebx
     e7e:	75 0a                	jne    e8a <mem+0x5a>
     e80:	eb 16                	jmp    e98 <mem+0x68>
     e82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      m2 = *(char**)m1;
      free(m1);
      m1 = m2;
     e88:	89 fb                	mov    %edi,%ebx
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
      m2 = *(char**)m1;
     e8a:	8b 3b                	mov    (%ebx),%edi
      free(m1);
     e8c:	89 1c 24             	mov    %ebx,(%esp)
     e8f:	e8 bc 30 00 00       	call   3f50 <free>
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     e94:	85 ff                	test   %edi,%edi
     e96:	75 f0                	jne    e88 <mem+0x58>
      m2 = *(char**)m1;
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
     e98:	c7 04 24 00 50 00 00 	movl   $0x5000,(%esp)
     e9f:	e8 3c 31 00 00       	call   3fe0 <malloc>
    if(m1 == 0){
     ea4:	85 c0                	test   %eax,%eax
     ea6:	74 30                	je     ed8 <mem+0xa8>
      printf(1, "couldn't allocate mem?!!\n");
      kill(ppid);
      exit();
    }
    free(m1);
     ea8:	89 04 24             	mov    %eax,(%esp)
     eab:	e8 a0 30 00 00       	call   3f50 <free>
    printf(1, "mem ok\n");
     eb0:	c7 44 24 04 f4 44 00 	movl   $0x44f4,0x4(%esp)
     eb7:	00 
     eb8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     ebf:	e8 2c 2f 00 00       	call   3df0 <printf>
    exit();
     ec4:	e8 cb 2d 00 00       	call   3c94 <exit>
  } else {
    wait();
  }
}
     ec9:	83 c4 1c             	add    $0x1c,%esp
     ecc:	5b                   	pop    %ebx
     ecd:	5e                   	pop    %esi
     ece:	5f                   	pop    %edi
     ecf:	5d                   	pop    %ebp
    }
    free(m1);
    printf(1, "mem ok\n");
    exit();
  } else {
    wait();
     ed0:	e9 c7 2d 00 00       	jmp    3c9c <wait>
     ed5:	8d 76 00             	lea    0x0(%esi),%esi
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
    if(m1 == 0){
      printf(1, "couldn't allocate mem?!!\n");
     ed8:	c7 44 24 04 da 44 00 	movl   $0x44da,0x4(%esp)
     edf:	00 
     ee0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     ee7:	e8 04 2f 00 00       	call   3df0 <printf>
      kill(ppid);
     eec:	89 34 24             	mov    %esi,(%esp)
     eef:	e8 d0 2d 00 00       	call   3cc4 <kill>
      exit();
     ef4:	e8 9b 2d 00 00       	call   3c94 <exit>
     ef9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000f00 <sharedfd>:

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(void)
{
     f00:	55                   	push   %ebp
     f01:	89 e5                	mov    %esp,%ebp
     f03:	57                   	push   %edi
     f04:	56                   	push   %esi
     f05:	53                   	push   %ebx
     f06:	83 ec 3c             	sub    $0x3c,%esp
  int fd, pid, i, n, nc, np;
  char buf[10];

  printf(1, "sharedfd test\n");
     f09:	c7 44 24 04 fc 44 00 	movl   $0x44fc,0x4(%esp)
     f10:	00 
     f11:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     f18:	e8 d3 2e 00 00       	call   3df0 <printf>

  unlink("sharedfd");
     f1d:	c7 04 24 0b 45 00 00 	movl   $0x450b,(%esp)
     f24:	e8 bb 2d 00 00       	call   3ce4 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     f29:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
     f30:	00 
     f31:	c7 04 24 0b 45 00 00 	movl   $0x450b,(%esp)
     f38:	e8 97 2d 00 00       	call   3cd4 <open>
  if(fd < 0){
     f3d:	85 c0                	test   %eax,%eax
  char buf[10];

  printf(1, "sharedfd test\n");

  unlink("sharedfd");
  fd = open("sharedfd", O_CREATE|O_RDWR);
     f3f:	89 c7                	mov    %eax,%edi
  if(fd < 0){
     f41:	0f 88 25 01 00 00    	js     106c <sharedfd+0x16c>
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
     f47:	e8 40 2d 00 00       	call   3c8c <fork>
  memset(buf, pid==0?'c':'p', sizeof(buf));
     f4c:	8d 75 de             	lea    -0x22(%ebp),%esi
     f4f:	bb e8 03 00 00       	mov    $0x3e8,%ebx
     f54:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     f5b:	00 
     f5c:	89 34 24             	mov    %esi,(%esp)
     f5f:	83 f8 01             	cmp    $0x1,%eax
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
     f62:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
     f65:	19 c0                	sbb    %eax,%eax
     f67:	83 e0 f3             	and    $0xfffffff3,%eax
     f6a:	83 c0 70             	add    $0x70,%eax
     f6d:	89 44 24 04          	mov    %eax,0x4(%esp)
     f71:	e8 9a 2b 00 00       	call   3b10 <memset>
     f76:	eb 05                	jmp    f7d <sharedfd+0x7d>
  for(i = 0; i < 1000; i++){
     f78:	83 eb 01             	sub    $0x1,%ebx
     f7b:	74 2d                	je     faa <sharedfd+0xaa>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     f7d:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     f84:	00 
     f85:	89 74 24 04          	mov    %esi,0x4(%esp)
     f89:	89 3c 24             	mov    %edi,(%esp)
     f8c:	e8 23 2d 00 00       	call   3cb4 <write>
     f91:	83 f8 0a             	cmp    $0xa,%eax
     f94:	74 e2                	je     f78 <sharedfd+0x78>
      printf(1, "fstests: write sharedfd failed\n");
     f96:	c7 44 24 04 fc 51 00 	movl   $0x51fc,0x4(%esp)
     f9d:	00 
     f9e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     fa5:	e8 46 2e 00 00       	call   3df0 <printf>
      break;
    }
  }
  if(pid == 0)
     faa:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     fad:	85 c0                	test   %eax,%eax
     faf:	0f 84 05 01 00 00    	je     10ba <sharedfd+0x1ba>
    exit();
  else
    wait();
     fb5:	e8 e2 2c 00 00       	call   3c9c <wait>
  close(fd);
  fd = open("sharedfd", 0);
  if(fd < 0){
     fba:	31 db                	xor    %ebx,%ebx
  }
  if(pid == 0)
    exit();
  else
    wait();
  close(fd);
     fbc:	89 3c 24             	mov    %edi,(%esp)
  fd = open("sharedfd", 0);
  if(fd < 0){
     fbf:	31 ff                	xor    %edi,%edi
  }
  if(pid == 0)
    exit();
  else
    wait();
  close(fd);
     fc1:	e8 f6 2c 00 00       	call   3cbc <close>
  fd = open("sharedfd", 0);
     fc6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     fcd:	00 
     fce:	c7 04 24 0b 45 00 00 	movl   $0x450b,(%esp)
     fd5:	e8 fa 2c 00 00       	call   3cd4 <open>
  if(fd < 0){
     fda:	85 c0                	test   %eax,%eax
  if(pid == 0)
    exit();
  else
    wait();
  close(fd);
  fd = open("sharedfd", 0);
     fdc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  if(fd < 0){
     fdf:	0f 88 a3 00 00 00    	js     1088 <sharedfd+0x188>
     fe5:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
     fe8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     feb:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     ff2:	00 
     ff3:	89 74 24 04          	mov    %esi,0x4(%esp)
     ff7:	89 04 24             	mov    %eax,(%esp)
     ffa:	e8 ad 2c 00 00       	call   3cac <read>
     fff:	85 c0                	test   %eax,%eax
    1001:	7e 26                	jle    1029 <sharedfd+0x129>
    1003:	31 c0                	xor    %eax,%eax
    1005:	eb 14                	jmp    101b <sharedfd+0x11b>
    1007:	90                   	nop
    for(i = 0; i < sizeof(buf); i++){
      if(buf[i] == 'c')
        nc++;
      if(buf[i] == 'p')
        np++;
    1008:	80 fa 70             	cmp    $0x70,%dl
    100b:	0f 94 c2             	sete   %dl
    100e:	0f b6 d2             	movzbl %dl,%edx
    1011:	01 d3                	add    %edx,%ebx
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i = 0; i < sizeof(buf); i++){
    1013:	83 c0 01             	add    $0x1,%eax
    1016:	83 f8 0a             	cmp    $0xa,%eax
    1019:	74 cd                	je     fe8 <sharedfd+0xe8>
      if(buf[i] == 'c')
    101b:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
    101f:	80 fa 63             	cmp    $0x63,%dl
    1022:	75 e4                	jne    1008 <sharedfd+0x108>
        nc++;
    1024:	83 c7 01             	add    $0x1,%edi
    1027:	eb ea                	jmp    1013 <sharedfd+0x113>
      if(buf[i] == 'p')
        np++;
    }
  }
  close(fd);
    1029:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    102c:	89 04 24             	mov    %eax,(%esp)
    102f:	e8 88 2c 00 00       	call   3cbc <close>
  unlink("sharedfd");
    1034:	c7 04 24 0b 45 00 00 	movl   $0x450b,(%esp)
    103b:	e8 a4 2c 00 00       	call   3ce4 <unlink>
  if(nc == 10000 && np == 10000){
    1040:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
    1046:	75 56                	jne    109e <sharedfd+0x19e>
    1048:	81 ff 10 27 00 00    	cmp    $0x2710,%edi
    104e:	75 4e                	jne    109e <sharedfd+0x19e>
    printf(1, "sharedfd ok\n");
    1050:	c7 44 24 04 14 45 00 	movl   $0x4514,0x4(%esp)
    1057:	00 
    1058:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    105f:	e8 8c 2d 00 00       	call   3df0 <printf>
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
    1064:	83 c4 3c             	add    $0x3c,%esp
    1067:	5b                   	pop    %ebx
    1068:	5e                   	pop    %esi
    1069:	5f                   	pop    %edi
    106a:	5d                   	pop    %ebp
    106b:	c3                   	ret    
  printf(1, "sharedfd test\n");

  unlink("sharedfd");
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
    106c:	c7 44 24 04 d0 51 00 	movl   $0x51d0,0x4(%esp)
    1073:	00 
    1074:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    107b:	e8 70 2d 00 00       	call   3df0 <printf>
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
    1080:	83 c4 3c             	add    $0x3c,%esp
    1083:	5b                   	pop    %ebx
    1084:	5e                   	pop    %esi
    1085:	5f                   	pop    %edi
    1086:	5d                   	pop    %ebp
    1087:	c3                   	ret    
  else
    wait();
  close(fd);
  fd = open("sharedfd", 0);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for reading\n");
    1088:	c7 44 24 04 1c 52 00 	movl   $0x521c,0x4(%esp)
    108f:	00 
    1090:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1097:	e8 54 2d 00 00       	call   3df0 <printf>
    return;
    109c:	eb c6                	jmp    1064 <sharedfd+0x164>
  close(fd);
  unlink("sharedfd");
  if(nc == 10000 && np == 10000){
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    109e:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    10a2:	89 7c 24 08          	mov    %edi,0x8(%esp)
    10a6:	c7 44 24 04 21 45 00 	movl   $0x4521,0x4(%esp)
    10ad:	00 
    10ae:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10b5:	e8 36 2d 00 00       	call   3df0 <printf>
    exit();
    10ba:	e8 d5 2b 00 00       	call   3c94 <exit>
    10bf:	90                   	nop

000010c0 <fourfiles>:

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
    10c0:	55                   	push   %ebp
    10c1:	89 e5                	mov    %esp,%ebp
    10c3:	57                   	push   %edi
    10c4:	56                   	push   %esi
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
  char *fname;

  printf(1, "fourfiles test\n");
    10c5:	be 36 45 00 00       	mov    $0x4536,%esi

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
    10ca:	53                   	push   %ebx
  char *names[] = { "f0", "f1", "f2", "f3" };
  char *fname;

  printf(1, "fourfiles test\n");

  for(pi = 0; pi < 4; pi++){
    10cb:	31 db                	xor    %ebx,%ebx

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
    10cd:	83 ec 3c             	sub    $0x3c,%esp
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
  char *fname;

  printf(1, "fourfiles test\n");
    10d0:	c7 44 24 04 3c 45 00 	movl   $0x453c,0x4(%esp)
    10d7:	00 
// time, to test block allocation.
void
fourfiles(void)
{
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
    10d8:	c7 45 d8 36 45 00 00 	movl   $0x4536,-0x28(%ebp)
    10df:	c7 45 dc 7f 46 00 00 	movl   $0x467f,-0x24(%ebp)
    10e6:	c7 45 e0 83 46 00 00 	movl   $0x4683,-0x20(%ebp)
    10ed:	c7 45 e4 39 45 00 00 	movl   $0x4539,-0x1c(%ebp)
  char *fname;

  printf(1, "fourfiles test\n");
    10f4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10fb:	e8 f0 2c 00 00       	call   3df0 <printf>

  for(pi = 0; pi < 4; pi++){
    fname = names[pi];
    unlink(fname);
    1100:	89 34 24             	mov    %esi,(%esp)
    1103:	e8 dc 2b 00 00       	call   3ce4 <unlink>

    pid = fork();
    1108:	e8 7f 2b 00 00       	call   3c8c <fork>
    if(pid < 0){
    110d:	83 f8 00             	cmp    $0x0,%eax
    1110:	0f 8c 90 01 00 00    	jl     12a6 <fourfiles+0x1e6>
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
    1116:	0f 84 eb 00 00 00    	je     1207 <fourfiles+0x147>
  char *names[] = { "f0", "f1", "f2", "f3" };
  char *fname;

  printf(1, "fourfiles test\n");

  for(pi = 0; pi < 4; pi++){
    111c:	83 c3 01             	add    $0x1,%ebx
    111f:	83 fb 04             	cmp    $0x4,%ebx
    1122:	74 06                	je     112a <fourfiles+0x6a>
    1124:	8b 74 9d d8          	mov    -0x28(%ebp,%ebx,4),%esi
    1128:	eb d6                	jmp    1100 <fourfiles+0x40>
      exit();
    }
  }

  for(pi = 0; pi < 4; pi++){
    wait();
    112a:	e8 6d 2b 00 00       	call   3c9c <wait>
    112f:	bb 30 00 00 00       	mov    $0x30,%ebx
    1134:	e8 63 2b 00 00       	call   3c9c <wait>
    1139:	e8 5e 2b 00 00       	call   3c9c <wait>
    113e:	e8 59 2b 00 00       	call   3c9c <wait>
    1143:	c7 45 d4 36 45 00 00 	movl   $0x4536,-0x2c(%ebp)
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    114a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    total = 0;
    114d:	31 f6                	xor    %esi,%esi
    wait();
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    114f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1156:	00 
    1157:	89 04 24             	mov    %eax,(%esp)
    115a:	e8 75 2b 00 00       	call   3cd4 <open>
    115f:	89 c7                	mov    %eax,%edi
    1161:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
    1168:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    116f:	00 
    1170:	c7 44 24 04 60 89 00 	movl   $0x8960,0x4(%esp)
    1177:	00 
    1178:	89 3c 24             	mov    %edi,(%esp)
    117b:	e8 2c 2b 00 00       	call   3cac <read>
    1180:	85 c0                	test   %eax,%eax
    1182:	7e 1a                	jle    119e <fourfiles+0xde>
    1184:	31 d2                	xor    %edx,%edx
    1186:	66 90                	xchg   %ax,%ax
      for(j = 0; j < n; j++){
        if(buf[j] != '0'+i){
    1188:	0f be 8a 60 89 00 00 	movsbl 0x8960(%edx),%ecx
    118f:	39 d9                	cmp    %ebx,%ecx
    1191:	75 5b                	jne    11ee <fourfiles+0x12e>
  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
    1193:	83 c2 01             	add    $0x1,%edx
    1196:	39 c2                	cmp    %eax,%edx
    1198:	75 ee                	jne    1188 <fourfiles+0xc8>
        if(buf[j] != '0'+i){
          printf(1, "wrong char\n");
          exit();
        }
      }
      total += n;
    119a:	01 d6                	add    %edx,%esi
    119c:	eb ca                	jmp    1168 <fourfiles+0xa8>
    }
    close(fd);
    119e:	89 3c 24             	mov    %edi,(%esp)
    11a1:	e8 16 2b 00 00       	call   3cbc <close>
    if(total != 12*500){
    11a6:	81 fe 70 17 00 00    	cmp    $0x1770,%esi
    11ac:	0f 85 d7 00 00 00    	jne    1289 <fourfiles+0x1c9>
      printf(1, "wrong length %d\n", total);
      exit();
    }
    unlink(fname);
    11b2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    11b5:	89 04 24             	mov    %eax,(%esp)
    11b8:	e8 27 2b 00 00       	call   3ce4 <unlink>

  for(pi = 0; pi < 4; pi++){
    wait();
  }

  for(i = 0; i < 2; i++){
    11bd:	83 fb 31             	cmp    $0x31,%ebx
    11c0:	75 1c                	jne    11de <fourfiles+0x11e>
      exit();
    }
    unlink(fname);
  }

  printf(1, "fourfiles ok\n");
    11c2:	c7 44 24 04 7a 45 00 	movl   $0x457a,0x4(%esp)
    11c9:	00 
    11ca:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    11d1:	e8 1a 2c 00 00       	call   3df0 <printf>
}
    11d6:	83 c4 3c             	add    $0x3c,%esp
    11d9:	5b                   	pop    %ebx
    11da:	5e                   	pop    %esi
    11db:	5f                   	pop    %edi
    11dc:	5d                   	pop    %ebp
    11dd:	c3                   	ret    

  for(pi = 0; pi < 4; pi++){
    wait();
  }

  for(i = 0; i < 2; i++){
    11de:	8b 45 dc             	mov    -0x24(%ebp),%eax
    11e1:	bb 31 00 00 00       	mov    $0x31,%ebx
    11e6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    11e9:	e9 5c ff ff ff       	jmp    114a <fourfiles+0x8a>
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
        if(buf[j] != '0'+i){
          printf(1, "wrong char\n");
    11ee:	c7 44 24 04 5d 45 00 	movl   $0x455d,0x4(%esp)
    11f5:	00 
    11f6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    11fd:	e8 ee 2b 00 00       	call   3df0 <printf>
          exit();
    1202:	e8 8d 2a 00 00       	call   3c94 <exit>
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
    1207:	89 34 24             	mov    %esi,(%esp)
    120a:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    1211:	00 
    1212:	e8 bd 2a 00 00       	call   3cd4 <open>
      if(fd < 0){
    1217:	85 c0                	test   %eax,%eax
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
    1219:	89 c6                	mov    %eax,%esi
      if(fd < 0){
    121b:	0f 88 9e 00 00 00    	js     12bf <fourfiles+0x1ff>
        printf(1, "create failed\n");
        exit();
      }

      memset(buf, '0'+pi, 512);
    1221:	83 c3 30             	add    $0x30,%ebx
    1224:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    1228:	bb 0c 00 00 00       	mov    $0xc,%ebx
    122d:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    1234:	00 
    1235:	c7 04 24 60 89 00 00 	movl   $0x8960,(%esp)
    123c:	e8 cf 28 00 00       	call   3b10 <memset>
    1241:	eb 0a                	jmp    124d <fourfiles+0x18d>
    1243:	90                   	nop
    1244:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      for(i = 0; i < 12; i++){
    1248:	83 eb 01             	sub    $0x1,%ebx
    124b:	74 b5                	je     1202 <fourfiles+0x142>
        if((n = write(fd, buf, 500)) != 500){
    124d:	c7 44 24 08 f4 01 00 	movl   $0x1f4,0x8(%esp)
    1254:	00 
    1255:	c7 44 24 04 60 89 00 	movl   $0x8960,0x4(%esp)
    125c:	00 
    125d:	89 34 24             	mov    %esi,(%esp)
    1260:	e8 4f 2a 00 00       	call   3cb4 <write>
    1265:	3d f4 01 00 00       	cmp    $0x1f4,%eax
    126a:	74 dc                	je     1248 <fourfiles+0x188>
          printf(1, "write failed %d\n", n);
    126c:	89 44 24 08          	mov    %eax,0x8(%esp)
    1270:	c7 44 24 04 4c 45 00 	movl   $0x454c,0x4(%esp)
    1277:	00 
    1278:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    127f:	e8 6c 2b 00 00       	call   3df0 <printf>
          exit();
    1284:	e8 0b 2a 00 00       	call   3c94 <exit>
      }
      total += n;
    }
    close(fd);
    if(total != 12*500){
      printf(1, "wrong length %d\n", total);
    1289:	89 74 24 08          	mov    %esi,0x8(%esp)
    128d:	c7 44 24 04 69 45 00 	movl   $0x4569,0x4(%esp)
    1294:	00 
    1295:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    129c:	e8 4f 2b 00 00       	call   3df0 <printf>
      exit();
    12a1:	e8 ee 29 00 00       	call   3c94 <exit>
    fname = names[pi];
    unlink(fname);

    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    12a6:	c7 44 24 04 11 50 00 	movl   $0x5011,0x4(%esp)
    12ad:	00 
    12ae:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    12b5:	e8 36 2b 00 00       	call   3df0 <printf>
      exit();
    12ba:	e8 d5 29 00 00       	call   3c94 <exit>
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "create failed\n");
    12bf:	c7 44 24 04 d7 47 00 	movl   $0x47d7,0x4(%esp)
    12c6:	00 
    12c7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    12ce:	e8 1d 2b 00 00       	call   3df0 <printf>
        exit();
    12d3:	e8 bc 29 00 00       	call   3c94 <exit>
    12d8:	90                   	nop
    12d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000012e0 <createdelete>:
}

// four processes create and delete different files in same directory
void
createdelete(void)
{
    12e0:	55                   	push   %ebp
    12e1:	89 e5                	mov    %esp,%ebp
    12e3:	57                   	push   %edi
    12e4:	56                   	push   %esi
    12e5:	53                   	push   %ebx
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    12e6:	31 db                	xor    %ebx,%ebx
}

// four processes create and delete different files in same directory
void
createdelete(void)
{
    12e8:	83 ec 4c             	sub    $0x4c,%esp
  enum { N = 20 };
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");
    12eb:	c7 44 24 04 88 45 00 	movl   $0x4588,0x4(%esp)
    12f2:	00 
    12f3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    12fa:	e8 f1 2a 00 00       	call   3df0 <printf>

  for(pi = 0; pi < 4; pi++){
    pid = fork();
    12ff:	e8 88 29 00 00       	call   3c8c <fork>
    if(pid < 0){
    1304:	83 f8 00             	cmp    $0x0,%eax
    1307:	0f 8c d3 01 00 00    	jl     14e0 <createdelete+0x200>
    130d:	8d 76 00             	lea    0x0(%esi),%esi
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
    1310:	0f 84 e9 00 00 00    	je     13ff <createdelete+0x11f>
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    1316:	83 c3 01             	add    $0x1,%ebx
    1319:	83 fb 04             	cmp    $0x4,%ebx
    131c:	75 e1                	jne    12ff <createdelete+0x1f>
    131e:	8d 75 c8             	lea    -0x38(%ebp),%esi
  for(pi = 0; pi < 4; pi++){
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    1321:	31 ff                	xor    %edi,%edi
      exit();
    }
  }

  for(pi = 0; pi < 4; pi++){
    wait();
    1323:	e8 74 29 00 00       	call   3c9c <wait>
    1328:	e8 6f 29 00 00       	call   3c9c <wait>
    132d:	e8 6a 29 00 00       	call   3c9c <wait>
    1332:	e8 65 29 00 00       	call   3c9c <wait>
  }

  name[0] = name[1] = name[2] = 0;
    1337:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    133b:	89 75 c0             	mov    %esi,-0x40(%ebp)
    133e:	66 90                	xchg   %ax,%ax
  printf(1, "fourfiles ok\n");
}

// four processes create and delete different files in same directory
void
createdelete(void)
    1340:	85 ff                	test   %edi,%edi
    1342:	bb 70 00 00 00       	mov    $0x70,%ebx
    1347:	0f 94 c0             	sete   %al
    134a:	83 ff 09             	cmp    $0x9,%edi
    134d:	8d 57 30             	lea    0x30(%edi),%edx
    1350:	89 c6                	mov    %eax,%esi
    1352:	88 55 c4             	mov    %dl,-0x3c(%ebp)
    1355:	0f 9f c0             	setg   %al
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit();
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1358:	8d 57 ff             	lea    -0x1(%edi),%edx
  printf(1, "fourfiles ok\n");
}

// four processes create and delete different files in same directory
void
createdelete(void)
    135b:	09 c6                	or     %eax,%esi
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit();
      } else if((i >= 1 && i < N/2) && fd >= 0){
    135d:	89 55 bc             	mov    %edx,-0x44(%ebp)

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
    1360:	0f b6 55 c4          	movzbl -0x3c(%ebp),%edx
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
    1364:	88 5d c8             	mov    %bl,-0x38(%ebp)
      name[1] = '0' + i;
      fd = open(name, 0);
    1367:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    136e:	00 

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
    136f:	88 55 c9             	mov    %dl,-0x37(%ebp)
      fd = open(name, 0);
    1372:	8b 55 c0             	mov    -0x40(%ebp),%edx
    1375:	89 14 24             	mov    %edx,(%esp)
    1378:	e8 57 29 00 00       	call   3cd4 <open>
      if((i == 0 || i >= N/2) && fd < 0){
    137d:	89 f2                	mov    %esi,%edx
    137f:	84 d2                	test   %dl,%dl
    1381:	74 08                	je     138b <createdelete+0xab>
    1383:	85 c0                	test   %eax,%eax
    1385:	0f 88 fd 00 00 00    	js     1488 <createdelete+0x1a8>
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit();
      } else if((i >= 1 && i < N/2) && fd >= 0){
    138b:	85 c0                	test   %eax,%eax
    138d:	8d 76 00             	lea    0x0(%esi),%esi
    1390:	0f 89 12 01 00 00    	jns    14a8 <createdelete+0x1c8>
        printf(1, "oops createdelete %s did exist\n", name);
        exit();
      }
      if(fd >= 0)
        close(fd);
    1396:	83 c3 01             	add    $0x1,%ebx
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
    1399:	80 fb 74             	cmp    $0x74,%bl
    139c:	75 c2                	jne    1360 <createdelete+0x80>
  for(pi = 0; pi < 4; pi++){
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    139e:	83 c7 01             	add    $0x1,%edi
    13a1:	83 ff 14             	cmp    $0x14,%edi
    13a4:	75 9a                	jne    1340 <createdelete+0x60>
    13a6:	8b 75 c0             	mov    -0x40(%ebp),%esi
    13a9:	bf 70 00 00 00       	mov    $0x70,%edi
    13ae:	89 75 c4             	mov    %esi,-0x3c(%ebp)
    13b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  printf(1, "fourfiles ok\n");
}

// four processes create and delete different files in same directory
void
createdelete(void)
    13b8:	8d 77 c0             	lea    -0x40(%edi),%esi
    13bb:	bb 04 00 00 00       	mov    $0x4,%ebx
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
      name[1] = '0' + i;
    13c0:	89 f2                	mov    %esi,%edx
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
    13c2:	89 f8                	mov    %edi,%eax
      name[1] = '0' + i;
    13c4:	88 55 c9             	mov    %dl,-0x37(%ebp)
      unlink(name);
    13c7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
    13ca:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
      unlink(name);
    13cd:	89 14 24             	mov    %edx,(%esp)
    13d0:	e8 0f 29 00 00       	call   3ce4 <unlink>
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
    13d5:	83 eb 01             	sub    $0x1,%ebx
    13d8:	75 e6                	jne    13c0 <createdelete+0xe0>
    13da:	83 c7 01             	add    $0x1,%edi
      if(fd >= 0)
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    13dd:	89 f8                	mov    %edi,%eax
    13df:	3c 84                	cmp    $0x84,%al
    13e1:	75 d5                	jne    13b8 <createdelete+0xd8>
      name[1] = '0' + i;
      unlink(name);
    }
  }

  printf(1, "createdelete ok\n");
    13e3:	c7 44 24 04 9b 45 00 	movl   $0x459b,0x4(%esp)
    13ea:	00 
    13eb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    13f2:	e8 f9 29 00 00       	call   3df0 <printf>
}
    13f7:	83 c4 4c             	add    $0x4c,%esp
    13fa:	5b                   	pop    %ebx
    13fb:	5e                   	pop    %esi
    13fc:	5f                   	pop    %edi
    13fd:	5d                   	pop    %ebp
    13fe:	c3                   	ret    
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      name[0] = 'p' + pi;
    13ff:	83 c3 70             	add    $0x70,%ebx
      name[2] = '\0';
    1402:	bf 01 00 00 00       	mov    $0x1,%edi
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      name[0] = 'p' + pi;
    1407:	88 5d c8             	mov    %bl,-0x38(%ebp)
    140a:	8d 75 c8             	lea    -0x38(%ebp),%esi
      name[2] = '\0';
    140d:	31 db                	xor    %ebx,%ebx
    140f:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    1413:	eb 12                	jmp    1427 <createdelete+0x147>
    1415:	8d 76 00             	lea    0x0(%esi),%esi
      for(i = 0; i < N; i++){
    1418:	83 ff 14             	cmp    $0x14,%edi
    141b:	0f 84 82 00 00 00    	je     14a3 <createdelete+0x1c3>
      exit();
    }

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
    1421:	83 c3 01             	add    $0x1,%ebx
    1424:	83 c7 01             	add    $0x1,%edi
  printf(1, "fourfiles ok\n");
}

// four processes create and delete different files in same directory
void
createdelete(void)
    1427:	8d 43 30             	lea    0x30(%ebx),%eax
    142a:	88 45 c9             	mov    %al,-0x37(%ebp)
    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
        fd = open(name, O_CREATE | O_RDWR);
    142d:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    1434:	00 
    1435:	89 34 24             	mov    %esi,(%esp)
    1438:	e8 97 28 00 00       	call   3cd4 <open>
        if(fd < 0){
    143d:	85 c0                	test   %eax,%eax
    143f:	0f 88 b4 00 00 00    	js     14f9 <createdelete+0x219>
          printf(1, "create failed\n");
          exit();
        }
        close(fd);
    1445:	89 04 24             	mov    %eax,(%esp)
    1448:	e8 6f 28 00 00       	call   3cbc <close>
        if(i > 0 && (i % 2 ) == 0){
    144d:	85 db                	test   %ebx,%ebx
    144f:	74 d0                	je     1421 <createdelete+0x141>
    1451:	f6 c3 01             	test   $0x1,%bl
    1454:	75 c2                	jne    1418 <createdelete+0x138>
          name[1] = '0' + (i / 2);
    1456:	89 d8                	mov    %ebx,%eax
    1458:	d1 f8                	sar    %eax
    145a:	83 c0 30             	add    $0x30,%eax
    145d:	88 45 c9             	mov    %al,-0x37(%ebp)
          if(unlink(name) < 0){
    1460:	89 34 24             	mov    %esi,(%esp)
    1463:	e8 7c 28 00 00       	call   3ce4 <unlink>
    1468:	85 c0                	test   %eax,%eax
    146a:	79 ac                	jns    1418 <createdelete+0x138>
            printf(1, "unlink failed\n");
    146c:	c7 44 24 04 89 41 00 	movl   $0x4189,0x4(%esp)
    1473:	00 
    1474:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    147b:	e8 70 29 00 00       	call   3df0 <printf>
            exit();
    1480:	e8 0f 28 00 00       	call   3c94 <exit>
    1485:	8d 76 00             	lea    0x0(%esi),%esi
    1488:	8b 75 c0             	mov    -0x40(%ebp),%esi
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
    148b:	c7 44 24 04 48 52 00 	movl   $0x5248,0x4(%esp)
    1492:	00 
    1493:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    149a:	89 74 24 08          	mov    %esi,0x8(%esp)
    149e:	e8 4d 29 00 00       	call   3df0 <printf>
        exit();
    14a3:	e8 ec 27 00 00       	call   3c94 <exit>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    14a8:	83 7d bc 08          	cmpl   $0x8,-0x44(%ebp)
    14ac:	76 12                	jbe    14c0 <createdelete+0x1e0>
        printf(1, "oops createdelete %s did exist\n", name);
        exit();
      }
      if(fd >= 0)
        close(fd);
    14ae:	89 04 24             	mov    %eax,(%esp)
    14b1:	e8 06 28 00 00       	call   3cbc <close>
    14b6:	e9 db fe ff ff       	jmp    1396 <createdelete+0xb6>
    14bb:	90                   	nop
    14bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    14c0:	8b 75 c0             	mov    -0x40(%ebp),%esi
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit();
      } else if((i >= 1 && i < N/2) && fd >= 0){
        printf(1, "oops createdelete %s did exist\n", name);
    14c3:	c7 44 24 04 6c 52 00 	movl   $0x526c,0x4(%esp)
    14ca:	00 
    14cb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    14d2:	89 74 24 08          	mov    %esi,0x8(%esp)
    14d6:	e8 15 29 00 00       	call   3df0 <printf>
        exit();
    14db:	e8 b4 27 00 00       	call   3c94 <exit>
  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    14e0:	c7 44 24 04 11 50 00 	movl   $0x5011,0x4(%esp)
    14e7:	00 
    14e8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    14ef:	e8 fc 28 00 00       	call   3df0 <printf>
      exit();
    14f4:	e8 9b 27 00 00       	call   3c94 <exit>
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
        fd = open(name, O_CREATE | O_RDWR);
        if(fd < 0){
          printf(1, "create failed\n");
    14f9:	c7 44 24 04 d7 47 00 	movl   $0x47d7,0x4(%esp)
    1500:	00 
    1501:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1508:	e8 e3 28 00 00       	call   3df0 <printf>
          exit();
    150d:	e8 82 27 00 00       	call   3c94 <exit>
    1512:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001520 <unlinkread>:
}

// can I unlink a file and still read it?
void
unlinkread(void)
{
    1520:	55                   	push   %ebp
    1521:	89 e5                	mov    %esp,%ebp
    1523:	56                   	push   %esi
    1524:	53                   	push   %ebx
    1525:	83 ec 10             	sub    $0x10,%esp
  int fd, fd1;

  printf(1, "unlinkread test\n");
    1528:	c7 44 24 04 ac 45 00 	movl   $0x45ac,0x4(%esp)
    152f:	00 
    1530:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1537:	e8 b4 28 00 00       	call   3df0 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    153c:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    1543:	00 
    1544:	c7 04 24 bd 45 00 00 	movl   $0x45bd,(%esp)
    154b:	e8 84 27 00 00       	call   3cd4 <open>
  if(fd < 0){
    1550:	85 c0                	test   %eax,%eax
unlinkread(void)
{
  int fd, fd1;

  printf(1, "unlinkread test\n");
  fd = open("unlinkread", O_CREATE | O_RDWR);
    1552:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1554:	0f 88 fe 00 00 00    	js     1658 <unlinkread+0x138>
    printf(1, "create unlinkread failed\n");
    exit();
  }
  write(fd, "hello", 5);
    155a:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    1561:	00 
    1562:	c7 44 24 04 e2 45 00 	movl   $0x45e2,0x4(%esp)
    1569:	00 
    156a:	89 04 24             	mov    %eax,(%esp)
    156d:	e8 42 27 00 00       	call   3cb4 <write>
  close(fd);
    1572:	89 1c 24             	mov    %ebx,(%esp)
    1575:	e8 42 27 00 00       	call   3cbc <close>

  fd = open("unlinkread", O_RDWR);
    157a:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    1581:	00 
    1582:	c7 04 24 bd 45 00 00 	movl   $0x45bd,(%esp)
    1589:	e8 46 27 00 00       	call   3cd4 <open>
  if(fd < 0){
    158e:	85 c0                	test   %eax,%eax
    exit();
  }
  write(fd, "hello", 5);
  close(fd);

  fd = open("unlinkread", O_RDWR);
    1590:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1592:	0f 88 3d 01 00 00    	js     16d5 <unlinkread+0x1b5>
    printf(1, "open unlinkread failed\n");
    exit();
  }
  if(unlink("unlinkread") != 0){
    1598:	c7 04 24 bd 45 00 00 	movl   $0x45bd,(%esp)
    159f:	e8 40 27 00 00       	call   3ce4 <unlink>
    15a4:	85 c0                	test   %eax,%eax
    15a6:	0f 85 10 01 00 00    	jne    16bc <unlinkread+0x19c>
    printf(1, "unlink unlinkread failed\n");
    exit();
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    15ac:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    15b3:	00 
    15b4:	c7 04 24 bd 45 00 00 	movl   $0x45bd,(%esp)
    15bb:	e8 14 27 00 00       	call   3cd4 <open>
  write(fd1, "yyy", 3);
    15c0:	c7 44 24 08 03 00 00 	movl   $0x3,0x8(%esp)
    15c7:	00 
    15c8:	c7 44 24 04 1a 46 00 	movl   $0x461a,0x4(%esp)
    15cf:	00 
  if(unlink("unlinkread") != 0){
    printf(1, "unlink unlinkread failed\n");
    exit();
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    15d0:	89 c6                	mov    %eax,%esi
  write(fd1, "yyy", 3);
    15d2:	89 04 24             	mov    %eax,(%esp)
    15d5:	e8 da 26 00 00       	call   3cb4 <write>
  close(fd1);
    15da:	89 34 24             	mov    %esi,(%esp)
    15dd:	e8 da 26 00 00       	call   3cbc <close>

  if(read(fd, buf, sizeof(buf)) != 5){
    15e2:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    15e9:	00 
    15ea:	c7 44 24 04 60 89 00 	movl   $0x8960,0x4(%esp)
    15f1:	00 
    15f2:	89 1c 24             	mov    %ebx,(%esp)
    15f5:	e8 b2 26 00 00       	call   3cac <read>
    15fa:	83 f8 05             	cmp    $0x5,%eax
    15fd:	0f 85 a0 00 00 00    	jne    16a3 <unlinkread+0x183>
    printf(1, "unlinkread read failed");
    exit();
  }
  if(buf[0] != 'h'){
    1603:	80 3d 60 89 00 00 68 	cmpb   $0x68,0x8960
    160a:	75 7e                	jne    168a <unlinkread+0x16a>
    printf(1, "unlinkread wrong data\n");
    exit();
  }
  if(write(fd, buf, 10) != 10){
    160c:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    1613:	00 
    1614:	c7 44 24 04 60 89 00 	movl   $0x8960,0x4(%esp)
    161b:	00 
    161c:	89 1c 24             	mov    %ebx,(%esp)
    161f:	e8 90 26 00 00       	call   3cb4 <write>
    1624:	83 f8 0a             	cmp    $0xa,%eax
    1627:	75 48                	jne    1671 <unlinkread+0x151>
    printf(1, "unlinkread write failed\n");
    exit();
  }
  close(fd);
    1629:	89 1c 24             	mov    %ebx,(%esp)
    162c:	e8 8b 26 00 00       	call   3cbc <close>
  unlink("unlinkread");
    1631:	c7 04 24 bd 45 00 00 	movl   $0x45bd,(%esp)
    1638:	e8 a7 26 00 00       	call   3ce4 <unlink>
  printf(1, "unlinkread ok\n");
    163d:	c7 44 24 04 65 46 00 	movl   $0x4665,0x4(%esp)
    1644:	00 
    1645:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    164c:	e8 9f 27 00 00       	call   3df0 <printf>
}
    1651:	83 c4 10             	add    $0x10,%esp
    1654:	5b                   	pop    %ebx
    1655:	5e                   	pop    %esi
    1656:	5d                   	pop    %ebp
    1657:	c3                   	ret    
  int fd, fd1;

  printf(1, "unlinkread test\n");
  fd = open("unlinkread", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create unlinkread failed\n");
    1658:	c7 44 24 04 c8 45 00 	movl   $0x45c8,0x4(%esp)
    165f:	00 
    1660:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1667:	e8 84 27 00 00       	call   3df0 <printf>
    exit();
    166c:	e8 23 26 00 00       	call   3c94 <exit>
  if(buf[0] != 'h'){
    printf(1, "unlinkread wrong data\n");
    exit();
  }
  if(write(fd, buf, 10) != 10){
    printf(1, "unlinkread write failed\n");
    1671:	c7 44 24 04 4c 46 00 	movl   $0x464c,0x4(%esp)
    1678:	00 
    1679:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1680:	e8 6b 27 00 00       	call   3df0 <printf>
    exit();
    1685:	e8 0a 26 00 00       	call   3c94 <exit>
  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "unlinkread read failed");
    exit();
  }
  if(buf[0] != 'h'){
    printf(1, "unlinkread wrong data\n");
    168a:	c7 44 24 04 35 46 00 	movl   $0x4635,0x4(%esp)
    1691:	00 
    1692:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1699:	e8 52 27 00 00       	call   3df0 <printf>
    exit();
    169e:	e8 f1 25 00 00       	call   3c94 <exit>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
  write(fd1, "yyy", 3);
  close(fd1);

  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "unlinkread read failed");
    16a3:	c7 44 24 04 1e 46 00 	movl   $0x461e,0x4(%esp)
    16aa:	00 
    16ab:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    16b2:	e8 39 27 00 00       	call   3df0 <printf>
    exit();
    16b7:	e8 d8 25 00 00       	call   3c94 <exit>
  if(fd < 0){
    printf(1, "open unlinkread failed\n");
    exit();
  }
  if(unlink("unlinkread") != 0){
    printf(1, "unlink unlinkread failed\n");
    16bc:	c7 44 24 04 00 46 00 	movl   $0x4600,0x4(%esp)
    16c3:	00 
    16c4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    16cb:	e8 20 27 00 00       	call   3df0 <printf>
    exit();
    16d0:	e8 bf 25 00 00       	call   3c94 <exit>
  write(fd, "hello", 5);
  close(fd);

  fd = open("unlinkread", O_RDWR);
  if(fd < 0){
    printf(1, "open unlinkread failed\n");
    16d5:	c7 44 24 04 e8 45 00 	movl   $0x45e8,0x4(%esp)
    16dc:	00 
    16dd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    16e4:	e8 07 27 00 00       	call   3df0 <printf>
    exit();
    16e9:	e8 a6 25 00 00       	call   3c94 <exit>
    16ee:	66 90                	xchg   %ax,%ax

000016f0 <linktest>:
  printf(1, "unlinkread ok\n");
}

void
linktest(void)
{
    16f0:	55                   	push   %ebp
    16f1:	89 e5                	mov    %esp,%ebp
    16f3:	53                   	push   %ebx
    16f4:	83 ec 14             	sub    $0x14,%esp
  int fd;

  printf(1, "linktest\n");
    16f7:	c7 44 24 04 74 46 00 	movl   $0x4674,0x4(%esp)
    16fe:	00 
    16ff:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1706:	e8 e5 26 00 00       	call   3df0 <printf>

  unlink("lf1");
    170b:	c7 04 24 7e 46 00 00 	movl   $0x467e,(%esp)
    1712:	e8 cd 25 00 00       	call   3ce4 <unlink>
  unlink("lf2");
    1717:	c7 04 24 82 46 00 00 	movl   $0x4682,(%esp)
    171e:	e8 c1 25 00 00       	call   3ce4 <unlink>

  fd = open("lf1", O_CREATE|O_RDWR);
    1723:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    172a:	00 
    172b:	c7 04 24 7e 46 00 00 	movl   $0x467e,(%esp)
    1732:	e8 9d 25 00 00       	call   3cd4 <open>
  if(fd < 0){
    1737:	85 c0                	test   %eax,%eax
  printf(1, "linktest\n");

  unlink("lf1");
  unlink("lf2");

  fd = open("lf1", O_CREATE|O_RDWR);
    1739:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    173b:	0f 88 26 01 00 00    	js     1867 <linktest+0x177>
    printf(1, "create lf1 failed\n");
    exit();
  }
  if(write(fd, "hello", 5) != 5){
    1741:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    1748:	00 
    1749:	c7 44 24 04 e2 45 00 	movl   $0x45e2,0x4(%esp)
    1750:	00 
    1751:	89 04 24             	mov    %eax,(%esp)
    1754:	e8 5b 25 00 00       	call   3cb4 <write>
    1759:	83 f8 05             	cmp    $0x5,%eax
    175c:	0f 85 cd 01 00 00    	jne    192f <linktest+0x23f>
    printf(1, "write lf1 failed\n");
    exit();
  }
  close(fd);
    1762:	89 1c 24             	mov    %ebx,(%esp)
    1765:	e8 52 25 00 00       	call   3cbc <close>

  if(link("lf1", "lf2") < 0){
    176a:	c7 44 24 04 82 46 00 	movl   $0x4682,0x4(%esp)
    1771:	00 
    1772:	c7 04 24 7e 46 00 00 	movl   $0x467e,(%esp)
    1779:	e8 76 25 00 00       	call   3cf4 <link>
    177e:	85 c0                	test   %eax,%eax
    1780:	0f 88 90 01 00 00    	js     1916 <linktest+0x226>
    printf(1, "link lf1 lf2 failed\n");
    exit();
  }
  unlink("lf1");
    1786:	c7 04 24 7e 46 00 00 	movl   $0x467e,(%esp)
    178d:	e8 52 25 00 00       	call   3ce4 <unlink>

  if(open("lf1", 0) >= 0){
    1792:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1799:	00 
    179a:	c7 04 24 7e 46 00 00 	movl   $0x467e,(%esp)
    17a1:	e8 2e 25 00 00       	call   3cd4 <open>
    17a6:	85 c0                	test   %eax,%eax
    17a8:	0f 89 4f 01 00 00    	jns    18fd <linktest+0x20d>
    printf(1, "unlinked lf1 but it is still there!\n");
    exit();
  }

  fd = open("lf2", 0);
    17ae:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    17b5:	00 
    17b6:	c7 04 24 82 46 00 00 	movl   $0x4682,(%esp)
    17bd:	e8 12 25 00 00       	call   3cd4 <open>
  if(fd < 0){
    17c2:	85 c0                	test   %eax,%eax
  if(open("lf1", 0) >= 0){
    printf(1, "unlinked lf1 but it is still there!\n");
    exit();
  }

  fd = open("lf2", 0);
    17c4:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    17c6:	0f 88 18 01 00 00    	js     18e4 <linktest+0x1f4>
    printf(1, "open lf2 failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    17cc:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    17d3:	00 
    17d4:	c7 44 24 04 60 89 00 	movl   $0x8960,0x4(%esp)
    17db:	00 
    17dc:	89 04 24             	mov    %eax,(%esp)
    17df:	e8 c8 24 00 00       	call   3cac <read>
    17e4:	83 f8 05             	cmp    $0x5,%eax
    17e7:	0f 85 de 00 00 00    	jne    18cb <linktest+0x1db>
    printf(1, "read lf2 failed\n");
    exit();
  }
  close(fd);
    17ed:	89 1c 24             	mov    %ebx,(%esp)
    17f0:	e8 c7 24 00 00       	call   3cbc <close>

  if(link("lf2", "lf2") >= 0){
    17f5:	c7 44 24 04 82 46 00 	movl   $0x4682,0x4(%esp)
    17fc:	00 
    17fd:	c7 04 24 82 46 00 00 	movl   $0x4682,(%esp)
    1804:	e8 eb 24 00 00       	call   3cf4 <link>
    1809:	85 c0                	test   %eax,%eax
    180b:	0f 89 a1 00 00 00    	jns    18b2 <linktest+0x1c2>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    exit();
  }

  unlink("lf2");
    1811:	c7 04 24 82 46 00 00 	movl   $0x4682,(%esp)
    1818:	e8 c7 24 00 00       	call   3ce4 <unlink>
  if(link("lf2", "lf1") >= 0){
    181d:	c7 44 24 04 7e 46 00 	movl   $0x467e,0x4(%esp)
    1824:	00 
    1825:	c7 04 24 82 46 00 00 	movl   $0x4682,(%esp)
    182c:	e8 c3 24 00 00       	call   3cf4 <link>
    1831:	85 c0                	test   %eax,%eax
    1833:	79 64                	jns    1899 <linktest+0x1a9>
    printf(1, "link non-existant succeeded! oops\n");
    exit();
  }

  if(link(".", "lf1") >= 0){
    1835:	c7 44 24 04 7e 46 00 	movl   $0x467e,0x4(%esp)
    183c:	00 
    183d:	c7 04 24 46 49 00 00 	movl   $0x4946,(%esp)
    1844:	e8 ab 24 00 00       	call   3cf4 <link>
    1849:	85 c0                	test   %eax,%eax
    184b:	79 33                	jns    1880 <linktest+0x190>
    printf(1, "link . lf1 succeeded! oops\n");
    exit();
  }

  printf(1, "linktest ok\n");
    184d:	c7 44 24 04 1c 47 00 	movl   $0x471c,0x4(%esp)
    1854:	00 
    1855:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    185c:	e8 8f 25 00 00       	call   3df0 <printf>
}
    1861:	83 c4 14             	add    $0x14,%esp
    1864:	5b                   	pop    %ebx
    1865:	5d                   	pop    %ebp
    1866:	c3                   	ret    
  unlink("lf1");
  unlink("lf2");

  fd = open("lf1", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "create lf1 failed\n");
    1867:	c7 44 24 04 86 46 00 	movl   $0x4686,0x4(%esp)
    186e:	00 
    186f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1876:	e8 75 25 00 00       	call   3df0 <printf>
    exit();
    187b:	e8 14 24 00 00       	call   3c94 <exit>
    printf(1, "link non-existant succeeded! oops\n");
    exit();
  }

  if(link(".", "lf1") >= 0){
    printf(1, "link . lf1 succeeded! oops\n");
    1880:	c7 44 24 04 00 47 00 	movl   $0x4700,0x4(%esp)
    1887:	00 
    1888:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    188f:	e8 5c 25 00 00       	call   3df0 <printf>
    exit();
    1894:	e8 fb 23 00 00       	call   3c94 <exit>
    exit();
  }

  unlink("lf2");
  if(link("lf2", "lf1") >= 0){
    printf(1, "link non-existant succeeded! oops\n");
    1899:	c7 44 24 04 b4 52 00 	movl   $0x52b4,0x4(%esp)
    18a0:	00 
    18a1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    18a8:	e8 43 25 00 00       	call   3df0 <printf>
    exit();
    18ad:	e8 e2 23 00 00       	call   3c94 <exit>
    exit();
  }
  close(fd);

  if(link("lf2", "lf2") >= 0){
    printf(1, "link lf2 lf2 succeeded! oops\n");
    18b2:	c7 44 24 04 e2 46 00 	movl   $0x46e2,0x4(%esp)
    18b9:	00 
    18ba:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    18c1:	e8 2a 25 00 00       	call   3df0 <printf>
    exit();
    18c6:	e8 c9 23 00 00       	call   3c94 <exit>
  if(fd < 0){
    printf(1, "open lf2 failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "read lf2 failed\n");
    18cb:	c7 44 24 04 d1 46 00 	movl   $0x46d1,0x4(%esp)
    18d2:	00 
    18d3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    18da:	e8 11 25 00 00       	call   3df0 <printf>
    exit();
    18df:	e8 b0 23 00 00       	call   3c94 <exit>
    exit();
  }

  fd = open("lf2", 0);
  if(fd < 0){
    printf(1, "open lf2 failed\n");
    18e4:	c7 44 24 04 c0 46 00 	movl   $0x46c0,0x4(%esp)
    18eb:	00 
    18ec:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    18f3:	e8 f8 24 00 00       	call   3df0 <printf>
    exit();
    18f8:	e8 97 23 00 00       	call   3c94 <exit>
    exit();
  }
  unlink("lf1");

  if(open("lf1", 0) >= 0){
    printf(1, "unlinked lf1 but it is still there!\n");
    18fd:	c7 44 24 04 8c 52 00 	movl   $0x528c,0x4(%esp)
    1904:	00 
    1905:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    190c:	e8 df 24 00 00       	call   3df0 <printf>
    exit();
    1911:	e8 7e 23 00 00       	call   3c94 <exit>
    exit();
  }
  close(fd);

  if(link("lf1", "lf2") < 0){
    printf(1, "link lf1 lf2 failed\n");
    1916:	c7 44 24 04 ab 46 00 	movl   $0x46ab,0x4(%esp)
    191d:	00 
    191e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1925:	e8 c6 24 00 00       	call   3df0 <printf>
    exit();
    192a:	e8 65 23 00 00       	call   3c94 <exit>
  if(fd < 0){
    printf(1, "create lf1 failed\n");
    exit();
  }
  if(write(fd, "hello", 5) != 5){
    printf(1, "write lf1 failed\n");
    192f:	c7 44 24 04 99 46 00 	movl   $0x4699,0x4(%esp)
    1936:	00 
    1937:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    193e:	e8 ad 24 00 00       	call   3df0 <printf>
    exit();
    1943:	e8 4c 23 00 00       	call   3c94 <exit>
    1948:	90                   	nop
    1949:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001950 <concreate>:
}

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    1950:	55                   	push   %ebp
    1951:	89 e5                	mov    %esp,%ebp
    1953:	57                   	push   %edi
    1954:	56                   	push   %esi
    1955:	53                   	push   %ebx
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1956:	31 db                	xor    %ebx,%ebx
}

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    1958:	83 ec 6c             	sub    $0x6c,%esp
  struct {
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
    195b:	c7 44 24 04 29 47 00 	movl   $0x4729,0x4(%esp)
    1962:	00 
    1963:	8d 75 e5             	lea    -0x1b(%ebp),%esi
    1966:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    196d:	e8 7e 24 00 00       	call   3df0 <printf>
  file[0] = 'C';
    1972:	c6 45 e5 43          	movb   $0x43,-0x1b(%ebp)
  file[2] = '\0';
    1976:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
    197a:	eb 4f                	jmp    19cb <concreate+0x7b>
    197c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
    1980:	b8 56 55 55 55       	mov    $0x55555556,%eax
    1985:	f7 eb                	imul   %ebx
    1987:	89 d8                	mov    %ebx,%eax
    1989:	c1 f8 1f             	sar    $0x1f,%eax
    198c:	29 c2                	sub    %eax,%edx
    198e:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1991:	89 da                	mov    %ebx,%edx
    1993:	29 c2                	sub    %eax,%edx
    1995:	83 fa 01             	cmp    $0x1,%edx
    1998:	74 7e                	je     1a18 <concreate+0xc8>
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    199a:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    19a1:	00 
    19a2:	89 34 24             	mov    %esi,(%esp)
    19a5:	e8 2a 23 00 00       	call   3cd4 <open>
      if(fd < 0){
    19aa:	85 c0                	test   %eax,%eax
    19ac:	0f 88 43 02 00 00    	js     1bf5 <concreate+0x2a5>
        printf(1, "concreate create %s failed\n", file);
        exit();
      }
      close(fd);
    19b2:	89 04 24             	mov    %eax,(%esp)
    19b5:	e8 02 23 00 00       	call   3cbc <close>
    }
    if(pid == 0)
    19ba:	85 ff                	test   %edi,%edi
    19bc:	74 52                	je     1a10 <concreate+0xc0>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    19be:	83 c3 01             	add    $0x1,%ebx
      close(fd);
    }
    if(pid == 0)
      exit();
    else
      wait();
    19c1:	e8 d6 22 00 00       	call   3c9c <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    19c6:	83 fb 28             	cmp    $0x28,%ebx
    19c9:	74 6d                	je     1a38 <concreate+0xe8>
  printf(1, "linktest ok\n");
}

// test concurrent create/link/unlink of the same file
void
concreate(void)
    19cb:	8d 43 30             	lea    0x30(%ebx),%eax
    19ce:	88 45 e6             	mov    %al,-0x1a(%ebp)
  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    19d1:	89 34 24             	mov    %esi,(%esp)
    19d4:	e8 0b 23 00 00       	call   3ce4 <unlink>
    pid = fork();
    19d9:	e8 ae 22 00 00       	call   3c8c <fork>
    if(pid && (i % 3) == 1){
    19de:	85 c0                	test   %eax,%eax
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    19e0:	89 c7                	mov    %eax,%edi
    if(pid && (i % 3) == 1){
    19e2:	75 9c                	jne    1980 <concreate+0x30>
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
    19e4:	b8 67 66 66 66       	mov    $0x66666667,%eax
    19e9:	f7 eb                	imul   %ebx
    19eb:	89 d8                	mov    %ebx,%eax
    19ed:	c1 f8 1f             	sar    $0x1f,%eax
    19f0:	d1 fa                	sar    %edx
    19f2:	29 c2                	sub    %eax,%edx
    19f4:	8d 04 92             	lea    (%edx,%edx,4),%eax
    19f7:	89 da                	mov    %ebx,%edx
    19f9:	29 c2                	sub    %eax,%edx
    19fb:	83 fa 01             	cmp    $0x1,%edx
    19fe:	75 9a                	jne    199a <concreate+0x4a>
      link("C0", file);
    1a00:	89 74 24 04          	mov    %esi,0x4(%esp)
    1a04:	c7 04 24 39 47 00 00 	movl   $0x4739,(%esp)
    1a0b:	e8 e4 22 00 00       	call   3cf4 <link>
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
      i = de.name[1] - '0';
      if(i < 0 || i >= sizeof(fa)){
        printf(1, "concreate weird file %s\n", de.name);
        exit();
    1a10:	e8 7f 22 00 00       	call   3c94 <exit>
    1a15:	8d 76 00             	lea    0x0(%esi),%esi
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1a18:	83 c3 01             	add    $0x1,%ebx
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    1a1b:	89 74 24 04          	mov    %esi,0x4(%esp)
    1a1f:	c7 04 24 39 47 00 00 	movl   $0x4739,(%esp)
    1a26:	e8 c9 22 00 00       	call   3cf4 <link>
      close(fd);
    }
    if(pid == 0)
      exit();
    else
      wait();
    1a2b:	e8 6c 22 00 00       	call   3c9c <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1a30:	83 fb 28             	cmp    $0x28,%ebx
    1a33:	75 96                	jne    19cb <concreate+0x7b>
    1a35:	8d 76 00             	lea    0x0(%esi),%esi
      exit();
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
    1a38:	8d 45 ac             	lea    -0x54(%ebp),%eax
    1a3b:	c7 44 24 08 28 00 00 	movl   $0x28,0x8(%esp)
    1a42:	00 
    1a43:	8d 7d d4             	lea    -0x2c(%ebp),%edi
    1a46:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1a4d:	00 
    1a4e:	89 04 24             	mov    %eax,(%esp)
    1a51:	e8 ba 20 00 00       	call   3b10 <memset>
  fd = open(".", 0);
    1a56:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1a5d:	00 
    1a5e:	c7 04 24 46 49 00 00 	movl   $0x4946,(%esp)
    1a65:	e8 6a 22 00 00       	call   3cd4 <open>
  n = 0;
    1a6a:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
  fd = open(".", 0);
    1a71:	89 c3                	mov    %eax,%ebx
    1a73:	90                   	nop
    1a74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  n = 0;
  while(read(fd, &de, sizeof(de)) > 0){
    1a78:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    1a7f:	00 
    1a80:	89 7c 24 04          	mov    %edi,0x4(%esp)
    1a84:	89 1c 24             	mov    %ebx,(%esp)
    1a87:	e8 20 22 00 00       	call   3cac <read>
    1a8c:	85 c0                	test   %eax,%eax
    1a8e:	7e 40                	jle    1ad0 <concreate+0x180>
    if(de.inum == 0)
    1a90:	66 83 7d d4 00       	cmpw   $0x0,-0x2c(%ebp)
    1a95:	74 e1                	je     1a78 <concreate+0x128>
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    1a97:	80 7d d6 43          	cmpb   $0x43,-0x2a(%ebp)
    1a9b:	75 db                	jne    1a78 <concreate+0x128>
    1a9d:	80 7d d8 00          	cmpb   $0x0,-0x28(%ebp)
    1aa1:	75 d5                	jne    1a78 <concreate+0x128>
      i = de.name[1] - '0';
    1aa3:	0f be 45 d7          	movsbl -0x29(%ebp),%eax
    1aa7:	83 e8 30             	sub    $0x30,%eax
      if(i < 0 || i >= sizeof(fa)){
    1aaa:	83 f8 27             	cmp    $0x27,%eax
    1aad:	0f 87 5f 01 00 00    	ja     1c12 <concreate+0x2c2>
        printf(1, "concreate weird file %s\n", de.name);
        exit();
      }
      if(fa[i]){
    1ab3:	80 7c 05 ac 00       	cmpb   $0x0,-0x54(%ebp,%eax,1)
    1ab8:	0f 85 8d 01 00 00    	jne    1c4b <concreate+0x2fb>
        printf(1, "concreate duplicate file %s\n", de.name);
        exit();
      }
      fa[i] = 1;
    1abe:	c6 44 05 ac 01       	movb   $0x1,-0x54(%ebp,%eax,1)
      n++;
    1ac3:	83 45 a4 01          	addl   $0x1,-0x5c(%ebp)
    1ac7:	eb af                	jmp    1a78 <concreate+0x128>
    1ac9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }
  close(fd);
    1ad0:	89 1c 24             	mov    %ebx,(%esp)
    1ad3:	e8 e4 21 00 00       	call   3cbc <close>

  if(n != 40){
    1ad8:	83 7d a4 28          	cmpl   $0x28,-0x5c(%ebp)
    1adc:	0f 85 50 01 00 00    	jne    1c32 <concreate+0x2e2>
    1ae2:	31 db                	xor    %ebx,%ebx
    1ae4:	eb 7f                	jmp    1b65 <concreate+0x215>
    1ae6:	66 90                	xchg   %ax,%ax
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
    1ae8:	85 ff                	test   %edi,%edi
    1aea:	0f 84 ae 00 00 00    	je     1b9e <concreate+0x24e>
       ((i % 3) == 1 && pid != 0)){
      close(open(file, 0));
    1af0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1af7:	00 
    1af8:	89 34 24             	mov    %esi,(%esp)
    1afb:	e8 d4 21 00 00       	call   3cd4 <open>
    1b00:	89 04 24             	mov    %eax,(%esp)
    1b03:	e8 b4 21 00 00       	call   3cbc <close>
      close(open(file, 0));
    1b08:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1b0f:	00 
    1b10:	89 34 24             	mov    %esi,(%esp)
    1b13:	e8 bc 21 00 00       	call   3cd4 <open>
    1b18:	89 04 24             	mov    %eax,(%esp)
    1b1b:	e8 9c 21 00 00       	call   3cbc <close>
      close(open(file, 0));
    1b20:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1b27:	00 
    1b28:	89 34 24             	mov    %esi,(%esp)
    1b2b:	e8 a4 21 00 00       	call   3cd4 <open>
    1b30:	89 04 24             	mov    %eax,(%esp)
    1b33:	e8 84 21 00 00       	call   3cbc <close>
      close(open(file, 0));
    1b38:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1b3f:	00 
    1b40:	89 34 24             	mov    %esi,(%esp)
    1b43:	e8 8c 21 00 00       	call   3cd4 <open>
    1b48:	89 04 24             	mov    %eax,(%esp)
    1b4b:	e8 6c 21 00 00       	call   3cbc <close>
      unlink(file);
      unlink(file);
      unlink(file);
      unlink(file);
    }
    if(pid == 0)
    1b50:	85 ff                	test   %edi,%edi
    1b52:	0f 84 b8 fe ff ff    	je     1a10 <concreate+0xc0>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    1b58:	83 c3 01             	add    $0x1,%ebx
      unlink(file);
    }
    if(pid == 0)
      exit();
    else
      wait();
    1b5b:	e8 3c 21 00 00       	call   3c9c <wait>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    1b60:	83 fb 28             	cmp    $0x28,%ebx
    1b63:	74 5b                	je     1bc0 <concreate+0x270>
  printf(1, "linktest ok\n");
}

// test concurrent create/link/unlink of the same file
void
concreate(void)
    1b65:	8d 43 30             	lea    0x30(%ebx),%eax
    1b68:	88 45 e6             	mov    %al,-0x1a(%ebp)
    exit();
  }

  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    pid = fork();
    1b6b:	e8 1c 21 00 00       	call   3c8c <fork>
    if(pid < 0){
    1b70:	85 c0                	test   %eax,%eax
    exit();
  }

  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    pid = fork();
    1b72:	89 c7                	mov    %eax,%edi
    if(pid < 0){
    1b74:	78 66                	js     1bdc <concreate+0x28c>
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
    1b76:	b8 56 55 55 55       	mov    $0x55555556,%eax
    1b7b:	f7 eb                	imul   %ebx
    1b7d:	89 d8                	mov    %ebx,%eax
    1b7f:	c1 f8 1f             	sar    $0x1f,%eax
    1b82:	29 c2                	sub    %eax,%edx
    1b84:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1b87:	89 da                	mov    %ebx,%edx
    1b89:	29 c2                	sub    %eax,%edx
    1b8b:	89 d0                	mov    %edx,%eax
    1b8d:	09 f8                	or     %edi,%eax
    1b8f:	0f 84 5b ff ff ff    	je     1af0 <concreate+0x1a0>
    1b95:	83 fa 01             	cmp    $0x1,%edx
    1b98:	0f 84 4a ff ff ff    	je     1ae8 <concreate+0x198>
      close(open(file, 0));
      close(open(file, 0));
      close(open(file, 0));
      close(open(file, 0));
    } else {
      unlink(file);
    1b9e:	89 34 24             	mov    %esi,(%esp)
    1ba1:	e8 3e 21 00 00       	call   3ce4 <unlink>
      unlink(file);
    1ba6:	89 34 24             	mov    %esi,(%esp)
    1ba9:	e8 36 21 00 00       	call   3ce4 <unlink>
      unlink(file);
    1bae:	89 34 24             	mov    %esi,(%esp)
    1bb1:	e8 2e 21 00 00       	call   3ce4 <unlink>
      unlink(file);
    1bb6:	89 34 24             	mov    %esi,(%esp)
    1bb9:	e8 26 21 00 00       	call   3ce4 <unlink>
    1bbe:	eb 90                	jmp    1b50 <concreate+0x200>
      exit();
    else
      wait();
  }

  printf(1, "concreate ok\n");
    1bc0:	c7 44 24 04 8e 47 00 	movl   $0x478e,0x4(%esp)
    1bc7:	00 
    1bc8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1bcf:	e8 1c 22 00 00       	call   3df0 <printf>
}
    1bd4:	83 c4 6c             	add    $0x6c,%esp
    1bd7:	5b                   	pop    %ebx
    1bd8:	5e                   	pop    %esi
    1bd9:	5f                   	pop    %edi
    1bda:	5d                   	pop    %ebp
    1bdb:	c3                   	ret    

  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    1bdc:	c7 44 24 04 11 50 00 	movl   $0x5011,0x4(%esp)
    1be3:	00 
    1be4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1beb:	e8 00 22 00 00       	call   3df0 <printf>
      exit();
    1bf0:	e8 9f 20 00 00       	call   3c94 <exit>
    } else if(pid == 0 && (i % 5) == 1){
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "concreate create %s failed\n", file);
    1bf5:	89 74 24 08          	mov    %esi,0x8(%esp)
    1bf9:	c7 44 24 04 3c 47 00 	movl   $0x473c,0x4(%esp)
    1c00:	00 
    1c01:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c08:	e8 e3 21 00 00       	call   3df0 <printf>
        exit();
    1c0d:	e8 82 20 00 00       	call   3c94 <exit>
    if(de.inum == 0)
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
      i = de.name[1] - '0';
      if(i < 0 || i >= sizeof(fa)){
        printf(1, "concreate weird file %s\n", de.name);
    1c12:	8d 45 d6             	lea    -0x2a(%ebp),%eax
    1c15:	89 44 24 08          	mov    %eax,0x8(%esp)
    1c19:	c7 44 24 04 58 47 00 	movl   $0x4758,0x4(%esp)
    1c20:	00 
    1c21:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c28:	e8 c3 21 00 00       	call   3df0 <printf>
    1c2d:	e9 de fd ff ff       	jmp    1a10 <concreate+0xc0>
    }
  }
  close(fd);

  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    1c32:	c7 44 24 04 d8 52 00 	movl   $0x52d8,0x4(%esp)
    1c39:	00 
    1c3a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c41:	e8 aa 21 00 00       	call   3df0 <printf>
    exit();
    1c46:	e8 49 20 00 00       	call   3c94 <exit>
      if(i < 0 || i >= sizeof(fa)){
        printf(1, "concreate weird file %s\n", de.name);
        exit();
      }
      if(fa[i]){
        printf(1, "concreate duplicate file %s\n", de.name);
    1c4b:	8d 45 d6             	lea    -0x2a(%ebp),%eax
    1c4e:	89 44 24 08          	mov    %eax,0x8(%esp)
    1c52:	c7 44 24 04 71 47 00 	movl   $0x4771,0x4(%esp)
    1c59:	00 
    1c5a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c61:	e8 8a 21 00 00       	call   3df0 <printf>
        exit();
    1c66:	e8 29 20 00 00       	call   3c94 <exit>
    1c6b:	90                   	nop
    1c6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001c70 <linkunlink>:

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink()
{
    1c70:	55                   	push   %ebp
    1c71:	89 e5                	mov    %esp,%ebp
    1c73:	57                   	push   %edi
    1c74:	56                   	push   %esi
    1c75:	53                   	push   %ebx
    1c76:	83 ec 2c             	sub    $0x2c,%esp
  int pid, i;

  printf(1, "linkunlink test\n");
    1c79:	c7 44 24 04 9c 47 00 	movl   $0x479c,0x4(%esp)
    1c80:	00 
    1c81:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c88:	e8 63 21 00 00       	call   3df0 <printf>

  unlink("x");
    1c8d:	c7 04 24 29 4a 00 00 	movl   $0x4a29,(%esp)
    1c94:	e8 4b 20 00 00       	call   3ce4 <unlink>
  pid = fork();
    1c99:	e8 ee 1f 00 00       	call   3c8c <fork>
  if(pid < 0){
    1c9e:	85 c0                	test   %eax,%eax
  int pid, i;

  printf(1, "linkunlink test\n");

  unlink("x");
  pid = fork();
    1ca0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    1ca3:	0f 88 b8 00 00 00    	js     1d61 <linkunlink+0xf1>
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
    1ca9:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    1cad:	be 64 00 00 00       	mov    $0x64,%esi
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
    1cb2:	bf ab aa aa aa       	mov    $0xaaaaaaab,%edi
  if(pid < 0){
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
    1cb7:	19 db                	sbb    %ebx,%ebx
    1cb9:	83 e3 60             	and    $0x60,%ebx
    1cbc:	83 c3 01             	add    $0x1,%ebx
    1cbf:	eb 1d                	jmp    1cde <linkunlink+0x6e>
    1cc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
      close(open("x", O_RDWR | O_CREATE));
    } else if((x % 3) == 1){
    1cc8:	83 fa 01             	cmp    $0x1,%edx
    1ccb:	74 7b                	je     1d48 <linkunlink+0xd8>
      link("cat", "x");
    } else {
      unlink("x");
    1ccd:	c7 04 24 29 4a 00 00 	movl   $0x4a29,(%esp)
    1cd4:	e8 0b 20 00 00       	call   3ce4 <unlink>
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    1cd9:	83 ee 01             	sub    $0x1,%esi
    1cdc:	74 3c                	je     1d1a <linkunlink+0xaa>
    x = x * 1103515245 + 12345;
    1cde:	69 db 6d 4e c6 41    	imul   $0x41c64e6d,%ebx,%ebx
    1ce4:	81 c3 39 30 00 00    	add    $0x3039,%ebx
    if((x % 3) == 0){
    1cea:	89 d8                	mov    %ebx,%eax
    1cec:	f7 e7                	mul    %edi
    1cee:	d1 ea                	shr    %edx
    1cf0:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1cf3:	89 da                	mov    %ebx,%edx
    1cf5:	29 c2                	sub    %eax,%edx
    1cf7:	75 cf                	jne    1cc8 <linkunlink+0x58>
      close(open("x", O_RDWR | O_CREATE));
    1cf9:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    1d00:	00 
    1d01:	c7 04 24 29 4a 00 00 	movl   $0x4a29,(%esp)
    1d08:	e8 c7 1f 00 00       	call   3cd4 <open>
    1d0d:	89 04 24             	mov    %eax,(%esp)
    1d10:	e8 a7 1f 00 00       	call   3cbc <close>
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    1d15:	83 ee 01             	sub    $0x1,%esi
    1d18:	75 c4                	jne    1cde <linkunlink+0x6e>
    } else {
      unlink("x");
    }
  }

  if(pid)
    1d1a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    1d1d:	85 d2                	test   %edx,%edx
    1d1f:	74 59                	je     1d7a <linkunlink+0x10a>
    wait();
    1d21:	e8 76 1f 00 00       	call   3c9c <wait>
  else
    exit();

  printf(1, "linkunlink ok\n");
    1d26:	c7 44 24 04 b1 47 00 	movl   $0x47b1,0x4(%esp)
    1d2d:	00 
    1d2e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1d35:	e8 b6 20 00 00       	call   3df0 <printf>
}
    1d3a:	83 c4 2c             	add    $0x2c,%esp
    1d3d:	5b                   	pop    %ebx
    1d3e:	5e                   	pop    %esi
    1d3f:	5f                   	pop    %edi
    1d40:	5d                   	pop    %ebp
    1d41:	c3                   	ret    
    1d42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
      close(open("x", O_RDWR | O_CREATE));
    } else if((x % 3) == 1){
      link("cat", "x");
    1d48:	c7 44 24 04 29 4a 00 	movl   $0x4a29,0x4(%esp)
    1d4f:	00 
    1d50:	c7 04 24 ad 47 00 00 	movl   $0x47ad,(%esp)
    1d57:	e8 98 1f 00 00       	call   3cf4 <link>
    1d5c:	e9 78 ff ff ff       	jmp    1cd9 <linkunlink+0x69>
  printf(1, "linkunlink test\n");

  unlink("x");
  pid = fork();
  if(pid < 0){
    printf(1, "fork failed\n");
    1d61:	c7 44 24 04 11 50 00 	movl   $0x5011,0x4(%esp)
    1d68:	00 
    1d69:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1d70:	e8 7b 20 00 00       	call   3df0 <printf>
    exit();
    1d75:	e8 1a 1f 00 00       	call   3c94 <exit>
  }

  if(pid)
    wait();
  else
    exit();
    1d7a:	e8 15 1f 00 00       	call   3c94 <exit>
    1d7f:	90                   	nop

00001d80 <bigdir>:
}

// directory that uses indirect blocks
void
bigdir(void)
{
    1d80:	55                   	push   %ebp
    1d81:	89 e5                	mov    %esp,%ebp
    1d83:	56                   	push   %esi
    1d84:	53                   	push   %ebx
    1d85:	83 ec 20             	sub    $0x20,%esp
  int i, fd;
  char name[10];

  printf(1, "bigdir test\n");
    1d88:	c7 44 24 04 c0 47 00 	movl   $0x47c0,0x4(%esp)
    1d8f:	00 
    1d90:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1d97:	e8 54 20 00 00       	call   3df0 <printf>
  unlink("bd");
    1d9c:	c7 04 24 cd 47 00 00 	movl   $0x47cd,(%esp)
    1da3:	e8 3c 1f 00 00       	call   3ce4 <unlink>

  fd = open("bd", O_CREATE);
    1da8:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    1daf:	00 
    1db0:	c7 04 24 cd 47 00 00 	movl   $0x47cd,(%esp)
    1db7:	e8 18 1f 00 00       	call   3cd4 <open>
  if(fd < 0){
    1dbc:	85 c0                	test   %eax,%eax
    1dbe:	0f 88 e6 00 00 00    	js     1eaa <bigdir+0x12a>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);
    1dc4:	89 04 24             	mov    %eax,(%esp)

  for(i = 0; i < 500; i++){
    1dc7:	31 db                	xor    %ebx,%ebx
  fd = open("bd", O_CREATE);
  if(fd < 0){
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);
    1dc9:	e8 ee 1e 00 00       	call   3cbc <close>
    1dce:	8d 75 ee             	lea    -0x12(%ebp),%esi
    1dd1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1dd8:	89 d8                	mov    %ebx,%eax
    1dda:	c1 f8 06             	sar    $0x6,%eax
    1ddd:	83 c0 30             	add    $0x30,%eax
    1de0:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    1de3:	89 d8                	mov    %ebx,%eax
    1de5:	83 e0 3f             	and    $0x3f,%eax
    1de8:	83 c0 30             	add    $0x30,%eax
    exit();
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    1deb:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    1def:	88 45 f0             	mov    %al,-0x10(%ebp)
    name[3] = '\0';
    1df2:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
    if(link("bd", name) != 0){
    1df6:	89 74 24 04          	mov    %esi,0x4(%esp)
    1dfa:	c7 04 24 cd 47 00 00 	movl   $0x47cd,(%esp)
    1e01:	e8 ee 1e 00 00       	call   3cf4 <link>
    1e06:	85 c0                	test   %eax,%eax
    1e08:	75 6e                	jne    1e78 <bigdir+0xf8>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);

  for(i = 0; i < 500; i++){
    1e0a:	83 c3 01             	add    $0x1,%ebx
    1e0d:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1e13:	75 c3                	jne    1dd8 <bigdir+0x58>
      printf(1, "bigdir link failed\n");
      exit();
    }
  }

  unlink("bd");
    1e15:	c7 04 24 cd 47 00 00 	movl   $0x47cd,(%esp)
  for(i = 0; i < 500; i++){
    1e1c:	66 31 db             	xor    %bx,%bx
      printf(1, "bigdir link failed\n");
      exit();
    }
  }

  unlink("bd");
    1e1f:	e8 c0 1e 00 00       	call   3ce4 <unlink>
    1e24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1e28:	89 d8                	mov    %ebx,%eax
    1e2a:	c1 f8 06             	sar    $0x6,%eax
    1e2d:	83 c0 30             	add    $0x30,%eax
    1e30:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    1e33:	89 d8                	mov    %ebx,%eax
    1e35:	83 e0 3f             	and    $0x3f,%eax
    1e38:	83 c0 30             	add    $0x30,%eax
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    1e3b:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    1e3f:	88 45 f0             	mov    %al,-0x10(%ebp)
    name[3] = '\0';
    1e42:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
    if(unlink(name) != 0){
    1e46:	89 34 24             	mov    %esi,(%esp)
    1e49:	e8 96 1e 00 00       	call   3ce4 <unlink>
    1e4e:	85 c0                	test   %eax,%eax
    1e50:	75 3f                	jne    1e91 <bigdir+0x111>
      exit();
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    1e52:	83 c3 01             	add    $0x1,%ebx
    1e55:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1e5b:	75 cb                	jne    1e28 <bigdir+0xa8>
      printf(1, "bigdir unlink failed");
      exit();
    }
  }

  printf(1, "bigdir ok\n");
    1e5d:	c7 44 24 04 0f 48 00 	movl   $0x480f,0x4(%esp)
    1e64:	00 
    1e65:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1e6c:	e8 7f 1f 00 00       	call   3df0 <printf>
}
    1e71:	83 c4 20             	add    $0x20,%esp
    1e74:	5b                   	pop    %ebx
    1e75:	5e                   	pop    %esi
    1e76:	5d                   	pop    %ebp
    1e77:	c3                   	ret    
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
      printf(1, "bigdir link failed\n");
    1e78:	c7 44 24 04 e6 47 00 	movl   $0x47e6,0x4(%esp)
    1e7f:	00 
    1e80:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1e87:	e8 64 1f 00 00       	call   3df0 <printf>
      exit();
    1e8c:	e8 03 1e 00 00       	call   3c94 <exit>
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
      printf(1, "bigdir unlink failed");
    1e91:	c7 44 24 04 fa 47 00 	movl   $0x47fa,0x4(%esp)
    1e98:	00 
    1e99:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1ea0:	e8 4b 1f 00 00       	call   3df0 <printf>
      exit();
    1ea5:	e8 ea 1d 00 00       	call   3c94 <exit>
  printf(1, "bigdir test\n");
  unlink("bd");

  fd = open("bd", O_CREATE);
  if(fd < 0){
    printf(1, "bigdir create failed\n");
    1eaa:	c7 44 24 04 d0 47 00 	movl   $0x47d0,0x4(%esp)
    1eb1:	00 
    1eb2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1eb9:	e8 32 1f 00 00       	call   3df0 <printf>
    exit();
    1ebe:	e8 d1 1d 00 00       	call   3c94 <exit>
    1ec3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1ec9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001ed0 <subdir>:
  printf(1, "bigdir ok\n");
}

void
subdir(void)
{
    1ed0:	55                   	push   %ebp
    1ed1:	89 e5                	mov    %esp,%ebp
    1ed3:	53                   	push   %ebx
    1ed4:	83 ec 14             	sub    $0x14,%esp
  int fd, cc;

  printf(1, "subdir test\n");
    1ed7:	c7 44 24 04 1a 48 00 	movl   $0x481a,0x4(%esp)
    1ede:	00 
    1edf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1ee6:	e8 05 1f 00 00       	call   3df0 <printf>

  unlink("ff");
    1eeb:	c7 04 24 a3 48 00 00 	movl   $0x48a3,(%esp)
    1ef2:	e8 ed 1d 00 00       	call   3ce4 <unlink>
  if(mkdir("dd") != 0){
    1ef7:	c7 04 24 40 49 00 00 	movl   $0x4940,(%esp)
    1efe:	e8 f9 1d 00 00       	call   3cfc <mkdir>
    1f03:	85 c0                	test   %eax,%eax
    1f05:	0f 85 07 06 00 00    	jne    2512 <subdir+0x642>
    printf(1, "subdir mkdir dd failed\n");
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    1f0b:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    1f12:	00 
    1f13:	c7 04 24 79 48 00 00 	movl   $0x4879,(%esp)
    1f1a:	e8 b5 1d 00 00       	call   3cd4 <open>
  if(fd < 0){
    1f1f:	85 c0                	test   %eax,%eax
  if(mkdir("dd") != 0){
    printf(1, "subdir mkdir dd failed\n");
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    1f21:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1f23:	0f 88 d0 05 00 00    	js     24f9 <subdir+0x629>
    printf(1, "create dd/ff failed\n");
    exit();
  }
  write(fd, "ff", 2);
    1f29:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
    1f30:	00 
    1f31:	c7 44 24 04 a3 48 00 	movl   $0x48a3,0x4(%esp)
    1f38:	00 
    1f39:	89 04 24             	mov    %eax,(%esp)
    1f3c:	e8 73 1d 00 00       	call   3cb4 <write>
  close(fd);
    1f41:	89 1c 24             	mov    %ebx,(%esp)
    1f44:	e8 73 1d 00 00       	call   3cbc <close>

  if(unlink("dd") >= 0){
    1f49:	c7 04 24 40 49 00 00 	movl   $0x4940,(%esp)
    1f50:	e8 8f 1d 00 00       	call   3ce4 <unlink>
    1f55:	85 c0                	test   %eax,%eax
    1f57:	0f 89 83 05 00 00    	jns    24e0 <subdir+0x610>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    exit();
  }

  if(mkdir("/dd/dd") != 0){
    1f5d:	c7 04 24 54 48 00 00 	movl   $0x4854,(%esp)
    1f64:	e8 93 1d 00 00       	call   3cfc <mkdir>
    1f69:	85 c0                	test   %eax,%eax
    1f6b:	0f 85 56 05 00 00    	jne    24c7 <subdir+0x5f7>
    printf(1, "subdir mkdir dd/dd failed\n");
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1f71:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    1f78:	00 
    1f79:	c7 04 24 76 48 00 00 	movl   $0x4876,(%esp)
    1f80:	e8 4f 1d 00 00       	call   3cd4 <open>
  if(fd < 0){
    1f85:	85 c0                	test   %eax,%eax
  if(mkdir("/dd/dd") != 0){
    printf(1, "subdir mkdir dd/dd failed\n");
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1f87:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1f89:	0f 88 25 04 00 00    	js     23b4 <subdir+0x4e4>
    printf(1, "create dd/dd/ff failed\n");
    exit();
  }
  write(fd, "FF", 2);
    1f8f:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
    1f96:	00 
    1f97:	c7 44 24 04 97 48 00 	movl   $0x4897,0x4(%esp)
    1f9e:	00 
    1f9f:	89 04 24             	mov    %eax,(%esp)
    1fa2:	e8 0d 1d 00 00       	call   3cb4 <write>
  close(fd);
    1fa7:	89 1c 24             	mov    %ebx,(%esp)
    1faa:	e8 0d 1d 00 00       	call   3cbc <close>

  fd = open("dd/dd/../ff", 0);
    1faf:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1fb6:	00 
    1fb7:	c7 04 24 9a 48 00 00 	movl   $0x489a,(%esp)
    1fbe:	e8 11 1d 00 00       	call   3cd4 <open>
  if(fd < 0){
    1fc3:	85 c0                	test   %eax,%eax
    exit();
  }
  write(fd, "FF", 2);
  close(fd);

  fd = open("dd/dd/../ff", 0);
    1fc5:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1fc7:	0f 88 ce 03 00 00    	js     239b <subdir+0x4cb>
    printf(1, "open dd/dd/../ff failed\n");
    exit();
  }
  cc = read(fd, buf, sizeof(buf));
    1fcd:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    1fd4:	00 
    1fd5:	c7 44 24 04 60 89 00 	movl   $0x8960,0x4(%esp)
    1fdc:	00 
    1fdd:	89 04 24             	mov    %eax,(%esp)
    1fe0:	e8 c7 1c 00 00       	call   3cac <read>
  if(cc != 2 || buf[0] != 'f'){
    1fe5:	83 f8 02             	cmp    $0x2,%eax
    1fe8:	0f 85 fe 02 00 00    	jne    22ec <subdir+0x41c>
    1fee:	80 3d 60 89 00 00 66 	cmpb   $0x66,0x8960
    1ff5:	0f 85 f1 02 00 00    	jne    22ec <subdir+0x41c>
    printf(1, "dd/dd/../ff wrong content\n");
    exit();
  }
  close(fd);
    1ffb:	89 1c 24             	mov    %ebx,(%esp)
    1ffe:	e8 b9 1c 00 00       	call   3cbc <close>

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    2003:	c7 44 24 04 da 48 00 	movl   $0x48da,0x4(%esp)
    200a:	00 
    200b:	c7 04 24 76 48 00 00 	movl   $0x4876,(%esp)
    2012:	e8 dd 1c 00 00       	call   3cf4 <link>
    2017:	85 c0                	test   %eax,%eax
    2019:	0f 85 c7 03 00 00    	jne    23e6 <subdir+0x516>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    exit();
  }

  if(unlink("dd/dd/ff") != 0){
    201f:	c7 04 24 76 48 00 00 	movl   $0x4876,(%esp)
    2026:	e8 b9 1c 00 00       	call   3ce4 <unlink>
    202b:	85 c0                	test   %eax,%eax
    202d:	0f 85 eb 02 00 00    	jne    231e <subdir+0x44e>
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    2033:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    203a:	00 
    203b:	c7 04 24 76 48 00 00 	movl   $0x4876,(%esp)
    2042:	e8 8d 1c 00 00       	call   3cd4 <open>
    2047:	85 c0                	test   %eax,%eax
    2049:	0f 89 5f 04 00 00    	jns    24ae <subdir+0x5de>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    exit();
  }

  if(chdir("dd") != 0){
    204f:	c7 04 24 40 49 00 00 	movl   $0x4940,(%esp)
    2056:	e8 a9 1c 00 00       	call   3d04 <chdir>
    205b:	85 c0                	test   %eax,%eax
    205d:	0f 85 32 04 00 00    	jne    2495 <subdir+0x5c5>
    printf(1, "chdir dd failed\n");
    exit();
  }
  if(chdir("dd/../../dd") != 0){
    2063:	c7 04 24 0e 49 00 00 	movl   $0x490e,(%esp)
    206a:	e8 95 1c 00 00       	call   3d04 <chdir>
    206f:	85 c0                	test   %eax,%eax
    2071:	0f 85 8e 02 00 00    	jne    2305 <subdir+0x435>
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("dd/../../../dd") != 0){
    2077:	c7 04 24 34 49 00 00 	movl   $0x4934,(%esp)
    207e:	e8 81 1c 00 00       	call   3d04 <chdir>
    2083:	85 c0                	test   %eax,%eax
    2085:	0f 85 7a 02 00 00    	jne    2305 <subdir+0x435>
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("./..") != 0){
    208b:	c7 04 24 43 49 00 00 	movl   $0x4943,(%esp)
    2092:	e8 6d 1c 00 00       	call   3d04 <chdir>
    2097:	85 c0                	test   %eax,%eax
    2099:	0f 85 2e 03 00 00    	jne    23cd <subdir+0x4fd>
    printf(1, "chdir ./.. failed\n");
    exit();
  }

  fd = open("dd/dd/ffff", 0);
    209f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    20a6:	00 
    20a7:	c7 04 24 da 48 00 00 	movl   $0x48da,(%esp)
    20ae:	e8 21 1c 00 00       	call   3cd4 <open>
  if(fd < 0){
    20b3:	85 c0                	test   %eax,%eax
  if(chdir("./..") != 0){
    printf(1, "chdir ./.. failed\n");
    exit();
  }

  fd = open("dd/dd/ffff", 0);
    20b5:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    20b7:	0f 88 81 05 00 00    	js     263e <subdir+0x76e>
    printf(1, "open dd/dd/ffff failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    20bd:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    20c4:	00 
    20c5:	c7 44 24 04 60 89 00 	movl   $0x8960,0x4(%esp)
    20cc:	00 
    20cd:	89 04 24             	mov    %eax,(%esp)
    20d0:	e8 d7 1b 00 00       	call   3cac <read>
    20d5:	83 f8 02             	cmp    $0x2,%eax
    20d8:	0f 85 47 05 00 00    	jne    2625 <subdir+0x755>
    printf(1, "read dd/dd/ffff wrong len\n");
    exit();
  }
  close(fd);
    20de:	89 1c 24             	mov    %ebx,(%esp)
    20e1:	e8 d6 1b 00 00       	call   3cbc <close>

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    20e6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    20ed:	00 
    20ee:	c7 04 24 76 48 00 00 	movl   $0x4876,(%esp)
    20f5:	e8 da 1b 00 00       	call   3cd4 <open>
    20fa:	85 c0                	test   %eax,%eax
    20fc:	0f 89 4e 02 00 00    	jns    2350 <subdir+0x480>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    exit();
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    2102:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    2109:	00 
    210a:	c7 04 24 8e 49 00 00 	movl   $0x498e,(%esp)
    2111:	e8 be 1b 00 00       	call   3cd4 <open>
    2116:	85 c0                	test   %eax,%eax
    2118:	0f 89 19 02 00 00    	jns    2337 <subdir+0x467>
    printf(1, "create dd/ff/ff succeeded!\n");
    exit();
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    211e:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    2125:	00 
    2126:	c7 04 24 b3 49 00 00 	movl   $0x49b3,(%esp)
    212d:	e8 a2 1b 00 00       	call   3cd4 <open>
    2132:	85 c0                	test   %eax,%eax
    2134:	0f 89 42 03 00 00    	jns    247c <subdir+0x5ac>
    printf(1, "create dd/xx/ff succeeded!\n");
    exit();
  }
  if(open("dd", O_CREATE) >= 0){
    213a:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    2141:	00 
    2142:	c7 04 24 40 49 00 00 	movl   $0x4940,(%esp)
    2149:	e8 86 1b 00 00       	call   3cd4 <open>
    214e:	85 c0                	test   %eax,%eax
    2150:	0f 89 0d 03 00 00    	jns    2463 <subdir+0x593>
    printf(1, "create dd succeeded!\n");
    exit();
  }
  if(open("dd", O_RDWR) >= 0){
    2156:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    215d:	00 
    215e:	c7 04 24 40 49 00 00 	movl   $0x4940,(%esp)
    2165:	e8 6a 1b 00 00       	call   3cd4 <open>
    216a:	85 c0                	test   %eax,%eax
    216c:	0f 89 d8 02 00 00    	jns    244a <subdir+0x57a>
    printf(1, "open dd rdwr succeeded!\n");
    exit();
  }
  if(open("dd", O_WRONLY) >= 0){
    2172:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    2179:	00 
    217a:	c7 04 24 40 49 00 00 	movl   $0x4940,(%esp)
    2181:	e8 4e 1b 00 00       	call   3cd4 <open>
    2186:	85 c0                	test   %eax,%eax
    2188:	0f 89 a3 02 00 00    	jns    2431 <subdir+0x561>
    printf(1, "open dd wronly succeeded!\n");
    exit();
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    218e:	c7 44 24 04 22 4a 00 	movl   $0x4a22,0x4(%esp)
    2195:	00 
    2196:	c7 04 24 8e 49 00 00 	movl   $0x498e,(%esp)
    219d:	e8 52 1b 00 00       	call   3cf4 <link>
    21a2:	85 c0                	test   %eax,%eax
    21a4:	0f 84 6e 02 00 00    	je     2418 <subdir+0x548>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    21aa:	c7 44 24 04 22 4a 00 	movl   $0x4a22,0x4(%esp)
    21b1:	00 
    21b2:	c7 04 24 b3 49 00 00 	movl   $0x49b3,(%esp)
    21b9:	e8 36 1b 00 00       	call   3cf4 <link>
    21be:	85 c0                	test   %eax,%eax
    21c0:	0f 84 39 02 00 00    	je     23ff <subdir+0x52f>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    21c6:	c7 44 24 04 da 48 00 	movl   $0x48da,0x4(%esp)
    21cd:	00 
    21ce:	c7 04 24 79 48 00 00 	movl   $0x4879,(%esp)
    21d5:	e8 1a 1b 00 00       	call   3cf4 <link>
    21da:	85 c0                	test   %eax,%eax
    21dc:	0f 84 a0 01 00 00    	je     2382 <subdir+0x4b2>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    exit();
  }
  if(mkdir("dd/ff/ff") == 0){
    21e2:	c7 04 24 8e 49 00 00 	movl   $0x498e,(%esp)
    21e9:	e8 0e 1b 00 00       	call   3cfc <mkdir>
    21ee:	85 c0                	test   %eax,%eax
    21f0:	0f 84 73 01 00 00    	je     2369 <subdir+0x499>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/xx/ff") == 0){
    21f6:	c7 04 24 b3 49 00 00 	movl   $0x49b3,(%esp)
    21fd:	e8 fa 1a 00 00       	call   3cfc <mkdir>
    2202:	85 c0                	test   %eax,%eax
    2204:	0f 84 02 04 00 00    	je     260c <subdir+0x73c>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/dd/ffff") == 0){
    220a:	c7 04 24 da 48 00 00 	movl   $0x48da,(%esp)
    2211:	e8 e6 1a 00 00       	call   3cfc <mkdir>
    2216:	85 c0                	test   %eax,%eax
    2218:	0f 84 d5 03 00 00    	je     25f3 <subdir+0x723>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    exit();
  }
  if(unlink("dd/xx/ff") == 0){
    221e:	c7 04 24 b3 49 00 00 	movl   $0x49b3,(%esp)
    2225:	e8 ba 1a 00 00       	call   3ce4 <unlink>
    222a:	85 c0                	test   %eax,%eax
    222c:	0f 84 a8 03 00 00    	je     25da <subdir+0x70a>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    exit();
  }
  if(unlink("dd/ff/ff") == 0){
    2232:	c7 04 24 8e 49 00 00 	movl   $0x498e,(%esp)
    2239:	e8 a6 1a 00 00       	call   3ce4 <unlink>
    223e:	85 c0                	test   %eax,%eax
    2240:	0f 84 7b 03 00 00    	je     25c1 <subdir+0x6f1>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/ff") == 0){
    2246:	c7 04 24 79 48 00 00 	movl   $0x4879,(%esp)
    224d:	e8 b2 1a 00 00       	call   3d04 <chdir>
    2252:	85 c0                	test   %eax,%eax
    2254:	0f 84 4e 03 00 00    	je     25a8 <subdir+0x6d8>
    printf(1, "chdir dd/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/xx") == 0){
    225a:	c7 04 24 25 4a 00 00 	movl   $0x4a25,(%esp)
    2261:	e8 9e 1a 00 00       	call   3d04 <chdir>
    2266:	85 c0                	test   %eax,%eax
    2268:	0f 84 21 03 00 00    	je     258f <subdir+0x6bf>
    printf(1, "chdir dd/xx succeeded!\n");
    exit();
  }

  if(unlink("dd/dd/ffff") != 0){
    226e:	c7 04 24 da 48 00 00 	movl   $0x48da,(%esp)
    2275:	e8 6a 1a 00 00       	call   3ce4 <unlink>
    227a:	85 c0                	test   %eax,%eax
    227c:	0f 85 9c 00 00 00    	jne    231e <subdir+0x44e>
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(unlink("dd/ff") != 0){
    2282:	c7 04 24 79 48 00 00 	movl   $0x4879,(%esp)
    2289:	e8 56 1a 00 00       	call   3ce4 <unlink>
    228e:	85 c0                	test   %eax,%eax
    2290:	0f 85 e0 02 00 00    	jne    2576 <subdir+0x6a6>
    printf(1, "unlink dd/ff failed\n");
    exit();
  }
  if(unlink("dd") == 0){
    2296:	c7 04 24 40 49 00 00 	movl   $0x4940,(%esp)
    229d:	e8 42 1a 00 00       	call   3ce4 <unlink>
    22a2:	85 c0                	test   %eax,%eax
    22a4:	0f 84 b3 02 00 00    	je     255d <subdir+0x68d>
    printf(1, "unlink non-empty dd succeeded!\n");
    exit();
  }
  if(unlink("dd/dd") < 0){
    22aa:	c7 04 24 55 48 00 00 	movl   $0x4855,(%esp)
    22b1:	e8 2e 1a 00 00       	call   3ce4 <unlink>
    22b6:	85 c0                	test   %eax,%eax
    22b8:	0f 88 86 02 00 00    	js     2544 <subdir+0x674>
    printf(1, "unlink dd/dd failed\n");
    exit();
  }
  if(unlink("dd") < 0){
    22be:	c7 04 24 40 49 00 00 	movl   $0x4940,(%esp)
    22c5:	e8 1a 1a 00 00       	call   3ce4 <unlink>
    22ca:	85 c0                	test   %eax,%eax
    22cc:	0f 88 59 02 00 00    	js     252b <subdir+0x65b>
    printf(1, "unlink dd failed\n");
    exit();
  }

  printf(1, "subdir ok\n");
    22d2:	c7 44 24 04 22 4b 00 	movl   $0x4b22,0x4(%esp)
    22d9:	00 
    22da:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    22e1:	e8 0a 1b 00 00       	call   3df0 <printf>
}
    22e6:	83 c4 14             	add    $0x14,%esp
    22e9:	5b                   	pop    %ebx
    22ea:	5d                   	pop    %ebp
    22eb:	c3                   	ret    
    printf(1, "open dd/dd/../ff failed\n");
    exit();
  }
  cc = read(fd, buf, sizeof(buf));
  if(cc != 2 || buf[0] != 'f'){
    printf(1, "dd/dd/../ff wrong content\n");
    22ec:	c7 44 24 04 bf 48 00 	movl   $0x48bf,0x4(%esp)
    22f3:	00 
    22f4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    22fb:	e8 f0 1a 00 00       	call   3df0 <printf>
    exit();
    2300:	e8 8f 19 00 00       	call   3c94 <exit>
  if(chdir("dd/../../dd") != 0){
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("dd/../../../dd") != 0){
    printf(1, "chdir dd/../../dd failed\n");
    2305:	c7 44 24 04 1a 49 00 	movl   $0x491a,0x4(%esp)
    230c:	00 
    230d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2314:	e8 d7 1a 00 00       	call   3df0 <printf>
    exit();
    2319:	e8 76 19 00 00       	call   3c94 <exit>
    printf(1, "chdir dd/xx succeeded!\n");
    exit();
  }

  if(unlink("dd/dd/ffff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    231e:	c7 44 24 04 e5 48 00 	movl   $0x48e5,0x4(%esp)
    2325:	00 
    2326:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    232d:	e8 be 1a 00 00       	call   3df0 <printf>
    exit();
    2332:	e8 5d 19 00 00       	call   3c94 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    exit();
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/ff/ff succeeded!\n");
    2337:	c7 44 24 04 97 49 00 	movl   $0x4997,0x4(%esp)
    233e:	00 
    233f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2346:	e8 a5 1a 00 00       	call   3df0 <printf>
    exit();
    234b:	e8 44 19 00 00       	call   3c94 <exit>
    exit();
  }
  close(fd);

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    2350:	c7 44 24 04 7c 53 00 	movl   $0x537c,0x4(%esp)
    2357:	00 
    2358:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    235f:	e8 8c 1a 00 00       	call   3df0 <printf>
    exit();
    2364:	e8 2b 19 00 00       	call   3c94 <exit>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    exit();
  }
  if(mkdir("dd/ff/ff") == 0){
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    2369:	c7 44 24 04 2b 4a 00 	movl   $0x4a2b,0x4(%esp)
    2370:	00 
    2371:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2378:	e8 73 1a 00 00       	call   3df0 <printf>
    exit();
    237d:	e8 12 19 00 00       	call   3c94 <exit>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    2382:	c7 44 24 04 ec 53 00 	movl   $0x53ec,0x4(%esp)
    2389:	00 
    238a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2391:	e8 5a 1a 00 00       	call   3df0 <printf>
    exit();
    2396:	e8 f9 18 00 00       	call   3c94 <exit>
  write(fd, "FF", 2);
  close(fd);

  fd = open("dd/dd/../ff", 0);
  if(fd < 0){
    printf(1, "open dd/dd/../ff failed\n");
    239b:	c7 44 24 04 a6 48 00 	movl   $0x48a6,0x4(%esp)
    23a2:	00 
    23a3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    23aa:	e8 41 1a 00 00       	call   3df0 <printf>
    exit();
    23af:	e8 e0 18 00 00       	call   3c94 <exit>
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create dd/dd/ff failed\n");
    23b4:	c7 44 24 04 7f 48 00 	movl   $0x487f,0x4(%esp)
    23bb:	00 
    23bc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    23c3:	e8 28 1a 00 00       	call   3df0 <printf>
    exit();
    23c8:	e8 c7 18 00 00       	call   3c94 <exit>
  if(chdir("dd/../../../dd") != 0){
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("./..") != 0){
    printf(1, "chdir ./.. failed\n");
    23cd:	c7 44 24 04 48 49 00 	movl   $0x4948,0x4(%esp)
    23d4:	00 
    23d5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    23dc:	e8 0f 1a 00 00       	call   3df0 <printf>
    exit();
    23e1:	e8 ae 18 00 00       	call   3c94 <exit>
    exit();
  }
  close(fd);

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    23e6:	c7 44 24 04 34 53 00 	movl   $0x5334,0x4(%esp)
    23ed:	00 
    23ee:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    23f5:	e8 f6 19 00 00       	call   3df0 <printf>
    exit();
    23fa:	e8 95 18 00 00       	call   3c94 <exit>
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    23ff:	c7 44 24 04 c8 53 00 	movl   $0x53c8,0x4(%esp)
    2406:	00 
    2407:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    240e:	e8 dd 19 00 00       	call   3df0 <printf>
    exit();
    2413:	e8 7c 18 00 00       	call   3c94 <exit>
  if(open("dd", O_WRONLY) >= 0){
    printf(1, "open dd wronly succeeded!\n");
    exit();
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    2418:	c7 44 24 04 a4 53 00 	movl   $0x53a4,0x4(%esp)
    241f:	00 
    2420:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2427:	e8 c4 19 00 00       	call   3df0 <printf>
    exit();
    242c:	e8 63 18 00 00       	call   3c94 <exit>
  if(open("dd", O_RDWR) >= 0){
    printf(1, "open dd rdwr succeeded!\n");
    exit();
  }
  if(open("dd", O_WRONLY) >= 0){
    printf(1, "open dd wronly succeeded!\n");
    2431:	c7 44 24 04 07 4a 00 	movl   $0x4a07,0x4(%esp)
    2438:	00 
    2439:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2440:	e8 ab 19 00 00       	call   3df0 <printf>
    exit();
    2445:	e8 4a 18 00 00       	call   3c94 <exit>
  if(open("dd", O_CREATE) >= 0){
    printf(1, "create dd succeeded!\n");
    exit();
  }
  if(open("dd", O_RDWR) >= 0){
    printf(1, "open dd rdwr succeeded!\n");
    244a:	c7 44 24 04 ee 49 00 	movl   $0x49ee,0x4(%esp)
    2451:	00 
    2452:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2459:	e8 92 19 00 00       	call   3df0 <printf>
    exit();
    245e:	e8 31 18 00 00       	call   3c94 <exit>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/xx/ff succeeded!\n");
    exit();
  }
  if(open("dd", O_CREATE) >= 0){
    printf(1, "create dd succeeded!\n");
    2463:	c7 44 24 04 d8 49 00 	movl   $0x49d8,0x4(%esp)
    246a:	00 
    246b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2472:	e8 79 19 00 00       	call   3df0 <printf>
    exit();
    2477:	e8 18 18 00 00       	call   3c94 <exit>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/ff/ff succeeded!\n");
    exit();
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/xx/ff succeeded!\n");
    247c:	c7 44 24 04 bc 49 00 	movl   $0x49bc,0x4(%esp)
    2483:	00 
    2484:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    248b:	e8 60 19 00 00       	call   3df0 <printf>
    exit();
    2490:	e8 ff 17 00 00       	call   3c94 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    exit();
  }

  if(chdir("dd") != 0){
    printf(1, "chdir dd failed\n");
    2495:	c7 44 24 04 fd 48 00 	movl   $0x48fd,0x4(%esp)
    249c:	00 
    249d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    24a4:	e8 47 19 00 00       	call   3df0 <printf>
    exit();
    24a9:	e8 e6 17 00 00       	call   3c94 <exit>
  if(unlink("dd/dd/ff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    24ae:	c7 44 24 04 58 53 00 	movl   $0x5358,0x4(%esp)
    24b5:	00 
    24b6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    24bd:	e8 2e 19 00 00       	call   3df0 <printf>
    exit();
    24c2:	e8 cd 17 00 00       	call   3c94 <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    exit();
  }

  if(mkdir("/dd/dd") != 0){
    printf(1, "subdir mkdir dd/dd failed\n");
    24c7:	c7 44 24 04 5b 48 00 	movl   $0x485b,0x4(%esp)
    24ce:	00 
    24cf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    24d6:	e8 15 19 00 00       	call   3df0 <printf>
    exit();
    24db:	e8 b4 17 00 00       	call   3c94 <exit>
  }
  write(fd, "ff", 2);
  close(fd);

  if(unlink("dd") >= 0){
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    24e0:	c7 44 24 04 0c 53 00 	movl   $0x530c,0x4(%esp)
    24e7:	00 
    24e8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    24ef:	e8 fc 18 00 00       	call   3df0 <printf>
    exit();
    24f4:	e8 9b 17 00 00       	call   3c94 <exit>
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create dd/ff failed\n");
    24f9:	c7 44 24 04 3f 48 00 	movl   $0x483f,0x4(%esp)
    2500:	00 
    2501:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2508:	e8 e3 18 00 00       	call   3df0 <printf>
    exit();
    250d:	e8 82 17 00 00       	call   3c94 <exit>

  printf(1, "subdir test\n");

  unlink("ff");
  if(mkdir("dd") != 0){
    printf(1, "subdir mkdir dd failed\n");
    2512:	c7 44 24 04 27 48 00 	movl   $0x4827,0x4(%esp)
    2519:	00 
    251a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2521:	e8 ca 18 00 00       	call   3df0 <printf>
    exit();
    2526:	e8 69 17 00 00       	call   3c94 <exit>
  if(unlink("dd/dd") < 0){
    printf(1, "unlink dd/dd failed\n");
    exit();
  }
  if(unlink("dd") < 0){
    printf(1, "unlink dd failed\n");
    252b:	c7 44 24 04 10 4b 00 	movl   $0x4b10,0x4(%esp)
    2532:	00 
    2533:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    253a:	e8 b1 18 00 00       	call   3df0 <printf>
    exit();
    253f:	e8 50 17 00 00       	call   3c94 <exit>
  if(unlink("dd") == 0){
    printf(1, "unlink non-empty dd succeeded!\n");
    exit();
  }
  if(unlink("dd/dd") < 0){
    printf(1, "unlink dd/dd failed\n");
    2544:	c7 44 24 04 fb 4a 00 	movl   $0x4afb,0x4(%esp)
    254b:	00 
    254c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2553:	e8 98 18 00 00       	call   3df0 <printf>
    exit();
    2558:	e8 37 17 00 00       	call   3c94 <exit>
  if(unlink("dd/ff") != 0){
    printf(1, "unlink dd/ff failed\n");
    exit();
  }
  if(unlink("dd") == 0){
    printf(1, "unlink non-empty dd succeeded!\n");
    255d:	c7 44 24 04 10 54 00 	movl   $0x5410,0x4(%esp)
    2564:	00 
    2565:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    256c:	e8 7f 18 00 00       	call   3df0 <printf>
    exit();
    2571:	e8 1e 17 00 00       	call   3c94 <exit>
  if(unlink("dd/dd/ffff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(unlink("dd/ff") != 0){
    printf(1, "unlink dd/ff failed\n");
    2576:	c7 44 24 04 e6 4a 00 	movl   $0x4ae6,0x4(%esp)
    257d:	00 
    257e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2585:	e8 66 18 00 00       	call   3df0 <printf>
    exit();
    258a:	e8 05 17 00 00       	call   3c94 <exit>
  if(chdir("dd/ff") == 0){
    printf(1, "chdir dd/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/xx") == 0){
    printf(1, "chdir dd/xx succeeded!\n");
    258f:	c7 44 24 04 ce 4a 00 	movl   $0x4ace,0x4(%esp)
    2596:	00 
    2597:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    259e:	e8 4d 18 00 00       	call   3df0 <printf>
    exit();
    25a3:	e8 ec 16 00 00       	call   3c94 <exit>
  if(unlink("dd/ff/ff") == 0){
    printf(1, "unlink dd/ff/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/ff") == 0){
    printf(1, "chdir dd/ff succeeded!\n");
    25a8:	c7 44 24 04 b6 4a 00 	movl   $0x4ab6,0x4(%esp)
    25af:	00 
    25b0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    25b7:	e8 34 18 00 00       	call   3df0 <printf>
    exit();
    25bc:	e8 d3 16 00 00       	call   3c94 <exit>
  if(unlink("dd/xx/ff") == 0){
    printf(1, "unlink dd/xx/ff succeeded!\n");
    exit();
  }
  if(unlink("dd/ff/ff") == 0){
    printf(1, "unlink dd/ff/ff succeeded!\n");
    25c1:	c7 44 24 04 9a 4a 00 	movl   $0x4a9a,0x4(%esp)
    25c8:	00 
    25c9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    25d0:	e8 1b 18 00 00       	call   3df0 <printf>
    exit();
    25d5:	e8 ba 16 00 00       	call   3c94 <exit>
  if(mkdir("dd/dd/ffff") == 0){
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    exit();
  }
  if(unlink("dd/xx/ff") == 0){
    printf(1, "unlink dd/xx/ff succeeded!\n");
    25da:	c7 44 24 04 7e 4a 00 	movl   $0x4a7e,0x4(%esp)
    25e1:	00 
    25e2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    25e9:	e8 02 18 00 00       	call   3df0 <printf>
    exit();
    25ee:	e8 a1 16 00 00       	call   3c94 <exit>
  if(mkdir("dd/xx/ff") == 0){
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/dd/ffff") == 0){
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    25f3:	c7 44 24 04 61 4a 00 	movl   $0x4a61,0x4(%esp)
    25fa:	00 
    25fb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2602:	e8 e9 17 00 00       	call   3df0 <printf>
    exit();
    2607:	e8 88 16 00 00       	call   3c94 <exit>
  if(mkdir("dd/ff/ff") == 0){
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/xx/ff") == 0){
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    260c:	c7 44 24 04 46 4a 00 	movl   $0x4a46,0x4(%esp)
    2613:	00 
    2614:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    261b:	e8 d0 17 00 00       	call   3df0 <printf>
    exit();
    2620:	e8 6f 16 00 00       	call   3c94 <exit>
  if(fd < 0){
    printf(1, "open dd/dd/ffff failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    printf(1, "read dd/dd/ffff wrong len\n");
    2625:	c7 44 24 04 73 49 00 	movl   $0x4973,0x4(%esp)
    262c:	00 
    262d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2634:	e8 b7 17 00 00       	call   3df0 <printf>
    exit();
    2639:	e8 56 16 00 00       	call   3c94 <exit>
    exit();
  }

  fd = open("dd/dd/ffff", 0);
  if(fd < 0){
    printf(1, "open dd/dd/ffff failed\n");
    263e:	c7 44 24 04 5b 49 00 	movl   $0x495b,0x4(%esp)
    2645:	00 
    2646:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    264d:	e8 9e 17 00 00       	call   3df0 <printf>
    exit();
    2652:	e8 3d 16 00 00       	call   3c94 <exit>
    2657:	89 f6                	mov    %esi,%esi
    2659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002660 <bigwrite>:
}

// test writes that are larger than the log.
void
bigwrite(void)
{
    2660:	55                   	push   %ebp
    2661:	89 e5                	mov    %esp,%ebp
    2663:	56                   	push   %esi
    2664:	53                   	push   %ebx
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    2665:	bb f3 01 00 00       	mov    $0x1f3,%ebx
}

// test writes that are larger than the log.
void
bigwrite(void)
{
    266a:	83 ec 10             	sub    $0x10,%esp
  int fd, sz;

  printf(1, "bigwrite test\n");
    266d:	c7 44 24 04 2d 4b 00 	movl   $0x4b2d,0x4(%esp)
    2674:	00 
    2675:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    267c:	e8 6f 17 00 00       	call   3df0 <printf>

  unlink("bigwrite");
    2681:	c7 04 24 3c 4b 00 00 	movl   $0x4b3c,(%esp)
    2688:	e8 57 16 00 00       	call   3ce4 <unlink>
    268d:	8d 76 00             	lea    0x0(%esi),%esi
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2690:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    2697:	00 
    2698:	c7 04 24 3c 4b 00 00 	movl   $0x4b3c,(%esp)
    269f:	e8 30 16 00 00       	call   3cd4 <open>
    if(fd < 0){
    26a4:	85 c0                	test   %eax,%eax

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    26a6:	89 c6                	mov    %eax,%esi
    if(fd < 0){
    26a8:	0f 88 8e 00 00 00    	js     273c <bigwrite+0xdc>
      printf(1, "cannot create bigwrite\n");
      exit();
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
    26ae:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    26b2:	c7 44 24 04 60 89 00 	movl   $0x8960,0x4(%esp)
    26b9:	00 
    26ba:	89 04 24             	mov    %eax,(%esp)
    26bd:	e8 f2 15 00 00       	call   3cb4 <write>
      if(cc != sz){
    26c2:	39 d8                	cmp    %ebx,%eax
    26c4:	75 55                	jne    271b <bigwrite+0xbb>
      printf(1, "cannot create bigwrite\n");
      exit();
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
    26c6:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    26ca:	c7 44 24 04 60 89 00 	movl   $0x8960,0x4(%esp)
    26d1:	00 
    26d2:	89 34 24             	mov    %esi,(%esp)
    26d5:	e8 da 15 00 00       	call   3cb4 <write>
      if(cc != sz){
    26da:	39 c3                	cmp    %eax,%ebx
    26dc:	75 3d                	jne    271b <bigwrite+0xbb>
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    26de:	81 c3 d7 01 00 00    	add    $0x1d7,%ebx
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit();
      }
    }
    close(fd);
    26e4:	89 34 24             	mov    %esi,(%esp)
    26e7:	e8 d0 15 00 00       	call   3cbc <close>
    unlink("bigwrite");
    26ec:	c7 04 24 3c 4b 00 00 	movl   $0x4b3c,(%esp)
    26f3:	e8 ec 15 00 00       	call   3ce4 <unlink>
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    26f8:	81 fb 07 18 00 00    	cmp    $0x1807,%ebx
    26fe:	75 90                	jne    2690 <bigwrite+0x30>
    }
    close(fd);
    unlink("bigwrite");
  }

  printf(1, "bigwrite ok\n");
    2700:	c7 44 24 04 6f 4b 00 	movl   $0x4b6f,0x4(%esp)
    2707:	00 
    2708:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    270f:	e8 dc 16 00 00       	call   3df0 <printf>
}
    2714:	83 c4 10             	add    $0x10,%esp
    2717:	5b                   	pop    %ebx
    2718:	5e                   	pop    %esi
    2719:	5d                   	pop    %ebp
    271a:	c3                   	ret    
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
    271b:	89 44 24 0c          	mov    %eax,0xc(%esp)
    271f:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    2723:	c7 44 24 04 5d 4b 00 	movl   $0x4b5d,0x4(%esp)
    272a:	00 
    272b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2732:	e8 b9 16 00 00       	call   3df0 <printf>
        exit();
    2737:	e8 58 15 00 00       	call   3c94 <exit>

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    if(fd < 0){
      printf(1, "cannot create bigwrite\n");
    273c:	c7 44 24 04 45 4b 00 	movl   $0x4b45,0x4(%esp)
    2743:	00 
    2744:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    274b:	e8 a0 16 00 00       	call   3df0 <printf>
      exit();
    2750:	e8 3f 15 00 00       	call   3c94 <exit>
    2755:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    2759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002760 <bigfile>:
  printf(1, "bigwrite ok\n");
}

void
bigfile(void)
{
    2760:	55                   	push   %ebp
    2761:	89 e5                	mov    %esp,%ebp
    2763:	57                   	push   %edi
    2764:	56                   	push   %esi
    2765:	53                   	push   %ebx
    2766:	83 ec 1c             	sub    $0x1c,%esp
  int fd, i, total, cc;

  printf(1, "bigfile test\n");
    2769:	c7 44 24 04 7c 4b 00 	movl   $0x4b7c,0x4(%esp)
    2770:	00 
    2771:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2778:	e8 73 16 00 00       	call   3df0 <printf>

  unlink("bigfile");
    277d:	c7 04 24 98 4b 00 00 	movl   $0x4b98,(%esp)
    2784:	e8 5b 15 00 00       	call   3ce4 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    2789:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    2790:	00 
    2791:	c7 04 24 98 4b 00 00 	movl   $0x4b98,(%esp)
    2798:	e8 37 15 00 00       	call   3cd4 <open>
  if(fd < 0){
    279d:	85 c0                	test   %eax,%eax
  int fd, i, total, cc;

  printf(1, "bigfile test\n");

  unlink("bigfile");
  fd = open("bigfile", O_CREATE | O_RDWR);
    279f:	89 c6                	mov    %eax,%esi
  if(fd < 0){
    27a1:	0f 88 7f 01 00 00    	js     2926 <bigfile+0x1c6>
    27a7:	31 db                	xor    %ebx,%ebx
    27a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    memset(buf, i, 600);
    27b0:	c7 44 24 08 58 02 00 	movl   $0x258,0x8(%esp)
    27b7:	00 
    27b8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    27bc:	c7 04 24 60 89 00 00 	movl   $0x8960,(%esp)
    27c3:	e8 48 13 00 00       	call   3b10 <memset>
    if(write(fd, buf, 600) != 600){
    27c8:	c7 44 24 08 58 02 00 	movl   $0x258,0x8(%esp)
    27cf:	00 
    27d0:	c7 44 24 04 60 89 00 	movl   $0x8960,0x4(%esp)
    27d7:	00 
    27d8:	89 34 24             	mov    %esi,(%esp)
    27db:	e8 d4 14 00 00       	call   3cb4 <write>
    27e0:	3d 58 02 00 00       	cmp    $0x258,%eax
    27e5:	0f 85 09 01 00 00    	jne    28f4 <bigfile+0x194>
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    27eb:	83 c3 01             	add    $0x1,%ebx
    27ee:	83 fb 14             	cmp    $0x14,%ebx
    27f1:	75 bd                	jne    27b0 <bigfile+0x50>
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
      exit();
    }
  }
  close(fd);
    27f3:	89 34 24             	mov    %esi,(%esp)
    27f6:	e8 c1 14 00 00       	call   3cbc <close>

  fd = open("bigfile", 0);
    27fb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2802:	00 
    2803:	c7 04 24 98 4b 00 00 	movl   $0x4b98,(%esp)
    280a:	e8 c5 14 00 00       	call   3cd4 <open>
  if(fd < 0){
    280f:	85 c0                	test   %eax,%eax
      exit();
    }
  }
  close(fd);

  fd = open("bigfile", 0);
    2811:	89 c7                	mov    %eax,%edi
  if(fd < 0){
    2813:	0f 88 f4 00 00 00    	js     290d <bigfile+0x1ad>
    2819:	31 f6                	xor    %esi,%esi
    281b:	31 db                	xor    %ebx,%ebx
    281d:	eb 2f                	jmp    284e <bigfile+0xee>
    281f:	90                   	nop
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
      break;
    if(cc != 300){
    2820:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    2825:	0f 85 97 00 00 00    	jne    28c2 <bigfile+0x162>
      printf(1, "short read bigfile\n");
      exit();
    }
    if(buf[0] != i/2 || buf[299] != i/2){
    282b:	0f be 05 60 89 00 00 	movsbl 0x8960,%eax
    2832:	89 da                	mov    %ebx,%edx
    2834:	d1 fa                	sar    %edx
    2836:	39 d0                	cmp    %edx,%eax
    2838:	75 6f                	jne    28a9 <bigfile+0x149>
    283a:	0f be 15 8b 8a 00 00 	movsbl 0x8a8b,%edx
    2841:	39 d0                	cmp    %edx,%eax
    2843:	75 64                	jne    28a9 <bigfile+0x149>
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
    2845:	81 c6 2c 01 00 00    	add    $0x12c,%esi
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    exit();
  }
  total = 0;
  for(i = 0; ; i++){
    284b:	83 c3 01             	add    $0x1,%ebx
    cc = read(fd, buf, 300);
    284e:	c7 44 24 08 2c 01 00 	movl   $0x12c,0x8(%esp)
    2855:	00 
    2856:	c7 44 24 04 60 89 00 	movl   $0x8960,0x4(%esp)
    285d:	00 
    285e:	89 3c 24             	mov    %edi,(%esp)
    2861:	e8 46 14 00 00       	call   3cac <read>
    if(cc < 0){
    2866:	83 f8 00             	cmp    $0x0,%eax
    2869:	7c 70                	jl     28db <bigfile+0x17b>
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
    286b:	75 b3                	jne    2820 <bigfile+0xc0>
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
  }
  close(fd);
    286d:	89 3c 24             	mov    %edi,(%esp)
    2870:	e8 47 14 00 00       	call   3cbc <close>
  if(total != 20*600){
    2875:	81 fe e0 2e 00 00    	cmp    $0x2ee0,%esi
    287b:	0f 85 be 00 00 00    	jne    293f <bigfile+0x1df>
    printf(1, "read bigfile wrong total\n");
    exit();
  }
  unlink("bigfile");
    2881:	c7 04 24 98 4b 00 00 	movl   $0x4b98,(%esp)
    2888:	e8 57 14 00 00       	call   3ce4 <unlink>

  printf(1, "bigfile test ok\n");
    288d:	c7 44 24 04 27 4c 00 	movl   $0x4c27,0x4(%esp)
    2894:	00 
    2895:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    289c:	e8 4f 15 00 00       	call   3df0 <printf>
}
    28a1:	83 c4 1c             	add    $0x1c,%esp
    28a4:	5b                   	pop    %ebx
    28a5:	5e                   	pop    %esi
    28a6:	5f                   	pop    %edi
    28a7:	5d                   	pop    %ebp
    28a8:	c3                   	ret    
    if(cc != 300){
      printf(1, "short read bigfile\n");
      exit();
    }
    if(buf[0] != i/2 || buf[299] != i/2){
      printf(1, "read bigfile wrong data\n");
    28a9:	c7 44 24 04 f4 4b 00 	movl   $0x4bf4,0x4(%esp)
    28b0:	00 
    28b1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    28b8:	e8 33 15 00 00       	call   3df0 <printf>
      exit();
    28bd:	e8 d2 13 00 00       	call   3c94 <exit>
      exit();
    }
    if(cc == 0)
      break;
    if(cc != 300){
      printf(1, "short read bigfile\n");
    28c2:	c7 44 24 04 e0 4b 00 	movl   $0x4be0,0x4(%esp)
    28c9:	00 
    28ca:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    28d1:	e8 1a 15 00 00       	call   3df0 <printf>
      exit();
    28d6:	e8 b9 13 00 00       	call   3c94 <exit>
  }
  total = 0;
  for(i = 0; ; i++){
    cc = read(fd, buf, 300);
    if(cc < 0){
      printf(1, "read bigfile failed\n");
    28db:	c7 44 24 04 cb 4b 00 	movl   $0x4bcb,0x4(%esp)
    28e2:	00 
    28e3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    28ea:	e8 01 15 00 00       	call   3df0 <printf>
      exit();
    28ef:	e8 a0 13 00 00       	call   3c94 <exit>
    exit();
  }
  for(i = 0; i < 20; i++){
    memset(buf, i, 600);
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
    28f4:	c7 44 24 04 a0 4b 00 	movl   $0x4ba0,0x4(%esp)
    28fb:	00 
    28fc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2903:	e8 e8 14 00 00       	call   3df0 <printf>
      exit();
    2908:	e8 87 13 00 00       	call   3c94 <exit>
  }
  close(fd);

  fd = open("bigfile", 0);
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    290d:	c7 44 24 04 b6 4b 00 	movl   $0x4bb6,0x4(%esp)
    2914:	00 
    2915:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    291c:	e8 cf 14 00 00       	call   3df0 <printf>
    exit();
    2921:	e8 6e 13 00 00       	call   3c94 <exit>
  printf(1, "bigfile test\n");

  unlink("bigfile");
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    2926:	c7 44 24 04 8a 4b 00 	movl   $0x4b8a,0x4(%esp)
    292d:	00 
    292e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2935:	e8 b6 14 00 00       	call   3df0 <printf>
    exit();
    293a:	e8 55 13 00 00       	call   3c94 <exit>
    }
    total += cc;
  }
  close(fd);
  if(total != 20*600){
    printf(1, "read bigfile wrong total\n");
    293f:	c7 44 24 04 0d 4c 00 	movl   $0x4c0d,0x4(%esp)
    2946:	00 
    2947:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    294e:	e8 9d 14 00 00       	call   3df0 <printf>
    exit();
    2953:	e8 3c 13 00 00       	call   3c94 <exit>
    2958:	90                   	nop
    2959:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00002960 <fourteen>:
  printf(1, "bigfile test ok\n");
}

void
fourteen(void)
{
    2960:	55                   	push   %ebp
    2961:	89 e5                	mov    %esp,%ebp
    2963:	83 ec 18             	sub    $0x18,%esp
  int fd;

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");
    2966:	c7 44 24 04 38 4c 00 	movl   $0x4c38,0x4(%esp)
    296d:	00 
    296e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2975:	e8 76 14 00 00       	call   3df0 <printf>

  if(mkdir("12345678901234") != 0){
    297a:	c7 04 24 73 4c 00 00 	movl   $0x4c73,(%esp)
    2981:	e8 76 13 00 00       	call   3cfc <mkdir>
    2986:	85 c0                	test   %eax,%eax
    2988:	0f 85 92 00 00 00    	jne    2a20 <fourteen+0xc0>
    printf(1, "mkdir 12345678901234 failed\n");
    exit();
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    298e:	c7 04 24 30 54 00 00 	movl   $0x5430,(%esp)
    2995:	e8 62 13 00 00       	call   3cfc <mkdir>
    299a:	85 c0                	test   %eax,%eax
    299c:	0f 85 fb 00 00 00    	jne    2a9d <fourteen+0x13d>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    exit();
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    29a2:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    29a9:	00 
    29aa:	c7 04 24 80 54 00 00 	movl   $0x5480,(%esp)
    29b1:	e8 1e 13 00 00       	call   3cd4 <open>
  if(fd < 0){
    29b6:	85 c0                	test   %eax,%eax
    29b8:	0f 88 c6 00 00 00    	js     2a84 <fourteen+0x124>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    exit();
  }
  close(fd);
    29be:	89 04 24             	mov    %eax,(%esp)
    29c1:	e8 f6 12 00 00       	call   3cbc <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    29c6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    29cd:	00 
    29ce:	c7 04 24 f0 54 00 00 	movl   $0x54f0,(%esp)
    29d5:	e8 fa 12 00 00       	call   3cd4 <open>
  if(fd < 0){
    29da:	85 c0                	test   %eax,%eax
    29dc:	0f 88 89 00 00 00    	js     2a6b <fourteen+0x10b>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    exit();
  }
  close(fd);
    29e2:	89 04 24             	mov    %eax,(%esp)
    29e5:	e8 d2 12 00 00       	call   3cbc <close>

  if(mkdir("12345678901234/12345678901234") == 0){
    29ea:	c7 04 24 64 4c 00 00 	movl   $0x4c64,(%esp)
    29f1:	e8 06 13 00 00       	call   3cfc <mkdir>
    29f6:	85 c0                	test   %eax,%eax
    29f8:	74 58                	je     2a52 <fourteen+0xf2>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    exit();
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    29fa:	c7 04 24 8c 55 00 00 	movl   $0x558c,(%esp)
    2a01:	e8 f6 12 00 00       	call   3cfc <mkdir>
    2a06:	85 c0                	test   %eax,%eax
    2a08:	74 2f                	je     2a39 <fourteen+0xd9>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    exit();
  }

  printf(1, "fourteen ok\n");
    2a0a:	c7 44 24 04 82 4c 00 	movl   $0x4c82,0x4(%esp)
    2a11:	00 
    2a12:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a19:	e8 d2 13 00 00       	call   3df0 <printf>
}
    2a1e:	c9                   	leave  
    2a1f:	c3                   	ret    

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");

  if(mkdir("12345678901234") != 0){
    printf(1, "mkdir 12345678901234 failed\n");
    2a20:	c7 44 24 04 47 4c 00 	movl   $0x4c47,0x4(%esp)
    2a27:	00 
    2a28:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a2f:	e8 bc 13 00 00       	call   3df0 <printf>
    exit();
    2a34:	e8 5b 12 00 00       	call   3c94 <exit>
  if(mkdir("12345678901234/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    exit();
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    2a39:	c7 44 24 04 ac 55 00 	movl   $0x55ac,0x4(%esp)
    2a40:	00 
    2a41:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a48:	e8 a3 13 00 00       	call   3df0 <printf>
    exit();
    2a4d:	e8 42 12 00 00       	call   3c94 <exit>
    exit();
  }
  close(fd);

  if(mkdir("12345678901234/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    2a52:	c7 44 24 04 5c 55 00 	movl   $0x555c,0x4(%esp)
    2a59:	00 
    2a5a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a61:	e8 8a 13 00 00       	call   3df0 <printf>
    exit();
    2a66:	e8 29 12 00 00       	call   3c94 <exit>
    exit();
  }
  close(fd);
  fd = open("12345678901234/12345678901234/12345678901234", 0);
  if(fd < 0){
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    2a6b:	c7 44 24 04 20 55 00 	movl   $0x5520,0x4(%esp)
    2a72:	00 
    2a73:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a7a:	e8 71 13 00 00       	call   3df0 <printf>
    exit();
    2a7f:	e8 10 12 00 00       	call   3c94 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    exit();
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
  if(fd < 0){
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    2a84:	c7 44 24 04 b0 54 00 	movl   $0x54b0,0x4(%esp)
    2a8b:	00 
    2a8c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a93:	e8 58 13 00 00       	call   3df0 <printf>
    exit();
    2a98:	e8 f7 11 00 00       	call   3c94 <exit>
  if(mkdir("12345678901234") != 0){
    printf(1, "mkdir 12345678901234 failed\n");
    exit();
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    2a9d:	c7 44 24 04 50 54 00 	movl   $0x5450,0x4(%esp)
    2aa4:	00 
    2aa5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2aac:	e8 3f 13 00 00       	call   3df0 <printf>
    exit();
    2ab1:	e8 de 11 00 00       	call   3c94 <exit>
    2ab6:	8d 76 00             	lea    0x0(%esi),%esi
    2ab9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002ac0 <rmdot>:
  printf(1, "fourteen ok\n");
}

void
rmdot(void)
{
    2ac0:	55                   	push   %ebp
    2ac1:	89 e5                	mov    %esp,%ebp
    2ac3:	83 ec 18             	sub    $0x18,%esp
  printf(1, "rmdot test\n");
    2ac6:	c7 44 24 04 8f 4c 00 	movl   $0x4c8f,0x4(%esp)
    2acd:	00 
    2ace:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2ad5:	e8 16 13 00 00       	call   3df0 <printf>
  if(mkdir("dots") != 0){
    2ada:	c7 04 24 9b 4c 00 00 	movl   $0x4c9b,(%esp)
    2ae1:	e8 16 12 00 00       	call   3cfc <mkdir>
    2ae6:	85 c0                	test   %eax,%eax
    2ae8:	0f 85 9a 00 00 00    	jne    2b88 <rmdot+0xc8>
    printf(1, "mkdir dots failed\n");
    exit();
  }
  if(chdir("dots") != 0){
    2aee:	c7 04 24 9b 4c 00 00 	movl   $0x4c9b,(%esp)
    2af5:	e8 0a 12 00 00       	call   3d04 <chdir>
    2afa:	85 c0                	test   %eax,%eax
    2afc:	0f 85 35 01 00 00    	jne    2c37 <rmdot+0x177>
    printf(1, "chdir dots failed\n");
    exit();
  }
  if(unlink(".") == 0){
    2b02:	c7 04 24 46 49 00 00 	movl   $0x4946,(%esp)
    2b09:	e8 d6 11 00 00       	call   3ce4 <unlink>
    2b0e:	85 c0                	test   %eax,%eax
    2b10:	0f 84 08 01 00 00    	je     2c1e <rmdot+0x15e>
    printf(1, "rm . worked!\n");
    exit();
  }
  if(unlink("..") == 0){
    2b16:	c7 04 24 45 49 00 00 	movl   $0x4945,(%esp)
    2b1d:	e8 c2 11 00 00       	call   3ce4 <unlink>
    2b22:	85 c0                	test   %eax,%eax
    2b24:	0f 84 db 00 00 00    	je     2c05 <rmdot+0x145>
    printf(1, "rm .. worked!\n");
    exit();
  }
  if(chdir("/") != 0){
    2b2a:	c7 04 24 19 41 00 00 	movl   $0x4119,(%esp)
    2b31:	e8 ce 11 00 00       	call   3d04 <chdir>
    2b36:	85 c0                	test   %eax,%eax
    2b38:	0f 85 ae 00 00 00    	jne    2bec <rmdot+0x12c>
    printf(1, "chdir / failed\n");
    exit();
  }
  if(unlink("dots/.") == 0){
    2b3e:	c7 04 24 e3 4c 00 00 	movl   $0x4ce3,(%esp)
    2b45:	e8 9a 11 00 00       	call   3ce4 <unlink>
    2b4a:	85 c0                	test   %eax,%eax
    2b4c:	0f 84 81 00 00 00    	je     2bd3 <rmdot+0x113>
    printf(1, "unlink dots/. worked!\n");
    exit();
  }
  if(unlink("dots/..") == 0){
    2b52:	c7 04 24 01 4d 00 00 	movl   $0x4d01,(%esp)
    2b59:	e8 86 11 00 00       	call   3ce4 <unlink>
    2b5e:	85 c0                	test   %eax,%eax
    2b60:	74 58                	je     2bba <rmdot+0xfa>
    printf(1, "unlink dots/.. worked!\n");
    exit();
  }
  if(unlink("dots") != 0){
    2b62:	c7 04 24 9b 4c 00 00 	movl   $0x4c9b,(%esp)
    2b69:	e8 76 11 00 00       	call   3ce4 <unlink>
    2b6e:	85 c0                	test   %eax,%eax
    2b70:	75 2f                	jne    2ba1 <rmdot+0xe1>
    printf(1, "unlink dots failed!\n");
    exit();
  }
  printf(1, "rmdot ok\n");
    2b72:	c7 44 24 04 36 4d 00 	movl   $0x4d36,0x4(%esp)
    2b79:	00 
    2b7a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b81:	e8 6a 12 00 00       	call   3df0 <printf>
}
    2b86:	c9                   	leave  
    2b87:	c3                   	ret    
void
rmdot(void)
{
  printf(1, "rmdot test\n");
  if(mkdir("dots") != 0){
    printf(1, "mkdir dots failed\n");
    2b88:	c7 44 24 04 a0 4c 00 	movl   $0x4ca0,0x4(%esp)
    2b8f:	00 
    2b90:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b97:	e8 54 12 00 00       	call   3df0 <printf>
    exit();
    2b9c:	e8 f3 10 00 00       	call   3c94 <exit>
  if(unlink("dots/..") == 0){
    printf(1, "unlink dots/.. worked!\n");
    exit();
  }
  if(unlink("dots") != 0){
    printf(1, "unlink dots failed!\n");
    2ba1:	c7 44 24 04 21 4d 00 	movl   $0x4d21,0x4(%esp)
    2ba8:	00 
    2ba9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2bb0:	e8 3b 12 00 00       	call   3df0 <printf>
    exit();
    2bb5:	e8 da 10 00 00       	call   3c94 <exit>
  if(unlink("dots/.") == 0){
    printf(1, "unlink dots/. worked!\n");
    exit();
  }
  if(unlink("dots/..") == 0){
    printf(1, "unlink dots/.. worked!\n");
    2bba:	c7 44 24 04 09 4d 00 	movl   $0x4d09,0x4(%esp)
    2bc1:	00 
    2bc2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2bc9:	e8 22 12 00 00       	call   3df0 <printf>
    exit();
    2bce:	e8 c1 10 00 00       	call   3c94 <exit>
  if(chdir("/") != 0){
    printf(1, "chdir / failed\n");
    exit();
  }
  if(unlink("dots/.") == 0){
    printf(1, "unlink dots/. worked!\n");
    2bd3:	c7 44 24 04 ea 4c 00 	movl   $0x4cea,0x4(%esp)
    2bda:	00 
    2bdb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2be2:	e8 09 12 00 00       	call   3df0 <printf>
    exit();
    2be7:	e8 a8 10 00 00       	call   3c94 <exit>
  if(unlink("..") == 0){
    printf(1, "rm .. worked!\n");
    exit();
  }
  if(chdir("/") != 0){
    printf(1, "chdir / failed\n");
    2bec:	c7 44 24 04 1b 41 00 	movl   $0x411b,0x4(%esp)
    2bf3:	00 
    2bf4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2bfb:	e8 f0 11 00 00       	call   3df0 <printf>
    exit();
    2c00:	e8 8f 10 00 00       	call   3c94 <exit>
  if(unlink(".") == 0){
    printf(1, "rm . worked!\n");
    exit();
  }
  if(unlink("..") == 0){
    printf(1, "rm .. worked!\n");
    2c05:	c7 44 24 04 d4 4c 00 	movl   $0x4cd4,0x4(%esp)
    2c0c:	00 
    2c0d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c14:	e8 d7 11 00 00       	call   3df0 <printf>
    exit();
    2c19:	e8 76 10 00 00       	call   3c94 <exit>
  if(chdir("dots") != 0){
    printf(1, "chdir dots failed\n");
    exit();
  }
  if(unlink(".") == 0){
    printf(1, "rm . worked!\n");
    2c1e:	c7 44 24 04 c6 4c 00 	movl   $0x4cc6,0x4(%esp)
    2c25:	00 
    2c26:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c2d:	e8 be 11 00 00       	call   3df0 <printf>
    exit();
    2c32:	e8 5d 10 00 00       	call   3c94 <exit>
  if(mkdir("dots") != 0){
    printf(1, "mkdir dots failed\n");
    exit();
  }
  if(chdir("dots") != 0){
    printf(1, "chdir dots failed\n");
    2c37:	c7 44 24 04 b3 4c 00 	movl   $0x4cb3,0x4(%esp)
    2c3e:	00 
    2c3f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c46:	e8 a5 11 00 00       	call   3df0 <printf>
    exit();
    2c4b:	e8 44 10 00 00       	call   3c94 <exit>

00002c50 <dirfile>:
  printf(1, "rmdot ok\n");
}

void
dirfile(void)
{
    2c50:	55                   	push   %ebp
    2c51:	89 e5                	mov    %esp,%ebp
    2c53:	53                   	push   %ebx
    2c54:	83 ec 14             	sub    $0x14,%esp
  int fd;

  printf(1, "dir vs file\n");
    2c57:	c7 44 24 04 40 4d 00 	movl   $0x4d40,0x4(%esp)
    2c5e:	00 
    2c5f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c66:	e8 85 11 00 00       	call   3df0 <printf>

  fd = open("dirfile", O_CREATE);
    2c6b:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    2c72:	00 
    2c73:	c7 04 24 4d 4d 00 00 	movl   $0x4d4d,(%esp)
    2c7a:	e8 55 10 00 00       	call   3cd4 <open>
  if(fd < 0){
    2c7f:	85 c0                	test   %eax,%eax
    2c81:	0f 88 4e 01 00 00    	js     2dd5 <dirfile+0x185>
    printf(1, "create dirfile failed\n");
    exit();
  }
  close(fd);
    2c87:	89 04 24             	mov    %eax,(%esp)
    2c8a:	e8 2d 10 00 00       	call   3cbc <close>
  if(chdir("dirfile") == 0){
    2c8f:	c7 04 24 4d 4d 00 00 	movl   $0x4d4d,(%esp)
    2c96:	e8 69 10 00 00       	call   3d04 <chdir>
    2c9b:	85 c0                	test   %eax,%eax
    2c9d:	0f 84 19 01 00 00    	je     2dbc <dirfile+0x16c>
    printf(1, "chdir dirfile succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", 0);
    2ca3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2caa:	00 
    2cab:	c7 04 24 86 4d 00 00 	movl   $0x4d86,(%esp)
    2cb2:	e8 1d 10 00 00       	call   3cd4 <open>
  if(fd >= 0){
    2cb7:	85 c0                	test   %eax,%eax
    2cb9:	0f 89 e4 00 00 00    	jns    2da3 <dirfile+0x153>
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", O_CREATE);
    2cbf:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    2cc6:	00 
    2cc7:	c7 04 24 86 4d 00 00 	movl   $0x4d86,(%esp)
    2cce:	e8 01 10 00 00       	call   3cd4 <open>
  if(fd >= 0){
    2cd3:	85 c0                	test   %eax,%eax
    2cd5:	0f 89 c8 00 00 00    	jns    2da3 <dirfile+0x153>
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  if(mkdir("dirfile/xx") == 0){
    2cdb:	c7 04 24 86 4d 00 00 	movl   $0x4d86,(%esp)
    2ce2:	e8 15 10 00 00       	call   3cfc <mkdir>
    2ce7:	85 c0                	test   %eax,%eax
    2ce9:	0f 84 7c 01 00 00    	je     2e6b <dirfile+0x21b>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile/xx") == 0){
    2cef:	c7 04 24 86 4d 00 00 	movl   $0x4d86,(%esp)
    2cf6:	e8 e9 0f 00 00       	call   3ce4 <unlink>
    2cfb:	85 c0                	test   %eax,%eax
    2cfd:	0f 84 4f 01 00 00    	je     2e52 <dirfile+0x202>
    printf(1, "unlink dirfile/xx succeeded!\n");
    exit();
  }
  if(link("README", "dirfile/xx") == 0){
    2d03:	c7 44 24 04 86 4d 00 	movl   $0x4d86,0x4(%esp)
    2d0a:	00 
    2d0b:	c7 04 24 ea 4d 00 00 	movl   $0x4dea,(%esp)
    2d12:	e8 dd 0f 00 00       	call   3cf4 <link>
    2d17:	85 c0                	test   %eax,%eax
    2d19:	0f 84 1a 01 00 00    	je     2e39 <dirfile+0x1e9>
    printf(1, "link to dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile") != 0){
    2d1f:	c7 04 24 4d 4d 00 00 	movl   $0x4d4d,(%esp)
    2d26:	e8 b9 0f 00 00       	call   3ce4 <unlink>
    2d2b:	85 c0                	test   %eax,%eax
    2d2d:	0f 85 ed 00 00 00    	jne    2e20 <dirfile+0x1d0>
    printf(1, "unlink dirfile failed!\n");
    exit();
  }

  fd = open(".", O_RDWR);
    2d33:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    2d3a:	00 
    2d3b:	c7 04 24 46 49 00 00 	movl   $0x4946,(%esp)
    2d42:	e8 8d 0f 00 00       	call   3cd4 <open>
  if(fd >= 0){
    2d47:	85 c0                	test   %eax,%eax
    2d49:	0f 89 b8 00 00 00    	jns    2e07 <dirfile+0x1b7>
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
    2d4f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2d56:	00 
    2d57:	c7 04 24 46 49 00 00 	movl   $0x4946,(%esp)
    2d5e:	e8 71 0f 00 00       	call   3cd4 <open>
  if(write(fd, "x", 1) > 0){
    2d63:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    2d6a:	00 
    2d6b:	c7 44 24 04 29 4a 00 	movl   $0x4a29,0x4(%esp)
    2d72:	00 
  fd = open(".", O_RDWR);
  if(fd >= 0){
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
    2d73:	89 c3                	mov    %eax,%ebx
  if(write(fd, "x", 1) > 0){
    2d75:	89 04 24             	mov    %eax,(%esp)
    2d78:	e8 37 0f 00 00       	call   3cb4 <write>
    2d7d:	85 c0                	test   %eax,%eax
    2d7f:	7f 6d                	jg     2dee <dirfile+0x19e>
    printf(1, "write . succeeded!\n");
    exit();
  }
  close(fd);
    2d81:	89 1c 24             	mov    %ebx,(%esp)
    2d84:	e8 33 0f 00 00       	call   3cbc <close>

  printf(1, "dir vs file OK\n");
    2d89:	c7 44 24 04 1d 4e 00 	movl   $0x4e1d,0x4(%esp)
    2d90:	00 
    2d91:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2d98:	e8 53 10 00 00       	call   3df0 <printf>
}
    2d9d:	83 c4 14             	add    $0x14,%esp
    2da0:	5b                   	pop    %ebx
    2da1:	5d                   	pop    %ebp
    2da2:	c3                   	ret    
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", O_CREATE);
  if(fd >= 0){
    printf(1, "create dirfile/xx succeeded!\n");
    2da3:	c7 44 24 04 91 4d 00 	movl   $0x4d91,0x4(%esp)
    2daa:	00 
    2dab:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2db2:	e8 39 10 00 00       	call   3df0 <printf>
    exit();
    2db7:	e8 d8 0e 00 00       	call   3c94 <exit>
    printf(1, "create dirfile failed\n");
    exit();
  }
  close(fd);
  if(chdir("dirfile") == 0){
    printf(1, "chdir dirfile succeeded!\n");
    2dbc:	c7 44 24 04 6c 4d 00 	movl   $0x4d6c,0x4(%esp)
    2dc3:	00 
    2dc4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2dcb:	e8 20 10 00 00       	call   3df0 <printf>
    exit();
    2dd0:	e8 bf 0e 00 00       	call   3c94 <exit>

  printf(1, "dir vs file\n");

  fd = open("dirfile", O_CREATE);
  if(fd < 0){
    printf(1, "create dirfile failed\n");
    2dd5:	c7 44 24 04 55 4d 00 	movl   $0x4d55,0x4(%esp)
    2ddc:	00 
    2ddd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2de4:	e8 07 10 00 00       	call   3df0 <printf>
    exit();
    2de9:	e8 a6 0e 00 00       	call   3c94 <exit>
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
  if(write(fd, "x", 1) > 0){
    printf(1, "write . succeeded!\n");
    2dee:	c7 44 24 04 09 4e 00 	movl   $0x4e09,0x4(%esp)
    2df5:	00 
    2df6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2dfd:	e8 ee 0f 00 00       	call   3df0 <printf>
    exit();
    2e02:	e8 8d 0e 00 00       	call   3c94 <exit>
    exit();
  }

  fd = open(".", O_RDWR);
  if(fd >= 0){
    printf(1, "open . for writing succeeded!\n");
    2e07:	c7 44 24 04 00 56 00 	movl   $0x5600,0x4(%esp)
    2e0e:	00 
    2e0f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e16:	e8 d5 0f 00 00       	call   3df0 <printf>
    exit();
    2e1b:	e8 74 0e 00 00       	call   3c94 <exit>
  if(link("README", "dirfile/xx") == 0){
    printf(1, "link to dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile") != 0){
    printf(1, "unlink dirfile failed!\n");
    2e20:	c7 44 24 04 f1 4d 00 	movl   $0x4df1,0x4(%esp)
    2e27:	00 
    2e28:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e2f:	e8 bc 0f 00 00       	call   3df0 <printf>
    exit();
    2e34:	e8 5b 0e 00 00       	call   3c94 <exit>
  if(unlink("dirfile/xx") == 0){
    printf(1, "unlink dirfile/xx succeeded!\n");
    exit();
  }
  if(link("README", "dirfile/xx") == 0){
    printf(1, "link to dirfile/xx succeeded!\n");
    2e39:	c7 44 24 04 e0 55 00 	movl   $0x55e0,0x4(%esp)
    2e40:	00 
    2e41:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e48:	e8 a3 0f 00 00       	call   3df0 <printf>
    exit();
    2e4d:	e8 42 0e 00 00       	call   3c94 <exit>
  if(mkdir("dirfile/xx") == 0){
    printf(1, "mkdir dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile/xx") == 0){
    printf(1, "unlink dirfile/xx succeeded!\n");
    2e52:	c7 44 24 04 cc 4d 00 	movl   $0x4dcc,0x4(%esp)
    2e59:	00 
    2e5a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e61:	e8 8a 0f 00 00       	call   3df0 <printf>
    exit();
    2e66:	e8 29 0e 00 00       	call   3c94 <exit>
  if(fd >= 0){
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  if(mkdir("dirfile/xx") == 0){
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2e6b:	c7 44 24 04 af 4d 00 	movl   $0x4daf,0x4(%esp)
    2e72:	00 
    2e73:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e7a:	e8 71 0f 00 00       	call   3df0 <printf>
    exit();
    2e7f:	e8 10 0e 00 00       	call   3c94 <exit>
    2e84:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    2e8a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00002e90 <iref>:
}

// test that iput() is called at the end of _namei()
void
iref(void)
{
    2e90:	55                   	push   %ebp
    2e91:	89 e5                	mov    %esp,%ebp
    2e93:	53                   	push   %ebx
  int i, fd;

  printf(1, "empty file name\n");
    2e94:	bb 33 00 00 00       	mov    $0x33,%ebx
}

// test that iput() is called at the end of _namei()
void
iref(void)
{
    2e99:	83 ec 14             	sub    $0x14,%esp
  int i, fd;

  printf(1, "empty file name\n");
    2e9c:	c7 44 24 04 2d 4e 00 	movl   $0x4e2d,0x4(%esp)
    2ea3:	00 
    2ea4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2eab:	e8 40 0f 00 00       	call   3df0 <printf>

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    if(mkdir("irefd") != 0){
    2eb0:	c7 04 24 3e 4e 00 00 	movl   $0x4e3e,(%esp)
    2eb7:	e8 40 0e 00 00       	call   3cfc <mkdir>
    2ebc:	85 c0                	test   %eax,%eax
    2ebe:	0f 85 af 00 00 00    	jne    2f73 <iref+0xe3>
      printf(1, "mkdir irefd failed\n");
      exit();
    }
    if(chdir("irefd") != 0){
    2ec4:	c7 04 24 3e 4e 00 00 	movl   $0x4e3e,(%esp)
    2ecb:	e8 34 0e 00 00       	call   3d04 <chdir>
    2ed0:	85 c0                	test   %eax,%eax
    2ed2:	0f 85 b4 00 00 00    	jne    2f8c <iref+0xfc>
      printf(1, "chdir irefd failed\n");
      exit();
    }

    mkdir("");
    2ed8:	c7 04 24 f3 44 00 00 	movl   $0x44f3,(%esp)
    2edf:	e8 18 0e 00 00       	call   3cfc <mkdir>
    link("README", "");
    2ee4:	c7 44 24 04 f3 44 00 	movl   $0x44f3,0x4(%esp)
    2eeb:	00 
    2eec:	c7 04 24 ea 4d 00 00 	movl   $0x4dea,(%esp)
    2ef3:	e8 fc 0d 00 00       	call   3cf4 <link>
    fd = open("", O_CREATE);
    2ef8:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    2eff:	00 
    2f00:	c7 04 24 f3 44 00 00 	movl   $0x44f3,(%esp)
    2f07:	e8 c8 0d 00 00       	call   3cd4 <open>
    if(fd >= 0)
    2f0c:	85 c0                	test   %eax,%eax
    2f0e:	78 08                	js     2f18 <iref+0x88>
      close(fd);
    2f10:	89 04 24             	mov    %eax,(%esp)
    2f13:	e8 a4 0d 00 00       	call   3cbc <close>
    fd = open("xx", O_CREATE);
    2f18:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    2f1f:	00 
    2f20:	c7 04 24 28 4a 00 00 	movl   $0x4a28,(%esp)
    2f27:	e8 a8 0d 00 00       	call   3cd4 <open>
    if(fd >= 0)
    2f2c:	85 c0                	test   %eax,%eax
    2f2e:	78 08                	js     2f38 <iref+0xa8>
      close(fd);
    2f30:	89 04 24             	mov    %eax,(%esp)
    2f33:	e8 84 0d 00 00       	call   3cbc <close>
    unlink("xx");
    2f38:	c7 04 24 28 4a 00 00 	movl   $0x4a28,(%esp)
    2f3f:	e8 a0 0d 00 00       	call   3ce4 <unlink>
  int i, fd;

  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    2f44:	83 eb 01             	sub    $0x1,%ebx
    2f47:	0f 85 63 ff ff ff    	jne    2eb0 <iref+0x20>
    if(fd >= 0)
      close(fd);
    unlink("xx");
  }

  chdir("/");
    2f4d:	c7 04 24 19 41 00 00 	movl   $0x4119,(%esp)
    2f54:	e8 ab 0d 00 00       	call   3d04 <chdir>
  printf(1, "empty file name OK\n");
    2f59:	c7 44 24 04 6c 4e 00 	movl   $0x4e6c,0x4(%esp)
    2f60:	00 
    2f61:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2f68:	e8 83 0e 00 00       	call   3df0 <printf>
}
    2f6d:	83 c4 14             	add    $0x14,%esp
    2f70:	5b                   	pop    %ebx
    2f71:	5d                   	pop    %ebp
    2f72:	c3                   	ret    
  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    if(mkdir("irefd") != 0){
      printf(1, "mkdir irefd failed\n");
    2f73:	c7 44 24 04 44 4e 00 	movl   $0x4e44,0x4(%esp)
    2f7a:	00 
    2f7b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2f82:	e8 69 0e 00 00       	call   3df0 <printf>
      exit();
    2f87:	e8 08 0d 00 00       	call   3c94 <exit>
    }
    if(chdir("irefd") != 0){
      printf(1, "chdir irefd failed\n");
    2f8c:	c7 44 24 04 58 4e 00 	movl   $0x4e58,0x4(%esp)
    2f93:	00 
    2f94:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2f9b:	e8 50 0e 00 00       	call   3df0 <printf>
      exit();
    2fa0:	e8 ef 0c 00 00       	call   3c94 <exit>
    2fa5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    2fa9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002fb0 <forktest>:
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    2fb0:	55                   	push   %ebp
    2fb1:	89 e5                	mov    %esp,%ebp
    2fb3:	53                   	push   %ebx
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    2fb4:	31 db                	xor    %ebx,%ebx
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    2fb6:	83 ec 14             	sub    $0x14,%esp
  int n, pid;

  printf(1, "fork test\n");
    2fb9:	c7 44 24 04 80 4e 00 	movl   $0x4e80,0x4(%esp)
    2fc0:	00 
    2fc1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2fc8:	e8 23 0e 00 00       	call   3df0 <printf>
    2fcd:	eb 13                	jmp    2fe2 <forktest+0x32>
    2fcf:	90                   	nop

  for(n=0; n<1000; n++){
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0)
    2fd0:	0f 84 87 00 00 00    	je     305d <forktest+0xad>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    2fd6:	83 c3 01             	add    $0x1,%ebx
    2fd9:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    2fdf:	90                   	nop
    2fe0:	74 4e                	je     3030 <forktest+0x80>
    pid = fork();
    2fe2:	e8 a5 0c 00 00       	call   3c8c <fork>
    if(pid < 0)
    2fe7:	83 f8 00             	cmp    $0x0,%eax
    2fea:	7d e4                	jge    2fd0 <forktest+0x20>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }

  for(; n > 0; n--){
    2fec:	85 db                	test   %ebx,%ebx
    2fee:	66 90                	xchg   %ax,%ax
    2ff0:	74 15                	je     3007 <forktest+0x57>
    2ff2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(wait() < 0){
    2ff8:	e8 9f 0c 00 00       	call   3c9c <wait>
    2ffd:	85 c0                	test   %eax,%eax
    2fff:	90                   	nop
    3000:	78 47                	js     3049 <forktest+0x99>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }

  for(; n > 0; n--){
    3002:	83 eb 01             	sub    $0x1,%ebx
    3005:	75 f1                	jne    2ff8 <forktest+0x48>
      printf(1, "wait stopped early\n");
      exit();
    }
  }

  if(wait() != -1){
    3007:	e8 90 0c 00 00       	call   3c9c <wait>
    300c:	83 f8 ff             	cmp    $0xffffffff,%eax
    300f:	90                   	nop
    3010:	75 50                	jne    3062 <forktest+0xb2>
    printf(1, "wait got too many\n");
    exit();
  }

  printf(1, "fork test OK\n");
    3012:	c7 44 24 04 b2 4e 00 	movl   $0x4eb2,0x4(%esp)
    3019:	00 
    301a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3021:	e8 ca 0d 00 00       	call   3df0 <printf>
}
    3026:	83 c4 14             	add    $0x14,%esp
    3029:	5b                   	pop    %ebx
    302a:	5d                   	pop    %ebp
    302b:	c3                   	ret    
    302c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid == 0)
      exit();
  }

  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    3030:	c7 44 24 04 20 56 00 	movl   $0x5620,0x4(%esp)
    3037:	00 
    3038:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    303f:	e8 ac 0d 00 00       	call   3df0 <printf>
    exit();
    3044:	e8 4b 0c 00 00       	call   3c94 <exit>
  }

  for(; n > 0; n--){
    if(wait() < 0){
      printf(1, "wait stopped early\n");
    3049:	c7 44 24 04 8b 4e 00 	movl   $0x4e8b,0x4(%esp)
    3050:	00 
    3051:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3058:	e8 93 0d 00 00       	call   3df0 <printf>
      exit();
    305d:	e8 32 0c 00 00       	call   3c94 <exit>
    }
  }

  if(wait() != -1){
    printf(1, "wait got too many\n");
    3062:	c7 44 24 04 9f 4e 00 	movl   $0x4e9f,0x4(%esp)
    3069:	00 
    306a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3071:	e8 7a 0d 00 00       	call   3df0 <printf>
    exit();
    3076:	e8 19 0c 00 00       	call   3c94 <exit>
    307b:	90                   	nop
    307c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003080 <sbrktest>:
  printf(1, "fork test OK\n");
}

void
sbrktest(void)
{
    3080:	55                   	push   %ebp
    3081:	89 e5                	mov    %esp,%ebp
    3083:	57                   	push   %edi
    3084:	56                   	push   %esi
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    3085:	31 f6                	xor    %esi,%esi
  printf(1, "fork test OK\n");
}

void
sbrktest(void)
{
    3087:	53                   	push   %ebx
    3088:	83 ec 7c             	sub    $0x7c,%esp
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
    308b:	a1 70 61 00 00       	mov    0x6170,%eax
    3090:	c7 44 24 04 c0 4e 00 	movl   $0x4ec0,0x4(%esp)
    3097:	00 
    3098:	89 04 24             	mov    %eax,(%esp)
    309b:	e8 50 0d 00 00       	call   3df0 <printf>
  oldbrk = sbrk(0);
    30a0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    30a7:	e8 70 0c 00 00       	call   3d1c <sbrk>

  // can one sbrk() less than a page?
  a = sbrk(0);
    30ac:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
  oldbrk = sbrk(0);
    30b3:	89 45 a4             	mov    %eax,-0x5c(%ebp)

  // can one sbrk() less than a page?
  a = sbrk(0);
    30b6:	e8 61 0c 00 00       	call   3d1c <sbrk>
    30bb:	89 c3                	mov    %eax,%ebx
    30bd:	8d 76 00             	lea    0x0(%esi),%esi
  int i;
  for(i = 0; i < 5000; i++){
    b = sbrk(1);
    30c0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    30c7:	e8 50 0c 00 00       	call   3d1c <sbrk>
    if(b != a){
    30cc:	39 d8                	cmp    %ebx,%eax
    30ce:	0f 85 7a 02 00 00    	jne    334e <sbrktest+0x2ce>
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    30d4:	83 c6 01             	add    $0x1,%esi
    b = sbrk(1);
    if(b != a){
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
      exit();
    }
    *b = 1;
    30d7:	c6 03 01             	movb   $0x1,(%ebx)
    a = b + 1;
    30da:	83 c3 01             	add    $0x1,%ebx
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    30dd:	81 fe 88 13 00 00    	cmp    $0x1388,%esi
    30e3:	75 db                	jne    30c0 <sbrktest+0x40>
      exit();
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork();
    30e5:	e8 a2 0b 00 00       	call   3c8c <fork>
  if(pid < 0){
    30ea:	85 c0                	test   %eax,%eax
      exit();
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork();
    30ec:	89 c6                	mov    %eax,%esi
  if(pid < 0){
    30ee:	0f 88 c8 03 00 00    	js     34bc <sbrktest+0x43c>
    printf(stdout, "sbrk test fork failed\n");
    exit();
  }
  c = sbrk(1);
    30f4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c = sbrk(1);
  if(c != a + 1){
    30fb:	83 c3 01             	add    $0x1,%ebx
  pid = fork();
  if(pid < 0){
    printf(stdout, "sbrk test fork failed\n");
    exit();
  }
  c = sbrk(1);
    30fe:	e8 19 0c 00 00       	call   3d1c <sbrk>
  c = sbrk(1);
    3103:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    310a:	e8 0d 0c 00 00       	call   3d1c <sbrk>
  if(c != a + 1){
    310f:	39 d8                	cmp    %ebx,%eax
    3111:	0f 85 8b 03 00 00    	jne    34a2 <sbrktest+0x422>
    printf(stdout, "sbrk test failed post-fork\n");
    exit();
  }
  if(pid == 0)
    3117:	85 f6                	test   %esi,%esi
    3119:	0f 84 7e 03 00 00    	je     349d <sbrktest+0x41d>
    311f:	90                   	nop
    exit();
  wait();
    3120:	e8 77 0b 00 00       	call   3c9c <wait>

  // can one grow address space to something big?
#define BIG (100*1024*1024)
  a = sbrk(0);
    3125:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    312c:	e8 eb 0b 00 00       	call   3d1c <sbrk>
    3131:	89 c3                	mov    %eax,%ebx
  amt = (BIG) - (uint)a;
    3133:	b8 00 00 40 06       	mov    $0x6400000,%eax
    3138:	29 d8                	sub    %ebx,%eax
  p = sbrk(amt);
    313a:	89 04 24             	mov    %eax,(%esp)
    313d:	e8 da 0b 00 00       	call   3d1c <sbrk>
  if (p != a) {
    3142:	39 d8                	cmp    %ebx,%eax
    3144:	0f 85 3e 03 00 00    	jne    3488 <sbrktest+0x408>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    exit();
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;
    314a:	c6 05 ff ff 3f 06 63 	movb   $0x63,0x63fffff

  // can one de-allocate?
  a = sbrk(0);
    3151:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3158:	e8 bf 0b 00 00       	call   3d1c <sbrk>
  c = sbrk(-4096);
    315d:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;

  // can one de-allocate?
  a = sbrk(0);
    3164:	89 c3                	mov    %eax,%ebx
  c = sbrk(-4096);
    3166:	e8 b1 0b 00 00       	call   3d1c <sbrk>
  if(c == (char*)0xffffffff){
    316b:	83 f8 ff             	cmp    $0xffffffff,%eax
    316e:	0f 84 fa 02 00 00    	je     346e <sbrktest+0x3ee>
    printf(stdout, "sbrk could not deallocate\n");
    exit();
  }
  c = sbrk(0);
    3174:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    317b:	e8 9c 0b 00 00       	call   3d1c <sbrk>
  if(c != a - 4096){
    3180:	8d 93 00 f0 ff ff    	lea    -0x1000(%ebx),%edx
    3186:	39 d0                	cmp    %edx,%eax
    3188:	0f 85 be 02 00 00    	jne    344c <sbrktest+0x3cc>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    exit();
  }

  // can one re-allocate that page?
  a = sbrk(0);
    318e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3195:	e8 82 0b 00 00       	call   3d1c <sbrk>
  c = sbrk(4096);
    319a:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    exit();
  }

  // can one re-allocate that page?
  a = sbrk(0);
    31a1:	89 c6                	mov    %eax,%esi
  c = sbrk(4096);
    31a3:	e8 74 0b 00 00       	call   3d1c <sbrk>
  if(c != a || sbrk(0) != a + 4096){
    31a8:	39 f0                	cmp    %esi,%eax
    exit();
  }

  // can one re-allocate that page?
  a = sbrk(0);
  c = sbrk(4096);
    31aa:	89 c3                	mov    %eax,%ebx
  if(c != a || sbrk(0) != a + 4096){
    31ac:	0f 85 78 02 00 00    	jne    342a <sbrktest+0x3aa>
    31b2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    31b9:	e8 5e 0b 00 00       	call   3d1c <sbrk>
    31be:	8d 93 00 10 00 00    	lea    0x1000(%ebx),%edx
    31c4:	39 d0                	cmp    %edx,%eax
    31c6:	0f 85 5e 02 00 00    	jne    342a <sbrktest+0x3aa>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    exit();
  }
  if(*lastaddr == 99){
    31cc:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    31d3:	0f 84 37 02 00 00    	je     3410 <sbrktest+0x390>
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    exit();
  }

  a = sbrk(0);
    31d9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    31e0:	e8 37 0b 00 00       	call   3d1c <sbrk>
  c = sbrk(-(sbrk(0) - oldbrk));
    31e5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    exit();
  }

  a = sbrk(0);
    31ec:	89 c3                	mov    %eax,%ebx
  c = sbrk(-(sbrk(0) - oldbrk));
    31ee:	e8 29 0b 00 00       	call   3d1c <sbrk>
    31f3:	8b 55 a4             	mov    -0x5c(%ebp),%edx
    31f6:	29 c2                	sub    %eax,%edx
    31f8:	89 14 24             	mov    %edx,(%esp)
    31fb:	e8 1c 0b 00 00       	call   3d1c <sbrk>
  if(c != a){
    3200:	39 d8                	cmp    %ebx,%eax
    3202:	0f 85 e6 01 00 00    	jne    33ee <sbrktest+0x36e>
    3208:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    320d:	8d 76 00             	lea    0x0(%esi),%esi
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    ppid = getpid();
    3210:	e8 ff 0a 00 00       	call   3d14 <getpid>
    3215:	89 c6                	mov    %eax,%esi
    pid = fork();
    3217:	e8 70 0a 00 00       	call   3c8c <fork>
    if(pid < 0){
    321c:	83 f8 00             	cmp    $0x0,%eax
    321f:	0f 8c af 01 00 00    	jl     33d4 <sbrktest+0x354>
      printf(stdout, "fork failed\n");
      exit();
    }
    if(pid == 0){
    3225:	0f 84 7c 01 00 00    	je     33a7 <sbrktest+0x327>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    322b:	81 c3 50 c3 00 00    	add    $0xc350,%ebx
    if(pid == 0){
      printf(stdout, "oops could read %x = %x\n", a, *a);
      kill(ppid);
      exit();
    }
    wait();
    3231:	e8 66 0a 00 00       	call   3c9c <wait>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    3236:	81 fb 80 84 1e 80    	cmp    $0x801e8480,%ebx
    323c:	75 d2                	jne    3210 <sbrktest+0x190>
    wait();
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    323e:	8d 7d dc             	lea    -0x24(%ebp),%edi
    3241:	89 3c 24             	mov    %edi,(%esp)
    3244:	e8 5b 0a 00 00       	call   3ca4 <pipe>
    3249:	85 c0                	test   %eax,%eax
    324b:	0f 85 3d 01 00 00    	jne    338e <sbrktest+0x30e>
    printf(1, "pipe() failed\n");
    exit();
    3251:	8d 5d b4             	lea    -0x4c(%ebp),%ebx

  printf(1, "fork test OK\n");
}

void
sbrktest(void)
    3254:	89 de                	mov    %ebx,%esi
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if((pids[i] = fork()) == 0){
    3256:	e8 31 0a 00 00       	call   3c8c <fork>
    325b:	85 c0                	test   %eax,%eax
    325d:	89 06                	mov    %eax,(%esi)
    325f:	0f 84 9f 00 00 00    	je     3304 <sbrktest+0x284>
      sbrk(BIG - (uint)sbrk(0));
      write(fds[1], "x", 1);
      // sit around until killed
      for(;;) sleep(1000);
    }
    if(pids[i] != -1)
    3265:	83 f8 ff             	cmp    $0xffffffff,%eax
    3268:	74 1a                	je     3284 <sbrktest+0x204>
      read(fds[0], &scratch, 1);
    326a:	8d 45 e7             	lea    -0x19(%ebp),%eax
    326d:	89 44 24 04          	mov    %eax,0x4(%esp)
    3271:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3274:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    327b:	00 
    327c:	89 04 24             	mov    %eax,(%esp)
    327f:	e8 28 0a 00 00       	call   3cac <read>
    3284:	83 c6 04             	add    $0x4,%esi
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3287:	39 fe                	cmp    %edi,%esi
    3289:	75 cb                	jne    3256 <sbrktest+0x1d6>
    if(pids[i] != -1)
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
    328b:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    3292:	e8 85 0a 00 00       	call   3d1c <sbrk>
    3297:	89 c6                	mov    %eax,%esi
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if(pids[i] == -1)
    3299:	8b 03                	mov    (%ebx),%eax
    329b:	83 f8 ff             	cmp    $0xffffffff,%eax
    329e:	74 0d                	je     32ad <sbrktest+0x22d>
      continue;
    kill(pids[i]);
    32a0:	89 04 24             	mov    %eax,(%esp)
    32a3:	e8 1c 0a 00 00       	call   3cc4 <kill>
    wait();
    32a8:	e8 ef 09 00 00       	call   3c9c <wait>
    32ad:	83 c3 04             	add    $0x4,%ebx
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    32b0:	39 df                	cmp    %ebx,%edi
    32b2:	75 e5                	jne    3299 <sbrktest+0x219>
    if(pids[i] == -1)
      continue;
    kill(pids[i]);
    wait();
  }
  if(c == (char*)0xffffffff){
    32b4:	83 fe ff             	cmp    $0xffffffff,%esi
    32b7:	0f 84 b7 00 00 00    	je     3374 <sbrktest+0x2f4>
    printf(stdout, "failed sbrk leaked memory\n");
    exit();
  }

  if(sbrk(0) > oldbrk)
    32bd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    32c4:	e8 53 0a 00 00       	call   3d1c <sbrk>
    32c9:	39 45 a4             	cmp    %eax,-0x5c(%ebp)
    32cc:	73 19                	jae    32e7 <sbrktest+0x267>
    sbrk(-(sbrk(0) - oldbrk));
    32ce:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    32d5:	e8 42 0a 00 00       	call   3d1c <sbrk>
    32da:	8b 55 a4             	mov    -0x5c(%ebp),%edx
    32dd:	29 c2                	sub    %eax,%edx
    32df:	89 14 24             	mov    %edx,(%esp)
    32e2:	e8 35 0a 00 00       	call   3d1c <sbrk>

  printf(stdout, "sbrk test OK\n");
    32e7:	a1 70 61 00 00       	mov    0x6170,%eax
    32ec:	c7 44 24 04 68 4f 00 	movl   $0x4f68,0x4(%esp)
    32f3:	00 
    32f4:	89 04 24             	mov    %eax,(%esp)
    32f7:	e8 f4 0a 00 00       	call   3df0 <printf>
}
    32fc:	83 c4 7c             	add    $0x7c,%esp
    32ff:	5b                   	pop    %ebx
    3300:	5e                   	pop    %esi
    3301:	5f                   	pop    %edi
    3302:	5d                   	pop    %ebp
    3303:	c3                   	ret    
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if((pids[i] = fork()) == 0){
      // allocate a lot of memory
      sbrk(BIG - (uint)sbrk(0));
    3304:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    330b:	e8 0c 0a 00 00       	call   3d1c <sbrk>
    3310:	ba 00 00 40 06       	mov    $0x6400000,%edx
    3315:	29 c2                	sub    %eax,%edx
    3317:	89 14 24             	mov    %edx,(%esp)
    331a:	e8 fd 09 00 00       	call   3d1c <sbrk>
      write(fds[1], "x", 1);
    331f:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3322:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3329:	00 
    332a:	c7 44 24 04 29 4a 00 	movl   $0x4a29,0x4(%esp)
    3331:	00 
    3332:	89 04 24             	mov    %eax,(%esp)
    3335:	e8 7a 09 00 00       	call   3cb4 <write>
    333a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      // sit around until killed
      for(;;) sleep(1000);
    3340:	c7 04 24 e8 03 00 00 	movl   $0x3e8,(%esp)
    3347:	e8 d8 09 00 00       	call   3d24 <sleep>
    334c:	eb f2                	jmp    3340 <sbrktest+0x2c0>
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    b = sbrk(1);
    if(b != a){
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    334e:	89 44 24 10          	mov    %eax,0x10(%esp)
    3352:	a1 70 61 00 00       	mov    0x6170,%eax
    3357:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    335b:	89 74 24 08          	mov    %esi,0x8(%esp)
    335f:	c7 44 24 04 cb 4e 00 	movl   $0x4ecb,0x4(%esp)
    3366:	00 
    3367:	89 04 24             	mov    %eax,(%esp)
    336a:	e8 81 0a 00 00       	call   3df0 <printf>
      exit();
    336f:	e8 20 09 00 00       	call   3c94 <exit>
      continue;
    kill(pids[i]);
    wait();
  }
  if(c == (char*)0xffffffff){
    printf(stdout, "failed sbrk leaked memory\n");
    3374:	a1 70 61 00 00       	mov    0x6170,%eax
    3379:	c7 44 24 04 4d 4f 00 	movl   $0x4f4d,0x4(%esp)
    3380:	00 
    3381:	89 04 24             	mov    %eax,(%esp)
    3384:	e8 67 0a 00 00       	call   3df0 <printf>
    exit();
    3389:	e8 06 09 00 00       	call   3c94 <exit>
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    338e:	c7 44 24 04 09 44 00 	movl   $0x4409,0x4(%esp)
    3395:	00 
    3396:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    339d:	e8 4e 0a 00 00       	call   3df0 <printf>
    exit();
    33a2:	e8 ed 08 00 00       	call   3c94 <exit>
    if(pid < 0){
      printf(stdout, "fork failed\n");
      exit();
    }
    if(pid == 0){
      printf(stdout, "oops could read %x = %x\n", a, *a);
    33a7:	0f be 03             	movsbl (%ebx),%eax
    33aa:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    33ae:	c7 44 24 04 34 4f 00 	movl   $0x4f34,0x4(%esp)
    33b5:	00 
    33b6:	89 44 24 0c          	mov    %eax,0xc(%esp)
    33ba:	a1 70 61 00 00       	mov    0x6170,%eax
    33bf:	89 04 24             	mov    %eax,(%esp)
    33c2:	e8 29 0a 00 00       	call   3df0 <printf>
      kill(ppid);
    33c7:	89 34 24             	mov    %esi,(%esp)
    33ca:	e8 f5 08 00 00       	call   3cc4 <kill>
      exit();
    33cf:	e8 c0 08 00 00       	call   3c94 <exit>
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    ppid = getpid();
    pid = fork();
    if(pid < 0){
      printf(stdout, "fork failed\n");
    33d4:	a1 70 61 00 00       	mov    0x6170,%eax
    33d9:	c7 44 24 04 11 50 00 	movl   $0x5011,0x4(%esp)
    33e0:	00 
    33e1:	89 04 24             	mov    %eax,(%esp)
    33e4:	e8 07 0a 00 00       	call   3df0 <printf>
      exit();
    33e9:	e8 a6 08 00 00       	call   3c94 <exit>
  }

  a = sbrk(0);
  c = sbrk(-(sbrk(0) - oldbrk));
  if(c != a){
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    33ee:	89 44 24 0c          	mov    %eax,0xc(%esp)
    33f2:	a1 70 61 00 00       	mov    0x6170,%eax
    33f7:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    33fb:	c7 44 24 04 14 57 00 	movl   $0x5714,0x4(%esp)
    3402:	00 
    3403:	89 04 24             	mov    %eax,(%esp)
    3406:	e8 e5 09 00 00       	call   3df0 <printf>
    exit();
    340b:	e8 84 08 00 00       	call   3c94 <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    exit();
  }
  if(*lastaddr == 99){
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    3410:	a1 70 61 00 00       	mov    0x6170,%eax
    3415:	c7 44 24 04 e4 56 00 	movl   $0x56e4,0x4(%esp)
    341c:	00 
    341d:	89 04 24             	mov    %eax,(%esp)
    3420:	e8 cb 09 00 00       	call   3df0 <printf>
    exit();
    3425:	e8 6a 08 00 00       	call   3c94 <exit>

  // can one re-allocate that page?
  a = sbrk(0);
  c = sbrk(4096);
  if(c != a || sbrk(0) != a + 4096){
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    342a:	a1 70 61 00 00       	mov    0x6170,%eax
    342f:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    3433:	89 74 24 08          	mov    %esi,0x8(%esp)
    3437:	c7 44 24 04 bc 56 00 	movl   $0x56bc,0x4(%esp)
    343e:	00 
    343f:	89 04 24             	mov    %eax,(%esp)
    3442:	e8 a9 09 00 00       	call   3df0 <printf>
    exit();
    3447:	e8 48 08 00 00       	call   3c94 <exit>
    printf(stdout, "sbrk could not deallocate\n");
    exit();
  }
  c = sbrk(0);
  if(c != a - 4096){
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    344c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    3450:	a1 70 61 00 00       	mov    0x6170,%eax
    3455:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    3459:	c7 44 24 04 84 56 00 	movl   $0x5684,0x4(%esp)
    3460:	00 
    3461:	89 04 24             	mov    %eax,(%esp)
    3464:	e8 87 09 00 00       	call   3df0 <printf>
    exit();
    3469:	e8 26 08 00 00       	call   3c94 <exit>

  // can one de-allocate?
  a = sbrk(0);
  c = sbrk(-4096);
  if(c == (char*)0xffffffff){
    printf(stdout, "sbrk could not deallocate\n");
    346e:	a1 70 61 00 00       	mov    0x6170,%eax
    3473:	c7 44 24 04 19 4f 00 	movl   $0x4f19,0x4(%esp)
    347a:	00 
    347b:	89 04 24             	mov    %eax,(%esp)
    347e:	e8 6d 09 00 00       	call   3df0 <printf>
    exit();
    3483:	e8 0c 08 00 00       	call   3c94 <exit>
#define BIG (100*1024*1024)
  a = sbrk(0);
  amt = (BIG) - (uint)a;
  p = sbrk(amt);
  if (p != a) {
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    3488:	a1 70 61 00 00       	mov    0x6170,%eax
    348d:	c7 44 24 04 44 56 00 	movl   $0x5644,0x4(%esp)
    3494:	00 
    3495:	89 04 24             	mov    %eax,(%esp)
    3498:	e8 53 09 00 00       	call   3df0 <printf>
    exit();
    349d:	e8 f2 07 00 00       	call   3c94 <exit>
    exit();
  }
  c = sbrk(1);
  c = sbrk(1);
  if(c != a + 1){
    printf(stdout, "sbrk test failed post-fork\n");
    34a2:	a1 70 61 00 00       	mov    0x6170,%eax
    34a7:	c7 44 24 04 fd 4e 00 	movl   $0x4efd,0x4(%esp)
    34ae:	00 
    34af:	89 04 24             	mov    %eax,(%esp)
    34b2:	e8 39 09 00 00       	call   3df0 <printf>
    exit();
    34b7:	e8 d8 07 00 00       	call   3c94 <exit>
    *b = 1;
    a = b + 1;
  }
  pid = fork();
  if(pid < 0){
    printf(stdout, "sbrk test fork failed\n");
    34bc:	a1 70 61 00 00       	mov    0x6170,%eax
    34c1:	c7 44 24 04 e6 4e 00 	movl   $0x4ee6,0x4(%esp)
    34c8:	00 
    34c9:	89 04 24             	mov    %eax,(%esp)
    34cc:	e8 1f 09 00 00       	call   3df0 <printf>
    exit();
    34d1:	e8 be 07 00 00       	call   3c94 <exit>
    34d6:	8d 76 00             	lea    0x0(%esi),%esi
    34d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000034e0 <validateint>:
  printf(stdout, "sbrk test OK\n");
}

void
validateint(int *p)
{
    34e0:	55                   	push   %ebp
    34e1:	89 e5                	mov    %esp,%ebp
      "int %2\n\t"
      "mov %%ebx, %%esp" :
      "=a" (res) :
      "a" (SYS_sleep), "n" (T_SYSCALL), "c" (p) :
      "ebx");
}
    34e3:	5d                   	pop    %ebp
    34e4:	c3                   	ret    
    34e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    34e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000034f0 <validatetest>:

void
validatetest(void)
{
    34f0:	55                   	push   %ebp
    34f1:	89 e5                	mov    %esp,%ebp
    34f3:	56                   	push   %esi
    34f4:	53                   	push   %ebx
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    34f5:	31 db                	xor    %ebx,%ebx
      "ebx");
}

void
validatetest(void)
{
    34f7:	83 ec 10             	sub    $0x10,%esp
  int hi, pid;
  uint p;

  printf(stdout, "validate test\n");
    34fa:	a1 70 61 00 00       	mov    0x6170,%eax
    34ff:	c7 44 24 04 76 4f 00 	movl   $0x4f76,0x4(%esp)
    3506:	00 
    3507:	89 04 24             	mov    %eax,(%esp)
    350a:	e8 e1 08 00 00       	call   3df0 <printf>
    350f:	90                   	nop
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    if((pid = fork()) == 0){
    3510:	e8 77 07 00 00       	call   3c8c <fork>
    3515:	85 c0                	test   %eax,%eax
    3517:	89 c6                	mov    %eax,%esi
    3519:	74 79                	je     3594 <validatetest+0xa4>
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
      exit();
    }
    sleep(0);
    351b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3522:	e8 fd 07 00 00       	call   3d24 <sleep>
    sleep(0);
    3527:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    352e:	e8 f1 07 00 00       	call   3d24 <sleep>
    kill(pid);
    3533:	89 34 24             	mov    %esi,(%esp)
    3536:	e8 89 07 00 00       	call   3cc4 <kill>
    wait();
    353b:	e8 5c 07 00 00       	call   3c9c <wait>

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
    3540:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    3544:	c7 04 24 85 4f 00 00 	movl   $0x4f85,(%esp)
    354b:	e8 a4 07 00 00       	call   3cf4 <link>
    3550:	83 f8 ff             	cmp    $0xffffffff,%eax
    3553:	75 2a                	jne    357f <validatetest+0x8f>
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    3555:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    355b:	81 fb 00 40 11 00    	cmp    $0x114000,%ebx
    3561:	75 ad                	jne    3510 <validatetest+0x20>
      printf(stdout, "link should not succeed\n");
      exit();
    }
  }

  printf(stdout, "validate ok\n");
    3563:	a1 70 61 00 00       	mov    0x6170,%eax
    3568:	c7 44 24 04 a9 4f 00 	movl   $0x4fa9,0x4(%esp)
    356f:	00 
    3570:	89 04 24             	mov    %eax,(%esp)
    3573:	e8 78 08 00 00       	call   3df0 <printf>
}
    3578:	83 c4 10             	add    $0x10,%esp
    357b:	5b                   	pop    %ebx
    357c:	5e                   	pop    %esi
    357d:	5d                   	pop    %ebp
    357e:	c3                   	ret    
    kill(pid);
    wait();

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
      printf(stdout, "link should not succeed\n");
    357f:	a1 70 61 00 00       	mov    0x6170,%eax
    3584:	c7 44 24 04 90 4f 00 	movl   $0x4f90,0x4(%esp)
    358b:	00 
    358c:	89 04 24             	mov    %eax,(%esp)
    358f:	e8 5c 08 00 00       	call   3df0 <printf>
      exit();
    3594:	e8 fb 06 00 00       	call   3c94 <exit>
    3599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000035a0 <bsstest>:

// does unintialized data start out zero?
char uninit[10000];
void
bsstest(void)
{
    35a0:	55                   	push   %ebp
    35a1:	89 e5                	mov    %esp,%ebp
    35a3:	83 ec 18             	sub    $0x18,%esp
  int i;

  printf(stdout, "bss test\n");
    35a6:	a1 70 61 00 00       	mov    0x6170,%eax
    35ab:	c7 44 24 04 b6 4f 00 	movl   $0x4fb6,0x4(%esp)
    35b2:	00 
    35b3:	89 04 24             	mov    %eax,(%esp)
    35b6:	e8 35 08 00 00       	call   3df0 <printf>
  for(i = 0; i < sizeof(uninit); i++){
    if(uninit[i] != '\0'){
    35bb:	80 3d 40 62 00 00 00 	cmpb   $0x0,0x6240
    35c2:	75 36                	jne    35fa <bsstest+0x5a>
    35c4:	b8 01 00 00 00       	mov    $0x1,%eax
    35c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    35d0:	80 b8 40 62 00 00 00 	cmpb   $0x0,0x6240(%eax)
    35d7:	75 21                	jne    35fa <bsstest+0x5a>
bsstest(void)
{
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    35d9:	83 c0 01             	add    $0x1,%eax
    35dc:	3d 10 27 00 00       	cmp    $0x2710,%eax
    35e1:	75 ed                	jne    35d0 <bsstest+0x30>
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
      exit();
    }
  }
  printf(stdout, "bss test ok\n");
    35e3:	a1 70 61 00 00       	mov    0x6170,%eax
    35e8:	c7 44 24 04 d1 4f 00 	movl   $0x4fd1,0x4(%esp)
    35ef:	00 
    35f0:	89 04 24             	mov    %eax,(%esp)
    35f3:	e8 f8 07 00 00       	call   3df0 <printf>
}
    35f8:	c9                   	leave  
    35f9:	c3                   	ret    
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
    35fa:	a1 70 61 00 00       	mov    0x6170,%eax
    35ff:	c7 44 24 04 c0 4f 00 	movl   $0x4fc0,0x4(%esp)
    3606:	00 
    3607:	89 04 24             	mov    %eax,(%esp)
    360a:	e8 e1 07 00 00       	call   3df0 <printf>
      exit();
    360f:	e8 80 06 00 00       	call   3c94 <exit>
    3614:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    361a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00003620 <bigargtest>:
// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(void)
{
    3620:	55                   	push   %ebp
    3621:	89 e5                	mov    %esp,%ebp
    3623:	83 ec 18             	sub    $0x18,%esp
  int pid, fd;

  unlink("bigarg-ok");
    3626:	c7 04 24 de 4f 00 00 	movl   $0x4fde,(%esp)
    362d:	e8 b2 06 00 00       	call   3ce4 <unlink>
  pid = fork();
    3632:	e8 55 06 00 00       	call   3c8c <fork>
  if(pid == 0){
    3637:	83 f8 00             	cmp    $0x0,%eax
    363a:	74 44                	je     3680 <bigargtest+0x60>
    363c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    exec("echo", args);
    printf(stdout, "bigarg test ok\n");
    fd = open("bigarg-ok", O_CREATE);
    close(fd);
    exit();
  } else if(pid < 0){
    3640:	0f 8c d0 00 00 00    	jl     3716 <bigargtest+0xf6>
    printf(stdout, "bigargtest: fork failed\n");
    exit();
  }
  wait();
    3646:	e8 51 06 00 00       	call   3c9c <wait>
  fd = open("bigarg-ok", 0);
    364b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3652:	00 
    3653:	c7 04 24 de 4f 00 00 	movl   $0x4fde,(%esp)
    365a:	e8 75 06 00 00       	call   3cd4 <open>
  if(fd < 0){
    365f:	85 c0                	test   %eax,%eax
    3661:	0f 88 95 00 00 00    	js     36fc <bigargtest+0xdc>
    printf(stdout, "bigarg test failed!\n");
    exit();
  }
  close(fd);
    3667:	89 04 24             	mov    %eax,(%esp)
    366a:	e8 4d 06 00 00       	call   3cbc <close>
  unlink("bigarg-ok");
    366f:	c7 04 24 de 4f 00 00 	movl   $0x4fde,(%esp)
    3676:	e8 69 06 00 00       	call   3ce4 <unlink>
}
    367b:	c9                   	leave  
    367c:	c3                   	ret    
    367d:	8d 76 00             	lea    0x0(%esi),%esi
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    3680:	c7 04 85 a0 61 00 00 	movl   $0x5738,0x61a0(,%eax,4)
    3687:	38 57 00 00 
  unlink("bigarg-ok");
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    368b:	83 c0 01             	add    $0x1,%eax
    368e:	83 f8 1f             	cmp    $0x1f,%eax
    3691:	75 ed                	jne    3680 <bigargtest+0x60>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    printf(stdout, "bigarg test\n");
    3693:	a1 70 61 00 00       	mov    0x6170,%eax
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    3698:	c7 05 1c 62 00 00 00 	movl   $0x0,0x621c
    369f:	00 00 00 
    printf(stdout, "bigarg test\n");
    36a2:	c7 44 24 04 e8 4f 00 	movl   $0x4fe8,0x4(%esp)
    36a9:	00 
    36aa:	89 04 24             	mov    %eax,(%esp)
    36ad:	e8 3e 07 00 00       	call   3df0 <printf>
    exec("echo", args);
    36b2:	c7 44 24 04 a0 61 00 	movl   $0x61a0,0x4(%esp)
    36b9:	00 
    36ba:	c7 04 24 b5 41 00 00 	movl   $0x41b5,(%esp)
    36c1:	e8 06 06 00 00       	call   3ccc <exec>
    printf(stdout, "bigarg test ok\n");
    36c6:	a1 70 61 00 00       	mov    0x6170,%eax
    36cb:	c7 44 24 04 f5 4f 00 	movl   $0x4ff5,0x4(%esp)
    36d2:	00 
    36d3:	89 04 24             	mov    %eax,(%esp)
    36d6:	e8 15 07 00 00       	call   3df0 <printf>
    fd = open("bigarg-ok", O_CREATE);
    36db:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    36e2:	00 
    36e3:	c7 04 24 de 4f 00 00 	movl   $0x4fde,(%esp)
    36ea:	e8 e5 05 00 00       	call   3cd4 <open>
    close(fd);
    36ef:	89 04 24             	mov    %eax,(%esp)
    36f2:	e8 c5 05 00 00       	call   3cbc <close>
    exit();
    36f7:	e8 98 05 00 00       	call   3c94 <exit>
    exit();
  }
  wait();
  fd = open("bigarg-ok", 0);
  if(fd < 0){
    printf(stdout, "bigarg test failed!\n");
    36fc:	a1 70 61 00 00       	mov    0x6170,%eax
    3701:	c7 44 24 04 1e 50 00 	movl   $0x501e,0x4(%esp)
    3708:	00 
    3709:	89 04 24             	mov    %eax,(%esp)
    370c:	e8 df 06 00 00       	call   3df0 <printf>
    exit();
    3711:	e8 7e 05 00 00       	call   3c94 <exit>
    printf(stdout, "bigarg test ok\n");
    fd = open("bigarg-ok", O_CREATE);
    close(fd);
    exit();
  } else if(pid < 0){
    printf(stdout, "bigargtest: fork failed\n");
    3716:	a1 70 61 00 00       	mov    0x6170,%eax
    371b:	c7 44 24 04 05 50 00 	movl   $0x5005,0x4(%esp)
    3722:	00 
    3723:	89 04 24             	mov    %eax,(%esp)
    3726:	e8 c5 06 00 00       	call   3df0 <printf>
    exit();
    372b:	e8 64 05 00 00       	call   3c94 <exit>

00003730 <fsfull>:

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    3730:	55                   	push   %ebp
    3731:	89 e5                	mov    %esp,%ebp
    3733:	57                   	push   %edi
    3734:	56                   	push   %esi
    3735:	53                   	push   %ebx
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    3736:	31 db                	xor    %ebx,%ebx

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    3738:	83 ec 5c             	sub    $0x5c,%esp
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");
    373b:	c7 44 24 04 33 50 00 	movl   $0x5033,0x4(%esp)
    3742:	00 
    3743:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    374a:	e8 a1 06 00 00       	call   3df0 <printf>
    374f:	90                   	nop

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3750:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    3755:	89 de                	mov    %ebx,%esi
    3757:	f7 eb                	imul   %ebx
    name[2] = '0' + (nfiles % 1000) / 100;
    3759:	89 d9                	mov    %ebx,%ecx
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    375b:	c1 fe 1f             	sar    $0x1f,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    375e:	bf 67 66 66 66       	mov    $0x66666667,%edi

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    3763:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    3767:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    376b:	c1 fa 06             	sar    $0x6,%edx
    376e:	29 f2                	sub    %esi,%edx
    3770:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    3773:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3779:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    377c:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    3781:	c7 44 24 04 40 50 00 	movl   $0x5040,0x4(%esp)
    3788:	00 
    3789:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    3790:	29 d1                	sub    %edx,%ecx
    3792:	f7 e9                	imul   %ecx
    name[3] = '0' + (nfiles % 100) / 10;
    3794:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    3799:	c1 f9 1f             	sar    $0x1f,%ecx
    379c:	c1 fa 05             	sar    $0x5,%edx
    379f:	29 ca                	sub    %ecx,%edx
    name[3] = '0' + (nfiles % 100) / 10;
    37a1:	89 d9                	mov    %ebx,%ecx

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    37a3:	83 c2 30             	add    $0x30,%edx
    37a6:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    37a9:	f7 eb                	imul   %ebx
    37ab:	c1 fa 05             	sar    $0x5,%edx
    37ae:	29 f2                	sub    %esi,%edx
    37b0:	6b d2 64             	imul   $0x64,%edx,%edx
    37b3:	29 d1                	sub    %edx,%ecx
    37b5:	89 c8                	mov    %ecx,%eax
    37b7:	f7 ef                	imul   %edi
    name[4] = '0' + (nfiles % 10);
    37b9:	89 d8                	mov    %ebx,%eax
  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    37bb:	c1 f9 1f             	sar    $0x1f,%ecx
    37be:	c1 fa 02             	sar    $0x2,%edx
    37c1:	29 ca                	sub    %ecx,%edx
    37c3:	83 c2 30             	add    $0x30,%edx
    37c6:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    37c9:	f7 ef                	imul   %edi
    37cb:	c1 fa 02             	sar    $0x2,%edx
    37ce:	29 f2                	sub    %esi,%edx
    37d0:	8d 04 92             	lea    (%edx,%edx,4),%eax
    37d3:	89 da                	mov    %ebx,%edx
    37d5:	01 c0                	add    %eax,%eax
    37d7:	29 c2                	sub    %eax,%edx
    37d9:	89 d0                	mov    %edx,%eax
    37db:	83 c0 30             	add    $0x30,%eax
    37de:	88 45 ac             	mov    %al,-0x54(%ebp)
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    37e1:	8d 45 a8             	lea    -0x58(%ebp),%eax
    37e4:	89 44 24 08          	mov    %eax,0x8(%esp)
    37e8:	e8 03 06 00 00       	call   3df0 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    37ed:	8d 55 a8             	lea    -0x58(%ebp),%edx
    37f0:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    37f7:	00 
    37f8:	89 14 24             	mov    %edx,(%esp)
    37fb:	e8 d4 04 00 00       	call   3cd4 <open>
    if(fd < 0){
    3800:	85 c0                	test   %eax,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    int fd = open(name, O_CREATE|O_RDWR);
    3802:	89 c7                	mov    %eax,%edi
    if(fd < 0){
    3804:	78 57                	js     385d <fsfull+0x12d>
    3806:	31 f6                	xor    %esi,%esi
    3808:	eb 08                	jmp    3812 <fsfull+0xe2>
    380a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
      if(cc < 512)
        break;
      total += cc;
    3810:	01 c6                	add    %eax,%esi
      printf(1, "open %s failed\n", name);
      break;
    }
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
    3812:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    3819:	00 
    381a:	c7 44 24 04 60 89 00 	movl   $0x8960,0x4(%esp)
    3821:	00 
    3822:	89 3c 24             	mov    %edi,(%esp)
    3825:	e8 8a 04 00 00       	call   3cb4 <write>
      if(cc < 512)
    382a:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    382f:	7f df                	jg     3810 <fsfull+0xe0>
        break;
      total += cc;
      fsblocks++;
    }
    printf(1, "wrote %d bytes\n", total);
    3831:	89 74 24 08          	mov    %esi,0x8(%esp)
    3835:	c7 44 24 04 5c 50 00 	movl   $0x505c,0x4(%esp)
    383c:	00 
    383d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3844:	e8 a7 05 00 00       	call   3df0 <printf>
    close(fd);
    3849:	89 3c 24             	mov    %edi,(%esp)
    384c:	e8 6b 04 00 00       	call   3cbc <close>
    if(total == 0)
    3851:	85 f6                	test   %esi,%esi
    3853:	74 23                	je     3878 <fsfull+0x148>
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    3855:	83 c3 01             	add    $0x1,%ebx
    }
    printf(1, "wrote %d bytes\n", total);
    close(fd);
    if(total == 0)
      break;
  }
    3858:	e9 f3 fe ff ff       	jmp    3750 <fsfull+0x20>
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    int fd = open(name, O_CREATE|O_RDWR);
    if(fd < 0){
      printf(1, "open %s failed\n", name);
    385d:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3860:	89 44 24 08          	mov    %eax,0x8(%esp)
    3864:	c7 44 24 04 4c 50 00 	movl   $0x504c,0x4(%esp)
    386b:	00 
    386c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3873:	e8 78 05 00 00       	call   3df0 <printf>
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3878:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    387d:	89 de                	mov    %ebx,%esi
    387f:	f7 eb                	imul   %ebx
    name[2] = '0' + (nfiles % 1000) / 100;
    3881:	89 d9                	mov    %ebx,%ecx
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3883:	c1 fe 1f             	sar    $0x1f,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    3886:	bf 67 66 66 66       	mov    $0x66666667,%edi
      break;
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    388b:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    388f:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3893:	c1 fa 06             	sar    $0x6,%edx
    3896:	29 f2                	sub    %esi,%edx
    3898:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    389b:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    38a1:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    38a4:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    38a9:	29 d1                	sub    %edx,%ecx
    38ab:	f7 e9                	imul   %ecx
    name[3] = '0' + (nfiles % 100) / 10;
    38ad:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    38b2:	c1 f9 1f             	sar    $0x1f,%ecx
    38b5:	c1 fa 05             	sar    $0x5,%edx
    38b8:	29 ca                	sub    %ecx,%edx
    name[3] = '0' + (nfiles % 100) / 10;
    38ba:	89 d9                	mov    %ebx,%ecx

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    38bc:	83 c2 30             	add    $0x30,%edx
    38bf:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    38c2:	f7 eb                	imul   %ebx
    38c4:	c1 fa 05             	sar    $0x5,%edx
    38c7:	29 f2                	sub    %esi,%edx
    38c9:	6b d2 64             	imul   $0x64,%edx,%edx
    38cc:	29 d1                	sub    %edx,%ecx
    38ce:	89 c8                	mov    %ecx,%eax
    38d0:	f7 ef                	imul   %edi
    name[4] = '0' + (nfiles % 10);
    38d2:	89 d8                	mov    %ebx,%eax
  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    38d4:	c1 f9 1f             	sar    $0x1f,%ecx
    38d7:	c1 fa 02             	sar    $0x2,%edx
    38da:	29 ca                	sub    %ecx,%edx
    38dc:	83 c2 30             	add    $0x30,%edx
    38df:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    38e2:	f7 ef                	imul   %edi
    38e4:	c1 fa 02             	sar    $0x2,%edx
    38e7:	29 f2                	sub    %esi,%edx
    38e9:	8d 04 92             	lea    (%edx,%edx,4),%eax
    38ec:	89 da                	mov    %ebx,%edx
    38ee:	01 c0                	add    %eax,%eax
    name[5] = '\0';
    unlink(name);
    nfiles--;
    38f0:	83 eb 01             	sub    $0x1,%ebx
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    38f3:	29 c2                	sub    %eax,%edx
    38f5:	89 d0                	mov    %edx,%eax
    38f7:	83 c0 30             	add    $0x30,%eax
    38fa:	88 45 ac             	mov    %al,-0x54(%ebp)
    name[5] = '\0';
    unlink(name);
    38fd:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3900:	89 04 24             	mov    %eax,(%esp)
    3903:	e8 dc 03 00 00       	call   3ce4 <unlink>
    close(fd);
    if(total == 0)
      break;
  }

  while(nfiles >= 0){
    3908:	83 fb ff             	cmp    $0xffffffff,%ebx
    390b:	0f 85 67 ff ff ff    	jne    3878 <fsfull+0x148>
    name[5] = '\0';
    unlink(name);
    nfiles--;
  }

  printf(1, "fsfull test finished\n");
    3911:	c7 44 24 04 6c 50 00 	movl   $0x506c,0x4(%esp)
    3918:	00 
    3919:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3920:	e8 cb 04 00 00       	call   3df0 <printf>
}
    3925:	83 c4 5c             	add    $0x5c,%esp
    3928:	5b                   	pop    %ebx
    3929:	5e                   	pop    %esi
    392a:	5f                   	pop    %edi
    392b:	5d                   	pop    %ebp
    392c:	c3                   	ret    
    392d:	8d 76 00             	lea    0x0(%esi),%esi

00003930 <uio>:

void
uio()
{
    3930:	55                   	push   %ebp
    3931:	89 e5                	mov    %esp,%ebp
    3933:	83 ec 18             	sub    $0x18,%esp

  ushort port = 0;
  uchar val = 0;
  int pid;

  printf(1, "uio test\n");
    3936:	c7 44 24 04 82 50 00 	movl   $0x5082,0x4(%esp)
    393d:	00 
    393e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3945:	e8 a6 04 00 00       	call   3df0 <printf>
  pid = fork();
    394a:	e8 3d 03 00 00       	call   3c8c <fork>
  if(pid == 0){
    394f:	83 f8 00             	cmp    $0x0,%eax
    3952:	74 1d                	je     3971 <uio+0x41>
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    port = RTC_DATA;
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    printf(1, "uio: uio succeeded; test FAILED\n");
    exit();
  } else if(pid < 0){
    3954:	7c 42                	jl     3998 <uio+0x68>
    printf (1, "fork failed\n");
    exit();
  }
  wait();
    3956:	e8 41 03 00 00       	call   3c9c <wait>
  printf(1, "uio test done\n");
    395b:	c7 44 24 04 8c 50 00 	movl   $0x508c,0x4(%esp)
    3962:	00 
    3963:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    396a:	e8 81 04 00 00       	call   3df0 <printf>
}
    396f:	c9                   	leave  
    3970:	c3                   	ret    
  pid = fork();
  if(pid == 0){
    port = RTC_ADDR;
    val = 0x09;  /* year */
    /* http://wiki.osdev.org/Inline_Assembly/Examples */
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    3971:	ba 70 00 00 00       	mov    $0x70,%edx
    3976:	b8 09 00 00 00       	mov    $0x9,%eax
    397b:	ee                   	out    %al,(%dx)
    port = RTC_DATA;
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    397c:	b2 71                	mov    $0x71,%dl
    397e:	ec                   	in     (%dx),%al
    printf(1, "uio: uio succeeded; test FAILED\n");
    397f:	c7 44 24 04 18 58 00 	movl   $0x5818,0x4(%esp)
    3986:	00 
    3987:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    398e:	e8 5d 04 00 00       	call   3df0 <printf>
    exit();
    3993:	e8 fc 02 00 00       	call   3c94 <exit>
  } else if(pid < 0){
    printf (1, "fork failed\n");
    3998:	c7 44 24 04 11 50 00 	movl   $0x5011,0x4(%esp)
    399f:	00 
    39a0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    39a7:	e8 44 04 00 00       	call   3df0 <printf>
    exit();
    39ac:	e8 e3 02 00 00       	call   3c94 <exit>
    39b1:	eb 0d                	jmp    39c0 <argptest>
    39b3:	90                   	nop
    39b4:	90                   	nop
    39b5:	90                   	nop
    39b6:	90                   	nop
    39b7:	90                   	nop
    39b8:	90                   	nop
    39b9:	90                   	nop
    39ba:	90                   	nop
    39bb:	90                   	nop
    39bc:	90                   	nop
    39bd:	90                   	nop
    39be:	90                   	nop
    39bf:	90                   	nop

000039c0 <argptest>:
  wait();
  printf(1, "uio test done\n");
}

void argptest()
{
    39c0:	55                   	push   %ebp
    39c1:	89 e5                	mov    %esp,%ebp
    39c3:	53                   	push   %ebx
    39c4:	83 ec 14             	sub    $0x14,%esp
  int fd;
  fd = open("init", O_RDONLY);
    39c7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    39ce:	00 
    39cf:	c7 04 24 9b 50 00 00 	movl   $0x509b,(%esp)
    39d6:	e8 f9 02 00 00       	call   3cd4 <open>
  if (fd < 0) {
    39db:	85 c0                	test   %eax,%eax
}

void argptest()
{
  int fd;
  fd = open("init", O_RDONLY);
    39dd:	89 c3                	mov    %eax,%ebx
  if (fd < 0) {
    39df:	78 45                	js     3a26 <argptest+0x66>
    printf(2, "open failed\n");
    exit();
  }
  read(fd, sbrk(0) - 1, -1);
    39e1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    39e8:	e8 2f 03 00 00       	call   3d1c <sbrk>
    39ed:	89 1c 24             	mov    %ebx,(%esp)
    39f0:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
    39f7:	ff 
    39f8:	83 e8 01             	sub    $0x1,%eax
    39fb:	89 44 24 04          	mov    %eax,0x4(%esp)
    39ff:	e8 a8 02 00 00       	call   3cac <read>
  close(fd);
    3a04:	89 1c 24             	mov    %ebx,(%esp)
    3a07:	e8 b0 02 00 00       	call   3cbc <close>
  printf(1, "arg test passed\n");
    3a0c:	c7 44 24 04 ad 50 00 	movl   $0x50ad,0x4(%esp)
    3a13:	00 
    3a14:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3a1b:	e8 d0 03 00 00       	call   3df0 <printf>
}
    3a20:	83 c4 14             	add    $0x14,%esp
    3a23:	5b                   	pop    %ebx
    3a24:	5d                   	pop    %ebp
    3a25:	c3                   	ret    
void argptest()
{
  int fd;
  fd = open("init", O_RDONLY);
  if (fd < 0) {
    printf(2, "open failed\n");
    3a26:	c7 44 24 04 a0 50 00 	movl   $0x50a0,0x4(%esp)
    3a2d:	00 
    3a2e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    3a35:	e8 b6 03 00 00       	call   3df0 <printf>
    exit();
    3a3a:	e8 55 02 00 00       	call   3c94 <exit>
    3a3f:	90                   	nop

00003a40 <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
    3a40:	69 05 6c 61 00 00 0d 	imul   $0x19660d,0x616c,%eax
    3a47:	66 19 00 
}

unsigned long randstate = 1;
unsigned int
rand()
{
    3a4a:	55                   	push   %ebp
    3a4b:	89 e5                	mov    %esp,%ebp
  randstate = randstate * 1664525 + 1013904223;
  return randstate;
}
    3a4d:	5d                   	pop    %ebp

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
    3a4e:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    3a53:	a3 6c 61 00 00       	mov    %eax,0x616c
  return randstate;
}
    3a58:	c3                   	ret    
    3a59:	90                   	nop
    3a5a:	90                   	nop
    3a5b:	90                   	nop
    3a5c:	90                   	nop
    3a5d:	90                   	nop
    3a5e:	90                   	nop
    3a5f:	90                   	nop

00003a60 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    3a60:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    3a61:	31 d2                	xor    %edx,%edx
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    3a63:	89 e5                	mov    %esp,%ebp
    3a65:	8b 45 08             	mov    0x8(%ebp),%eax
    3a68:	53                   	push   %ebx
    3a69:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    3a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    3a70:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
    3a74:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    3a77:	83 c2 01             	add    $0x1,%edx
    3a7a:	84 c9                	test   %cl,%cl
    3a7c:	75 f2                	jne    3a70 <strcpy+0x10>
    ;
  return os;
}
    3a7e:	5b                   	pop    %ebx
    3a7f:	5d                   	pop    %ebp
    3a80:	c3                   	ret    
    3a81:	eb 0d                	jmp    3a90 <strcmp>
    3a83:	90                   	nop
    3a84:	90                   	nop
    3a85:	90                   	nop
    3a86:	90                   	nop
    3a87:	90                   	nop
    3a88:	90                   	nop
    3a89:	90                   	nop
    3a8a:	90                   	nop
    3a8b:	90                   	nop
    3a8c:	90                   	nop
    3a8d:	90                   	nop
    3a8e:	90                   	nop
    3a8f:	90                   	nop

00003a90 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    3a90:	55                   	push   %ebp
    3a91:	89 e5                	mov    %esp,%ebp
    3a93:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3a96:	56                   	push   %esi
    3a97:	8b 55 0c             	mov    0xc(%ebp),%edx
    3a9a:	53                   	push   %ebx
  while(*p && *p == *q)
    3a9b:	0f b6 01             	movzbl (%ecx),%eax
    3a9e:	0f b6 1a             	movzbl (%edx),%ebx
    3aa1:	84 c0                	test   %al,%al
    3aa3:	74 23                	je     3ac8 <strcmp+0x38>
    3aa5:	38 d8                	cmp    %bl,%al
    3aa7:	74 10                	je     3ab9 <strcmp+0x29>
    3aa9:	eb 2d                	jmp    3ad8 <strcmp+0x48>
    3aab:	90                   	nop
    3aac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3ab0:	83 c1 01             	add    $0x1,%ecx
    3ab3:	38 d8                	cmp    %bl,%al
    3ab5:	75 21                	jne    3ad8 <strcmp+0x48>
    p++, q++;
    3ab7:	89 f2                	mov    %esi,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3ab9:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
    3abd:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3ac0:	0f b6 5a 01          	movzbl 0x1(%edx),%ebx
    3ac4:	84 c0                	test   %al,%al
    3ac6:	75 e8                	jne    3ab0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3ac8:	0f b6 db             	movzbl %bl,%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3acb:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3acd:	29 d8                	sub    %ebx,%eax
}
    3acf:	5b                   	pop    %ebx
    3ad0:	5e                   	pop    %esi
    3ad1:	5d                   	pop    %ebp
    3ad2:	c3                   	ret    
    3ad3:	90                   	nop
    3ad4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3ad8:	0f b6 db             	movzbl %bl,%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3adb:	0f b6 c0             	movzbl %al,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3ade:	29 d8                	sub    %ebx,%eax
}
    3ae0:	5b                   	pop    %ebx
    3ae1:	5e                   	pop    %esi
    3ae2:	5d                   	pop    %ebp
    3ae3:	c3                   	ret    
    3ae4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3aea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00003af0 <strlen>:

uint
strlen(const char *s)
{
    3af0:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
    3af1:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
    3af3:	89 e5                	mov    %esp,%ebp
    3af5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    3af8:	80 39 00             	cmpb   $0x0,(%ecx)
    3afb:	74 0e                	je     3b0b <strlen+0x1b>
    3afd:	31 d2                	xor    %edx,%edx
    3aff:	90                   	nop
    3b00:	83 c2 01             	add    $0x1,%edx
    3b03:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    3b07:	89 d0                	mov    %edx,%eax
    3b09:	75 f5                	jne    3b00 <strlen+0x10>
    ;
  return n;
}
    3b0b:	5d                   	pop    %ebp
    3b0c:	c3                   	ret    
    3b0d:	8d 76 00             	lea    0x0(%esi),%esi

00003b10 <memset>:

void*
memset(void *dst, int c, uint n)
{
    3b10:	55                   	push   %ebp
    3b11:	89 e5                	mov    %esp,%ebp
    3b13:	8b 55 08             	mov    0x8(%ebp),%edx
    3b16:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    3b17:	8b 4d 10             	mov    0x10(%ebp),%ecx
    3b1a:	8b 45 0c             	mov    0xc(%ebp),%eax
    3b1d:	89 d7                	mov    %edx,%edi
    3b1f:	fc                   	cld    
    3b20:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    3b22:	89 d0                	mov    %edx,%eax
    3b24:	5f                   	pop    %edi
    3b25:	5d                   	pop    %ebp
    3b26:	c3                   	ret    
    3b27:	89 f6                	mov    %esi,%esi
    3b29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003b30 <strchr>:

char*
strchr(const char *s, char c)
{
    3b30:	55                   	push   %ebp
    3b31:	89 e5                	mov    %esp,%ebp
    3b33:	8b 45 08             	mov    0x8(%ebp),%eax
    3b36:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    3b3a:	0f b6 10             	movzbl (%eax),%edx
    3b3d:	84 d2                	test   %dl,%dl
    3b3f:	75 12                	jne    3b53 <strchr+0x23>
    3b41:	eb 1d                	jmp    3b60 <strchr+0x30>
    3b43:	90                   	nop
    3b44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3b48:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    3b4c:	84 d2                	test   %dl,%dl
    3b4e:	74 10                	je     3b60 <strchr+0x30>
    3b50:	83 c0 01             	add    $0x1,%eax
    if(*s == c)
    3b53:	38 ca                	cmp    %cl,%dl
    3b55:	75 f1                	jne    3b48 <strchr+0x18>
      return (char*)s;
  return 0;
}
    3b57:	5d                   	pop    %ebp
    3b58:	c3                   	ret    
    3b59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
    3b60:	31 c0                	xor    %eax,%eax
}
    3b62:	5d                   	pop    %ebp
    3b63:	c3                   	ret    
    3b64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3b6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00003b70 <gets>:

char*
gets(char *buf, int max)
{
    3b70:	55                   	push   %ebp
    3b71:	89 e5                	mov    %esp,%ebp
    3b73:	57                   	push   %edi
    3b74:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3b75:	31 f6                	xor    %esi,%esi
  return 0;
}

char*
gets(char *buf, int max)
{
    3b77:	53                   	push   %ebx
    3b78:	83 ec 2c             	sub    $0x2c,%esp
    3b7b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3b7e:	eb 31                	jmp    3bb1 <gets+0x41>
    cc = read(0, &c, 1);
    3b80:	8d 45 e7             	lea    -0x19(%ebp),%eax
    3b83:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3b8a:	00 
    3b8b:	89 44 24 04          	mov    %eax,0x4(%esp)
    3b8f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3b96:	e8 11 01 00 00       	call   3cac <read>
    if(cc < 1)
    3b9b:	85 c0                	test   %eax,%eax
    3b9d:	7e 1a                	jle    3bb9 <gets+0x49>
      break;
    buf[i++] = c;
    3b9f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3ba3:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
    3ba5:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    3ba7:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
    3bab:	74 0c                	je     3bb9 <gets+0x49>
    3bad:	3c 0a                	cmp    $0xa,%al
    3baf:	74 08                	je     3bb9 <gets+0x49>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3bb1:	8d 5e 01             	lea    0x1(%esi),%ebx
    3bb4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    3bb7:	7c c7                	jl     3b80 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3bb9:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
    3bbd:	83 c4 2c             	add    $0x2c,%esp
    3bc0:	89 f8                	mov    %edi,%eax
    3bc2:	5b                   	pop    %ebx
    3bc3:	5e                   	pop    %esi
    3bc4:	5f                   	pop    %edi
    3bc5:	5d                   	pop    %ebp
    3bc6:	c3                   	ret    
    3bc7:	89 f6                	mov    %esi,%esi
    3bc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003bd0 <stat>:

int
stat(const char *n, struct stat *st)
{
    3bd0:	55                   	push   %ebp
    3bd1:	89 e5                	mov    %esp,%ebp
    3bd3:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3bd6:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(const char *n, struct stat *st)
{
    3bd9:	89 5d f8             	mov    %ebx,-0x8(%ebp)
    3bdc:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    3bdf:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3be4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3beb:	00 
    3bec:	89 04 24             	mov    %eax,(%esp)
    3bef:	e8 e0 00 00 00       	call   3cd4 <open>
  if(fd < 0)
    3bf4:	85 c0                	test   %eax,%eax
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3bf6:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
    3bf8:	78 19                	js     3c13 <stat+0x43>
    return -1;
  r = fstat(fd, st);
    3bfa:	8b 45 0c             	mov    0xc(%ebp),%eax
    3bfd:	89 1c 24             	mov    %ebx,(%esp)
    3c00:	89 44 24 04          	mov    %eax,0x4(%esp)
    3c04:	e8 e3 00 00 00       	call   3cec <fstat>
  close(fd);
    3c09:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
    3c0c:	89 c6                	mov    %eax,%esi
  close(fd);
    3c0e:	e8 a9 00 00 00       	call   3cbc <close>
  return r;
}
    3c13:	89 f0                	mov    %esi,%eax
    3c15:	8b 5d f8             	mov    -0x8(%ebp),%ebx
    3c18:	8b 75 fc             	mov    -0x4(%ebp),%esi
    3c1b:	89 ec                	mov    %ebp,%esp
    3c1d:	5d                   	pop    %ebp
    3c1e:	c3                   	ret    
    3c1f:	90                   	nop

00003c20 <atoi>:

int
atoi(const char *s)
{
    3c20:	55                   	push   %ebp
  int n;

  n = 0;
    3c21:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
    3c23:	89 e5                	mov    %esp,%ebp
    3c25:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3c28:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3c29:	0f b6 11             	movzbl (%ecx),%edx
    3c2c:	8d 5a d0             	lea    -0x30(%edx),%ebx
    3c2f:	80 fb 09             	cmp    $0x9,%bl
    3c32:	77 1c                	ja     3c50 <atoi+0x30>
    3c34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
    3c38:	0f be d2             	movsbl %dl,%edx
    3c3b:	83 c1 01             	add    $0x1,%ecx
    3c3e:	8d 04 80             	lea    (%eax,%eax,4),%eax
    3c41:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3c45:	0f b6 11             	movzbl (%ecx),%edx
    3c48:	8d 5a d0             	lea    -0x30(%edx),%ebx
    3c4b:	80 fb 09             	cmp    $0x9,%bl
    3c4e:	76 e8                	jbe    3c38 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
    3c50:	5b                   	pop    %ebx
    3c51:	5d                   	pop    %ebp
    3c52:	c3                   	ret    
    3c53:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3c59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003c60 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    3c60:	55                   	push   %ebp
    3c61:	89 e5                	mov    %esp,%ebp
    3c63:	56                   	push   %esi
    3c64:	8b 45 08             	mov    0x8(%ebp),%eax
    3c67:	53                   	push   %ebx
    3c68:	8b 5d 10             	mov    0x10(%ebp),%ebx
    3c6b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    3c6e:	85 db                	test   %ebx,%ebx
    3c70:	7e 14                	jle    3c86 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, const void *vsrc, int n)
    3c72:	31 d2                	xor    %edx,%edx
    3c74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
    3c78:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    3c7c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    3c7f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    3c82:	39 da                	cmp    %ebx,%edx
    3c84:	75 f2                	jne    3c78 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    3c86:	5b                   	pop    %ebx
    3c87:	5e                   	pop    %esi
    3c88:	5d                   	pop    %ebp
    3c89:	c3                   	ret    
    3c8a:	90                   	nop
    3c8b:	90                   	nop

00003c8c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    3c8c:	b8 01 00 00 00       	mov    $0x1,%eax
    3c91:	cd 40                	int    $0x40
    3c93:	c3                   	ret    

00003c94 <exit>:
SYSCALL(exit)
    3c94:	b8 02 00 00 00       	mov    $0x2,%eax
    3c99:	cd 40                	int    $0x40
    3c9b:	c3                   	ret    

00003c9c <wait>:
SYSCALL(wait)
    3c9c:	b8 03 00 00 00       	mov    $0x3,%eax
    3ca1:	cd 40                	int    $0x40
    3ca3:	c3                   	ret    

00003ca4 <pipe>:
SYSCALL(pipe)
    3ca4:	b8 04 00 00 00       	mov    $0x4,%eax
    3ca9:	cd 40                	int    $0x40
    3cab:	c3                   	ret    

00003cac <read>:
SYSCALL(read)
    3cac:	b8 05 00 00 00       	mov    $0x5,%eax
    3cb1:	cd 40                	int    $0x40
    3cb3:	c3                   	ret    

00003cb4 <write>:
SYSCALL(write)
    3cb4:	b8 10 00 00 00       	mov    $0x10,%eax
    3cb9:	cd 40                	int    $0x40
    3cbb:	c3                   	ret    

00003cbc <close>:
SYSCALL(close)
    3cbc:	b8 15 00 00 00       	mov    $0x15,%eax
    3cc1:	cd 40                	int    $0x40
    3cc3:	c3                   	ret    

00003cc4 <kill>:
SYSCALL(kill)
    3cc4:	b8 06 00 00 00       	mov    $0x6,%eax
    3cc9:	cd 40                	int    $0x40
    3ccb:	c3                   	ret    

00003ccc <exec>:
SYSCALL(exec)
    3ccc:	b8 07 00 00 00       	mov    $0x7,%eax
    3cd1:	cd 40                	int    $0x40
    3cd3:	c3                   	ret    

00003cd4 <open>:
SYSCALL(open)
    3cd4:	b8 0f 00 00 00       	mov    $0xf,%eax
    3cd9:	cd 40                	int    $0x40
    3cdb:	c3                   	ret    

00003cdc <mknod>:
SYSCALL(mknod)
    3cdc:	b8 11 00 00 00       	mov    $0x11,%eax
    3ce1:	cd 40                	int    $0x40
    3ce3:	c3                   	ret    

00003ce4 <unlink>:
SYSCALL(unlink)
    3ce4:	b8 12 00 00 00       	mov    $0x12,%eax
    3ce9:	cd 40                	int    $0x40
    3ceb:	c3                   	ret    

00003cec <fstat>:
SYSCALL(fstat)
    3cec:	b8 08 00 00 00       	mov    $0x8,%eax
    3cf1:	cd 40                	int    $0x40
    3cf3:	c3                   	ret    

00003cf4 <link>:
SYSCALL(link)
    3cf4:	b8 13 00 00 00       	mov    $0x13,%eax
    3cf9:	cd 40                	int    $0x40
    3cfb:	c3                   	ret    

00003cfc <mkdir>:
SYSCALL(mkdir)
    3cfc:	b8 14 00 00 00       	mov    $0x14,%eax
    3d01:	cd 40                	int    $0x40
    3d03:	c3                   	ret    

00003d04 <chdir>:
SYSCALL(chdir)
    3d04:	b8 09 00 00 00       	mov    $0x9,%eax
    3d09:	cd 40                	int    $0x40
    3d0b:	c3                   	ret    

00003d0c <dup>:
SYSCALL(dup)
    3d0c:	b8 0a 00 00 00       	mov    $0xa,%eax
    3d11:	cd 40                	int    $0x40
    3d13:	c3                   	ret    

00003d14 <getpid>:
SYSCALL(getpid)
    3d14:	b8 0b 00 00 00       	mov    $0xb,%eax
    3d19:	cd 40                	int    $0x40
    3d1b:	c3                   	ret    

00003d1c <sbrk>:
SYSCALL(sbrk)
    3d1c:	b8 0c 00 00 00       	mov    $0xc,%eax
    3d21:	cd 40                	int    $0x40
    3d23:	c3                   	ret    

00003d24 <sleep>:
SYSCALL(sleep)
    3d24:	b8 0d 00 00 00       	mov    $0xd,%eax
    3d29:	cd 40                	int    $0x40
    3d2b:	c3                   	ret    

00003d2c <uptime>:
SYSCALL(uptime)
    3d2c:	b8 0e 00 00 00       	mov    $0xe,%eax
    3d31:	cd 40                	int    $0x40
    3d33:	c3                   	ret    
    3d34:	90                   	nop
    3d35:	90                   	nop
    3d36:	90                   	nop
    3d37:	90                   	nop
    3d38:	90                   	nop
    3d39:	90                   	nop
    3d3a:	90                   	nop
    3d3b:	90                   	nop
    3d3c:	90                   	nop
    3d3d:	90                   	nop
    3d3e:	90                   	nop
    3d3f:	90                   	nop

00003d40 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    3d40:	55                   	push   %ebp
    3d41:	89 e5                	mov    %esp,%ebp
    3d43:	83 ec 28             	sub    $0x28,%esp
    3d46:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
    3d49:	8d 55 f4             	lea    -0xc(%ebp),%edx
    3d4c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3d53:	00 
    3d54:	89 54 24 04          	mov    %edx,0x4(%esp)
    3d58:	89 04 24             	mov    %eax,(%esp)
    3d5b:	e8 54 ff ff ff       	call   3cb4 <write>
}
    3d60:	c9                   	leave  
    3d61:	c3                   	ret    
    3d62:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3d69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003d70 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    3d70:	55                   	push   %ebp
    3d71:	89 e5                	mov    %esp,%ebp
    3d73:	57                   	push   %edi
    3d74:	56                   	push   %esi
    3d75:	89 c6                	mov    %eax,%esi
    3d77:	53                   	push   %ebx
    3d78:	83 ec 1c             	sub    $0x1c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    3d7b:	8b 45 08             	mov    0x8(%ebp),%eax
    3d7e:	85 c0                	test   %eax,%eax
    3d80:	74 5e                	je     3de0 <printint+0x70>
    3d82:	89 d0                	mov    %edx,%eax
    3d84:	c1 e8 1f             	shr    $0x1f,%eax
    3d87:	84 c0                	test   %al,%al
    3d89:	74 55                	je     3de0 <printint+0x70>
    neg = 1;
    x = -xx;
    3d8b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    3d8d:	bf 01 00 00 00       	mov    $0x1,%edi
    x = -xx;
    3d92:	f7 d8                	neg    %eax
  } else {
    x = xx;
  }

  i = 0;
    3d94:	31 db                	xor    %ebx,%ebx
    3d96:	eb 02                	jmp    3d9a <printint+0x2a>
  do{
    buf[i++] = digits[x % base];
    3d98:	89 d3                	mov    %edx,%ebx
    3d9a:	31 d2                	xor    %edx,%edx
    3d9c:	f7 f1                	div    %ecx
    3d9e:	0f b6 92 6f 58 00 00 	movzbl 0x586f(%edx),%edx
  }while((x /= base) != 0);
    3da5:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    3da7:	88 54 1d d8          	mov    %dl,-0x28(%ebp,%ebx,1)
    3dab:	8d 53 01             	lea    0x1(%ebx),%edx
  }while((x /= base) != 0);
    3dae:	75 e8                	jne    3d98 <printint+0x28>
  if(neg)
    3db0:	85 ff                	test   %edi,%edi
    3db2:	74 08                	je     3dbc <printint+0x4c>
    buf[i++] = '-';
    3db4:	c6 44 15 d8 2d       	movb   $0x2d,-0x28(%ebp,%edx,1)
    3db9:	8d 53 02             	lea    0x2(%ebx),%edx

  while(--i >= 0)
    3dbc:	8d 5a ff             	lea    -0x1(%edx),%ebx
    3dbf:	90                   	nop
    putc(fd, buf[i]);
    3dc0:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
    3dc5:	89 f0                	mov    %esi,%eax
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    3dc7:	83 eb 01             	sub    $0x1,%ebx
    putc(fd, buf[i]);
    3dca:	e8 71 ff ff ff       	call   3d40 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    3dcf:	83 fb ff             	cmp    $0xffffffff,%ebx
    3dd2:	75 ec                	jne    3dc0 <printint+0x50>
    putc(fd, buf[i]);
}
    3dd4:	83 c4 1c             	add    $0x1c,%esp
    3dd7:	5b                   	pop    %ebx
    3dd8:	5e                   	pop    %esi
    3dd9:	5f                   	pop    %edi
    3dda:	5d                   	pop    %ebp
    3ddb:	c3                   	ret    
    3ddc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    3de0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    3de2:	31 ff                	xor    %edi,%edi
    3de4:	eb ae                	jmp    3d94 <printint+0x24>
    3de6:	8d 76 00             	lea    0x0(%esi),%esi
    3de9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003df0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    3df0:	55                   	push   %ebp
    3df1:	89 e5                	mov    %esp,%ebp
    3df3:	57                   	push   %edi
    3df4:	56                   	push   %esi
    3df5:	53                   	push   %ebx
    3df6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3df9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    3dfc:	0f b6 0b             	movzbl (%ebx),%ecx
    3dff:	84 c9                	test   %cl,%cl
    3e01:	0f 84 89 00 00 00    	je     3e90 <printf+0xa0>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
    3e07:	8d 45 10             	lea    0x10(%ebp),%eax
{
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    3e0a:	31 f6                	xor    %esi,%esi
  ap = (uint*)(void*)&fmt + 1;
    3e0c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    3e0f:	eb 21                	jmp    3e32 <printf+0x42>
    3e11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    3e18:	83 f9 25             	cmp    $0x25,%ecx
    3e1b:	74 7b                	je     3e98 <printf+0xa8>
        state = '%';
      } else {
        putc(fd, c);
    3e1d:	8b 45 08             	mov    0x8(%ebp),%eax
    3e20:	0f be d1             	movsbl %cl,%edx
    3e23:	e8 18 ff ff ff       	call   3d40 <putc>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    3e28:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3e2b:	0f b6 0b             	movzbl (%ebx),%ecx
    3e2e:	84 c9                	test   %cl,%cl
    3e30:	74 5e                	je     3e90 <printf+0xa0>
    c = fmt[i] & 0xff;
    if(state == 0){
    3e32:	85 f6                	test   %esi,%esi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    3e34:	0f b6 c9             	movzbl %cl,%ecx
    if(state == 0){
    3e37:	74 df                	je     3e18 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    3e39:	83 fe 25             	cmp    $0x25,%esi
    3e3c:	75 ea                	jne    3e28 <printf+0x38>
      if(c == 'd'){
    3e3e:	83 f9 64             	cmp    $0x64,%ecx
    3e41:	0f 84 c9 00 00 00    	je     3f10 <printf+0x120>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    3e47:	83 f9 70             	cmp    $0x70,%ecx
    3e4a:	74 54                	je     3ea0 <printf+0xb0>
    3e4c:	83 f9 78             	cmp    $0x78,%ecx
    3e4f:	90                   	nop
    3e50:	74 4e                	je     3ea0 <printf+0xb0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    3e52:	83 f9 73             	cmp    $0x73,%ecx
    3e55:	74 71                	je     3ec8 <printf+0xd8>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    3e57:	83 f9 63             	cmp    $0x63,%ecx
    3e5a:	0f 84 d2 00 00 00    	je     3f32 <printf+0x142>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    3e60:	83 f9 25             	cmp    $0x25,%ecx
        putc(fd, c);
    3e63:	ba 25 00 00 00       	mov    $0x25,%edx
    3e68:	8b 45 08             	mov    0x8(%ebp),%eax
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    3e6b:	74 11                	je     3e7e <printf+0x8e>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    3e6d:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    3e70:	e8 cb fe ff ff       	call   3d40 <putc>
        putc(fd, c);
    3e75:	8b 4d e0             	mov    -0x20(%ebp),%ecx
    3e78:	8b 45 08             	mov    0x8(%ebp),%eax
    3e7b:	0f be d1             	movsbl %cl,%edx
    3e7e:	83 c3 01             	add    $0x1,%ebx
      }
      state = 0;
    3e81:	31 f6                	xor    %esi,%esi
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    3e83:	e8 b8 fe ff ff       	call   3d40 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3e88:	0f b6 0b             	movzbl (%ebx),%ecx
    3e8b:	84 c9                	test   %cl,%cl
    3e8d:	75 a3                	jne    3e32 <printf+0x42>
    3e8f:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    3e90:	83 c4 2c             	add    $0x2c,%esp
    3e93:	5b                   	pop    %ebx
    3e94:	5e                   	pop    %esi
    3e95:	5f                   	pop    %edi
    3e96:	5d                   	pop    %ebp
    3e97:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    3e98:	be 25 00 00 00       	mov    $0x25,%esi
    3e9d:	eb 89                	jmp    3e28 <printf+0x38>
    3e9f:	90                   	nop
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    3ea0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3ea3:	b9 10 00 00 00       	mov    $0x10,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3ea8:	31 f6                	xor    %esi,%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    3eaa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3eb1:	8b 10                	mov    (%eax),%edx
    3eb3:	8b 45 08             	mov    0x8(%ebp),%eax
    3eb6:	e8 b5 fe ff ff       	call   3d70 <printint>
        ap++;
    3ebb:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
    3ebf:	e9 64 ff ff ff       	jmp    3e28 <printf+0x38>
    3ec4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    3ec8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3ecb:	8b 38                	mov    (%eax),%edi
        ap++;
    3ecd:	83 c0 04             	add    $0x4,%eax
    3ed0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
          s = "(null)";
    3ed3:	b8 68 58 00 00       	mov    $0x5868,%eax
    3ed8:	85 ff                	test   %edi,%edi
    3eda:	0f 44 f8             	cmove  %eax,%edi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3edd:	31 f6                	xor    %esi,%esi
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    3edf:	0f b6 17             	movzbl (%edi),%edx
    3ee2:	84 d2                	test   %dl,%dl
    3ee4:	0f 84 3e ff ff ff    	je     3e28 <printf+0x38>
    3eea:	89 de                	mov    %ebx,%esi
    3eec:	8b 5d 08             	mov    0x8(%ebp),%ebx
    3eef:	90                   	nop
          putc(fd, *s);
    3ef0:	0f be d2             	movsbl %dl,%edx
          s++;
    3ef3:	83 c7 01             	add    $0x1,%edi
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
    3ef6:	89 d8                	mov    %ebx,%eax
    3ef8:	e8 43 fe ff ff       	call   3d40 <putc>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    3efd:	0f b6 17             	movzbl (%edi),%edx
    3f00:	84 d2                	test   %dl,%dl
    3f02:	75 ec                	jne    3ef0 <printf+0x100>
    3f04:	89 f3                	mov    %esi,%ebx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3f06:	31 f6                	xor    %esi,%esi
    3f08:	e9 1b ff ff ff       	jmp    3e28 <printf+0x38>
    3f0d:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    3f10:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3f13:	b1 0a                	mov    $0xa,%cl
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3f15:	66 31 f6             	xor    %si,%si
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    3f18:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3f1f:	8b 10                	mov    (%eax),%edx
    3f21:	8b 45 08             	mov    0x8(%ebp),%eax
    3f24:	e8 47 fe ff ff       	call   3d70 <printint>
        ap++;
    3f29:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
    3f2d:	e9 f6 fe ff ff       	jmp    3e28 <printf+0x38>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
    3f32:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3f35:	31 f6                	xor    %esi,%esi
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
    3f37:	0f be 10             	movsbl (%eax),%edx
    3f3a:	8b 45 08             	mov    0x8(%ebp),%eax
    3f3d:	e8 fe fd ff ff       	call   3d40 <putc>
        ap++;
    3f42:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
    3f46:	e9 dd fe ff ff       	jmp    3e28 <printf+0x38>
    3f4b:	90                   	nop
    3f4c:	90                   	nop
    3f4d:	90                   	nop
    3f4e:	90                   	nop
    3f4f:	90                   	nop

00003f50 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    3f50:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3f51:	a1 20 62 00 00       	mov    0x6220,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    3f56:	89 e5                	mov    %esp,%ebp
    3f58:	57                   	push   %edi
    3f59:	56                   	push   %esi
    3f5a:	53                   	push   %ebx
    3f5b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
    3f5e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    3f61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3f68:	39 c8                	cmp    %ecx,%eax
    3f6a:	8b 10                	mov    (%eax),%edx
    3f6c:	73 04                	jae    3f72 <free+0x22>
    3f6e:	39 d1                	cmp    %edx,%ecx
    3f70:	72 16                	jb     3f88 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3f72:	39 d0                	cmp    %edx,%eax
    3f74:	72 0c                	jb     3f82 <free+0x32>
    3f76:	39 c8                	cmp    %ecx,%eax
    3f78:	72 0e                	jb     3f88 <free+0x38>
    3f7a:	39 d1                	cmp    %edx,%ecx
    3f7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3f80:	72 06                	jb     3f88 <free+0x38>
static Header base;
static Header *freep;

void
free(void *ap)
{
    3f82:	89 d0                	mov    %edx,%eax
    3f84:	eb e2                	jmp    3f68 <free+0x18>
    3f86:	66 90                	xchg   %ax,%ax

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    3f88:	8b 73 fc             	mov    -0x4(%ebx),%esi
    3f8b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    3f8e:	39 d7                	cmp    %edx,%edi
    3f90:	74 19                	je     3fab <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    3f92:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    3f95:	8b 50 04             	mov    0x4(%eax),%edx
    3f98:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3f9b:	39 f1                	cmp    %esi,%ecx
    3f9d:	74 23                	je     3fc2 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    3f9f:	89 08                	mov    %ecx,(%eax)
  freep = p;
    3fa1:	a3 20 62 00 00       	mov    %eax,0x6220
}
    3fa6:	5b                   	pop    %ebx
    3fa7:	5e                   	pop    %esi
    3fa8:	5f                   	pop    %edi
    3fa9:	5d                   	pop    %ebp
    3faa:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    3fab:	03 72 04             	add    0x4(%edx),%esi
    3fae:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    3fb1:	8b 10                	mov    (%eax),%edx
    3fb3:	8b 12                	mov    (%edx),%edx
    3fb5:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    3fb8:	8b 50 04             	mov    0x4(%eax),%edx
    3fbb:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3fbe:	39 f1                	cmp    %esi,%ecx
    3fc0:	75 dd                	jne    3f9f <free+0x4f>
    p->s.size += bp->s.size;
    3fc2:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    3fc5:	a3 20 62 00 00       	mov    %eax,0x6220
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    3fca:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    3fcd:	8b 53 f8             	mov    -0x8(%ebx),%edx
    3fd0:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    3fd2:	5b                   	pop    %ebx
    3fd3:	5e                   	pop    %esi
    3fd4:	5f                   	pop    %edi
    3fd5:	5d                   	pop    %ebp
    3fd6:	c3                   	ret    
    3fd7:	89 f6                	mov    %esi,%esi
    3fd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003fe0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    3fe0:	55                   	push   %ebp
    3fe1:	89 e5                	mov    %esp,%ebp
    3fe3:	57                   	push   %edi
    3fe4:	56                   	push   %esi
    3fe5:	53                   	push   %ebx
    3fe6:	83 ec 2c             	sub    $0x2c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3fe9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
    3fec:	8b 15 20 62 00 00    	mov    0x6220,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3ff2:	83 c3 07             	add    $0x7,%ebx
    3ff5:	c1 eb 03             	shr    $0x3,%ebx
    3ff8:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
    3ffb:	85 d2                	test   %edx,%edx
    3ffd:	0f 84 a3 00 00 00    	je     40a6 <malloc+0xc6>
    4003:	8b 02                	mov    (%edx),%eax
    4005:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    4008:	39 d9                	cmp    %ebx,%ecx
    400a:	73 74                	jae    4080 <malloc+0xa0>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    400c:	8d 14 dd 00 00 00 00 	lea    0x0(,%ebx,8),%edx
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
    4013:	bf 00 80 00 00       	mov    $0x8000,%edi
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    4018:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    401b:	eb 0c                	jmp    4029 <malloc+0x49>
    401d:	8d 76 00             	lea    0x0(%esi),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4020:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    4022:	8b 48 04             	mov    0x4(%eax),%ecx
    4025:	39 cb                	cmp    %ecx,%ebx
    4027:	76 57                	jbe    4080 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    4029:	3b 05 20 62 00 00    	cmp    0x6220,%eax
    402f:	89 c2                	mov    %eax,%edx
    4031:	75 ed                	jne    4020 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
    4033:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4036:	81 fb 00 10 00 00    	cmp    $0x1000,%ebx
    403c:	be 00 10 00 00       	mov    $0x1000,%esi
    4041:	0f 43 f3             	cmovae %ebx,%esi
    4044:	0f 42 c7             	cmovb  %edi,%eax
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    4047:	89 04 24             	mov    %eax,(%esp)
    404a:	e8 cd fc ff ff       	call   3d1c <sbrk>
  if(p == (char*)-1)
    404f:	83 f8 ff             	cmp    $0xffffffff,%eax
    4052:	74 1c                	je     4070 <malloc+0x90>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    4054:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    4057:	83 c0 08             	add    $0x8,%eax
    405a:	89 04 24             	mov    %eax,(%esp)
    405d:	e8 ee fe ff ff       	call   3f50 <free>
  return freep;
    4062:	8b 15 20 62 00 00    	mov    0x6220,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    4068:	85 d2                	test   %edx,%edx
    406a:	75 b4                	jne    4020 <malloc+0x40>
    406c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return 0;
  }
}
    4070:	83 c4 2c             	add    $0x2c,%esp
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
    4073:	31 c0                	xor    %eax,%eax
  }
}
    4075:	5b                   	pop    %ebx
    4076:	5e                   	pop    %esi
    4077:	5f                   	pop    %edi
    4078:	5d                   	pop    %ebp
    4079:	c3                   	ret    
    407a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    4080:	39 cb                	cmp    %ecx,%ebx
    4082:	74 1c                	je     40a0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    4084:	29 d9                	sub    %ebx,%ecx
    4086:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    4089:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    408c:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
    408f:	89 15 20 62 00 00    	mov    %edx,0x6220
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    4095:	83 c4 2c             	add    $0x2c,%esp
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    4098:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    409b:	5b                   	pop    %ebx
    409c:	5e                   	pop    %esi
    409d:	5f                   	pop    %edi
    409e:	5d                   	pop    %ebp
    409f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    40a0:	8b 08                	mov    (%eax),%ecx
    40a2:	89 0a                	mov    %ecx,(%edx)
    40a4:	eb e9                	jmp    408f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    40a6:	c7 05 20 62 00 00 24 	movl   $0x6224,0x6220
    40ad:	62 00 00 
    base.s.size = 0;
    40b0:	b8 24 62 00 00       	mov    $0x6224,%eax
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    40b5:	c7 05 24 62 00 00 24 	movl   $0x6224,0x6224
    40bc:	62 00 00 
    base.s.size = 0;
    40bf:	c7 05 28 62 00 00 00 	movl   $0x0,0x6228
    40c6:	00 00 00 
    40c9:	e9 3e ff ff ff       	jmp    400c <malloc+0x2c>
