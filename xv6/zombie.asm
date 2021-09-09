
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
  if(fork() > 0)
   9:	e8 4e 02 00 00       	call   25c <fork>
   e:	85 c0                	test   %eax,%eax
  10:	7e 0c                	jle    1e <main+0x1e>
    sleep(5);  // Let child exit before parent.
  12:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  19:	e8 d6 02 00 00       	call   2f4 <sleep>
  exit();
  1e:	e8 41 02 00 00       	call   264 <exit>
  23:	90                   	nop
  24:	90                   	nop
  25:	90                   	nop
  26:	90                   	nop
  27:	90                   	nop
  28:	90                   	nop
  29:	90                   	nop
  2a:	90                   	nop
  2b:	90                   	nop
  2c:	90                   	nop
  2d:	90                   	nop
  2e:	90                   	nop
  2f:	90                   	nop

00000030 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  30:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  31:	31 d2                	xor    %edx,%edx
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  33:	89 e5                	mov    %esp,%ebp
  35:	8b 45 08             	mov    0x8(%ebp),%eax
  38:	53                   	push   %ebx
  39:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  40:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
  44:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  47:	83 c2 01             	add    $0x1,%edx
  4a:	84 c9                	test   %cl,%cl
  4c:	75 f2                	jne    40 <strcpy+0x10>
    ;
  return os;
}
  4e:	5b                   	pop    %ebx
  4f:	5d                   	pop    %ebp
  50:	c3                   	ret    
  51:	eb 0d                	jmp    60 <strcmp>
  53:	90                   	nop
  54:	90                   	nop
  55:	90                   	nop
  56:	90                   	nop
  57:	90                   	nop
  58:	90                   	nop
  59:	90                   	nop
  5a:	90                   	nop
  5b:	90                   	nop
  5c:	90                   	nop
  5d:	90                   	nop
  5e:	90                   	nop
  5f:	90                   	nop

00000060 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	8b 4d 08             	mov    0x8(%ebp),%ecx
  66:	56                   	push   %esi
  67:	8b 55 0c             	mov    0xc(%ebp),%edx
  6a:	53                   	push   %ebx
  while(*p && *p == *q)
  6b:	0f b6 01             	movzbl (%ecx),%eax
  6e:	0f b6 1a             	movzbl (%edx),%ebx
  71:	84 c0                	test   %al,%al
  73:	74 23                	je     98 <strcmp+0x38>
  75:	38 d8                	cmp    %bl,%al
  77:	74 10                	je     89 <strcmp+0x29>
  79:	eb 2d                	jmp    a8 <strcmp+0x48>
  7b:	90                   	nop
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  80:	83 c1 01             	add    $0x1,%ecx
  83:	38 d8                	cmp    %bl,%al
  85:	75 21                	jne    a8 <strcmp+0x48>
    p++, q++;
  87:	89 f2                	mov    %esi,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  89:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
  8d:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  90:	0f b6 5a 01          	movzbl 0x1(%edx),%ebx
  94:	84 c0                	test   %al,%al
  96:	75 e8                	jne    80 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  98:	0f b6 db             	movzbl %bl,%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  9b:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
  9d:	29 d8                	sub    %ebx,%eax
}
  9f:	5b                   	pop    %ebx
  a0:	5e                   	pop    %esi
  a1:	5d                   	pop    %ebp
  a2:	c3                   	ret    
  a3:	90                   	nop
  a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    p++, q++;
  return (uchar)*p - (uchar)*q;
  a8:	0f b6 db             	movzbl %bl,%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  ab:	0f b6 c0             	movzbl %al,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
  ae:	29 d8                	sub    %ebx,%eax
}
  b0:	5b                   	pop    %ebx
  b1:	5e                   	pop    %esi
  b2:	5d                   	pop    %ebp
  b3:	c3                   	ret    
  b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000c0 <strlen>:

uint
strlen(const char *s)
{
  c0:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
  c1:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
  c3:	89 e5                	mov    %esp,%ebp
  c5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  c8:	80 39 00             	cmpb   $0x0,(%ecx)
  cb:	74 0e                	je     db <strlen+0x1b>
  cd:	31 d2                	xor    %edx,%edx
  cf:	90                   	nop
  d0:	83 c2 01             	add    $0x1,%edx
  d3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
  d7:	89 d0                	mov    %edx,%eax
  d9:	75 f5                	jne    d0 <strlen+0x10>
    ;
  return n;
}
  db:	5d                   	pop    %ebp
  dc:	c3                   	ret    
  dd:	8d 76 00             	lea    0x0(%esi),%esi

000000e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	8b 55 08             	mov    0x8(%ebp),%edx
  e6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  ea:	8b 45 0c             	mov    0xc(%ebp),%eax
  ed:	89 d7                	mov    %edx,%edi
  ef:	fc                   	cld    
  f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  f2:	89 d0                	mov    %edx,%eax
  f4:	5f                   	pop    %edi
  f5:	5d                   	pop    %ebp
  f6:	c3                   	ret    
  f7:	89 f6                	mov    %esi,%esi
  f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000100 <strchr>:

char*
strchr(const char *s, char c)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	8b 45 08             	mov    0x8(%ebp),%eax
 106:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 10a:	0f b6 10             	movzbl (%eax),%edx
 10d:	84 d2                	test   %dl,%dl
 10f:	75 12                	jne    123 <strchr+0x23>
 111:	eb 1d                	jmp    130 <strchr+0x30>
 113:	90                   	nop
 114:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 118:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 11c:	84 d2                	test   %dl,%dl
 11e:	74 10                	je     130 <strchr+0x30>
 120:	83 c0 01             	add    $0x1,%eax
    if(*s == c)
 123:	38 ca                	cmp    %cl,%dl
 125:	75 f1                	jne    118 <strchr+0x18>
      return (char*)s;
  return 0;
}
 127:	5d                   	pop    %ebp
 128:	c3                   	ret    
 129:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 130:	31 c0                	xor    %eax,%eax
}
 132:	5d                   	pop    %ebp
 133:	c3                   	ret    
 134:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 13a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000140 <gets>:

char*
gets(char *buf, int max)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	57                   	push   %edi
 144:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 145:	31 f6                	xor    %esi,%esi
  return 0;
}

