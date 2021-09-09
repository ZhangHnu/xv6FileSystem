
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	83 ec 10             	sub    $0x10,%esp
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   a:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  11:	00 
  12:	c7 04 24 7e 07 00 00 	movl   $0x77e,(%esp)
  19:	e8 66 03 00 00       	call   384 <open>
  1e:	85 c0                	test   %eax,%eax
  20:	0f 88 ac 00 00 00    	js     d2 <main+0xd2>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  26:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  2d:	e8 8a 03 00 00       	call   3bc <dup>
  dup(0);  // stderr
  32:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  39:	e8 7e 03 00 00       	call   3bc <dup>
  3e:	66 90                	xchg   %ax,%ax

  for(;;){
    printf(1, "init: starting sh\n");
  40:	c7 44 24 04 86 07 00 	movl   $0x786,0x4(%esp)
  47:	00 
  48:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  4f:	e8 4c 04 00 00       	call   4a0 <printf>
    pid = fork();
  54:	e8 e3 02 00 00       	call   33c <fork>
    if(pid < 0){
  59:	83 f8 00             	cmp    $0x0,%eax
  dup(0);  // stdout
  dup(0);  // stderr

  for(;;){
    printf(1, "init: starting sh\n");
    pid = fork();
  5c:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  5e:	7c 2c                	jl     8c <main+0x8c>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
  60:	74 43                	je     a5 <main+0xa5>
  62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  68:	e8 df 02 00 00       	call   34c <wait>
  6d:	85 c0                	test   %eax,%eax
  6f:	90                   	nop
  70:	78 ce                	js     40 <main+0x40>
  72:	39 d8                	cmp    %ebx,%eax
  74:	74 ca                	je     40 <main+0x40>
      printf(1, "zombie!\n");
  76:	c7 44 24 04 c5 07 00 	movl   $0x7c5,0x4(%esp)
  7d:	00 
  7e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  85:	e8 16 04 00 00       	call   4a0 <printf>
  8a:	eb dc                	jmp    68 <main+0x68>

  for(;;){
    printf(1, "init: starting sh\n");
    pid = fork();
    if(pid < 0){
      printf(1, "init: fork failed\n");
  8c:	c7 44 24 04 99 07 00 	movl   $0x799,0x4(%esp)
  93:	00 
  94:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  9b:	e8 00 04 00 00       	call   4a0 <printf>
      exit();
  a0:	e8 9f 02 00 00       	call   344 <exit>
    }
    if(pid == 0){
      exec("sh", argv);
  a5:	c7 44 24 04 80 0a 00 	movl   $0xa80,0x4(%esp)
  ac:	00 
  ad:	c7 04 24 ac 07 00 00 	movl   $0x7ac,(%esp)
  b4:	e8 c3 02 00 00       	call   37c <exec>
      printf(1, "init: exec sh failed\n");
  b9:	c7 44 24 04 af 07 00 	movl   $0x7af,0x4(%esp)
  c0:	00 
  c1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c8:	e8 d3 03 00 00       	call   4a0 <printf>
      exit();
  cd:	e8 72 02 00 00       	call   344 <exit>
main(void)
{
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
    mknod("console", 1, 1);
  d2:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  d9:	00 
  da:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  e1:	00 
  e2:	c7 04 24 7e 07 00 00 	movl   $0x77e,(%esp)
  e9:	e8 9e 02 00 00       	call   38c <mknod>
    open("console", O_RDWR);
  ee:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  f5:	00 
  f6:	c7 04 24 7e 07 00 00 	movl   $0x77e,(%esp)
  fd:	e8 82 02 00 00       	call   384 <open>
 102:	e9 1f ff ff ff       	jmp    26 <main+0x26>
 107:	90                   	nop
 108:	90                   	nop
 109:	90                   	nop
 10a:	90                   	nop
 10b:	90                   	nop
 10c:	90                   	nop
 10d:	90                   	nop
 10e:	90                   	nop
 10f:	90                   	nop

00000110 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 110:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 111:	31 d2                	xor    %edx,%edx
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 113:	89 e5                	mov    %esp,%ebp
 115:	8b 45 08             	mov    0x8(%ebp),%eax
 118:	53                   	push   %ebx
 119:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 11c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 120:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 124:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 127:	83 c2 01             	add    $0x1,%edx
 12a:	84 c9                	test   %cl,%cl
 12c:	75 f2                	jne    120 <strcpy+0x10>
    ;
  return os;
}
 12e:	5b                   	pop    %ebx
 12f:	5d                   	pop    %ebp
 130:	c3                   	ret    
 131:	eb 0d                	jmp    140 <strcmp>
 133:	90                   	nop
 134:	90                   	nop
 135:	90                   	nop
 136:	90                   	nop
 137:	90                   	nop
 138:	90                   	nop
 139:	90                   	nop
 13a:	90                   	nop
 13b:	90                   	nop
 13c:	90                   	nop
 13d:	90                   	nop
 13e:	90                   	nop
 13f:	90                   	nop

00000140 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	8b 4d 08             	mov    0x8(%ebp),%ecx
 146:	56                   	push   %esi
 147:	8b 55 0c             	mov    0xc(%ebp),%edx
 14a:	53                   	push   %ebx
  while(*p && *p == *q)
 14b:	0f b6 01             	movzbl (%ecx),%eax
 14e:	0f b6 1a             	movzbl (%edx),%ebx
 151:	84 c0                	test   %al,%al
 153:	74 23                	je     178 <strcmp+0x38>
 155:	38 d8                	cmp    %bl,%al
 157:	74 10                	je     169 <strcmp+0x29>
 159:	eb 2d                	jmp    188 <strcmp+0x48>
 15b:	90                   	nop
 15c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 160:	83 c1 01             	add    $0x1,%ecx
 163:	38 d8                	cmp    %bl,%al
 165:	75 21                	jne    188 <strcmp+0x48>
    p++, q++;
 167:	89 f2                	mov    %esi,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 169:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 16d:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 170:	0f b6 5a 01          	movzbl 0x1(%edx),%ebx
 174:	84 c0                	test   %al,%al
 176:	75 e8                	jne    160 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 178:	0f b6 db             	movzbl %bl,%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 17b:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 17d:	29 d8                	sub    %ebx,%eax
}
 17f:	5b                   	pop    %ebx
 180:	5e                   	pop    %esi
 181:	5d                   	pop    %ebp
 182:	c3                   	ret    
 183:	90                   	nop
 184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 188:	0f b6 db             	movzbl %bl,%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 18b:	0f b6 c0             	movzbl %al,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 18e:	29 d8                	sub    %ebx,%eax
}
 190:	5b                   	pop    %ebx
 191:	5e                   	pop    %esi
 192:	5d                   	pop    %ebp
 193:	c3                   	ret    
 194:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 19a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001a0 <strlen>:

uint
strlen(const char *s)
{
 1a0:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
 1a1:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
 1a3:	89 e5                	mov    %esp,%ebp
 1a5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1a8:	80 39 00             	cmpb   $0x0,(%ecx)
 1ab:	74 0e                	je     1bb <strlen+0x1b>
 1ad:	31 d2                	xor    %edx,%edx
 1af:	90                   	nop
 1b0:	83 c2 01             	add    $0x1,%edx
 1b3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1b7:	89 d0                	mov    %edx,%eax
 1b9:	75 f5                	jne    1b0 <strlen+0x10>
    ;
  return n;
}
 1bb:	5d                   	pop    %ebp
 1bc:	c3                   	ret    
 1bd:	8d 76 00             	lea    0x0(%esi),%esi

000001c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	8b 55 08             	mov    0x8(%ebp),%edx
 1c6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 1cd:	89 d7                	mov    %edx,%edi
 1cf:	fc                   	cld    
 1d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1d2:	89 d0                	mov    %edx,%eax
 1d4:	5f                   	pop    %edi
 1d5:	5d                   	pop    %ebp
 1d6:	c3                   	ret    
 1d7:	89 f6                	mov    %esi,%esi
 1d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001e0 <strchr>:

char*
strchr(const char *s, char c)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	8b 45 08             	mov    0x8(%ebp),%eax
 1e6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1ea:	0f b6 10             	movzbl (%eax),%edx
 1ed:	84 d2                	test   %dl,%dl
 1ef:	75 12                	jne    203 <strchr+0x23>
 1f1:	eb 1d                	jmp    210 <strchr+0x30>
 1f3:	90                   	nop
 1f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1f8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1fc:	84 d2                	test   %dl,%dl
 1fe:	74 10                	je     210 <strchr+0x30>
 200:	83 c0 01             	add    $0x1,%eax
    if(*s == c)
 203:	38 ca                	cmp    %cl,%dl
 205:	75 f1                	jne    1f8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 207:	5d                   	pop    %ebp
 208:	c3                   	ret    
 209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 210:	31 c0                	xor    %eax,%eax
}
 212:	5d                   	pop    %ebp
 213:	c3                   	ret    
 214:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 21a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000220 <gets>:

char*
gets(char *buf, int max)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	57                   	push   %edi
 224:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 225:	31 f6                	xor    %esi,%esi
  return 0;
}

char*
gets(char *buf, int max)
{
 227:	53                   	push   %ebx
 228:	83 ec 2c             	sub    $0x2c,%esp
 22b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 22e:	eb 31                	jmp    261 <gets+0x41>
    cc = read(0, &c, 1);
 230:	8d 45 e7             	lea    -0x19(%ebp),%eax
 233:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 23a:	00 
 23b:	89 44 24 04          	mov    %eax,0x4(%esp)
 23f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 246:	e8 11 01 00 00       	call   35c <read>
    if(cc < 1)
 24b:	85 c0                	test   %eax,%eax
 24d:	7e 1a                	jle    269 <gets+0x49>
      break;
    buf[i++] = c;
 24f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 253:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 255:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 257:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 25b:	74 0c                	je     269 <gets+0x49>
 25d:	3c 0a                	cmp    $0xa,%al
 25f:	74 08                	je     269 <gets+0x49>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 261:	8d 5e 01             	lea    0x1(%esi),%ebx
 264:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 267:	7c c7                	jl     230 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 269:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 26d:	83 c4 2c             	add    $0x2c,%esp
 270:	89 f8                	mov    %edi,%eax
 272:	5b                   	pop    %ebx
 273:	5e                   	pop    %esi
 274:	5f                   	pop    %edi
 275:	5d                   	pop    %ebp
 276:	c3                   	ret    
 277:	89 f6                	mov    %esi,%esi
 279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000280 <stat>:

int
stat(const char *n, struct stat *st)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 286:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(const char *n, struct stat *st)
{
 289:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 28c:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 28f:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 294:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 29b:	00 
 29c:	89 04 24             	mov    %eax,(%esp)
 29f:	e8 e0 00 00 00       	call   384 <open>
  if(fd < 0)
 2a4:	85 c0                	test   %eax,%eax
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2a6:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 2a8:	78 19                	js     2c3 <stat+0x43>
    return -1;
  r = fstat(fd, st);
 2aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ad:	89 1c 24             	mov    %ebx,(%esp)
 2b0:	89 44 24 04          	mov    %eax,0x4(%esp)
 2b4:	e8 e3 00 00 00       	call   39c <fstat>
  close(fd);
 2b9:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 2bc:	89 c6                	mov    %eax,%esi
  close(fd);
 2be:	e8 a9 00 00 00       	call   36c <close>
  return r;
}
 2c3:	89 f0                	mov    %esi,%eax
 2c5:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 2c8:	8b 75 fc             	mov    -0x4(%ebp),%esi
 2cb:	89 ec                	mov    %ebp,%esp
 2cd:	5d                   	pop    %ebp
 2ce:	c3                   	ret    
 2cf:	90                   	nop

000002d0 <atoi>:

int
atoi(const char *s)
{
 2d0:	55                   	push   %ebp
  int n;

  n = 0;
 2d1:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
 2d3:	89 e5                	mov    %esp,%ebp
 2d5:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2d8:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2d9:	0f b6 11             	movzbl (%ecx),%edx
 2dc:	8d 5a d0             	lea    -0x30(%edx),%ebx
 2df:	80 fb 09             	cmp    $0x9,%bl
 2e2:	77 1c                	ja     300 <atoi+0x30>
 2e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 2e8:	0f be d2             	movsbl %dl,%edx
 2eb:	83 c1 01             	add    $0x1,%ecx
 2ee:	8d 04 80             	lea    (%eax,%eax,4),%eax
 2f1:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2f5:	0f b6 11             	movzbl (%ecx),%edx
 2f8:	8d 5a d0             	lea    -0x30(%edx),%ebx
 2fb:	80 fb 09             	cmp    $0x9,%bl
 2fe:	76 e8                	jbe    2e8 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 300:	5b                   	pop    %ebx
 301:	5d                   	pop    %ebp
 302:	c3                   	ret    
 303:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000310 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	56                   	push   %esi
 314:	8b 45 08             	mov    0x8(%ebp),%eax
 317:	53                   	push   %ebx
 318:	8b 5d 10             	mov    0x10(%ebp),%ebx
 31b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 31e:	85 db                	test   %ebx,%ebx
 320:	7e 14                	jle    336 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, const void *vsrc, int n)
 322:	31 d2                	xor    %edx,%edx
 324:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 328:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 32c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 32f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 332:	39 da                	cmp    %ebx,%edx
 334:	75 f2                	jne    328 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 336:	5b                   	pop    %ebx
 337:	5e                   	pop    %esi
 338:	5d                   	pop    %ebp
 339:	c3                   	ret    
 33a:	90                   	nop
 33b:	90                   	nop

0000033c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 33c:	b8 01 00 00 00       	mov    $0x1,%eax
 341:	cd 40                	int    $0x40
 343:	c3                   	ret    

00000344 <exit>:
SYSCALL(exit)
 344:	b8 02 00 00 00       	mov    $0x2,%eax
 349:	cd 40                	int    $0x40
 34b:	c3                   	ret    

0000034c <wait>:
SYSCALL(wait)
 34c:	b8 03 00 00 00       	mov    $0x3,%eax
 351:	cd 40                	int    $0x40
 353:	c3                   	ret    

00000354 <pipe>:
SYSCALL(pipe)
 354:	b8 04 00 00 00       	mov    $0x4,%eax
 359:	cd 40                	int    $0x40
 35b:	c3                   	ret    

0000035c <read>:
SYSCALL(read)
 35c:	b8 05 00 00 00       	mov    $0x5,%eax
 361:	cd 40                	int    $0x40
 363:	c3                   	ret    

00000364 <write>:
SYSCALL(write)
 364:	b8 10 00 00 00       	mov    $0x10,%eax
 369:	cd 40                	int    $0x40
 36b:	c3                   	ret    

0000036c <close>:
SYSCALL(close)
 36c:	b8 15 00 00 00       	mov    $0x15,%eax
 371:	cd 40                	int    $0x40
 373:	c3                   	ret    

00000374 <kill>:
SYSCALL(kill)
 374:	b8 06 00 00 00       	mov    $0x6,%eax
 379:	cd 40                	int    $0x40
 37b:	c3                   	ret    

0000037c <exec>:
SYSCALL(exec)
 37c:	b8 07 00 00 00       	mov    $0x7,%eax
 381:	cd 40                	int    $0x40
 383:	c3                   	ret    

00000384 <open>:
SYSCALL(open)
 384:	b8 0f 00 00 00       	mov    $0xf,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <mknod>:
SYSCALL(mknod)
 38c:	b8 11 00 00 00       	mov    $0x11,%eax
 391:	cd 40                	int    $0x40
 393:	c3                   	ret    

00000394 <unlink>:
SYSCALL(unlink)
 394:	b8 12 00 00 00       	mov    $0x12,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <fstat>:
SYSCALL(fstat)
 39c:	b8 08 00 00 00       	mov    $0x8,%eax
 3a1:	cd 40                	int    $0x40
 3a3:	c3                   	ret    

000003a4 <link>:
SYSCALL(link)
 3a4:	b8 13 00 00 00       	mov    $0x13,%eax
 3a9:	cd 40                	int    $0x40
 3ab:	c3                   	ret    

000003ac <mkdir>:
SYSCALL(mkdir)
 3ac:	b8 14 00 00 00       	mov    $0x14,%eax
 3b1:	cd 40                	int    $0x40
 3b3:	c3                   	ret    

000003b4 <chdir>:
SYSCALL(chdir)
 3b4:	b8 09 00 00 00       	mov    $0x9,%eax
 3b9:	cd 40                	int    $0x40
 3bb:	c3                   	ret    

000003bc <dup>:
SYSCALL(dup)
 3bc:	b8 0a 00 00 00       	mov    $0xa,%eax
 3c1:	cd 40                	int    $0x40
 3c3:	c3                   	ret    

000003c4 <getpid>:
SYSCALL(getpid)
 3c4:	b8 0b 00 00 00       	mov    $0xb,%eax
 3c9:	cd 40                	int    $0x40
 3cb:	c3                   	ret    

000003cc <sbrk>:
SYSCALL(sbrk)
 3cc:	b8 0c 00 00 00       	mov    $0xc,%eax
 3d1:	cd 40                	int    $0x40
 3d3:	c3                   	ret    

000003d4 <sleep>:
SYSCALL(sleep)
 3d4:	b8 0d 00 00 00       	mov    $0xd,%eax
 3d9:	cd 40                	int    $0x40
 3db:	c3                   	ret    

000003dc <uptime>:
SYSCALL(uptime)
 3dc:	b8 0e 00 00 00       	mov    $0xe,%eax
 3e1:	cd 40                	int    $0x40
 3e3:	c3                   	ret    
 3e4:	90                   	nop
 3e5:	90                   	nop
 3e6:	90                   	nop
 3e7:	90                   	nop
 3e8:	90                   	nop
 3e9:	90                   	nop
 3ea:	90                   	nop
 3eb:	90                   	nop
 3ec:	90                   	nop
 3ed:	90                   	nop
 3ee:	90                   	nop
 3ef:	90                   	nop

000003f0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	83 ec 28             	sub    $0x28,%esp
 3f6:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3f9:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3fc:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 403:	00 
 404:	89 54 24 04          	mov    %edx,0x4(%esp)
 408:	89 04 24             	mov    %eax,(%esp)
 40b:	e8 54 ff ff ff       	call   364 <write>
}
 410:	c9                   	leave  
 411:	c3                   	ret    
 412:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000420 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
 424:	56                   	push   %esi
 425:	89 c6                	mov    %eax,%esi
 427:	53                   	push   %ebx
 428:	83 ec 1c             	sub    $0x1c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 42b:	8b 45 08             	mov    0x8(%ebp),%eax
 42e:	85 c0                	test   %eax,%eax
 430:	74 5e                	je     490 <printint+0x70>
 432:	89 d0                	mov    %edx,%eax
 434:	c1 e8 1f             	shr    $0x1f,%eax
 437:	84 c0                	test   %al,%al
 439:	74 55                	je     490 <printint+0x70>
    neg = 1;
    x = -xx;
 43b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 43d:	bf 01 00 00 00       	mov    $0x1,%edi
    x = -xx;
 442:	f7 d8                	neg    %eax
  } else {
    x = xx;
  }

  i = 0;
 444:	31 db                	xor    %ebx,%ebx
 446:	eb 02                	jmp    44a <printint+0x2a>
  do{
    buf[i++] = digits[x % base];
 448:	89 d3                	mov    %edx,%ebx
 44a:	31 d2                	xor    %edx,%edx
 44c:	f7 f1                	div    %ecx
 44e:	0f b6 92 d5 07 00 00 	movzbl 0x7d5(%edx),%edx
  }while((x /= base) != 0);
 455:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 457:	88 54 1d d8          	mov    %dl,-0x28(%ebp,%ebx,1)
 45b:	8d 53 01             	lea    0x1(%ebx),%edx
  }while((x /= base) != 0);
 45e:	75 e8                	jne    448 <printint+0x28>
  if(neg)
 460:	85 ff                	test   %edi,%edi
 462:	74 08                	je     46c <printint+0x4c>
    buf[i++] = '-';
 464:	c6 44 15 d8 2d       	movb   $0x2d,-0x28(%ebp,%edx,1)
 469:	8d 53 02             	lea    0x2(%ebx),%edx

  while(--i >= 0)
 46c:	8d 5a ff             	lea    -0x1(%edx),%ebx
 46f:	90                   	nop
    putc(fd, buf[i]);
 470:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 475:	89 f0                	mov    %esi,%eax
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 477:	83 eb 01             	sub    $0x1,%ebx
    putc(fd, buf[i]);
 47a:	e8 71 ff ff ff       	call   3f0 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 47f:	83 fb ff             	cmp    $0xffffffff,%ebx
 482:	75 ec                	jne    470 <printint+0x50>
    putc(fd, buf[i]);
}
 484:	83 c4 1c             	add    $0x1c,%esp
 487:	5b                   	pop    %ebx
 488:	5e                   	pop    %esi
 489:	5f                   	pop    %edi
 48a:	5d                   	pop    %ebp
 48b:	c3                   	ret    
 48c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 490:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 492:	31 ff                	xor    %edi,%edi
 494:	eb ae                	jmp    444 <printint+0x24>
 496:	8d 76 00             	lea    0x0(%esi),%esi
 499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004a0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	57                   	push   %edi
 4a4:	56                   	push   %esi
 4a5:	53                   	push   %ebx
 4a6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 4ac:	0f b6 0b             	movzbl (%ebx),%ecx
 4af:	84 c9                	test   %cl,%cl
 4b1:	0f 84 89 00 00 00    	je     540 <printf+0xa0>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4b7:	8d 45 10             	lea    0x10(%ebp),%eax
{
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 4ba:	31 f6                	xor    %esi,%esi
  ap = (uint*)(void*)&fmt + 1;
 4bc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 4bf:	eb 21                	jmp    4e2 <printf+0x42>
 4c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4c8:	83 f9 25             	cmp    $0x25,%ecx
 4cb:	74 7b                	je     548 <printf+0xa8>
        state = '%';
      } else {
        putc(fd, c);
 4cd:	8b 45 08             	mov    0x8(%ebp),%eax
 4d0:	0f be d1             	movsbl %cl,%edx
 4d3:	e8 18 ff ff ff       	call   3f0 <putc>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 4d8:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4db:	0f b6 0b             	movzbl (%ebx),%ecx
 4de:	84 c9                	test   %cl,%cl
 4e0:	74 5e                	je     540 <printf+0xa0>
    c = fmt[i] & 0xff;
    if(state == 0){
 4e2:	85 f6                	test   %esi,%esi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 4e4:	0f b6 c9             	movzbl %cl,%ecx
    if(state == 0){
 4e7:	74 df                	je     4c8 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 4e9:	83 fe 25             	cmp    $0x25,%esi
 4ec:	75 ea                	jne    4d8 <printf+0x38>
      if(c == 'd'){
 4ee:	83 f9 64             	cmp    $0x64,%ecx
 4f1:	0f 84 c9 00 00 00    	je     5c0 <printf+0x120>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4f7:	83 f9 70             	cmp    $0x70,%ecx
 4fa:	74 54                	je     550 <printf+0xb0>
 4fc:	83 f9 78             	cmp    $0x78,%ecx
 4ff:	90                   	nop
 500:	74 4e                	je     550 <printf+0xb0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 502:	83 f9 73             	cmp    $0x73,%ecx
 505:	74 71                	je     578 <printf+0xd8>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 507:	83 f9 63             	cmp    $0x63,%ecx
 50a:	0f 84 d2 00 00 00    	je     5e2 <printf+0x142>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 510:	83 f9 25             	cmp    $0x25,%ecx
        putc(fd, c);
 513:	ba 25 00 00 00       	mov    $0x25,%edx
 518:	8b 45 08             	mov    0x8(%ebp),%eax
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 51b:	74 11                	je     52e <printf+0x8e>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 51d:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 520:	e8 cb fe ff ff       	call   3f0 <putc>
        putc(fd, c);
 525:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 528:	8b 45 08             	mov    0x8(%ebp),%eax
 52b:	0f be d1             	movsbl %cl,%edx
 52e:	83 c3 01             	add    $0x1,%ebx
      }
      state = 0;
 531:	31 f6                	xor    %esi,%esi
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 533:	e8 b8 fe ff ff       	call   3f0 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 538:	0f b6 0b             	movzbl (%ebx),%ecx
 53b:	84 c9                	test   %cl,%cl
 53d:	75 a3                	jne    4e2 <printf+0x42>
 53f:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 540:	83 c4 2c             	add    $0x2c,%esp
 543:	5b                   	pop    %ebx
 544:	5e                   	pop    %esi
 545:	5f                   	pop    %edi
 546:	5d                   	pop    %ebp
 547:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 548:	be 25 00 00 00       	mov    $0x25,%esi
 54d:	eb 89                	jmp    4d8 <printf+0x38>
 54f:	90                   	nop
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 550:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 553:	b9 10 00 00 00       	mov    $0x10,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 558:	31 f6                	xor    %esi,%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 55a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 561:	8b 10                	mov    (%eax),%edx
 563:	8b 45 08             	mov    0x8(%ebp),%eax
 566:	e8 b5 fe ff ff       	call   420 <printint>
        ap++;
 56b:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 56f:	e9 64 ff ff ff       	jmp    4d8 <printf+0x38>
 574:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 578:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 57b:	8b 38                	mov    (%eax),%edi
        ap++;
 57d:	83 c0 04             	add    $0x4,%eax
 580:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
          s = "(null)";
 583:	b8 ce 07 00 00       	mov    $0x7ce,%eax
 588:	85 ff                	test   %edi,%edi
 58a:	0f 44 f8             	cmove  %eax,%edi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 58d:	31 f6                	xor    %esi,%esi
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 58f:	0f b6 17             	movzbl (%edi),%edx
 592:	84 d2                	test   %dl,%dl
 594:	0f 84 3e ff ff ff    	je     4d8 <printf+0x38>
 59a:	89 de                	mov    %ebx,%esi
 59c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 59f:	90                   	nop
          putc(fd, *s);
 5a0:	0f be d2             	movsbl %dl,%edx
          s++;
 5a3:	83 c7 01             	add    $0x1,%edi
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
 5a6:	89 d8                	mov    %ebx,%eax
 5a8:	e8 43 fe ff ff       	call   3f0 <putc>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5ad:	0f b6 17             	movzbl (%edi),%edx
 5b0:	84 d2                	test   %dl,%dl
 5b2:	75 ec                	jne    5a0 <printf+0x100>
 5b4:	89 f3                	mov    %esi,%ebx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5b6:	31 f6                	xor    %esi,%esi
 5b8:	e9 1b ff ff ff       	jmp    4d8 <printf+0x38>
 5bd:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 5c0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5c3:	b1 0a                	mov    $0xa,%cl
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5c5:	66 31 f6             	xor    %si,%si
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 5c8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 5cf:	8b 10                	mov    (%eax),%edx
 5d1:	8b 45 08             	mov    0x8(%ebp),%eax
 5d4:	e8 47 fe ff ff       	call   420 <printint>
        ap++;
 5d9:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 5dd:	e9 f6 fe ff ff       	jmp    4d8 <printf+0x38>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 5e2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5e5:	31 f6                	xor    %esi,%esi
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 5e7:	0f be 10             	movsbl (%eax),%edx
 5ea:	8b 45 08             	mov    0x8(%ebp),%eax
 5ed:	e8 fe fd ff ff       	call   3f0 <putc>
        ap++;
 5f2:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 5f6:	e9 dd fe ff ff       	jmp    4d8 <printf+0x38>
 5fb:	90                   	nop
 5fc:	90                   	nop
 5fd:	90                   	nop
 5fe:	90                   	nop
 5ff:	90                   	nop

00000600 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 600:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 601:	a1 88 0a 00 00       	mov    0xa88,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 606:	89 e5                	mov    %esp,%ebp
 608:	57                   	push   %edi
 609:	56                   	push   %esi
 60a:	53                   	push   %ebx
 60b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 60e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 611:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 618:	39 c8                	cmp    %ecx,%eax
 61a:	8b 10                	mov    (%eax),%edx
 61c:	73 04                	jae    622 <free+0x22>
 61e:	39 d1                	cmp    %edx,%ecx
 620:	72 16                	jb     638 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 622:	39 d0                	cmp    %edx,%eax
 624:	72 0c                	jb     632 <free+0x32>
 626:	39 c8                	cmp    %ecx,%eax
 628:	72 0e                	jb     638 <free+0x38>
 62a:	39 d1                	cmp    %edx,%ecx
 62c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 630:	72 06                	jb     638 <free+0x38>
static Header base;
static Header *freep;

void
free(void *ap)
{
 632:	89 d0                	mov    %edx,%eax
 634:	eb e2                	jmp    618 <free+0x18>
 636:	66 90                	xchg   %ax,%ax

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 638:	8b 73 fc             	mov    -0x4(%ebx),%esi
 63b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 63e:	39 d7                	cmp    %edx,%edi
 640:	74 19                	je     65b <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 642:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 645:	8b 50 04             	mov    0x4(%eax),%edx
 648:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 64b:	39 f1                	cmp    %esi,%ecx
 64d:	74 23                	je     672 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 64f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 651:	a3 88 0a 00 00       	mov    %eax,0xa88
}
 656:	5b                   	pop    %ebx
 657:	5e                   	pop    %esi
 658:	5f                   	pop    %edi
 659:	5d                   	pop    %ebp
 65a:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 65b:	03 72 04             	add    0x4(%edx),%esi
 65e:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 661:	8b 10                	mov    (%eax),%edx
 663:	8b 12                	mov    (%edx),%edx
 665:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 668:	8b 50 04             	mov    0x4(%eax),%edx
 66b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 66e:	39 f1                	cmp    %esi,%ecx
 670:	75 dd                	jne    64f <free+0x4f>
    p->s.size += bp->s.size;
 672:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 675:	a3 88 0a 00 00       	mov    %eax,0xa88
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 67a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 67d:	8b 53 f8             	mov    -0x8(%ebx),%edx
 680:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 682:	5b                   	pop    %ebx
 683:	5e                   	pop    %esi
 684:	5f                   	pop    %edi
 685:	5d                   	pop    %ebp
 686:	c3                   	ret    
 687:	89 f6                	mov    %esi,%esi
 689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000690 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 690:	55                   	push   %ebp
 691:	89 e5                	mov    %esp,%ebp
 693:	57                   	push   %edi
 694:	56                   	push   %esi
 695:	53                   	push   %ebx
 696:	83 ec 2c             	sub    $0x2c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 699:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 69c:	8b 15 88 0a 00 00    	mov    0xa88,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6a2:	83 c3 07             	add    $0x7,%ebx
 6a5:	c1 eb 03             	shr    $0x3,%ebx
 6a8:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6ab:	85 d2                	test   %edx,%edx
 6ad:	0f 84 a3 00 00 00    	je     756 <malloc+0xc6>
 6b3:	8b 02                	mov    (%edx),%eax
 6b5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 6b8:	39 d9                	cmp    %ebx,%ecx
 6ba:	73 74                	jae    730 <malloc+0xa0>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 6bc:	8d 14 dd 00 00 00 00 	lea    0x0(,%ebx,8),%edx
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 6c3:	bf 00 80 00 00       	mov    $0x8000,%edi
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 6c8:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 6cb:	eb 0c                	jmp    6d9 <malloc+0x49>
 6cd:	8d 76 00             	lea    0x0(%esi),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6d0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6d2:	8b 48 04             	mov    0x4(%eax),%ecx
 6d5:	39 cb                	cmp    %ecx,%ebx
 6d7:	76 57                	jbe    730 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6d9:	3b 05 88 0a 00 00    	cmp    0xa88,%eax
 6df:	89 c2                	mov    %eax,%edx
 6e1:	75 ed                	jne    6d0 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 6e3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6e6:	81 fb 00 10 00 00    	cmp    $0x1000,%ebx
 6ec:	be 00 10 00 00       	mov    $0x1000,%esi
 6f1:	0f 43 f3             	cmovae %ebx,%esi
 6f4:	0f 42 c7             	cmovb  %edi,%eax
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 6f7:	89 04 24             	mov    %eax,(%esp)
 6fa:	e8 cd fc ff ff       	call   3cc <sbrk>
  if(p == (char*)-1)
 6ff:	83 f8 ff             	cmp    $0xffffffff,%eax
 702:	74 1c                	je     720 <malloc+0x90>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 704:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 707:	83 c0 08             	add    $0x8,%eax
 70a:	89 04 24             	mov    %eax,(%esp)
 70d:	e8 ee fe ff ff       	call   600 <free>
  return freep;
 712:	8b 15 88 0a 00 00    	mov    0xa88,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 718:	85 d2                	test   %edx,%edx
 71a:	75 b4                	jne    6d0 <malloc+0x40>
 71c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return 0;
  }
}
 720:	83 c4 2c             	add    $0x2c,%esp
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
 723:	31 c0                	xor    %eax,%eax
  }
}
 725:	5b                   	pop    %ebx
 726:	5e                   	pop    %esi
 727:	5f                   	pop    %edi
 728:	5d                   	pop    %ebp
 729:	c3                   	ret    
 72a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 730:	39 cb                	cmp    %ecx,%ebx
 732:	74 1c                	je     750 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 734:	29 d9                	sub    %ebx,%ecx
 736:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 739:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 73c:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 73f:	89 15 88 0a 00 00    	mov    %edx,0xa88
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 745:	83 c4 2c             	add    $0x2c,%esp
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 748:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 74b:	5b                   	pop    %ebx
 74c:	5e                   	pop    %esi
 74d:	5f                   	pop    %edi
 74e:	5d                   	pop    %ebp
 74f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 750:	8b 08                	mov    (%eax),%ecx
 752:	89 0a                	mov    %ecx,(%edx)
 754:	eb e9                	jmp    73f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 756:	c7 05 88 0a 00 00 8c 	movl   $0xa8c,0xa88
 75d:	0a 00 00 
    base.s.size = 0;
 760:	b8 8c 0a 00 00       	mov    $0xa8c,%eax
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 765:	c7 05 8c 0a 00 00 8c 	movl   $0xa8c,0xa8c
 76c:	0a 00 00 
    base.s.size = 0;
 76f:	c7 05 90 0a 00 00 00 	movl   $0x0,0xa90
 776:	00 00 00 
 779:	e9 3e ff ff ff       	jmp    6bc <malloc+0x2c>
