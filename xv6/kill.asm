
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
  int i;

  if(argc < 2){
   6:	bb 01 00 00 00       	mov    $0x1,%ebx
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   b:	83 e4 f0             	and    $0xfffffff0,%esp
   e:	83 ec 10             	sub    $0x10,%esp
  11:	8b 75 08             	mov    0x8(%ebp),%esi
  14:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  if(argc < 2){
  17:	83 fe 01             	cmp    $0x1,%esi
  1a:	7e 23                	jle    3f <main+0x3f>
  1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
    kill(atoi(argv[i]));
  20:	8b 04 9f             	mov    (%edi,%ebx,4),%eax

  if(argc < 2){
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
  23:	83 c3 01             	add    $0x1,%ebx
    kill(atoi(argv[i]));
  26:	89 04 24             	mov    %eax,(%esp)
  29:	e8 f2 01 00 00       	call   220 <atoi>
  2e:	89 04 24             	mov    %eax,(%esp)
  31:	e8 8e 02 00 00       	call   2c4 <kill>

  if(argc < 2){
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
  36:	39 f3                	cmp    %esi,%ebx
  38:	75 e6                	jne    20 <main+0x20>
    kill(atoi(argv[i]));
  exit();
  3a:	e8 55 02 00 00       	call   294 <exit>
main(int argc, char **argv)
{
  int i;

  if(argc < 2){
    printf(2, "usage: kill pid...\n");
  3f:	c7 44 24 04 ce 06 00 	movl   $0x6ce,0x4(%esp)
  46:	00 
  47:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  4e:	e8 9d 03 00 00       	call   3f0 <printf>
    exit();
  53:	e8 3c 02 00 00       	call   294 <exit>
  58:	90                   	nop
  59:	90                   	nop
  5a:	90                   	nop
  5b:	90                   	nop
  5c:	90                   	nop
  5d:	90                   	nop
  5e:	90                   	nop
  5f:	90                   	nop

00000060 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  60:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  61:	31 d2                	xor    %edx,%edx
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  63:	89 e5                	mov    %esp,%ebp
  65:	8b 45 08             	mov    0x8(%ebp),%eax
  68:	53                   	push   %ebx
  69:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  70:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
  74:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  77:	83 c2 01             	add    $0x1,%edx
  7a:	84 c9                	test   %cl,%cl
  7c:	75 f2                	jne    70 <strcpy+0x10>
    ;
  return os;
}
  7e:	5b                   	pop    %ebx
  7f:	5d                   	pop    %ebp
  80:	c3                   	ret    
  81:	eb 0d                	jmp    90 <strcmp>
  83:	90                   	nop
  84:	90                   	nop
  85:	90                   	nop
  86:	90                   	nop
  87:	90                   	nop
  88:	90                   	nop
  89:	90                   	nop
  8a:	90                   	nop
  8b:	90                   	nop
  8c:	90                   	nop
  8d:	90                   	nop
  8e:	90                   	nop
  8f:	90                   	nop

00000090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	8b 4d 08             	mov    0x8(%ebp),%ecx
  96:	56                   	push   %esi
  97:	8b 55 0c             	mov    0xc(%ebp),%edx
  9a:	53                   	push   %ebx
  while(*p && *p == *q)
  9b:	0f b6 01             	movzbl (%ecx),%eax
  9e:	0f b6 1a             	movzbl (%edx),%ebx
  a1:	84 c0                	test   %al,%al
  a3:	74 23                	je     c8 <strcmp+0x38>
  a5:	38 d8                	cmp    %bl,%al
  a7:	74 10                	je     b9 <strcmp+0x29>
  a9:	eb 2d                	jmp    d8 <strcmp+0x48>
  ab:	90                   	nop
  ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  b0:	83 c1 01             	add    $0x1,%ecx
  b3:	38 d8                	cmp    %bl,%al
  b5:	75 21                	jne    d8 <strcmp+0x48>
    p++, q++;
  b7:	89 f2                	mov    %esi,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  b9:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
  bd:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  c0:	0f b6 5a 01          	movzbl 0x1(%edx),%ebx
  c4:	84 c0                	test   %al,%al
  c6:	75 e8                	jne    b0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  c8:	0f b6 db             	movzbl %bl,%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  cb:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
  cd:	29 d8                	sub    %ebx,%eax
}
  cf:	5b                   	pop    %ebx
  d0:	5e                   	pop    %esi
  d1:	5d                   	pop    %ebp
  d2:	c3                   	ret    
  d3:	90                   	nop
  d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    p++, q++;
  return (uchar)*p - (uchar)*q;
  d8:	0f b6 db             	movzbl %bl,%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  db:	0f b6 c0             	movzbl %al,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
  de:	29 d8                	sub    %ebx,%eax
}
  e0:	5b                   	pop    %ebx
  e1:	5e                   	pop    %esi
  e2:	5d                   	pop    %ebp
  e3:	c3                   	ret    
  e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000f0 <strlen>:

uint
strlen(const char *s)
{
  f0:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
  f1:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
  f3:	89 e5                	mov    %esp,%ebp
  f5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  f8:	80 39 00             	cmpb   $0x0,(%ecx)
  fb:	74 0e                	je     10b <strlen+0x1b>
  fd:	31 d2                	xor    %edx,%edx
  ff:	90                   	nop
 100:	83 c2 01             	add    $0x1,%edx
 103:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 107:	89 d0                	mov    %edx,%eax
 109:	75 f5                	jne    100 <strlen+0x10>
    ;
  return n;
}
 10b:	5d                   	pop    %ebp
 10c:	c3                   	ret    
 10d:	8d 76 00             	lea    0x0(%esi),%esi

00000110 <memset>:

void*
memset(void *dst, int c, uint n)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	8b 55 08             	mov    0x8(%ebp),%edx
 116:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 117:	8b 4d 10             	mov    0x10(%ebp),%ecx
 11a:	8b 45 0c             	mov    0xc(%ebp),%eax
 11d:	89 d7                	mov    %edx,%edi
 11f:	fc                   	cld    
 120:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 122:	89 d0                	mov    %edx,%eax
 124:	5f                   	pop    %edi
 125:	5d                   	pop    %ebp
 126:	c3                   	ret    
 127:	89 f6                	mov    %esi,%esi
 129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000130 <strchr>:

char*
strchr(const char *s, char c)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	8b 45 08             	mov    0x8(%ebp),%eax
 136:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 13a:	0f b6 10             	movzbl (%eax),%edx
 13d:	84 d2                	test   %dl,%dl
 13f:	75 12                	jne    153 <strchr+0x23>
 141:	eb 1d                	jmp    160 <strchr+0x30>
 143:	90                   	nop
 144:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 148:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 14c:	84 d2                	test   %dl,%dl
 14e:	74 10                	je     160 <strchr+0x30>
 150:	83 c0 01             	add    $0x1,%eax
    if(*s == c)
 153:	38 ca                	cmp    %cl,%dl
 155:	75 f1                	jne    148 <strchr+0x18>
      return (char*)s;
  return 0;
}
 157:	5d                   	pop    %ebp
 158:	c3                   	ret    
 159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 160:	31 c0                	xor    %eax,%eax
}
 162:	5d                   	pop    %ebp
 163:	c3                   	ret    
 164:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 16a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000170 <gets>:

char*
gets(char *buf, int max)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	57                   	push   %edi
 174:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 175:	31 f6                	xor    %esi,%esi
  return 0;
}

