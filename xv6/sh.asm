
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return 0;
}

int
main(void)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 e4 f0             	and    $0xfffffff0,%esp
       6:	83 ec 10             	sub    $0x10,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
       9:	eb 0e                	jmp    19 <main+0x19>
       b:	90                   	nop
       c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(fd >= 3){
      10:	83 f8 02             	cmp    $0x2,%eax
      13:	0f 8f cd 00 00 00    	jg     e6 <main+0xe6>
{
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      19:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
      20:	00 
      21:	c7 04 24 11 13 00 00 	movl   $0x1311,(%esp)
      28:	e8 47 0e 00 00       	call   e74 <open>
      2d:	85 c0                	test   %eax,%eax
      2f:	79 df                	jns    10 <main+0x10>
      31:	eb 23                	jmp    56 <main+0x56>
      33:	90                   	nop
      34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      38:	80 3d 62 19 00 00 20 	cmpb   $0x20,0x1962
      3f:	90                   	nop
      40:	74 60                	je     a2 <main+0xa2>
      42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if(fork1() == 0)
      48:	e8 43 01 00 00       	call   190 <fork1>
      4d:	85 c0                	test   %eax,%eax
      4f:	74 38                	je     89 <main+0x89>
      runcmd(parsecmd(buf));
    wait();
      51:	e8 e6 0d 00 00       	call   e3c <wait>
      break;
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
      56:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
      5d:	00 
      5e:	c7 04 24 60 19 00 00 	movl   $0x1960,(%esp)
      65:	e8 96 00 00 00       	call   100 <getcmd>
      6a:	85 c0                	test   %eax,%eax
      6c:	78 2f                	js     9d <main+0x9d>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      6e:	80 3d 60 19 00 00 63 	cmpb   $0x63,0x1960
      75:	75 d1                	jne    48 <main+0x48>
      77:	80 3d 61 19 00 00 64 	cmpb   $0x64,0x1961
      7e:	74 b8                	je     38 <main+0x38>
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if(fork1() == 0)
      80:	e8 0b 01 00 00       	call   190 <fork1>
      85:	85 c0                	test   %eax,%eax
      87:	75 c8                	jne    51 <main+0x51>
      runcmd(parsecmd(buf));
      89:	c7 04 24 60 19 00 00 	movl   $0x1960,(%esp)
      90:	e8 eb 0a 00 00       	call   b80 <parsecmd>
      95:	89 04 24             	mov    %eax,(%esp)
      98:	e8 13 01 00 00       	call   1b0 <runcmd>
    wait();
  }
  exit();
      9d:	e8 92 0d 00 00       	call   e34 <exit>

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      a2:	c7 04 24 60 19 00 00 	movl   $0x1960,(%esp)
      a9:	e8 e2 0b 00 00       	call   c90 <strlen>
      if(chdir(buf+3) < 0)
      ae:	c7 04 24 63 19 00 00 	movl   $0x1963,(%esp)

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      b5:	c6 80 5f 19 00 00 00 	movb   $0x0,0x195f(%eax)
      if(chdir(buf+3) < 0)
      bc:	e8 e3 0d 00 00       	call   ea4 <chdir>
      c1:	85 c0                	test   %eax,%eax
      c3:	79 91                	jns    56 <main+0x56>
        printf(2, "cannot cd %s\n", buf+3);
      c5:	c7 44 24 08 63 19 00 	movl   $0x1963,0x8(%esp)
      cc:	00 
      cd:	c7 44 24 04 19 13 00 	movl   $0x1319,0x4(%esp)
      d4:	00 
      d5:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
      dc:	e8 af 0e 00 00       	call   f90 <printf>
      e1:	e9 70 ff ff ff       	jmp    56 <main+0x56>
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
    if(fd >= 3){
      close(fd);
      e6:	89 04 24             	mov    %eax,(%esp)
      e9:	e8 6e 0d 00 00       	call   e5c <close>
      ee:	66 90                	xchg   %ax,%ax
      break;
      f0:	e9 61 ff ff ff       	jmp    56 <main+0x56>
      f5:	90                   	nop
      f6:	90                   	nop
      f7:	90                   	nop
      f8:	90                   	nop
      f9:	90                   	nop
      fa:	90                   	nop
      fb:	90                   	nop
      fc:	90                   	nop
      fd:	90                   	nop
      fe:	90                   	nop
      ff:	90                   	nop

00000100 <getcmd>:
  exit();
}

int
getcmd(char *buf, int nbuf)
{
     100:	55                   	push   %ebp
     101:	89 e5                	mov    %esp,%ebp
     103:	83 ec 18             	sub    $0x18,%esp
     106:	89 5d f8             	mov    %ebx,-0x8(%ebp)
     109:	8b 5d 08             	mov    0x8(%ebp),%ebx
     10c:	89 75 fc             	mov    %esi,-0x4(%ebp)
     10f:	8b 75 0c             	mov    0xc(%ebp),%esi
  printf(2, "$ ");
     112:	c7 44 24 04 70 12 00 	movl   $0x1270,0x4(%esp)
     119:	00 
     11a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     121:	e8 6a 0e 00 00       	call   f90 <printf>
  memset(buf, 0, nbuf);
     126:	89 74 24 08          	mov    %esi,0x8(%esp)
     12a:	89 1c 24             	mov    %ebx,(%esp)
     12d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     134:	00 
     135:	e8 76 0b 00 00       	call   cb0 <memset>
  gets(buf, nbuf);
     13a:	89 74 24 04          	mov    %esi,0x4(%esp)
     13e:	89 1c 24             	mov    %ebx,(%esp)
     141:	e8 ca 0b 00 00       	call   d10 <gets>
  if(buf[0] == 0) // EOF
    return -1;
  return 0;
}
     146:	8b 75 fc             	mov    -0x4(%ebp),%esi
{
  printf(2, "$ ");
  memset(buf, 0, nbuf);
  gets(buf, nbuf);
  if(buf[0] == 0) // EOF
    return -1;
     149:	80 3b 01             	cmpb   $0x1,(%ebx)
  return 0;
}
     14c:	8b 5d f8             	mov    -0x8(%ebp),%ebx
{
  printf(2, "$ ");
  memset(buf, 0, nbuf);
  gets(buf, nbuf);
  if(buf[0] == 0) // EOF
    return -1;
     14f:	19 c0                	sbb    %eax,%eax
  return 0;
}
     151:	89 ec                	mov    %ebp,%esp
     153:	5d                   	pop    %ebp
     154:	c3                   	ret    
     155:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000160 <panic>:
  exit();
}

void
panic(char *s)
{
     160:	55                   	push   %ebp
     161:	89 e5                	mov    %esp,%ebp
     163:	83 ec 18             	sub    $0x18,%esp
  printf(2, "%s\n", s);
     166:	8b 45 08             	mov    0x8(%ebp),%eax
     169:	c7 44 24 04 0d 13 00 	movl   $0x130d,0x4(%esp)
     170:	00 
     171:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     178:	89 44 24 08          	mov    %eax,0x8(%esp)
     17c:	e8 0f 0e 00 00       	call   f90 <printf>
  exit();
     181:	e8 ae 0c 00 00       	call   e34 <exit>
     186:	8d 76 00             	lea    0x0(%esi),%esi
     189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000190 <fork1>:
}

