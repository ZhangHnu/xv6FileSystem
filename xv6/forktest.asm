
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "fork test OK\n");
}

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
  forktest();
   6:	e8 35 00 00 00       	call   40 <forktest>
  exit();
   b:	e8 44 03 00 00       	call   354 <exit>

00000010 <printf>:

#define N  1000

void
printf(int fd, const char *s, ...)
{
  10:	55                   	push   %ebp
  11:	89 e5                	mov    %esp,%ebp
  13:	53                   	push   %ebx
  14:	83 ec 14             	sub    $0x14,%esp
  17:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  write(fd, s, strlen(s));
  1a:	89 1c 24             	mov    %ebx,(%esp)
  1d:	e8 8e 01 00 00       	call   1b0 <strlen>
  22:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  26:	89 44 24 08          	mov    %eax,0x8(%esp)
  2a:	8b 45 08             	mov    0x8(%ebp),%eax
  2d:	89 04 24             	mov    %eax,(%esp)
  30:	e8 3f 03 00 00       	call   374 <write>
}
  35:	83 c4 14             	add    $0x14,%esp
  38:	5b                   	pop    %ebx
  39:	5d                   	pop    %ebp
  3a:	c3                   	ret    
  3b:	90                   	nop
  3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000040 <forktest>:

void
forktest(void)
{
  40:	55                   	push   %ebp
  41:	89 e5                	mov    %esp,%ebp
  43:	53                   	push   %ebx
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<N; n++){
  44:	31 db                	xor    %ebx,%ebx
  write(fd, s, strlen(s));
}