char*
gets(char *buf, int max)
{
 177:	53                   	push   %ebx
 178:	83 ec 2c             	sub    $0x2c,%esp
 17b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 17e:	eb 31                	jmp    1b1 <gets+0x41>
    cc = read(0, &c, 1);
 180:	8d 45 e7             	lea    -0x19(%ebp),%eax
 183:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 18a:	00 
 18b:	89 44 24 04          	mov    %eax,0x4(%esp)
 18f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 196:	e8 11 01 00 00       	call   2ac <read>
    if(cc < 1)
 19b:	85 c0                	test   %eax,%eax
 19d:	7e 1a                	jle    1b9 <gets+0x49>
      break;
    buf[i++] = c;
 19f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1a3:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 1a5:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 1a7:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 1ab:	74 0c                	je     1b9 <gets+0x49>
 1ad:	3c 0a                	cmp    $0xa,%al
 1af:	74 08                	je     1b9 <gets+0x49>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1b1:	8d 5e 01             	lea    0x1(%esi),%ebx
 1b4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1b7:	7c c7                	jl     180 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1b9:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 1bd:	83 c4 2c             	add    $0x2c,%esp
 1c0:	89 f8                	mov    %edi,%eax
 1c2:	5b                   	pop    %ebx
 1c3:	5e                   	pop    %esi
 1c4:	5f                   	pop    %edi
 1c5:	5d                   	pop    %ebp
 1c6:	c3                   	ret    
 1c7:	89 f6                	mov    %esi,%esi
 1c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1d6:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(const char *n, struct stat *st)
{
 1d9:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 1dc:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 1df:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1e4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1eb:	00 
 1ec:	89 04 24             	mov    %eax,(%esp)
 1ef:	e8 e0 00 00 00       	call   2d4 <open>
  if(fd < 0)
 1f4:	85 c0                	test   %eax,%eax
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f6:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 1f8:	78 19                	js     213 <stat+0x43>
    return -1;
  r = fstat(fd, st);
 1fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 1fd:	89 1c 24             	mov    %ebx,(%esp)
 200:	89 44 24 04          	mov    %eax,0x4(%esp)
 204:	e8 e3 00 00 00       	call   2ec <fstat>
  close(fd);
 209:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 20c:	89 c6                	mov    %eax,%esi
  close(fd);
 20e:	e8 a9 00 00 00       	call   2bc <close>
  return r;
}
 213:	89 f0                	mov    %esi,%eax
 215:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 218:	8b 75 fc             	mov    -0x4(%ebp),%esi
 21b:	89 ec                	mov    %ebp,%esp
 21d:	5d                   	pop    %ebp
 21e:	c3                   	ret    
 21f:	90                   	nop

00000220 <atoi>:

int
atoi(const char *s)
{
 220:	55                   	push   %ebp
  int n;

  n = 0;
 221:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
 223:	89 e5                	mov    %esp,%ebp
 225:	8b 4d 08             	mov    0x8(%ebp),%ecx
 228:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 229:	0f b6 11             	movzbl (%ecx),%edx
 22c:	8d 5a d0             	lea    -0x30(%edx),%ebx
 22f:	80 fb 09             	cmp    $0x9,%bl
 232:	77 1c                	ja     250 <atoi+0x30>
 234:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 238:	0f be d2             	movsbl %dl,%edx
 23b:	83 c1 01             	add    $0x1,%ecx
 23e:	8d 04 80             	lea    (%eax,%eax,4),%eax
 241:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 245:	0f b6 11             	movzbl (%ecx),%edx
 248:	8d 5a d0             	lea    -0x30(%edx),%ebx
 24b:	80 fb 09             	cmp    $0x9,%bl
 24e:	76 e8                	jbe    238 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 250:	5b                   	pop    %ebx
 251:	5d                   	pop    %ebp
 252:	c3                   	ret    
 253:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000260 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	56                   	push   %esi
 264:	8b 45 08             	mov    0x8(%ebp),%eax
 267:	53                   	push   %ebx
 268:	8b 5d 10             	mov    0x10(%ebp),%ebx
 26b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 26e:	85 db                	test   %ebx,%ebx
 270:	7e 14                	jle    286 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, const void *vsrc, int n)
 272:	31 d2                	xor    %edx,%edx
 274:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 278:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 27c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 27f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 282:	39 da                	cmp    %ebx,%edx
 284:	75 f2                	jne    278 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 286:	5b                   	pop    %ebx
 287:	5e                   	pop    %esi
 288:	5d                   	pop    %ebp
 289:	c3                   	ret    
 28a:	90                   	nop
 28b:	90                   	nop

0000028c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 28c:	b8 01 00 00 00       	mov    $0x1,%eax
 291:	cd 40                	int    $0x40
 293:	c3                   	ret    

00000294 <exit>:
SYSCALL(exit)
 294:	b8 02 00 00 00       	mov    $0x2,%eax
 299:	cd 40                	int    $0x40
 29b:	c3                   	ret    

0000029c <wait>:
SYSCALL(wait)
 29c:	b8 03 00 00 00       	mov    $0x3,%eax
 2a1:	cd 40                	int    $0x40
 2a3:	c3                   	ret    

000002a4 <pipe>:
SYSCALL(pipe)
 2a4:	b8 04 00 00 00       	mov    $0x4,%eax
 2a9:	cd 40                	int    $0x40
 2ab:	c3                   	ret    

000002ac <read>:
SYSCALL(read)
 2ac:	b8 05 00 00 00       	mov    $0x5,%eax
 2b1:	cd 40                	int    $0x40
 2b3:	c3                   	ret    

000002b4 <write>:
SYSCALL(write)
 2b4:	b8 10 00 00 00       	mov    $0x10,%eax
 2b9:	cd 40                	int    $0x40
 2bb:	c3                   	ret    

000002bc <close>:
SYSCALL(close)
 2bc:	b8 15 00 00 00       	mov    $0x15,%eax
 2c1:	cd 40                	int    $0x40
 2c3:	c3                   	ret    

000002c4 <kill>:
SYSCALL(kill)
 2c4:	b8 06 00 00 00       	mov    $0x6,%eax
 2c9:	cd 40                	int    $0x40
 2cb:	c3                   	ret    

000002cc <exec>:
SYSCALL(exec)
 2cc:	b8 07 00 00 00       	mov    $0x7,%eax
 2d1:	cd 40                	int    $0x40
 2d3:	c3                   	ret    

000002d4 <open>:
SYSCALL(open)
 2d4:	b8 0f 00 00 00       	mov    $0xf,%eax
 2d9:	cd 40                	int    $0x40
 2db:	c3                   	ret    

000002dc <mknod>:
SYSCALL(mknod)
 2dc:	b8 11 00 00 00       	mov    $0x11,%eax
 2e1:	cd 40                	int    $0x40
 2e3:	c3                   	ret    

000002e4 <unlink>:
SYSCALL(unlink)
 2e4:	b8 12 00 00 00       	mov    $0x12,%eax
 2e9:	cd 40                	int    $0x40
 2eb:	c3                   	ret    

000002ec <fstat>:
SYSCALL(fstat)
 2ec:	b8 08 00 00 00       	mov    $0x8,%eax
 2f1:	cd 40                	int    $0x40
 2f3:	c3                   	ret    

000002f4 <link>:
SYSCALL(link)
 2f4:	b8 13 00 00 00       	mov    $0x13,%eax
 2f9:	cd 40                	int    $0x40
 2fb:	c3                   	ret    

000002fc <mkdir>:
SYSCALL(mkdir)
 2fc:	b8 14 00 00 00       	mov    $0x14,%eax
 301:	cd 40                	int    $0x40
 303:	c3                   	ret    

00000304 <chdir>:
SYSCALL(chdir)
 304:	b8 09 00 00 00       	mov    $0x9,%eax
 309:	cd 40                	int    $0x40
 30b:	c3                   	ret    

0000030c <dup>:
SYSCALL(dup)
 30c:	b8 0a 00 00 00       	mov    $0xa,%eax
 311:	cd 40                	int    $0x40
 313:	c3                   	ret    

00000314 <getpid>:
SYSCALL(getpid)
 314:	b8 0b 00 00 00       	mov    $0xb,%eax
 319:	cd 40                	int    $0x40
 31b:	c3                   	ret    

0000031c <sbrk>:
SYSCALL(sbrk)
 31c:	b8 0c 00 00 00       	mov    $0xc,%eax
 321:	cd 40                	int    $0x40
 323:	c3                   	ret    

00000324 <sleep>:
SYSCALL(sleep)
 324:	b8 0d 00 00 00       	mov    $0xd,%eax
 329:	cd 40                	int    $0x40
 32b:	c3                   	ret    

0000032c <uptime>:
SYSCALL(uptime)
 32c:	b8 0e 00 00 00       	mov    $0xe,%eax
 331:	cd 40                	int    $0x40
 333:	c3                   	ret    
 334:	90                   	nop
 335:	90                   	nop
 336:	90                   	nop
 337:	90                   	nop
 338:	90                   	nop
 339:	90                   	nop
 33a:	90                   	nop
 33b:	90                   	nop
 33c:	90                   	nop
 33d:	90                   	nop
 33e:	90                   	nop
 33f:	90                   	nop

00000340 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	83 ec 28             	sub    $0x28,%esp
 346:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 349:	8d 55 f4             	lea    -0xc(%ebp),%edx
 34c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 353:	00 
 354:	89 54 24 04          	mov    %edx,0x4(%esp)
 358:	89 04 24             	mov    %eax,(%esp)
 35b:	e8 54 ff ff ff       	call   2b4 <write>
}
 360:	c9                   	leave  
 361:	c3                   	ret    
 362:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 369:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000370 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	57                   	push   %edi
 374:	56                   	push   %esi
 375:	89 c6                	mov    %eax,%esi
 377:	53                   	push   %ebx
 378:	83 ec 1c             	sub    $0x1c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 37b:	8b 45 08             	mov    0x8(%ebp),%eax
 37e:	85 c0                	test   %eax,%eax
 380:	74 5e                	je     3e0 <printint+0x70>
 382:	89 d0                	mov    %edx,%eax
 384:	c1 e8 1f             	shr    $0x1f,%eax
 387:	84 c0                	test   %al,%al
 389:	74 55                	je     3e0 <printint+0x70>
    neg = 1;
    x = -xx;
 38b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 38d:	bf 01 00 00 00       	mov    $0x1,%edi
    x = -xx;
 392:	f7 d8                	neg    %eax
  } else {
    x = xx;
  }

  i = 0;
 394:	31 db                	xor    %ebx,%ebx
 396:	eb 02                	jmp    39a <printint+0x2a>
  do{
    buf[i++] = digits[x % base];
 398:	89 d3                	mov    %edx,%ebx
 39a:	31 d2                	xor    %edx,%edx
 39c:	f7 f1                	div    %ecx
 39e:	0f b6 92 e9 06 00 00 	movzbl 0x6e9(%edx),%edx
  }while((x /= base) != 0);
 3a5:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 3a7:	88 54 1d d8          	mov    %dl,-0x28(%ebp,%ebx,1)
 3ab:	8d 53 01             	lea    0x1(%ebx),%edx
  }while((x /= base) != 0);
 3ae:	75 e8                	jne    398 <printint+0x28>
  if(neg)
 3b0:	85 ff                	test   %edi,%edi
 3b2:	74 08                	je     3bc <printint+0x4c>
    buf[i++] = '-';
 3b4:	c6 44 15 d8 2d       	movb   $0x2d,-0x28(%ebp,%edx,1)
 3b9:	8d 53 02             	lea    0x2(%ebx),%edx

  while(--i >= 0)
 3bc:	8d 5a ff             	lea    -0x1(%edx),%ebx
 3bf:	90                   	nop
    putc(fd, buf[i]);
 3c0:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3c5:	89 f0                	mov    %esi,%eax
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 3c7:	83 eb 01             	sub    $0x1,%ebx
    putc(fd, buf[i]);
 3ca:	e8 71 ff ff ff       	call   340 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 3cf:	83 fb ff             	cmp    $0xffffffff,%ebx
 3d2:	75 ec                	jne    3c0 <printint+0x50>
    putc(fd, buf[i]);
}
 3d4:	83 c4 1c             	add    $0x1c,%esp
 3d7:	5b                   	pop    %ebx
 3d8:	5e                   	pop    %esi
 3d9:	5f                   	pop    %edi
 3da:	5d                   	pop    %ebp
 3db:	c3                   	ret    
 3dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 3e0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3e2:	31 ff                	xor    %edi,%edi
 3e4:	eb ae                	jmp    394 <printint+0x24>
 3e6:	8d 76 00             	lea    0x0(%esi),%esi
 3e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003f0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	56                   	push   %esi
 3f5:	53                   	push   %ebx
 3f6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 3fc:	0f b6 0b             	movzbl (%ebx),%ecx
 3ff:	84 c9                	test   %cl,%cl
 401:	0f 84 89 00 00 00    	je     490 <printf+0xa0>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 407:	8d 45 10             	lea    0x10(%ebp),%eax
{
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 40a:	31 f6                	xor    %esi,%esi
  ap = (uint*)(void*)&fmt + 1;
 40c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 40f:	eb 21                	jmp    432 <printf+0x42>
 411:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 418:	83 f9 25             	cmp    $0x25,%ecx
 41b:	74 7b                	je     498 <printf+0xa8>
        state = '%';
      } else {
        putc(fd, c);
 41d:	8b 45 08             	mov    0x8(%ebp),%eax
 420:	0f be d1             	movsbl %cl,%edx
 423:	e8 18 ff ff ff       	call   340 <putc>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 428:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 42b:	0f b6 0b             	movzbl (%ebx),%ecx
 42e:	84 c9                	test   %cl,%cl
 430:	74 5e                	je     490 <printf+0xa0>
    c = fmt[i] & 0xff;
    if(state == 0){
 432:	85 f6                	test   %esi,%esi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 434:	0f b6 c9             	movzbl %cl,%ecx
    if(state == 0){
 437:	74 df                	je     418 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 439:	83 fe 25             	cmp    $0x25,%esi
 43c:	75 ea                	jne    428 <printf+0x38>
      if(c == 'd'){
 43e:	83 f9 64             	cmp    $0x64,%ecx
 441:	0f 84 c9 00 00 00    	je     510 <printf+0x120>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 447:	83 f9 70             	cmp    $0x70,%ecx
 44a:	74 54                	je     4a0 <printf+0xb0>
 44c:	83 f9 78             	cmp    $0x78,%ecx
 44f:	90                   	nop
 450:	74 4e                	je     4a0 <printf+0xb0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 452:	83 f9 73             	cmp    $0x73,%ecx
 455:	74 71                	je     4c8 <printf+0xd8>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 457:	83 f9 63             	cmp    $0x63,%ecx
 45a:	0f 84 d2 00 00 00    	je     532 <printf+0x142>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 460:	83 f9 25             	cmp    $0x25,%ecx
        putc(fd, c);
 463:	ba 25 00 00 00       	mov    $0x25,%edx
 468:	8b 45 08             	mov    0x8(%ebp),%eax
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 46b:	74 11                	je     47e <printf+0x8e>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 46d:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 470:	e8 cb fe ff ff       	call   340 <putc>
        putc(fd, c);
 475:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 478:	8b 45 08             	mov    0x8(%ebp),%eax
 47b:	0f be d1             	movsbl %cl,%edx
 47e:	83 c3 01             	add    $0x1,%ebx
      }
      state = 0;
 481:	31 f6                	xor    %esi,%esi
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 483:	e8 b8 fe ff ff       	call   340 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 488:	0f b6 0b             	movzbl (%ebx),%ecx
 48b:	84 c9                	test   %cl,%cl
 48d:	75 a3                	jne    432 <printf+0x42>
 48f:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 490:	83 c4 2c             	add    $0x2c,%esp
 493:	5b                   	pop    %ebx
 494:	5e                   	pop    %esi
 495:	5f                   	pop    %edi
 496:	5d                   	pop    %ebp
 497:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 498:	be 25 00 00 00       	mov    $0x25,%esi
 49d:	eb 89                	jmp    428 <printf+0x38>
 49f:	90                   	nop
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 4a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4a3:	b9 10 00 00 00       	mov    $0x10,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4a8:	31 f6                	xor    %esi,%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 4aa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 4b1:	8b 10                	mov    (%eax),%edx
 4b3:	8b 45 08             	mov    0x8(%ebp),%eax
 4b6:	e8 b5 fe ff ff       	call   370 <printint>
        ap++;
 4bb:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 4bf:	e9 64 ff ff ff       	jmp    428 <printf+0x38>
 4c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 4c8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4cb:	8b 38                	mov    (%eax),%edi
        ap++;
 4cd:	83 c0 04             	add    $0x4,%eax
 4d0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
          s = "(null)";
 4d3:	b8 e2 06 00 00       	mov    $0x6e2,%eax
 4d8:	85 ff                	test   %edi,%edi
 4da:	0f 44 f8             	cmove  %eax,%edi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4dd:	31 f6                	xor    %esi,%esi
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 4df:	0f b6 17             	movzbl (%edi),%edx
 4e2:	84 d2                	test   %dl,%dl
 4e4:	0f 84 3e ff ff ff    	je     428 <printf+0x38>
 4ea:	89 de                	mov    %ebx,%esi
 4ec:	8b 5d 08             	mov    0x8(%ebp),%ebx
 4ef:	90                   	nop
          putc(fd, *s);
 4f0:	0f be d2             	movsbl %dl,%edx
          s++;
 4f3:	83 c7 01             	add    $0x1,%edi
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
 4f6:	89 d8                	mov    %ebx,%eax
 4f8:	e8 43 fe ff ff       	call   340 <putc>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 4fd:	0f b6 17             	movzbl (%edi),%edx
 500:	84 d2                	test   %dl,%dl
 502:	75 ec                	jne    4f0 <printf+0x100>
 504:	89 f3                	mov    %esi,%ebx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 506:	31 f6                	xor    %esi,%esi
 508:	e9 1b ff ff ff       	jmp    428 <printf+0x38>
 50d:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 510:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 513:	b1 0a                	mov    $0xa,%cl
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 515:	66 31 f6             	xor    %si,%si
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 518:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 51f:	8b 10                	mov    (%eax),%edx
 521:	8b 45 08             	mov    0x8(%ebp),%eax
 524:	e8 47 fe ff ff       	call   370 <printint>
        ap++;
 529:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 52d:	e9 f6 fe ff ff       	jmp    428 <printf+0x38>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 532:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 535:	31 f6                	xor    %esi,%esi
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 537:	0f be 10             	movsbl (%eax),%edx
 53a:	8b 45 08             	mov    0x8(%ebp),%eax
 53d:	e8 fe fd ff ff       	call   340 <putc>
        ap++;
 542:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 546:	e9 dd fe ff ff       	jmp    428 <printf+0x38>
 54b:	90                   	nop
 54c:	90                   	nop
 54d:	90                   	nop
 54e:	90                   	nop
 54f:	90                   	nop

00000550 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 550:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 551:	a1 98 09 00 00       	mov    0x998,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 556:	89 e5                	mov    %esp,%ebp
 558:	57                   	push   %edi
 559:	56                   	push   %esi
 55a:	53                   	push   %ebx
 55b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 55e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 561:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 568:	39 c8                	cmp    %ecx,%eax
 56a:	8b 10                	mov    (%eax),%edx
 56c:	73 04                	jae    572 <free+0x22>
 56e:	39 d1                	cmp    %edx,%ecx
 570:	72 16                	jb     588 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 572:	39 d0                	cmp    %edx,%eax
 574:	72 0c                	jb     582 <free+0x32>
 576:	39 c8                	cmp    %ecx,%eax
 578:	72 0e                	jb     588 <free+0x38>
 57a:	39 d1                	cmp    %edx,%ecx
 57c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 580:	72 06                	jb     588 <free+0x38>
static Header base;
static Header *freep;

void
free(void *ap)
{
 582:	89 d0                	mov    %edx,%eax
 584:	eb e2                	jmp    568 <free+0x18>
 586:	66 90                	xchg   %ax,%ax

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 588:	8b 73 fc             	mov    -0x4(%ebx),%esi
 58b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 58e:	39 d7                	cmp    %edx,%edi
 590:	74 19                	je     5ab <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 592:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 595:	8b 50 04             	mov    0x4(%eax),%edx
 598:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 59b:	39 f1                	cmp    %esi,%ecx
 59d:	74 23                	je     5c2 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 59f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5a1:	a3 98 09 00 00       	mov    %eax,0x998
}
 5a6:	5b                   	pop    %ebx
 5a7:	5e                   	pop    %esi
 5a8:	5f                   	pop    %edi
 5a9:	5d                   	pop    %ebp
 5aa:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 5ab:	03 72 04             	add    0x4(%edx),%esi
 5ae:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5b1:	8b 10                	mov    (%eax),%edx
 5b3:	8b 12                	mov    (%edx),%edx
 5b5:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 5b8:	8b 50 04             	mov    0x4(%eax),%edx
 5bb:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5be:	39 f1                	cmp    %esi,%ecx
 5c0:	75 dd                	jne    59f <free+0x4f>
    p->s.size += bp->s.size;
 5c2:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 5c5:	a3 98 09 00 00       	mov    %eax,0x998
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 5ca:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5cd:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5d0:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 5d2:	5b                   	pop    %ebx
 5d3:	5e                   	pop    %esi
 5d4:	5f                   	pop    %edi
 5d5:	5d                   	pop    %ebp
 5d6:	c3                   	ret    
 5d7:	89 f6                	mov    %esi,%esi
 5d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000005e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	57                   	push   %edi
 5e4:	56                   	push   %esi
 5e5:	53                   	push   %ebx
 5e6:	83 ec 2c             	sub    $0x2c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 5e9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 5ec:	8b 15 98 09 00 00    	mov    0x998,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 5f2:	83 c3 07             	add    $0x7,%ebx
 5f5:	c1 eb 03             	shr    $0x3,%ebx
 5f8:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 5fb:	85 d2                	test   %edx,%edx
 5fd:	0f 84 a3 00 00 00    	je     6a6 <malloc+0xc6>
 603:	8b 02                	mov    (%edx),%eax
 605:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 608:	39 d9                	cmp    %ebx,%ecx
 60a:	73 74                	jae    680 <malloc+0xa0>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 60c:	8d 14 dd 00 00 00 00 	lea    0x0(,%ebx,8),%edx
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 613:	bf 00 80 00 00       	mov    $0x8000,%edi
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 618:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 61b:	eb 0c                	jmp    629 <malloc+0x49>
 61d:	8d 76 00             	lea    0x0(%esi),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 620:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 622:	8b 48 04             	mov    0x4(%eax),%ecx
 625:	39 cb                	cmp    %ecx,%ebx
 627:	76 57                	jbe    680 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 629:	3b 05 98 09 00 00    	cmp    0x998,%eax
 62f:	89 c2                	mov    %eax,%edx
 631:	75 ed                	jne    620 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 633:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 636:	81 fb 00 10 00 00    	cmp    $0x1000,%ebx
 63c:	be 00 10 00 00       	mov    $0x1000,%esi
 641:	0f 43 f3             	cmovae %ebx,%esi
 644:	0f 42 c7             	cmovb  %edi,%eax
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 647:	89 04 24             	mov    %eax,(%esp)
 64a:	e8 cd fc ff ff       	call   31c <sbrk>
  if(p == (char*)-1)
 64f:	83 f8 ff             	cmp    $0xffffffff,%eax
 652:	74 1c                	je     670 <malloc+0x90>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 654:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 657:	83 c0 08             	add    $0x8,%eax
 65a:	89 04 24             	mov    %eax,(%esp)
 65d:	e8 ee fe ff ff       	call   550 <free>
  return freep;
 662:	8b 15 98 09 00 00    	mov    0x998,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 668:	85 d2                	test   %edx,%edx
 66a:	75 b4                	jne    620 <malloc+0x40>
 66c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return 0;
  }
}
 670:	83 c4 2c             	add    $0x2c,%esp
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
 673:	31 c0                	xor    %eax,%eax
  }
}
 675:	5b                   	pop    %ebx
 676:	5e                   	pop    %esi
 677:	5f                   	pop    %edi
 678:	5d                   	pop    %ebp
 679:	c3                   	ret    
 67a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 680:	39 cb                	cmp    %ecx,%ebx
 682:	74 1c                	je     6a0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 684:	29 d9                	sub    %ebx,%ecx
 686:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 689:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 68c:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 68f:	89 15 98 09 00 00    	mov    %edx,0x998
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 695:	83 c4 2c             	add    $0x2c,%esp
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 698:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 69b:	5b                   	pop    %ebx
 69c:	5e                   	pop    %esi
 69d:	5f                   	pop    %edi
 69e:	5d                   	pop    %ebp
 69f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 6a0:	8b 08                	mov    (%eax),%ecx
 6a2:	89 0a                	mov    %ecx,(%edx)
 6a4:	eb e9                	jmp    68f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 6a6:	c7 05 98 09 00 00 9c 	movl   $0x99c,0x998
 6ad:	09 00 00 
    base.s.size = 0;
 6b0:	b8 9c 09 00 00       	mov    $0x99c,%eax
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 6b5:	c7 05 9c 09 00 00 9c 	movl   $0x99c,0x99c
 6bc:	09 00 00 
    base.s.size = 0;
 6bf:	c7 05 a0 09 00 00 00 	movl   $0x0,0x9a0
 6c6:	00 00 00 
 6c9:	e9 3e ff ff ff       	jmp    60c <malloc+0x2c>