int
fork1(void)
{
     190:	55                   	push   %ebp
     191:	89 e5                	mov    %esp,%ebp
     193:	83 ec 18             	sub    $0x18,%esp
  int pid;

  pid = fork();
     196:	e8 91 0c 00 00       	call   e2c <fork>
  if(pid == -1)
     19b:	83 f8 ff             	cmp    $0xffffffff,%eax
     19e:	74 02                	je     1a2 <fork1+0x12>
    panic("fork");
  return pid;
}
     1a0:	c9                   	leave  
     1a1:	c3                   	ret    
{
  int pid;

  pid = fork();
  if(pid == -1)
    panic("fork");
     1a2:	c7 04 24 73 12 00 00 	movl   $0x1273,(%esp)
     1a9:	e8 b2 ff ff ff       	call   160 <panic>
     1ae:	66 90                	xchg   %ax,%ax

000001b0 <runcmd>:
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
     1b0:	55                   	push   %ebp
     1b1:	89 e5                	mov    %esp,%ebp
     1b3:	53                   	push   %ebx
     1b4:	83 ec 24             	sub    $0x24,%esp
     1b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     1ba:	85 db                	test   %ebx,%ebx
     1bc:	74 5f                	je     21d <runcmd+0x6d>
    exit();

  switch(cmd->type){
     1be:	83 3b 05             	cmpl   $0x5,(%ebx)
     1c1:	76 62                	jbe    225 <runcmd+0x75>
  default:
    panic("runcmd");
     1c3:	c7 04 24 78 12 00 00 	movl   $0x1278,(%esp)
     1ca:	e8 91 ff ff ff       	call   160 <panic>
    runcmd(lcmd->right);
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
     1cf:	8d 45 f0             	lea    -0x10(%ebp),%eax
     1d2:	89 04 24             	mov    %eax,(%esp)
     1d5:	e8 6a 0c 00 00       	call   e44 <pipe>
     1da:	85 c0                	test   %eax,%eax
     1dc:	0f 88 f9 00 00 00    	js     2db <runcmd+0x12b>
      panic("pipe");
    if(fork1() == 0){
     1e2:	e8 a9 ff ff ff       	call   190 <fork1>
     1e7:	85 c0                	test   %eax,%eax
     1e9:	0f 84 30 01 00 00    	je     31f <runcmd+0x16f>
     1ef:	90                   	nop
      dup(p[1]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->left);
    }
    if(fork1() == 0){
     1f0:	e8 9b ff ff ff       	call   190 <fork1>
     1f5:	85 c0                	test   %eax,%eax
     1f7:	0f 84 ea 00 00 00    	je     2e7 <runcmd+0x137>
      dup(p[0]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->right);
    }
    close(p[0]);
     1fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
     200:	89 04 24             	mov    %eax,(%esp)
     203:	e8 54 0c 00 00       	call   e5c <close>
    close(p[1]);
     208:	8b 45 f4             	mov    -0xc(%ebp),%eax
     20b:	89 04 24             	mov    %eax,(%esp)
     20e:	e8 49 0c 00 00       	call   e5c <close>
    wait();
     213:	e8 24 0c 00 00       	call   e3c <wait>
    wait();
     218:	e8 1f 0c 00 00       	call   e3c <wait>
     21d:	8d 76 00             	lea    0x0(%esi),%esi
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
      runcmd(bcmd->cmd);
    break;
  }
  exit();
     220:	e8 0f 0c 00 00       	call   e34 <exit>
  struct redircmd *rcmd;

  if(cmd == 0)
    exit();

  switch(cmd->type){
     225:	8b 03                	mov    (%ebx),%eax
     227:	ff 24 85 28 13 00 00 	jmp    *0x1328(,%eax,4)
     22e:	66 90                	xchg   %ax,%ax
    wait();
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
     230:	e8 5b ff ff ff       	call   190 <fork1>
     235:	85 c0                	test   %eax,%eax
     237:	75 e4                	jne    21d <runcmd+0x6d>
     239:	eb 3f                	jmp    27a <runcmd+0xca>
     23b:	90                   	nop
     23c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    runcmd(rcmd->cmd);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    if(fork1() == 0)
     240:	e8 4b ff ff ff       	call   190 <fork1>
     245:	85 c0                	test   %eax,%eax
     247:	74 31                	je     27a <runcmd+0xca>
      runcmd(lcmd->left);
    wait();
     249:	e8 ee 0b 00 00       	call   e3c <wait>
    runcmd(lcmd->right);
     24e:	8b 43 08             	mov    0x8(%ebx),%eax
     251:	89 04 24             	mov    %eax,(%esp)
     254:	e8 57 ff ff ff       	call   1b0 <runcmd>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
     259:	8b 43 14             	mov    0x14(%ebx),%eax
     25c:	89 04 24             	mov    %eax,(%esp)
     25f:	e8 f8 0b 00 00       	call   e5c <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     264:	8b 43 10             	mov    0x10(%ebx),%eax
     267:	89 44 24 04          	mov    %eax,0x4(%esp)
     26b:	8b 43 08             	mov    0x8(%ebx),%eax
     26e:	89 04 24             	mov    %eax,(%esp)
     271:	e8 fe 0b 00 00       	call   e74 <open>
     276:	85 c0                	test   %eax,%eax
     278:	78 41                	js     2bb <runcmd+0x10b>
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
      runcmd(bcmd->cmd);
     27a:	8b 43 04             	mov    0x4(%ebx),%eax
     27d:	89 04 24             	mov    %eax,(%esp)
     280:	e8 2b ff ff ff       	call   1b0 <runcmd>
  default:
    panic("runcmd");

  case EXEC:
    ecmd = (struct execcmd*)cmd;
    if(ecmd->argv[0] == 0)
     285:	8b 43 04             	mov    0x4(%ebx),%eax
     288:	85 c0                	test   %eax,%eax
     28a:	74 91                	je     21d <runcmd+0x6d>
      exit();
    exec(ecmd->argv[0], ecmd->argv);
     28c:	8d 53 04             	lea    0x4(%ebx),%edx
     28f:	89 54 24 04          	mov    %edx,0x4(%esp)
     293:	89 04 24             	mov    %eax,(%esp)
     296:	e8 d1 0b 00 00       	call   e6c <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     29b:	8b 43 04             	mov    0x4(%ebx),%eax
     29e:	c7 44 24 04 7f 12 00 	movl   $0x127f,0x4(%esp)
     2a5:	00 
     2a6:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     2ad:	89 44 24 08          	mov    %eax,0x8(%esp)
     2b1:	e8 da 0c 00 00       	call   f90 <printf>
    break;
     2b6:	e9 62 ff ff ff       	jmp    21d <runcmd+0x6d>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
    if(open(rcmd->file, rcmd->mode) < 0){
      printf(2, "open %s failed\n", rcmd->file);
     2bb:	8b 43 08             	mov    0x8(%ebx),%eax
     2be:	c7 44 24 04 8f 12 00 	movl   $0x128f,0x4(%esp)
     2c5:	00 
     2c6:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     2cd:	89 44 24 08          	mov    %eax,0x8(%esp)
     2d1:	e8 ba 0c 00 00       	call   f90 <printf>
      exit();
     2d6:	e8 59 0b 00 00       	call   e34 <exit>
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
     2db:	c7 04 24 9f 12 00 00 	movl   $0x129f,(%esp)
     2e2:	e8 79 fe ff ff       	call   160 <panic>
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->left);
    }
    if(fork1() == 0){
      close(0);
     2e7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     2ee:	e8 69 0b 00 00       	call   e5c <close>
      dup(p[0]);
     2f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
     2f6:	89 04 24             	mov    %eax,(%esp)
     2f9:	e8 ae 0b 00 00       	call   eac <dup>
      close(p[0]);
     2fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
     301:	89 04 24             	mov    %eax,(%esp)
     304:	e8 53 0b 00 00       	call   e5c <close>
      close(p[1]);
     309:	8b 45 f4             	mov    -0xc(%ebp),%eax
     30c:	89 04 24             	mov    %eax,(%esp)
     30f:	e8 48 0b 00 00       	call   e5c <close>
      runcmd(pcmd->right);
     314:	8b 43 08             	mov    0x8(%ebx),%eax
     317:	89 04 24             	mov    %eax,(%esp)
     31a:	e8 91 fe ff ff       	call   1b0 <runcmd>
  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
    if(fork1() == 0){
      close(1);
     31f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     326:	e8 31 0b 00 00       	call   e5c <close>
      dup(p[1]);
     32b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     32e:	89 04 24             	mov    %eax,(%esp)
     331:	e8 76 0b 00 00       	call   eac <dup>
      close(p[0]);
     336:	8b 45 f0             	mov    -0x10(%ebp),%eax
     339:	89 04 24             	mov    %eax,(%esp)
     33c:	e8 1b 0b 00 00       	call   e5c <close>
      close(p[1]);
     341:	8b 45 f4             	mov    -0xc(%ebp),%eax
     344:	89 04 24             	mov    %eax,(%esp)
     347:	e8 10 0b 00 00       	call   e5c <close>
      runcmd(pcmd->left);
     34c:	8b 43 04             	mov    0x4(%ebx),%eax
     34f:	89 04 24             	mov    %eax,(%esp)
     352:	e8 59 fe ff ff       	call   1b0 <runcmd>
     357:	89 f6                	mov    %esi,%esi
     359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000360 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     360:	55                   	push   %ebp
     361:	89 e5                	mov    %esp,%ebp
     363:	53                   	push   %ebx
     364:	83 ec 14             	sub    $0x14,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     367:	c7 04 24 54 00 00 00 	movl   $0x54,(%esp)
     36e:	e8 0d 0e 00 00       	call   1180 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     373:	c7 44 24 08 54 00 00 	movl   $0x54,0x8(%esp)
     37a:	00 
     37b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     382:	00 
struct cmd*
execcmd(void)
{
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     383:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     385:	89 04 24             	mov    %eax,(%esp)
     388:	e8 23 09 00 00       	call   cb0 <memset>
  cmd->type = EXEC;
  return (struct cmd*)cmd;
}
     38d:	89 d8                	mov    %ebx,%eax
{
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = EXEC;
     38f:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     395:	83 c4 14             	add    $0x14,%esp
     398:	5b                   	pop    %ebx
     399:	5d                   	pop    %ebp
     39a:	c3                   	ret    
     39b:	90                   	nop
     39c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003a0 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     3a0:	55                   	push   %ebp
     3a1:	89 e5                	mov    %esp,%ebp
     3a3:	53                   	push   %ebx
     3a4:	83 ec 14             	sub    $0x14,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3a7:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
     3ae:	e8 cd 0d 00 00       	call   1180 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3b3:	c7 44 24 08 18 00 00 	movl   $0x18,0x8(%esp)
     3ba:	00 
     3bb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     3c2:	00 
struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3c3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3c5:	89 04 24             	mov    %eax,(%esp)
     3c8:	e8 e3 08 00 00       	call   cb0 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     3cd:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = REDIR;
     3d0:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     3d6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     3d9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3dc:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     3df:	8b 45 10             	mov    0x10(%ebp),%eax
     3e2:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     3e5:	8b 45 14             	mov    0x14(%ebp),%eax
     3e8:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     3eb:	8b 45 18             	mov    0x18(%ebp),%eax
     3ee:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     3f1:	83 c4 14             	add    $0x14,%esp
     3f4:	89 d8                	mov    %ebx,%eax
     3f6:	5b                   	pop    %ebx
     3f7:	5d                   	pop    %ebp
     3f8:	c3                   	ret    
     3f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000400 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     400:	55                   	push   %ebp
     401:	89 e5                	mov    %esp,%ebp
     403:	53                   	push   %ebx
     404:	83 ec 14             	sub    $0x14,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     407:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     40e:	e8 6d 0d 00 00       	call   1180 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     413:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
     41a:	00 
     41b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     422:	00 
struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     423:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     425:	89 04 24             	mov    %eax,(%esp)
     428:	e8 83 08 00 00       	call   cb0 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     42d:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = PIPE;
     430:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     436:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     439:	8b 45 0c             	mov    0xc(%ebp),%eax
     43c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     43f:	83 c4 14             	add    $0x14,%esp
     442:	89 d8                	mov    %ebx,%eax
     444:	5b                   	pop    %ebx
     445:	5d                   	pop    %ebp
     446:	c3                   	ret    
     447:	89 f6                	mov    %esi,%esi
     449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000450 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     450:	55                   	push   %ebp
     451:	89 e5                	mov    %esp,%ebp
     453:	53                   	push   %ebx
     454:	83 ec 14             	sub    $0x14,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     457:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     45e:	e8 1d 0d 00 00       	call   1180 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     463:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
     46a:	00 
     46b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     472:	00 
struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     473:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     475:	89 04 24             	mov    %eax,(%esp)
     478:	e8 33 08 00 00       	call   cb0 <memset>
  cmd->type = LIST;
  cmd->left = left;
     47d:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = LIST;
     480:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     486:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     489:	8b 45 0c             	mov    0xc(%ebp),%eax
     48c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     48f:	83 c4 14             	add    $0x14,%esp
     492:	89 d8                	mov    %ebx,%eax
     494:	5b                   	pop    %ebx
     495:	5d                   	pop    %ebp
     496:	c3                   	ret    
     497:	89 f6                	mov    %esi,%esi
     499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004a0 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     4a0:	55                   	push   %ebp
     4a1:	89 e5                	mov    %esp,%ebp
     4a3:	53                   	push   %ebx
     4a4:	83 ec 14             	sub    $0x14,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4a7:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     4ae:	e8 cd 0c 00 00       	call   1180 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     4b3:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
     4ba:	00 
     4bb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     4c2:	00 
struct cmd*
backcmd(struct cmd *subcmd)
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4c3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     4c5:	89 04 24             	mov    %eax,(%esp)
     4c8:	e8 e3 07 00 00       	call   cb0 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     4cd:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = BACK;
     4d0:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     4d6:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     4d9:	83 c4 14             	add    $0x14,%esp
     4dc:	89 d8                	mov    %ebx,%eax
     4de:	5b                   	pop    %ebx
     4df:	5d                   	pop    %ebp
     4e0:	c3                   	ret    
     4e1:	eb 0d                	jmp    4f0 <gettoken>
     4e3:	90                   	nop
     4e4:	90                   	nop
     4e5:	90                   	nop
     4e6:	90                   	nop
     4e7:	90                   	nop
     4e8:	90                   	nop
     4e9:	90                   	nop
     4ea:	90                   	nop
     4eb:	90                   	nop
     4ec:	90                   	nop
     4ed:	90                   	nop
     4ee:	90                   	nop
     4ef:	90                   	nop

000004f0 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     4f0:	55                   	push   %ebp
     4f1:	89 e5                	mov    %esp,%ebp
     4f3:	57                   	push   %edi
     4f4:	56                   	push   %esi
     4f5:	53                   	push   %ebx
     4f6:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int ret;

  s = *ps;
     4f9:	8b 45 08             	mov    0x8(%ebp),%eax
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     4fc:	8b 75 0c             	mov    0xc(%ebp),%esi
     4ff:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *s;
  int ret;

  s = *ps;
     502:	8b 18                	mov    (%eax),%ebx
  while(s < es && strchr(whitespace, *s))
     504:	39 f3                	cmp    %esi,%ebx
     506:	72 0f                	jb     517 <gettoken+0x27>
     508:	eb 24                	jmp    52e <gettoken+0x3e>
     50a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     510:	83 c3 01             	add    $0x1,%ebx
{
  char *s;
  int ret;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
     513:	39 f3                	cmp    %esi,%ebx
     515:	74 17                	je     52e <gettoken+0x3e>
     517:	0f be 03             	movsbl (%ebx),%eax
     51a:	c7 04 24 48 19 00 00 	movl   $0x1948,(%esp)
     521:	89 44 24 04          	mov    %eax,0x4(%esp)
     525:	e8 a6 07 00 00       	call   cd0 <strchr>
     52a:	85 c0                	test   %eax,%eax
     52c:	75 e2                	jne    510 <gettoken+0x20>
    s++;
  if(q)
     52e:	85 ff                	test   %edi,%edi
     530:	74 02                	je     534 <gettoken+0x44>
    *q = s;
     532:	89 1f                	mov    %ebx,(%edi)
  ret = *s;
     534:	0f b6 13             	movzbl (%ebx),%edx
     537:	0f be fa             	movsbl %dl,%edi
  switch(*s){
     53a:	80 fa 3c             	cmp    $0x3c,%dl
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
     53d:	89 f8                	mov    %edi,%eax
  switch(*s){
     53f:	7f 4f                	jg     590 <gettoken+0xa0>
     541:	80 fa 3b             	cmp    $0x3b,%dl
     544:	0f 8c 9e 00 00 00    	jl     5e8 <gettoken+0xf8>
  case '&':
  case '<':
    s++;
    break;
  case '>':
    s++;
     54a:	83 c3 01             	add    $0x1,%ebx
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     54d:	8b 45 14             	mov    0x14(%ebp),%eax
     550:	85 c0                	test   %eax,%eax
     552:	74 05                	je     559 <gettoken+0x69>
    *eq = s;
     554:	8b 45 14             	mov    0x14(%ebp),%eax
     557:	89 18                	mov    %ebx,(%eax)

  while(s < es && strchr(whitespace, *s))
     559:	39 f3                	cmp    %esi,%ebx
     55b:	72 0a                	jb     567 <gettoken+0x77>
     55d:	eb 1f                	jmp    57e <gettoken+0x8e>
     55f:	90                   	nop
    s++;
     560:	83 c3 01             	add    $0x1,%ebx
    break;
  }
  if(eq)
    *eq = s;

  while(s < es && strchr(whitespace, *s))
     563:	39 f3                	cmp    %esi,%ebx
     565:	74 17                	je     57e <gettoken+0x8e>
     567:	0f be 03             	movsbl (%ebx),%eax
     56a:	c7 04 24 48 19 00 00 	movl   $0x1948,(%esp)
     571:	89 44 24 04          	mov    %eax,0x4(%esp)
     575:	e8 56 07 00 00       	call   cd0 <strchr>
     57a:	85 c0                	test   %eax,%eax
     57c:	75 e2                	jne    560 <gettoken+0x70>
    s++;
  *ps = s;
     57e:	8b 45 08             	mov    0x8(%ebp),%eax
     581:	89 18                	mov    %ebx,(%eax)
  return ret;
}
     583:	83 c4 1c             	add    $0x1c,%esp
     586:	89 f8                	mov    %edi,%eax
     588:	5b                   	pop    %ebx
     589:	5e                   	pop    %esi
     58a:	5f                   	pop    %edi
     58b:	5d                   	pop    %ebp
     58c:	c3                   	ret    
     58d:	8d 76 00             	lea    0x0(%esi),%esi
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     590:	80 fa 3e             	cmp    $0x3e,%dl
     593:	74 73                	je     608 <gettoken+0x118>
     595:	80 fa 7c             	cmp    $0x7c,%dl
     598:	74 b0                	je     54a <gettoken+0x5a>
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     59a:	39 de                	cmp    %ebx,%esi
      ret = '+';
      s++;
    }
    break;
  default:
    ret = 'a';
     59c:	bf 61 00 00 00       	mov    $0x61,%edi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     5a1:	77 26                	ja     5c9 <gettoken+0xd9>
     5a3:	eb a8                	jmp    54d <gettoken+0x5d>
     5a5:	8d 76 00             	lea    0x0(%esi),%esi
     5a8:	0f be 03             	movsbl (%ebx),%eax
     5ab:	c7 04 24 40 19 00 00 	movl   $0x1940,(%esp)
     5b2:	89 44 24 04          	mov    %eax,0x4(%esp)
     5b6:	e8 15 07 00 00       	call   cd0 <strchr>
     5bb:	85 c0                	test   %eax,%eax
     5bd:	75 1e                	jne    5dd <gettoken+0xed>
      s++;
     5bf:	83 c3 01             	add    $0x1,%ebx
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     5c2:	39 f3                	cmp    %esi,%ebx
     5c4:	74 17                	je     5dd <gettoken+0xed>
     5c6:	0f be 03             	movsbl (%ebx),%eax
     5c9:	89 44 24 04          	mov    %eax,0x4(%esp)
     5cd:	c7 04 24 48 19 00 00 	movl   $0x1948,(%esp)
     5d4:	e8 f7 06 00 00       	call   cd0 <strchr>
     5d9:	85 c0                	test   %eax,%eax
     5db:	74 cb                	je     5a8 <gettoken+0xb8>
      ret = '+';
      s++;
    }
    break;
  default:
    ret = 'a';
     5dd:	bf 61 00 00 00       	mov    $0x61,%edi
     5e2:	e9 66 ff ff ff       	jmp    54d <gettoken+0x5d>
     5e7:	90                   	nop
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     5e8:	80 fa 29             	cmp    $0x29,%dl
     5eb:	7f ad                	jg     59a <gettoken+0xaa>
     5ed:	80 fa 28             	cmp    $0x28,%dl
     5f0:	0f 8d 54 ff ff ff    	jge    54a <gettoken+0x5a>
     5f6:	84 d2                	test   %dl,%dl
     5f8:	0f 84 4f ff ff ff    	je     54d <gettoken+0x5d>
     5fe:	80 fa 26             	cmp    $0x26,%dl
     601:	75 97                	jne    59a <gettoken+0xaa>
     603:	e9 42 ff ff ff       	jmp    54a <gettoken+0x5a>
  case '<':
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
     608:	80 7b 01 3e          	cmpb   $0x3e,0x1(%ebx)
     60c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     610:	0f 85 34 ff ff ff    	jne    54a <gettoken+0x5a>
      ret = '+';
      s++;
     616:	83 c3 02             	add    $0x2,%ebx
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
     619:	bf 2b 00 00 00       	mov    $0x2b,%edi
     61e:	e9 2a ff ff ff       	jmp    54d <gettoken+0x5d>
     623:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     629:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000630 <peek>:
  return ret;
}

int
peek(char **ps, char *es, char *toks)
{
     630:	55                   	push   %ebp
     631:	89 e5                	mov    %esp,%ebp
     633:	57                   	push   %edi
     634:	56                   	push   %esi
     635:	53                   	push   %ebx
     636:	83 ec 1c             	sub    $0x1c,%esp
     639:	8b 7d 08             	mov    0x8(%ebp),%edi
     63c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     63f:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     641:	39 f3                	cmp    %esi,%ebx
     643:	72 0a                	jb     64f <peek+0x1f>
     645:	eb 1f                	jmp    666 <peek+0x36>
     647:	90                   	nop
    s++;
     648:	83 c3 01             	add    $0x1,%ebx
peek(char **ps, char *es, char *toks)
{
  char *s;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
     64b:	39 f3                	cmp    %esi,%ebx
     64d:	74 17                	je     666 <peek+0x36>
     64f:	0f be 03             	movsbl (%ebx),%eax
     652:	c7 04 24 48 19 00 00 	movl   $0x1948,(%esp)
     659:	89 44 24 04          	mov    %eax,0x4(%esp)
     65d:	e8 6e 06 00 00       	call   cd0 <strchr>
     662:	85 c0                	test   %eax,%eax
     664:	75 e2                	jne    648 <peek+0x18>
    s++;
  *ps = s;
     666:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     668:	0f b6 13             	movzbl (%ebx),%edx
     66b:	31 c0                	xor    %eax,%eax
     66d:	84 d2                	test   %dl,%dl
     66f:	75 0f                	jne    680 <peek+0x50>
}
     671:	83 c4 1c             	add    $0x1c,%esp
     674:	5b                   	pop    %ebx
     675:	5e                   	pop    %esi
     676:	5f                   	pop    %edi
     677:	5d                   	pop    %ebp
     678:	c3                   	ret    
     679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  s = *ps;
  while(s < es && strchr(whitespace, *s))
    s++;
  *ps = s;
  return *s && strchr(toks, *s);
     680:	8b 45 10             	mov    0x10(%ebp),%eax
     683:	0f be d2             	movsbl %dl,%edx
     686:	89 54 24 04          	mov    %edx,0x4(%esp)
     68a:	89 04 24             	mov    %eax,(%esp)
     68d:	e8 3e 06 00 00       	call   cd0 <strchr>
  *ps = s;
  return ret;
}

int
peek(char **ps, char *es, char *toks)
     692:	85 c0                	test   %eax,%eax

  s = *ps;
  while(s < es && strchr(whitespace, *s))
    s++;
  *ps = s;
  return *s && strchr(toks, *s);
     694:	0f 95 c0             	setne  %al
}
     697:	83 c4 1c             	add    $0x1c,%esp
     69a:	5b                   	pop    %ebx

  s = *ps;
  while(s < es && strchr(whitespace, *s))
    s++;
  *ps = s;
  return *s && strchr(toks, *s);
     69b:	0f b6 c0             	movzbl %al,%eax
}
     69e:	5e                   	pop    %esi
     69f:	5f                   	pop    %edi
     6a0:	5d                   	pop    %ebp
     6a1:	c3                   	ret    
     6a2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     6a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006b0 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     6b0:	55                   	push   %ebp
     6b1:	89 e5                	mov    %esp,%ebp
     6b3:	57                   	push   %edi
     6b4:	56                   	push   %esi
     6b5:	53                   	push   %ebx
     6b6:	83 ec 3c             	sub    $0x3c,%esp
     6b9:	8b 7d 0c             	mov    0xc(%ebp),%edi
     6bc:	8b 75 10             	mov    0x10(%ebp),%esi
     6bf:	90                   	nop
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     6c0:	c7 44 24 08 c1 12 00 	movl   $0x12c1,0x8(%esp)
     6c7:	00 
     6c8:	89 74 24 04          	mov    %esi,0x4(%esp)
     6cc:	89 3c 24             	mov    %edi,(%esp)
     6cf:	e8 5c ff ff ff       	call   630 <peek>
     6d4:	85 c0                	test   %eax,%eax
     6d6:	0f 84 9c 00 00 00    	je     778 <parseredirs+0xc8>
    tok = gettoken(ps, es, 0, 0);
     6dc:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     6e3:	00 
     6e4:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     6eb:	00 
     6ec:	89 74 24 04          	mov    %esi,0x4(%esp)
     6f0:	89 3c 24             	mov    %edi,(%esp)
     6f3:	e8 f8 fd ff ff       	call   4f0 <gettoken>
    if(gettoken(ps, es, &q, &eq) != 'a')
     6f8:	89 74 24 04          	mov    %esi,0x4(%esp)
     6fc:	89 3c 24             	mov    %edi,(%esp)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    tok = gettoken(ps, es, 0, 0);
     6ff:	89 c3                	mov    %eax,%ebx
    if(gettoken(ps, es, &q, &eq) != 'a')
     701:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     704:	89 44 24 0c          	mov    %eax,0xc(%esp)
     708:	8d 45 e0             	lea    -0x20(%ebp),%eax
     70b:	89 44 24 08          	mov    %eax,0x8(%esp)
     70f:	e8 dc fd ff ff       	call   4f0 <gettoken>
     714:	83 f8 61             	cmp    $0x61,%eax
     717:	75 6a                	jne    783 <parseredirs+0xd3>
      panic("missing file for redirection");
    switch(tok){
     719:	83 fb 3c             	cmp    $0x3c,%ebx
     71c:	74 42                	je     760 <parseredirs+0xb0>
     71e:	83 fb 3e             	cmp    $0x3e,%ebx
     721:	74 05                	je     728 <parseredirs+0x78>
     723:	83 fb 2b             	cmp    $0x2b,%ebx
     726:	75 98                	jne    6c0 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     728:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     72f:	00 
     730:	c7 44 24 0c 01 02 00 	movl   $0x201,0xc(%esp)
     737:	00 
     738:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     73b:	89 44 24 08          	mov    %eax,0x8(%esp)
     73f:	8b 45 e0             	mov    -0x20(%ebp),%eax
     742:	89 44 24 04          	mov    %eax,0x4(%esp)
     746:	8b 45 08             	mov    0x8(%ebp),%eax
     749:	89 04 24             	mov    %eax,(%esp)
     74c:	e8 4f fc ff ff       	call   3a0 <redircmd>
     751:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     754:	e9 67 ff ff ff       	jmp    6c0 <parseredirs+0x10>
     759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
    switch(tok){
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     760:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     767:	00 
     768:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     76f:	00 
     770:	eb c6                	jmp    738 <parseredirs+0x88>
     772:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
}
     778:	8b 45 08             	mov    0x8(%ebp),%eax
     77b:	83 c4 3c             	add    $0x3c,%esp
     77e:	5b                   	pop    %ebx
     77f:	5e                   	pop    %esi
     780:	5f                   	pop    %edi
     781:	5d                   	pop    %ebp
     782:	c3                   	ret    
  char *q, *eq;

  while(peek(ps, es, "<>")){
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
     783:	c7 04 24 a4 12 00 00 	movl   $0x12a4,(%esp)
     78a:	e8 d1 f9 ff ff       	call   160 <panic>
     78f:	90                   	nop

00000790 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     790:	55                   	push   %ebp
     791:	89 e5                	mov    %esp,%ebp
     793:	57                   	push   %edi
     794:	56                   	push   %esi
     795:	53                   	push   %ebx
     796:	83 ec 3c             	sub    $0x3c,%esp
     799:	8b 75 08             	mov    0x8(%ebp),%esi
     79c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     79f:	c7 44 24 08 c4 12 00 	movl   $0x12c4,0x8(%esp)
     7a6:	00 
     7a7:	89 34 24             	mov    %esi,(%esp)
     7aa:	89 7c 24 04          	mov    %edi,0x4(%esp)
     7ae:	e8 7d fe ff ff       	call   630 <peek>
     7b3:	85 c0                	test   %eax,%eax
     7b5:	0f 85 ad 00 00 00    	jne    868 <parseexec+0xd8>
    return parseblock(ps, es);

  ret = execcmd();
     7bb:	e8 a0 fb ff ff       	call   360 <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     7c0:	89 7c 24 08          	mov    %edi,0x8(%esp)
     7c4:	89 74 24 04          	mov    %esi,0x4(%esp)
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);

  ret = execcmd();
     7c8:	89 45 cc             	mov    %eax,-0x34(%ebp)
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     7cb:	89 04 24             	mov    %eax,(%esp)
     7ce:	e8 dd fe ff ff       	call   6b0 <parseredirs>
     7d3:	8b 5d cc             	mov    -0x34(%ebp),%ebx
     7d6:	89 7d d4             	mov    %edi,-0x2c(%ebp)
     7d9:	89 f7                	mov    %esi,%edi
     7db:	89 45 d0             	mov    %eax,-0x30(%ebp)
    return parseblock(ps, es);

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
     7de:	31 c0                	xor    %eax,%eax
     7e0:	89 c6                	mov    %eax,%esi
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
     7e2:	eb 1d                	jmp    801 <parseexec+0x71>
     7e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     7e8:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     7eb:	8b 45 d0             	mov    -0x30(%ebp),%eax
     7ee:	89 7c 24 04          	mov    %edi,0x4(%esp)
     7f2:	89 54 24 08          	mov    %edx,0x8(%esp)
     7f6:	89 04 24             	mov    %eax,(%esp)
     7f9:	e8 b2 fe ff ff       	call   6b0 <parseredirs>
     7fe:	89 45 d0             	mov    %eax,-0x30(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
     801:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     804:	c7 44 24 08 db 12 00 	movl   $0x12db,0x8(%esp)
     80b:	00 
     80c:	89 3c 24             	mov    %edi,(%esp)
     80f:	89 54 24 04          	mov    %edx,0x4(%esp)
     813:	e8 18 fe ff ff       	call   630 <peek>
     818:	85 c0                	test   %eax,%eax
     81a:	75 6c                	jne    888 <parseexec+0xf8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     81c:	8d 55 e0             	lea    -0x20(%ebp),%edx
     81f:	89 54 24 08          	mov    %edx,0x8(%esp)
     823:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     826:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     829:	89 44 24 0c          	mov    %eax,0xc(%esp)
     82d:	89 3c 24             	mov    %edi,(%esp)
     830:	89 54 24 04          	mov    %edx,0x4(%esp)
     834:	e8 b7 fc ff ff       	call   4f0 <gettoken>
     839:	85 c0                	test   %eax,%eax
     83b:	74 4b                	je     888 <parseexec+0xf8>
      break;
    if(tok != 'a')
     83d:	83 f8 61             	cmp    $0x61,%eax
     840:	75 64                	jne    8a6 <parseexec+0x116>
      panic("syntax");
    cmd->argv[argc] = q;
     842:	8b 45 e0             	mov    -0x20(%ebp),%eax
    cmd->eargv[argc] = eq;
    argc++;
     845:	83 c6 01             	add    $0x1,%esi
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
    cmd->argv[argc] = q;
     848:	89 43 04             	mov    %eax,0x4(%ebx)
    cmd->eargv[argc] = eq;
     84b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     84e:	89 43 2c             	mov    %eax,0x2c(%ebx)
    argc++;
     851:	83 c3 04             	add    $0x4,%ebx
    if(argc >= MAXARGS)
     854:	83 fe 0a             	cmp    $0xa,%esi
     857:	75 8f                	jne    7e8 <parseexec+0x58>
      panic("too many args");
     859:	c7 04 24 cd 12 00 00 	movl   $0x12cd,(%esp)
     860:	e8 fb f8 ff ff       	call   160 <panic>
     865:	8d 76 00             	lea    0x0(%esi),%esi
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);
     868:	89 7c 24 04          	mov    %edi,0x4(%esp)
     86c:	89 34 24             	mov    %esi,(%esp)
     86f:	e8 9c 01 00 00       	call   a10 <parseblock>
     874:	89 45 d0             	mov    %eax,-0x30(%ebp)
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     877:	8b 45 d0             	mov    -0x30(%ebp),%eax
     87a:	83 c4 3c             	add    $0x3c,%esp
     87d:	5b                   	pop    %ebx
     87e:	5e                   	pop    %esi
     87f:	5f                   	pop    %edi
     880:	5d                   	pop    %ebp
     881:	c3                   	ret    
     882:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
     888:	8b 55 cc             	mov    -0x34(%ebp),%edx
  cmd->eargv[argc] = 0;
  return ret;
}
     88b:	8b 45 d0             	mov    -0x30(%ebp),%eax
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
     88e:	c7 44 b2 04 00 00 00 	movl   $0x0,0x4(%edx,%esi,4)
     895:	00 
  cmd->eargv[argc] = 0;
     896:	c7 44 b2 2c 00 00 00 	movl   $0x0,0x2c(%edx,%esi,4)
     89d:	00 
  return ret;
}
     89e:	83 c4 3c             	add    $0x3c,%esp
     8a1:	5b                   	pop    %ebx
     8a2:	5e                   	pop    %esi
     8a3:	5f                   	pop    %edi
     8a4:	5d                   	pop    %ebp
     8a5:	c3                   	ret    
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
     8a6:	c7 04 24 c6 12 00 00 	movl   $0x12c6,(%esp)
     8ad:	e8 ae f8 ff ff       	call   160 <panic>
     8b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     8b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000008c0 <parsepipe>:
  return cmd;
}