void
forktest(void)
{
  46:	83 ec 14             	sub    $0x14,%esp
  int n, pid;

  printf(1, "fork test\n");
  49:	c7 44 24 04 f4 03 00 	movl   $0x3f4,0x4(%esp)
  50:	00 
  51:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  58:	e8 b3 ff ff ff       	call   10 <printf>
  5d:	eb 13                	jmp    72 <forktest+0x32>
  5f:	90                   	nop

  for(n=0; n<N; n++){
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0)
  60:	0f 84 8f 00 00 00    	je     f5 <forktest+0xb5>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<N; n++){
  66:	83 c3 01             	add    $0x1,%ebx
  69:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
  6f:	90                   	nop
  70:	74 4e                	je     c0 <forktest+0x80>
    pid = fork();
  72:	e8 d5 02 00 00       	call   34c <fork>
    if(pid < 0)
  77:	83 f8 00             	cmp    $0x0,%eax
  7a:	7d e4                	jge    60 <forktest+0x20>
  if(n == N){
    printf(1, "fork claimed to work N times!\n", N);
    exit();
  }

  for(; n > 0; n--){
  7c:	85 db                	test   %ebx,%ebx
  7e:	66 90                	xchg   %ax,%ax
  80:	74 15                	je     97 <forktest+0x57>
  82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(wait() < 0){
  88:	e8 cf 02 00 00       	call   35c <wait>
  8d:	85 c0                	test   %eax,%eax
  8f:	90                   	nop
  90:	78 4f                	js     e1 <forktest+0xa1>
  if(n == N){
    printf(1, "fork claimed to work N times!\n", N);
    exit();
  }

  for(; n > 0; n--){
  92:	83 eb 01             	sub    $0x1,%ebx
  95:	75 f1                	jne    88 <forktest+0x48>
      printf(1, "wait stopped early\n");
      exit();
    }
  }

  if(wait() != -1){
  97:	e8 c0 02 00 00       	call   35c <wait>
  9c:	83 f8 ff             	cmp    $0xffffffff,%eax
  9f:	90                   	nop
  a0:	75 58                	jne    fa <forktest+0xba>
    printf(1, "wait got too many\n");
    exit();
  }

  printf(1, "fork test OK\n");
  a2:	c7 44 24 04 26 04 00 	movl   $0x426,0x4(%esp)
  a9:	00 
  aa:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  b1:	e8 5a ff ff ff       	call   10 <printf>
}
  b6:	83 c4 14             	add    $0x14,%esp
  b9:	5b                   	pop    %ebx
  ba:	5d                   	pop    %ebp
  bb:	c3                   	ret    
  bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid == 0)
      exit();
  }

  if(n == N){
    printf(1, "fork claimed to work N times!\n", N);
  c0:	c7 44 24 08 e8 03 00 	movl   $0x3e8,0x8(%esp)
  c7:	00 
  c8:	c7 44 24 04 34 04 00 	movl   $0x434,0x4(%esp)
  cf:	00 
  d0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d7:	e8 34 ff ff ff       	call   10 <printf>
    exit();
  dc:	e8 73 02 00 00       	call   354 <exit>
  }

  for(; n > 0; n--){
    if(wait() < 0){
      printf(1, "wait stopped early\n");
  e1:	c7 44 24 04 ff 03 00 	movl   $0x3ff,0x4(%esp)
  e8:	00 
  e9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  f0:	e8 1b ff ff ff       	call   10 <printf>
      exit();
  f5:	e8 5a 02 00 00       	call   354 <exit>
    }
  }

  if(wait() != -1){
    printf(1, "wait got too many\n");
  fa:	c7 44 24 04 13 04 00 	movl   $0x413,0x4(%esp)
 101:	00 
 102:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 109:	e8 02 ff ff ff       	call   10 <printf>
    exit();
 10e:	e8 41 02 00 00       	call   354 <exit>
 113:	90                   	nop
 114:	90                   	nop
 115:	90                   	nop
 116:	90                   	nop
 117:	90                   	nop
 118:	90                   	nop
 119:	90                   	nop
 11a:	90                   	nop
 11b:	90                   	nop
 11c:	90                   	nop
 11d:	90                   	nop
 11e:	90                   	nop
 11f:	90                   	nop

00000120 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 120:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 121:	31 d2                	xor    %edx,%edx
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 123:	89 e5                	mov    %esp,%ebp
 125:	8b 45 08             	mov    0x8(%ebp),%eax
 128:	53                   	push   %ebx
 129:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 130:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 134:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 137:	83 c2 01             	add    $0x1,%edx
 13a:	84 c9                	test   %cl,%cl
 13c:	75 f2                	jne    130 <strcpy+0x10>
    ;
  return os;
}
 13e:	5b                   	pop    %ebx
 13f:	5d                   	pop    %ebp
 140:	c3                   	ret    
 141:	eb 0d                	jmp    150 <strcmp>
 143:	90                   	nop
 144:	90                   	nop
 145:	90                   	nop
 146:	90                   	nop
 147:	90                   	nop
 148:	90                   	nop
 149:	90                   	nop
 14a:	90                   	nop
 14b:	90                   	nop
 14c:	90                   	nop
 14d:	90                   	nop
 14e:	90                   	nop
 14f:	90                   	nop

00000150 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 4d 08             	mov    0x8(%ebp),%ecx
 156:	56                   	push   %esi
 157:	8b 55 0c             	mov    0xc(%ebp),%edx
 15a:	53                   	push   %ebx
  while(*p && *p == *q)
 15b:	0f b6 01             	movzbl (%ecx),%eax
 15e:	0f b6 1a             	movzbl (%edx),%ebx
 161:	84 c0                	test   %al,%al
 163:	74 23                	je     188 <strcmp+0x38>
 165:	38 d8                	cmp    %bl,%al
 167:	74 10                	je     179 <strcmp+0x29>
 169:	eb 2d                	jmp    198 <strcmp+0x48>
 16b:	90                   	nop
 16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 170:	83 c1 01             	add    $0x1,%ecx
 173:	38 d8                	cmp    %bl,%al
 175:	75 21                	jne    198 <strcmp+0x48>
    p++, q++;
 177:	89 f2                	mov    %esi,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 179:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 17d:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 180:	0f b6 5a 01          	movzbl 0x1(%edx),%ebx
 184:	84 c0                	test   %al,%al
 186:	75 e8                	jne    170 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 188:	0f b6 db             	movzbl %bl,%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 18b:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 18d:	29 d8                	sub    %ebx,%eax
}
 18f:	5b                   	pop    %ebx
 190:	5e                   	pop    %esi
 191:	5d                   	pop    %ebp
 192:	c3                   	ret    
 193:	90                   	nop
 194:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 198:	0f b6 db             	movzbl %bl,%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 19b:	0f b6 c0             	movzbl %al,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 19e:	29 d8                	sub    %ebx,%eax
}
 1a0:	5b                   	pop    %ebx
 1a1:	5e                   	pop    %esi
 1a2:	5d                   	pop    %ebp
 1a3:	c3                   	ret    
 1a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001b0 <strlen>:

uint
strlen(const char *s)
{
 1b0:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
 1b1:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
 1b3:	89 e5                	mov    %esp,%ebp
 1b5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1b8:	80 39 00             	cmpb   $0x0,(%ecx)
 1bb:	74 0e                	je     1cb <strlen+0x1b>
 1bd:	31 d2                	xor    %edx,%edx
 1bf:	90                   	nop
 1c0:	83 c2 01             	add    $0x1,%edx
 1c3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1c7:	89 d0                	mov    %edx,%eax
 1c9:	75 f5                	jne    1c0 <strlen+0x10>
    ;
  return n;
}
 1cb:	5d                   	pop    %ebp
 1cc:	c3                   	ret    
 1cd:	8d 76 00             	lea    0x0(%esi),%esi

000001d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 55 08             	mov    0x8(%ebp),%edx
 1d6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1da:	8b 45 0c             	mov    0xc(%ebp),%eax
 1dd:	89 d7                	mov    %edx,%edi
 1df:	fc                   	cld    
 1e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1e2:	89 d0                	mov    %edx,%eax
 1e4:	5f                   	pop    %edi
 1e5:	5d                   	pop    %ebp
 1e6:	c3                   	ret    
 1e7:	89 f6                	mov    %esi,%esi
 1e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001f0 <strchr>:

char*
strchr(const char *s, char c)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	8b 45 08             	mov    0x8(%ebp),%eax
 1f6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1fa:	0f b6 10             	movzbl (%eax),%edx
 1fd:	84 d2                	test   %dl,%dl
 1ff:	75 12                	jne    213 <strchr+0x23>
 201:	eb 1d                	jmp    220 <strchr+0x30>
 203:	90                   	nop
 204:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 208:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 20c:	84 d2                	test   %dl,%dl
 20e:	74 10                	je     220 <strchr+0x30>
 210:	83 c0 01             	add    $0x1,%eax
    if(*s == c)
 213:	38 ca                	cmp    %cl,%dl
 215:	75 f1                	jne    208 <strchr+0x18>
      return (char*)s;
  return 0;
}
 217:	5d                   	pop    %ebp
 218:	c3                   	ret    
 219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 220:	31 c0                	xor    %eax,%eax
}
 222:	5d                   	pop    %ebp
 223:	c3                   	ret    
 224:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 22a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000230 <gets>:

char*
gets(char *buf, int max)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	57                   	push   %edi
 234:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 235:	31 f6                	xor    %esi,%esi
  return 0;
}

