
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  close(fd);
}

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
  int i;

  if(argc < 2){
   6:	bb 01 00 00 00       	mov    $0x1,%ebx
  close(fd);
}

int
main(int argc, char *argv[])
{
   b:	83 e4 f0             	and    $0xfffffff0,%esp
   e:	83 ec 10             	sub    $0x10,%esp
  11:	8b 75 08             	mov    0x8(%ebp),%esi
  14:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  if(argc < 2){
  17:	83 fe 01             	cmp    $0x1,%esi
  1a:	7e 1b                	jle    37 <main+0x37>
  1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
  20:	8b 04 9f             	mov    (%edi,%ebx,4),%eax

  if(argc < 2){
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
  23:	83 c3 01             	add    $0x1,%ebx
    ls(argv[i]);
  26:	89 04 24             	mov    %eax,(%esp)
  29:	e8 c2 00 00 00       	call   f0 <ls>

  if(argc < 2){
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
  2e:	39 f3                	cmp    %esi,%ebx
  30:	75 ee                	jne    20 <main+0x20>
    ls(argv[i]);
  exit();
  32:	e8 5d 05 00 00       	call   594 <exit>
main(int argc, char *argv[])
{
  int i;

  if(argc < 2){
    ls(".");
  37:	c7 04 24 16 0a 00 00 	movl   $0xa16,(%esp)
  3e:	e8 ad 00 00 00       	call   f0 <ls>
    exit();
  43:	e8 4c 05 00 00       	call   594 <exit>
  48:	90                   	nop
  49:	90                   	nop
  4a:	90                   	nop
  4b:	90                   	nop
  4c:	90                   	nop
  4d:	90                   	nop
  4e:	90                   	nop
  4f:	90                   	nop

00000050 <fmtname>:
#include "user.h"
#include "fs.h"

char*
fmtname(char *path)
{
  50:	55                   	push   %ebp
  51:	89 e5                	mov    %esp,%ebp
  53:	56                   	push   %esi
  54:	53                   	push   %ebx
  55:	83 ec 10             	sub    $0x10,%esp
  58:	8b 5d 08             	mov    0x8(%ebp),%ebx
  static char buf[DIRSIZ+1];
  char *p;

  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
  5b:	89 1c 24             	mov    %ebx,(%esp)
  5e:	e8 8d 03 00 00       	call   3f0 <strlen>
  63:	01 d8                	add    %ebx,%eax
  65:	73 10                	jae    77 <fmtname+0x27>
  67:	eb 13                	jmp    7c <fmtname+0x2c>
  69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  70:	83 e8 01             	sub    $0x1,%eax
  73:	39 c3                	cmp    %eax,%ebx
  75:	77 05                	ja     7c <fmtname+0x2c>
  77:	80 38 2f             	cmpb   $0x2f,(%eax)
  7a:	75 f4                	jne    70 <fmtname+0x20>
    ;
  p++;
  7c:	8d 58 01             	lea    0x1(%eax),%ebx

  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
  7f:	89 1c 24             	mov    %ebx,(%esp)
  82:	e8 69 03 00 00       	call   3f0 <strlen>
  87:	83 f8 0d             	cmp    $0xd,%eax
  8a:	77 53                	ja     df <fmtname+0x8f>
    return p;
  memmove(buf, p, strlen(p));
  8c:	89 1c 24             	mov    %ebx,(%esp)
  8f:	e8 5c 03 00 00       	call   3f0 <strlen>
  94:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  98:	c7 04 24 34 0d 00 00 	movl   $0xd34,(%esp)
  9f:	89 44 24 08          	mov    %eax,0x8(%esp)
  a3:	e8 b8 04 00 00       	call   560 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  a8:	89 1c 24             	mov    %ebx,(%esp)
  ab:	e8 40 03 00 00       	call   3f0 <strlen>
  b0:	89 1c 24             	mov    %ebx,(%esp)
  return buf;
  b3:	bb 34 0d 00 00       	mov    $0xd34,%ebx

  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
    return p;
  memmove(buf, p, strlen(p));
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  b8:	89 c6                	mov    %eax,%esi
  ba:	e8 31 03 00 00       	call   3f0 <strlen>
  bf:	ba 0e 00 00 00       	mov    $0xe,%edx
  c4:	29 f2                	sub    %esi,%edx
  c6:	89 54 24 08          	mov    %edx,0x8(%esp)
  ca:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  d1:	00 
  d2:	05 34 0d 00 00       	add    $0xd34,%eax
  d7:	89 04 24             	mov    %eax,(%esp)
  da:	e8 31 03 00 00       	call   410 <memset>
  return buf;
}
  df:	83 c4 10             	add    $0x10,%esp
  e2:	89 d8                	mov    %ebx,%eax
  e4:	5b                   	pop    %ebx
  e5:	5e                   	pop    %esi
  e6:	5d                   	pop    %ebp
  e7:	c3                   	ret    
  e8:	90                   	nop
  e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000000f0 <ls>:

void
ls(char *path)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	57                   	push   %edi
  f4:	56                   	push   %esi
  f5:	53                   	push   %ebx
  f6:	81 ec 7c 02 00 00    	sub    $0x27c,%esp
  fc:	8b 7d 08             	mov    0x8(%ebp),%edi
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;

  if((fd = open(path, 0)) < 0){
  ff:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 106:	00 
 107:	89 3c 24             	mov    %edi,(%esp)
 10a:	e8 c5 04 00 00       	call   5d4 <open>
 10f:	85 c0                	test   %eax,%eax
 111:	89 c3                	mov    %eax,%ebx
 113:	0f 88 cf 01 00 00    	js     2e8 <ls+0x1f8>
    printf(2, "ls: cannot open %s\n", path);
    return;
  }

  if(fstat(fd, &st) < 0){
 119:	8d 75 c4             	lea    -0x3c(%ebp),%esi
 11c:	89 74 24 04          	mov    %esi,0x4(%esp)
 120:	89 04 24             	mov    %eax,(%esp)
 123:	e8 c4 04 00 00       	call   5ec <fstat>
 128:	85 c0                	test   %eax,%eax
 12a:	0f 88 08 02 00 00    	js     338 <ls+0x248>
    printf(2, "ls: cannot stat %s\n", path);
    close(fd);
    return;
  }

  switch(st.type){
 130:	0f b7 45 c4          	movzwl -0x3c(%ebp),%eax
 134:	66 83 f8 01          	cmp    $0x1,%ax
 138:	74 66                	je     1a0 <ls+0xb0>
 13a:	66 83 f8 02          	cmp    $0x2,%ax
 13e:	74 18                	je     158 <ls+0x68>
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    }
    break;
  }
  close(fd);
 140:	89 1c 24             	mov    %ebx,(%esp)
 143:	e8 74 04 00 00       	call   5bc <close>
}
 148:	81 c4 7c 02 00 00    	add    $0x27c,%esp
 14e:	5b                   	pop    %ebx
 14f:	5e                   	pop    %esi
 150:	5f                   	pop    %edi
 151:	5d                   	pop    %ebp
 152:	c3                   	ret    
 153:	90                   	nop
 154:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return;
  }

  switch(st.type){
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 158:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 15b:	8b 75 cc             	mov    -0x34(%ebp),%esi
 15e:	89 3c 24             	mov    %edi,(%esp)
 161:	89 95 a8 fd ff ff    	mov    %edx,-0x258(%ebp)
 167:	e8 e4 fe ff ff       	call   50 <fmtname>
 16c:	8b 95 a8 fd ff ff    	mov    -0x258(%ebp),%edx
 172:	89 74 24 10          	mov    %esi,0x10(%esp)
 176:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
 17d:	00 
 17e:	c7 44 24 04 f6 09 00 	movl   $0x9f6,0x4(%esp)
 185:	00 
 186:	89 54 24 14          	mov    %edx,0x14(%esp)
 18a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 191:	89 44 24 08          	mov    %eax,0x8(%esp)
 195:	e8 56 05 00 00       	call   6f0 <printf>
    break;
 19a:	eb a4                	jmp    140 <ls+0x50>
 19c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 1a0:	89 3c 24             	mov    %edi,(%esp)
 1a3:	e8 48 02 00 00       	call   3f0 <strlen>
 1a8:	83 c0 10             	add    $0x10,%eax
 1ab:	3d 00 02 00 00       	cmp    $0x200,%eax
 1b0:	0f 87 12 01 00 00    	ja     2c8 <ls+0x1d8>
      printf(1, "ls: path too long\n");
      break;
    }
    strcpy(buf, path);
 1b6:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 1bc:	89 7c 24 04          	mov    %edi,0x4(%esp)
 1c0:	8d 7d d8             	lea    -0x28(%ebp),%edi
 1c3:	89 04 24             	mov    %eax,(%esp)
 1c6:	e8 95 01 00 00       	call   360 <strcpy>
    p = buf+strlen(buf);
 1cb:	8d 95 c4 fd ff ff    	lea    -0x23c(%ebp),%edx
 1d1:	89 14 24             	mov    %edx,(%esp)
 1d4:	e8 17 02 00 00       	call   3f0 <strlen>
 1d9:	8d 8d c4 fd ff ff    	lea    -0x23c(%ebp),%ecx
 1df:	01 c1                	add    %eax,%ecx
 1e1:	89 8d b4 fd ff ff    	mov    %ecx,-0x24c(%ebp)
    *p++ = '/';
 1e7:	c6 01 2f             	movb   $0x2f,(%ecx)
 1ea:	83 c1 01             	add    $0x1,%ecx
 1ed:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
 1f3:	90                   	nop
 1f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1f8:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 1ff:	00 
 200:	89 7c 24 04          	mov    %edi,0x4(%esp)
 204:	89 1c 24             	mov    %ebx,(%esp)
 207:	e8 a0 03 00 00       	call   5ac <read>
 20c:	83 f8 10             	cmp    $0x10,%eax
 20f:	0f 85 2b ff ff ff    	jne    140 <ls+0x50>
      if(de.inum == 0)
 215:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
 21a:	74 dc                	je     1f8 <ls+0x108>
        continue;
      memmove(p, de.name, DIRSIZ);
 21c:	8b 95 ac fd ff ff    	mov    -0x254(%ebp),%edx
 222:	8d 45 da             	lea    -0x26(%ebp),%eax
 225:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
 22c:	00 
 22d:	89 44 24 04          	mov    %eax,0x4(%esp)
 231:	89 14 24             	mov    %edx,(%esp)
 234:	e8 27 03 00 00       	call   560 <memmove>
      p[DIRSIZ] = 0;
 239:	8b 8d b4 fd ff ff    	mov    -0x24c(%ebp),%ecx
      if(stat(buf, &st) < 0){
 23f:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
    *p++ = '/';
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
      if(de.inum == 0)
        continue;
      memmove(p, de.name, DIRSIZ);
      p[DIRSIZ] = 0;
 245:	c6 41 0f 00          	movb   $0x0,0xf(%ecx)
      if(stat(buf, &st) < 0){
 249:	89 74 24 04          	mov    %esi,0x4(%esp)
 24d:	89 04 24             	mov    %eax,(%esp)
 250:	e8 7b 02 00 00       	call   4d0 <stat>
 255:	85 c0                	test   %eax,%eax
 257:	0f 88 b3 00 00 00    	js     310 <ls+0x220>
        printf(1, "ls: cannot stat %s\n", buf);
        continue;
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 25d:	8b 55 cc             	mov    -0x34(%ebp),%edx
 260:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 266:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 269:	89 04 24             	mov    %eax,(%esp)
 26c:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
 272:	0f bf 55 c4          	movswl -0x3c(%ebp),%edx
 276:	89 8d a4 fd ff ff    	mov    %ecx,-0x25c(%ebp)
 27c:	89 95 a8 fd ff ff    	mov    %edx,-0x258(%ebp)
 282:	e8 c9 fd ff ff       	call   50 <fmtname>
 287:	8b 8d a4 fd ff ff    	mov    -0x25c(%ebp),%ecx
 28d:	8b 95 a8 fd ff ff    	mov    -0x258(%ebp),%edx
 293:	c7 44 24 04 f6 09 00 	movl   $0x9f6,0x4(%esp)
 29a:	00 
 29b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2a2:	89 4c 24 14          	mov    %ecx,0x14(%esp)
 2a6:	8b 8d b0 fd ff ff    	mov    -0x250(%ebp),%ecx
 2ac:	89 54 24 0c          	mov    %edx,0xc(%esp)
 2b0:	89 44 24 08          	mov    %eax,0x8(%esp)
 2b4:	89 4c 24 10          	mov    %ecx,0x10(%esp)
 2b8:	e8 33 04 00 00       	call   6f0 <printf>
 2bd:	e9 36 ff ff ff       	jmp    1f8 <ls+0x108>
 2c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
    break;

  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
      printf(1, "ls: path too long\n");
 2c8:	c7 44 24 04 03 0a 00 	movl   $0xa03,0x4(%esp)
 2cf:	00 
 2d0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2d7:	e8 14 04 00 00       	call   6f0 <printf>
      break;
 2dc:	e9 5f fe ff ff       	jmp    140 <ls+0x50>
 2e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  struct dirent de;
  struct stat st;

  if((fd = open(path, 0)) < 0){
    printf(2, "ls: cannot open %s\n", path);
 2e8:	89 7c 24 08          	mov    %edi,0x8(%esp)
 2ec:	c7 44 24 04 ce 09 00 	movl   $0x9ce,0x4(%esp)
 2f3:	00 
 2f4:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 2fb:	e8 f0 03 00 00       	call   6f0 <printf>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    }
    break;
  }
  close(fd);
}
 300:	81 c4 7c 02 00 00    	add    $0x27c,%esp
 306:	5b                   	pop    %ebx
 307:	5e                   	pop    %esi
 308:	5f                   	pop    %edi
 309:	5d                   	pop    %ebp
 30a:	c3                   	ret    
 30b:	90                   	nop
 30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(de.inum == 0)
        continue;
      memmove(p, de.name, DIRSIZ);
      p[DIRSIZ] = 0;
      if(stat(buf, &st) < 0){
        printf(1, "ls: cannot stat %s\n", buf);
 310:	8d 95 c4 fd ff ff    	lea    -0x23c(%ebp),%edx
 316:	89 54 24 08          	mov    %edx,0x8(%esp)
 31a:	c7 44 24 04 e2 09 00 	movl   $0x9e2,0x4(%esp)
 321:	00 
 322:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 329:	e8 c2 03 00 00       	call   6f0 <printf>
        continue;
 32e:	e9 c5 fe ff ff       	jmp    1f8 <ls+0x108>
 333:	90                   	nop
 334:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(2, "ls: cannot open %s\n", path);
    return;
  }

  if(fstat(fd, &st) < 0){
    printf(2, "ls: cannot stat %s\n", path);
 338:	89 7c 24 08          	mov    %edi,0x8(%esp)
 33c:	c7 44 24 04 e2 09 00 	movl   $0x9e2,0x4(%esp)
 343:	00 
 344:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 34b:	e8 a0 03 00 00       	call   6f0 <printf>
    close(fd);
 350:	89 1c 24             	mov    %ebx,(%esp)
 353:	e8 64 02 00 00       	call   5bc <close>
    return;
 358:	e9 eb fd ff ff       	jmp    148 <ls+0x58>
 35d:	90                   	nop
 35e:	90                   	nop
 35f:	90                   	nop

00000360 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 360:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 361:	31 d2                	xor    %edx,%edx
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 363:	89 e5                	mov    %esp,%ebp
 365:	8b 45 08             	mov    0x8(%ebp),%eax
 368:	53                   	push   %ebx
 369:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 36c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 370:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 374:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 377:	83 c2 01             	add    $0x1,%edx
 37a:	84 c9                	test   %cl,%cl
 37c:	75 f2                	jne    370 <strcpy+0x10>
    ;
  return os;
}
 37e:	5b                   	pop    %ebx
 37f:	5d                   	pop    %ebp
 380:	c3                   	ret    
 381:	eb 0d                	jmp    390 <strcmp>
 383:	90                   	nop
 384:	90                   	nop
 385:	90                   	nop
 386:	90                   	nop
 387:	90                   	nop
 388:	90                   	nop
 389:	90                   	nop
 38a:	90                   	nop
 38b:	90                   	nop
 38c:	90                   	nop
 38d:	90                   	nop
 38e:	90                   	nop
 38f:	90                   	nop

00000390 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	8b 4d 08             	mov    0x8(%ebp),%ecx
 396:	56                   	push   %esi
 397:	8b 55 0c             	mov    0xc(%ebp),%edx
 39a:	53                   	push   %ebx
  while(*p && *p == *q)
 39b:	0f b6 01             	movzbl (%ecx),%eax
 39e:	0f b6 1a             	movzbl (%edx),%ebx
 3a1:	84 c0                	test   %al,%al
 3a3:	74 23                	je     3c8 <strcmp+0x38>
 3a5:	38 d8                	cmp    %bl,%al
 3a7:	74 10                	je     3b9 <strcmp+0x29>
 3a9:	eb 2d                	jmp    3d8 <strcmp+0x48>
 3ab:	90                   	nop
 3ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3b0:	83 c1 01             	add    $0x1,%ecx
 3b3:	38 d8                	cmp    %bl,%al
 3b5:	75 21                	jne    3d8 <strcmp+0x48>
    p++, q++;
 3b7:	89 f2                	mov    %esi,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3b9:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 3bd:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3c0:	0f b6 5a 01          	movzbl 0x1(%edx),%ebx
 3c4:	84 c0                	test   %al,%al
 3c6:	75 e8                	jne    3b0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 3c8:	0f b6 db             	movzbl %bl,%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3cb:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 3cd:	29 d8                	sub    %ebx,%eax
}
 3cf:	5b                   	pop    %ebx
 3d0:	5e                   	pop    %esi
 3d1:	5d                   	pop    %ebp
 3d2:	c3                   	ret    
 3d3:	90                   	nop
 3d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 3d8:	0f b6 db             	movzbl %bl,%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3db:	0f b6 c0             	movzbl %al,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 3de:	29 d8                	sub    %ebx,%eax
}
 3e0:	5b                   	pop    %ebx
 3e1:	5e                   	pop    %esi
 3e2:	5d                   	pop    %ebp
 3e3:	c3                   	ret    
 3e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000003f0 <strlen>:

uint
strlen(const char *s)
{
 3f0:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
 3f1:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
 3f3:	89 e5                	mov    %esp,%ebp
 3f5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3f8:	80 39 00             	cmpb   $0x0,(%ecx)
 3fb:	74 0e                	je     40b <strlen+0x1b>
 3fd:	31 d2                	xor    %edx,%edx
 3ff:	90                   	nop
 400:	83 c2 01             	add    $0x1,%edx
 403:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 407:	89 d0                	mov    %edx,%eax
 409:	75 f5                	jne    400 <strlen+0x10>
    ;
  return n;
}
 40b:	5d                   	pop    %ebp
 40c:	c3                   	ret    
 40d:	8d 76 00             	lea    0x0(%esi),%esi

00000410 <memset>:

void*
memset(void *dst, int c, uint n)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	8b 55 08             	mov    0x8(%ebp),%edx
 416:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 417:	8b 4d 10             	mov    0x10(%ebp),%ecx
 41a:	8b 45 0c             	mov    0xc(%ebp),%eax
 41d:	89 d7                	mov    %edx,%edi
 41f:	fc                   	cld    
 420:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 422:	89 d0                	mov    %edx,%eax
 424:	5f                   	pop    %edi
 425:	5d                   	pop    %ebp
 426:	c3                   	ret    
 427:	89 f6                	mov    %esi,%esi
 429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000430 <strchr>:

char*
strchr(const char *s, char c)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	8b 45 08             	mov    0x8(%ebp),%eax
 436:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 43a:	0f b6 10             	movzbl (%eax),%edx
 43d:	84 d2                	test   %dl,%dl
 43f:	75 12                	jne    453 <strchr+0x23>
 441:	eb 1d                	jmp    460 <strchr+0x30>
 443:	90                   	nop
 444:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 448:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 44c:	84 d2                	test   %dl,%dl
 44e:	74 10                	je     460 <strchr+0x30>
 450:	83 c0 01             	add    $0x1,%eax
    if(*s == c)
 453:	38 ca                	cmp    %cl,%dl
 455:	75 f1                	jne    448 <strchr+0x18>
      return (char*)s;
  return 0;
}
 457:	5d                   	pop    %ebp
 458:	c3                   	ret    
 459:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 460:	31 c0                	xor    %eax,%eax
}
 462:	5d                   	pop    %ebp
 463:	c3                   	ret    
 464:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 46a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000470 <gets>:

char*
gets(char *buf, int max)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	57                   	push   %edi
 474:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 475:	31 f6                	xor    %esi,%esi
  return 0;
}

char*
gets(char *buf, int max)
{
 477:	53                   	push   %ebx
 478:	83 ec 2c             	sub    $0x2c,%esp
 47b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 47e:	eb 31                	jmp    4b1 <gets+0x41>
    cc = read(0, &c, 1);
 480:	8d 45 e7             	lea    -0x19(%ebp),%eax
 483:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 48a:	00 
 48b:	89 44 24 04          	mov    %eax,0x4(%esp)
 48f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 496:	e8 11 01 00 00       	call   5ac <read>
    if(cc < 1)
 49b:	85 c0                	test   %eax,%eax
 49d:	7e 1a                	jle    4b9 <gets+0x49>
      break;
    buf[i++] = c;
 49f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4a3:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 4a5:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 4a7:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 4ab:	74 0c                	je     4b9 <gets+0x49>
 4ad:	3c 0a                	cmp    $0xa,%al
 4af:	74 08                	je     4b9 <gets+0x49>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4b1:	8d 5e 01             	lea    0x1(%esi),%ebx
 4b4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4b7:	7c c7                	jl     480 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 4b9:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 4bd:	83 c4 2c             	add    $0x2c,%esp
 4c0:	89 f8                	mov    %edi,%eax
 4c2:	5b                   	pop    %ebx
 4c3:	5e                   	pop    %esi
 4c4:	5f                   	pop    %edi
 4c5:	5d                   	pop    %ebp
 4c6:	c3                   	ret    
 4c7:	89 f6                	mov    %esi,%esi
 4c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4d6:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(const char *n, struct stat *st)
{
 4d9:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 4dc:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 4df:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4e4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 4eb:	00 
 4ec:	89 04 24             	mov    %eax,(%esp)
 4ef:	e8 e0 00 00 00       	call   5d4 <open>
  if(fd < 0)
 4f4:	85 c0                	test   %eax,%eax
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4f6:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 4f8:	78 19                	js     513 <stat+0x43>
    return -1;
  r = fstat(fd, st);
 4fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 4fd:	89 1c 24             	mov    %ebx,(%esp)
 500:	89 44 24 04          	mov    %eax,0x4(%esp)
 504:	e8 e3 00 00 00       	call   5ec <fstat>
  close(fd);
 509:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 50c:	89 c6                	mov    %eax,%esi
  close(fd);
 50e:	e8 a9 00 00 00       	call   5bc <close>
  return r;
}
 513:	89 f0                	mov    %esi,%eax
 515:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 518:	8b 75 fc             	mov    -0x4(%ebp),%esi
 51b:	89 ec                	mov    %ebp,%esp
 51d:	5d                   	pop    %ebp
 51e:	c3                   	ret    
 51f:	90                   	nop

00000520 <atoi>:

int
atoi(const char *s)
{
 520:	55                   	push   %ebp
  int n;

  n = 0;
 521:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
 523:	89 e5                	mov    %esp,%ebp
 525:	8b 4d 08             	mov    0x8(%ebp),%ecx
 528:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 529:	0f b6 11             	movzbl (%ecx),%edx
 52c:	8d 5a d0             	lea    -0x30(%edx),%ebx
 52f:	80 fb 09             	cmp    $0x9,%bl
 532:	77 1c                	ja     550 <atoi+0x30>
 534:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 538:	0f be d2             	movsbl %dl,%edx
 53b:	83 c1 01             	add    $0x1,%ecx
 53e:	8d 04 80             	lea    (%eax,%eax,4),%eax
 541:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 545:	0f b6 11             	movzbl (%ecx),%edx
 548:	8d 5a d0             	lea    -0x30(%edx),%ebx
 54b:	80 fb 09             	cmp    $0x9,%bl
 54e:	76 e8                	jbe    538 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 550:	5b                   	pop    %ebx
 551:	5d                   	pop    %ebp
 552:	c3                   	ret    
 553:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 559:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000560 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	56                   	push   %esi
 564:	8b 45 08             	mov    0x8(%ebp),%eax
 567:	53                   	push   %ebx
 568:	8b 5d 10             	mov    0x10(%ebp),%ebx
 56b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 56e:	85 db                	test   %ebx,%ebx
 570:	7e 14                	jle    586 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, const void *vsrc, int n)
 572:	31 d2                	xor    %edx,%edx
 574:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 578:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 57c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 57f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 582:	39 da                	cmp    %ebx,%edx
 584:	75 f2                	jne    578 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 586:	5b                   	pop    %ebx
 587:	5e                   	pop    %esi
 588:	5d                   	pop    %ebp
 589:	c3                   	ret    
 58a:	90                   	nop
 58b:	90                   	nop

0000058c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 58c:	b8 01 00 00 00       	mov    $0x1,%eax
 591:	cd 40                	int    $0x40
 593:	c3                   	ret    

00000594 <exit>:
SYSCALL(exit)
 594:	b8 02 00 00 00       	mov    $0x2,%eax
 599:	cd 40                	int    $0x40
 59b:	c3                   	ret    

0000059c <wait>:
SYSCALL(wait)
 59c:	b8 03 00 00 00       	mov    $0x3,%eax
 5a1:	cd 40                	int    $0x40
 5a3:	c3                   	ret    

000005a4 <pipe>:
SYSCALL(pipe)
 5a4:	b8 04 00 00 00       	mov    $0x4,%eax
 5a9:	cd 40                	int    $0x40
 5ab:	c3                   	ret    

000005ac <read>:
SYSCALL(read)
 5ac:	b8 05 00 00 00       	mov    $0x5,%eax
 5b1:	cd 40                	int    $0x40
 5b3:	c3                   	ret    

000005b4 <write>:
SYSCALL(write)
 5b4:	b8 10 00 00 00       	mov    $0x10,%eax
 5b9:	cd 40                	int    $0x40
 5bb:	c3                   	ret    

000005bc <close>:
SYSCALL(close)
 5bc:	b8 15 00 00 00       	mov    $0x15,%eax
 5c1:	cd 40                	int    $0x40
 5c3:	c3                   	ret    

000005c4 <kill>:
SYSCALL(kill)
 5c4:	b8 06 00 00 00       	mov    $0x6,%eax
 5c9:	cd 40                	int    $0x40
 5cb:	c3                   	ret    

000005cc <exec>:
SYSCALL(exec)
 5cc:	b8 07 00 00 00       	mov    $0x7,%eax
 5d1:	cd 40                	int    $0x40
 5d3:	c3                   	ret    

000005d4 <open>:
SYSCALL(open)
 5d4:	b8 0f 00 00 00       	mov    $0xf,%eax
 5d9:	cd 40                	int    $0x40
 5db:	c3                   	ret    

000005dc <mknod>:
SYSCALL(mknod)
 5dc:	b8 11 00 00 00       	mov    $0x11,%eax
 5e1:	cd 40                	int    $0x40
 5e3:	c3                   	ret    

000005e4 <unlink>:
SYSCALL(unlink)
 5e4:	b8 12 00 00 00       	mov    $0x12,%eax
 5e9:	cd 40                	int    $0x40
 5eb:	c3                   	ret    

000005ec <fstat>:
SYSCALL(fstat)
 5ec:	b8 08 00 00 00       	mov    $0x8,%eax
 5f1:	cd 40                	int    $0x40
 5f3:	c3                   	ret    

000005f4 <link>:
SYSCALL(link)
 5f4:	b8 13 00 00 00       	mov    $0x13,%eax
 5f9:	cd 40                	int    $0x40
 5fb:	c3                   	ret    

000005fc <mkdir>:
SYSCALL(mkdir)
 5fc:	b8 14 00 00 00       	mov    $0x14,%eax
 601:	cd 40                	int    $0x40
 603:	c3                   	ret    

00000604 <chdir>:
SYSCALL(chdir)
 604:	b8 09 00 00 00       	mov    $0x9,%eax
 609:	cd 40                	int    $0x40
 60b:	c3                   	ret    

0000060c <dup>:
SYSCALL(dup)
 60c:	b8 0a 00 00 00       	mov    $0xa,%eax
 611:	cd 40                	int    $0x40
 613:	c3                   	ret    

00000614 <getpid>:
SYSCALL(getpid)
 614:	b8 0b 00 00 00       	mov    $0xb,%eax
 619:	cd 40                	int    $0x40
 61b:	c3                   	ret    

0000061c <sbrk>:
SYSCALL(sbrk)
 61c:	b8 0c 00 00 00       	mov    $0xc,%eax
 621:	cd 40                	int    $0x40
 623:	c3                   	ret    

00000624 <sleep>:
SYSCALL(sleep)
 624:	b8 0d 00 00 00       	mov    $0xd,%eax
 629:	cd 40                	int    $0x40
 62b:	c3                   	ret    

0000062c <uptime>:
SYSCALL(uptime)
 62c:	b8 0e 00 00 00       	mov    $0xe,%eax
 631:	cd 40                	int    $0x40
 633:	c3                   	ret    
 634:	90                   	nop
 635:	90                   	nop
 636:	90                   	nop
 637:	90                   	nop
 638:	90                   	nop
 639:	90                   	nop
 63a:	90                   	nop
 63b:	90                   	nop
 63c:	90                   	nop
 63d:	90                   	nop
 63e:	90                   	nop
 63f:	90                   	nop

00000640 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	83 ec 28             	sub    $0x28,%esp
 646:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 649:	8d 55 f4             	lea    -0xc(%ebp),%edx
 64c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 653:	00 
 654:	89 54 24 04          	mov    %edx,0x4(%esp)
 658:	89 04 24             	mov    %eax,(%esp)
 65b:	e8 54 ff ff ff       	call   5b4 <write>
}
 660:	c9                   	leave  
 661:	c3                   	ret    
 662:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000670 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	57                   	push   %edi
 674:	56                   	push   %esi
 675:	89 c6                	mov    %eax,%esi
 677:	53                   	push   %ebx
 678:	83 ec 1c             	sub    $0x1c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 67b:	8b 45 08             	mov    0x8(%ebp),%eax
 67e:	85 c0                	test   %eax,%eax
 680:	74 5e                	je     6e0 <printint+0x70>
 682:	89 d0                	mov    %edx,%eax
 684:	c1 e8 1f             	shr    $0x1f,%eax
 687:	84 c0                	test   %al,%al
 689:	74 55                	je     6e0 <printint+0x70>
    neg = 1;
    x = -xx;
 68b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 68d:	bf 01 00 00 00       	mov    $0x1,%edi
    x = -xx;
 692:	f7 d8                	neg    %eax
  } else {
    x = xx;
  }

  i = 0;
 694:	31 db                	xor    %ebx,%ebx
 696:	eb 02                	jmp    69a <printint+0x2a>
  do{
    buf[i++] = digits[x % base];
 698:	89 d3                	mov    %edx,%ebx
 69a:	31 d2                	xor    %edx,%edx
 69c:	f7 f1                	div    %ecx
 69e:	0f b6 92 1f 0a 00 00 	movzbl 0xa1f(%edx),%edx
  }while((x /= base) != 0);
 6a5:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 6a7:	88 54 1d d8          	mov    %dl,-0x28(%ebp,%ebx,1)
 6ab:	8d 53 01             	lea    0x1(%ebx),%edx
  }while((x /= base) != 0);
 6ae:	75 e8                	jne    698 <printint+0x28>
  if(neg)
 6b0:	85 ff                	test   %edi,%edi
 6b2:	74 08                	je     6bc <printint+0x4c>
    buf[i++] = '-';
 6b4:	c6 44 15 d8 2d       	movb   $0x2d,-0x28(%ebp,%edx,1)
 6b9:	8d 53 02             	lea    0x2(%ebx),%edx

  while(--i >= 0)
 6bc:	8d 5a ff             	lea    -0x1(%edx),%ebx
 6bf:	90                   	nop
    putc(fd, buf[i]);
 6c0:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 6c5:	89 f0                	mov    %esi,%eax
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 6c7:	83 eb 01             	sub    $0x1,%ebx
    putc(fd, buf[i]);
 6ca:	e8 71 ff ff ff       	call   640 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 6cf:	83 fb ff             	cmp    $0xffffffff,%ebx
 6d2:	75 ec                	jne    6c0 <printint+0x50>
    putc(fd, buf[i]);
}
 6d4:	83 c4 1c             	add    $0x1c,%esp
 6d7:	5b                   	pop    %ebx
 6d8:	5e                   	pop    %esi
 6d9:	5f                   	pop    %edi
 6da:	5d                   	pop    %ebp
 6db:	c3                   	ret    
 6dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 6e0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 6e2:	31 ff                	xor    %edi,%edi
 6e4:	eb ae                	jmp    694 <printint+0x24>
 6e6:	8d 76 00             	lea    0x0(%esi),%esi
 6e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006f0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6f0:	55                   	push   %ebp
 6f1:	89 e5                	mov    %esp,%ebp
 6f3:	57                   	push   %edi
 6f4:	56                   	push   %esi
 6f5:	53                   	push   %ebx
 6f6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 6fc:	0f b6 0b             	movzbl (%ebx),%ecx
 6ff:	84 c9                	test   %cl,%cl
 701:	0f 84 89 00 00 00    	je     790 <printf+0xa0>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 707:	8d 45 10             	lea    0x10(%ebp),%eax
{
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 70a:	31 f6                	xor    %esi,%esi
  ap = (uint*)(void*)&fmt + 1;
 70c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 70f:	eb 21                	jmp    732 <printf+0x42>
 711:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 718:	83 f9 25             	cmp    $0x25,%ecx
 71b:	74 7b                	je     798 <printf+0xa8>
        state = '%';
      } else {
        putc(fd, c);
 71d:	8b 45 08             	mov    0x8(%ebp),%eax
 720:	0f be d1             	movsbl %cl,%edx
 723:	e8 18 ff ff ff       	call   640 <putc>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 728:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 72b:	0f b6 0b             	movzbl (%ebx),%ecx
 72e:	84 c9                	test   %cl,%cl
 730:	74 5e                	je     790 <printf+0xa0>
    c = fmt[i] & 0xff;
    if(state == 0){
 732:	85 f6                	test   %esi,%esi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 734:	0f b6 c9             	movzbl %cl,%ecx
    if(state == 0){
 737:	74 df                	je     718 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 739:	83 fe 25             	cmp    $0x25,%esi
 73c:	75 ea                	jne    728 <printf+0x38>
      if(c == 'd'){
 73e:	83 f9 64             	cmp    $0x64,%ecx
 741:	0f 84 c9 00 00 00    	je     810 <printf+0x120>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 747:	83 f9 70             	cmp    $0x70,%ecx
 74a:	74 54                	je     7a0 <printf+0xb0>
 74c:	83 f9 78             	cmp    $0x78,%ecx
 74f:	90                   	nop
 750:	74 4e                	je     7a0 <printf+0xb0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 752:	83 f9 73             	cmp    $0x73,%ecx
 755:	74 71                	je     7c8 <printf+0xd8>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 757:	83 f9 63             	cmp    $0x63,%ecx
 75a:	0f 84 d2 00 00 00    	je     832 <printf+0x142>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 760:	83 f9 25             	cmp    $0x25,%ecx
        putc(fd, c);
 763:	ba 25 00 00 00       	mov    $0x25,%edx
 768:	8b 45 08             	mov    0x8(%ebp),%eax
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 76b:	74 11                	je     77e <printf+0x8e>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 76d:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 770:	e8 cb fe ff ff       	call   640 <putc>
        putc(fd, c);
 775:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 778:	8b 45 08             	mov    0x8(%ebp),%eax
 77b:	0f be d1             	movsbl %cl,%edx
 77e:	83 c3 01             	add    $0x1,%ebx
      }
      state = 0;
 781:	31 f6                	xor    %esi,%esi
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 783:	e8 b8 fe ff ff       	call   640 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 788:	0f b6 0b             	movzbl (%ebx),%ecx
 78b:	84 c9                	test   %cl,%cl
 78d:	75 a3                	jne    732 <printf+0x42>
 78f:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 790:	83 c4 2c             	add    $0x2c,%esp
 793:	5b                   	pop    %ebx
 794:	5e                   	pop    %esi
 795:	5f                   	pop    %edi
 796:	5d                   	pop    %ebp
 797:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 798:	be 25 00 00 00       	mov    $0x25,%esi
 79d:	eb 89                	jmp    728 <printf+0x38>
 79f:	90                   	nop
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 7a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7a3:	b9 10 00 00 00       	mov    $0x10,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7a8:	31 f6                	xor    %esi,%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 7aa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 7b1:	8b 10                	mov    (%eax),%edx
 7b3:	8b 45 08             	mov    0x8(%ebp),%eax
 7b6:	e8 b5 fe ff ff       	call   670 <printint>
        ap++;
 7bb:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 7bf:	e9 64 ff ff ff       	jmp    728 <printf+0x38>
 7c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 7c8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7cb:	8b 38                	mov    (%eax),%edi
        ap++;
 7cd:	83 c0 04             	add    $0x4,%eax
 7d0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
          s = "(null)";
 7d3:	b8 18 0a 00 00       	mov    $0xa18,%eax
 7d8:	85 ff                	test   %edi,%edi
 7da:	0f 44 f8             	cmove  %eax,%edi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7dd:	31 f6                	xor    %esi,%esi
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 7df:	0f b6 17             	movzbl (%edi),%edx
 7e2:	84 d2                	test   %dl,%dl
 7e4:	0f 84 3e ff ff ff    	je     728 <printf+0x38>
 7ea:	89 de                	mov    %ebx,%esi
 7ec:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7ef:	90                   	nop
          putc(fd, *s);
 7f0:	0f be d2             	movsbl %dl,%edx
          s++;
 7f3:	83 c7 01             	add    $0x1,%edi
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
 7f6:	89 d8                	mov    %ebx,%eax
 7f8:	e8 43 fe ff ff       	call   640 <putc>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 7fd:	0f b6 17             	movzbl (%edi),%edx
 800:	84 d2                	test   %dl,%dl
 802:	75 ec                	jne    7f0 <printf+0x100>
 804:	89 f3                	mov    %esi,%ebx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 806:	31 f6                	xor    %esi,%esi
 808:	e9 1b ff ff ff       	jmp    728 <printf+0x38>
 80d:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 810:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 813:	b1 0a                	mov    $0xa,%cl
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 815:	66 31 f6             	xor    %si,%si
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 818:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 81f:	8b 10                	mov    (%eax),%edx
 821:	8b 45 08             	mov    0x8(%ebp),%eax
 824:	e8 47 fe ff ff       	call   670 <printint>
        ap++;
 829:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 82d:	e9 f6 fe ff ff       	jmp    728 <printf+0x38>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 832:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 835:	31 f6                	xor    %esi,%esi
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 837:	0f be 10             	movsbl (%eax),%edx
 83a:	8b 45 08             	mov    0x8(%ebp),%eax
 83d:	e8 fe fd ff ff       	call   640 <putc>
        ap++;
 842:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 846:	e9 dd fe ff ff       	jmp    728 <printf+0x38>
 84b:	90                   	nop
 84c:	90                   	nop
 84d:	90                   	nop
 84e:	90                   	nop
 84f:	90                   	nop

00000850 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 850:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 851:	a1 44 0d 00 00       	mov    0xd44,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 856:	89 e5                	mov    %esp,%ebp
 858:	57                   	push   %edi
 859:	56                   	push   %esi
 85a:	53                   	push   %ebx
 85b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 85e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 861:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 868:	39 c8                	cmp    %ecx,%eax
 86a:	8b 10                	mov    (%eax),%edx
 86c:	73 04                	jae    872 <free+0x22>
 86e:	39 d1                	cmp    %edx,%ecx
 870:	72 16                	jb     888 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 872:	39 d0                	cmp    %edx,%eax
 874:	72 0c                	jb     882 <free+0x32>
 876:	39 c8                	cmp    %ecx,%eax
 878:	72 0e                	jb     888 <free+0x38>
 87a:	39 d1                	cmp    %edx,%ecx
 87c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 880:	72 06                	jb     888 <free+0x38>
static Header base;
static Header *freep;

void
free(void *ap)
{
 882:	89 d0                	mov    %edx,%eax
 884:	eb e2                	jmp    868 <free+0x18>
 886:	66 90                	xchg   %ax,%ax

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 888:	8b 73 fc             	mov    -0x4(%ebx),%esi
 88b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 88e:	39 d7                	cmp    %edx,%edi
 890:	74 19                	je     8ab <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 892:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 895:	8b 50 04             	mov    0x4(%eax),%edx
 898:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 89b:	39 f1                	cmp    %esi,%ecx
 89d:	74 23                	je     8c2 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 89f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8a1:	a3 44 0d 00 00       	mov    %eax,0xd44
}
 8a6:	5b                   	pop    %ebx
 8a7:	5e                   	pop    %esi
 8a8:	5f                   	pop    %edi
 8a9:	5d                   	pop    %ebp
 8aa:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 8ab:	03 72 04             	add    0x4(%edx),%esi
 8ae:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8b1:	8b 10                	mov    (%eax),%edx
 8b3:	8b 12                	mov    (%edx),%edx
 8b5:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 8b8:	8b 50 04             	mov    0x4(%eax),%edx
 8bb:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8be:	39 f1                	cmp    %esi,%ecx
 8c0:	75 dd                	jne    89f <free+0x4f>
    p->s.size += bp->s.size;
 8c2:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 8c5:	a3 44 0d 00 00       	mov    %eax,0xd44
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 8ca:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8cd:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8d0:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 8d2:	5b                   	pop    %ebx
 8d3:	5e                   	pop    %esi
 8d4:	5f                   	pop    %edi
 8d5:	5d                   	pop    %ebp
 8d6:	c3                   	ret    
 8d7:	89 f6                	mov    %esi,%esi
 8d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000008e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8e0:	55                   	push   %ebp
 8e1:	89 e5                	mov    %esp,%ebp
 8e3:	57                   	push   %edi
 8e4:	56                   	push   %esi
 8e5:	53                   	push   %ebx
 8e6:	83 ec 2c             	sub    $0x2c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8e9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 8ec:	8b 15 44 0d 00 00    	mov    0xd44,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8f2:	83 c3 07             	add    $0x7,%ebx
 8f5:	c1 eb 03             	shr    $0x3,%ebx
 8f8:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8fb:	85 d2                	test   %edx,%edx
 8fd:	0f 84 a3 00 00 00    	je     9a6 <malloc+0xc6>
 903:	8b 02                	mov    (%edx),%eax
 905:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 908:	39 d9                	cmp    %ebx,%ecx
 90a:	73 74                	jae    980 <malloc+0xa0>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 90c:	8d 14 dd 00 00 00 00 	lea    0x0(,%ebx,8),%edx
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 913:	bf 00 80 00 00       	mov    $0x8000,%edi
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 918:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 91b:	eb 0c                	jmp    929 <malloc+0x49>
 91d:	8d 76 00             	lea    0x0(%esi),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 920:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 922:	8b 48 04             	mov    0x4(%eax),%ecx
 925:	39 cb                	cmp    %ecx,%ebx
 927:	76 57                	jbe    980 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 929:	3b 05 44 0d 00 00    	cmp    0xd44,%eax
 92f:	89 c2                	mov    %eax,%edx
 931:	75 ed                	jne    920 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 933:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 936:	81 fb 00 10 00 00    	cmp    $0x1000,%ebx
 93c:	be 00 10 00 00       	mov    $0x1000,%esi
 941:	0f 43 f3             	cmovae %ebx,%esi
 944:	0f 42 c7             	cmovb  %edi,%eax
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 947:	89 04 24             	mov    %eax,(%esp)
 94a:	e8 cd fc ff ff       	call   61c <sbrk>
  if(p == (char*)-1)
 94f:	83 f8 ff             	cmp    $0xffffffff,%eax
 952:	74 1c                	je     970 <malloc+0x90>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 954:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 957:	83 c0 08             	add    $0x8,%eax
 95a:	89 04 24             	mov    %eax,(%esp)
 95d:	e8 ee fe ff ff       	call   850 <free>
  return freep;
 962:	8b 15 44 0d 00 00    	mov    0xd44,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 968:	85 d2                	test   %edx,%edx
 96a:	75 b4                	jne    920 <malloc+0x40>
 96c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return 0;
  }
}
 970:	83 c4 2c             	add    $0x2c,%esp
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
 973:	31 c0                	xor    %eax,%eax
  }
}
 975:	5b                   	pop    %ebx
 976:	5e                   	pop    %esi
 977:	5f                   	pop    %edi
 978:	5d                   	pop    %ebp
 979:	c3                   	ret    
 97a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 980:	39 cb                	cmp    %ecx,%ebx
 982:	74 1c                	je     9a0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 984:	29 d9                	sub    %ebx,%ecx
 986:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 989:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 98c:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 98f:	89 15 44 0d 00 00    	mov    %edx,0xd44
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 995:	83 c4 2c             	add    $0x2c,%esp
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 998:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 99b:	5b                   	pop    %ebx
 99c:	5e                   	pop    %esi
 99d:	5f                   	pop    %edi
 99e:	5d                   	pop    %ebp
 99f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 9a0:	8b 08                	mov    (%eax),%ecx
 9a2:	89 0a                	mov    %ecx,(%edx)
 9a4:	eb e9                	jmp    98f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 9a6:	c7 05 44 0d 00 00 48 	movl   $0xd48,0xd44
 9ad:	0d 00 00 
    base.s.size = 0;
 9b0:	b8 48 0d 00 00       	mov    $0xd48,%eax
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 9b5:	c7 05 48 0d 00 00 48 	movl   $0xd48,0xd48
 9bc:	0d 00 00 
    base.s.size = 0;
 9bf:	c7 05 4c 0d 00 00 00 	movl   $0x0,0xd4c
 9c6:	00 00 00 
 9c9:	e9 3e ff ff ff       	jmp    90c <malloc+0x2c>