struct cmd*
parsepipe(char **ps, char *es)
{
     8c0:	55                   	push   %ebp
     8c1:	89 e5                	mov    %esp,%ebp
     8c3:	83 ec 28             	sub    $0x28,%esp
     8c6:	89 5d f4             	mov    %ebx,-0xc(%ebp)
     8c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     8cc:	89 75 f8             	mov    %esi,-0x8(%ebp)
     8cf:	8b 75 0c             	mov    0xc(%ebp),%esi
     8d2:	89 7d fc             	mov    %edi,-0x4(%ebp)
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     8d5:	89 1c 24             	mov    %ebx,(%esp)
     8d8:	89 74 24 04          	mov    %esi,0x4(%esp)
     8dc:	e8 af fe ff ff       	call   790 <parseexec>
  if(peek(ps, es, "|")){
     8e1:	c7 44 24 08 e0 12 00 	movl   $0x12e0,0x8(%esp)
     8e8:	00 
     8e9:	89 74 24 04          	mov    %esi,0x4(%esp)
     8ed:	89 1c 24             	mov    %ebx,(%esp)
struct cmd*
parsepipe(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     8f0:	89 c7                	mov    %eax,%edi
  if(peek(ps, es, "|")){
     8f2:	e8 39 fd ff ff       	call   630 <peek>
     8f7:	85 c0                	test   %eax,%eax
     8f9:	75 15                	jne    910 <parsepipe+0x50>
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
  }
  return cmd;
}
     8fb:	89 f8                	mov    %edi,%eax
     8fd:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     900:	8b 75 f8             	mov    -0x8(%ebp),%esi
     903:	8b 7d fc             	mov    -0x4(%ebp),%edi
     906:	89 ec                	mov    %ebp,%esp
     908:	5d                   	pop    %ebp
     909:	c3                   	ret    
     90a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
     910:	89 74 24 04          	mov    %esi,0x4(%esp)
     914:	89 1c 24             	mov    %ebx,(%esp)
     917:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     91e:	00 
     91f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     926:	00 
     927:	e8 c4 fb ff ff       	call   4f0 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     92c:	89 74 24 04          	mov    %esi,0x4(%esp)
     930:	89 1c 24             	mov    %ebx,(%esp)
     933:	e8 88 ff ff ff       	call   8c0 <parsepipe>
  }
  return cmd;
}
     938:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
     93b:	89 7d 08             	mov    %edi,0x8(%ebp)
  }
  return cmd;
}
     93e:	8b 75 f8             	mov    -0x8(%ebp),%esi
     941:	8b 7d fc             	mov    -0x4(%ebp),%edi
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
     944:	89 45 0c             	mov    %eax,0xc(%ebp)
  }
  return cmd;
}
     947:	89 ec                	mov    %ebp,%esp
     949:	5d                   	pop    %ebp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
     94a:	e9 b1 fa ff ff       	jmp    400 <pipecmd>
     94f:	90                   	nop

