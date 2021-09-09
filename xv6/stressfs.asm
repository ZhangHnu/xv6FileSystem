
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
   6:	31 db                	xor    %ebx,%ebx
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	81 ec 20 02 00 00    	sub    $0x220,%esp
  int fd, i;
  char path[] = "stressfs0";
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));
  11:	8d 74 24 16          	lea    0x16(%esp),%esi

int
main(int argc, char *argv[])
{
  int fd, i;
  char path[] = "stressfs0";
  15:	c7 84 24 16 02 00 00 	movl   $0x65727473,0x216(%esp)
  1c:	73 74 72 65 
  20:	c7 84 24 1a 02 00 00 	movl   $0x73667373,0x21a(%esp)
  27:	73 73 66 73 
  2b:	66 c7 84 24 1e 02 00 	movw   $0x30,0x21e(%esp)
  32:	00 30 00 
  char data[512];

  printf(1, "stressfs starting\n");
  35:	c7 44 24 04 be 07 00 	movl   $0x7be,0x4(%esp)
  3c:	00 
  3d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  44:	e8 97 04 00 00       	call   4e0 <printf>
  memset(data, 'a', sizeof(data));
  49:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  50:	00 
  51:	c7 44 24 04 61 00 00 	movl   $0x61,0x4(%esp)
  58:	00 
  59:	89 34 24             	mov    %esi,(%esp)
  5c:	e8 9f 01 00 00       	call   200 <memset>

  for(i = 0; i < 4; i++)
    if(fork() > 0)
  61:	e8 16 03 00 00       	call   37c <fork>
  66:	85 c0                	test   %eax,%eax
  68:	0f 8f d5 00 00 00    	jg     143 <main+0x143>
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
  6e:	83 c3 01             	add    $0x1,%ebx
  71:	83 fb 04             	cmp    $0x4,%ebx
  74:	75 eb                	jne    61 <main+0x61>
  76:	bf 04 00 00 00       	mov    $0x4,%edi
    if(fork() > 0)
      break;

  printf(1, "write %d\n", i);
  7b:	89 5c 24 08          	mov    %ebx,0x8(%esp)

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  7f:	bb 14 00 00 00       	mov    $0x14,%ebx

  for(i = 0; i < 4; i++)
    if(fork() > 0)
      break;

  printf(1, "write %d\n", i);
  84:	c7 44 24 04 d1 07 00 	movl   $0x7d1,0x4(%esp)
  8b:	00 
  8c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  93:	e8 48 04 00 00       	call   4e0 <printf>

  path[8] += i;
  98:	89 f8                	mov    %edi,%eax
  9a:	00 84 24 1e 02 00 00 	add    %al,0x21e(%esp)
  fd = open(path, O_CREATE | O_RDWR);
  a1:	8d 84 24 16 02 00 00 	lea    0x216(%esp),%eax
  a8:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
  af:	00 
  b0:	89 04 24             	mov    %eax,(%esp)
  b3:	e8 0c 03 00 00       	call   3c4 <open>
  b8:	89 c7                	mov    %eax,%edi
  ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(i = 0; i < 20; i++)
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  c0:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  c7:	00 
  c8:	89 74 24 04          	mov    %esi,0x4(%esp)
  cc:	89 3c 24             	mov    %edi,(%esp)
  cf:	e8 d0 02 00 00       	call   3a4 <write>

  printf(1, "write %d\n", i);

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  for(i = 0; i < 20; i++)
  d4:	83 eb 01             	sub    $0x1,%ebx
  d7:	75 e7                	jne    c0 <main+0xc0>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  close(fd);
  d9:	89 3c 24             	mov    %edi,(%esp)

  printf(1, "read\n");

  fd = open(path, O_RDONLY);
  dc:	bb 14 00 00 00       	mov    $0x14,%ebx
  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  for(i = 0; i < 20; i++)
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  close(fd);
  e1:	e8 c6 02 00 00       	call   3ac <close>

  printf(1, "read\n");
  e6:	c7 44 24 04 db 07 00 	movl   $0x7db,0x4(%esp)
  ed:	00 
  ee:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  f5:	e8 e6 03 00 00       	call   4e0 <printf>

  fd = open(path, O_RDONLY);
  fa:	8d 84 24 16 02 00 00 	lea    0x216(%esp),%eax
 101:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 108:	00 
 109:	89 04 24             	mov    %eax,(%esp)
 10c:	e8 b3 02 00 00       	call   3c4 <open>
 111:	89 c7                	mov    %eax,%edi
 113:	90                   	nop
 114:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for (i = 0; i < 20; i++)
    read(fd, data, sizeof(data));
 118:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
 11f:	00 
 120:	89 74 24 04          	mov    %esi,0x4(%esp)
 124:	89 3c 24             	mov    %edi,(%esp)
 127:	e8 70 02 00 00       	call   39c <read>
  close(fd);

  printf(1, "read\n");

  fd = open(path, O_RDONLY);
  for (i = 0; i < 20; i++)
 12c:	83 eb 01             	sub    $0x1,%ebx
 12f:	75 e7                	jne    118 <main+0x118>
    read(fd, data, sizeof(data));
  close(fd);
 131:	89 3c 24             	mov    %edi,(%esp)
 134:	e8 73 02 00 00       	call   3ac <close>

  wait();
 139:	e8 4e 02 00 00       	call   38c <wait>

  exit();
 13e:	e8 41 02 00 00       	call   384 <exit>

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
    if(fork() > 0)
 143:	89 df                	mov    %ebx,%edi
 145:	e9 31 ff ff ff       	jmp    7b <main+0x7b>
 14a:	90                   	nop
 14b:	90                   	nop
 14c:	90                   	nop
 14d:	90                   	nop
 14e:	90                   	nop
 14f:	90                   	nop

00000150 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 150:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 151:	31 d2                	xor    %edx,%edx
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 153:	89 e5                	mov    %esp,%ebp
 155:	8b 45 08             	mov    0x8(%ebp),%eax
 158:	53                   	push   %ebx
 159:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 15c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 160:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 164:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 167:	83 c2 01             	add    $0x1,%edx
 16a:	84 c9                	test   %cl,%cl
 16c:	75 f2                	jne    160 <strcpy+0x10>
    ;
  return os;
}
 16e:	5b                   	pop    %ebx
 16f:	5d                   	pop    %ebp
 170:	c3                   	ret    
 171:	eb 0d                	jmp    180 <strcmp>
 173:	90                   	nop
 174:	90                   	nop
 175:	90                   	nop
 176:	90                   	nop
 177:	90                   	nop
 178:	90                   	nop
 179:	90                   	nop
 17a:	90                   	nop
 17b:	90                   	nop
 17c:	90                   	nop
 17d:	90                   	nop
 17e:	90                   	nop
 17f:	90                   	nop

