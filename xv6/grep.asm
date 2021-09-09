
_grep:     file format elf32-i386


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
   5:	53                   	push   %ebx
   6:	83 e4 f0             	and    $0xfffffff0,%esp
   9:	83 ec 20             	sub    $0x20,%esp
   c:	8b 7d 08             	mov    0x8(%ebp),%edi
   f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  int fd, i;
  char *pattern;

  if(argc <= 1){
  12:	83 ff 01             	cmp    $0x1,%edi
  15:	0f 8e 8e 00 00 00    	jle    a9 <main+0xa9>
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
  1b:	8b 53 04             	mov    0x4(%ebx),%edx
    }
  }
}

int
main(int argc, char *argv[])
  1e:	83 c3 08             	add    $0x8,%ebx
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];

  if(argc <= 2){
  21:	83 ff 02             	cmp    $0x2,%edi
    }
  }
}

int
main(int argc, char *argv[])
  24:	be 02 00 00 00       	mov    $0x2,%esi

  if(argc <= 1){
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
  29:	89 54 24 1c          	mov    %edx,0x1c(%esp)

  if(argc <= 2){
  2d:	74 65                	je     94 <main+0x94>
  2f:	90                   	nop
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  37:	00 
  38:	8b 03                	mov    (%ebx),%eax
  3a:	89 04 24             	mov    %eax,(%esp)
  3d:	e8 72 05 00 00       	call   5b4 <open>
  42:	85 c0                	test   %eax,%eax
  44:	78 2f                	js     75 <main+0x75>
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
  46:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  if(argc <= 2){
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
  4a:	83 c6 01             	add    $0x1,%esi
  4d:	83 c3 04             	add    $0x4,%ebx
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
  50:	89 44 24 04          	mov    %eax,0x4(%esp)
  54:	89 44 24 18          	mov    %eax,0x18(%esp)
  58:	89 14 24             	mov    %edx,(%esp)
  5b:	e8 d0 01 00 00       	call   230 <grep>
    close(fd);
  60:	8b 44 24 18          	mov    0x18(%esp),%eax
  64:	89 04 24             	mov    %eax,(%esp)
  67:	e8 30 05 00 00       	call   59c <close>
  if(argc <= 2){
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
  6c:	39 f7                	cmp    %esi,%edi
  6e:	7f c0                	jg     30 <main+0x30>
      exit();
    }
    grep(pattern, fd);
    close(fd);
  }
  exit();
  70:	e8 ff 04 00 00       	call   574 <exit>
    exit();
  }

  for(i = 2; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "grep: cannot open %s\n", argv[i]);
  75:	8b 03                	mov    (%ebx),%eax
  77:	c7 44 24 04 d0 09 00 	movl   $0x9d0,0x4(%esp)
  7e:	00 
  7f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  86:	89 44 24 08          	mov    %eax,0x8(%esp)
  8a:	e8 41 06 00 00       	call   6d0 <printf>
      exit();
  8f:	e8 e0 04 00 00       	call   574 <exit>
    exit();
  }
  pattern = argv[1];

  if(argc <= 2){
    grep(pattern, 0);
  94:	89 14 24             	mov    %edx,(%esp)
  97:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  9e:	00 
  9f:	e8 8c 01 00 00       	call   230 <grep>
    exit();
  a4:	e8 cb 04 00 00       	call   574 <exit>
{
  int fd, i;
  char *pattern;

  if(argc <= 1){
    printf(2, "usage: grep pattern [file ...]\n");
  a9:	c7 44 24 04 b0 09 00 	movl   $0x9b0,0x4(%esp)
  b0:	00 
  b1:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  b8:	e8 13 06 00 00       	call   6d0 <printf>
    exit();
  bd:	e8 b2 04 00 00       	call   574 <exit>
  c2:	90                   	nop
  c3:	90                   	nop
  c4:	90                   	nop
  c5:	90                   	nop
  c6:	90                   	nop
  c7:	90                   	nop
  c8:	90                   	nop
  c9:	90                   	nop
  ca:	90                   	nop
  cb:	90                   	nop
  cc:	90                   	nop
  cd:	90                   	nop
  ce:	90                   	nop
  cf:	90                   	nop

000000d0 <matchstar>:
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	57                   	push   %edi
  d4:	56                   	push   %esi
  d5:	53                   	push   %ebx
  d6:	83 ec 1c             	sub    $0x1c,%esp
  d9:	8b 75 08             	mov    0x8(%ebp),%esi
  dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  df:	8b 5d 10             	mov    0x10(%ebp),%ebx
  e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
  e8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  ec:	89 3c 24             	mov    %edi,(%esp)
  ef:	e8 3c 00 00 00       	call   130 <matchhere>
  f4:	85 c0                	test   %eax,%eax
  f6:	75 20                	jne    118 <matchstar+0x48>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  f8:	0f b6 03             	movzbl (%ebx),%eax
  fb:	84 c0                	test   %al,%al
  fd:	74 0f                	je     10e <matchstar+0x3e>
  ff:	0f be c0             	movsbl %al,%eax
 102:	83 c3 01             	add    $0x1,%ebx
 105:	39 f0                	cmp    %esi,%eax
 107:	74 df                	je     e8 <matchstar+0x18>
 109:	83 fe 2e             	cmp    $0x2e,%esi
 10c:	74 da                	je     e8 <matchstar+0x18>
  return 0;
}
 10e:	83 c4 1c             	add    $0x1c,%esp
{
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  return 0;
 111:	31 c0                	xor    %eax,%eax
}
 113:	5b                   	pop    %ebx
 114:	5e                   	pop    %esi
 115:	5f                   	pop    %edi
 116:	5d                   	pop    %ebp
 117:	c3                   	ret    
 118:	83 c4 1c             	add    $0x1c,%esp
// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
      return 1;
 11b:	b8 01 00 00 00       	mov    $0x1,%eax
  }while(*text!='\0' && (*text++==c || c=='.'));
  return 0;
}
 120:	5b                   	pop    %ebx
 121:	5e                   	pop    %esi
 122:	5f                   	pop    %edi
 123:	5d                   	pop    %ebp
 124:	c3                   	ret    
 125:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000130 <matchhere>:
  return 0;
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	53                   	push   %ebx
 134:	83 ec 14             	sub    $0x14,%esp
 137:	8b 55 08             	mov    0x8(%ebp),%edx
 13a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  if(re[0] == '\0')
 13d:	0f b6 02             	movzbl (%edx),%eax
 140:	84 c0                	test   %al,%al
 142:	75 21                	jne    165 <matchhere+0x35>
 144:	eb 42                	jmp    188 <matchhere+0x58>
 146:	66 90                	xchg   %ax,%ax
    return 1;
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 148:	0f b6 19             	movzbl (%ecx),%ebx
 14b:	84 db                	test   %bl,%bl
 14d:	74 31                	je     180 <matchhere+0x50>
 14f:	3c 2e                	cmp    $0x2e,%al
 151:	74 04                	je     157 <matchhere+0x27>
 153:	38 d8                	cmp    %bl,%al
 155:	75 29                	jne    180 <matchhere+0x50>
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
 157:	0f b6 42 01          	movzbl 0x1(%edx),%eax
 15b:	84 c0                	test   %al,%al
 15d:	74 29                	je     188 <matchhere+0x58>
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
 15f:	83 c1 01             	add    $0x1,%ecx
 162:	83 c2 01             	add    $0x1,%edx
// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
    return 1;
  if(re[1] == '*')
 165:	0f b6 5a 01          	movzbl 0x1(%edx),%ebx
 169:	80 fb 2a             	cmp    $0x2a,%bl
 16c:	74 2a                	je     198 <matchhere+0x68>
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
 16e:	3c 24                	cmp    $0x24,%al
 170:	75 d6                	jne    148 <matchhere+0x18>
 172:	84 db                	test   %bl,%bl
 174:	75 d2                	jne    148 <matchhere+0x18>
    return *text == '\0';
 176:	31 c0                	xor    %eax,%eax
 178:	80 39 00             	cmpb   $0x0,(%ecx)
 17b:	0f 94 c0             	sete   %al
 17e:	eb 02                	jmp    182 <matchhere+0x52>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
  return 0;
 180:	31 c0                	xor    %eax,%eax
}
 182:	83 c4 14             	add    $0x14,%esp
 185:	5b                   	pop    %ebx
 186:	5d                   	pop    %ebp
 187:	c3                   	ret    
 188:	83 c4 14             	add    $0x14,%esp

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
    return 1;
 18b:	b8 01 00 00 00       	mov    $0x1,%eax
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
  return 0;
}
 190:	5b                   	pop    %ebx
 191:	5d                   	pop    %ebp
 192:	c3                   	ret    
 193:	90                   	nop
 194:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
    return 1;
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
 198:	83 c2 02             	add    $0x2,%edx
 19b:	0f be c0             	movsbl %al,%eax
 19e:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 1a2:	89 54 24 04          	mov    %edx,0x4(%esp)
 1a6:	89 04 24             	mov    %eax,(%esp)
 1a9:	e8 22 ff ff ff       	call   d0 <matchstar>
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
  return 0;
}
 1ae:	83 c4 14             	add    $0x14,%esp
 1b1:	5b                   	pop    %ebx
 1b2:	5d                   	pop    %ebp
 1b3:	c3                   	ret    
 1b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001c0 <match>:
int matchhere(char*, char*);
int matchstar(int, char*, char*);

int
match(char *re, char *text)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	56                   	push   %esi
 1c4:	53                   	push   %ebx
 1c5:	83 ec 10             	sub    $0x10,%esp
 1c8:	8b 75 08             	mov    0x8(%ebp),%esi
 1cb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(re[0] == '^')
 1ce:	80 3e 5e             	cmpb   $0x5e,(%esi)
 1d1:	74 3d                	je     210 <match+0x50>
 1d3:	90                   	nop
 1d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return matchhere(re+1, text);
  do{  // must look at empty string
    if(matchhere(re, text))
 1d8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 1dc:	89 34 24             	mov    %esi,(%esp)
 1df:	e8 4c ff ff ff       	call   130 <matchhere>
 1e4:	85 c0                	test   %eax,%eax
 1e6:	75 18                	jne    200 <match+0x40>
      return 1;
  }while(*text++ != '\0');
 1e8:	0f b6 03             	movzbl (%ebx),%eax
 1eb:	83 c3 01             	add    $0x1,%ebx
 1ee:	84 c0                	test   %al,%al
 1f0:	75 e6                	jne    1d8 <match+0x18>
  return 0;
}
 1f2:	83 c4 10             	add    $0x10,%esp
    return matchhere(re+1, text);
  do{  // must look at empty string
    if(matchhere(re, text))
      return 1;
  }while(*text++ != '\0');
  return 0;
 1f5:	31 c0                	xor    %eax,%eax
}
 1f7:	5b                   	pop    %ebx
 1f8:	5e                   	pop    %esi
 1f9:	5d                   	pop    %ebp
 1fa:	c3                   	ret    
 1fb:	90                   	nop
 1fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 200:	83 c4 10             	add    $0x10,%esp
{
  if(re[0] == '^')
    return matchhere(re+1, text);
  do{  // must look at empty string
    if(matchhere(re, text))
      return 1;
 203:	b8 01 00 00 00       	mov    $0x1,%eax
  }while(*text++ != '\0');
  return 0;
}
 208:	5b                   	pop    %ebx
 209:	5e                   	pop    %esi
 20a:	5d                   	pop    %ebp
 20b:	c3                   	ret    
 20c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

int
match(char *re, char *text)
{
  if(re[0] == '^')
    return matchhere(re+1, text);
 210:	83 c6 01             	add    $0x1,%esi
 213:	89 75 08             	mov    %esi,0x8(%ebp)
  do{  // must look at empty string
    if(matchhere(re, text))
      return 1;
  }while(*text++ != '\0');
  return 0;
}
 216:	83 c4 10             	add    $0x10,%esp
 219:	5b                   	pop    %ebx
 21a:	5e                   	pop    %esi
 21b:	5d                   	pop    %ebp