char*
gets(char *buf, int max)
{
 147:	53                   	push   %ebx
 148:	83 ec 2c             	sub    $0x2c,%esp
 14b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 14e:	eb 31                	jmp    181 <gets+0x41>
    cc = read(0, &c, 1);
 150:	8d 45 e7             	lea    -0x19(%ebp),%eax
 153:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 15a:	00 
 15b:	89 44 24 04          	mov    %eax,0x4(%esp)
 15f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 166:	e8 11 01 00 00       	call   27c <read>
    if(cc < 1)
 16b:	85 c0                	test   %eax,%eax
 16d:	7e 1a                	jle    189 <gets+0x49>
      break;
    buf[i++] = c;
 16f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 173:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 175:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 177:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 17b:	74 0c                	je     189 <gets+0x49>
 17d:	3c 0a                	cmp    $0xa,%al
 17f:	74 08                	je     189 <gets+0x49>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 181:	8d 5e 01             	lea    0x1(%esi),%ebx
 184:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 187:	7c c7                	jl     150 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 189:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 18d:	83 c4 2c             	add    $0x2c,%esp
 190:	89 f8                	mov    %edi,%eax
 192:	5b                   	pop    %ebx
 193:	5e                   	pop    %esi
 194:	5f                   	pop    %edi
 195:	5d                   	pop    %ebp
 196:	c3                   	ret    
 197:	89 f6                	mov    %esi,%esi
 199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001a0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1a6:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(const char *n, struct stat *st)
{
 1a9:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 1ac:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 1af:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1b4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1bb:	00 
 1bc:	89 04 24             	mov    %eax,(%esp)
 1bf:	e8 e0 00 00 00       	call   2a4 <open>
  if(fd < 0)
 1c4:	85 c0                	test   %eax,%eax
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1c6:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 1c8:	78 19                	js     1e3 <stat+0x43>
    return -1;
  r = fstat(fd, st);
 1ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 1cd:	89 1c 24             	mov    %ebx,(%esp)
 1d0:	89 44 24 04          	mov    %eax,0x4(%esp)
 1d4:	e8 e3 00 00 00       	call   2bc <fstat>
  close(fd);
 1d9:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 1dc:	89 c6                	mov    %eax,%esi
  close(fd);
 1de:	e8 a9 00 00 00       	call   28c <close>
  return r;
}
 1e3:	89 f0                	mov    %esi,%eax
 1e5:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 1e8:	8b 75 fc             	mov    -0x4(%ebp),%esi
 1eb:	89 ec                	mov    %ebp,%esp
 1ed:	5d                   	pop    %ebp
 1ee:	c3                   	ret    
 1ef:	90                   	nop

000001f0 <atoi>:

int
atoi(const char *s)
{
 1f0:	55                   	push   %ebp
  int n;

  n = 0;
 1f1:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
 1f3:	89 e5                	mov    %esp,%ebp
 1f5:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1f8:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 1f9:	0f b6 11             	movzbl (%ecx),%edx
 1fc:	8d 5a d0             	lea    -0x30(%edx),%ebx
 1ff:	80 fb 09             	cmp    $0x9,%bl
 202:	77 1c                	ja     220 <atoi+0x30>
 204:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 208:	0f be d2             	movsbl %dl,%edx
 20b:	83 c1 01             	add    $0x1,%ecx
 20e:	8d 04 80             	lea    (%eax,%eax,4),%eax
 211:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 215:	0f b6 11             	movzbl (%ecx),%edx
 218:	8d 5a d0             	lea    -0x30(%edx),%ebx
 21b:	80 fb 09             	cmp    $0x9,%bl
 21e:	76 e8                	jbe    208 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 220:	5b                   	pop    %ebx
 221:	5d                   	pop    %ebp
 222:	c3                   	ret    
 223:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000230 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	56                   	push   %esi
 234:	8b 45 08             	mov    0x8(%ebp),%eax
 237:	53                   	push   %ebx
 238:	8b 5d 10             	mov    0x10(%ebp),%ebx
 23b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 23e:	85 db                	test   %ebx,%ebx
 240:	7e 14                	jle    256 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, const void *vsrc, int n)
 242:	31 d2                	xor    %edx,%edx
 244:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 248:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 24c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 24f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 252:	39 da                	cmp    %ebx,%edx
 254:	75 f2                	jne    248 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 256:	5b                   	pop    %ebx
 257:	5e                   	pop    %esi
 258:	5d                   	pop    %ebp
 259:	c3                   	ret    
 25a:	90                   	nop
 25b:	90                   	nop

0000025c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 25c:	b8 01 00 00 00       	mov    $0x1,%eax
 261:	cd 40                	int    $0x40
 263:	c3                   	ret    

00000264 <exit>:
SYSCALL(exit)
 264:	b8 02 00 00 00       	mov    $0x2,%eax
 269:	cd 40                	int    $0x40
 26b:	c3                   	ret    

0000026c <wait>:
SYSCALL(wait)
 26c:	b8 03 00 00 00       	mov    $0x3,%eax
 271:	cd 40                	int    $0x40
 273:	c3                   	ret    

00000274 <pipe>:
SYSCALL(pipe)
 274:	b8 04 00 00 00       	mov    $0x4,%eax
 279:	cd 40                	int    $0x40
 27b:	c3                   	ret    

0000027c <read>:
SYSCALL(read)
 27c:	b8 05 00 00 00       	mov    $0x5,%eax
 281:	cd 40                	int    $0x40
 283:	c3                   	ret    

00000284 <write>:
SYSCALL(write)
 284:	b8 10 00 00 00       	mov    $0x10,%eax
 289:	cd 40                	int    $0x40
 28b:	c3                   	ret    

0000028c <close>:
SYSCALL(close)
 28c:	b8 15 00 00 00       	mov    $0x15,%eax
 291:	cd 40                	int    $0x40
 293:	c3                   	ret    

00000294 <kill>:
SYSCALL(kill)
 294:	b8 06 00 00 00       	mov    $0x6,%eax
 299:	cd 40                	int    $0x40
 29b:	c3                   	ret    

0000029c <exec>:
SYSCALL(exec)
 29c:	b8 07 00 00 00       	mov    $0x7,%eax
 2a1:	cd 40                	int    $0x40
 2a3:	c3                   	ret    

000002a4 <open>:
SYSCALL(open)
 2a4:	b8 0f 00 00 00       	mov    $0xf,%eax
 2a9:	cd 40                	int    $0x40
 2ab:	c3                   	ret    

000002ac <mknod>:
SYSCALL(mknod)
 2ac:	b8 11 00 00 00       	mov    $0x11,%eax
 2b1:	cd 40                	int    $0x40
 2b3:	c3                   	ret    

000002b4 <unlink>:
SYSCALL(unlink)
 2b4:	b8 12 00 00 00       	mov    $0x12,%eax
 2b9:	cd 40                	int    $0x40
 2bb:	c3                   	ret    

000002bc <fstat>:
SYSCALL(fstat)
 2bc:	b8 08 00 00 00       	mov    $0x8,%eax
 2c1:	cd 40                	int    $0x40
 2c3:	c3                   	ret    

000002c4 <link>:
SYSCALL(link)
 2c4:	b8 13 00 00 00       	mov    $0x13,%eax
 2c9:	cd 40                	int    $0x40
 2cb:	c3                   	ret    

000002cc <mkdir>:
SYSCALL(mkdir)
 2cc:	b8 14 00 00 00       	mov    $0x14,%eax
 2d1:	cd 40                	int    $0x40
 2d3:	c3                   	ret    

000002d4 <chdir>:
SYSCALL(chdir)
 2d4:	b8 09 00 00 00       	mov    $0x9,%eax
 2d9:	cd 40                	int    $0x40
 2db:	c3                   	ret    

000002dc <dup>:
SYSCALL(dup)
 2dc:	b8 0a 00 00 00       	mov    $0xa,%eax
 2e1:	cd 40                	int    $0x40
 2e3:	c3                   	ret    

000002e4 <getpid>:
SYSCALL(getpid)
 2e4:	b8 0b 00 00 00       	mov    $0xb,%eax
 2e9:	cd 40                	int    $0x40
 2eb:	c3                   	ret    

000002ec <sbrk>:
SYSCALL(sbrk)
 2ec:	b8 0c 00 00 00       	mov    $0xc,%eax
 2f1:	cd 40                	int    $0x40
 2f3:	c3                   	ret    

000002f4 <sleep>:
SYSCALL(sleep)
 2f4:	b8 0d 00 00 00       	mov    $0xd,%eax
 2f9:	cd 40                	int    $0x40
 2fb:	c3                   	ret    

000002fc <uptime>:
SYSCALL(uptime)
 2fc:	b8 0e 00 00 00       	mov    $0xe,%eax
 301:	cd 40                	int    $0x40
 303:	c3                   	ret    
 304:	90                   	nop
 305:	90                   	nop
 306:	90                   	nop
 307:	90                   	nop
 308:	90                   	nop
 309:	90                   	nop
 30a:	90                   	nop
 30b:	90                   	nop
 30c:	90                   	nop
 30d:	90                   	nop
 30e:	90                   	nop
 30f:	90                   	nop

00000310 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	83 ec 28             	sub    $0x28,%esp
 316:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 319:	8d 55 f4             	lea    -0xc(%ebp),%edx
 31c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 323:	00 
 324:	89 54 24 04          	mov    %edx,0x4(%esp)
 328:	89 04 24             	mov    %eax,(%esp)
 32b:	e8 54 ff ff ff       	call   284 <write>
}
 330:	c9                   	leave  
 331:	c3                   	ret    
 332:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000340 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	57                   	push   %edi
 344:	56                   	push   %esi
 345:	89 c6                	mov    %eax,%esi
 347:	53                   	push   %ebx
 348:	83 ec 1c             	sub    $0x1c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 34b:	8b 45 08             	mov    0x8(%ebp),%eax
 34e:	85 c0                	test   %eax,%eax
 350:	74 5e                	je     3b0 <printint+0x70>
 352:	89 d0                	mov    %edx,%eax
 354:	c1 e8 1f             	shr    $0x1f,%eax
 357:	84 c0                	test   %al,%al
 359:	74 55                	je     3b0 <printint+0x70>
    neg = 1;
    x = -xx;
 35b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 35d:	bf 01 00 00 00       	mov    $0x1,%edi
    x = -xx;
 362:	f7 d8                	neg    %eax
  } else {
    x = xx;
  }

  i = 0;
 364:	31 db                	xor    %ebx,%ebx
 366:	eb 02                	jmp    36a <printint+0x2a>
  do{
    buf[i++] = digits[x % base];
 368:	89 d3                	mov    %edx,%ebx
 36a:	31 d2                	xor    %edx,%edx
 36c:	f7 f1                	div    %ecx
 36e:	0f b6 92 a5 06 00 00 	movzbl 0x6a5(%edx),%edx
  }while((x /= base) != 0);
 375:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 377:	88 54 1d d8          	mov    %dl,-0x28(%ebp,%ebx,1)
 37b:	8d 53 01             	lea    0x1(%ebx),%edx
  }while((x /= base) != 0);
 37e:	75 e8                	jne    368 <printint+0x28>
  if(neg)
 380:	85 ff                	test   %edi,%edi
 382:	74 08                	je     38c <printint+0x4c>
    buf[i++] = '-';
 384:	c6 44 15 d8 2d       	movb   $0x2d,-0x28(%ebp,%edx,1)
 389:	8d 53 02             	lea    0x2(%ebx),%edx

  while(--i >= 0)
 38c:	8d 5a ff             	lea    -0x1(%edx),%ebx
 38f:	90                   	nop
    putc(fd, buf[i]);
 390:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 395:	89 f0                	mov    %esi,%eax
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 397:	83 eb 01             	sub    $0x1,%ebx
    putc(fd, buf[i]);
 39a:	e8 71 ff ff ff       	call   310 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 39f:	83 fb ff             	cmp    $0xffffffff,%ebx
 3a2:	75 ec                	jne    390 <printint+0x50>
    putc(fd, buf[i]);
}
 3a4:	83 c4 1c             	add    $0x1c,%esp
 3a7:	5b                   	pop    %ebx
 3a8:	5e                   	pop    %esi
 3a9:	5f                   	pop    %edi
 3aa:	5d                   	pop    %ebp
 3ab:	c3                   	ret    
 3ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 3b0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3b2:	31 ff                	xor    %edi,%edi
 3b4:	eb ae                	jmp    364 <printint+0x24>
 3b6:	8d 76 00             	lea    0x0(%esi),%esi
 3b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003c0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	57                   	push   %edi
 3c4:	56                   	push   %esi
 3c5:	53                   	push   %ebx
 3c6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 3cc:	0f b6 0b             	movzbl (%ebx),%ecx
 3cf:	84 c9                	test   %cl,%cl
 3d1:	0f 84 89 00 00 00    	je     460 <printf+0xa0>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 3d7:	8d 45 10             	lea    0x10(%ebp),%eax
{
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 3da:	31 f6                	xor    %esi,%esi
  ap = (uint*)(void*)&fmt + 1;
 3dc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 3df:	eb 21                	jmp    402 <printf+0x42>
 3e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 3e8:	83 f9 25             	cmp    $0x25,%ecx
 3eb:	74 7b                	je     468 <printf+0xa8>
        state = '%';
      } else {
        putc(fd, c);
 3ed:	8b 45 08             	mov    0x8(%ebp),%eax
 3f0:	0f be d1             	movsbl %cl,%edx
 3f3:	e8 18 ff ff ff       	call   310 <putc>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 3f8:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3fb:	0f b6 0b             	movzbl (%ebx),%ecx
 3fe:	84 c9                	test   %cl,%cl
 400:	74 5e                	je     460 <printf+0xa0>
    c = fmt[i] & 0xff;
    if(state == 0){
 402:	85 f6                	test   %esi,%esi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 404:	0f b6 c9             	movzbl %cl,%ecx
    if(state == 0){
 407:	74 df                	je     3e8 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 409:	83 fe 25             	cmp    $0x25,%esi
 40c:	75 ea                	jne    3f8 <printf+0x38>
      if(c == 'd'){
 40e:	83 f9 64             	cmp    $0x64,%ecx
 411:	0f 84 c9 00 00 00    	je     4e0 <printf+0x120>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 417:	83 f9 70             	cmp    $0x70,%ecx
 41a:	74 54                	je     470 <printf+0xb0>
 41c:	83 f9 78             	cmp    $0x78,%ecx
 41f:	90                   	nop
 420:	74 4e                	je     470 <printf+0xb0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 422:	83 f9 73             	cmp    $0x73,%ecx
 425:	74 71                	je     498 <printf+0xd8>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 427:	83 f9 63             	cmp    $0x63,%ecx
 42a:	0f 84 d2 00 00 00    	je     502 <printf+0x142>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 430:	83 f9 25             	cmp    $0x25,%ecx
        putc(fd, c);
 433:	ba 25 00 00 00       	mov    $0x25,%edx
 438:	8b 45 08             	mov    0x8(%ebp),%eax
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 43b:	74 11                	je     44e <printf+0x8e>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 43d:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 440:	e8 cb fe ff ff       	call   310 <putc>
        putc(fd, c);
 445:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 448:	8b 45 08             	mov    0x8(%ebp),%eax
 44b:	0f be d1             	movsbl %cl,%edx
 44e:	83 c3 01             	add    $0x1,%ebx
      }
      state = 0;
 451:	31 f6                	xor    %esi,%esi
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 453:	e8 b8 fe ff ff       	call   310 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 458:	0f b6 0b             	movzbl (%ebx),%ecx
 45b:	84 c9                	test   %cl,%cl
 45d:	75 a3                	jne    402 <printf+0x42>
 45f:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 460:	83 c4 2c             	add    $0x2c,%esp
 463:	5b                   	pop    %ebx
 464:	5e                   	pop    %esi
 465:	5f                   	pop    %edi
 466:	5d                   	pop    %ebp
 467:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 468:	be 25 00 00 00       	mov    $0x25,%esi
 46d:	eb 89                	jmp    3f8 <printf+0x38>
 46f:	90                   	nop
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 470:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 473:	b9 10 00 00 00       	mov    $0x10,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 478:	31 f6                	xor    %esi,%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 47a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 481:	8b 10                	mov    (%eax),%edx
 483:	8b 45 08             	mov    0x8(%ebp),%eax
 486:	e8 b5 fe ff ff       	call   340 <printint>
        ap++;
 48b:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 48f:	e9 64 ff ff ff       	jmp    3f8 <printf+0x38>
 494:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 498:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 49b:	8b 38                	mov    (%eax),%edi
        ap++;
 49d:	83 c0 04             	add    $0x4,%eax
 4a0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
          s = "(null)";
 4a3:	b8 9e 06 00 00       	mov    $0x69e,%eax
 4a8:	85 ff                	test   %edi,%edi
 4aa:	0f 44 f8             	cmove  %eax,%edi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4ad:	31 f6                	xor    %esi,%esi
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 4af:	0f b6 17             	movzbl (%edi),%edx
 4b2:	84 d2                	test   %dl,%dl
 4b4:	0f 84 3e ff ff ff    	je     3f8 <printf+0x38>
 4ba:	89 de                	mov    %ebx,%esi
 4bc:	8b 5d 08             	mov    0x8(%ebp),%ebx
 4bf:	90                   	nop
          putc(fd, *s);
 4c0:	0f be d2             	movsbl %dl,%edx
          s++;
 4c3:	83 c7 01             	add    $0x1,%edi
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
 4c6:	89 d8                	mov    %ebx,%eax
 4c8:	e8 43 fe ff ff       	call   310 <putc>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 4cd:	0f b6 17             	movzbl (%edi),%edx
 4d0:	84 d2                	test   %dl,%dl
 4d2:	75 ec                	jne    4c0 <printf+0x100>
 4d4:	89 f3                	mov    %esi,%ebx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4d6:	31 f6                	xor    %esi,%esi
 4d8:	e9 1b ff ff ff       	jmp    3f8 <printf+0x38>
 4dd:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 4e0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4e3:	b1 0a                	mov    $0xa,%cl
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4e5:	66 31 f6             	xor    %si,%si
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 4e8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 4ef:	8b 10                	mov    (%eax),%edx
 4f1:	8b 45 08             	mov    0x8(%ebp),%eax
 4f4:	e8 47 fe ff ff       	call   340 <printint>
        ap++;
 4f9:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 4fd:	e9 f6 fe ff ff       	jmp    3f8 <printf+0x38>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 502:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 505:	31 f6                	xor    %esi,%esi
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 507:	0f be 10             	movsbl (%eax),%edx
 50a:	8b 45 08             	mov    0x8(%ebp),%eax
 50d:	e8 fe fd ff ff       	call   310 <putc>
        ap++;
 512:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 516:	e9 dd fe ff ff       	jmp    3f8 <printf+0x38>
 51b:	90                   	nop
 51c:	90                   	nop
 51d:	90                   	nop
 51e:	90                   	nop
 51f:	90                   	nop

00000520 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 520:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 521:	a1 50 09 00 00       	mov    0x950,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 526:	89 e5                	mov    %esp,%ebp
 528:	57                   	push   %edi
 529:	56                   	push   %esi
 52a:	53                   	push   %ebx
 52b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 52e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 531:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 538:	39 c8                	cmp    %ecx,%eax
 53a:	8b 10                	mov    (%eax),%edx
 53c:	73 04                	jae    542 <free+0x22>
 53e:	39 d1                	cmp    %edx,%ecx
 540:	72 16                	jb     558 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 542:	39 d0                	cmp    %edx,%eax
 544:	72 0c                	jb     552 <free+0x32>
 546:	39 c8                	cmp    %ecx,%eax
 548:	72 0e                	jb     558 <free+0x38>
 54a:	39 d1                	cmp    %edx,%ecx
 54c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 550:	72 06                	jb     558 <free+0x38>
static Header base;
static Header *freep;

void
free(void *ap)
{
 552:	89 d0                	mov    %edx,%eax
 554:	eb e2                	jmp    538 <free+0x18>
 556:	66 90                	xchg   %ax,%ax

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 558:	8b 73 fc             	mov    -0x4(%ebx),%esi
 55b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 55e:	39 d7                	cmp    %edx,%edi
 560:	74 19                	je     57b <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 562:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 565:	8b 50 04             	mov    0x4(%eax),%edx
 568:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 56b:	39 f1                	cmp    %esi,%ecx
 56d:	74 23                	je     592 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 56f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 571:	a3 50 09 00 00       	mov    %eax,0x950
}
 576:	5b                   	pop    %ebx
 577:	5e                   	pop    %esi
 578:	5f                   	pop    %edi
 579:	5d                   	pop    %ebp
 57a:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 57b:	03 72 04             	add    0x4(%edx),%esi
 57e:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 581:	8b 10                	mov    (%eax),%edx
 583:	8b 12                	mov    (%edx),%edx
 585:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 588:	8b 50 04             	mov    0x4(%eax),%edx
 58b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 58e:	39 f1                	cmp    %esi,%ecx
 590:	75 dd                	jne    56f <free+0x4f>
    p->s.size += bp->s.size;
 592:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 595:	a3 50 09 00 00       	mov    %eax,0x950
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 59a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 59d:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5a0:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 5a2:	5b                   	pop    %ebx
 5a3:	5e                   	pop    %esi
 5a4:	5f                   	pop    %edi
 5a5:	5d                   	pop    %ebp
 5a6:	c3                   	ret    
 5a7:	89 f6                	mov    %esi,%esi
 5a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000005b0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 5b0:	55                   	push   %ebp
 5b1:	89 e5                	mov    %esp,%ebp
 5b3:	57                   	push   %edi
 5b4:	56                   	push   %esi
 5b5:	53                   	push   %ebx
 5b6:	83 ec 2c             	sub    $0x2c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 5b9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 5bc:	8b 15 50 09 00 00    	mov    0x950,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 5c2:	83 c3 07             	add    $0x7,%ebx
 5c5:	c1 eb 03             	shr    $0x3,%ebx
 5c8:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 5cb:	85 d2                	test   %edx,%edx
 5cd:	0f 84 a3 00 00 00    	je     676 <malloc+0xc6>
 5d3:	8b 02                	mov    (%edx),%eax
 5d5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 5d8:	39 d9                	cmp    %ebx,%ecx
 5da:	73 74                	jae    650 <malloc+0xa0>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 5dc:	8d 14 dd 00 00 00 00 	lea    0x0(,%ebx,8),%edx
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 5e3:	bf 00 80 00 00       	mov    $0x8000,%edi
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 5e8:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 5eb:	eb 0c                	jmp    5f9 <malloc+0x49>
 5ed:	8d 76 00             	lea    0x0(%esi),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 5f0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 5f2:	8b 48 04             	mov    0x4(%eax),%ecx
 5f5:	39 cb                	cmp    %ecx,%ebx
 5f7:	76 57                	jbe    650 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 5f9:	3b 05 50 09 00 00    	cmp    0x950,%eax
 5ff:	89 c2                	mov    %eax,%edx
 601:	75 ed                	jne    5f0 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 603:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 606:	81 fb 00 10 00 00    	cmp    $0x1000,%ebx
 60c:	be 00 10 00 00       	mov    $0x1000,%esi
 611:	0f 43 f3             	cmovae %ebx,%esi
 614:	0f 42 c7             	cmovb  %edi,%eax
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 617:	89 04 24             	mov    %eax,(%esp)
 61a:	e8 cd fc ff ff       	call   2ec <sbrk>
  if(p == (char*)-1)
 61f:	83 f8 ff             	cmp    $0xffffffff,%eax
 622:	74 1c                	je     640 <malloc+0x90>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 624:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 627:	83 c0 08             	add    $0x8,%eax
 62a:	89 04 24             	mov    %eax,(%esp)
 62d:	e8 ee fe ff ff       	call   520 <free>
  return freep;
 632:	8b 15 50 09 00 00    	mov    0x950,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 638:	85 d2                	test   %edx,%edx
 63a:	75 b4                	jne    5f0 <malloc+0x40>
 63c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return 0;
  }
}
 640:	83 c4 2c             	add    $0x2c,%esp
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
 643:	31 c0                	xor    %eax,%eax
  }
}
 645:	5b                   	pop    %ebx
 646:	5e                   	pop    %esi
 647:	5f                   	pop    %edi
 648:	5d                   	pop    %ebp
 649:	c3                   	ret    
 64a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 650:	39 cb                	cmp    %ecx,%ebx
 652:	74 1c                	je     670 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 654:	29 d9                	sub    %ebx,%ecx
 656:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 659:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 65c:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 65f:	89 15 50 09 00 00    	mov    %edx,0x950
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 665:	83 c4 2c             	add    $0x2c,%esp
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 668:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 66b:	5b                   	pop    %ebx
 66c:	5e                   	pop    %esi
 66d:	5f                   	pop    %edi
 66e:	5d                   	pop    %ebp
 66f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 670:	8b 08                	mov    (%eax),%ecx
 672:	89 0a                	mov    %ecx,(%edx)
 674:	eb e9                	jmp    65f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 676:	c7 05 50 09 00 00 54 	movl   $0x954,0x950
 67d:	09 00 00 
    base.s.size = 0;
 680:	b8 54 09 00 00       	mov    $0x954,%eax
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 685:	c7 05 54 09 00 00 54 	movl   $0x954,0x954
 68c:	09 00 00 
    base.s.size = 0;
 68f:	c7 05 58 09 00 00 00 	movl   $0x0,0x958
 696:	00 00 00 
 699:	e9 3e ff ff ff       	jmp    5dc <malloc+0x2c>