00000180 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	8b 4d 08             	mov    0x8(%ebp),%ecx
 186:	56                   	push   %esi
 187:	8b 55 0c             	mov    0xc(%ebp),%edx
 18a:	53                   	push   %ebx
  while(*p && *p == *q)
 18b:	0f b6 01             	movzbl (%ecx),%eax
 18e:	0f b6 1a             	movzbl (%edx),%ebx
 191:	84 c0                	test   %al,%al
 193:	74 23                	je     1b8 <strcmp+0x38>
 195:	38 d8                	cmp    %bl,%al
 197:	74 10                	je     1a9 <strcmp+0x29>
 199:	eb 2d                	jmp    1c8 <strcmp+0x48>
 19b:	90                   	nop
 19c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1a0:	83 c1 01             	add    $0x1,%ecx
 1a3:	38 d8                	cmp    %bl,%al
 1a5:	75 21                	jne    1c8 <strcmp+0x48>
    p++, q++;
 1a7:	89 f2                	mov    %esi,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1a9:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 1ad:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1b0:	0f b6 5a 01          	movzbl 0x1(%edx),%ebx
 1b4:	84 c0                	test   %al,%al
 1b6:	75 e8                	jne    1a0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1b8:	0f b6 db             	movzbl %bl,%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1bb:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1bd:	29 d8                	sub    %ebx,%eax
}
 1bf:	5b                   	pop    %ebx
 1c0:	5e                   	pop    %esi
 1c1:	5d                   	pop    %ebp
 1c2:	c3                   	ret    
 1c3:	90                   	nop
 1c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1c8:	0f b6 db             	movzbl %bl,%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1cb:	0f b6 c0             	movzbl %al,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1ce:	29 d8                	sub    %ebx,%eax
}
 1d0:	5b                   	pop    %ebx
 1d1:	5e                   	pop    %esi
 1d2:	5d                   	pop    %ebp
 1d3:	c3                   	ret    
 1d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001e0 <strlen>:

uint
strlen(const char *s)
{
 1e0:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
 1e1:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
 1e3:	89 e5                	mov    %esp,%ebp
 1e5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1e8:	80 39 00             	cmpb   $0x0,(%ecx)
 1eb:	74 0e                	je     1fb <strlen+0x1b>
 1ed:	31 d2                	xor    %edx,%edx
 1ef:	90                   	nop
 1f0:	83 c2 01             	add    $0x1,%edx
 1f3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1f7:	89 d0                	mov    %edx,%eax
 1f9:	75 f5                	jne    1f0 <strlen+0x10>
    ;
  return n;
}
 1fb:	5d                   	pop    %ebp
 1fc:	c3                   	ret    
 1fd:	8d 76 00             	lea    0x0(%esi),%esi