00000950 <parseline>:
  return cmd;
}

struct cmd*
parseline(char **ps, char *es)
{
     950:	55                   	push   %ebp
     951:	89 e5                	mov    %esp,%ebp
     953:	57                   	push   %edi
     954:	56                   	push   %esi
     955:	53                   	push   %ebx
     956:	83 ec 1c             	sub    $0x1c,%esp
     959:	8b 5d 08             	mov    0x8(%ebp),%ebx
     95c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     95f:	89 1c 24             	mov    %ebx,(%esp)
     962:	89 74 24 04          	mov    %esi,0x4(%esp)
     966:	e8 55 ff ff ff       	call   8c0 <parsepipe>
     96b:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     96d:	eb 27                	jmp    996 <parseline+0x46>
     96f:	90                   	nop
    gettoken(ps, es, 0, 0);
     970:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     977:	00 
     978:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     97f:	00 
     980:	89 74 24 04          	mov    %esi,0x4(%esp)
     984:	89 1c 24             	mov    %ebx,(%esp)
     987:	e8 64 fb ff ff       	call   4f0 <gettoken>
    cmd = backcmd(cmd);
     98c:	89 3c 24             	mov    %edi,(%esp)
     98f:	e8 0c fb ff ff       	call   4a0 <backcmd>
     994:	89 c7                	mov    %eax,%edi
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
     996:	c7 44 24 08 e2 12 00 	movl   $0x12e2,0x8(%esp)
     99d:	00 
     99e:	89 74 24 04          	mov    %esi,0x4(%esp)
     9a2:	89 1c 24             	mov    %ebx,(%esp)
     9a5:	e8 86 fc ff ff       	call   630 <peek>
     9aa:	85 c0                	test   %eax,%eax
     9ac:	75 c2                	jne    970 <parseline+0x20>
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
     9ae:	c7 44 24 08 de 12 00 	movl   $0x12de,0x8(%esp)
     9b5:	00 
     9b6:	89 74 24 04          	mov    %esi,0x4(%esp)
     9ba:	89 1c 24             	mov    %ebx,(%esp)
     9bd:	e8 6e fc ff ff       	call   630 <peek>
     9c2:	85 c0                	test   %eax,%eax
     9c4:	75 0a                	jne    9d0 <parseline+0x80>
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
  }
  return cmd;
}
     9c6:	83 c4 1c             	add    $0x1c,%esp
     9c9:	89 f8                	mov    %edi,%eax
     9cb:	5b                   	pop    %ebx
     9cc:	5e                   	pop    %esi
     9cd:	5f                   	pop    %edi
     9ce:	5d                   	pop    %ebp
     9cf:	c3                   	ret    
  while(peek(ps, es, "&")){
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
     9d0:	89 74 24 04          	mov    %esi,0x4(%esp)
     9d4:	89 1c 24             	mov    %ebx,(%esp)
     9d7:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     9de:	00 
     9df:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     9e6:	00 
     9e7:	e8 04 fb ff ff       	call   4f0 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     9ec:	89 74 24 04          	mov    %esi,0x4(%esp)
     9f0:	89 1c 24             	mov    %ebx,(%esp)
     9f3:	e8 58 ff ff ff       	call   950 <parseline>
     9f8:	89 7d 08             	mov    %edi,0x8(%ebp)
     9fb:	89 45 0c             	mov    %eax,0xc(%ebp)
  }
  return cmd;
}
     9fe:	83 c4 1c             	add    $0x1c,%esp
     a01:	5b                   	pop    %ebx
     a02:	5e                   	pop    %esi
     a03:	5f                   	pop    %edi
     a04:	5d                   	pop    %ebp
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
     a05:	e9 46 fa ff ff       	jmp    450 <listcmd>
     a0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000a10 <parseblock>:
  return cmd;
}

