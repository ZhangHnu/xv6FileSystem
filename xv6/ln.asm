
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	83 ec 10             	sub    $0x10,%esp
   a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(argc != 3){
   d:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
  11:	74 19                	je     2c <main+0x2c>
    printf(2, "Usage: ln old new\n");
  13:	c7 44 24 04 de 06 00 	movl   $0x6de,0x4(%esp)
  1a:	00 
  1b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  22:	e8 d9 03 00 00       	call   400 <printf>
    exit();
  27:	e8 78 02 00 00       	call   2a4 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2c:	8b 43 08             	mov    0x8(%ebx),%eax
  2f:	89 44 24 04          	mov    %eax,0x4(%esp)
  33:	8b 43 04             	mov    0x4(%ebx),%eax
  36:	89 04 24             	mov    %eax,(%esp)
  39:	e8 c6 02 00 00       	call   304 <link>
  3e:	85 c0                	test   %eax,%eax
  40:	78 05                	js     47 <main+0x47>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  42:	e8 5d 02 00 00       	call   2a4 <exit>
  if(argc != 3){
    printf(2, "Usage: ln old new\n");
    exit();
  }
  if(link(argv[1], argv[2]) < 0)
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  47:	8b 43 08             	mov    0x8(%ebx),%eax
  4a:	89 44 24 0c          	mov    %eax,0xc(%esp)
  4e:	8b 43 04             	mov    0x4(%ebx),%eax
  51:	c7 44 24 04 f1 06 00 	movl   $0x6f1,0x4(%esp)
  58:	00 
  59:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  60:	89 44 24 08          	mov    %eax,0x8(%esp)
  64:	e8 97 03 00 00       	call   400 <printf>
  69:	eb d7                	jmp    42 <main+0x42>
  6b:	90                   	nop
  6c:	90                   	nop
  6d:	90                   	nop
  6e:	90                   	nop
  6f:	90                   	nop

00000070 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  70:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  71:	31 d2                	xor    %edx,%edx
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  73:	89 e5                	mov    %esp,%ebp
  75:	8b 45 08             	mov    0x8(%ebp),%eax
  78:	53                   	push   %ebx
  79:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  80:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
  84:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  87:	83 c2 01             	add    $0x1,%edx
  8a:	84 c9                	test   %cl,%cl
  8c:	75 f2                	jne    80 <strcpy+0x10>
    ;
  return os;
}
  8e:	5b                   	pop    %ebx
  8f:	5d                   	pop    %ebp
  90:	c3                   	ret    
  91:	eb 0d                	jmp    a0 <strcmp>
  93:	90                   	nop
  94:	90                   	nop
  95:	90                   	nop
  96:	90                   	nop
  97:	90                   	nop
  98:	90                   	nop
  99:	90                   	nop
  9a:	90                   	nop
  9b:	90                   	nop
  9c:	90                   	nop
  9d:	90                   	nop
  9e:	90                   	nop
  9f:	90                   	nop

000000a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  a6:	56                   	push   %esi
  a7:	8b 55 0c             	mov    0xc(%ebp),%edx
  aa:	53                   	push   %ebx
  while(*p && *p == *q)
  ab:	0f b6 01             	movzbl (%ecx),%eax
  ae:	0f b6 1a             	movzbl (%edx),%ebx
  b1:	84 c0                	test   %al,%al
  b3:	74 23                	je     d8 <strcmp+0x38>
  b5:	38 d8                	cmp    %bl,%al
  b7:	74 10                	je     c9 <strcmp+0x29>
  b9:	eb 2d                	jmp    e8 <strcmp+0x48>
  bb:	90                   	nop
  bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  c0:	83 c1 01             	add    $0x1,%ecx
  c3:	38 d8                	cmp    %bl,%al
  c5:	75 21                	jne    e8 <strcmp+0x48>
    p++, q++;
  c7:	89 f2                	mov    %esi,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  c9:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
  cd:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  d0:	0f b6 5a 01          	movzbl 0x1(%edx),%ebx
  d4:	84 c0                	test   %al,%al
  d6:	75 e8                	jne    c0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  d8:	0f b6 db             	movzbl %bl,%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  db:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
  dd:	29 d8                	sub    %ebx,%eax
}
  df:	5b                   	pop    %ebx
  e0:	5e                   	pop    %esi
  e1:	5d                   	pop    %ebp
  e2:	c3                   	ret    
  e3:	90                   	nop
  e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    p++, q++;
  return (uchar)*p - (uchar)*q;
  e8:	0f b6 db             	movzbl %bl,%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  eb:	0f b6 c0             	movzbl %al,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
  ee:	29 d8                	sub    %ebx,%eax
}
  f0:	5b                   	pop    %ebx
  f1:	5e                   	pop    %esi
  f2:	5d                   	pop    %ebp
  f3:	c3                   	ret    
  f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000100 <strlen>:

uint
strlen(const char *s)
{
 100:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
 101:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
 103:	89 e5                	mov    %esp,%ebp
 105:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 108:	80 39 00             	cmpb   $0x0,(%ecx)
 10b:	74 0e                	je     11b <strlen+0x1b>
 10d:	31 d2                	xor    %edx,%edx
 10f:	90                   	nop
 110:	83 c2 01             	add    $0x1,%edx
 113:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 117:	89 d0                	mov    %edx,%eax
 119:	75 f5                	jne    110 <strlen+0x10>
    ;
  return n;
}
 11b:	5d                   	pop    %ebp
 11c:	c3                   	ret    
 11d:	8d 76 00             	lea    0x0(%esi),%esi

00000120 <memset>:

void*
memset(void *dst, int c, uint n)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	8b 55 08             	mov    0x8(%ebp),%edx
 126:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 127:	8b 4d 10             	mov    0x10(%ebp),%ecx
 12a:	8b 45 0c             	mov    0xc(%ebp),%eax
 12d:	89 d7                	mov    %edx,%edi
 12f:	fc                   	cld    
 130:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 132:	89 d0                	mov    %edx,%eax
 134:	5f                   	pop    %edi
 135:	5d                   	pop    %ebp
 136:	c3                   	ret    
 137:	89 f6                	mov    %esi,%esi
 139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000140 <strchr>:

char*
strchr(const char *s, char c)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	8b 45 08             	mov    0x8(%ebp),%eax
 146:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 14a:	0f b6 10             	movzbl (%eax),%edx
 14d:	84 d2                	test   %dl,%dl
 14f:	75 12                	jne    163 <strchr+0x23>
 151:	eb 1d                	jmp    170 <strchr+0x30>
 153:	90                   	nop
 154:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 158:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 15c:	84 d2                	test   %dl,%dl
 15e:	74 10                	je     170 <strchr+0x30>
 160:	83 c0 01             	add    $0x1,%eax
    if(*s == c)
 163:	38 ca                	cmp    %cl,%dl
 165:	75 f1                	jne    158 <strchr+0x18>
      return (char*)s;
  return 0;
}
 167:	5d                   	pop    %ebp
 168:	c3                   	ret    
 169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 170:	31 c0                	xor    %eax,%eax
}
 172:	5d                   	pop    %ebp
 173:	c3                   	ret    
 174:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 17a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000180 <gets>:

char*
gets(char *buf, int max)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 185:	31 f6                	xor    %esi,%esi
  return 0;
}