00000200 <memset>:

void*
memset(void *dst, int c, uint n)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	8b 55 08             	mov    0x8(%ebp),%edx
 206:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 207:	8b 4d 10             	mov    0x10(%ebp),%ecx
 20a:	8b 45 0c             	mov    0xc(%ebp),%eax
 20d:	89 d7                	mov    %edx,%edi
 20f:	fc                   	cld    
 210:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 212:	89 d0                	mov    %edx,%eax
 214:	5f                   	pop    %edi
 215:	5d                   	pop    %ebp
 216:	c3                   	ret    
 217:	89 f6                	mov    %esi,%esi
 219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000220 <strchr>:

char*
strchr(const char *s, char c)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	8b 45 08             	mov    0x8(%ebp),%eax
 226:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 22a:	0f b6 10             	movzbl (%eax),%edx
 22d:	84 d2                	test   %dl,%dl
 22f:	75 12                	jne    243 <strchr+0x23>
 231:	eb 1d                	jmp    250 <strchr+0x30>
 233:	90                   	nop
 234:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 238:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 23c:	84 d2                	test   %dl,%dl
 23e:	74 10                	je     250 <strchr+0x30>
 240:	83 c0 01             	add    $0x1,%eax
    if(*s == c)
 243:	38 ca                	cmp    %cl,%dl
 245:	75 f1                	jne    238 <strchr+0x18>
      return (char*)s;
  return 0;
}
 247:	5d                   	pop    %ebp
 248:	c3                   	ret    
 249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 250:	31 c0                	xor    %eax,%eax
}
 252:	5d                   	pop    %ebp
 253:	c3                   	ret    
 254:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 25a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000260 <gets>:

char*
gets(char *buf, int max)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	57                   	push   %edi
 264:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 265:	31 f6                	xor    %esi,%esi
  return 0;
}