struct cmd*
parseblock(char **ps, char *es)
{
     a10:	55                   	push   %ebp
     a11:	89 e5                	mov    %esp,%ebp
     a13:	83 ec 28             	sub    $0x28,%esp
     a16:	89 5d f4             	mov    %ebx,-0xc(%ebp)
     a19:	8b 5d 08             	mov    0x8(%ebp),%ebx
     a1c:	89 75 f8             	mov    %esi,-0x8(%ebp)
     a1f:	8b 75 0c             	mov    0xc(%ebp),%esi
     a22:	89 7d fc             	mov    %edi,-0x4(%ebp)
  struct cmd *cmd;

  if(!peek(ps, es, "("))
     a25:	c7 44 24 08 c4 12 00 	movl   $0x12c4,0x8(%esp)
     a2c:	00 
     a2d:	89 1c 24             	mov    %ebx,(%esp)
     a30:	89 74 24 04          	mov    %esi,0x4(%esp)
     a34:	e8 f7 fb ff ff       	call   630 <peek>
     a39:	85 c0                	test   %eax,%eax
     a3b:	74 7b                	je     ab8 <parseblock+0xa8>
    panic("parseblock");
  gettoken(ps, es, 0, 0);
     a3d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     a44:	00 
     a45:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     a4c:	00 
     a4d:	89 74 24 04          	mov    %esi,0x4(%esp)
     a51:	89 1c 24             	mov    %ebx,(%esp)
     a54:	e8 97 fa ff ff       	call   4f0 <gettoken>
  cmd = parseline(ps, es);
     a59:	89 74 24 04          	mov    %esi,0x4(%esp)
     a5d:	89 1c 24             	mov    %ebx,(%esp)
     a60:	e8 eb fe ff ff       	call   950 <parseline>
  if(!peek(ps, es, ")"))
     a65:	c7 44 24 08 00 13 00 	movl   $0x1300,0x8(%esp)
     a6c:	00 
     a6d:	89 74 24 04          	mov    %esi,0x4(%esp)
     a71:	89 1c 24             	mov    %ebx,(%esp)
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
     a74:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     a76:	e8 b5 fb ff ff       	call   630 <peek>
     a7b:	85 c0                	test   %eax,%eax
     a7d:	74 45                	je     ac4 <parseblock+0xb4>
    panic("syntax - missing )");
  gettoken(ps, es, 0, 0);
     a7f:	89 74 24 04          	mov    %esi,0x4(%esp)
     a83:	89 1c 24             	mov    %ebx,(%esp)
     a86:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     a8d:	00 
     a8e:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     a95:	00 
     a96:	e8 55 fa ff ff       	call   4f0 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     a9b:	89 74 24 08          	mov    %esi,0x8(%esp)
     a9f:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     aa3:	89 3c 24             	mov    %edi,(%esp)
     aa6:	e8 05 fc ff ff       	call   6b0 <parseredirs>
  return cmd;
}
     aab:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     aae:	8b 75 f8             	mov    -0x8(%ebp),%esi
     ab1:	8b 7d fc             	mov    -0x4(%ebp),%edi
     ab4:	89 ec                	mov    %ebp,%esp
     ab6:	5d                   	pop    %ebp
     ab7:	c3                   	ret    
parseblock(char **ps, char *es)
{
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
     ab8:	c7 04 24 e4 12 00 00 	movl   $0x12e4,(%esp)
     abf:	e8 9c f6 ff ff       	call   160 <panic>
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
  if(!peek(ps, es, ")"))
    panic("syntax - missing )");
     ac4:	c7 04 24 ef 12 00 00 	movl   $0x12ef,(%esp)
     acb:	e8 90 f6 ff ff       	call   160 <panic>

00000ad0 <nulterminate>:
}

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     ad0:	55                   	push   %ebp
     ad1:	89 e5                	mov    %esp,%ebp
     ad3:	53                   	push   %ebx
     ad4:	83 ec 14             	sub    $0x14,%esp
     ad7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     ada:	85 db                	test   %ebx,%ebx
     adc:	74 05                	je     ae3 <nulterminate+0x13>
    return 0;

  switch(cmd->type){
     ade:	83 3b 05             	cmpl   $0x5,(%ebx)
     ae1:	76 0d                	jbe    af0 <nulterminate+0x20>
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     ae3:	83 c4 14             	add    $0x14,%esp
     ae6:	89 d8                	mov    %ebx,%eax
     ae8:	5b                   	pop    %ebx
     ae9:	5d                   	pop    %ebp
     aea:	c3                   	ret    
     aeb:	90                   	nop
     aec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  struct redircmd *rcmd;

  if(cmd == 0)
    return 0;

  switch(cmd->type){
     af0:	8b 03                	mov    (%ebx),%eax
     af2:	ff 24 85 40 13 00 00 	jmp    *0x1340(,%eax,4)
     af9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     b00:	8b 43 04             	mov    0x4(%ebx),%eax
     b03:	89 04 24             	mov    %eax,(%esp)
     b06:	e8 c5 ff ff ff       	call   ad0 <nulterminate>
    nulterminate(lcmd->right);
     b0b:	8b 43 08             	mov    0x8(%ebx),%eax
     b0e:	89 04 24             	mov    %eax,(%esp)
     b11:	e8 ba ff ff ff       	call   ad0 <nulterminate>
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     b16:	83 c4 14             	add    $0x14,%esp
     b19:	89 d8                	mov    %ebx,%eax
     b1b:	5b                   	pop    %ebx
     b1c:	5d                   	pop    %ebp
     b1d:	c3                   	ret    
     b1e:	66 90                	xchg   %ax,%ax
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
     b20:	8b 43 04             	mov    0x4(%ebx),%eax
     b23:	89 04 24             	mov    %eax,(%esp)
     b26:	e8 a5 ff ff ff       	call   ad0 <nulterminate>
    break;
  }
  return cmd;
}
     b2b:	83 c4 14             	add    $0x14,%esp
     b2e:	89 d8                	mov    %ebx,%eax
     b30:	5b                   	pop    %ebx
     b31:	5d                   	pop    %ebp
     b32:	c3                   	ret    
     b33:	90                   	nop
     b34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      *ecmd->eargv[i] = 0;
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
     b38:	8b 43 04             	mov    0x4(%ebx),%eax
     b3b:	89 04 24             	mov    %eax,(%esp)
     b3e:	e8 8d ff ff ff       	call   ad0 <nulterminate>
    *rcmd->efile = 0;
     b43:	8b 43 0c             	mov    0xc(%ebx),%eax
     b46:	c6 00 00             	movb   $0x0,(%eax)
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     b49:	83 c4 14             	add    $0x14,%esp
     b4c:	89 d8                	mov    %ebx,%eax
     b4e:	5b                   	pop    %ebx
     b4f:	5d                   	pop    %ebp
     b50:	c3                   	ret    
     b51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     b58:	8b 4b 04             	mov    0x4(%ebx),%ecx
     b5b:	85 c9                	test   %ecx,%ecx
     b5d:	74 84                	je     ae3 <nulterminate+0x13>
     b5f:	89 d8                	mov    %ebx,%eax
     b61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      *ecmd->eargv[i] = 0;
     b68:	8b 50 2c             	mov    0x2c(%eax),%edx
     b6b:	83 c0 04             	add    $0x4,%eax
     b6e:	c6 02 00             	movb   $0x0,(%edx)
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     b71:	8b 50 04             	mov    0x4(%eax),%edx
     b74:	85 d2                	test   %edx,%edx
     b76:	75 f0                	jne    b68 <nulterminate+0x98>
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     b78:	83 c4 14             	add    $0x14,%esp
     b7b:	89 d8                	mov    %ebx,%eax
     b7d:	5b                   	pop    %ebx
     b7e:	5d                   	pop    %ebp
     b7f:	c3                   	ret    

