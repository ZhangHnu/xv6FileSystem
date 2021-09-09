
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
}

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
    exit();
  }
}

int
main(int argc, char *argv[])
   5:	be 01 00 00 00       	mov    $0x1,%esi
{
   a:	53                   	push   %ebx
   b:	83 e4 f0             	and    $0xfffffff0,%esp
   e:	83 ec 20             	sub    $0x20,%esp
  11:	8b 7d 08             	mov    0x8(%ebp),%edi
    exit();
  }
}

int
main(int argc, char *argv[])
  14:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  17:	83 c3 04             	add    $0x4,%ebx
{
  int fd, i;

  if(argc <= 1){
  1a:	83 ff 01             	cmp    $0x1,%edi
  1d:	7e 5d                	jle    7c <main+0x7c>
  1f:	90                   	nop
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  20:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  27:	00 
  28:	8b 03                	mov    (%ebx),%eax
  2a:	89 04 24             	mov    %eax,(%esp)
  2d:	e8 62 03 00 00       	call   394 <open>
  32:	85 c0                	test   %eax,%eax
  34:	78 27                	js     5d <main+0x5d>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  36:	89 04 24             	mov    %eax,(%esp)
  if(argc <= 1){
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
  39:	83 c6 01             	add    $0x1,%esi
  3c:	83 c3 04             	add    $0x4,%ebx
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  3f:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  43:	e8 48 00 00 00       	call   90 <cat>
    close(fd);
  48:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  4c:	89 04 24             	mov    %eax,(%esp)
  4f:	e8 28 03 00 00       	call   37c <close>
  if(argc <= 1){
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
  54:	39 fe                	cmp    %edi,%esi
  56:	75 c8                	jne    20 <main+0x20>
      exit();
    }
    cat(fd);
    close(fd);
  }
  exit();
  58:	e8 f7 02 00 00       	call   354 <exit>
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
  5d:	8b 03                	mov    (%ebx),%eax
  5f:	c7 44 24 04 b1 07 00 	movl   $0x7b1,0x4(%esp)
  66:	00 
  67:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  6e:	89 44 24 08          	mov    %eax,0x8(%esp)
  72:	e8 39 04 00 00       	call   4b0 <printf>
      exit();
  77:	e8 d8 02 00 00       	call   354 <exit>
main(int argc, char *argv[])
{
  int fd, i;

  if(argc <= 1){
    cat(0);
  7c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  83:	e8 08 00 00 00       	call   90 <cat>
    exit();
  88:	e8 c7 02 00 00       	call   354 <exit>
  8d:	90                   	nop
  8e:	90                   	nop
  8f:	90                   	nop

00000090 <cat>:

char buf[512];

void
cat(int fd)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	56                   	push   %esi
  94:	53                   	push   %ebx
  95:	83 ec 10             	sub    $0x10,%esp
  98:	8b 75 08             	mov    0x8(%ebp),%esi
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
  9b:	eb 1f                	jmp    bc <cat+0x2c>
  9d:	8d 76 00             	lea    0x0(%esi),%esi
    if (write(1, buf, n) != n) {
  a0:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  a4:	c7 44 24 04 e0 0a 00 	movl   $0xae0,0x4(%esp)
  ab:	00 
  ac:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  b3:	e8 bc 02 00 00       	call   374 <write>
  b8:	39 d8                	cmp    %ebx,%eax
  ba:	75 28                	jne    e4 <cat+0x54>
void
cat(int fd)
{
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
  bc:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  c3:	00 
  c4:	c7 44 24 04 e0 0a 00 	movl   $0xae0,0x4(%esp)
  cb:	00 
  cc:	89 34 24             	mov    %esi,(%esp)
  cf:	e8 98 02 00 00       	call   36c <read>
  d4:	83 f8 00             	cmp    $0x0,%eax
  d7:	89 c3                	mov    %eax,%ebx
  d9:	7f c5                	jg     a0 <cat+0x10>
    if (write(1, buf, n) != n) {
      printf(1, "cat: write error\n");
      exit();
    }
  }
  if(n < 0){
  db:	75 20                	jne    fd <cat+0x6d>
    printf(1, "cat: read error\n");
    exit();
  }
}
  dd:	83 c4 10             	add    $0x10,%esp
  e0:	5b                   	pop    %ebx
  e1:	5e                   	pop    %esi
  e2:	5d                   	pop    %ebp
  e3:	c3                   	ret    
{
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
    if (write(1, buf, n) != n) {
      printf(1, "cat: write error\n");
  e4:	c7 44 24 04 8e 07 00 	movl   $0x78e,0x4(%esp)
  eb:	00 
  ec:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  f3:	e8 b8 03 00 00       	call   4b0 <printf>
      exit();
  f8:	e8 57 02 00 00       	call   354 <exit>
    }
  }
  if(n < 0){
    printf(1, "cat: read error\n");
  fd:	c7 44 24 04 a0 07 00 	movl   $0x7a0,0x4(%esp)
 104:	00 
 105:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 10c:	e8 9f 03 00 00       	call   4b0 <printf>
    exit();
 111:	e8 3e 02 00 00       	call   354 <exit>
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
 3f4:	90                   	nop
 3f5:	90                   	nop
 3f6:	90                   	nop
 3f7:	90                   	nop
 3f8:	90                   	nop
 3f9:	90                   	nop
 3fa:	90                   	nop
 3fb:	90                   	nop
 3fc:	90                   	nop
 3fd:	90                   	nop
 3fe:	90                   	nop
 3ff:	90                   	nop

00000400 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	83 ec 28             	sub    $0x28,%esp
 406:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 409:	8d 55 f4             	lea    -0xc(%ebp),%edx
 40c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 413:	00 
 414:	89 54 24 04          	mov    %edx,0x4(%esp)
 418:	89 04 24             	mov    %eax,(%esp)
 41b:	e8 54 ff ff ff       	call   374 <write>
}
 420:	c9                   	leave  
 421:	c3                   	ret    
 422:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000430 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	57                   	push   %edi
 434:	56                   	push   %esi
 435:	89 c6                	mov    %eax,%esi
 437:	53                   	push   %ebx
 438:	83 ec 1c             	sub    $0x1c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 43b:	8b 45 08             	mov    0x8(%ebp),%eax
 43e:	85 c0                	test   %eax,%eax
 440:	74 5e                	je     4a0 <printint+0x70>
 442:	89 d0                	mov    %edx,%eax
 444:	c1 e8 1f             	shr    $0x1f,%eax
 447:	84 c0                	test   %al,%al
 449:	74 55                	je     4a0 <printint+0x70>
    neg = 1;
    x = -xx;
 44b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 44d:	bf 01 00 00 00       	mov    $0x1,%edi
    x = -xx;
 452:	f7 d8                	neg    %eax
  } else {
    x = xx;
  }

  i = 0;
 454:	31 db                	xor    %ebx,%ebx
 456:	eb 02                	jmp    45a <printint+0x2a>
  do{
    buf[i++] = digits[x % base];
 458:	89 d3                	mov    %edx,%ebx
 45a:	31 d2                	xor    %edx,%edx
 45c:	f7 f1                	div    %ecx
 45e:	0f b6 92 cd 07 00 00 	movzbl 0x7cd(%edx),%edx
  }while((x /= base) != 0);
 465:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 467:	88 54 1d d8          	mov    %dl,-0x28(%ebp,%ebx,1)
 46b:	8d 53 01             	lea    0x1(%ebx),%edx
  }while((x /= base) != 0);
 46e:	75 e8                	jne    458 <printint+0x28>
  if(neg)
 470:	85 ff                	test   %edi,%edi
 472:	74 08                	je     47c <printint+0x4c>
    buf[i++] = '-';
 474:	c6 44 15 d8 2d       	movb   $0x2d,-0x28(%ebp,%edx,1)
 479:	8d 53 02             	lea    0x2(%ebx),%edx

  while(--i >= 0)
 47c:	8d 5a ff             	lea    -0x1(%edx),%ebx
 47f:	90                   	nop
    putc(fd, buf[i]);
 480:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 485:	89 f0                	mov    %esi,%eax
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 487:	83 eb 01             	sub    $0x1,%ebx
    putc(fd, buf[i]);
 48a:	e8 71 ff ff ff       	call   400 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 48f:	83 fb ff             	cmp    $0xffffffff,%ebx
 492:	75 ec                	jne    480 <printint+0x50>
    putc(fd, buf[i]);
}
 494:	83 c4 1c             	add    $0x1c,%esp
 497:	5b                   	pop    %ebx
 498:	5e                   	pop    %esi
 499:	5f                   	pop    %edi
 49a:	5d                   	pop    %ebp
 49b:	c3                   	ret    
 49c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 4a0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4a2:	31 ff                	xor    %edi,%edi
 4a4:	eb ae                	jmp    454 <printint+0x24>
 4a6:	8d 76 00             	lea    0x0(%esi),%esi
 4a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004b0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	57                   	push   %edi
 4b4:	56                   	push   %esi
 4b5:	53                   	push   %ebx
 4b6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4b9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 4bc:	0f b6 0b             	movzbl (%ebx),%ecx
 4bf:	84 c9                	test   %cl,%cl
 4c1:	0f 84 89 00 00 00    	je     550 <printf+0xa0>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4c7:	8d 45 10             	lea    0x10(%ebp),%eax
{
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 4ca:	31 f6                	xor    %esi,%esi
  ap = (uint*)(void*)&fmt + 1;
 4cc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 4cf:	eb 21                	jmp    4f2 <printf+0x42>
 4d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 4d8:	83 f9 25             	cmp    $0x25,%ecx
 4db:	74 7b                	je     558 <printf+0xa8>
        state = '%';
      } else {
        putc(fd, c);
 4dd:	8b 45 08             	mov    0x8(%ebp),%eax
 4e0:	0f be d1             	movsbl %cl,%edx
 4e3:	e8 18 ff ff ff       	call   400 <putc>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 4e8:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4eb:	0f b6 0b             	movzbl (%ebx),%ecx
 4ee:	84 c9                	test   %cl,%cl
 4f0:	74 5e                	je     550 <printf+0xa0>
    c = fmt[i] & 0xff;
    if(state == 0){
 4f2:	85 f6                	test   %esi,%esi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 4f4:	0f b6 c9             	movzbl %cl,%ecx
    if(state == 0){
 4f7:	74 df                	je     4d8 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 4f9:	83 fe 25             	cmp    $0x25,%esi
 4fc:	75 ea                	jne    4e8 <printf+0x38>
      if(c == 'd'){
 4fe:	83 f9 64             	cmp    $0x64,%ecx
 501:	0f 84 c9 00 00 00    	je     5d0 <printf+0x120>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 507:	83 f9 70             	cmp    $0x70,%ecx
 50a:	74 54                	je     560 <printf+0xb0>
 50c:	83 f9 78             	cmp    $0x78,%ecx
 50f:	90                   	nop
 510:	74 4e                	je     560 <printf+0xb0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 512:	83 f9 73             	cmp    $0x73,%ecx
 515:	74 71                	je     588 <printf+0xd8>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 517:	83 f9 63             	cmp    $0x63,%ecx
 51a:	0f 84 d2 00 00 00    	je     5f2 <printf+0x142>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 520:	83 f9 25             	cmp    $0x25,%ecx
        putc(fd, c);
 523:	ba 25 00 00 00       	mov    $0x25,%edx
 528:	8b 45 08             	mov    0x8(%ebp),%eax
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 52b:	74 11                	je     53e <printf+0x8e>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 52d:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 530:	e8 cb fe ff ff       	call   400 <putc>
        putc(fd, c);
 535:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 538:	8b 45 08             	mov    0x8(%ebp),%eax
 53b:	0f be d1             	movsbl %cl,%edx
 53e:	83 c3 01             	add    $0x1,%ebx
      }
      state = 0;
 541:	31 f6                	xor    %esi,%esi
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 543:	e8 b8 fe ff ff       	call   400 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 548:	0f b6 0b             	movzbl (%ebx),%ecx
 54b:	84 c9                	test   %cl,%cl
 54d:	75 a3                	jne    4f2 <printf+0x42>
 54f:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 550:	83 c4 2c             	add    $0x2c,%esp
 553:	5b                   	pop    %ebx
 554:	5e                   	pop    %esi
 555:	5f                   	pop    %edi
 556:	5d                   	pop    %ebp
 557:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 558:	be 25 00 00 00       	mov    $0x25,%esi
 55d:	eb 89                	jmp    4e8 <printf+0x38>
 55f:	90                   	nop
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 560:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 563:	b9 10 00 00 00       	mov    $0x10,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 568:	31 f6                	xor    %esi,%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 56a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 571:	8b 10                	mov    (%eax),%edx
 573:	8b 45 08             	mov    0x8(%ebp),%eax
 576:	e8 b5 fe ff ff       	call   430 <printint>
        ap++;
 57b:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 57f:	e9 64 ff ff ff       	jmp    4e8 <printf+0x38>
 584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 588:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 58b:	8b 38                	mov    (%eax),%edi
        ap++;
 58d:	83 c0 04             	add    $0x4,%eax
 590:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
          s = "(null)";
 593:	b8 c6 07 00 00       	mov    $0x7c6,%eax
 598:	85 ff                	test   %edi,%edi
 59a:	0f 44 f8             	cmove  %eax,%edi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 59d:	31 f6                	xor    %esi,%esi
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 59f:	0f b6 17             	movzbl (%edi),%edx
 5a2:	84 d2                	test   %dl,%dl
 5a4:	0f 84 3e ff ff ff    	je     4e8 <printf+0x38>
 5aa:	89 de                	mov    %ebx,%esi
 5ac:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5af:	90                   	nop
          putc(fd, *s);
 5b0:	0f be d2             	movsbl %dl,%edx
          s++;
 5b3:	83 c7 01             	add    $0x1,%edi
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
 5b6:	89 d8                	mov    %ebx,%eax
 5b8:	e8 43 fe ff ff       	call   400 <putc>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5bd:	0f b6 17             	movzbl (%edi),%edx
 5c0:	84 d2                	test   %dl,%dl
 5c2:	75 ec                	jne    5b0 <printf+0x100>
 5c4:	89 f3                	mov    %esi,%ebx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5c6:	31 f6                	xor    %esi,%esi
 5c8:	e9 1b ff ff ff       	jmp    4e8 <printf+0x38>
 5cd:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 5d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5d3:	b1 0a                	mov    $0xa,%cl
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5d5:	66 31 f6             	xor    %si,%si
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 5d8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 5df:	8b 10                	mov    (%eax),%edx
 5e1:	8b 45 08             	mov    0x8(%ebp),%eax
 5e4:	e8 47 fe ff ff       	call   430 <printint>
        ap++;
 5e9:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 5ed:	e9 f6 fe ff ff       	jmp    4e8 <printf+0x38>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 5f2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5f5:	31 f6                	xor    %esi,%esi
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 5f7:	0f be 10             	movsbl (%eax),%edx
 5fa:	8b 45 08             	mov    0x8(%ebp),%eax
 5fd:	e8 fe fd ff ff       	call   400 <putc>
        ap++;
 602:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 606:	e9 dd fe ff ff       	jmp    4e8 <printf+0x38>
 60b:	90                   	nop
 60c:	90                   	nop
 60d:	90                   	nop
 60e:	90                   	nop
 60f:	90                   	nop

00000610 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 610:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 611:	a1 c0 0a 00 00       	mov    0xac0,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 616:	89 e5                	mov    %esp,%ebp
 618:	57                   	push   %edi
 619:	56                   	push   %esi
 61a:	53                   	push   %ebx
 61b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 61e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 621:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 628:	39 c8                	cmp    %ecx,%eax
 62a:	8b 10                	mov    (%eax),%edx
 62c:	73 04                	jae    632 <free+0x22>
 62e:	39 d1                	cmp    %edx,%ecx
 630:	72 16                	jb     648 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 632:	39 d0                	cmp    %edx,%eax
 634:	72 0c                	jb     642 <free+0x32>
 636:	39 c8                	cmp    %ecx,%eax
 638:	72 0e                	jb     648 <free+0x38>
 63a:	39 d1                	cmp    %edx,%ecx
 63c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 640:	72 06                	jb     648 <free+0x38>
static Header base;
static Header *freep;

void
free(void *ap)
{
 642:	89 d0                	mov    %edx,%eax
 644:	eb e2                	jmp    628 <free+0x18>
 646:	66 90                	xchg   %ax,%ax

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 648:	8b 73 fc             	mov    -0x4(%ebx),%esi
 64b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 64e:	39 d7                	cmp    %edx,%edi
 650:	74 19                	je     66b <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 652:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 655:	8b 50 04             	mov    0x4(%eax),%edx
 658:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 65b:	39 f1                	cmp    %esi,%ecx
 65d:	74 23                	je     682 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 65f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 661:	a3 c0 0a 00 00       	mov    %eax,0xac0
}
 666:	5b                   	pop    %ebx
 667:	5e                   	pop    %esi
 668:	5f                   	pop    %edi
 669:	5d                   	pop    %ebp
 66a:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 66b:	03 72 04             	add    0x4(%edx),%esi
 66e:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 671:	8b 10                	mov    (%eax),%edx
 673:	8b 12                	mov    (%edx),%edx
 675:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 678:	8b 50 04             	mov    0x4(%eax),%edx
 67b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 67e:	39 f1                	cmp    %esi,%ecx
 680:	75 dd                	jne    65f <free+0x4f>
    p->s.size += bp->s.size;
 682:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 685:	a3 c0 0a 00 00       	mov    %eax,0xac0
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 68a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 68d:	8b 53 f8             	mov    -0x8(%ebx),%edx
 690:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 692:	5b                   	pop    %ebx
 693:	5e                   	pop    %esi
 694:	5f                   	pop    %edi
 695:	5d                   	pop    %ebp
 696:	c3                   	ret    
 697:	89 f6                	mov    %esi,%esi
 699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6a0:	55                   	push   %ebp
 6a1:	89 e5                	mov    %esp,%ebp
 6a3:	57                   	push   %edi
 6a4:	56                   	push   %esi
 6a5:	53                   	push   %ebx
 6a6:	83 ec 2c             	sub    $0x2c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6a9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 6ac:	8b 15 c0 0a 00 00    	mov    0xac0,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6b2:	83 c3 07             	add    $0x7,%ebx
 6b5:	c1 eb 03             	shr    $0x3,%ebx
 6b8:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6bb:	85 d2                	test   %edx,%edx
 6bd:	0f 84 a3 00 00 00    	je     766 <malloc+0xc6>
 6c3:	8b 02                	mov    (%edx),%eax
 6c5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 6c8:	39 d9                	cmp    %ebx,%ecx
 6ca:	73 74                	jae    740 <malloc+0xa0>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 6cc:	8d 14 dd 00 00 00 00 	lea    0x0(,%ebx,8),%edx
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 6d3:	bf 00 80 00 00       	mov    $0x8000,%edi
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 6d8:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 6db:	eb 0c                	jmp    6e9 <malloc+0x49>
 6dd:	8d 76 00             	lea    0x0(%esi),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6e0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6e2:	8b 48 04             	mov    0x4(%eax),%ecx
 6e5:	39 cb                	cmp    %ecx,%ebx
 6e7:	76 57                	jbe    740 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6e9:	3b 05 c0 0a 00 00    	cmp    0xac0,%eax
 6ef:	89 c2                	mov    %eax,%edx
 6f1:	75 ed                	jne    6e0 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 6f3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6f6:	81 fb 00 10 00 00    	cmp    $0x1000,%ebx
 6fc:	be 00 10 00 00       	mov    $0x1000,%esi
 701:	0f 43 f3             	cmovae %ebx,%esi
 704:	0f 42 c7             	cmovb  %edi,%eax
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 707:	89 04 24             	mov    %eax,(%esp)
 70a:	e8 cd fc ff ff       	call   3dc <sbrk>
  if(p == (char*)-1)
 70f:	83 f8 ff             	cmp    $0xffffffff,%eax
 712:	74 1c                	je     730 <malloc+0x90>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 714:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 717:	83 c0 08             	add    $0x8,%eax
 71a:	89 04 24             	mov    %eax,(%esp)
 71d:	e8 ee fe ff ff       	call   610 <free>
  return freep;
 722:	8b 15 c0 0a 00 00    	mov    0xac0,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 728:	85 d2                	test   %edx,%edx
 72a:	75 b4                	jne    6e0 <malloc+0x40>
 72c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return 0;
  }
}
 730:	83 c4 2c             	add    $0x2c,%esp
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
 733:	31 c0                	xor    %eax,%eax
  }
}
 735:	5b                   	pop    %ebx
 736:	5e                   	pop    %esi
 737:	5f                   	pop    %edi
 738:	5d                   	pop    %ebp
 739:	c3                   	ret    
 73a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 740:	39 cb                	cmp    %ecx,%ebx
 742:	74 1c                	je     760 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 744:	29 d9                	sub    %ebx,%ecx
 746:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 749:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 74c:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 74f:	89 15 c0 0a 00 00    	mov    %edx,0xac0
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 755:	83 c4 2c             	add    $0x2c,%esp
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 758:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 75b:	5b                   	pop    %ebx
 75c:	5e                   	pop    %esi
 75d:	5f                   	pop    %edi
 75e:	5d                   	pop    %ebp
 75f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 760:	8b 08                	mov    (%eax),%ecx
 762:	89 0a                	mov    %ecx,(%edx)
 764:	eb e9                	jmp    74f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 766:	c7 05 c0 0a 00 00 c4 	movl   $0xac4,0xac0
 76d:	0a 00 00 
    base.s.size = 0;
 770:	b8 c4 0a 00 00       	mov    $0xac4,%eax
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 775:	c7 05 c4 0a 00 00 c4 	movl   $0xac4,0xac4
 77c:	0a 00 00 
    base.s.size = 0;
 77f:	c7 05 c8 0a 00 00 00 	movl   $0x0,0xac8
 786:	00 00 00 
 789:	e9 3e ff ff ff       	jmp    6cc <malloc+0x2c>