char*
gets(char *buf, int max)
{
 267:	53                   	push   %ebx
 268:	83 ec 2c             	sub    $0x2c,%esp
 26b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 26e:	eb 31                	jmp    2a1 <gets+0x41>
    cc = read(0, &c, 1);
 270:	8d 45 e7             	lea    -0x19(%ebp),%eax
 273:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 27a:	00 
 27b:	89 44 24 04          	mov    %eax,0x4(%esp)
 27f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 286:	e8 11 01 00 00       	call   39c <read>
    if(cc < 1)
 28b:	85 c0                	test   %eax,%eax
 28d:	7e 1a                	jle    2a9 <gets+0x49>
      break;
    buf[i++] = c;
 28f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 293:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 295:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 297:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 29b:	74 0c                	je     2a9 <gets+0x49>
 29d:	3c 0a                	cmp    $0xa,%al
 29f:	74 08                	je     2a9 <gets+0x49>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2a1:	8d 5e 01             	lea    0x1(%esi),%ebx
 2a4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2a7:	7c c7                	jl     270 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 2a9:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 2ad:	83 c4 2c             	add    $0x2c,%esp
 2b0:	89 f8                	mov    %edi,%eax
 2b2:	5b                   	pop    %ebx
 2b3:	5e                   	pop    %esi
 2b4:	5f                   	pop    %edi
 2b5:	5d                   	pop    %ebp
 2b6:	c3                   	ret    
 2b7:	89 f6                	mov    %esi,%esi
 2b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002c0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2c6:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(const char *n, struct stat *st)
{
 2c9:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 2cc:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 2cf:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2d4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2db:	00 
 2dc:	89 04 24             	mov    %eax,(%esp)
 2df:	e8 e0 00 00 00       	call   3c4 <open>
  if(fd < 0)
 2e4:	85 c0                	test   %eax,%eax
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2e6:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 2e8:	78 19                	js     303 <stat+0x43>
    return -1;
  r = fstat(fd, st);
 2ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ed:	89 1c 24             	mov    %ebx,(%esp)
 2f0:	89 44 24 04          	mov    %eax,0x4(%esp)
 2f4:	e8 e3 00 00 00       	call   3dc <fstat>
  close(fd);
 2f9:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 2fc:	89 c6                	mov    %eax,%esi
  close(fd);
 2fe:	e8 a9 00 00 00       	call   3ac <close>
  return r;
}
 303:	89 f0                	mov    %esi,%eax
 305:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 308:	8b 75 fc             	mov    -0x4(%ebp),%esi
 30b:	89 ec                	mov    %ebp,%esp
 30d:	5d                   	pop    %ebp
 30e:	c3                   	ret    
 30f:	90                   	nop

00000310 <atoi>:

int
atoi(const char *s)
{
 310:	55                   	push   %ebp
  int n;

  n = 0;
 311:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
 313:	89 e5                	mov    %esp,%ebp
 315:	8b 4d 08             	mov    0x8(%ebp),%ecx
 318:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 319:	0f b6 11             	movzbl (%ecx),%edx
 31c:	8d 5a d0             	lea    -0x30(%edx),%ebx
 31f:	80 fb 09             	cmp    $0x9,%bl
 322:	77 1c                	ja     340 <atoi+0x30>
 324:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 328:	0f be d2             	movsbl %dl,%edx
 32b:	83 c1 01             	add    $0x1,%ecx
 32e:	8d 04 80             	lea    (%eax,%eax,4),%eax
 331:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 335:	0f b6 11             	movzbl (%ecx),%edx
 338:	8d 5a d0             	lea    -0x30(%edx),%ebx
 33b:	80 fb 09             	cmp    $0x9,%bl
 33e:	76 e8                	jbe    328 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 340:	5b                   	pop    %ebx
 341:	5d                   	pop    %ebp
 342:	c3                   	ret    
 343:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 349:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000350 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	56                   	push   %esi
 354:	8b 45 08             	mov    0x8(%ebp),%eax
 357:	53                   	push   %ebx
 358:	8b 5d 10             	mov    0x10(%ebp),%ebx
 35b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 35e:	85 db                	test   %ebx,%ebx
 360:	7e 14                	jle    376 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, const void *vsrc, int n)
 362:	31 d2                	xor    %edx,%edx
 364:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 368:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 36c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 36f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 372:	39 da                	cmp    %ebx,%edx
 374:	75 f2                	jne    368 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 376:	5b                   	pop    %ebx
 377:	5e                   	pop    %esi
 378:	5d                   	pop    %ebp
 379:	c3                   	ret    
 37a:	90                   	nop
 37b:	90                   	nop

0000037c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 37c:	b8 01 00 00 00       	mov    $0x1,%eax
 381:	cd 40                	int    $0x40
 383:	c3                   	ret    

00000384 <exit>:
SYSCALL(exit)
 384:	b8 02 00 00 00       	mov    $0x2,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <wait>:
SYSCALL(wait)
 38c:	b8 03 00 00 00       	mov    $0x3,%eax
 391:	cd 40                	int    $0x40
 393:	c3                   	ret    

00000394 <pipe>:
SYSCALL(pipe)
 394:	b8 04 00 00 00       	mov    $0x4,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <read>:
SYSCALL(read)
 39c:	b8 05 00 00 00       	mov    $0x5,%eax
 3a1:	cd 40                	int    $0x40
 3a3:	c3                   	ret    

000003a4 <write>:
SYSCALL(write)
 3a4:	b8 10 00 00 00       	mov    $0x10,%eax
 3a9:	cd 40                	int    $0x40
 3ab:	c3                   	ret    

000003ac <close>:
SYSCALL(close)
 3ac:	b8 15 00 00 00       	mov    $0x15,%eax
 3b1:	cd 40                	int    $0x40
 3b3:	c3                   	ret    

000003b4 <kill>:
SYSCALL(kill)
 3b4:	b8 06 00 00 00       	mov    $0x6,%eax
 3b9:	cd 40                	int    $0x40
 3bb:	c3                   	ret    

000003bc <exec>:
SYSCALL(exec)
 3bc:	b8 07 00 00 00       	mov    $0x7,%eax
 3c1:	cd 40                	int    $0x40
 3c3:	c3                   	ret    

000003c4 <open>:
SYSCALL(open)
 3c4:	b8 0f 00 00 00       	mov    $0xf,%eax
 3c9:	cd 40                	int    $0x40
 3cb:	c3                   	ret    

000003cc <mknod>:
SYSCALL(mknod)
 3cc:	b8 11 00 00 00       	mov    $0x11,%eax
 3d1:	cd 40                	int    $0x40
 3d3:	c3                   	ret    

000003d4 <unlink>:
SYSCALL(unlink)
 3d4:	b8 12 00 00 00       	mov    $0x12,%eax
 3d9:	cd 40                	int    $0x40
 3db:	c3                   	ret    

000003dc <fstat>:
SYSCALL(fstat)
 3dc:	b8 08 00 00 00       	mov    $0x8,%eax
 3e1:	cd 40                	int    $0x40
 3e3:	c3                   	ret    

000003e4 <link>:
SYSCALL(link)
 3e4:	b8 13 00 00 00       	mov    $0x13,%eax
 3e9:	cd 40                	int    $0x40
 3eb:	c3                   	ret    

000003ec <mkdir>:
SYSCALL(mkdir)
 3ec:	b8 14 00 00 00       	mov    $0x14,%eax
 3f1:	cd 40                	int    $0x40
 3f3:	c3                   	ret    

000003f4 <chdir>:
SYSCALL(chdir)
 3f4:	b8 09 00 00 00       	mov    $0x9,%eax
 3f9:	cd 40                	int    $0x40
 3fb:	c3                   	ret    

000003fc <dup>:
SYSCALL(dup)
 3fc:	b8 0a 00 00 00       	mov    $0xa,%eax
 401:	cd 40                	int    $0x40
 403:	c3                   	ret    

00000404 <getpid>:
SYSCALL(getpid)
 404:	b8 0b 00 00 00       	mov    $0xb,%eax
 409:	cd 40                	int    $0x40
 40b:	c3                   	ret    

0000040c <sbrk>:
SYSCALL(sbrk)
 40c:	b8 0c 00 00 00       	mov    $0xc,%eax
 411:	cd 40                	int    $0x40
 413:	c3                   	ret    

00000414 <sleep>:
SYSCALL(sleep)
 414:	b8 0d 00 00 00       	mov    $0xd,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <uptime>:
SYSCALL(uptime)
 41c:	b8 0e 00 00 00       	mov    $0xe,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    
 424:	90                   	nop
 425:	90                   	nop
 426:	90                   	nop
 427:	90                   	nop
 428:	90                   	nop
 429:	90                   	nop
 42a:	90                   	nop
 42b:	90                   	nop
 42c:	90                   	nop
 42d:	90                   	nop
 42e:	90                   	nop
 42f:	90                   	nop

00000430 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	83 ec 28             	sub    $0x28,%esp
 436:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 439:	8d 55 f4             	lea    -0xc(%ebp),%edx
 43c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 443:	00 
 444:	89 54 24 04          	mov    %edx,0x4(%esp)
 448:	89 04 24             	mov    %eax,(%esp)
 44b:	e8 54 ff ff ff       	call   3a4 <write>
}
 450:	c9                   	leave  
 451:	c3                   	ret    
 452:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000460 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	57                   	push   %edi
 464:	56                   	push   %esi
 465:	89 c6                	mov    %eax,%esi
 467:	53                   	push   %ebx
 468:	83 ec 1c             	sub    $0x1c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 46b:	8b 45 08             	mov    0x8(%ebp),%eax
 46e:	85 c0                	test   %eax,%eax
 470:	74 5e                	je     4d0 <printint+0x70>
 472:	89 d0                	mov    %edx,%eax
 474:	c1 e8 1f             	shr    $0x1f,%eax
 477:	84 c0                	test   %al,%al
 479:	74 55                	je     4d0 <printint+0x70>
    neg = 1;
    x = -xx;
 47b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 47d:	bf 01 00 00 00       	mov    $0x1,%edi
    x = -xx;
 482:	f7 d8                	neg    %eax
  } else {
    x = xx;
  }

  i = 0;
 484:	31 db                	xor    %ebx,%ebx
 486:	eb 02                	jmp    48a <printint+0x2a>
  do{
    buf[i++] = digits[x % base];
 488:	89 d3                	mov    %edx,%ebx
 48a:	31 d2                	xor    %edx,%edx
 48c:	f7 f1                	div    %ecx
 48e:	0f b6 92 e8 07 00 00 	movzbl 0x7e8(%edx),%edx
  }while((x /= base) != 0);
 495:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 497:	88 54 1d d8          	mov    %dl,-0x28(%ebp,%ebx,1)
 49b:	8d 53 01             	lea    0x1(%ebx),%edx
  }while((x /= base) != 0);
 49e:	75 e8                	jne    488 <printint+0x28>
  if(neg)
 4a0:	85 ff                	test   %edi,%edi
 4a2:	74 08                	je     4ac <printint+0x4c>
    buf[i++] = '-';
 4a4:	c6 44 15 d8 2d       	movb   $0x2d,-0x28(%ebp,%edx,1)
 4a9:	8d 53 02             	lea    0x2(%ebx),%edx

  while(--i >= 0)
 4ac:	8d 5a ff             	lea    -0x1(%edx),%ebx
 4af:	90                   	nop
    putc(fd, buf[i]);
 4b0:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4b5:	89 f0                	mov    %esi,%eax
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 4b7:	83 eb 01             	sub    $0x1,%ebx
    putc(fd, buf[i]);
 4ba:	e8 71 ff ff ff       	call   430 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 4bf:	83 fb ff             	cmp    $0xffffffff,%ebx
 4c2:	75 ec                	jne    4b0 <printint+0x50>
    putc(fd, buf[i]);
}
 4c4:	83 c4 1c             	add    $0x1c,%esp
 4c7:	5b                   	pop    %ebx
 4c8:	5e                   	pop    %esi
 4c9:	5f                   	pop    %edi
 4ca:	5d                   	pop    %ebp
 4cb:	c3                   	ret    
 4cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 4d0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4d2:	31 ff                	xor    %edi,%edi
 4d4:	eb ae                	jmp    484 <printint+0x24>
 4d6:	8d 76 00             	lea    0x0(%esi),%esi
 4d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004e0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	57                   	push   %edi
 4e4:	56                   	push   %esi
 4e5:	53                   	push   %ebx
 4e6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4e9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 4ec:	0f b6 0b             	movzbl (%ebx),%ecx
 4ef:	84 c9                	test   %cl,%cl
 4f1:	0f 84 89 00 00 00    	je     580 <printf+0xa0>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4f7:	8d 45 10             	lea    0x10(%ebp),%eax
{
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 4fa:	31 f6                	xor    %esi,%esi
  ap = (uint*)(void*)&fmt + 1;
 4fc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 4ff:	eb 21                	jmp    522 <printf+0x42>
 501:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 508:	83 f9 25             	cmp    $0x25,%ecx
 50b:	74 7b                	je     588 <printf+0xa8>
        state = '%';
      } else {
        putc(fd, c);
 50d:	8b 45 08             	mov    0x8(%ebp),%eax
 510:	0f be d1             	movsbl %cl,%edx
 513:	e8 18 ff ff ff       	call   430 <putc>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 518:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 51b:	0f b6 0b             	movzbl (%ebx),%ecx
 51e:	84 c9                	test   %cl,%cl
 520:	74 5e                	je     580 <printf+0xa0>
    c = fmt[i] & 0xff;
    if(state == 0){
 522:	85 f6                	test   %esi,%esi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 524:	0f b6 c9             	movzbl %cl,%ecx
    if(state == 0){
 527:	74 df                	je     508 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 529:	83 fe 25             	cmp    $0x25,%esi
 52c:	75 ea                	jne    518 <printf+0x38>
      if(c == 'd'){
 52e:	83 f9 64             	cmp    $0x64,%ecx
 531:	0f 84 c9 00 00 00    	je     600 <printf+0x120>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 537:	83 f9 70             	cmp    $0x70,%ecx
 53a:	74 54                	je     590 <printf+0xb0>
 53c:	83 f9 78             	cmp    $0x78,%ecx
 53f:	90                   	nop
 540:	74 4e                	je     590 <printf+0xb0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 542:	83 f9 73             	cmp    $0x73,%ecx
 545:	74 71                	je     5b8 <printf+0xd8>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 547:	83 f9 63             	cmp    $0x63,%ecx
 54a:	0f 84 d2 00 00 00    	je     622 <printf+0x142>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 550:	83 f9 25             	cmp    $0x25,%ecx
        putc(fd, c);
 553:	ba 25 00 00 00       	mov    $0x25,%edx
 558:	8b 45 08             	mov    0x8(%ebp),%eax
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 55b:	74 11                	je     56e <printf+0x8e>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 55d:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 560:	e8 cb fe ff ff       	call   430 <putc>
        putc(fd, c);
 565:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 568:	8b 45 08             	mov    0x8(%ebp),%eax
 56b:	0f be d1             	movsbl %cl,%edx
 56e:	83 c3 01             	add    $0x1,%ebx
      }
      state = 0;
 571:	31 f6                	xor    %esi,%esi
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 573:	e8 b8 fe ff ff       	call   430 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 578:	0f b6 0b             	movzbl (%ebx),%ecx
 57b:	84 c9                	test   %cl,%cl
 57d:	75 a3                	jne    522 <printf+0x42>
 57f:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 580:	83 c4 2c             	add    $0x2c,%esp
 583:	5b                   	pop    %ebx
 584:	5e                   	pop    %esi
 585:	5f                   	pop    %edi
 586:	5d                   	pop    %ebp
 587:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 588:	be 25 00 00 00       	mov    $0x25,%esi
 58d:	eb 89                	jmp    518 <printf+0x38>
 58f:	90                   	nop
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 590:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 593:	b9 10 00 00 00       	mov    $0x10,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 598:	31 f6                	xor    %esi,%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 59a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 5a1:	8b 10                	mov    (%eax),%edx
 5a3:	8b 45 08             	mov    0x8(%ebp),%eax
 5a6:	e8 b5 fe ff ff       	call   460 <printint>
        ap++;
 5ab:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 5af:	e9 64 ff ff ff       	jmp    518 <printf+0x38>
 5b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 5b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5bb:	8b 38                	mov    (%eax),%edi
        ap++;
 5bd:	83 c0 04             	add    $0x4,%eax
 5c0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
          s = "(null)";
 5c3:	b8 e1 07 00 00       	mov    $0x7e1,%eax
 5c8:	85 ff                	test   %edi,%edi
 5ca:	0f 44 f8             	cmove  %eax,%edi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5cd:	31 f6                	xor    %esi,%esi
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5cf:	0f b6 17             	movzbl (%edi),%edx
 5d2:	84 d2                	test   %dl,%dl
 5d4:	0f 84 3e ff ff ff    	je     518 <printf+0x38>
 5da:	89 de                	mov    %ebx,%esi
 5dc:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5df:	90                   	nop
          putc(fd, *s);
 5e0:	0f be d2             	movsbl %dl,%edx
          s++;
 5e3:	83 c7 01             	add    $0x1,%edi
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
 5e6:	89 d8                	mov    %ebx,%eax
 5e8:	e8 43 fe ff ff       	call   430 <putc>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5ed:	0f b6 17             	movzbl (%edi),%edx
 5f0:	84 d2                	test   %dl,%dl
 5f2:	75 ec                	jne    5e0 <printf+0x100>
 5f4:	89 f3                	mov    %esi,%ebx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5f6:	31 f6                	xor    %esi,%esi
 5f8:	e9 1b ff ff ff       	jmp    518 <printf+0x38>
 5fd:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 600:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 603:	b1 0a                	mov    $0xa,%cl
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 605:	66 31 f6             	xor    %si,%si
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 608:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 60f:	8b 10                	mov    (%eax),%edx
 611:	8b 45 08             	mov    0x8(%ebp),%eax
 614:	e8 47 fe ff ff       	call   460 <printint>
        ap++;
 619:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 61d:	e9 f6 fe ff ff       	jmp    518 <printf+0x38>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 622:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 625:	31 f6                	xor    %esi,%esi
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 627:	0f be 10             	movsbl (%eax),%edx
 62a:	8b 45 08             	mov    0x8(%ebp),%eax
 62d:	e8 fe fd ff ff       	call   430 <putc>
        ap++;
 632:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 636:	e9 dd fe ff ff       	jmp    518 <printf+0x38>
 63b:	90                   	nop
 63c:	90                   	nop
 63d:	90                   	nop
 63e:	90                   	nop
 63f:	90                   	nop

00000640 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 640:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 641:	a1 98 0a 00 00       	mov    0xa98,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 646:	89 e5                	mov    %esp,%ebp
 648:	57                   	push   %edi
 649:	56                   	push   %esi
 64a:	53                   	push   %ebx
 64b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 64e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 651:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 658:	39 c8                	cmp    %ecx,%eax
 65a:	8b 10                	mov    (%eax),%edx
 65c:	73 04                	jae    662 <free+0x22>
 65e:	39 d1                	cmp    %edx,%ecx
 660:	72 16                	jb     678 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 662:	39 d0                	cmp    %edx,%eax
 664:	72 0c                	jb     672 <free+0x32>
 666:	39 c8                	cmp    %ecx,%eax
 668:	72 0e                	jb     678 <free+0x38>
 66a:	39 d1                	cmp    %edx,%ecx
 66c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 670:	72 06                	jb     678 <free+0x38>
static Header base;
static Header *freep;

void
free(void *ap)
{
 672:	89 d0                	mov    %edx,%eax
 674:	eb e2                	jmp    658 <free+0x18>
 676:	66 90                	xchg   %ax,%ax

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 678:	8b 73 fc             	mov    -0x4(%ebx),%esi
 67b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 67e:	39 d7                	cmp    %edx,%edi
 680:	74 19                	je     69b <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 682:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 685:	8b 50 04             	mov    0x4(%eax),%edx
 688:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 68b:	39 f1                	cmp    %esi,%ecx
 68d:	74 23                	je     6b2 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 68f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 691:	a3 98 0a 00 00       	mov    %eax,0xa98
}
 696:	5b                   	pop    %ebx
 697:	5e                   	pop    %esi
 698:	5f                   	pop    %edi
 699:	5d                   	pop    %ebp
 69a:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 69b:	03 72 04             	add    0x4(%edx),%esi
 69e:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6a1:	8b 10                	mov    (%eax),%edx
 6a3:	8b 12                	mov    (%edx),%edx
 6a5:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 6a8:	8b 50 04             	mov    0x4(%eax),%edx
 6ab:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6ae:	39 f1                	cmp    %esi,%ecx
 6b0:	75 dd                	jne    68f <free+0x4f>
    p->s.size += bp->s.size;
 6b2:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 6b5:	a3 98 0a 00 00       	mov    %eax,0xa98
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 6ba:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6bd:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6c0:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 6c2:	5b                   	pop    %ebx
 6c3:	5e                   	pop    %esi
 6c4:	5f                   	pop    %edi
 6c5:	5d                   	pop    %ebp
 6c6:	c3                   	ret    
 6c7:	89 f6                	mov    %esi,%esi
 6c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6d0:	55                   	push   %ebp
 6d1:	89 e5                	mov    %esp,%ebp
 6d3:	57                   	push   %edi
 6d4:	56                   	push   %esi
 6d5:	53                   	push   %ebx
 6d6:	83 ec 2c             	sub    $0x2c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 6dc:	8b 15 98 0a 00 00    	mov    0xa98,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6e2:	83 c3 07             	add    $0x7,%ebx
 6e5:	c1 eb 03             	shr    $0x3,%ebx
 6e8:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6eb:	85 d2                	test   %edx,%edx
 6ed:	0f 84 a3 00 00 00    	je     796 <malloc+0xc6>
 6f3:	8b 02                	mov    (%edx),%eax
 6f5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 6f8:	39 d9                	cmp    %ebx,%ecx
 6fa:	73 74                	jae    770 <malloc+0xa0>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 6fc:	8d 14 dd 00 00 00 00 	lea    0x0(,%ebx,8),%edx
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 703:	bf 00 80 00 00       	mov    $0x8000,%edi
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 708:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 70b:	eb 0c                	jmp    719 <malloc+0x49>
 70d:	8d 76 00             	lea    0x0(%esi),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 710:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 712:	8b 48 04             	mov    0x4(%eax),%ecx
 715:	39 cb                	cmp    %ecx,%ebx
 717:	76 57                	jbe    770 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 719:	3b 05 98 0a 00 00    	cmp    0xa98,%eax
 71f:	89 c2                	mov    %eax,%edx
 721:	75 ed                	jne    710 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 723:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 726:	81 fb 00 10 00 00    	cmp    $0x1000,%ebx
 72c:	be 00 10 00 00       	mov    $0x1000,%esi
 731:	0f 43 f3             	cmovae %ebx,%esi
 734:	0f 42 c7             	cmovb  %edi,%eax
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 737:	89 04 24             	mov    %eax,(%esp)
 73a:	e8 cd fc ff ff       	call   40c <sbrk>
  if(p == (char*)-1)
 73f:	83 f8 ff             	cmp    $0xffffffff,%eax
 742:	74 1c                	je     760 <malloc+0x90>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 744:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 747:	83 c0 08             	add    $0x8,%eax
 74a:	89 04 24             	mov    %eax,(%esp)
 74d:	e8 ee fe ff ff       	call   640 <free>
  return freep;
 752:	8b 15 98 0a 00 00    	mov    0xa98,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 758:	85 d2                	test   %edx,%edx
 75a:	75 b4                	jne    710 <malloc+0x40>
 75c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return 0;
  }
}
 760:	83 c4 2c             	add    $0x2c,%esp
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
 763:	31 c0                	xor    %eax,%eax
  }
}
 765:	5b                   	pop    %ebx
 766:	5e                   	pop    %esi
 767:	5f                   	pop    %edi
 768:	5d                   	pop    %ebp
 769:	c3                   	ret    
 76a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 770:	39 cb                	cmp    %ecx,%ebx
 772:	74 1c                	je     790 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 774:	29 d9                	sub    %ebx,%ecx
 776:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 779:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 77c:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 77f:	89 15 98 0a 00 00    	mov    %edx,0xa98
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 785:	83 c4 2c             	add    $0x2c,%esp
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 788:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 78b:	5b                   	pop    %ebx
 78c:	5e                   	pop    %esi
 78d:	5f                   	pop    %edi
 78e:	5d                   	pop    %ebp
 78f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 790:	8b 08                	mov    (%eax),%ecx
 792:	89 0a                	mov    %ecx,(%edx)
 794:	eb e9                	jmp    77f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 796:	c7 05 98 0a 00 00 9c 	movl   $0xa9c,0xa98
 79d:	0a 00 00 
    base.s.size = 0;
 7a0:	b8 9c 0a 00 00       	mov    $0xa9c,%eax
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 7a5:	c7 05 9c 0a 00 00 9c 	movl   $0xa9c,0xa9c
 7ac:	0a 00 00 
    base.s.size = 0;
 7af:	c7 05 a0 0a 00 00 00 	movl   $0x0,0xaa0
 7b6:	00 00 00 
 7b9:	e9 3e ff ff ff       	jmp    6fc <malloc+0x2c>