00000b80 <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
     b80:	55                   	push   %ebp
     b81:	89 e5                	mov    %esp,%ebp
     b83:	56                   	push   %esi
     b84:	53                   	push   %ebx
     b85:	83 ec 10             	sub    $0x10,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     b88:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b8b:	89 1c 24             	mov    %ebx,(%esp)
     b8e:	e8 fd 00 00 00       	call   c90 <strlen>
     b93:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     b95:	8d 45 08             	lea    0x8(%ebp),%eax
     b98:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     b9c:	89 04 24             	mov    %eax,(%esp)
     b9f:	e8 ac fd ff ff       	call   950 <parseline>
  peek(&s, es, "");
     ba4:	c7 44 24 08 8e 12 00 	movl   $0x128e,0x8(%esp)
     bab:	00 
     bac:	89 5c 24 04          	mov    %ebx,0x4(%esp)
{
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
  cmd = parseline(&s, es);
     bb0:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     bb2:	8d 45 08             	lea    0x8(%ebp),%eax
     bb5:	89 04 24             	mov    %eax,(%esp)
     bb8:	e8 73 fa ff ff       	call   630 <peek>
  if(s != es){
     bbd:	8b 45 08             	mov    0x8(%ebp),%eax
     bc0:	39 d8                	cmp    %ebx,%eax
     bc2:	75 11                	jne    bd5 <parsecmd+0x55>
    printf(2, "leftovers: %s\n", s);
    panic("syntax");
  }
  nulterminate(cmd);
     bc4:	89 34 24             	mov    %esi,(%esp)
     bc7:	e8 04 ff ff ff       	call   ad0 <nulterminate>
  return cmd;
}
     bcc:	83 c4 10             	add    $0x10,%esp
     bcf:	89 f0                	mov    %esi,%eax
     bd1:	5b                   	pop    %ebx
     bd2:	5e                   	pop    %esi
     bd3:	5d                   	pop    %ebp
     bd4:	c3                   	ret    

  es = s + strlen(s);
  cmd = parseline(&s, es);
  peek(&s, es, "");
  if(s != es){
    printf(2, "leftovers: %s\n", s);
     bd5:	89 44 24 08          	mov    %eax,0x8(%esp)
     bd9:	c7 44 24 04 02 13 00 	movl   $0x1302,0x4(%esp)
     be0:	00 
     be1:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     be8:	e8 a3 03 00 00       	call   f90 <printf>
    panic("syntax");
     bed:	c7 04 24 c6 12 00 00 	movl   $0x12c6,(%esp)
     bf4:	e8 67 f5 ff ff       	call   160 <panic>
     bf9:	90                   	nop
     bfa:	90                   	nop
     bfb:	90                   	nop
     bfc:	90                   	nop
     bfd:	90                   	nop
     bfe:	90                   	nop
     bff:	90                   	nop

00000c00 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     c00:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     c01:	31 d2                	xor    %edx,%edx
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     c03:	89 e5                	mov    %esp,%ebp
     c05:	8b 45 08             	mov    0x8(%ebp),%eax
     c08:	53                   	push   %ebx
     c09:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     c0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     c10:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
     c14:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     c17:	83 c2 01             	add    $0x1,%edx
     c1a:	84 c9                	test   %cl,%cl
     c1c:	75 f2                	jne    c10 <strcpy+0x10>
    ;
  return os;
}
     c1e:	5b                   	pop    %ebx
     c1f:	5d                   	pop    %ebp
     c20:	c3                   	ret    
     c21:	eb 0d                	jmp    c30 <strcmp>
     c23:	90                   	nop
     c24:	90                   	nop
     c25:	90                   	nop
     c26:	90                   	nop
     c27:	90                   	nop
     c28:	90                   	nop
     c29:	90                   	nop
     c2a:	90                   	nop
     c2b:	90                   	nop
     c2c:	90                   	nop
     c2d:	90                   	nop
     c2e:	90                   	nop
     c2f:	90                   	nop

00000c30 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     c30:	55                   	push   %ebp
     c31:	89 e5                	mov    %esp,%ebp
     c33:	8b 4d 08             	mov    0x8(%ebp),%ecx
     c36:	56                   	push   %esi
     c37:	8b 55 0c             	mov    0xc(%ebp),%edx
     c3a:	53                   	push   %ebx
  while(*p && *p == *q)
     c3b:	0f b6 01             	movzbl (%ecx),%eax
     c3e:	0f b6 1a             	movzbl (%edx),%ebx
     c41:	84 c0                	test   %al,%al
     c43:	74 23                	je     c68 <strcmp+0x38>
     c45:	38 d8                	cmp    %bl,%al
     c47:	74 10                	je     c59 <strcmp+0x29>
     c49:	eb 2d                	jmp    c78 <strcmp+0x48>
     c4b:	90                   	nop
     c4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c50:	83 c1 01             	add    $0x1,%ecx
     c53:	38 d8                	cmp    %bl,%al
     c55:	75 21                	jne    c78 <strcmp+0x48>
    p++, q++;
     c57:	89 f2                	mov    %esi,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     c59:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
     c5d:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     c60:	0f b6 5a 01          	movzbl 0x1(%edx),%ebx
     c64:	84 c0                	test   %al,%al
     c66:	75 e8                	jne    c50 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     c68:	0f b6 db             	movzbl %bl,%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     c6b:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
     c6d:	29 d8                	sub    %ebx,%eax
}
     c6f:	5b                   	pop    %ebx
     c70:	5e                   	pop    %esi
     c71:	5d                   	pop    %ebp
     c72:	c3                   	ret    
     c73:	90                   	nop
     c74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    p++, q++;
  return (uchar)*p - (uchar)*q;
     c78:	0f b6 db             	movzbl %bl,%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     c7b:	0f b6 c0             	movzbl %al,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
     c7e:	29 d8                	sub    %ebx,%eax
}
     c80:	5b                   	pop    %ebx
     c81:	5e                   	pop    %esi
     c82:	5d                   	pop    %ebp
     c83:	c3                   	ret    
     c84:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     c8a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000c90 <strlen>:

uint
strlen(const char *s)
{
     c90:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
     c91:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
     c93:	89 e5                	mov    %esp,%ebp
     c95:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     c98:	80 39 00             	cmpb   $0x0,(%ecx)
     c9b:	74 0e                	je     cab <strlen+0x1b>
     c9d:	31 d2                	xor    %edx,%edx
     c9f:	90                   	nop
     ca0:	83 c2 01             	add    $0x1,%edx
     ca3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     ca7:	89 d0                	mov    %edx,%eax
     ca9:	75 f5                	jne    ca0 <strlen+0x10>
    ;
  return n;
}
     cab:	5d                   	pop    %ebp
     cac:	c3                   	ret    
     cad:	8d 76 00             	lea    0x0(%esi),%esi

00000cb0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     cb0:	55                   	push   %ebp
     cb1:	89 e5                	mov    %esp,%ebp
     cb3:	8b 55 08             	mov    0x8(%ebp),%edx
     cb6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     cb7:	8b 4d 10             	mov    0x10(%ebp),%ecx
     cba:	8b 45 0c             	mov    0xc(%ebp),%eax
     cbd:	89 d7                	mov    %edx,%edi
     cbf:	fc                   	cld    
     cc0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     cc2:	89 d0                	mov    %edx,%eax
     cc4:	5f                   	pop    %edi
     cc5:	5d                   	pop    %ebp
     cc6:	c3                   	ret    
     cc7:	89 f6                	mov    %esi,%esi
     cc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000cd0 <strchr>:

char*
strchr(const char *s, char c)
{
     cd0:	55                   	push   %ebp
     cd1:	89 e5                	mov    %esp,%ebp
     cd3:	8b 45 08             	mov    0x8(%ebp),%eax
     cd6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     cda:	0f b6 10             	movzbl (%eax),%edx
     cdd:	84 d2                	test   %dl,%dl
     cdf:	75 12                	jne    cf3 <strchr+0x23>
     ce1:	eb 1d                	jmp    d00 <strchr+0x30>
     ce3:	90                   	nop
     ce4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     ce8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     cec:	84 d2                	test   %dl,%dl
     cee:	74 10                	je     d00 <strchr+0x30>
     cf0:	83 c0 01             	add    $0x1,%eax
    if(*s == c)
     cf3:	38 ca                	cmp    %cl,%dl
     cf5:	75 f1                	jne    ce8 <strchr+0x18>
      return (char*)s;
  return 0;
}
     cf7:	5d                   	pop    %ebp
     cf8:	c3                   	ret    
     cf9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
     d00:	31 c0                	xor    %eax,%eax
}
     d02:	5d                   	pop    %ebp
     d03:	c3                   	ret    
     d04:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     d0a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000d10 <gets>:

char*
gets(char *buf, int max)
{
     d10:	55                   	push   %ebp
     d11:	89 e5                	mov    %esp,%ebp
     d13:	57                   	push   %edi
     d14:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     d15:	31 f6                	xor    %esi,%esi
  return 0;
}