int
match(char *re, char *text)
{
  if(re[0] == '^')
    return matchhere(re+1, text);
 21c:	e9 0f ff ff ff       	jmp    130 <matchhere>
 221:	eb 0d                	jmp    230 <grep>
 223:	90                   	nop
 224:	90                   	nop
 225:	90                   	nop
 226:	90                   	nop
 227:	90                   	nop
 228:	90                   	nop
 229:	90                   	nop
 22a:	90                   	nop
 22b:	90                   	nop
 22c:	90                   	nop
 22d:	90                   	nop
 22e:	90                   	nop
 22f:	90                   	nop

00000230 <grep>:
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	57                   	push   %edi
 234:	56                   	push   %esi
 235:	53                   	push   %ebx
 236:	83 ec 2c             	sub    $0x2c,%esp
 239:	8b 7d 08             	mov    0x8(%ebp),%edi
  int n, m;
  char *p, *q;

  m = 0;
 23c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 243:	90                   	nop
 244:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 248:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 24d:	2b 45 e4             	sub    -0x1c(%ebp),%eax
 250:	89 44 24 08          	mov    %eax,0x8(%esp)
 254:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 257:	05 a0 0d 00 00       	add    $0xda0,%eax
 25c:	89 44 24 04          	mov    %eax,0x4(%esp)
 260:	8b 45 0c             	mov    0xc(%ebp),%eax
 263:	89 04 24             	mov    %eax,(%esp)
 266:	e8 21 03 00 00       	call   58c <read>
 26b:	85 c0                	test   %eax,%eax
 26d:	0f 8e b9 00 00 00    	jle    32c <grep+0xfc>
    m += n;
 273:	01 45 e4             	add    %eax,-0x1c(%ebp)
    buf[m] = '\0';
    p = buf;
 276:	be a0 0d 00 00       	mov    $0xda0,%esi
  char *p, *q;

  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
    m += n;
    buf[m] = '\0';
 27b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 27e:	c6 80 a0 0d 00 00 00 	movb   $0x0,0xda0(%eax)
 285:	8d 76 00             	lea    0x0(%esi),%esi
    p = buf;
    while((q = strchr(p, '\n')) != 0){
 288:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
 28f:	00 
 290:	89 34 24             	mov    %esi,(%esp)
 293:	e8 78 01 00 00       	call   410 <strchr>
 298:	85 c0                	test   %eax,%eax
 29a:	89 c3                	mov    %eax,%ebx
 29c:	74 42                	je     2e0 <grep+0xb0>
      *q = 0;
 29e:	c6 03 00             	movb   $0x0,(%ebx)
      if(match(pattern, p)){
 2a1:	89 74 24 04          	mov    %esi,0x4(%esp)
 2a5:	89 3c 24             	mov    %edi,(%esp)
 2a8:	e8 13 ff ff ff       	call   1c0 <match>
 2ad:	85 c0                	test   %eax,%eax
 2af:	75 07                	jne    2b8 <grep+0x88>
 2b1:	8d 73 01             	lea    0x1(%ebx),%esi
 2b4:	eb d2                	jmp    288 <grep+0x58>
 2b6:	66 90                	xchg   %ax,%ax
        *q = '\n';
 2b8:	c6 03 0a             	movb   $0xa,(%ebx)
        write(1, p, q+1 - p);
 2bb:	83 c3 01             	add    $0x1,%ebx
 2be:	89 d8                	mov    %ebx,%eax
 2c0:	29 f0                	sub    %esi,%eax
 2c2:	89 74 24 04          	mov    %esi,0x4(%esp)
 2c6:	89 de                	mov    %ebx,%esi
 2c8:	89 44 24 08          	mov    %eax,0x8(%esp)
 2cc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2d3:	e8 bc 02 00 00       	call   594 <write>
 2d8:	eb ae                	jmp    288 <grep+0x58>
 2da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      }
      p = q+1;
    }
    if(p == buf)
 2e0:	81 fe a0 0d 00 00    	cmp    $0xda0,%esi
 2e6:	74 38                	je     320 <grep+0xf0>
      m = 0;
    if(m > 0){
 2e8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2eb:	85 c0                	test   %eax,%eax
 2ed:	0f 8e 55 ff ff ff    	jle    248 <grep+0x18>
      m -= p - buf;
 2f3:	b8 a0 0d 00 00       	mov    $0xda0,%eax
 2f8:	29 f0                	sub    %esi,%eax
 2fa:	01 45 e4             	add    %eax,-0x1c(%ebp)
      memmove(buf, p, m);
 2fd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 300:	89 74 24 04          	mov    %esi,0x4(%esp)
 304:	c7 04 24 a0 0d 00 00 	movl   $0xda0,(%esp)
 30b:	89 44 24 08          	mov    %eax,0x8(%esp)
 30f:	e8 2c 02 00 00       	call   540 <memmove>
 314:	e9 2f ff ff ff       	jmp    248 <grep+0x18>
 319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        write(1, p, q+1 - p);
      }
      p = q+1;
    }
    if(p == buf)
      m = 0;
 320:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 327:	e9 1c ff ff ff       	jmp    248 <grep+0x18>
    if(m > 0){
      m -= p - buf;
      memmove(buf, p, m);
    }
  }
}
 32c:	83 c4 2c             	add    $0x2c,%esp
 32f:	5b                   	pop    %ebx
 330:	5e                   	pop    %esi
 331:	5f                   	pop    %edi
 332:	5d                   	pop    %ebp
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

00000340 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 340:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 341:	31 d2                	xor    %edx,%edx
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 343:	89 e5                	mov    %esp,%ebp
 345:	8b 45 08             	mov    0x8(%ebp),%eax
 348:	53                   	push   %ebx
 349:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 34c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 350:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
 354:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 357:	83 c2 01             	add    $0x1,%edx
 35a:	84 c9                	test   %cl,%cl
 35c:	75 f2                	jne    350 <strcpy+0x10>
    ;
  return os;
}
 35e:	5b                   	pop    %ebx
 35f:	5d                   	pop    %ebp
 360:	c3                   	ret    
 361:	eb 0d                	jmp    370 <strcmp>
 363:	90                   	nop
 364:	90                   	nop
 365:	90                   	nop
 366:	90                   	nop
 367:	90                   	nop
 368:	90                   	nop
 369:	90                   	nop
 36a:	90                   	nop
 36b:	90                   	nop
 36c:	90                   	nop
 36d:	90                   	nop
 36e:	90                   	nop
 36f:	90                   	nop