char*
gets(char *buf, int max)
{
 187:	53                   	push   %ebx
 188:	83 ec 2c             	sub    $0x2c,%esp
 18b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 18e:	eb 31                	jmp    1c1 <gets+0x41>
    cc = read(0, &c, 1);
 190:	8d 45 e7             	lea    -0x19(%ebp),%eax
 193:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 19a:	00 
 19b:	89 44 24 04          	mov    %eax,0x4(%esp)
 19f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1a6:	e8 11 01 00 00       	call   2bc <read>
    if(cc < 1)
 1ab:	85 c0                	test   %eax,%eax
 1ad:	7e 1a                	jle    1c9 <gets+0x49>
      break;
    buf[i++] = c;
 1af:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1b3:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 1b5:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 1b7:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 1bb:	74 0c                	je     1c9 <gets+0x49>
 1bd:	3c 0a                	cmp    $0xa,%al
 1bf:	74 08                	je     1c9 <gets+0x49>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1c1:	8d 5e 01             	lea    0x1(%esi),%ebx
 1c4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1c7:	7c c7                	jl     190 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1c9:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 1cd:	83 c4 2c             	add    $0x2c,%esp
 1d0:	89 f8                	mov    %edi,%eax
 1d2:	5b                   	pop    %ebx
 1d3:	5e                   	pop    %esi
 1d4:	5f                   	pop    %edi
 1d5:	5d                   	pop    %ebp
 1d6:	c3                   	ret    
 1d7:	89 f6                	mov    %esi,%esi
 1d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1e6:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(const char *n, struct stat *st)
{
 1e9:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 1ec:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 1ef:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1fb:	00 
 1fc:	89 04 24             	mov    %eax,(%esp)
 1ff:	e8 e0 00 00 00       	call   2e4 <open>
  if(fd < 0)
 204:	85 c0                	test   %eax,%eax
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 206:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 208:	78 19                	js     223 <stat+0x43>
    return -1;
  r = fstat(fd, st);
 20a:	8b 45 0c             	mov    0xc(%ebp),%eax
 20d:	89 1c 24             	mov    %ebx,(%esp)
 210:	89 44 24 04          	mov    %eax,0x4(%esp)
 214:	e8 e3 00 00 00       	call   2fc <fstat>
  close(fd);
 219:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 21c:	89 c6                	mov    %eax,%esi
  close(fd);
 21e:	e8 a9 00 00 00       	call   2cc <close>
  return r;
}
 223:	89 f0                	mov    %esi,%eax
 225:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 228:	8b 75 fc             	mov    -0x4(%ebp),%esi
 22b:	89 ec                	mov    %ebp,%esp
 22d:	5d                   	pop    %ebp
 22e:	c3                   	ret    
 22f:	90                   	nop

00000230 <atoi>:

int
atoi(const char *s)
{
 230:	55                   	push   %ebp
  int n;

  n = 0;
 231:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
 233:	89 e5                	mov    %esp,%ebp
 235:	8b 4d 08             	mov    0x8(%ebp),%ecx
 238:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 239:	0f b6 11             	movzbl (%ecx),%edx
 23c:	8d 5a d0             	lea    -0x30(%edx),%ebx
 23f:	80 fb 09             	cmp    $0x9,%bl
 242:	77 1c                	ja     260 <atoi+0x30>
 244:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 248:	0f be d2             	movsbl %dl,%edx
 24b:	83 c1 01             	add    $0x1,%ecx
 24e:	8d 04 80             	lea    (%eax,%eax,4),%eax
 251:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 255:	0f b6 11             	movzbl (%ecx),%edx
 258:	8d 5a d0             	lea    -0x30(%edx),%ebx
 25b:	80 fb 09             	cmp    $0x9,%bl
 25e:	76 e8                	jbe    248 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 260:	5b                   	pop    %ebx
 261:	5d                   	pop    %ebp
 262:	c3                   	ret    
 263:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000270 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	56                   	push   %esi
 274:	8b 45 08             	mov    0x8(%ebp),%eax
 277:	53                   	push   %ebx
 278:	8b 5d 10             	mov    0x10(%ebp),%ebx
 27b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 27e:	85 db                	test   %ebx,%ebx
 280:	7e 14                	jle    296 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, const void *vsrc, int n)
 282:	31 d2                	xor    %edx,%edx
 284:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 288:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 28c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 28f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 292:	39 da                	cmp    %ebx,%edx
 294:	75 f2                	jne    288 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 296:	5b                   	pop    %ebx
 297:	5e                   	pop    %esi
 298:	5d                   	pop    %ebp
 299:	c3                   	ret    
 29a:	90                   	nop
 29b:	90                   	nop

0000029c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 29c:	b8 01 00 00 00       	mov    $0x1,%eax
 2a1:	cd 40                	int    $0x40
 2a3:	c3                   	ret    

000002a4 <exit>:
SYSCALL(exit)
 2a4:	b8 02 00 00 00       	mov    $0x2,%eax
 2a9:	cd 40                	int    $0x40
 2ab:	c3                   	ret    

000002ac <wait>:
SYSCALL(wait)
 2ac:	b8 03 00 00 00       	mov    $0x3,%eax
 2b1:	cd 40                	int    $0x40
 2b3:	c3                   	ret    

000002b4 <pipe>:
SYSCALL(pipe)
 2b4:	b8 04 00 00 00       	mov    $0x4,%eax
 2b9:	cd 40                	int    $0x40
 2bb:	c3                   	ret    

000002bc <read>:
SYSCALL(read)
 2bc:	b8 05 00 00 00       	mov    $0x5,%eax
 2c1:	cd 40                	int    $0x40
 2c3:	c3                   	ret    

000002c4 <write>:
SYSCALL(write)
 2c4:	b8 10 00 00 00       	mov    $0x10,%eax
 2c9:	cd 40                	int    $0x40
 2cb:	c3                   	ret    

000002cc <close>:
SYSCALL(close)
 2cc:	b8 15 00 00 00       	mov    $0x15,%eax
 2d1:	cd 40                	int    $0x40
 2d3:	c3                   	ret    

000002d4 <kill>:
SYSCALL(kill)
 2d4:	b8 06 00 00 00       	mov    $0x6,%eax
 2d9:	cd 40                	int    $0x40
 2db:	c3                   	ret    

000002dc <exec>:
SYSCALL(exec)
 2dc:	b8 07 00 00 00       	mov    $0x7,%eax
 2e1:	cd 40                	int    $0x40
 2e3:	c3                   	ret    

000002e4 <open>:
SYSCALL(open)
 2e4:	b8 0f 00 00 00       	mov    $0xf,%eax
 2e9:	cd 40                	int    $0x40
 2eb:	c3                   	ret    

000002ec <mknod>:
SYSCALL(mknod)
 2ec:	b8 11 00 00 00       	mov    $0x11,%eax
 2f1:	cd 40                	int    $0x40
 2f3:	c3                   	ret    

000002f4 <unlink>:
SYSCALL(unlink)
 2f4:	b8 12 00 00 00       	mov    $0x12,%eax
 2f9:	cd 40                	int    $0x40
 2fb:	c3                   	ret    

000002fc <fstat>:
SYSCALL(fstat)
 2fc:	b8 08 00 00 00       	mov    $0x8,%eax
 301:	cd 40                	int    $0x40
 303:	c3                   	ret    

00000304 <link>:
SYSCALL(link)
 304:	b8 13 00 00 00       	mov    $0x13,%eax
 309:	cd 40                	int    $0x40
 30b:	c3                   	ret    

0000030c <mkdir>:
SYSCALL(mkdir)
 30c:	b8 14 00 00 00       	mov    $0x14,%eax
 311:	cd 40                	int    $0x40
 313:	c3                   	ret    

00000314 <chdir>:
SYSCALL(chdir)
 314:	b8 09 00 00 00       	mov    $0x9,%eax
 319:	cd 40                	int    $0x40
 31b:	c3                   	ret    

0000031c <dup>:
SYSCALL(dup)
 31c:	b8 0a 00 00 00       	mov    $0xa,%eax
 321:	cd 40                	int    $0x40
 323:	c3                   	ret    

00000324 <getpid>:
SYSCALL(getpid)
 324:	b8 0b 00 00 00       	mov    $0xb,%eax
 329:	cd 40                	int    $0x40
 32b:	c3                   	ret    

0000032c <sbrk>:
SYSCALL(sbrk)
 32c:	b8 0c 00 00 00       	mov    $0xc,%eax
 331:	cd 40                	int    $0x40
 333:	c3                   	ret    

00000334 <sleep>:
SYSCALL(sleep)
 334:	b8 0d 00 00 00       	mov    $0xd,%eax
 339:	cd 40                	int    $0x40
 33b:	c3                   	ret    

0000033c <uptime>:
SYSCALL(uptime)
 33c:	b8 0e 00 00 00       	mov    $0xe,%eax
 341:	cd 40                	int    $0x40
 343:	c3                   	ret    
 344:	90                   	nop
 345:	90                   	nop
 346:	90                   	nop
 347:	90                   	nop
 348:	90                   	nop
 349:	90                   	nop
 34a:	90                   	nop
 34b:	90                   	nop
 34c:	90                   	nop
 34d:	90                   	nop
 34e:	90                   	nop
 34f:	90                   	nop

00000350 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	83 ec 28             	sub    $0x28,%esp
 356:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 359:	8d 55 f4             	lea    -0xc(%ebp),%edx
 35c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 363:	00 
 364:	89 54 24 04          	mov    %edx,0x4(%esp)
 368:	89 04 24             	mov    %eax,(%esp)
 36b:	e8 54 ff ff ff       	call   2c4 <write>
}
 370:	c9                   	leave  
 371:	c3                   	ret    
 372:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000380 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	57                   	push   %edi
 384:	56                   	push   %esi
 385:	89 c6                	mov    %eax,%esi
 387:	53                   	push   %ebx
 388:	83 ec 1c             	sub    $0x1c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 38b:	8b 45 08             	mov    0x8(%ebp),%eax
 38e:	85 c0                	test   %eax,%eax
 390:	74 5e                	je     3f0 <printint+0x70>
 392:	89 d0                	mov    %edx,%eax
 394:	c1 e8 1f             	shr    $0x1f,%eax
 397:	84 c0                	test   %al,%al
 399:	74 55                	je     3f0 <printint+0x70>
    neg = 1;
    x = -xx;
 39b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 39d:	bf 01 00 00 00       	mov    $0x1,%edi
    x = -xx;
 3a2:	f7 d8                	neg    %eax
  } else {
    x = xx;
  }

  i = 0;
 3a4:	31 db                	xor    %ebx,%ebx
 3a6:	eb 02                	jmp    3aa <printint+0x2a>
  do{
    buf[i++] = digits[x % base];
 3a8:	89 d3                	mov    %edx,%ebx
 3aa:	31 d2                	xor    %edx,%edx
 3ac:	f7 f1                	div    %ecx
 3ae:	0f b6 92 0c 07 00 00 	movzbl 0x70c(%edx),%edx
  }while((x /= base) != 0);
 3b5:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 3b7:	88 54 1d d8          	mov    %dl,-0x28(%ebp,%ebx,1)
 3bb:	8d 53 01             	lea    0x1(%ebx),%edx
  }while((x /= base) != 0);
 3be:	75 e8                	jne    3a8 <printint+0x28>
  if(neg)
 3c0:	85 ff                	test   %edi,%edi
 3c2:	74 08                	je     3cc <printint+0x4c>
    buf[i++] = '-';
 3c4:	c6 44 15 d8 2d       	movb   $0x2d,-0x28(%ebp,%edx,1)
 3c9:	8d 53 02             	lea    0x2(%ebx),%edx

  while(--i >= 0)
 3cc:	8d 5a ff             	lea    -0x1(%edx),%ebx
 3cf:	90                   	nop
    putc(fd, buf[i]);
 3d0:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3d5:	89 f0                	mov    %esi,%eax
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 3d7:	83 eb 01             	sub    $0x1,%ebx
    putc(fd, buf[i]);
 3da:	e8 71 ff ff ff       	call   350 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 3df:	83 fb ff             	cmp    $0xffffffff,%ebx
 3e2:	75 ec                	jne    3d0 <printint+0x50>
    putc(fd, buf[i]);
}
 3e4:	83 c4 1c             	add    $0x1c,%esp
 3e7:	5b                   	pop    %ebx
 3e8:	5e                   	pop    %esi
 3e9:	5f                   	pop    %edi
 3ea:	5d                   	pop    %ebp
 3eb:	c3                   	ret    
 3ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 3f0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3f2:	31 ff                	xor    %edi,%edi
 3f4:	eb ae                	jmp    3a4 <printint+0x24>
 3f6:	8d 76 00             	lea    0x0(%esi),%esi
 3f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000400 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	56                   	push   %esi
 405:	53                   	push   %ebx
 406:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 409:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 40c:	0f b6 0b             	movzbl (%ebx),%ecx
 40f:	84 c9                	test   %cl,%cl
 411:	0f 84 89 00 00 00    	je     4a0 <printf+0xa0>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 417:	8d 45 10             	lea    0x10(%ebp),%eax
{
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 41a:	31 f6                	xor    %esi,%esi
  ap = (uint*)(void*)&fmt + 1;
 41c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 41f:	eb 21                	jmp    442 <printf+0x42>
 421:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 428:	83 f9 25             	cmp    $0x25,%ecx
 42b:	74 7b                	je     4a8 <printf+0xa8>
        state = '%';
      } else {
        putc(fd, c);
 42d:	8b 45 08             	mov    0x8(%ebp),%eax
 430:	0f be d1             	movsbl %cl,%edx
 433:	e8 18 ff ff ff       	call   350 <putc>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 438:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 43b:	0f b6 0b             	movzbl (%ebx),%ecx
 43e:	84 c9                	test   %cl,%cl
 440:	74 5e                	je     4a0 <printf+0xa0>
    c = fmt[i] & 0xff;
    if(state == 0){
 442:	85 f6                	test   %esi,%esi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 444:	0f b6 c9             	movzbl %cl,%ecx
    if(state == 0){
 447:	74 df                	je     428 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 449:	83 fe 25             	cmp    $0x25,%esi
 44c:	75 ea                	jne    438 <printf+0x38>
      if(c == 'd'){
 44e:	83 f9 64             	cmp    $0x64,%ecx
 451:	0f 84 c9 00 00 00    	je     520 <printf+0x120>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 457:	83 f9 70             	cmp    $0x70,%ecx
 45a:	74 54                	je     4b0 <printf+0xb0>
 45c:	83 f9 78             	cmp    $0x78,%ecx
 45f:	90                   	nop
 460:	74 4e                	je     4b0 <printf+0xb0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 462:	83 f9 73             	cmp    $0x73,%ecx
 465:	74 71                	je     4d8 <printf+0xd8>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 467:	83 f9 63             	cmp    $0x63,%ecx
 46a:	0f 84 d2 00 00 00    	je     542 <printf+0x142>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 470:	83 f9 25             	cmp    $0x25,%ecx
        putc(fd, c);
 473:	ba 25 00 00 00       	mov    $0x25,%edx
 478:	8b 45 08             	mov    0x8(%ebp),%eax
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 47b:	74 11                	je     48e <printf+0x8e>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 47d:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 480:	e8 cb fe ff ff       	call   350 <putc>
        putc(fd, c);
 485:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 488:	8b 45 08             	mov    0x8(%ebp),%eax
 48b:	0f be d1             	movsbl %cl,%edx
 48e:	83 c3 01             	add    $0x1,%ebx
      }
      state = 0;
 491:	31 f6                	xor    %esi,%esi
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 493:	e8 b8 fe ff ff       	call   350 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 498:	0f b6 0b             	movzbl (%ebx),%ecx
 49b:	84 c9                	test   %cl,%cl
 49d:	75 a3                	jne    442 <printf+0x42>
 49f:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 4a0:	83 c4 2c             	add    $0x2c,%esp
 4a3:	5b                   	pop    %ebx
 4a4:	5e                   	pop    %esi
 4a5:	5f                   	pop    %edi
 4a6:	5d                   	pop    %ebp
 4a7:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 4a8:	be 25 00 00 00       	mov    $0x25,%esi
 4ad:	eb 89                	jmp    438 <printf+0x38>
 4af:	90                   	nop
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 4b0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4b3:	b9 10 00 00 00       	mov    $0x10,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4b8:	31 f6                	xor    %esi,%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 4ba:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 4c1:	8b 10                	mov    (%eax),%edx
 4c3:	8b 45 08             	mov    0x8(%ebp),%eax
 4c6:	e8 b5 fe ff ff       	call   380 <printint>
        ap++;
 4cb:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 4cf:	e9 64 ff ff ff       	jmp    438 <printf+0x38>
 4d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 4d8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4db:	8b 38                	mov    (%eax),%edi
        ap++;
 4dd:	83 c0 04             	add    $0x4,%eax
 4e0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
          s = "(null)";
 4e3:	b8 05 07 00 00       	mov    $0x705,%eax
 4e8:	85 ff                	test   %edi,%edi
 4ea:	0f 44 f8             	cmove  %eax,%edi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4ed:	31 f6                	xor    %esi,%esi
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 4ef:	0f b6 17             	movzbl (%edi),%edx
 4f2:	84 d2                	test   %dl,%dl
 4f4:	0f 84 3e ff ff ff    	je     438 <printf+0x38>
 4fa:	89 de                	mov    %ebx,%esi
 4fc:	8b 5d 08             	mov    0x8(%ebp),%ebx
 4ff:	90                   	nop
          putc(fd, *s);
 500:	0f be d2             	movsbl %dl,%edx
          s++;
 503:	83 c7 01             	add    $0x1,%edi
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
 506:	89 d8                	mov    %ebx,%eax
 508:	e8 43 fe ff ff       	call   350 <putc>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 50d:	0f b6 17             	movzbl (%edi),%edx
 510:	84 d2                	test   %dl,%dl
 512:	75 ec                	jne    500 <printf+0x100>
 514:	89 f3                	mov    %esi,%ebx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 516:	31 f6                	xor    %esi,%esi
 518:	e9 1b ff ff ff       	jmp    438 <printf+0x38>
 51d:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 520:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 523:	b1 0a                	mov    $0xa,%cl
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 525:	66 31 f6             	xor    %si,%si
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 528:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 52f:	8b 10                	mov    (%eax),%edx
 531:	8b 45 08             	mov    0x8(%ebp),%eax
 534:	e8 47 fe ff ff       	call   380 <printint>
        ap++;
 539:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 53d:	e9 f6 fe ff ff       	jmp    438 <printf+0x38>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 542:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 545:	31 f6                	xor    %esi,%esi
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 547:	0f be 10             	movsbl (%eax),%edx
 54a:	8b 45 08             	mov    0x8(%ebp),%eax
 54d:	e8 fe fd ff ff       	call   350 <putc>
        ap++;
 552:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 556:	e9 dd fe ff ff       	jmp    438 <printf+0x38>
 55b:	90                   	nop
 55c:	90                   	nop
 55d:	90                   	nop
 55e:	90                   	nop
 55f:	90                   	nop

00000560 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 560:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 561:	a1 b8 09 00 00       	mov    0x9b8,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 566:	89 e5                	mov    %esp,%ebp
 568:	57                   	push   %edi
 569:	56                   	push   %esi
 56a:	53                   	push   %ebx
 56b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 56e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 571:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 578:	39 c8                	cmp    %ecx,%eax
 57a:	8b 10                	mov    (%eax),%edx
 57c:	73 04                	jae    582 <free+0x22>
 57e:	39 d1                	cmp    %edx,%ecx
 580:	72 16                	jb     598 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 582:	39 d0                	cmp    %edx,%eax
 584:	72 0c                	jb     592 <free+0x32>
 586:	39 c8                	cmp    %ecx,%eax
 588:	72 0e                	jb     598 <free+0x38>
 58a:	39 d1                	cmp    %edx,%ecx
 58c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 590:	72 06                	jb     598 <free+0x38>
static Header base;
static Header *freep;

void
free(void *ap)
{
 592:	89 d0                	mov    %edx,%eax
 594:	eb e2                	jmp    578 <free+0x18>
 596:	66 90                	xchg   %ax,%ax

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 598:	8b 73 fc             	mov    -0x4(%ebx),%esi
 59b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 59e:	39 d7                	cmp    %edx,%edi
 5a0:	74 19                	je     5bb <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5a2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5a5:	8b 50 04             	mov    0x4(%eax),%edx
 5a8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5ab:	39 f1                	cmp    %esi,%ecx
 5ad:	74 23                	je     5d2 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5af:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5b1:	a3 b8 09 00 00       	mov    %eax,0x9b8
}
 5b6:	5b                   	pop    %ebx
 5b7:	5e                   	pop    %esi
 5b8:	5f                   	pop    %edi
 5b9:	5d                   	pop    %ebp
 5ba:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 5bb:	03 72 04             	add    0x4(%edx),%esi
 5be:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5c1:	8b 10                	mov    (%eax),%edx
 5c3:	8b 12                	mov    (%edx),%edx
 5c5:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 5c8:	8b 50 04             	mov    0x4(%eax),%edx
 5cb:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5ce:	39 f1                	cmp    %esi,%ecx
 5d0:	75 dd                	jne    5af <free+0x4f>
    p->s.size += bp->s.size;
 5d2:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 5d5:	a3 b8 09 00 00       	mov    %eax,0x9b8
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 5da:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5dd:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5e0:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 5e2:	5b                   	pop    %ebx
 5e3:	5e                   	pop    %esi
 5e4:	5f                   	pop    %edi
 5e5:	5d                   	pop    %ebp
 5e6:	c3                   	ret    
 5e7:	89 f6                	mov    %esi,%esi
 5e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000005f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
 5f3:	57                   	push   %edi
 5f4:	56                   	push   %esi
 5f5:	53                   	push   %ebx
 5f6:	83 ec 2c             	sub    $0x2c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 5f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 5fc:	8b 15 b8 09 00 00    	mov    0x9b8,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 602:	83 c3 07             	add    $0x7,%ebx
 605:	c1 eb 03             	shr    $0x3,%ebx
 608:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 60b:	85 d2                	test   %edx,%edx
 60d:	0f 84 a3 00 00 00    	je     6b6 <malloc+0xc6>
 613:	8b 02                	mov    (%edx),%eax
 615:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 618:	39 d9                	cmp    %ebx,%ecx
 61a:	73 74                	jae    690 <malloc+0xa0>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 61c:	8d 14 dd 00 00 00 00 	lea    0x0(,%ebx,8),%edx
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 623:	bf 00 80 00 00       	mov    $0x8000,%edi
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 628:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 62b:	eb 0c                	jmp    639 <malloc+0x49>
 62d:	8d 76 00             	lea    0x0(%esi),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 630:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 632:	8b 48 04             	mov    0x4(%eax),%ecx
 635:	39 cb                	cmp    %ecx,%ebx
 637:	76 57                	jbe    690 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 639:	3b 05 b8 09 00 00    	cmp    0x9b8,%eax
 63f:	89 c2                	mov    %eax,%edx
 641:	75 ed                	jne    630 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 643:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 646:	81 fb 00 10 00 00    	cmp    $0x1000,%ebx
 64c:	be 00 10 00 00       	mov    $0x1000,%esi
 651:	0f 43 f3             	cmovae %ebx,%esi
 654:	0f 42 c7             	cmovb  %edi,%eax
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 657:	89 04 24             	mov    %eax,(%esp)
 65a:	e8 cd fc ff ff       	call   32c <sbrk>
  if(p == (char*)-1)
 65f:	83 f8 ff             	cmp    $0xffffffff,%eax
 662:	74 1c                	je     680 <malloc+0x90>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 664:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 667:	83 c0 08             	add    $0x8,%eax
 66a:	89 04 24             	mov    %eax,(%esp)
 66d:	e8 ee fe ff ff       	call   560 <free>
  return freep;
 672:	8b 15 b8 09 00 00    	mov    0x9b8,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 678:	85 d2                	test   %edx,%edx
 67a:	75 b4                	jne    630 <malloc+0x40>
 67c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return 0;
  }
}
 680:	83 c4 2c             	add    $0x2c,%esp
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
 683:	31 c0                	xor    %eax,%eax
  }
}
 685:	5b                   	pop    %ebx
 686:	5e                   	pop    %esi
 687:	5f                   	pop    %edi
 688:	5d                   	pop    %ebp
 689:	c3                   	ret    
 68a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 690:	39 cb                	cmp    %ecx,%ebx
 692:	74 1c                	je     6b0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 694:	29 d9                	sub    %ebx,%ecx
 696:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 699:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 69c:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 69f:	89 15 b8 09 00 00    	mov    %edx,0x9b8
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6a5:	83 c4 2c             	add    $0x2c,%esp
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 6a8:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6ab:	5b                   	pop    %ebx
 6ac:	5e                   	pop    %esi
 6ad:	5f                   	pop    %edi
 6ae:	5d                   	pop    %ebp
 6af:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 6b0:	8b 08                	mov    (%eax),%ecx
 6b2:	89 0a                	mov    %ecx,(%edx)
 6b4:	eb e9                	jmp    69f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 6b6:	c7 05 b8 09 00 00 bc 	movl   $0x9bc,0x9b8
 6bd:	09 00 00 
    base.s.size = 0;
 6c0:	b8 bc 09 00 00       	mov    $0x9bc,%eax
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 6c5:	c7 05 bc 09 00 00 bc 	movl   $0x9bc,0x9bc
 6cc:	09 00 00 
    base.s.size = 0;
 6cf:	c7 05 c0 09 00 00 00 	movl   $0x0,0x9c0
 6d6:	00 00 00 
 6d9:	e9 3e ff ff ff       	jmp    61c <malloc+0x2c>