char*
gets(char *buf, int max)
{
     d17:	53                   	push   %ebx
     d18:	83 ec 2c             	sub    $0x2c,%esp
     d1b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     d1e:	eb 31                	jmp    d51 <gets+0x41>
    cc = read(0, &c, 1);
     d20:	8d 45 e7             	lea    -0x19(%ebp),%eax
     d23:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     d2a:	00 
     d2b:	89 44 24 04          	mov    %eax,0x4(%esp)
     d2f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     d36:	e8 11 01 00 00       	call   e4c <read>
    if(cc < 1)
     d3b:	85 c0                	test   %eax,%eax
     d3d:	7e 1a                	jle    d59 <gets+0x49>
      break;
    buf[i++] = c;
     d3f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     d43:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
     d45:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
     d47:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
     d4b:	74 0c                	je     d59 <gets+0x49>
     d4d:	3c 0a                	cmp    $0xa,%al
     d4f:	74 08                	je     d59 <gets+0x49>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     d51:	8d 5e 01             	lea    0x1(%esi),%ebx
     d54:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     d57:	7c c7                	jl     d20 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     d59:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
     d5d:	83 c4 2c             	add    $0x2c,%esp
     d60:	89 f8                	mov    %edi,%eax
     d62:	5b                   	pop    %ebx
     d63:	5e                   	pop    %esi
     d64:	5f                   	pop    %edi
     d65:	5d                   	pop    %ebp
     d66:	c3                   	ret    
     d67:	89 f6                	mov    %esi,%esi
     d69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000d70 <stat>:

int
stat(const char *n, struct stat *st)
{
     d70:	55                   	push   %ebp
     d71:	89 e5                	mov    %esp,%ebp
     d73:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     d76:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(const char *n, struct stat *st)
{
     d79:	89 5d f8             	mov    %ebx,-0x8(%ebp)
     d7c:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
     d7f:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     d84:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     d8b:	00 
     d8c:	89 04 24             	mov    %eax,(%esp)
     d8f:	e8 e0 00 00 00       	call   e74 <open>
  if(fd < 0)
     d94:	85 c0                	test   %eax,%eax
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     d96:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
     d98:	78 19                	js     db3 <stat+0x43>
    return -1;
  r = fstat(fd, st);
     d9a:	8b 45 0c             	mov    0xc(%ebp),%eax
     d9d:	89 1c 24             	mov    %ebx,(%esp)
     da0:	89 44 24 04          	mov    %eax,0x4(%esp)
     da4:	e8 e3 00 00 00       	call   e8c <fstat>
  close(fd);
     da9:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
     dac:	89 c6                	mov    %eax,%esi
  close(fd);
     dae:	e8 a9 00 00 00       	call   e5c <close>
  return r;
}
     db3:	89 f0                	mov    %esi,%eax
     db5:	8b 5d f8             	mov    -0x8(%ebp),%ebx
     db8:	8b 75 fc             	mov    -0x4(%ebp),%esi
     dbb:	89 ec                	mov    %ebp,%esp
     dbd:	5d                   	pop    %ebp
     dbe:	c3                   	ret    
     dbf:	90                   	nop

00000dc0 <atoi>:

int
atoi(const char *s)
{
     dc0:	55                   	push   %ebp
  int n;

  n = 0;
     dc1:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
     dc3:	89 e5                	mov    %esp,%ebp
     dc5:	8b 4d 08             	mov    0x8(%ebp),%ecx
     dc8:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     dc9:	0f b6 11             	movzbl (%ecx),%edx
     dcc:	8d 5a d0             	lea    -0x30(%edx),%ebx
     dcf:	80 fb 09             	cmp    $0x9,%bl
     dd2:	77 1c                	ja     df0 <atoi+0x30>
     dd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
     dd8:	0f be d2             	movsbl %dl,%edx
     ddb:	83 c1 01             	add    $0x1,%ecx
     dde:	8d 04 80             	lea    (%eax,%eax,4),%eax
     de1:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     de5:	0f b6 11             	movzbl (%ecx),%edx
     de8:	8d 5a d0             	lea    -0x30(%edx),%ebx
     deb:	80 fb 09             	cmp    $0x9,%bl
     dee:	76 e8                	jbe    dd8 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
     df0:	5b                   	pop    %ebx
     df1:	5d                   	pop    %ebp
     df2:	c3                   	ret    
     df3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     df9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000e00 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     e00:	55                   	push   %ebp
     e01:	89 e5                	mov    %esp,%ebp
     e03:	56                   	push   %esi
     e04:	8b 45 08             	mov    0x8(%ebp),%eax
     e07:	53                   	push   %ebx
     e08:	8b 5d 10             	mov    0x10(%ebp),%ebx
     e0b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     e0e:	85 db                	test   %ebx,%ebx
     e10:	7e 14                	jle    e26 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, const void *vsrc, int n)
     e12:	31 d2                	xor    %edx,%edx
     e14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
     e18:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     e1c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     e1f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     e22:	39 da                	cmp    %ebx,%edx
     e24:	75 f2                	jne    e18 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
     e26:	5b                   	pop    %ebx
     e27:	5e                   	pop    %esi
     e28:	5d                   	pop    %ebp
     e29:	c3                   	ret    
     e2a:	90                   	nop
     e2b:	90                   	nop

00000e2c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     e2c:	b8 01 00 00 00       	mov    $0x1,%eax
     e31:	cd 40                	int    $0x40
     e33:	c3                   	ret    

00000e34 <exit>:
SYSCALL(exit)
     e34:	b8 02 00 00 00       	mov    $0x2,%eax
     e39:	cd 40                	int    $0x40
     e3b:	c3                   	ret    

00000e3c <wait>:
SYSCALL(wait)
     e3c:	b8 03 00 00 00       	mov    $0x3,%eax
     e41:	cd 40                	int    $0x40
     e43:	c3                   	ret    

00000e44 <pipe>:
SYSCALL(pipe)
     e44:	b8 04 00 00 00       	mov    $0x4,%eax
     e49:	cd 40                	int    $0x40
     e4b:	c3                   	ret    

00000e4c <read>:
SYSCALL(read)
     e4c:	b8 05 00 00 00       	mov    $0x5,%eax
     e51:	cd 40                	int    $0x40
     e53:	c3                   	ret    

00000e54 <write>:
SYSCALL(write)
     e54:	b8 10 00 00 00       	mov    $0x10,%eax
     e59:	cd 40                	int    $0x40
     e5b:	c3                   	ret    

00000e5c <close>:
SYSCALL(close)
     e5c:	b8 15 00 00 00       	mov    $0x15,%eax
     e61:	cd 40                	int    $0x40
     e63:	c3                   	ret    

00000e64 <kill>:
SYSCALL(kill)
     e64:	b8 06 00 00 00       	mov    $0x6,%eax
     e69:	cd 40                	int    $0x40
     e6b:	c3                   	ret    

00000e6c <exec>:
SYSCALL(exec)
     e6c:	b8 07 00 00 00       	mov    $0x7,%eax
     e71:	cd 40                	int    $0x40
     e73:	c3                   	ret    

00000e74 <open>:
SYSCALL(open)
     e74:	b8 0f 00 00 00       	mov    $0xf,%eax
     e79:	cd 40                	int    $0x40
     e7b:	c3                   	ret    

00000e7c <mknod>:
SYSCALL(mknod)
     e7c:	b8 11 00 00 00       	mov    $0x11,%eax
     e81:	cd 40                	int    $0x40
     e83:	c3                   	ret    

00000e84 <unlink>:
SYSCALL(unlink)
     e84:	b8 12 00 00 00       	mov    $0x12,%eax
     e89:	cd 40                	int    $0x40
     e8b:	c3                   	ret    

00000e8c <fstat>:
SYSCALL(fstat)
     e8c:	b8 08 00 00 00       	mov    $0x8,%eax
     e91:	cd 40                	int    $0x40
     e93:	c3                   	ret    

00000e94 <link>:
SYSCALL(link)
     e94:	b8 13 00 00 00       	mov    $0x13,%eax
     e99:	cd 40                	int    $0x40
     e9b:	c3                   	ret    

00000e9c <mkdir>:
SYSCALL(mkdir)
     e9c:	b8 14 00 00 00       	mov    $0x14,%eax
     ea1:	cd 40                	int    $0x40
     ea3:	c3                   	ret    

00000ea4 <chdir>:
SYSCALL(chdir)
     ea4:	b8 09 00 00 00       	mov    $0x9,%eax
     ea9:	cd 40                	int    $0x40
     eab:	c3                   	ret    

00000eac <dup>:
SYSCALL(dup)
     eac:	b8 0a 00 00 00       	mov    $0xa,%eax
     eb1:	cd 40                	int    $0x40
     eb3:	c3                   	ret    

00000eb4 <getpid>:
SYSCALL(getpid)
     eb4:	b8 0b 00 00 00       	mov    $0xb,%eax
     eb9:	cd 40                	int    $0x40
     ebb:	c3                   	ret    

00000ebc <sbrk>:
SYSCALL(sbrk)
     ebc:	b8 0c 00 00 00       	mov    $0xc,%eax
     ec1:	cd 40                	int    $0x40
     ec3:	c3                   	ret    

00000ec4 <sleep>:
SYSCALL(sleep)
     ec4:	b8 0d 00 00 00       	mov    $0xd,%eax
     ec9:	cd 40                	int    $0x40
     ecb:	c3                   	ret    

00000ecc <uptime>:
SYSCALL(uptime)
     ecc:	b8 0e 00 00 00       	mov    $0xe,%eax
     ed1:	cd 40                	int    $0x40
     ed3:	c3                   	ret    
     ed4:	90                   	nop
     ed5:	90                   	nop
     ed6:	90                   	nop
     ed7:	90                   	nop
     ed8:	90                   	nop
     ed9:	90                   	nop
     eda:	90                   	nop
     edb:	90                   	nop
     edc:	90                   	nop
     edd:	90                   	nop
     ede:	90                   	nop
     edf:	90                   	nop

00000ee0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     ee0:	55                   	push   %ebp
     ee1:	89 e5                	mov    %esp,%ebp
     ee3:	83 ec 28             	sub    $0x28,%esp
     ee6:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
     ee9:	8d 55 f4             	lea    -0xc(%ebp),%edx
     eec:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     ef3:	00 
     ef4:	89 54 24 04          	mov    %edx,0x4(%esp)
     ef8:	89 04 24             	mov    %eax,(%esp)
     efb:	e8 54 ff ff ff       	call   e54 <write>
}
     f00:	c9                   	leave  
     f01:	c3                   	ret    
     f02:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     f09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000f10 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     f10:	55                   	push   %ebp
     f11:	89 e5                	mov    %esp,%ebp
     f13:	57                   	push   %edi
     f14:	56                   	push   %esi
     f15:	89 c6                	mov    %eax,%esi
     f17:	53                   	push   %ebx
     f18:	83 ec 1c             	sub    $0x1c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     f1b:	8b 45 08             	mov    0x8(%ebp),%eax
     f1e:	85 c0                	test   %eax,%eax
     f20:	74 5e                	je     f80 <printint+0x70>
     f22:	89 d0                	mov    %edx,%eax
     f24:	c1 e8 1f             	shr    $0x1f,%eax
     f27:	84 c0                	test   %al,%al
     f29:	74 55                	je     f80 <printint+0x70>
    neg = 1;
    x = -xx;
     f2b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
     f2d:	bf 01 00 00 00       	mov    $0x1,%edi
    x = -xx;
     f32:	f7 d8                	neg    %eax
  } else {
    x = xx;
  }

  i = 0;
     f34:	31 db                	xor    %ebx,%ebx
     f36:	eb 02                	jmp    f3a <printint+0x2a>
  do{
    buf[i++] = digits[x % base];
     f38:	89 d3                	mov    %edx,%ebx
     f3a:	31 d2                	xor    %edx,%edx
     f3c:	f7 f1                	div    %ecx
     f3e:	0f b6 92 5f 13 00 00 	movzbl 0x135f(%edx),%edx
  }while((x /= base) != 0);
     f45:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
     f47:	88 54 1d d8          	mov    %dl,-0x28(%ebp,%ebx,1)
     f4b:	8d 53 01             	lea    0x1(%ebx),%edx
  }while((x /= base) != 0);
     f4e:	75 e8                	jne    f38 <printint+0x28>
  if(neg)
     f50:	85 ff                	test   %edi,%edi
     f52:	74 08                	je     f5c <printint+0x4c>
    buf[i++] = '-';
     f54:	c6 44 15 d8 2d       	movb   $0x2d,-0x28(%ebp,%edx,1)
     f59:	8d 53 02             	lea    0x2(%ebx),%edx

  while(--i >= 0)
     f5c:	8d 5a ff             	lea    -0x1(%edx),%ebx
     f5f:	90                   	nop
    putc(fd, buf[i]);
     f60:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
     f65:	89 f0                	mov    %esi,%eax
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     f67:	83 eb 01             	sub    $0x1,%ebx
    putc(fd, buf[i]);
     f6a:	e8 71 ff ff ff       	call   ee0 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     f6f:	83 fb ff             	cmp    $0xffffffff,%ebx
     f72:	75 ec                	jne    f60 <printint+0x50>
    putc(fd, buf[i]);
}
     f74:	83 c4 1c             	add    $0x1c,%esp
     f77:	5b                   	pop    %ebx
     f78:	5e                   	pop    %esi
     f79:	5f                   	pop    %edi
     f7a:	5d                   	pop    %ebp
     f7b:	c3                   	ret    
     f7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
     f80:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     f82:	31 ff                	xor    %edi,%edi
     f84:	eb ae                	jmp    f34 <printint+0x24>
     f86:	8d 76 00             	lea    0x0(%esi),%esi
     f89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000f90 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
     f90:	55                   	push   %ebp
     f91:	89 e5                	mov    %esp,%ebp
     f93:	57                   	push   %edi
     f94:	56                   	push   %esi
     f95:	53                   	push   %ebx
     f96:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     f99:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     f9c:	0f b6 0b             	movzbl (%ebx),%ecx
     f9f:	84 c9                	test   %cl,%cl
     fa1:	0f 84 89 00 00 00    	je     1030 <printf+0xa0>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
     fa7:	8d 45 10             	lea    0x10(%ebp),%eax
{
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     faa:	31 f6                	xor    %esi,%esi
  ap = (uint*)(void*)&fmt + 1;
     fac:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     faf:	eb 21                	jmp    fd2 <printf+0x42>
     fb1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     fb8:	83 f9 25             	cmp    $0x25,%ecx
     fbb:	74 7b                	je     1038 <printf+0xa8>
        state = '%';
      } else {
        putc(fd, c);
     fbd:	8b 45 08             	mov    0x8(%ebp),%eax
     fc0:	0f be d1             	movsbl %cl,%edx
     fc3:	e8 18 ff ff ff       	call   ee0 <putc>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
     fc8:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     fcb:	0f b6 0b             	movzbl (%ebx),%ecx
     fce:	84 c9                	test   %cl,%cl
     fd0:	74 5e                	je     1030 <printf+0xa0>
    c = fmt[i] & 0xff;
    if(state == 0){
     fd2:	85 f6                	test   %esi,%esi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
     fd4:	0f b6 c9             	movzbl %cl,%ecx
    if(state == 0){
     fd7:	74 df                	je     fb8 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
     fd9:	83 fe 25             	cmp    $0x25,%esi
     fdc:	75 ea                	jne    fc8 <printf+0x38>
      if(c == 'd'){
     fde:	83 f9 64             	cmp    $0x64,%ecx
     fe1:	0f 84 c9 00 00 00    	je     10b0 <printf+0x120>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
     fe7:	83 f9 70             	cmp    $0x70,%ecx
     fea:	74 54                	je     1040 <printf+0xb0>
     fec:	83 f9 78             	cmp    $0x78,%ecx
     fef:	90                   	nop
     ff0:	74 4e                	je     1040 <printf+0xb0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
     ff2:	83 f9 73             	cmp    $0x73,%ecx
     ff5:	74 71                	je     1068 <printf+0xd8>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     ff7:	83 f9 63             	cmp    $0x63,%ecx
     ffa:	0f 84 d2 00 00 00    	je     10d2 <printf+0x142>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    1000:	83 f9 25             	cmp    $0x25,%ecx
        putc(fd, c);
    1003:	ba 25 00 00 00       	mov    $0x25,%edx
    1008:	8b 45 08             	mov    0x8(%ebp),%eax
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    100b:	74 11                	je     101e <printf+0x8e>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    100d:	89 4d e0             	mov    %ecx,-0x20(%ebp)
    1010:	e8 cb fe ff ff       	call   ee0 <putc>
        putc(fd, c);
    1015:	8b 4d e0             	mov    -0x20(%ebp),%ecx
    1018:	8b 45 08             	mov    0x8(%ebp),%eax
    101b:	0f be d1             	movsbl %cl,%edx
    101e:	83 c3 01             	add    $0x1,%ebx
      }
      state = 0;
    1021:	31 f6                	xor    %esi,%esi
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    1023:	e8 b8 fe ff ff       	call   ee0 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1028:	0f b6 0b             	movzbl (%ebx),%ecx
    102b:	84 c9                	test   %cl,%cl
    102d:	75 a3                	jne    fd2 <printf+0x42>
    102f:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1030:	83 c4 2c             	add    $0x2c,%esp
    1033:	5b                   	pop    %ebx
    1034:	5e                   	pop    %esi
    1035:	5f                   	pop    %edi
    1036:	5d                   	pop    %ebp
    1037:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1038:	be 25 00 00 00       	mov    $0x25,%esi
    103d:	eb 89                	jmp    fc8 <printf+0x38>
    103f:	90                   	nop
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    1040:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1043:	b9 10 00 00 00       	mov    $0x10,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1048:	31 f6                	xor    %esi,%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    104a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1051:	8b 10                	mov    (%eax),%edx
    1053:	8b 45 08             	mov    0x8(%ebp),%eax
    1056:	e8 b5 fe ff ff       	call   f10 <printint>
        ap++;
    105b:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
    105f:	e9 64 ff ff ff       	jmp    fc8 <printf+0x38>
    1064:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    1068:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    106b:	8b 38                	mov    (%eax),%edi
        ap++;
    106d:	83 c0 04             	add    $0x4,%eax
    1070:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
          s = "(null)";
    1073:	b8 58 13 00 00       	mov    $0x1358,%eax
    1078:	85 ff                	test   %edi,%edi
    107a:	0f 44 f8             	cmove  %eax,%edi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    107d:	31 f6                	xor    %esi,%esi
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    107f:	0f b6 17             	movzbl (%edi),%edx
    1082:	84 d2                	test   %dl,%dl
    1084:	0f 84 3e ff ff ff    	je     fc8 <printf+0x38>
    108a:	89 de                	mov    %ebx,%esi
    108c:	8b 5d 08             	mov    0x8(%ebp),%ebx
    108f:	90                   	nop
          putc(fd, *s);
    1090:	0f be d2             	movsbl %dl,%edx
          s++;
    1093:	83 c7 01             	add    $0x1,%edi
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
    1096:	89 d8                	mov    %ebx,%eax
    1098:	e8 43 fe ff ff       	call   ee0 <putc>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    109d:	0f b6 17             	movzbl (%edi),%edx
    10a0:	84 d2                	test   %dl,%dl
    10a2:	75 ec                	jne    1090 <printf+0x100>
    10a4:	89 f3                	mov    %esi,%ebx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    10a6:	31 f6                	xor    %esi,%esi
    10a8:	e9 1b ff ff ff       	jmp    fc8 <printf+0x38>
    10ad:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    10b0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    10b3:	b1 0a                	mov    $0xa,%cl
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    10b5:	66 31 f6             	xor    %si,%si
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    10b8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10bf:	8b 10                	mov    (%eax),%edx
    10c1:	8b 45 08             	mov    0x8(%ebp),%eax
    10c4:	e8 47 fe ff ff       	call   f10 <printint>
        ap++;
    10c9:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
    10cd:	e9 f6 fe ff ff       	jmp    fc8 <printf+0x38>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
    10d2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    10d5:	31 f6                	xor    %esi,%esi
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
    10d7:	0f be 10             	movsbl (%eax),%edx
    10da:	8b 45 08             	mov    0x8(%ebp),%eax
    10dd:	e8 fe fd ff ff       	call   ee0 <putc>
        ap++;
    10e2:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
    10e6:	e9 dd fe ff ff       	jmp    fc8 <printf+0x38>
    10eb:	90                   	nop
    10ec:	90                   	nop
    10ed:	90                   	nop
    10ee:	90                   	nop
    10ef:	90                   	nop

000010f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    10f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    10f1:	a1 c4 19 00 00       	mov    0x19c4,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    10f6:	89 e5                	mov    %esp,%ebp
    10f8:	57                   	push   %edi
    10f9:	56                   	push   %esi
    10fa:	53                   	push   %ebx
    10fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
    10fe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    1101:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1108:	39 c8                	cmp    %ecx,%eax
    110a:	8b 10                	mov    (%eax),%edx
    110c:	73 04                	jae    1112 <free+0x22>
    110e:	39 d1                	cmp    %edx,%ecx
    1110:	72 16                	jb     1128 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1112:	39 d0                	cmp    %edx,%eax
    1114:	72 0c                	jb     1122 <free+0x32>
    1116:	39 c8                	cmp    %ecx,%eax
    1118:	72 0e                	jb     1128 <free+0x38>
    111a:	39 d1                	cmp    %edx,%ecx
    111c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1120:	72 06                	jb     1128 <free+0x38>
static Header base;
static Header *freep;

void
free(void *ap)
{
    1122:	89 d0                	mov    %edx,%eax
    1124:	eb e2                	jmp    1108 <free+0x18>
    1126:	66 90                	xchg   %ax,%ax

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    1128:	8b 73 fc             	mov    -0x4(%ebx),%esi
    112b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    112e:	39 d7                	cmp    %edx,%edi
    1130:	74 19                	je     114b <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1132:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1135:	8b 50 04             	mov    0x4(%eax),%edx
    1138:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    113b:	39 f1                	cmp    %esi,%ecx
    113d:	74 23                	je     1162 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    113f:	89 08                	mov    %ecx,(%eax)
  freep = p;
    1141:	a3 c4 19 00 00       	mov    %eax,0x19c4
}
    1146:	5b                   	pop    %ebx
    1147:	5e                   	pop    %esi
    1148:	5f                   	pop    %edi
    1149:	5d                   	pop    %ebp
    114a:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    114b:	03 72 04             	add    0x4(%edx),%esi
    114e:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1151:	8b 10                	mov    (%eax),%edx
    1153:	8b 12                	mov    (%edx),%edx
    1155:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1158:	8b 50 04             	mov    0x4(%eax),%edx
    115b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    115e:	39 f1                	cmp    %esi,%ecx
    1160:	75 dd                	jne    113f <free+0x4f>
    p->s.size += bp->s.size;
    1162:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    1165:	a3 c4 19 00 00       	mov    %eax,0x19c4
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    116a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    116d:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1170:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    1172:	5b                   	pop    %ebx
    1173:	5e                   	pop    %esi
    1174:	5f                   	pop    %edi
    1175:	5d                   	pop    %ebp
    1176:	c3                   	ret    
    1177:	89 f6                	mov    %esi,%esi
    1179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001180 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1180:	55                   	push   %ebp
    1181:	89 e5                	mov    %esp,%ebp
    1183:	57                   	push   %edi
    1184:	56                   	push   %esi
    1185:	53                   	push   %ebx
    1186:	83 ec 2c             	sub    $0x2c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1189:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
    118c:	8b 15 c4 19 00 00    	mov    0x19c4,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1192:	83 c3 07             	add    $0x7,%ebx
    1195:	c1 eb 03             	shr    $0x3,%ebx
    1198:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
    119b:	85 d2                	test   %edx,%edx
    119d:	0f 84 a3 00 00 00    	je     1246 <malloc+0xc6>
    11a3:	8b 02                	mov    (%edx),%eax
    11a5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    11a8:	39 d9                	cmp    %ebx,%ecx
    11aa:	73 74                	jae    1220 <malloc+0xa0>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    11ac:	8d 14 dd 00 00 00 00 	lea    0x0(,%ebx,8),%edx
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
    11b3:	bf 00 80 00 00       	mov    $0x8000,%edi
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    11b8:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    11bb:	eb 0c                	jmp    11c9 <malloc+0x49>
    11bd:	8d 76 00             	lea    0x0(%esi),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    11c0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    11c2:	8b 48 04             	mov    0x4(%eax),%ecx
    11c5:	39 cb                	cmp    %ecx,%ebx
    11c7:	76 57                	jbe    1220 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    11c9:	3b 05 c4 19 00 00    	cmp    0x19c4,%eax
    11cf:	89 c2                	mov    %eax,%edx
    11d1:	75 ed                	jne    11c0 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
    11d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    11d6:	81 fb 00 10 00 00    	cmp    $0x1000,%ebx
    11dc:	be 00 10 00 00       	mov    $0x1000,%esi
    11e1:	0f 43 f3             	cmovae %ebx,%esi
    11e4:	0f 42 c7             	cmovb  %edi,%eax
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    11e7:	89 04 24             	mov    %eax,(%esp)
    11ea:	e8 cd fc ff ff       	call   ebc <sbrk>
  if(p == (char*)-1)
    11ef:	83 f8 ff             	cmp    $0xffffffff,%eax
    11f2:	74 1c                	je     1210 <malloc+0x90>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    11f4:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    11f7:	83 c0 08             	add    $0x8,%eax
    11fa:	89 04 24             	mov    %eax,(%esp)
    11fd:	e8 ee fe ff ff       	call   10f0 <free>
  return freep;
    1202:	8b 15 c4 19 00 00    	mov    0x19c4,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    1208:	85 d2                	test   %edx,%edx
    120a:	75 b4                	jne    11c0 <malloc+0x40>
    120c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return 0;
  }
}
    1210:	83 c4 2c             	add    $0x2c,%esp
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
    1213:	31 c0                	xor    %eax,%eax
  }
}
    1215:	5b                   	pop    %ebx
    1216:	5e                   	pop    %esi
    1217:	5f                   	pop    %edi
    1218:	5d                   	pop    %ebp
    1219:	c3                   	ret    
    121a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    1220:	39 cb                	cmp    %ecx,%ebx
    1222:	74 1c                	je     1240 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    1224:	29 d9                	sub    %ebx,%ecx
    1226:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1229:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    122c:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
    122f:	89 15 c4 19 00 00    	mov    %edx,0x19c4
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    1235:	83 c4 2c             	add    $0x2c,%esp
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    1238:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    123b:	5b                   	pop    %ebx
    123c:	5e                   	pop    %esi
    123d:	5f                   	pop    %edi
    123e:	5d                   	pop    %ebp
    123f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    1240:	8b 08                	mov    (%eax),%ecx
    1242:	89 0a                	mov    %ecx,(%edx)
    1244:	eb e9                	jmp    122f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    1246:	c7 05 c4 19 00 00 c8 	movl   $0x19c8,0x19c4
    124d:	19 00 00 
    base.s.size = 0;
    1250:	b8 c8 19 00 00       	mov    $0x19c8,%eax
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    1255:	c7 05 c8 19 00 00 c8 	movl   $0x19c8,0x19c8
    125c:	19 00 00 
    base.s.size = 0;
    125f:	c7 05 cc 19 00 00 00 	movl   $0x0,0x19cc
    1266:	00 00 00 
    1269:	e9 3e ff ff ff       	jmp    11ac <malloc+0x2c>