00000370 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	8b 4d 08             	mov    0x8(%ebp),%ecx
 376:	56                   	push   %esi
 377:	8b 55 0c             	mov    0xc(%ebp),%edx
 37a:	53                   	push   %ebx
  while(*p && *p == *q)
 37b:	0f b6 01             	movzbl (%ecx),%eax
 37e:	0f b6 1a             	movzbl (%edx),%ebx
 381:	84 c0                	test   %al,%al
 383:	74 23                	je     3a8 <strcmp+0x38>
 385:	38 d8                	cmp    %bl,%al
 387:	74 10                	je     399 <strcmp+0x29>
 389:	eb 2d                	jmp    3b8 <strcmp+0x48>
 38b:	90                   	nop
 38c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 390:	83 c1 01             	add    $0x1,%ecx
 393:	38 d8                	cmp    %bl,%al
 395:	75 21                	jne    3b8 <strcmp+0x48>
    p++, q++;
 397:	89 f2                	mov    %esi,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 399:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 39d:	8d 72 01             	lea    0x1(%edx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3a0:	0f b6 5a 01          	movzbl 0x1(%edx),%ebx
 3a4:	84 c0                	test   %al,%al
 3a6:	75 e8                	jne    390 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 3a8:	0f b6 db             	movzbl %bl,%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3ab:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 3ad:	29 d8                	sub    %ebx,%eax
}
 3af:	5b                   	pop    %ebx
 3b0:	5e                   	pop    %esi
 3b1:	5d                   	pop    %ebp
 3b2:	c3                   	ret    
 3b3:	90                   	nop
 3b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    p++, q++;
  return (uchar)*p - (uchar)*q;
 3b8:	0f b6 db             	movzbl %bl,%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3bb:	0f b6 c0             	movzbl %al,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 3be:	29 d8                	sub    %ebx,%eax
}
 3c0:	5b                   	pop    %ebx
 3c1:	5e                   	pop    %esi
 3c2:	5d                   	pop    %ebp
 3c3:	c3                   	ret    
 3c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000003d0 <strlen>:

uint
strlen(const char *s)
{
 3d0:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
 3d1:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
 3d3:	89 e5                	mov    %esp,%ebp
 3d5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3d8:	80 39 00             	cmpb   $0x0,(%ecx)
 3db:	74 0e                	je     3eb <strlen+0x1b>
 3dd:	31 d2                	xor    %edx,%edx
 3df:	90                   	nop
 3e0:	83 c2 01             	add    $0x1,%edx
 3e3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 3e7:	89 d0                	mov    %edx,%eax
 3e9:	75 f5                	jne    3e0 <strlen+0x10>
    ;
  return n;
}
 3eb:	5d                   	pop    %ebp
 3ec:	c3                   	ret    
 3ed:	8d 76 00             	lea    0x0(%esi),%esi

000003f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	8b 55 08             	mov    0x8(%ebp),%edx
 3f6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 3fd:	89 d7                	mov    %edx,%edi
 3ff:	fc                   	cld    
 400:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 402:	89 d0                	mov    %edx,%eax
 404:	5f                   	pop    %edi
 405:	5d                   	pop    %ebp
 406:	c3                   	ret    
 407:	89 f6                	mov    %esi,%esi
 409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000410 <strchr>:

char*
strchr(const char *s, char c)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	8b 45 08             	mov    0x8(%ebp),%eax
 416:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 41a:	0f b6 10             	movzbl (%eax),%edx
 41d:	84 d2                	test   %dl,%dl
 41f:	75 12                	jne    433 <strchr+0x23>
 421:	eb 1d                	jmp    440 <strchr+0x30>
 423:	90                   	nop
 424:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 428:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 42c:	84 d2                	test   %dl,%dl
 42e:	74 10                	je     440 <strchr+0x30>
 430:	83 c0 01             	add    $0x1,%eax
    if(*s == c)
 433:	38 ca                	cmp    %cl,%dl
 435:	75 f1                	jne    428 <strchr+0x18>
      return (char*)s;
  return 0;
}
 437:	5d                   	pop    %ebp
 438:	c3                   	ret    
 439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
 440:	31 c0                	xor    %eax,%eax
}
 442:	5d                   	pop    %ebp
 443:	c3                   	ret    
 444:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 44a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000450 <gets>:

char*
gets(char *buf, int max)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 455:	31 f6                	xor    %esi,%esi
  return 0;
}

char*
gets(char *buf, int max)
{
 457:	53                   	push   %ebx
 458:	83 ec 2c             	sub    $0x2c,%esp
 45b:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 45e:	eb 31                	jmp    491 <gets+0x41>
    cc = read(0, &c, 1);
 460:	8d 45 e7             	lea    -0x19(%ebp),%eax
 463:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 46a:	00 
 46b:	89 44 24 04          	mov    %eax,0x4(%esp)
 46f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 476:	e8 11 01 00 00       	call   58c <read>
    if(cc < 1)
 47b:	85 c0                	test   %eax,%eax
 47d:	7e 1a                	jle    499 <gets+0x49>
      break;
    buf[i++] = c;
 47f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 483:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 485:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 487:	88 44 1f ff          	mov    %al,-0x1(%edi,%ebx,1)
    if(c == '\n' || c == '\r')
 48b:	74 0c                	je     499 <gets+0x49>
 48d:	3c 0a                	cmp    $0xa,%al
 48f:	74 08                	je     499 <gets+0x49>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 491:	8d 5e 01             	lea    0x1(%esi),%ebx
 494:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 497:	7c c7                	jl     460 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 499:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 49d:	83 c4 2c             	add    $0x2c,%esp
 4a0:	89 f8                	mov    %edi,%eax
 4a2:	5b                   	pop    %ebx
 4a3:	5e                   	pop    %esi
 4a4:	5f                   	pop    %edi
 4a5:	5d                   	pop    %ebp
 4a6:	c3                   	ret    
 4a7:	89 f6                	mov    %esi,%esi
 4a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004b0 <stat>:

int
stat(const char *n, struct stat *st)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4b6:	8b 45 08             	mov    0x8(%ebp),%eax
  return buf;
}

