
_rm:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
   5:	be 01 00 00 00       	mov    $0x1,%esi
{
   a:	53                   	push   %ebx
   b:	83 e4 f0             	and    $0xfffffff0,%esp
   e:	83 ec 10             	sub    $0x10,%esp
  11:	8b 7d 08             	mov    0x8(%ebp),%edi
#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
  14:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  17:	83 c3 04             	add    $0x4,%ebx
{
  int i;

  if(argc < 2){
  1a:	83 ff 01             	cmp    $0x1,%edi
  1d:	7e 3a                	jle    59 <main+0x59>
  1f:	90                   	nop
    printf(2, "Usage: rm files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
    if(unlink(argv[i]) < 0){
  20:	8b 03                	mov    (%ebx),%eax
  22:	89 04 24             	mov    %eax,(%esp)
  25:	e8 da 02 00 00       	call   304 <unlink>
  2a:	85 c0                	test   %eax,%eax
  2c:	78 0f                	js     3d <main+0x3d>
  if(argc < 2){
    printf(2, "Usage: rm files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
  2e:	83 c6 01             	add    $0x1,%esi
  31:	83 c3 04             	add    $0x4,%ebx
  34:	39 fe                	cmp    %edi,%esi
  36:	75 e8                	jne    20 <main+0x20>
      printf(2, "rm: %s failed to delete\n", argv[i]);
      break;
    }
  }

  exit();
  38:	e8 77 02 00 00       	call   2b4 <exit>
    exit();
  }

  for(i = 1; i < argc; i++){
    if(unlink(argv[i]) < 0){
      printf(2, "rm: %s failed to delete\n", argv[i]);
  3d:	8b 03                	mov    (%ebx),%eax
  3f:	c7 44 24 04 02 07 00 	movl   $0x702,0x4(%esp)
  46:	00 
  47:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  4e:	89 44 24 08          	mov    %eax,0x8(%esp)
  52:	e8 b9 03 00 00       	call   410 <printf>
      break;
  57:	eb df                	jmp    38 <main+0x38>
main(int argc, char *argv[])
{
  int i;

  if(argc < 2){
    printf(2, "Usage: rm files...\n");
  59:	c7 44 24 04 ee 06 00 	movl   $0x6ee,0x4(%esp)
  60:	00 
  61:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  68:	e8 a3 03 00 00       	call   410 <printf>
    exit();
  6d:	e8 42 02 00 00       	call   2b4 <exit>
  72:	90                   	nop
  73:	90                   	nop
  74:	90                   	nop
  75:	90                   	nop
  76:	90                   	nop
  77:	90                   	nop
  78:	90                   	nop
  79:	90                   	nop
  7a:	90                   	nop
  7b:	90                   	nop
  7c:	90                   	nop
  7d:	90                   	nop
  7e:	90                   	nop
  7f:	90                   	nop

00000080 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  80:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  81:	31 d2                	xor    %edx,%edx
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  83:	89 e5                	mov    %esp,%ebp
  85:	8b 45 08             	mov    0x8(%ebp),%eax
  88:	53                   	push   %ebx
  89:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  90:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
  94:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  97:	83 c2 01             	add    $0x1,%edx
  9a:	84 c9                	test   %cl,%cl
  9c:	75 f2                	jne    90 <strcpy+0x10>
    ;
  return os;
}
  9e:	5b                   	pop    %ebx
  9f:	5d                   	pop    %ebp
  a0:	c3                   	ret    
  a1:	eb 0d                	jmp    b0 <strcmp>
  a3:	90                   	nop
  a4:	90                   	nop
  a5:	90                   	nop
  a6:	90                   	nop
  a7:	90                   	nop
  a8:	90                   	nop
  a9:	90                   	nop
  aa:	90                   	nop
  ab:	90                   	nop
  ac:	90                   	nop
  ad:	90                   	nop
  ae:	90                   	nop
  af:	90                   	nop

000000b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  b6:	56                   	push   %esi
  b7:	8b 55 0c             	mov    0xc(%ebp),%edx
  ba:	53                   	push   %ebx
  while(*p && *p == *q)
  bb:	0f b6 01             	movzbl (%ecx),%eax
  be:	0f b6 1a             	movzbl (%edx),%ebx
  c1:	84 c0                	test   %al,%al
  c3:	74 23                	je     e8 <strcmp+0x38>
  c5:	38 d8                	cmp    %bl,%al
  c7:	74 10                	je     d9 <strcmp+0x29>
  c9:	eb 2d                	jmp    f8 <strcmp+0x48>
  cb:	90                   	nop
  cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  d0:	83 c1 01             	add    $0x1,%ecx
  d3:	38 d8                	cmp    %bl,%al
  d5:	75 21                	jne    f8 <strcmp+0x48>
    p++, q++;
  d7:	89 f2                	mov    %esi,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  d9:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
  dd:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  e0:	0f b6 5a 01          	movzbl 0x1(%edx),%ebx
  e4:	84 c0                	test   %al,%al
  e6:	75 e8                	jne    d0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  e8:	0f b6 db             	movzbl %bl,%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  eb:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
  ed:	29 d8                	sub    %ebx,%eax
}
  ef:	5b                   	pop    %ebx
  f0:	5e                   	pop    %esi
  f1:	5d                   	pop    %ebp
  f2:	c3                   	ret    
  f3:	90                   	nop
  f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    p++, q++;
  return (uchar)*p - (uchar)*q;
  f8:	0f b6 db             	movzbl %bl,%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  fb:	0f b6 c0             	movzbl %al,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
  fe:	29 d8                	sub    %ebx,%eax
}
 100:	5b                   	pop    %ebx
 101:	5e                   	pop    %esi
 102:	5d                   	pop    %ebp
 103:	c3                   	ret    
 104:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 10a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000110 <strlen>:

uint
strlen(const char *s)
{
 110:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
 111:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
 113:	89 e5                	mov    %esp,%ebp
 115:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 118:	80 39 00             	cmpb   $0x0,(%ecx)
 11b:	74 0e                	je     12b <strlen+0x1b>
 11d:	31 d2                	xor    %edx,%edx
 11f:	90                   	nop
 120:	83 c2 01             	add    $0x1,%edx
 123:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 127:	89 d0                	mov    %edx,%eax
 129:	75 f5                	jne    120 <strlen+0x10>
    ;
  return n;
}
 12b:	5d                   	pop    %ebp
 12c:	c3                   	ret    
 12d:	8d 76 00             	lea    0x0(%esi),%esi

00000130 <memset>:

void*
memset(void *dst, int c, uint n)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	8b 55 08             	mov    0x8(%ebp),%edx
 136:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 137:	8b 4d 10             	mov    0x10(%ebp),%ecx
 13a:	8b 45 0c             	mov    0xc(%ebp),%eax
 13d:	89 d7                	mov    %edx,%edi
 13f:	fc                   	cld    
 140:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 142:	89 d0                	mov    %edx,%eax
 144:	5f                   	pop    %edi
 145:	5d                   	pop    %ebp
 146:	c3                   	ret    
 147:	89 f6                	mov    %esi,%esi
 149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000150 <strchr>:

char*
strchr(const char *s, char c)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 45 08             	mov    0x8(%ebp),%eax
 156:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 15a:	0f b6 10             	movzbl (%eax),%edx
 15d:	84 d2                	test   %dl,%dl
 15f:	75 12                	jne    173 <strchr+0x23>
 161:	eb 1d                	jmp    180 <strchr+0x30>
 163:	90                   	nop
 164:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 168:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 16c:	84 d2                	test   %dl,%dl
 16e:	74 10                	je     180 <strchr+0x30>
 170:	83 c0 01             	add    $0x1,%eax
    if(*s == c)
 173:	38 ca                	cmp    %cl,%dl
 175:	75 f1                	jne    168 <strchr+0x18>
      return (char*)s;
  return 0;
}
 177:	5d                   	pop    %ebp
 178:	c3                   	ret    
 179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 180:	31 c0                	xor    %eax,%eax
}
 182:	5d                   	pop    %ebp
 183:	c3                   	ret    
 184:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 18a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000190 <gets>:

char*
gets(char *buf, int max)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	57                   	push   %edi
 194:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 195:	31 f6                	xor    %esi,%esi
  return 0;
}

char*
gets(char *buf, int max)
{
 197:	53                   	push   %ebx
 198:	83 ec 2c             	sub    $0x2c,%esp
 19b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 19e:	eb 31                	jmp    1d1 <gets+0x41>
    cc = read(0, &c, 1);
 1a0:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1a3:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1aa:	00 
 1ab:	89 44 24 04          	mov    %eax,0x4(%esp)
 1af:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1b6:	e8 11 01 00 00       	call   2cc <read>
    if(cc < 1)
 1bb:	85 c0                	test   %eax,%eax
 1bd:	7e 1a                	jle    1d9 <gets+0x49>
      break;
    buf[i++] = c;
 1bf:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1c3:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 1c5:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 1c7:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 1cb:	74 0c                	je     1d9 <gets+0x49>
 1cd:	3c 0a                	cmp    $0xa,%al
 1cf:	74 08                	je     1d9 <gets+0x49>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1d1:	8d 5e 01             	lea    0x1(%esi),%ebx
 1d4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1d7:	7c c7                	jl     1a0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1d9:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 1dd:	83 c4 2c             	add    $0x2c,%esp
 1e0:	89 f8                	mov    %edi,%eax
 1e2:	5b                   	pop    %ebx
 1e3:	5e                   	pop    %esi
 1e4:	5f                   	pop    %edi
 1e5:	5d                   	pop    %ebp
 1e6:	c3                   	ret    
 1e7:	89 f6                	mov    %esi,%esi
 1e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f6:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(const char *n, struct stat *st)
{
 1f9:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 1fc:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 1ff:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 204:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 20b:	00 
 20c:	89 04 24             	mov    %eax,(%esp)
 20f:	e8 e0 00 00 00       	call   2f4 <open>
  if(fd < 0)
 214:	85 c0                	test   %eax,%eax
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 216:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 218:	78 19                	js     233 <stat+0x43>
    return -1;
  r = fstat(fd, st);
 21a:	8b 45 0c             	mov    0xc(%ebp),%eax
 21d:	89 1c 24             	mov    %ebx,(%esp)
 220:	89 44 24 04          	mov    %eax,0x4(%esp)
 224:	e8 e3 00 00 00       	call   30c <fstat>
  close(fd);
 229:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 22c:	89 c6                	mov    %eax,%esi
  close(fd);
 22e:	e8 a9 00 00 00       	call   2dc <close>
  return r;
}
 233:	89 f0                	mov    %esi,%eax
 235:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 238:	8b 75 fc             	mov    -0x4(%ebp),%esi
 23b:	89 ec                	mov    %ebp,%esp
 23d:	5d                   	pop    %ebp
 23e:	c3                   	ret    
 23f:	90                   	nop

00000240 <atoi>:

int
atoi(const char *s)
{
 240:	55                   	push   %ebp
  int n;

  n = 0;
 241:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
 243:	89 e5                	mov    %esp,%ebp
 245:	8b 4d 08             	mov    0x8(%ebp),%ecx
 248:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 249:	0f b6 11             	movzbl (%ecx),%edx
 24c:	8d 5a d0             	lea    -0x30(%edx),%ebx
 24f:	80 fb 09             	cmp    $0x9,%bl
 252:	77 1c                	ja     270 <atoi+0x30>
 254:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 258:	0f be d2             	movsbl %dl,%edx
 25b:	83 c1 01             	add    $0x1,%ecx
 25e:	8d 04 80             	lea    (%eax,%eax,4),%eax
 261:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 265:	0f b6 11             	movzbl (%ecx),%edx
 268:	8d 5a d0             	lea    -0x30(%edx),%ebx
 26b:	80 fb 09             	cmp    $0x9,%bl
 26e:	76 e8                	jbe    258 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 270:	5b                   	pop    %ebx
 271:	5d                   	pop    %ebp
 272:	c3                   	ret    
 273:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000280 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	56                   	push   %esi
 284:	8b 45 08             	mov    0x8(%ebp),%eax
 287:	53                   	push   %ebx
 288:	8b 5d 10             	mov    0x10(%ebp),%ebx
 28b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 28e:	85 db                	test   %ebx,%ebx
 290:	7e 14                	jle    2a6 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, const void *vsrc, int n)
 292:	31 d2                	xor    %edx,%edx
 294:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 298:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 29c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 29f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2a2:	39 da                	cmp    %ebx,%edx
 2a4:	75 f2                	jne    298 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 2a6:	5b                   	pop    %ebx
 2a7:	5e                   	pop    %esi
 2a8:	5d                   	pop    %ebp
 2a9:	c3                   	ret    
 2aa:	90                   	nop
 2ab:	90                   	nop

000002ac <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2ac:	b8 01 00 00 00       	mov    $0x1,%eax
 2b1:	cd 40                	int    $0x40
 2b3:	c3                   	ret    

000002b4 <exit>:
SYSCALL(exit)
 2b4:	b8 02 00 00 00       	mov    $0x2,%eax
 2b9:	cd 40                	int    $0x40
 2bb:	c3                   	ret    

000002bc <wait>:
SYSCALL(wait)
 2bc:	b8 03 00 00 00       	mov    $0x3,%eax
 2c1:	cd 40                	int    $0x40
 2c3:	c3                   	ret    

000002c4 <pipe>:
SYSCALL(pipe)
 2c4:	b8 04 00 00 00       	mov    $0x4,%eax
 2c9:	cd 40                	int    $0x40
 2cb:	c3                   	ret    

000002cc <read>:
SYSCALL(read)
 2cc:	b8 05 00 00 00       	mov    $0x5,%eax
 2d1:	cd 40                	int    $0x40
 2d3:	c3                   	ret    

000002d4 <write>:
SYSCALL(write)
 2d4:	b8 10 00 00 00       	mov    $0x10,%eax
 2d9:	cd 40                	int    $0x40
 2db:	c3                   	ret    

000002dc <close>:
SYSCALL(close)
 2dc:	b8 15 00 00 00       	mov    $0x15,%eax
 2e1:	cd 40                	int    $0x40
 2e3:	c3                   	ret    

000002e4 <kill>:
SYSCALL(kill)
 2e4:	b8 06 00 00 00       	mov    $0x6,%eax
 2e9:	cd 40                	int    $0x40
 2eb:	c3                   	ret    

000002ec <exec>:
SYSCALL(exec)
 2ec:	b8 07 00 00 00       	mov    $0x7,%eax
 2f1:	cd 40                	int    $0x40
 2f3:	c3                   	ret    

000002f4 <open>:
SYSCALL(open)
 2f4:	b8 0f 00 00 00       	mov    $0xf,%eax
 2f9:	cd 40                	int    $0x40
 2fb:	c3                   	ret    

000002fc <mknod>:
SYSCALL(mknod)
 2fc:	b8 11 00 00 00       	mov    $0x11,%eax
 301:	cd 40                	int    $0x40
 303:	c3                   	ret    

00000304 <unlink>:
SYSCALL(unlink)
 304:	b8 12 00 00 00       	mov    $0x12,%eax
 309:	cd 40                	int    $0x40
 30b:	c3                   	ret    

0000030c <fstat>:
SYSCALL(fstat)
 30c:	b8 08 00 00 00       	mov    $0x8,%eax
 311:	cd 40                	int    $0x40
 313:	c3                   	ret    

00000314 <link>:
SYSCALL(link)
 314:	b8 13 00 00 00       	mov    $0x13,%eax
 319:	cd 40                	int    $0x40
 31b:	c3                   	ret    

0000031c <mkdir>:
SYSCALL(mkdir)
 31c:	b8 14 00 00 00       	mov    $0x14,%eax
 321:	cd 40                	int    $0x40
 323:	c3                   	ret    

00000324 <chdir>:
SYSCALL(chdir)
 324:	b8 09 00 00 00       	mov    $0x9,%eax
 329:	cd 40                	int    $0x40
 32b:	c3                   	ret    

0000032c <dup>:
SYSCALL(dup)
 32c:	b8 0a 00 00 00       	mov    $0xa,%eax
 331:	cd 40                	int    $0x40
 333:	c3                   	ret    

00000334 <getpid>:
SYSCALL(getpid)
 334:	b8 0b 00 00 00       	mov    $0xb,%eax
 339:	cd 40                	int    $0x40
 33b:	c3                   	ret    

0000033c <sbrk>:
SYSCALL(sbrk)
 33c:	b8 0c 00 00 00       	mov    $0xc,%eax
 341:	cd 40                	int    $0x40
 343:	c3                   	ret    

00000344 <sleep>:
SYSCALL(sleep)
 344:	b8 0d 00 00 00       	mov    $0xd,%eax
 349:	cd 40                	int    $0x40
 34b:	c3                   	ret    

0000034c <uptime>:
SYSCALL(uptime)
 34c:	b8 0e 00 00 00       	mov    $0xe,%eax
 351:	cd 40                	int    $0x40
 353:	c3                   	ret    
 354:	90                   	nop
 355:	90                   	nop
 356:	90                   	nop
 357:	90                   	nop
 358:	90                   	nop
 359:	90                   	nop
 35a:	90                   	nop
 35b:	90                   	nop
 35c:	90                   	nop
 35d:	90                   	nop
 35e:	90                   	nop
 35f:	90                   	nop

00000360 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	83 ec 28             	sub    $0x28,%esp
 366:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 369:	8d 55 f4             	lea    -0xc(%ebp),%edx
 36c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 373:	00 
 374:	89 54 24 04          	mov    %edx,0x4(%esp)
 378:	89 04 24             	mov    %eax,(%esp)
 37b:	e8 54 ff ff ff       	call   2d4 <write>
}
 380:	c9                   	leave  
 381:	c3                   	ret    
 382:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000390 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	57                   	push   %edi
 394:	56                   	push   %esi
 395:	89 c6                	mov    %eax,%esi
 397:	53                   	push   %ebx
 398:	83 ec 1c             	sub    $0x1c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 39b:	8b 45 08             	mov    0x8(%ebp),%eax
 39e:	85 c0                	test   %eax,%eax
 3a0:	74 5e                	je     400 <printint+0x70>
 3a2:	89 d0                	mov    %edx,%eax
 3a4:	c1 e8 1f             	shr    $0x1f,%eax
 3a7:	84 c0                	test   %al,%al
 3a9:	74 55                	je     400 <printint+0x70>
    neg = 1;
    x = -xx;
 3ab:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 3ad:	bf 01 00 00 00       	mov    $0x1,%edi
    x = -xx;
 3b2:	f7 d8                	neg    %eax
  } else {
    x = xx;
  }

  i = 0;
 3b4:	31 db                	xor    %ebx,%ebx
 3b6:	eb 02                	jmp    3ba <printint+0x2a>
  do{
    buf[i++] = digits[x % base];
 3b8:	89 d3                	mov    %edx,%ebx
 3ba:	31 d2                	xor    %edx,%edx
 3bc:	f7 f1                	div    %ecx
 3be:	0f b6 92 22 07 00 00 	movzbl 0x722(%edx),%edx
  }while((x /= base) != 0);
 3c5:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 3c7:	88 54 1d d8          	mov    %dl,-0x28(%ebp,%ebx,1)
 3cb:	8d 53 01             	lea    0x1(%ebx),%edx
  }while((x /= base) != 0);
 3ce:	75 e8                	jne    3b8 <printint+0x28>
  if(neg)
 3d0:	85 ff                	test   %edi,%edi
 3d2:	74 08                	je     3dc <printint+0x4c>
    buf[i++] = '-';
 3d4:	c6 44 15 d8 2d       	movb   $0x2d,-0x28(%ebp,%edx,1)
 3d9:	8d 53 02             	lea    0x2(%ebx),%edx

  while(--i >= 0)
 3dc:	8d 5a ff             	lea    -0x1(%edx),%ebx
 3df:	90                   	nop
    putc(fd, buf[i]);
 3e0:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 3e5:	89 f0                	mov    %esi,%eax
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 3e7:	83 eb 01             	sub    $0x1,%ebx
    putc(fd, buf[i]);
 3ea:	e8 71 ff ff ff       	call   360 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 3ef:	83 fb ff             	cmp    $0xffffffff,%ebx
 3f2:	75 ec                	jne    3e0 <printint+0x50>
    putc(fd, buf[i]);
}
 3f4:	83 c4 1c             	add    $0x1c,%esp
 3f7:	5b                   	pop    %ebx
 3f8:	5e                   	pop    %esi
 3f9:	5f                   	pop    %edi
 3fa:	5d                   	pop    %ebp
 3fb:	c3                   	ret    
 3fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 400:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 402:	31 ff                	xor    %edi,%edi
 404:	eb ae                	jmp    3b4 <printint+0x24>
 406:	8d 76 00             	lea    0x0(%esi),%esi
 409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000410 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
 414:	56                   	push   %esi
 415:	53                   	push   %ebx
 416:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 419:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 41c:	0f b6 0b             	movzbl (%ebx),%ecx
 41f:	84 c9                	test   %cl,%cl
 421:	0f 84 89 00 00 00    	je     4b0 <printf+0xa0>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 427:	8d 45 10             	lea    0x10(%ebp),%eax
{
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 42a:	31 f6                	xor    %esi,%esi
  ap = (uint*)(void*)&fmt + 1;
 42c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 42f:	eb 21                	jmp    452 <printf+0x42>
 431:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 438:	83 f9 25             	cmp    $0x25,%ecx
 43b:	74 7b                	je     4b8 <printf+0xa8>
        state = '%';
      } else {
        putc(fd, c);
 43d:	8b 45 08             	mov    0x8(%ebp),%eax
 440:	0f be d1             	movsbl %cl,%edx
 443:	e8 18 ff ff ff       	call   360 <putc>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 448:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 44b:	0f b6 0b             	movzbl (%ebx),%ecx
 44e:	84 c9                	test   %cl,%cl
 450:	74 5e                	je     4b0 <printf+0xa0>
    c = fmt[i] & 0xff;
    if(state == 0){
 452:	85 f6                	test   %esi,%esi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 454:	0f b6 c9             	movzbl %cl,%ecx
    if(state == 0){
 457:	74 df                	je     438 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 459:	83 fe 25             	cmp    $0x25,%esi
 45c:	75 ea                	jne    448 <printf+0x38>
      if(c == 'd'){
 45e:	83 f9 64             	cmp    $0x64,%ecx
 461:	0f 84 c9 00 00 00    	je     530 <printf+0x120>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 467:	83 f9 70             	cmp    $0x70,%ecx
 46a:	74 54                	je     4c0 <printf+0xb0>
 46c:	83 f9 78             	cmp    $0x78,%ecx
 46f:	90                   	nop
 470:	74 4e                	je     4c0 <printf+0xb0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 472:	83 f9 73             	cmp    $0x73,%ecx
 475:	74 71                	je     4e8 <printf+0xd8>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 477:	83 f9 63             	cmp    $0x63,%ecx
 47a:	0f 84 d2 00 00 00    	je     552 <printf+0x142>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 480:	83 f9 25             	cmp    $0x25,%ecx
        putc(fd, c);
 483:	ba 25 00 00 00       	mov    $0x25,%edx
 488:	8b 45 08             	mov    0x8(%ebp),%eax
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 48b:	74 11                	je     49e <printf+0x8e>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 48d:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 490:	e8 cb fe ff ff       	call   360 <putc>
        putc(fd, c);
 495:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 498:	8b 45 08             	mov    0x8(%ebp),%eax
 49b:	0f be d1             	movsbl %cl,%edx
 49e:	83 c3 01             	add    $0x1,%ebx
      }
      state = 0;
 4a1:	31 f6                	xor    %esi,%esi
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 4a3:	e8 b8 fe ff ff       	call   360 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4a8:	0f b6 0b             	movzbl (%ebx),%ecx
 4ab:	84 c9                	test   %cl,%cl
 4ad:	75 a3                	jne    452 <printf+0x42>
 4af:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 4b0:	83 c4 2c             	add    $0x2c,%esp
 4b3:	5b                   	pop    %ebx
 4b4:	5e                   	pop    %esi
 4b5:	5f                   	pop    %edi
 4b6:	5d                   	pop    %ebp
 4b7:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 4b8:	be 25 00 00 00       	mov    $0x25,%esi
 4bd:	eb 89                	jmp    448 <printf+0x38>
 4bf:	90                   	nop
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 4c0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4c3:	b9 10 00 00 00       	mov    $0x10,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4c8:	31 f6                	xor    %esi,%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 4ca:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 4d1:	8b 10                	mov    (%eax),%edx
 4d3:	8b 45 08             	mov    0x8(%ebp),%eax
 4d6:	e8 b5 fe ff ff       	call   390 <printint>
        ap++;
 4db:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 4df:	e9 64 ff ff ff       	jmp    448 <printf+0x38>
 4e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 4e8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4eb:	8b 38                	mov    (%eax),%edi
        ap++;
 4ed:	83 c0 04             	add    $0x4,%eax
 4f0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
          s = "(null)";
 4f3:	b8 1b 07 00 00       	mov    $0x71b,%eax
 4f8:	85 ff                	test   %edi,%edi
 4fa:	0f 44 f8             	cmove  %eax,%edi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4fd:	31 f6                	xor    %esi,%esi
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 4ff:	0f b6 17             	movzbl (%edi),%edx
 502:	84 d2                	test   %dl,%dl
 504:	0f 84 3e ff ff ff    	je     448 <printf+0x38>
 50a:	89 de                	mov    %ebx,%esi
 50c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 50f:	90                   	nop
          putc(fd, *s);
 510:	0f be d2             	movsbl %dl,%edx
          s++;
 513:	83 c7 01             	add    $0x1,%edi
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
 516:	89 d8                	mov    %ebx,%eax
 518:	e8 43 fe ff ff       	call   360 <putc>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 51d:	0f b6 17             	movzbl (%edi),%edx
 520:	84 d2                	test   %dl,%dl
 522:	75 ec                	jne    510 <printf+0x100>
 524:	89 f3                	mov    %esi,%ebx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 526:	31 f6                	xor    %esi,%esi
 528:	e9 1b ff ff ff       	jmp    448 <printf+0x38>
 52d:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 530:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 533:	b1 0a                	mov    $0xa,%cl
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 535:	66 31 f6             	xor    %si,%si
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 538:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 53f:	8b 10                	mov    (%eax),%edx
 541:	8b 45 08             	mov    0x8(%ebp),%eax
 544:	e8 47 fe ff ff       	call   390 <printint>
        ap++;
 549:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 54d:	e9 f6 fe ff ff       	jmp    448 <printf+0x38>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 552:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 555:	31 f6                	xor    %esi,%esi
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 557:	0f be 10             	movsbl (%eax),%edx
 55a:	8b 45 08             	mov    0x8(%ebp),%eax
 55d:	e8 fe fd ff ff       	call   360 <putc>
        ap++;
 562:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 566:	e9 dd fe ff ff       	jmp    448 <printf+0x38>
 56b:	90                   	nop
 56c:	90                   	nop
 56d:	90                   	nop
 56e:	90                   	nop
 56f:	90                   	nop

00000570 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 570:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 571:	a1 d4 09 00 00       	mov    0x9d4,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 576:	89 e5                	mov    %esp,%ebp
 578:	57                   	push   %edi
 579:	56                   	push   %esi
 57a:	53                   	push   %ebx
 57b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 57e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 581:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 588:	39 c8                	cmp    %ecx,%eax
 58a:	8b 10                	mov    (%eax),%edx
 58c:	73 04                	jae    592 <free+0x22>
 58e:	39 d1                	cmp    %edx,%ecx
 590:	72 16                	jb     5a8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 592:	39 d0                	cmp    %edx,%eax
 594:	72 0c                	jb     5a2 <free+0x32>
 596:	39 c8                	cmp    %ecx,%eax
 598:	72 0e                	jb     5a8 <free+0x38>
 59a:	39 d1                	cmp    %edx,%ecx
 59c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5a0:	72 06                	jb     5a8 <free+0x38>
static Header base;
static Header *freep;

void
free(void *ap)
{
 5a2:	89 d0                	mov    %edx,%eax
 5a4:	eb e2                	jmp    588 <free+0x18>
 5a6:	66 90                	xchg   %ax,%ax

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 5a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5ae:	39 d7                	cmp    %edx,%edi
 5b0:	74 19                	je     5cb <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5b2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5b5:	8b 50 04             	mov    0x4(%eax),%edx
 5b8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5bb:	39 f1                	cmp    %esi,%ecx
 5bd:	74 23                	je     5e2 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5bf:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5c1:	a3 d4 09 00 00       	mov    %eax,0x9d4
}
 5c6:	5b                   	pop    %ebx
 5c7:	5e                   	pop    %esi
 5c8:	5f                   	pop    %edi
 5c9:	5d                   	pop    %ebp
 5ca:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 5cb:	03 72 04             	add    0x4(%edx),%esi
 5ce:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5d1:	8b 10                	mov    (%eax),%edx
 5d3:	8b 12                	mov    (%edx),%edx
 5d5:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 5d8:	8b 50 04             	mov    0x4(%eax),%edx
 5db:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5de:	39 f1                	cmp    %esi,%ecx
 5e0:	75 dd                	jne    5bf <free+0x4f>
    p->s.size += bp->s.size;
 5e2:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 5e5:	a3 d4 09 00 00       	mov    %eax,0x9d4
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 5ea:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5ed:	8b 53 f8             	mov    -0x8(%ebx),%edx
 5f0:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 5f2:	5b                   	pop    %ebx
 5f3:	5e                   	pop    %esi
 5f4:	5f                   	pop    %edi
 5f5:	5d                   	pop    %ebp
 5f6:	c3                   	ret    
 5f7:	89 f6                	mov    %esi,%esi
 5f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000600 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 600:	55                   	push   %ebp
 601:	89 e5                	mov    %esp,%ebp
 603:	57                   	push   %edi
 604:	56                   	push   %esi
 605:	53                   	push   %ebx
 606:	83 ec 2c             	sub    $0x2c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 609:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 60c:	8b 15 d4 09 00 00    	mov    0x9d4,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 612:	83 c3 07             	add    $0x7,%ebx
 615:	c1 eb 03             	shr    $0x3,%ebx
 618:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 61b:	85 d2                	test   %edx,%edx
 61d:	0f 84 a3 00 00 00    	je     6c6 <malloc+0xc6>
 623:	8b 02                	mov    (%edx),%eax
 625:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 628:	39 d9                	cmp    %ebx,%ecx
 62a:	73 74                	jae    6a0 <malloc+0xa0>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 62c:	8d 14 dd 00 00 00 00 	lea    0x0(,%ebx,8),%edx
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 633:	bf 00 80 00 00       	mov    $0x8000,%edi
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 638:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 63b:	eb 0c                	jmp    649 <malloc+0x49>
 63d:	8d 76 00             	lea    0x0(%esi),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 640:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 642:	8b 48 04             	mov    0x4(%eax),%ecx
 645:	39 cb                	cmp    %ecx,%ebx
 647:	76 57                	jbe    6a0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 649:	3b 05 d4 09 00 00    	cmp    0x9d4,%eax
 64f:	89 c2                	mov    %eax,%edx
 651:	75 ed                	jne    640 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 653:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 656:	81 fb 00 10 00 00    	cmp    $0x1000,%ebx
 65c:	be 00 10 00 00       	mov    $0x1000,%esi
 661:	0f 43 f3             	cmovae %ebx,%esi
 664:	0f 42 c7             	cmovb  %edi,%eax
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 667:	89 04 24             	mov    %eax,(%esp)
 66a:	e8 cd fc ff ff       	call   33c <sbrk>
  if(p == (char*)-1)
 66f:	83 f8 ff             	cmp    $0xffffffff,%eax
 672:	74 1c                	je     690 <malloc+0x90>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 674:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 677:	83 c0 08             	add    $0x8,%eax
 67a:	89 04 24             	mov    %eax,(%esp)
 67d:	e8 ee fe ff ff       	call   570 <free>
  return freep;
 682:	8b 15 d4 09 00 00    	mov    0x9d4,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 688:	85 d2                	test   %edx,%edx
 68a:	75 b4                	jne    640 <malloc+0x40>
 68c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return 0;
  }
}
 690:	83 c4 2c             	add    $0x2c,%esp
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
 693:	31 c0                	xor    %eax,%eax
  }
}
 695:	5b                   	pop    %ebx
 696:	5e                   	pop    %esi
 697:	5f                   	pop    %edi
 698:	5d                   	pop    %ebp
 699:	c3                   	ret    
 69a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6a0:	39 cb                	cmp    %ecx,%ebx
 6a2:	74 1c                	je     6c0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6a4:	29 d9                	sub    %ebx,%ecx
 6a6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 6a9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 6ac:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 6af:	89 15 d4 09 00 00    	mov    %edx,0x9d4
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6b5:	83 c4 2c             	add    $0x2c,%esp
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 6b8:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6bb:	5b                   	pop    %ebx
 6bc:	5e                   	pop    %esi
 6bd:	5f                   	pop    %edi
 6be:	5d                   	pop    %ebp
 6bf:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 6c0:	8b 08                	mov    (%eax),%ecx
 6c2:	89 0a                	mov    %ecx,(%edx)
 6c4:	eb e9                	jmp    6af <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 6c6:	c7 05 d4 09 00 00 d8 	movl   $0x9d8,0x9d4
 6cd:	09 00 00 
    base.s.size = 0;
 6d0:	b8 d8 09 00 00       	mov    $0x9d8,%eax
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 6d5:	c7 05 d8 09 00 00 d8 	movl   $0x9d8,0x9d8
 6dc:	09 00 00 
    base.s.size = 0;
 6df:	c7 05 dc 09 00 00 00 	movl   $0x0,0x9dc
 6e6:	00 00 00 
 6e9:	e9 3e ff ff ff       	jmp    62c <malloc+0x2c>