char*
gets(char *buf, int max)
{
 237:	53                   	push   %ebx
 238:	83 ec 2c             	sub    $0x2c,%esp
 23b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 23e:	eb 31                	jmp    271 <gets+0x41>
    cc = read(0, &c, 1);
 240:	8d 45 e7             	lea    -0x19(%ebp),%eax
 243:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 24a:	00 
 24b:	89 44 24 04          	mov    %eax,0x4(%esp)
 24f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 256:	e8 11 01 00 00       	call   36c <read>
    if(cc < 1)
 25b:	85 c0                	test   %eax,%eax
 25d:	7e 1a                	jle    279 <gets+0x49>
      break;
    buf[i++] = c;
 25f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 263:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 265:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 267:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 26b:	74 0c                	je     279 <gets+0x49>
 26d:	3c 0a                	cmp    $0xa,%al
 26f:	74 08                	je     279 <gets+0x49>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 271:	8d 5e 01             	lea    0x1(%esi),%ebx
 274:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 277:	7c c7                	jl     240 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 279:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 27d:	83 c4 2c             	add    $0x2c,%esp
 280:	89 f8                	mov    %edi,%eax
 282:	5b                   	pop    %ebx
 283:	5e                   	pop    %esi
 284:	5f                   	pop    %edi
 285:	5d                   	pop    %ebp
 286:	c3                   	ret    
 287:	89 f6                	mov    %esi,%esi
 289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000290 <stat>:

int
stat(const char *n, struct stat *st)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 296:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(const char *n, struct stat *st)
{
 299:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 29c:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 29f:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2a4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2ab:	00 
 2ac:	89 04 24             	mov    %eax,(%esp)
 2af:	e8 e0 00 00 00       	call   394 <open>
  if(fd < 0)
 2b4:	85 c0                	test   %eax,%eax
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2b6:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 2b8:	78 19                	js     2d3 <stat+0x43>
    return -1;
  r = fstat(fd, st);
 2ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 2bd:	89 1c 24             	mov    %ebx,(%esp)
 2c0:	89 44 24 04          	mov    %eax,0x4(%esp)
 2c4:	e8 e3 00 00 00       	call   3ac <fstat>
  close(fd);
 2c9:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 2cc:	89 c6                	mov    %eax,%esi
  close(fd);
 2ce:	e8 a9 00 00 00       	call   37c <close>
  return r;
}
 2d3:	89 f0                	mov    %esi,%eax
 2d5:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 2d8:	8b 75 fc             	mov    -0x4(%ebp),%esi
 2db:	89 ec                	mov    %ebp,%esp
 2dd:	5d                   	pop    %ebp
 2de:	c3                   	ret    
 2df:	90                   	nop

000002e0 <atoi>:

int
atoi(const char *s)
{
 2e0:	55                   	push   %ebp
  int n;

  n = 0;
 2e1:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
 2e3:	89 e5                	mov    %esp,%ebp
 2e5:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2e8:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2e9:	0f b6 11             	movzbl (%ecx),%edx
 2ec:	8d 5a d0             	lea    -0x30(%edx),%ebx
 2ef:	80 fb 09             	cmp    $0x9,%bl
 2f2:	77 1c                	ja     310 <atoi+0x30>
 2f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 2f8:	0f be d2             	movsbl %dl,%edx
 2fb:	83 c1 01             	add    $0x1,%ecx
 2fe:	8d 04 80             	lea    (%eax,%eax,4),%eax
 301:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 305:	0f b6 11             	movzbl (%ecx),%edx
 308:	8d 5a d0             	lea    -0x30(%edx),%ebx
 30b:	80 fb 09             	cmp    $0x9,%bl
 30e:	76 e8                	jbe    2f8 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 310:	5b                   	pop    %ebx
 311:	5d                   	pop    %ebp
 312:	c3                   	ret    
 313:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000320 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	56                   	push   %esi
 324:	8b 45 08             	mov    0x8(%ebp),%eax
 327:	53                   	push   %ebx
 328:	8b 5d 10             	mov    0x10(%ebp),%ebx
 32b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 32e:	85 db                	test   %ebx,%ebx
 330:	7e 14                	jle    346 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, const void *vsrc, int n)
 332:	31 d2                	xor    %edx,%edx
 334:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 338:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 33c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 33f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 342:	39 da                	cmp    %ebx,%edx
 344:	75 f2                	jne    338 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 346:	5b                   	pop    %ebx
 347:	5e                   	pop    %esi
 348:	5d                   	pop    %ebp
 349:	c3                   	ret    
 34a:	90                   	nop
 34b:	90                   	nop

0000034c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 34c:	b8 01 00 00 00       	mov    $0x1,%eax
 351:	cd 40                	int    $0x40
 353:	c3                   	ret    

00000354 <exit>:
SYSCALL(exit)
 354:	b8 02 00 00 00       	mov    $0x2,%eax
 359:	cd 40                	int    $0x40
 35b:	c3                   	ret    

0000035c <wait>:
SYSCALL(wait)
 35c:	b8 03 00 00 00       	mov    $0x3,%eax
 361:	cd 40                	int    $0x40
 363:	c3                   	ret    

00000364 <pipe>:
SYSCALL(pipe)
 364:	b8 04 00 00 00       	mov    $0x4,%eax
 369:	cd 40                	int    $0x40
 36b:	c3                   	ret    

0000036c <read>:
SYSCALL(read)
 36c:	b8 05 00 00 00       	mov    $0x5,%eax
 371:	cd 40                	int    $0x40
 373:	c3                   	ret    

00000374 <write>:
SYSCALL(write)
 374:	b8 10 00 00 00       	mov    $0x10,%eax
 379:	cd 40                	int    $0x40
 37b:	c3                   	ret    

0000037c <close>:
SYSCALL(close)
 37c:	b8 15 00 00 00       	mov    $0x15,%eax
 381:	cd 40                	int    $0x40
 383:	c3                   	ret    

00000384 <kill>:
SYSCALL(kill)
 384:	b8 06 00 00 00       	mov    $0x6,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <exec>:
SYSCALL(exec)
 38c:	b8 07 00 00 00       	mov    $0x7,%eax
 391:	cd 40                	int    $0x40
 393:	c3                   	ret    

00000394 <open>:
SYSCALL(open)
 394:	b8 0f 00 00 00       	mov    $0xf,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <mknod>:
SYSCALL(mknod)
 39c:	b8 11 00 00 00       	mov    $0x11,%eax
 3a1:	cd 40                	int    $0x40
 3a3:	c3                   	ret    

000003a4 <unlink>:
SYSCALL(unlink)
 3a4:	b8 12 00 00 00       	mov    $0x12,%eax
 3a9:	cd 40                	int    $0x40
 3ab:	c3                   	ret    

000003ac <fstat>:
SYSCALL(fstat)
 3ac:	b8 08 00 00 00       	mov    $0x8,%eax
 3b1:	cd 40                	int    $0x40
 3b3:	c3                   	ret    

000003b4 <link>:
SYSCALL(link)
 3b4:	b8 13 00 00 00       	mov    $0x13,%eax
 3b9:	cd 40                	int    $0x40
 3bb:	c3                   	ret    

000003bc <mkdir>:
SYSCALL(mkdir)
 3bc:	b8 14 00 00 00       	mov    $0x14,%eax
 3c1:	cd 40                	int    $0x40
 3c3:	c3                   	ret    

000003c4 <chdir>:
SYSCALL(chdir)
 3c4:	b8 09 00 00 00       	mov    $0x9,%eax
 3c9:	cd 40                	int    $0x40
 3cb:	c3                   	ret    

000003cc <dup>:
SYSCALL(dup)
 3cc:	b8 0a 00 00 00       	mov    $0xa,%eax
 3d1:	cd 40                	int    $0x40
 3d3:	c3                   	ret    

000003d4 <getpid>:
SYSCALL(getpid)
 3d4:	b8 0b 00 00 00       	mov    $0xb,%eax
 3d9:	cd 40                	int    $0x40
 3db:	c3                   	ret    

000003dc <sbrk>:
SYSCALL(sbrk)
 3dc:	b8 0c 00 00 00       	mov    $0xc,%eax
 3e1:	cd 40                	int    $0x40
 3e3:	c3                   	ret    

000003e4 <sleep>:
SYSCALL(sleep)
 3e4:	b8 0d 00 00 00       	mov    $0xd,%eax
 3e9:	cd 40                	int    $0x40
 3eb:	c3                   	ret    

000003ec <uptime>:
SYSCALL(uptime)
 3ec:	b8 0e 00 00 00       	mov    $0xe,%eax
 3f1:	cd 40                	int    $0x40
 3f3:	c3                   	ret    