int
stat(const char *n, struct stat *st)
{
 4b9:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 4bc:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 4bf:	be ff ff ff ff       	mov    $0xffffffff,%esi
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4c4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 4cb:	00 
 4cc:	89 04 24             	mov    %eax,(%esp)
 4cf:	e8 e0 00 00 00       	call   5b4 <open>
  if(fd < 0)
 4d4:	85 c0                	test   %eax,%eax
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4d6:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 4d8:	78 19                	js     4f3 <stat+0x43>
    return -1;
  r = fstat(fd, st);
 4da:	8b 45 0c             	mov    0xc(%ebp),%eax
 4dd:	89 1c 24             	mov    %ebx,(%esp)
 4e0:	89 44 24 04          	mov    %eax,0x4(%esp)
 4e4:	e8 e3 00 00 00       	call   5cc <fstat>
  close(fd);
 4e9:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 4ec:	89 c6                	mov    %eax,%esi
  close(fd);
 4ee:	e8 a9 00 00 00       	call   59c <close>
  return r;
}
 4f3:	89 f0                	mov    %esi,%eax
 4f5:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 4f8:	8b 75 fc             	mov    -0x4(%ebp),%esi
 4fb:	89 ec                	mov    %ebp,%esp
 4fd:	5d                   	pop    %ebp
 4fe:	c3                   	ret    
 4ff:	90                   	nop

00000500 <atoi>:

int
atoi(const char *s)
{
 500:	55                   	push   %ebp
  int n;

  n = 0;
 501:	31 c0                	xor    %eax,%eax
  return r;
}

int
atoi(const char *s)
{
 503:	89 e5                	mov    %esp,%ebp
 505:	8b 4d 08             	mov    0x8(%ebp),%ecx
 508:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 509:	0f b6 11             	movzbl (%ecx),%edx
 50c:	8d 5a d0             	lea    -0x30(%edx),%ebx
 50f:	80 fb 09             	cmp    $0x9,%bl
 512:	77 1c                	ja     530 <atoi+0x30>
 514:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    n = n*10 + *s++ - '0';
 518:	0f be d2             	movsbl %dl,%edx
 51b:	83 c1 01             	add    $0x1,%ecx
 51e:	8d 04 80             	lea    (%eax,%eax,4),%eax
 521:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 525:	0f b6 11             	movzbl (%ecx),%edx
 528:	8d 5a d0             	lea    -0x30(%edx),%ebx
 52b:	80 fb 09             	cmp    $0x9,%bl
 52e:	76 e8                	jbe    518 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 530:	5b                   	pop    %ebx
 531:	5d                   	pop    %ebp
 532:	c3                   	ret    
 533:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 539:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000540 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	56                   	push   %esi
 544:	8b 45 08             	mov    0x8(%ebp),%eax
 547:	53                   	push   %ebx
 548:	8b 5d 10             	mov    0x10(%ebp),%ebx
 54b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 54e:	85 db                	test   %ebx,%ebx
 550:	7e 14                	jle    566 <memmove+0x26>
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, const void *vsrc, int n)
 552:	31 d2                	xor    %edx,%edx
 554:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
 558:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 55c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 55f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 562:	39 da                	cmp    %ebx,%edx
 564:	75 f2                	jne    558 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 566:	5b                   	pop    %ebx
 567:	5e                   	pop    %esi
 568:	5d                   	pop    %ebp
 569:	c3                   	ret    
 56a:	90                   	nop
 56b:	90                   	nop

0000056c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 56c:	b8 01 00 00 00       	mov    $0x1,%eax
 571:	cd 40                	int    $0x40
 573:	c3                   	ret    

00000574 <exit>:
SYSCALL(exit)
 574:	b8 02 00 00 00       	mov    $0x2,%eax
 579:	cd 40                	int    $0x40
 57b:	c3                   	ret    

0000057c <wait>:
SYSCALL(wait)
 57c:	b8 03 00 00 00       	mov    $0x3,%eax
 581:	cd 40                	int    $0x40
 583:	c3                   	ret    

00000584 <pipe>:
SYSCALL(pipe)
 584:	b8 04 00 00 00       	mov    $0x4,%eax
 589:	cd 40                	int    $0x40
 58b:	c3                   	ret    

0000058c <read>:
SYSCALL(read)
 58c:	b8 05 00 00 00       	mov    $0x5,%eax
 591:	cd 40                	int    $0x40
 593:	c3                   	ret    

00000594 <write>:
SYSCALL(write)
 594:	b8 10 00 00 00       	mov    $0x10,%eax
 599:	cd 40                	int    $0x40
 59b:	c3                   	ret    

0000059c <close>:
SYSCALL(close)
 59c:	b8 15 00 00 00       	mov    $0x15,%eax
 5a1:	cd 40                	int    $0x40
 5a3:	c3                   	ret    

000005a4 <kill>:
SYSCALL(kill)
 5a4:	b8 06 00 00 00       	mov    $0x6,%eax
 5a9:	cd 40                	int    $0x40
 5ab:	c3                   	ret    

000005ac <exec>:
SYSCALL(exec)
 5ac:	b8 07 00 00 00       	mov    $0x7,%eax
 5b1:	cd 40                	int    $0x40
 5b3:	c3                   	ret    

000005b4 <open>:
SYSCALL(open)
 5b4:	b8 0f 00 00 00       	mov    $0xf,%eax
 5b9:	cd 40                	int    $0x40
 5bb:	c3                   	ret    

000005bc <mknod>:
SYSCALL(mknod)
 5bc:	b8 11 00 00 00       	mov    $0x11,%eax
 5c1:	cd 40                	int    $0x40
 5c3:	c3                   	ret    

000005c4 <unlink>:
SYSCALL(unlink)
 5c4:	b8 12 00 00 00       	mov    $0x12,%eax
 5c9:	cd 40                	int    $0x40
 5cb:	c3                   	ret    

000005cc <fstat>:
SYSCALL(fstat)
 5cc:	b8 08 00 00 00       	mov    $0x8,%eax
 5d1:	cd 40                	int    $0x40
 5d3:	c3                   	ret    

000005d4 <link>:
SYSCALL(link)
 5d4:	b8 13 00 00 00       	mov    $0x13,%eax
 5d9:	cd 40                	int    $0x40
 5db:	c3                   	ret    

000005dc <mkdir>:
SYSCALL(mkdir)
 5dc:	b8 14 00 00 00       	mov    $0x14,%eax
 5e1:	cd 40                	int    $0x40
 5e3:	c3                   	ret    

