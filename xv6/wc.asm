
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

int
main(int argc, char *argv[])
   5:	be 01 00 00 00       	mov    $0x1,%esi
{
   a:	53                   	push   %ebx
   b:	83 e4 f0             	and    $0xfffffff0,%esp
   e:	83 ec 20             	sub    $0x20,%esp
  11:	8b 7d 08             	mov    0x8(%ebp),%edi
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

int
main(int argc, char *argv[])
  14:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  17:	83 c3 04             	add    $0x4,%ebx
{
  int fd, i;

  if(argc <= 1){
  1a:	83 ff 01             	cmp    $0x1,%edi
  1d:	7e 63                	jle    82 <main+0x82>
  1f:	90                   	nop
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  20:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  27:	00 
  28:	8b 03                	mov    (%ebx),%eax
  2a:	89 04 24             	mov    %eax,(%esp)
  2d:	e8 d2 03 00 00       	call   404 <open>
  32:	85 c0                	test   %eax,%eax
  34:	78 2d                	js     63 <main+0x63>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  36:	8b 13                	mov    (%ebx),%edx
  if(argc <= 1){
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
  38:	83 c6 01             	add    $0x1,%esi
  3b:	83 c3 04             	add    $0x4,%ebx
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  3e:	89 04 24             	mov    %eax,(%esp)
  41:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  45:	89 54 24 04          	mov    %edx,0x4(%esp)
  49:	e8 52 00 00 00       	call   a0 <wc>
    close(fd);
  4e:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  52:	89 04 24             	mov    %eax,(%esp)
  55:	e8 92 03 00 00       	call   3ec <close>
  if(argc <= 1){
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
  5a:	39 fe                	cmp    %edi,%esi
  5c:	75 c2                	jne    20 <main+0x20>
      exit();
    }
    wc(fd, argv[i]);
    close(fd);
  }
  exit();
  5e:	e8 61 03 00 00       	call   3c4 <exit>
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "wc: cannot open %s\n", argv[i]);
  63:	8b 03                	mov    (%ebx),%eax
  65:	c7 44 24 04 21 08 00 	movl   $0x821,0x4(%esp)
  6c:	00 
  6d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  74:	89 44 24 08          	mov    %eax,0x8(%esp)
  78:	e8 a3 04 00 00       	call   520 <printf>
      exit();
  7d:	e8 42 03 00 00       	call   3c4 <exit>
main(int argc, char *argv[])
{
  int fd, i;

  if(argc <= 1){
    wc(0, "");
  82:	c7 44 24 04 13 08 00 	movl   $0x813,0x4(%esp)
  89:	00 
  8a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  91:	e8 0a 00 00 00       	call   a0 <wc>
    exit();
  96:	e8 29 03 00 00       	call   3c4 <exit>
  9b:	90                   	nop
  9c:	90                   	nop
  9d:	90                   	nop
  9e:	90                   	nop
  9f:	90                   	nop

000000a0 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	57                   	push   %edi
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  a4:	31 ff                	xor    %edi,%edi

char buf[512];

void
wc(int fd, char *name)
{
  a6:	56                   	push   %esi
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  a7:	31 f6                	xor    %esi,%esi

char buf[512];

void
wc(int fd, char *name)
{
  a9:	53                   	push   %ebx
  aa:	83 ec 3c             	sub    $0x3c,%esp
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  ad:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  b4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  bb:	90                   	nop
  bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
  c0:	8b 45 08             	mov    0x8(%ebp),%eax
  c3:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  ca:	00 
  cb:	c7 44 24 04 60 0b 00 	movl   $0xb60,0x4(%esp)
  d2:	00 
  d3:	89 04 24             	mov    %eax,(%esp)
  d6:	e8 01 03 00 00       	call   3dc <read>
  db:	83 f8 00             	cmp    $0x0,%eax
  de:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  e1:	7e 5c                	jle    13f <wc+0x9f>
  e3:	31 db                	xor    %ebx,%ebx
  e5:	eb 0b                	jmp    f2 <wc+0x52>
  e7:	90                   	nop
    for(i=0; i<n; i++){
      c++;
      if(buf[i] == '\n')
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
        inword = 0;
  e8:	31 ff                	xor    %edi,%edi
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
  ea:	83 c3 01             	add    $0x1,%ebx
  ed:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
  f0:	74 38                	je     12a <wc+0x8a>
      c++;
      if(buf[i] == '\n')
  f2:	0f be 83 60 0b 00 00 	movsbl 0xb60(%ebx),%eax
        l++;
  f9:	31 d2                	xor    %edx,%edx
      if(strchr(" \r\t\n\v", buf[i]))
  fb:	c7 04 24 fe 07 00 00 	movl   $0x7fe,(%esp)
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
      c++;
      if(buf[i] == '\n')
        l++;
 102:	3c 0a                	cmp    $0xa,%al
 104:	0f 94 c2             	sete   %dl
 107:	01 d6                	add    %edx,%esi
      if(strchr(" \r\t\n\v", buf[i]))
 109:	89 44 24 04          	mov    %eax,0x4(%esp)
 10d:	e8 4e 01 00 00       	call   260 <strchr>
 112:	85 c0                	test   %eax,%eax
 114:	75 d2                	jne    e8 <wc+0x48>
        inword = 0;
      else if(!inword){
 116:	85 ff                	test   %edi,%edi
 118:	75 1e                	jne    138 <wc+0x98>
        w++;
 11a:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
 11e:	83 c3 01             	add    $0x1,%ebx
 121:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
        inword = 0;
      else if(!inword){
        w++;
        inword = 1;
 124:	66 bf 01 00          	mov    $0x1,%di
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
 128:	75 c8                	jne    f2 <wc+0x52>
#include "user.h"

char buf[512];

void
wc(int fd, char *name)
 12a:	8b 45 dc             	mov    -0x24(%ebp),%eax
 12d:	01 d8                	add    %ebx,%eax
 12f:	89 45 dc             	mov    %eax,-0x24(%ebp)
 132:	eb 8c                	jmp    c0 <wc+0x20>
 134:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      c++;
      if(buf[i] == '\n')
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
        inword = 0;
      else if(!inword){
 138:	bf 01 00 00 00       	mov    $0x1,%edi
 13d:	eb ab                	jmp    ea <wc+0x4a>
        w++;
        inword = 1;
      }
    }
  }
  if(n < 0){
 13f:	75 35                	jne    176 <wc+0xd6>
    printf(1, "wc: read error\n");
    exit();
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
 141:	8b 45 0c             	mov    0xc(%ebp),%eax
 144:	89 74 24 08          	mov    %esi,0x8(%esp)
 148:	c7 44 24 04 14 08 00 	movl   $0x814,0x4(%esp)
 14f:	00 
 150:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 157:	89 44 24 14          	mov    %eax,0x14(%esp)
 15b:	8b 45 dc             	mov    -0x24(%ebp),%eax
 15e:	89 44 24 10          	mov    %eax,0x10(%esp)
 162:	8b 45 e0             	mov    -0x20(%ebp),%eax
 165:	89 44 24 0c          	mov    %eax,0xc(%esp)
 169:	e8 b2 03 00 00       	call   520 <printf>
}
 16e:	83 c4 3c             	add    $0x3c,%esp
 171:	5b                   	pop    %ebx
 172:	5e                   	pop    %esi
 173:	5f                   	pop    %edi
 174:	5d                   	pop    %ebp
 175:	c3                   	ret    
        inword = 1;
      }
    }
  }
  if(n < 0){
    printf(1, "wc: read error\n");
 176:	c7 44 24 04 04 08 00 	movl   $0x804,0x4(%esp)
 17d:	00 
 17e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 185:	e8 96 03 00 00       	call   520 <printf>
    exit();
 18a:	e8 35 02 00 00       	call   3c4 <exit>
 18f:	90                   	nop

00000190 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 190:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 191:	31 d2                	xor    %edx,%edx
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 193:	89 e5                	mov    %esp,%ebp
 195:	8b 45 08             	mov    0x8(%ebp),%eax
 198:	53                   	push   %ebx
 199:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 19c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1a0:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 1a4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 1a7:	83 c2 01             	add    $0x1,%edx
 1aa:	84 c9                	test   %cl,%cl
 1ac:	75 f2                	jne    1a0 <strcpy+0x10>
    ;
  return os;
}
 1ae:	5b                   	pop    %ebx
 1af:	5d                   	pop    %ebp
 1b0:	c3                   	ret    
 1b1:	eb 0d                	jmp    1c0 <strcmp>
 1b3:	90                   	nop
 1b4:	90                   	nop
 1b5:	90                   	nop
 1b6:	90                   	nop
 1b7:	90                   	nop
 1b8:	90                   	nop
 1b9:	90                   	nop
 1ba:	90                   	nop
 1bb:	90                   	nop
 1bc:	90                   	nop
 1bd:	90                   	nop
 1be:	90                   	nop
 1bf:	90                   	nop

000001c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1c6:	56                   	push   %esi
 1c7:	8b 55 0c             	mov    0xc(%ebp),%edx
 1ca:	53                   	push   %ebx
  while(*p && *p == *q)
 1cb:	0f b6 01             	movzbl (%ecx),%eax
 1ce:	0f b6 1a             	movzbl (%edx),%ebx
 1d1:	84 c0                	test   %al,%al
 1d3:	74 23                	je     1f8 <strcmp+0x38>
 1d5:	38 d8                	cmp    %bl,%al
 1d7:	74 10                	je     1e9 <strcmp+0x29>
 1d9:	eb 2d                	jmp    208 <strcmp+0x48>
 1db:	90                   	nop
 1dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1e0:	83 c1 01             	add    $0x1,%ecx
 1e3:	38 d8                	cmp    %bl,%al
 1e5:	75 21                	jne    208 <strcmp+0x48>
    p++, q++;
 1e7:	89 f2                	mov    %esi,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1e9:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 1ed:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1f0:	0f b6 5a 01          	movzbl 0x1(%edx),%ebx
 1f4:	84 c0                	test   %al,%al
 1f6:	75 e8                	jne    1e0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1f8:	0f b6 db             	movzbl %bl,%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1fb:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1fd:	29 d8                	sub    %ebx,%eax
}
 1ff:	5b                   	pop    %ebx
 200:	5e                   	pop    %esi
 201:	5d                   	pop    %ebp
 202:	c3                   	ret    
 203:	90                   	nop
 204:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 208:	0f b6 db             	movzbl %bl,%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 20b:	0f b6 c0             	movzbl %al,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 20e:	29 d8                	sub    %ebx,%eax
}
 210:	5b                   	pop    %ebx
 211:	5e                   	pop    %esi
 212:	5d                   	pop    %ebp
 213:	c3                   	ret    
 214:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 21a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000220 <strlen>:

uint
strlen(const char *s)
{
 220:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
 221:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
 223:	89 e5                	mov    %esp,%ebp
 225:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 228:	80 39 00             	cmpb   $0x0,(%ecx)
 22b:	74 0e                	je     23b <strlen+0x1b>
 22d:	31 d2                	xor    %edx,%edx
 22f:	90                   	nop
 230:	83 c2 01             	add    $0x1,%edx
 233:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 237:	89 d0                	mov    %edx,%eax
 239:	75 f5                	jne    230 <strlen+0x10>
    ;
  return n;
}
 23b:	5d                   	pop    %ebp
 23c:	c3                   	ret    
 23d:	8d 76 00             	lea    0x0(%esi),%esi

00000240 <memset>:

void*
memset(void *dst, int c, uint n)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	8b 55 08             	mov    0x8(%ebp),%edx
 246:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 247:	8b 4d 10             	mov    0x10(%ebp),%ecx
 24a:	8b 45 0c             	mov    0xc(%ebp),%eax
 24d:	89 d7                	mov    %edx,%edi
 24f:	fc                   	cld    
 250:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 252:	89 d0                	mov    %edx,%eax
 254:	5f                   	pop    %edi
 255:	5d                   	pop    %ebp
 256:	c3                   	ret    
 257:	89 f6                	mov    %esi,%esi
 259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000260 <strchr>:

char*
strchr(const char *s, char c)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	8b 45 08             	mov    0x8(%ebp),%eax
 266:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 26a:	0f b6 10             	movzbl (%eax),%edx
 26d:	84 d2                	test   %dl,%dl
 26f:	75 12                	jne    283 <strchr+0x23>
 271:	eb 1d                	jmp    290 <strchr+0x30>
 273:	90                   	nop
 274:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 278:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 27c:	84 d2                	test   %dl,%dl
 27e:	74 10                	je     290 <strchr+0x30>
 280:	83 c0 01             	add    $0x1,%eax
    if(*s == c)
 283:	38 ca                	cmp    %cl,%dl
 285:	75 f1                	jne    278 <strchr+0x18>
      return (char*)s;
  return 0;
}
 287:	5d                   	pop    %ebp
 288:	c3                   	ret    
 289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 290:	31 c0                	xor    %eax,%eax
}
 292:	5d                   	pop    %ebp
 293:	c3                   	ret    
 294:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 29a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000002a0 <gets>:

char*
gets(char *buf, int max)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	57                   	push   %edi
 2a4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2a5:	31 f6                	xor    %esi,%esi
  return 0;
}

char*
gets(char *buf, int max)
{
 2a7:	53                   	push   %ebx
 2a8:	83 ec 2c             	sub    $0x2c,%esp
 2ab:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2ae:	eb 31                	jmp    2e1 <gets+0x41>
    cc = read(0, &c, 1);
 2b0:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2b3:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 2ba:	00 
 2bb:	89 44 24 04          	mov    %eax,0x4(%esp)
 2bf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2c6:	e8 11 01 00 00       	call   3dc <read>
    if(cc < 1)
 2cb:	85 c0                	test   %eax,%eax
 2cd:	7e 1a                	jle    2e9 <gets+0x49>
      break;
    buf[i++] = c;
 2cf:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2d3:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 2d5:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 2d7:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 2db:	74 0c                	je     2e9 <gets+0x49>
 2dd:	3c 0a                	cmp    $0xa,%al
 2df:	74 08                	je     2e9 <gets+0x49>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2e1:	8d 5e 01             	lea    0x1(%esi),%ebx
 2e4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2e7:	7c c7                	jl     2b0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 2e9:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 2ed:	83 c4 2c             	add    $0x2c,%esp
 2f0:	89 f8                	mov    %edi,%eax
 2f2:	5b                   	pop    %ebx
 2f3:	5e                   	pop    %esi
 2f4:	5f                   	pop    %edi
 2f5:	5d                   	pop    %ebp
 2f6:	c3                   	ret    
 2f7:	89 f6                	mov    %esi,%esi
 2f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000300 <stat>:

int
stat(const char *n, struct stat *st)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 306:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(const char *n, struct stat *st)
{
 309:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 30c:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 30f:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 314:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 31b:	00 
 31c:	89 04 24             	mov    %eax,(%esp)
 31f:	e8 e0 00 00 00       	call   404 <open>
  if(fd < 0)
 324:	85 c0                	test   %eax,%eax
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 326:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 328:	78 19                	js     343 <stat+0x43>
    return -1;
  r = fstat(fd, st);
 32a:	8b 45 0c             	mov    0xc(%ebp),%eax
 32d:	89 1c 24             	mov    %ebx,(%esp)
 330:	89 44 24 04          	mov    %eax,0x4(%esp)
 334:	e8 e3 00 00 00       	call   41c <fstat>
  close(fd);
 339:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 33c:	89 c6                	mov    %eax,%esi
  close(fd);
 33e:	e8 a9 00 00 00       	call   3ec <close>
  return r;
}
 343:	89 f0                	mov    %esi,%eax
 345:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 348:	8b 75 fc             	mov    -0x4(%ebp),%esi
 34b:	89 ec                	mov    %ebp,%esp
 34d:	5d                   	pop    %ebp
 34e:	c3                   	ret    
 34f:	90                   	nop

00000350 <atoi>:

int
atoi(const char *s)
{
 350:	55                   	push   %ebp
  int n;

  n = 0;
 351:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
 353:	89 e5                	mov    %esp,%ebp
 355:	8b 4d 08             	mov    0x8(%ebp),%ecx
 358:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 359:	0f b6 11             	movzbl (%ecx),%edx
 35c:	8d 5a d0             	lea    -0x30(%edx),%ebx
 35f:	80 fb 09             	cmp    $0x9,%bl
 362:	77 1c                	ja     380 <atoi+0x30>
 364:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 368:	0f be d2             	movsbl %dl,%edx
 36b:	83 c1 01             	add    $0x1,%ecx
 36e:	8d 04 80             	lea    (%eax,%eax,4),%eax
 371:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 375:	0f b6 11             	movzbl (%ecx),%edx
 378:	8d 5a d0             	lea    -0x30(%edx),%ebx
 37b:	80 fb 09             	cmp    $0x9,%bl
 37e:	76 e8                	jbe    368 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 380:	5b                   	pop    %ebx
 381:	5d                   	pop    %ebp
 382:	c3                   	ret    
 383:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000390 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	56                   	push   %esi
 394:	8b 45 08             	mov    0x8(%ebp),%eax
 397:	53                   	push   %ebx
 398:	8b 5d 10             	mov    0x10(%ebp),%ebx
 39b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 39e:	85 db                	test   %ebx,%ebx
 3a0:	7e 14                	jle    3b6 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, const void *vsrc, int n)
 3a2:	31 d2                	xor    %edx,%edx
 3a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 3a8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 3ac:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 3af:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3b2:	39 da                	cmp    %ebx,%edx
 3b4:	75 f2                	jne    3a8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 3b6:	5b                   	pop    %ebx
 3b7:	5e                   	pop    %esi
 3b8:	5d                   	pop    %ebp
 3b9:	c3                   	ret    
 3ba:	90                   	nop
 3bb:	90                   	nop

000003bc <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3bc:	b8 01 00 00 00       	mov    $0x1,%eax
 3c1:	cd 40                	int    $0x40
 3c3:	c3                   	ret    

000003c4 <exit>:
SYSCALL(exit)
 3c4:	b8 02 00 00 00       	mov    $0x2,%eax
 3c9:	cd 40                	int    $0x40
 3cb:	c3                   	ret    

000003cc <wait>:
SYSCALL(wait)
 3cc:	b8 03 00 00 00       	mov    $0x3,%eax
 3d1:	cd 40                	int    $0x40
 3d3:	c3                   	ret    

000003d4 <pipe>:
SYSCALL(pipe)
 3d4:	b8 04 00 00 00       	mov    $0x4,%eax
 3d9:	cd 40                	int    $0x40
 3db:	c3                   	ret    

000003dc <read>:
SYSCALL(read)
 3dc:	b8 05 00 00 00       	mov    $0x5,%eax
 3e1:	cd 40                	int    $0x40
 3e3:	c3                   	ret    

000003e4 <write>:
SYSCALL(write)
 3e4:	b8 10 00 00 00       	mov    $0x10,%eax
 3e9:	cd 40                	int    $0x40
 3eb:	c3                   	ret    

000003ec <close>:
SYSCALL(close)
 3ec:	b8 15 00 00 00       	mov    $0x15,%eax
 3f1:	cd 40                	int    $0x40
 3f3:	c3                   	ret    

000003f4 <kill>:
SYSCALL(kill)
 3f4:	b8 06 00 00 00       	mov    $0x6,%eax
 3f9:	cd 40                	int    $0x40
 3fb:	c3                   	ret    

000003fc <exec>:
SYSCALL(exec)
 3fc:	b8 07 00 00 00       	mov    $0x7,%eax
 401:	cd 40                	int    $0x40
 403:	c3                   	ret    

00000404 <open>:
SYSCALL(open)
 404:	b8 0f 00 00 00       	mov    $0xf,%eax
 409:	cd 40                	int    $0x40
 40b:	c3                   	ret    

0000040c <mknod>:
SYSCALL(mknod)
 40c:	b8 11 00 00 00       	mov    $0x11,%eax
 411:	cd 40                	int    $0x40
 413:	c3                   	ret    

00000414 <unlink>:
SYSCALL(unlink)
 414:	b8 12 00 00 00       	mov    $0x12,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <fstat>:
SYSCALL(fstat)
 41c:	b8 08 00 00 00       	mov    $0x8,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    

00000424 <link>:
SYSCALL(link)
 424:	b8 13 00 00 00       	mov    $0x13,%eax
 429:	cd 40                	int    $0x40
 42b:	c3                   	ret    

0000042c <mkdir>:
SYSCALL(mkdir)
 42c:	b8 14 00 00 00       	mov    $0x14,%eax
 431:	cd 40                	int    $0x40
 433:	c3                   	ret    

00000434 <chdir>:
SYSCALL(chdir)
 434:	b8 09 00 00 00       	mov    $0x9,%eax
 439:	cd 40                	int    $0x40
 43b:	c3                   	ret    

0000043c <dup>:
SYSCALL(dup)
 43c:	b8 0a 00 00 00       	mov    $0xa,%eax
 441:	cd 40                	int    $0x40
 443:	c3                   	ret    

00000444 <getpid>:
SYSCALL(getpid)
 444:	b8 0b 00 00 00       	mov    $0xb,%eax
 449:	cd 40                	int    $0x40
 44b:	c3                   	ret    

0000044c <sbrk>:
SYSCALL(sbrk)
 44c:	b8 0c 00 00 00       	mov    $0xc,%eax
 451:	cd 40                	int    $0x40
 453:	c3                   	ret    

00000454 <sleep>:
SYSCALL(sleep)
 454:	b8 0d 00 00 00       	mov    $0xd,%eax
 459:	cd 40                	int    $0x40
 45b:	c3                   	ret    

0000045c <uptime>:
SYSCALL(uptime)
 45c:	b8 0e 00 00 00       	mov    $0xe,%eax
 461:	cd 40                	int    $0x40
 463:	c3                   	ret    
 464:	90                   	nop
 465:	90                   	nop
 466:	90                   	nop
 467:	90                   	nop
 468:	90                   	nop
 469:	90                   	nop
 46a:	90                   	nop
 46b:	90                   	nop
 46c:	90                   	nop
 46d:	90                   	nop
 46e:	90                   	nop
 46f:	90                   	nop

00000470 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	83 ec 28             	sub    $0x28,%esp
 476:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 479:	8d 55 f4             	lea    -0xc(%ebp),%edx
 47c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 483:	00 
 484:	89 54 24 04          	mov    %edx,0x4(%esp)
 488:	89 04 24             	mov    %eax,(%esp)
 48b:	e8 54 ff ff ff       	call   3e4 <write>
}
 490:	c9                   	leave  
 491:	c3                   	ret    
 492:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004a0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	57                   	push   %edi
 4a4:	56                   	push   %esi
 4a5:	89 c6                	mov    %eax,%esi
 4a7:	53                   	push   %ebx
 4a8:	83 ec 1c             	sub    $0x1c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4ab:	8b 45 08             	mov    0x8(%ebp),%eax
 4ae:	85 c0                	test   %eax,%eax
 4b0:	74 5e                	je     510 <printint+0x70>
 4b2:	89 d0                	mov    %edx,%eax
 4b4:	c1 e8 1f             	shr    $0x1f,%eax
 4b7:	84 c0                	test   %al,%al
 4b9:	74 55                	je     510 <printint+0x70>
    neg = 1;
    x = -xx;
 4bb:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 4bd:	bf 01 00 00 00       	mov    $0x1,%edi
    x = -xx;
 4c2:	f7 d8                	neg    %eax
  } else {
    x = xx;
  }

  i = 0;
 4c4:	31 db                	xor    %ebx,%ebx
 4c6:	eb 02                	jmp    4ca <printint+0x2a>
  do{
    buf[i++] = digits[x % base];
 4c8:	89 d3                	mov    %edx,%ebx
 4ca:	31 d2                	xor    %edx,%edx
 4cc:	f7 f1                	div    %ecx
 4ce:	0f b6 92 3c 08 00 00 	movzbl 0x83c(%edx),%edx
  }while((x /= base) != 0);
 4d5:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 4d7:	88 54 1d d8          	mov    %dl,-0x28(%ebp,%ebx,1)
 4db:	8d 53 01             	lea    0x1(%ebx),%edx
  }while((x /= base) != 0);
 4de:	75 e8                	jne    4c8 <printint+0x28>
  if(neg)
 4e0:	85 ff                	test   %edi,%edi
 4e2:	74 08                	je     4ec <printint+0x4c>
    buf[i++] = '-';
 4e4:	c6 44 15 d8 2d       	movb   $0x2d,-0x28(%ebp,%edx,1)
 4e9:	8d 53 02             	lea    0x2(%ebx),%edx

  while(--i >= 0)
 4ec:	8d 5a ff             	lea    -0x1(%edx),%ebx
 4ef:	90                   	nop
    putc(fd, buf[i]);
 4f0:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4f5:	89 f0                	mov    %esi,%eax
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 4f7:	83 eb 01             	sub    $0x1,%ebx
    putc(fd, buf[i]);
 4fa:	e8 71 ff ff ff       	call   470 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 4ff:	83 fb ff             	cmp    $0xffffffff,%ebx
 502:	75 ec                	jne    4f0 <printint+0x50>
    putc(fd, buf[i]);
}
 504:	83 c4 1c             	add    $0x1c,%esp
 507:	5b                   	pop    %ebx
 508:	5e                   	pop    %esi
 509:	5f                   	pop    %edi
 50a:	5d                   	pop    %ebp
 50b:	c3                   	ret    
 50c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 510:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 512:	31 ff                	xor    %edi,%edi
 514:	eb ae                	jmp    4c4 <printint+0x24>
 516:	8d 76 00             	lea    0x0(%esi),%esi
 519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000520 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	57                   	push   %edi
 524:	56                   	push   %esi
 525:	53                   	push   %ebx
 526:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 529:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 52c:	0f b6 0b             	movzbl (%ebx),%ecx
 52f:	84 c9                	test   %cl,%cl
 531:	0f 84 89 00 00 00    	je     5c0 <printf+0xa0>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 537:	8d 45 10             	lea    0x10(%ebp),%eax
{
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 53a:	31 f6                	xor    %esi,%esi
  ap = (uint*)(void*)&fmt + 1;
 53c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 53f:	eb 21                	jmp    562 <printf+0x42>
 541:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 548:	83 f9 25             	cmp    $0x25,%ecx
 54b:	74 7b                	je     5c8 <printf+0xa8>
        state = '%';
      } else {
        putc(fd, c);
 54d:	8b 45 08             	mov    0x8(%ebp),%eax
 550:	0f be d1             	movsbl %cl,%edx
 553:	e8 18 ff ff ff       	call   470 <putc>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 558:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 55b:	0f b6 0b             	movzbl (%ebx),%ecx
 55e:	84 c9                	test   %cl,%cl
 560:	74 5e                	je     5c0 <printf+0xa0>
    c = fmt[i] & 0xff;
    if(state == 0){
 562:	85 f6                	test   %esi,%esi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 564:	0f b6 c9             	movzbl %cl,%ecx
    if(state == 0){
 567:	74 df                	je     548 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 569:	83 fe 25             	cmp    $0x25,%esi
 56c:	75 ea                	jne    558 <printf+0x38>
      if(c == 'd'){
 56e:	83 f9 64             	cmp    $0x64,%ecx
 571:	0f 84 c9 00 00 00    	je     640 <printf+0x120>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 577:	83 f9 70             	cmp    $0x70,%ecx
 57a:	74 54                	je     5d0 <printf+0xb0>
 57c:	83 f9 78             	cmp    $0x78,%ecx
 57f:	90                   	nop
 580:	74 4e                	je     5d0 <printf+0xb0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 582:	83 f9 73             	cmp    $0x73,%ecx
 585:	74 71                	je     5f8 <printf+0xd8>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 587:	83 f9 63             	cmp    $0x63,%ecx
 58a:	0f 84 d2 00 00 00    	je     662 <printf+0x142>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 590:	83 f9 25             	cmp    $0x25,%ecx
        putc(fd, c);
 593:	ba 25 00 00 00       	mov    $0x25,%edx
 598:	8b 45 08             	mov    0x8(%ebp),%eax
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 59b:	74 11                	je     5ae <printf+0x8e>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 59d:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 5a0:	e8 cb fe ff ff       	call   470 <putc>
        putc(fd, c);
 5a5:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 5a8:	8b 45 08             	mov    0x8(%ebp),%eax
 5ab:	0f be d1             	movsbl %cl,%edx
 5ae:	83 c3 01             	add    $0x1,%ebx
      }
      state = 0;
 5b1:	31 f6                	xor    %esi,%esi
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 5b3:	e8 b8 fe ff ff       	call   470 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5b8:	0f b6 0b             	movzbl (%ebx),%ecx
 5bb:	84 c9                	test   %cl,%cl
 5bd:	75 a3                	jne    562 <printf+0x42>
 5bf:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5c0:	83 c4 2c             	add    $0x2c,%esp
 5c3:	5b                   	pop    %ebx
 5c4:	5e                   	pop    %esi
 5c5:	5f                   	pop    %edi
 5c6:	5d                   	pop    %ebp
 5c7:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5c8:	be 25 00 00 00       	mov    $0x25,%esi
 5cd:	eb 89                	jmp    558 <printf+0x38>
 5cf:	90                   	nop
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 5d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5d3:	b9 10 00 00 00       	mov    $0x10,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5d8:	31 f6                	xor    %esi,%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 5da:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 5e1:	8b 10                	mov    (%eax),%edx
 5e3:	8b 45 08             	mov    0x8(%ebp),%eax
 5e6:	e8 b5 fe ff ff       	call   4a0 <printint>
        ap++;
 5eb:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 5ef:	e9 64 ff ff ff       	jmp    558 <printf+0x38>
 5f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 5f8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5fb:	8b 38                	mov    (%eax),%edi
        ap++;
 5fd:	83 c0 04             	add    $0x4,%eax
 600:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
          s = "(null)";
 603:	b8 35 08 00 00       	mov    $0x835,%eax
 608:	85 ff                	test   %edi,%edi
 60a:	0f 44 f8             	cmove  %eax,%edi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 60d:	31 f6                	xor    %esi,%esi
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 60f:	0f b6 17             	movzbl (%edi),%edx
 612:	84 d2                	test   %dl,%dl
 614:	0f 84 3e ff ff ff    	je     558 <printf+0x38>
 61a:	89 de                	mov    %ebx,%esi
 61c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 61f:	90                   	nop
          putc(fd, *s);
 620:	0f be d2             	movsbl %dl,%edx
          s++;
 623:	83 c7 01             	add    $0x1,%edi
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
 626:	89 d8                	mov    %ebx,%eax
 628:	e8 43 fe ff ff       	call   470 <putc>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 62d:	0f b6 17             	movzbl (%edi),%edx
 630:	84 d2                	test   %dl,%dl
 632:	75 ec                	jne    620 <printf+0x100>
 634:	89 f3                	mov    %esi,%ebx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 636:	31 f6                	xor    %esi,%esi
 638:	e9 1b ff ff ff       	jmp    558 <printf+0x38>
 63d:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 640:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 643:	b1 0a                	mov    $0xa,%cl
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 645:	66 31 f6             	xor    %si,%si
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 648:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 64f:	8b 10                	mov    (%eax),%edx
 651:	8b 45 08             	mov    0x8(%ebp),%eax
 654:	e8 47 fe ff ff       	call   4a0 <printint>
        ap++;
 659:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 65d:	e9 f6 fe ff ff       	jmp    558 <printf+0x38>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 662:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 665:	31 f6                	xor    %esi,%esi
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 667:	0f be 10             	movsbl (%eax),%edx
 66a:	8b 45 08             	mov    0x8(%ebp),%eax
 66d:	e8 fe fd ff ff       	call   470 <putc>
        ap++;
 672:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 676:	e9 dd fe ff ff       	jmp    558 <printf+0x38>
 67b:	90                   	nop
 67c:	90                   	nop
 67d:	90                   	nop
 67e:	90                   	nop
 67f:	90                   	nop

00000680 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 680:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 681:	a1 40 0b 00 00       	mov    0xb40,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 686:	89 e5                	mov    %esp,%ebp
 688:	57                   	push   %edi
 689:	56                   	push   %esi
 68a:	53                   	push   %ebx
 68b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 68e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 691:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 698:	39 c8                	cmp    %ecx,%eax
 69a:	8b 10                	mov    (%eax),%edx
 69c:	73 04                	jae    6a2 <free+0x22>
 69e:	39 d1                	cmp    %edx,%ecx
 6a0:	72 16                	jb     6b8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6a2:	39 d0                	cmp    %edx,%eax
 6a4:	72 0c                	jb     6b2 <free+0x32>
 6a6:	39 c8                	cmp    %ecx,%eax
 6a8:	72 0e                	jb     6b8 <free+0x38>
 6aa:	39 d1                	cmp    %edx,%ecx
 6ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6b0:	72 06                	jb     6b8 <free+0x38>
static Header base;
static Header *freep;

void
free(void *ap)
{
 6b2:	89 d0                	mov    %edx,%eax
 6b4:	eb e2                	jmp    698 <free+0x18>
 6b6:	66 90                	xchg   %ax,%ax

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 6b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6be:	39 d7                	cmp    %edx,%edi
 6c0:	74 19                	je     6db <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6c2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6c5:	8b 50 04             	mov    0x4(%eax),%edx
 6c8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6cb:	39 f1                	cmp    %esi,%ecx
 6cd:	74 23                	je     6f2 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6cf:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6d1:	a3 40 0b 00 00       	mov    %eax,0xb40
}
 6d6:	5b                   	pop    %ebx
 6d7:	5e                   	pop    %esi
 6d8:	5f                   	pop    %edi
 6d9:	5d                   	pop    %ebp
 6da:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 6db:	03 72 04             	add    0x4(%edx),%esi
 6de:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6e1:	8b 10                	mov    (%eax),%edx
 6e3:	8b 12                	mov    (%edx),%edx
 6e5:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 6e8:	8b 50 04             	mov    0x4(%eax),%edx
 6eb:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6ee:	39 f1                	cmp    %esi,%ecx
 6f0:	75 dd                	jne    6cf <free+0x4f>
    p->s.size += bp->s.size;
 6f2:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 6f5:	a3 40 0b 00 00       	mov    %eax,0xb40
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 6fa:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6fd:	8b 53 f8             	mov    -0x8(%ebx),%edx
 700:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 702:	5b                   	pop    %ebx
 703:	5e                   	pop    %esi
 704:	5f                   	pop    %edi
 705:	5d                   	pop    %ebp
 706:	c3                   	ret    
 707:	89 f6                	mov    %esi,%esi
 709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000710 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 710:	55                   	push   %ebp
 711:	89 e5                	mov    %esp,%ebp
 713:	57                   	push   %edi
 714:	56                   	push   %esi
 715:	53                   	push   %ebx
 716:	83 ec 2c             	sub    $0x2c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 719:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 71c:	8b 15 40 0b 00 00    	mov    0xb40,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 722:	83 c3 07             	add    $0x7,%ebx
 725:	c1 eb 03             	shr    $0x3,%ebx
 728:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 72b:	85 d2                	test   %edx,%edx
 72d:	0f 84 a3 00 00 00    	je     7d6 <malloc+0xc6>
 733:	8b 02                	mov    (%edx),%eax
 735:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 738:	39 d9                	cmp    %ebx,%ecx
 73a:	73 74                	jae    7b0 <malloc+0xa0>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 73c:	8d 14 dd 00 00 00 00 	lea    0x0(,%ebx,8),%edx
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 743:	bf 00 80 00 00       	mov    $0x8000,%edi
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 748:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 74b:	eb 0c                	jmp    759 <malloc+0x49>
 74d:	8d 76 00             	lea    0x0(%esi),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 750:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 752:	8b 48 04             	mov    0x4(%eax),%ecx
 755:	39 cb                	cmp    %ecx,%ebx
 757:	76 57                	jbe    7b0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 759:	3b 05 40 0b 00 00    	cmp    0xb40,%eax
 75f:	89 c2                	mov    %eax,%edx
 761:	75 ed                	jne    750 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 763:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 766:	81 fb 00 10 00 00    	cmp    $0x1000,%ebx
 76c:	be 00 10 00 00       	mov    $0x1000,%esi
 771:	0f 43 f3             	cmovae %ebx,%esi
 774:	0f 42 c7             	cmovb  %edi,%eax
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 777:	89 04 24             	mov    %eax,(%esp)
 77a:	e8 cd fc ff ff       	call   44c <sbrk>
  if(p == (char*)-1)
 77f:	83 f8 ff             	cmp    $0xffffffff,%eax
 782:	74 1c                	je     7a0 <malloc+0x90>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 784:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 787:	83 c0 08             	add    $0x8,%eax
 78a:	89 04 24             	mov    %eax,(%esp)
 78d:	e8 ee fe ff ff       	call   680 <free>
  return freep;
 792:	8b 15 40 0b 00 00    	mov    0xb40,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 798:	85 d2                	test   %edx,%edx
 79a:	75 b4                	jne    750 <malloc+0x40>
 79c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return 0;
  }
}
 7a0:	83 c4 2c             	add    $0x2c,%esp
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
 7a3:	31 c0                	xor    %eax,%eax
  }
}
 7a5:	5b                   	pop    %ebx
 7a6:	5e                   	pop    %esi
 7a7:	5f                   	pop    %edi
 7a8:	5d                   	pop    %ebp
 7a9:	c3                   	ret    
 7aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 7b0:	39 cb                	cmp    %ecx,%ebx
 7b2:	74 1c                	je     7d0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7b4:	29 d9                	sub    %ebx,%ecx
 7b6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 7b9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 7bc:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 7bf:	89 15 40 0b 00 00    	mov    %edx,0xb40
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7c5:	83 c4 2c             	add    $0x2c,%esp
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 7c8:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7cb:	5b                   	pop    %ebx
 7cc:	5e                   	pop    %esi
 7cd:	5f                   	pop    %edi
 7ce:	5d                   	pop    %ebp
 7cf:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 7d0:	8b 08                	mov    (%eax),%ecx
 7d2:	89 0a                	mov    %ecx,(%edx)
 7d4:	eb e9                	jmp    7bf <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 7d6:	c7 05 40 0b 00 00 44 	movl   $0xb44,0xb40
 7dd:	0b 00 00 
    base.s.size = 0;
 7e0:	b8 44 0b 00 00       	mov    $0xb44,%eax
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 7e5:	c7 05 44 0b 00 00 44 	movl   $0xb44,0xb44
 7ec:	0b 00 00 
    base.s.size = 0;
 7ef:	c7 05 48 0b 00 00 00 	movl   $0x0,0xb48
 7f6:	00 00 00 
 7f9:	e9 3e ff ff ff       	jmp    73c <malloc+0x2c>