000005e4 <chdir>:
SYSCALL(chdir)
 5e4:	b8 09 00 00 00       	mov    $0x9,%eax
 5e9:	cd 40                	int    $0x40
 5eb:	c3                   	ret    

000005ec <dup>:
SYSCALL(dup)
 5ec:	b8 0a 00 00 00       	mov    $0xa,%eax
 5f1:	cd 40                	int    $0x40
 5f3:	c3                   	ret    

000005f4 <getpid>:
SYSCALL(getpid)
 5f4:	b8 0b 00 00 00       	mov    $0xb,%eax
 5f9:	cd 40                	int    $0x40
 5fb:	c3                   	ret    

000005fc <sbrk>:
SYSCALL(sbrk)
 5fc:	b8 0c 00 00 00       	mov    $0xc,%eax
 601:	cd 40                	int    $0x40
 603:	c3                   	ret    

00000604 <sleep>:
SYSCALL(sleep)
 604:	b8 0d 00 00 00       	mov    $0xd,%eax
 609:	cd 40                	int    $0x40
 60b:	c3                   	ret    

0000060c <uptime>:
SYSCALL(uptime)
 60c:	b8 0e 00 00 00       	mov    $0xe,%eax
 611:	cd 40                	int    $0x40
 613:	c3                   	ret    
 614:	90                   	nop
 615:	90                   	nop
 616:	90                   	nop
 617:	90                   	nop
 618:	90                   	nop
 619:	90                   	nop
 61a:	90                   	nop
 61b:	90                   	nop
 61c:	90                   	nop
 61d:	90                   	nop
 61e:	90                   	nop
 61f:	90                   	nop

00000620 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	83 ec 28             	sub    $0x28,%esp
 626:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 629:	8d 55 f4             	lea    -0xc(%ebp),%edx
 62c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 633:	00 
 634:	89 54 24 04          	mov    %edx,0x4(%esp)
 638:	89 04 24             	mov    %eax,(%esp)
 63b:	e8 54 ff ff ff       	call   594 <write>
}
 640:	c9                   	leave  
 641:	c3                   	ret    
 642:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000650 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	57                   	push   %edi
 654:	56                   	push   %esi
 655:	89 c6                	mov    %eax,%esi
 657:	53                   	push   %ebx
 658:	83 ec 1c             	sub    $0x1c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 65b:	8b 45 08             	mov    0x8(%ebp),%eax
 65e:	85 c0                	test   %eax,%eax
 660:	74 5e                	je     6c0 <printint+0x70>
 662:	89 d0                	mov    %edx,%eax
 664:	c1 e8 1f             	shr    $0x1f,%eax
 667:	84 c0                	test   %al,%al
 669:	74 55                	je     6c0 <printint+0x70>
    neg = 1;
    x = -xx;
 66b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 66d:	bf 01 00 00 00       	mov    $0x1,%edi
    x = -xx;
 672:	f7 d8                	neg    %eax
  } else {
    x = xx;
  }

  i = 0;
 674:	31 db                	xor    %ebx,%ebx
 676:	eb 02                	jmp    67a <printint+0x2a>
  do{
    buf[i++] = digits[x % base];
 678:	89 d3                	mov    %edx,%ebx
 67a:	31 d2                	xor    %edx,%edx
 67c:	f7 f1                	div    %ecx
 67e:	0f b6 92 ed 09 00 00 	movzbl 0x9ed(%edx),%edx
  }while((x /= base) != 0);
 685:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 687:	88 54 1d d8          	mov    %dl,-0x28(%ebp,%ebx,1)
 68b:	8d 53 01             	lea    0x1(%ebx),%edx
  }while((x /= base) != 0);
 68e:	75 e8                	jne    678 <printint+0x28>
  if(neg)
 690:	85 ff                	test   %edi,%edi
 692:	74 08                	je     69c <printint+0x4c>
    buf[i++] = '-';
 694:	c6 44 15 d8 2d       	movb   $0x2d,-0x28(%ebp,%edx,1)
 699:	8d 53 02             	lea    0x2(%ebx),%edx

  while(--i >= 0)
 69c:	8d 5a ff             	lea    -0x1(%edx),%ebx
 69f:	90                   	nop
    putc(fd, buf[i]);
 6a0:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 6a5:	89 f0                	mov    %esi,%eax
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 6a7:	83 eb 01             	sub    $0x1,%ebx
    putc(fd, buf[i]);
 6aa:	e8 71 ff ff ff       	call   620 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 6af:	83 fb ff             	cmp    $0xffffffff,%ebx
 6b2:	75 ec                	jne    6a0 <printint+0x50>
    putc(fd, buf[i]);
}
 6b4:	83 c4 1c             	add    $0x1c,%esp
 6b7:	5b                   	pop    %ebx
 6b8:	5e                   	pop    %esi
 6b9:	5f                   	pop    %edi
 6ba:	5d                   	pop    %ebp
 6bb:	c3                   	ret    
 6bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 6c0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 6c2:	31 ff                	xor    %edi,%edi
 6c4:	eb ae                	jmp    674 <printint+0x24>
 6c6:	8d 76 00             	lea    0x0(%esi),%esi
 6c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006d0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6d0:	55                   	push   %ebp
 6d1:	89 e5                	mov    %esp,%ebp
 6d3:	57                   	push   %edi
 6d4:	56                   	push   %esi
 6d5:	53                   	push   %ebx
 6d6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6d9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 6dc:	0f b6 0b             	movzbl (%ebx),%ecx
 6df:	84 c9                	test   %cl,%cl
 6e1:	0f 84 89 00 00 00    	je     770 <printf+0xa0>
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 6e7:	8d 45 10             	lea    0x10(%ebp),%eax
{
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 6ea:	31 f6                	xor    %esi,%esi
  ap = (uint*)(void*)&fmt + 1;
 6ec:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 6ef:	eb 21                	jmp    712 <printf+0x42>
 6f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 6f8:	83 f9 25             	cmp    $0x25,%ecx
 6fb:	74 7b                	je     778 <printf+0xa8>
        state = '%';
      } else {
        putc(fd, c);
 6fd:	8b 45 08             	mov    0x8(%ebp),%eax
 700:	0f be d1             	movsbl %cl,%edx
 703:	e8 18 ff ff ff       	call   620 <putc>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 708:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 70b:	0f b6 0b             	movzbl (%ebx),%ecx
 70e:	84 c9                	test   %cl,%cl
 710:	74 5e                	je     770 <printf+0xa0>
    c = fmt[i] & 0xff;
    if(state == 0){
 712:	85 f6                	test   %esi,%esi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 714:	0f b6 c9             	movzbl %cl,%ecx
    if(state == 0){
 717:	74 df                	je     6f8 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 719:	83 fe 25             	cmp    $0x25,%esi
 71c:	75 ea                	jne    708 <printf+0x38>
      if(c == 'd'){
 71e:	83 f9 64             	cmp    $0x64,%ecx
 721:	0f 84 c9 00 00 00    	je     7f0 <printf+0x120>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 727:	83 f9 70             	cmp    $0x70,%ecx
 72a:	74 54                	je     780 <printf+0xb0>
 72c:	83 f9 78             	cmp    $0x78,%ecx
 72f:	90                   	nop
 730:	74 4e                	je     780 <printf+0xb0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 732:	83 f9 73             	cmp    $0x73,%ecx
 735:	74 71                	je     7a8 <printf+0xd8>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 737:	83 f9 63             	cmp    $0x63,%ecx
 73a:	0f 84 d2 00 00 00    	je     812 <printf+0x142>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 740:	83 f9 25             	cmp    $0x25,%ecx
        putc(fd, c);
 743:	ba 25 00 00 00       	mov    $0x25,%edx
 748:	8b 45 08             	mov    0x8(%ebp),%eax
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 74b:	74 11                	je     75e <printf+0x8e>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 74d:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 750:	e8 cb fe ff ff       	call   620 <putc>
        putc(fd, c);
 755:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 758:	8b 45 08             	mov    0x8(%ebp),%eax
 75b:	0f be d1             	movsbl %cl,%edx
 75e:	83 c3 01             	add    $0x1,%ebx
      }
      state = 0;
 761:	31 f6                	xor    %esi,%esi
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 763:	e8 b8 fe ff ff       	call   620 <putc>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 768:	0f b6 0b             	movzbl (%ebx),%ecx
 76b:	84 c9                	test   %cl,%cl
 76d:	75 a3                	jne    712 <printf+0x42>
 76f:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 770:	83 c4 2c             	add    $0x2c,%esp
 773:	5b                   	pop    %ebx
 774:	5e                   	pop    %esi
 775:	5f                   	pop    %edi
 776:	5d                   	pop    %ebp
 777:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 778:	be 25 00 00 00       	mov    $0x25,%esi
 77d:	eb 89                	jmp    708 <printf+0x38>
 77f:	90                   	nop
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 780:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 783:	b9 10 00 00 00       	mov    $0x10,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 788:	31 f6                	xor    %esi,%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 78a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 791:	8b 10                	mov    (%eax),%edx
 793:	8b 45 08             	mov    0x8(%ebp),%eax
 796:	e8 b5 fe ff ff       	call   650 <printint>
        ap++;
 79b:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 79f:	e9 64 ff ff ff       	jmp    708 <printf+0x38>
 7a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 7a8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7ab:	8b 38                	mov    (%eax),%edi
        ap++;
 7ad:	83 c0 04             	add    $0x4,%eax
 7b0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
          s = "(null)";
 7b3:	b8 e6 09 00 00       	mov    $0x9e6,%eax
 7b8:	85 ff                	test   %edi,%edi
 7ba:	0f 44 f8             	cmove  %eax,%edi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7bd:	31 f6                	xor    %esi,%esi
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 7bf:	0f b6 17             	movzbl (%edi),%edx
 7c2:	84 d2                	test   %dl,%dl
 7c4:	0f 84 3e ff ff ff    	je     708 <printf+0x38>
 7ca:	89 de                	mov    %ebx,%esi
 7cc:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7cf:	90                   	nop
          putc(fd, *s);
 7d0:	0f be d2             	movsbl %dl,%edx
          s++;
 7d3:	83 c7 01             	add    $0x1,%edi
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
 7d6:	89 d8                	mov    %ebx,%eax
 7d8:	e8 43 fe ff ff       	call   620 <putc>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 7dd:	0f b6 17             	movzbl (%edi),%edx
 7e0:	84 d2                	test   %dl,%dl
 7e2:	75 ec                	jne    7d0 <printf+0x100>
 7e4:	89 f3                	mov    %esi,%ebx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7e6:	31 f6                	xor    %esi,%esi
 7e8:	e9 1b ff ff ff       	jmp    708 <printf+0x38>
 7ed:	8d 76 00             	lea    0x0(%esi),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 7f0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7f3:	b1 0a                	mov    $0xa,%cl
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7f5:	66 31 f6             	xor    %si,%si
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 7f8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 7ff:	8b 10                	mov    (%eax),%edx
 801:	8b 45 08             	mov    0x8(%ebp),%eax
 804:	e8 47 fe ff ff       	call   650 <printint>
        ap++;
 809:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 80d:	e9 f6 fe ff ff       	jmp    708 <printf+0x38>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 812:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 815:	31 f6                	xor    %esi,%esi
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 817:	0f be 10             	movsbl (%eax),%edx
 81a:	8b 45 08             	mov    0x8(%ebp),%eax
 81d:	e8 fe fd ff ff       	call   620 <putc>
        ap++;
 822:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
 826:	e9 dd fe ff ff       	jmp    708 <printf+0x38>
 82b:	90                   	nop
 82c:	90                   	nop
 82d:	90                   	nop
 82e:	90                   	nop
 82f:	90                   	nop

00000830 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 830:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 831:	a1 80 0d 00 00       	mov    0xd80,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 836:	89 e5                	mov    %esp,%ebp
 838:	57                   	push   %edi
 839:	56                   	push   %esi
 83a:	53                   	push   %ebx
 83b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 83e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 841:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 848:	39 c8                	cmp    %ecx,%eax
 84a:	8b 10                	mov    (%eax),%edx
 84c:	73 04                	jae    852 <free+0x22>
 84e:	39 d1                	cmp    %edx,%ecx
 850:	72 16                	jb     868 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 852:	39 d0                	cmp    %edx,%eax
 854:	72 0c                	jb     862 <free+0x32>
 856:	39 c8                	cmp    %ecx,%eax
 858:	72 0e                	jb     868 <free+0x38>
 85a:	39 d1                	cmp    %edx,%ecx
 85c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 860:	72 06                	jb     868 <free+0x38>
static Header base;
static Header *freep;

void
free(void *ap)
{
 862:	89 d0                	mov    %edx,%eax
 864:	eb e2                	jmp    848 <free+0x18>
 866:	66 90                	xchg   %ax,%ax

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 868:	8b 73 fc             	mov    -0x4(%ebx),%esi
 86b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 86e:	39 d7                	cmp    %edx,%edi
 870:	74 19                	je     88b <free+0x5b>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 872:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 875:	8b 50 04             	mov    0x4(%eax),%edx
 878:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 87b:	39 f1                	cmp    %esi,%ecx
 87d:	74 23                	je     8a2 <free+0x72>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 87f:	89 08                	mov    %ecx,(%eax)
  freep = p;
 881:	a3 80 0d 00 00       	mov    %eax,0xd80
}
 886:	5b                   	pop    %ebx
 887:	5e                   	pop    %esi
 888:	5f                   	pop    %edi
 889:	5d                   	pop    %ebp
 88a:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 88b:	03 72 04             	add    0x4(%edx),%esi
 88e:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 891:	8b 10                	mov    (%eax),%edx
 893:	8b 12                	mov    (%edx),%edx
 895:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 898:	8b 50 04             	mov    0x4(%eax),%edx
 89b:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 89e:	39 f1                	cmp    %esi,%ecx
 8a0:	75 dd                	jne    87f <free+0x4f>
    p->s.size += bp->s.size;
 8a2:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 8a5:	a3 80 0d 00 00       	mov    %eax,0xd80
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 8aa:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8ad:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8b0:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 8b2:	5b                   	pop    %ebx
 8b3:	5e                   	pop    %esi
 8b4:	5f                   	pop    %edi
 8b5:	5d                   	pop    %ebp
 8b6:	c3                   	ret    
 8b7:	89 f6                	mov    %esi,%esi
 8b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000008c0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 8c0:	55                   	push   %ebp
 8c1:	89 e5                	mov    %esp,%ebp
 8c3:	57                   	push   %edi
 8c4:	56                   	push   %esi
 8c5:	53                   	push   %ebx
 8c6:	83 ec 2c             	sub    $0x2c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if((prevp = freep) == 0){
 8cc:	8b 15 80 0d 00 00    	mov    0xd80,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8d2:	83 c3 07             	add    $0x7,%ebx
 8d5:	c1 eb 03             	shr    $0x3,%ebx
 8d8:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8db:	85 d2                	test   %edx,%edx
 8dd:	0f 84 a3 00 00 00    	je     986 <malloc+0xc6>
 8e3:	8b 02                	mov    (%edx),%eax
 8e5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 8e8:	39 d9                	cmp    %ebx,%ecx
 8ea:	73 74                	jae    960 <malloc+0xa0>
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 8ec:	8d 14 dd 00 00 00 00 	lea    0x0(,%ebx,8),%edx
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 8f3:	bf 00 80 00 00       	mov    $0x8000,%edi
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 8f8:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 8fb:	eb 0c                	jmp    909 <malloc+0x49>
 8fd:	8d 76 00             	lea    0x0(%esi),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 900:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 902:	8b 48 04             	mov    0x4(%eax),%ecx
 905:	39 cb                	cmp    %ecx,%ebx
 907:	76 57                	jbe    960 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 909:	3b 05 80 0d 00 00    	cmp    0xd80,%eax
 90f:	89 c2                	mov    %eax,%edx
 911:	75 ed                	jne    900 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 913:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 916:	81 fb 00 10 00 00    	cmp    $0x1000,%ebx
 91c:	be 00 10 00 00       	mov    $0x1000,%esi
 921:	0f 43 f3             	cmovae %ebx,%esi
 924:	0f 42 c7             	cmovb  %edi,%eax
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 927:	89 04 24             	mov    %eax,(%esp)
 92a:	e8 cd fc ff ff       	call   5fc <sbrk>
  if(p == (char*)-1)
 92f:	83 f8 ff             	cmp    $0xffffffff,%eax
 932:	74 1c                	je     950 <malloc+0x90>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 934:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 937:	83 c0 08             	add    $0x8,%eax
 93a:	89 04 24             	mov    %eax,(%esp)
 93d:	e8 ee fe ff ff       	call   830 <free>
  return freep;
 942:	8b 15 80 0d 00 00    	mov    0xd80,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 948:	85 d2                	test   %edx,%edx
 94a:	75 b4                	jne    900 <malloc+0x40>
 94c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return 0;
  }
}
 950:	83 c4 2c             	add    $0x2c,%esp
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
 953:	31 c0                	xor    %eax,%eax
  }
}
 955:	5b                   	pop    %ebx
 956:	5e                   	pop    %esi
 957:	5f                   	pop    %edi
 958:	5d                   	pop    %ebp
 959:	c3                   	ret    
 95a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 960:	39 cb                	cmp    %ecx,%ebx
 962:	74 1c                	je     980 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 964:	29 d9                	sub    %ebx,%ecx
 966:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 969:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 96c:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 96f:	89 15 80 0d 00 00    	mov    %edx,0xd80
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 975:	83 c4 2c             	add    $0x2c,%esp
        p->s.size -= nunits;
        p += p->s.size;
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
 978:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 97b:	5b                   	pop    %ebx
 97c:	5e                   	pop    %esi
 97d:	5f                   	pop    %edi
 97e:	5d                   	pop    %ebp
 97f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 980:	8b 08                	mov    (%eax),%ecx
 982:	89 0a                	mov    %ecx,(%edx)
 984:	eb e9                	jmp    96f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 986:	c7 05 80 0d 00 00 84 	movl   $0xd84,0xd80
 98d:	0d 00 00 
    base.s.size = 0;
 990:	b8 84 0d 00 00       	mov    $0xd84,%eax
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 995:	c7 05 84 0d 00 00 84 	movl   $0xd84,0xd84
 99c:	0d 00 00 
    base.s.size = 0;
 99f:	c7 05 88 0d 00 00 00 	movl   $0x0,0xd88
 9a6:	00 00 00 
 9a9:	e9 3e ff ff ff       	jmp    8ec <malloc+0x2c>
