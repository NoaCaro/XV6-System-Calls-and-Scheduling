
user/_grep:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <matchstar>:
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	ec26                	sd	s1,24(sp)
   8:	e84a                	sd	s2,16(sp)
   a:	e44e                	sd	s3,8(sp)
   c:	e052                	sd	s4,0(sp)
   e:	1800                	addi	s0,sp,48
  10:	892a                	mv	s2,a0
  12:	89ae                	mv	s3,a1
  14:	84b2                	mv	s1,a2
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  16:	02e00a13          	li	s4,46
    if(matchhere(re, text))
  1a:	85a6                	mv	a1,s1
  1c:	854e                	mv	a0,s3
  1e:	00000097          	auipc	ra,0x0
  22:	030080e7          	jalr	48(ra) # 4e <matchhere>
  26:	e919                	bnez	a0,3c <matchstar+0x3c>
  }while(*text!='\0' && (*text++==c || c=='.'));
  28:	0004c783          	lbu	a5,0(s1)
  2c:	cb89                	beqz	a5,3e <matchstar+0x3e>
  2e:	0485                	addi	s1,s1,1
  30:	2781                	sext.w	a5,a5
  32:	ff2784e3          	beq	a5,s2,1a <matchstar+0x1a>
  36:	ff4902e3          	beq	s2,s4,1a <matchstar+0x1a>
  3a:	a011                	j	3e <matchstar+0x3e>
      return 1;
  3c:	4505                	li	a0,1
  return 0;
}
  3e:	70a2                	ld	ra,40(sp)
  40:	7402                	ld	s0,32(sp)
  42:	64e2                	ld	s1,24(sp)
  44:	6942                	ld	s2,16(sp)
  46:	69a2                	ld	s3,8(sp)
  48:	6a02                	ld	s4,0(sp)
  4a:	6145                	addi	sp,sp,48
  4c:	8082                	ret

000000000000004e <matchhere>:
  if(re[0] == '\0')
  4e:	00054703          	lbu	a4,0(a0)
  52:	cb3d                	beqz	a4,c8 <matchhere+0x7a>
{
  54:	1141                	addi	sp,sp,-16
  56:	e406                	sd	ra,8(sp)
  58:	e022                	sd	s0,0(sp)
  5a:	0800                	addi	s0,sp,16
  5c:	87aa                	mv	a5,a0
  if(re[1] == '*')
  5e:	00154683          	lbu	a3,1(a0)
  62:	02a00613          	li	a2,42
  66:	02c68563          	beq	a3,a2,90 <matchhere+0x42>
  if(re[0] == '$' && re[1] == '\0')
  6a:	02400613          	li	a2,36
  6e:	02c70a63          	beq	a4,a2,a2 <matchhere+0x54>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  72:	0005c683          	lbu	a3,0(a1)
  return 0;
  76:	4501                	li	a0,0
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  78:	ca81                	beqz	a3,88 <matchhere+0x3a>
  7a:	02e00613          	li	a2,46
  7e:	02c70d63          	beq	a4,a2,b8 <matchhere+0x6a>
  return 0;
  82:	4501                	li	a0,0
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  84:	02d70a63          	beq	a4,a3,b8 <matchhere+0x6a>
}
  88:	60a2                	ld	ra,8(sp)
  8a:	6402                	ld	s0,0(sp)
  8c:	0141                	addi	sp,sp,16
  8e:	8082                	ret
    return matchstar(re[0], re+2, text);
  90:	862e                	mv	a2,a1
  92:	00250593          	addi	a1,a0,2
  96:	853a                	mv	a0,a4
  98:	00000097          	auipc	ra,0x0
  9c:	f68080e7          	jalr	-152(ra) # 0 <matchstar>
  a0:	b7e5                	j	88 <matchhere+0x3a>
  if(re[0] == '$' && re[1] == '\0')
  a2:	c691                	beqz	a3,ae <matchhere+0x60>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  a4:	0005c683          	lbu	a3,0(a1)
  a8:	fee9                	bnez	a3,82 <matchhere+0x34>
  return 0;
  aa:	4501                	li	a0,0
  ac:	bff1                	j	88 <matchhere+0x3a>
    return *text == '\0';
  ae:	0005c503          	lbu	a0,0(a1)
  b2:	00153513          	seqz	a0,a0
  b6:	bfc9                	j	88 <matchhere+0x3a>
    return matchhere(re+1, text+1);
  b8:	0585                	addi	a1,a1,1
  ba:	00178513          	addi	a0,a5,1
  be:	00000097          	auipc	ra,0x0
  c2:	f90080e7          	jalr	-112(ra) # 4e <matchhere>
  c6:	b7c9                	j	88 <matchhere+0x3a>
    return 1;
  c8:	4505                	li	a0,1
}
  ca:	8082                	ret

00000000000000cc <match>:
{
  cc:	1101                	addi	sp,sp,-32
  ce:	ec06                	sd	ra,24(sp)
  d0:	e822                	sd	s0,16(sp)
  d2:	e426                	sd	s1,8(sp)
  d4:	e04a                	sd	s2,0(sp)
  d6:	1000                	addi	s0,sp,32
  d8:	892a                	mv	s2,a0
  da:	84ae                	mv	s1,a1
  if(re[0] == '^')
  dc:	00054703          	lbu	a4,0(a0)
  e0:	05e00793          	li	a5,94
  e4:	00f70e63          	beq	a4,a5,100 <match+0x34>
    if(matchhere(re, text))
  e8:	85a6                	mv	a1,s1
  ea:	854a                	mv	a0,s2
  ec:	00000097          	auipc	ra,0x0
  f0:	f62080e7          	jalr	-158(ra) # 4e <matchhere>
  f4:	ed01                	bnez	a0,10c <match+0x40>
  }while(*text++ != '\0');
  f6:	0485                	addi	s1,s1,1
  f8:	fff4c783          	lbu	a5,-1(s1)
  fc:	f7f5                	bnez	a5,e8 <match+0x1c>
  fe:	a801                	j	10e <match+0x42>
    return matchhere(re+1, text);
 100:	0505                	addi	a0,a0,1
 102:	00000097          	auipc	ra,0x0
 106:	f4c080e7          	jalr	-180(ra) # 4e <matchhere>
 10a:	a011                	j	10e <match+0x42>
      return 1;
 10c:	4505                	li	a0,1
}
 10e:	60e2                	ld	ra,24(sp)
 110:	6442                	ld	s0,16(sp)
 112:	64a2                	ld	s1,8(sp)
 114:	6902                	ld	s2,0(sp)
 116:	6105                	addi	sp,sp,32
 118:	8082                	ret

000000000000011a <grep>:
{
 11a:	715d                	addi	sp,sp,-80
 11c:	e486                	sd	ra,72(sp)
 11e:	e0a2                	sd	s0,64(sp)
 120:	fc26                	sd	s1,56(sp)
 122:	f84a                	sd	s2,48(sp)
 124:	f44e                	sd	s3,40(sp)
 126:	f052                	sd	s4,32(sp)
 128:	ec56                	sd	s5,24(sp)
 12a:	e85a                	sd	s6,16(sp)
 12c:	e45e                	sd	s7,8(sp)
 12e:	0880                	addi	s0,sp,80
 130:	89aa                	mv	s3,a0
 132:	8b2e                	mv	s6,a1
  m = 0;
 134:	4a01                	li	s4,0
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 136:	3ff00b93          	li	s7,1023
 13a:	00001a97          	auipc	s5,0x1
 13e:	ed6a8a93          	addi	s5,s5,-298 # 1010 <buf>
 142:	a0a1                	j	18a <grep+0x70>
      p = q+1;
 144:	00148913          	addi	s2,s1,1
    while((q = strchr(p, '\n')) != 0){
 148:	45a9                	li	a1,10
 14a:	854a                	mv	a0,s2
 14c:	00000097          	auipc	ra,0x0
 150:	228080e7          	jalr	552(ra) # 374 <strchr>
 154:	84aa                	mv	s1,a0
 156:	c905                	beqz	a0,186 <grep+0x6c>
      *q = 0;
 158:	00048023          	sb	zero,0(s1)
      if(match(pattern, p)){
 15c:	85ca                	mv	a1,s2
 15e:	854e                	mv	a0,s3
 160:	00000097          	auipc	ra,0x0
 164:	f6c080e7          	jalr	-148(ra) # cc <match>
 168:	dd71                	beqz	a0,144 <grep+0x2a>
        *q = '\n';
 16a:	47a9                	li	a5,10
 16c:	00f48023          	sb	a5,0(s1)
        write(1, p, q+1 - p);
 170:	00148613          	addi	a2,s1,1
 174:	4126063b          	subw	a2,a2,s2
 178:	85ca                	mv	a1,s2
 17a:	4505                	li	a0,1
 17c:	00000097          	auipc	ra,0x0
 180:	3f2080e7          	jalr	1010(ra) # 56e <write>
 184:	b7c1                	j	144 <grep+0x2a>
    if(m > 0){
 186:	03404563          	bgtz	s4,1b0 <grep+0x96>
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 18a:	414b863b          	subw	a2,s7,s4
 18e:	014a85b3          	add	a1,s5,s4
 192:	855a                	mv	a0,s6
 194:	00000097          	auipc	ra,0x0
 198:	3d2080e7          	jalr	978(ra) # 566 <read>
 19c:	02a05663          	blez	a0,1c8 <grep+0xae>
    m += n;
 1a0:	00aa0a3b          	addw	s4,s4,a0
    buf[m] = '\0';
 1a4:	014a87b3          	add	a5,s5,s4
 1a8:	00078023          	sb	zero,0(a5)
    p = buf;
 1ac:	8956                	mv	s2,s5
    while((q = strchr(p, '\n')) != 0){
 1ae:	bf69                	j	148 <grep+0x2e>
      m -= p - buf;
 1b0:	415907b3          	sub	a5,s2,s5
 1b4:	40fa0a3b          	subw	s4,s4,a5
      memmove(buf, p, m);
 1b8:	8652                	mv	a2,s4
 1ba:	85ca                	mv	a1,s2
 1bc:	8556                	mv	a0,s5
 1be:	00000097          	auipc	ra,0x0
 1c2:	2de080e7          	jalr	734(ra) # 49c <memmove>
 1c6:	b7d1                	j	18a <grep+0x70>
}
 1c8:	60a6                	ld	ra,72(sp)
 1ca:	6406                	ld	s0,64(sp)
 1cc:	74e2                	ld	s1,56(sp)
 1ce:	7942                	ld	s2,48(sp)
 1d0:	79a2                	ld	s3,40(sp)
 1d2:	7a02                	ld	s4,32(sp)
 1d4:	6ae2                	ld	s5,24(sp)
 1d6:	6b42                	ld	s6,16(sp)
 1d8:	6ba2                	ld	s7,8(sp)
 1da:	6161                	addi	sp,sp,80
 1dc:	8082                	ret

00000000000001de <main>:
{
 1de:	7139                	addi	sp,sp,-64
 1e0:	fc06                	sd	ra,56(sp)
 1e2:	f822                	sd	s0,48(sp)
 1e4:	f426                	sd	s1,40(sp)
 1e6:	f04a                	sd	s2,32(sp)
 1e8:	ec4e                	sd	s3,24(sp)
 1ea:	e852                	sd	s4,16(sp)
 1ec:	e456                	sd	s5,8(sp)
 1ee:	0080                	addi	s0,sp,64
  if(argc <= 1){
 1f0:	4785                	li	a5,1
 1f2:	06a7d263          	bge	a5,a0,256 <main+0x78>
  pattern = argv[1];
 1f6:	0085ba03          	ld	s4,8(a1)
  if(argc <= 2){
 1fa:	4789                	li	a5,2
 1fc:	06a7df63          	bge	a5,a0,27a <main+0x9c>
 200:	01058913          	addi	s2,a1,16
 204:	ffd5099b          	addiw	s3,a0,-3
 208:	1982                	slli	s3,s3,0x20
 20a:	0209d993          	srli	s3,s3,0x20
 20e:	098e                	slli	s3,s3,0x3
 210:	05e1                	addi	a1,a1,24
 212:	99ae                	add	s3,s3,a1
    if((fd = open(argv[i], 0)) < 0){
 214:	4581                	li	a1,0
 216:	00093503          	ld	a0,0(s2)
 21a:	00000097          	auipc	ra,0x0
 21e:	374080e7          	jalr	884(ra) # 58e <open>
 222:	84aa                	mv	s1,a0
 224:	06054a63          	bltz	a0,298 <main+0xba>
    grep(pattern, fd);
 228:	85aa                	mv	a1,a0
 22a:	8552                	mv	a0,s4
 22c:	00000097          	auipc	ra,0x0
 230:	eee080e7          	jalr	-274(ra) # 11a <grep>
    close(fd);
 234:	8526                	mv	a0,s1
 236:	00000097          	auipc	ra,0x0
 23a:	340080e7          	jalr	832(ra) # 576 <close>
  for(i = 2; i < argc; i++){
 23e:	0921                	addi	s2,s2,8
 240:	fd391ae3          	bne	s2,s3,214 <main+0x36>
  exit(0,"");
 244:	00001597          	auipc	a1,0x1
 248:	87c58593          	addi	a1,a1,-1924 # ac0 <malloc+0x10c>
 24c:	4501                	li	a0,0
 24e:	00000097          	auipc	ra,0x0
 252:	300080e7          	jalr	768(ra) # 54e <exit>
    fprintf(2, "usage: grep pattern [file ...]\n");
 256:	00001597          	auipc	a1,0x1
 25a:	84a58593          	addi	a1,a1,-1974 # aa0 <malloc+0xec>
 25e:	4509                	li	a0,2
 260:	00000097          	auipc	ra,0x0
 264:	668080e7          	jalr	1640(ra) # 8c8 <fprintf>
    exit(1,"");
 268:	00001597          	auipc	a1,0x1
 26c:	85858593          	addi	a1,a1,-1960 # ac0 <malloc+0x10c>
 270:	4505                	li	a0,1
 272:	00000097          	auipc	ra,0x0
 276:	2dc080e7          	jalr	732(ra) # 54e <exit>
    grep(pattern, 0);
 27a:	4581                	li	a1,0
 27c:	8552                	mv	a0,s4
 27e:	00000097          	auipc	ra,0x0
 282:	e9c080e7          	jalr	-356(ra) # 11a <grep>
    exit(0,"");
 286:	00001597          	auipc	a1,0x1
 28a:	83a58593          	addi	a1,a1,-1990 # ac0 <malloc+0x10c>
 28e:	4501                	li	a0,0
 290:	00000097          	auipc	ra,0x0
 294:	2be080e7          	jalr	702(ra) # 54e <exit>
      printf("grep: cannot open %s\n", argv[i]);
 298:	00093583          	ld	a1,0(s2)
 29c:	00001517          	auipc	a0,0x1
 2a0:	82c50513          	addi	a0,a0,-2004 # ac8 <malloc+0x114>
 2a4:	00000097          	auipc	ra,0x0
 2a8:	652080e7          	jalr	1618(ra) # 8f6 <printf>
      exit(1,"");
 2ac:	00001597          	auipc	a1,0x1
 2b0:	81458593          	addi	a1,a1,-2028 # ac0 <malloc+0x10c>
 2b4:	4505                	li	a0,1
 2b6:	00000097          	auipc	ra,0x0
 2ba:	298080e7          	jalr	664(ra) # 54e <exit>

00000000000002be <_main>:
//
// wrapper so that it's OK if main() does not call exit().
//
void
_main()
{
 2be:	1141                	addi	sp,sp,-16
 2c0:	e406                	sd	ra,8(sp)
 2c2:	e022                	sd	s0,0(sp)
 2c4:	0800                	addi	s0,sp,16
  extern int main();
  main();
 2c6:	00000097          	auipc	ra,0x0
 2ca:	f18080e7          	jalr	-232(ra) # 1de <main>
  exit(0,"");
 2ce:	00000597          	auipc	a1,0x0
 2d2:	7f258593          	addi	a1,a1,2034 # ac0 <malloc+0x10c>
 2d6:	4501                	li	a0,0
 2d8:	00000097          	auipc	ra,0x0
 2dc:	276080e7          	jalr	630(ra) # 54e <exit>

00000000000002e0 <strcpy>:
}

char*
strcpy(char *s, const char *t)
{
 2e0:	1141                	addi	sp,sp,-16
 2e2:	e422                	sd	s0,8(sp)
 2e4:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2e6:	87aa                	mv	a5,a0
 2e8:	0585                	addi	a1,a1,1
 2ea:	0785                	addi	a5,a5,1
 2ec:	fff5c703          	lbu	a4,-1(a1)
 2f0:	fee78fa3          	sb	a4,-1(a5)
 2f4:	fb75                	bnez	a4,2e8 <strcpy+0x8>
    ;
  return os;
}
 2f6:	6422                	ld	s0,8(sp)
 2f8:	0141                	addi	sp,sp,16
 2fa:	8082                	ret

00000000000002fc <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2fc:	1141                	addi	sp,sp,-16
 2fe:	e422                	sd	s0,8(sp)
 300:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 302:	00054783          	lbu	a5,0(a0)
 306:	cb91                	beqz	a5,31a <strcmp+0x1e>
 308:	0005c703          	lbu	a4,0(a1)
 30c:	00f71763          	bne	a4,a5,31a <strcmp+0x1e>
    p++, q++;
 310:	0505                	addi	a0,a0,1
 312:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 314:	00054783          	lbu	a5,0(a0)
 318:	fbe5                	bnez	a5,308 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 31a:	0005c503          	lbu	a0,0(a1)
}
 31e:	40a7853b          	subw	a0,a5,a0
 322:	6422                	ld	s0,8(sp)
 324:	0141                	addi	sp,sp,16
 326:	8082                	ret

0000000000000328 <strlen>:

uint
strlen(const char *s)
{
 328:	1141                	addi	sp,sp,-16
 32a:	e422                	sd	s0,8(sp)
 32c:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 32e:	00054783          	lbu	a5,0(a0)
 332:	cf91                	beqz	a5,34e <strlen+0x26>
 334:	0505                	addi	a0,a0,1
 336:	87aa                	mv	a5,a0
 338:	4685                	li	a3,1
 33a:	9e89                	subw	a3,a3,a0
 33c:	00f6853b          	addw	a0,a3,a5
 340:	0785                	addi	a5,a5,1
 342:	fff7c703          	lbu	a4,-1(a5)
 346:	fb7d                	bnez	a4,33c <strlen+0x14>
    ;
  return n;
}
 348:	6422                	ld	s0,8(sp)
 34a:	0141                	addi	sp,sp,16
 34c:	8082                	ret
  for(n = 0; s[n]; n++)
 34e:	4501                	li	a0,0
 350:	bfe5                	j	348 <strlen+0x20>

0000000000000352 <memset>:

void*
memset(void *dst, int c, uint n)
{
 352:	1141                	addi	sp,sp,-16
 354:	e422                	sd	s0,8(sp)
 356:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 358:	ca19                	beqz	a2,36e <memset+0x1c>
 35a:	87aa                	mv	a5,a0
 35c:	1602                	slli	a2,a2,0x20
 35e:	9201                	srli	a2,a2,0x20
 360:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 364:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 368:	0785                	addi	a5,a5,1
 36a:	fee79de3          	bne	a5,a4,364 <memset+0x12>
  }
  return dst;
}
 36e:	6422                	ld	s0,8(sp)
 370:	0141                	addi	sp,sp,16
 372:	8082                	ret

0000000000000374 <strchr>:

char*
strchr(const char *s, char c)
{
 374:	1141                	addi	sp,sp,-16
 376:	e422                	sd	s0,8(sp)
 378:	0800                	addi	s0,sp,16
  for(; *s; s++)
 37a:	00054783          	lbu	a5,0(a0)
 37e:	cb99                	beqz	a5,394 <strchr+0x20>
    if(*s == c)
 380:	00f58763          	beq	a1,a5,38e <strchr+0x1a>
  for(; *s; s++)
 384:	0505                	addi	a0,a0,1
 386:	00054783          	lbu	a5,0(a0)
 38a:	fbfd                	bnez	a5,380 <strchr+0xc>
      return (char*)s;
  return 0;
 38c:	4501                	li	a0,0
}
 38e:	6422                	ld	s0,8(sp)
 390:	0141                	addi	sp,sp,16
 392:	8082                	ret
  return 0;
 394:	4501                	li	a0,0
 396:	bfe5                	j	38e <strchr+0x1a>

0000000000000398 <gets>:

char*
gets(char *buf, int max)
{
 398:	711d                	addi	sp,sp,-96
 39a:	ec86                	sd	ra,88(sp)
 39c:	e8a2                	sd	s0,80(sp)
 39e:	e4a6                	sd	s1,72(sp)
 3a0:	e0ca                	sd	s2,64(sp)
 3a2:	fc4e                	sd	s3,56(sp)
 3a4:	f852                	sd	s4,48(sp)
 3a6:	f456                	sd	s5,40(sp)
 3a8:	f05a                	sd	s6,32(sp)
 3aa:	ec5e                	sd	s7,24(sp)
 3ac:	1080                	addi	s0,sp,96
 3ae:	8baa                	mv	s7,a0
 3b0:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3b2:	892a                	mv	s2,a0
 3b4:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 3b6:	4aa9                	li	s5,10
 3b8:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 3ba:	89a6                	mv	s3,s1
 3bc:	2485                	addiw	s1,s1,1
 3be:	0344d863          	bge	s1,s4,3ee <gets+0x56>
    cc = read(0, &c, 1);
 3c2:	4605                	li	a2,1
 3c4:	faf40593          	addi	a1,s0,-81
 3c8:	4501                	li	a0,0
 3ca:	00000097          	auipc	ra,0x0
 3ce:	19c080e7          	jalr	412(ra) # 566 <read>
    if(cc < 1)
 3d2:	00a05e63          	blez	a0,3ee <gets+0x56>
    buf[i++] = c;
 3d6:	faf44783          	lbu	a5,-81(s0)
 3da:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 3de:	01578763          	beq	a5,s5,3ec <gets+0x54>
 3e2:	0905                	addi	s2,s2,1
 3e4:	fd679be3          	bne	a5,s6,3ba <gets+0x22>
  for(i=0; i+1 < max; ){
 3e8:	89a6                	mv	s3,s1
 3ea:	a011                	j	3ee <gets+0x56>
 3ec:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 3ee:	99de                	add	s3,s3,s7
 3f0:	00098023          	sb	zero,0(s3)
  return buf;
}
 3f4:	855e                	mv	a0,s7
 3f6:	60e6                	ld	ra,88(sp)
 3f8:	6446                	ld	s0,80(sp)
 3fa:	64a6                	ld	s1,72(sp)
 3fc:	6906                	ld	s2,64(sp)
 3fe:	79e2                	ld	s3,56(sp)
 400:	7a42                	ld	s4,48(sp)
 402:	7aa2                	ld	s5,40(sp)
 404:	7b02                	ld	s6,32(sp)
 406:	6be2                	ld	s7,24(sp)
 408:	6125                	addi	sp,sp,96
 40a:	8082                	ret

000000000000040c <stat>:

int
stat(const char *n, struct stat *st)
{
 40c:	1101                	addi	sp,sp,-32
 40e:	ec06                	sd	ra,24(sp)
 410:	e822                	sd	s0,16(sp)
 412:	e426                	sd	s1,8(sp)
 414:	e04a                	sd	s2,0(sp)
 416:	1000                	addi	s0,sp,32
 418:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 41a:	4581                	li	a1,0
 41c:	00000097          	auipc	ra,0x0
 420:	172080e7          	jalr	370(ra) # 58e <open>
  if(fd < 0)
 424:	02054563          	bltz	a0,44e <stat+0x42>
 428:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 42a:	85ca                	mv	a1,s2
 42c:	00000097          	auipc	ra,0x0
 430:	17a080e7          	jalr	378(ra) # 5a6 <fstat>
 434:	892a                	mv	s2,a0
  close(fd);
 436:	8526                	mv	a0,s1
 438:	00000097          	auipc	ra,0x0
 43c:	13e080e7          	jalr	318(ra) # 576 <close>
  return r;
}
 440:	854a                	mv	a0,s2
 442:	60e2                	ld	ra,24(sp)
 444:	6442                	ld	s0,16(sp)
 446:	64a2                	ld	s1,8(sp)
 448:	6902                	ld	s2,0(sp)
 44a:	6105                	addi	sp,sp,32
 44c:	8082                	ret
    return -1;
 44e:	597d                	li	s2,-1
 450:	bfc5                	j	440 <stat+0x34>

0000000000000452 <atoi>:

int
atoi(const char *s)
{
 452:	1141                	addi	sp,sp,-16
 454:	e422                	sd	s0,8(sp)
 456:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 458:	00054603          	lbu	a2,0(a0)
 45c:	fd06079b          	addiw	a5,a2,-48
 460:	0ff7f793          	andi	a5,a5,255
 464:	4725                	li	a4,9
 466:	02f76963          	bltu	a4,a5,498 <atoi+0x46>
 46a:	86aa                	mv	a3,a0
  n = 0;
 46c:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
 46e:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 470:	0685                	addi	a3,a3,1
 472:	0025179b          	slliw	a5,a0,0x2
 476:	9fa9                	addw	a5,a5,a0
 478:	0017979b          	slliw	a5,a5,0x1
 47c:	9fb1                	addw	a5,a5,a2
 47e:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 482:	0006c603          	lbu	a2,0(a3)
 486:	fd06071b          	addiw	a4,a2,-48
 48a:	0ff77713          	andi	a4,a4,255
 48e:	fee5f1e3          	bgeu	a1,a4,470 <atoi+0x1e>
  return n;
}
 492:	6422                	ld	s0,8(sp)
 494:	0141                	addi	sp,sp,16
 496:	8082                	ret
  n = 0;
 498:	4501                	li	a0,0
 49a:	bfe5                	j	492 <atoi+0x40>

000000000000049c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 49c:	1141                	addi	sp,sp,-16
 49e:	e422                	sd	s0,8(sp)
 4a0:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 4a2:	02b57463          	bgeu	a0,a1,4ca <memmove+0x2e>
    while(n-- > 0)
 4a6:	00c05f63          	blez	a2,4c4 <memmove+0x28>
 4aa:	1602                	slli	a2,a2,0x20
 4ac:	9201                	srli	a2,a2,0x20
 4ae:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 4b2:	872a                	mv	a4,a0
      *dst++ = *src++;
 4b4:	0585                	addi	a1,a1,1
 4b6:	0705                	addi	a4,a4,1
 4b8:	fff5c683          	lbu	a3,-1(a1)
 4bc:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 4c0:	fee79ae3          	bne	a5,a4,4b4 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 4c4:	6422                	ld	s0,8(sp)
 4c6:	0141                	addi	sp,sp,16
 4c8:	8082                	ret
    dst += n;
 4ca:	00c50733          	add	a4,a0,a2
    src += n;
 4ce:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 4d0:	fec05ae3          	blez	a2,4c4 <memmove+0x28>
 4d4:	fff6079b          	addiw	a5,a2,-1
 4d8:	1782                	slli	a5,a5,0x20
 4da:	9381                	srli	a5,a5,0x20
 4dc:	fff7c793          	not	a5,a5
 4e0:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 4e2:	15fd                	addi	a1,a1,-1
 4e4:	177d                	addi	a4,a4,-1
 4e6:	0005c683          	lbu	a3,0(a1)
 4ea:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 4ee:	fee79ae3          	bne	a5,a4,4e2 <memmove+0x46>
 4f2:	bfc9                	j	4c4 <memmove+0x28>

00000000000004f4 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 4f4:	1141                	addi	sp,sp,-16
 4f6:	e422                	sd	s0,8(sp)
 4f8:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 4fa:	ca05                	beqz	a2,52a <memcmp+0x36>
 4fc:	fff6069b          	addiw	a3,a2,-1
 500:	1682                	slli	a3,a3,0x20
 502:	9281                	srli	a3,a3,0x20
 504:	0685                	addi	a3,a3,1
 506:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 508:	00054783          	lbu	a5,0(a0)
 50c:	0005c703          	lbu	a4,0(a1)
 510:	00e79863          	bne	a5,a4,520 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 514:	0505                	addi	a0,a0,1
    p2++;
 516:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 518:	fed518e3          	bne	a0,a3,508 <memcmp+0x14>
  }
  return 0;
 51c:	4501                	li	a0,0
 51e:	a019                	j	524 <memcmp+0x30>
      return *p1 - *p2;
 520:	40e7853b          	subw	a0,a5,a4
}
 524:	6422                	ld	s0,8(sp)
 526:	0141                	addi	sp,sp,16
 528:	8082                	ret
  return 0;
 52a:	4501                	li	a0,0
 52c:	bfe5                	j	524 <memcmp+0x30>

000000000000052e <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 52e:	1141                	addi	sp,sp,-16
 530:	e406                	sd	ra,8(sp)
 532:	e022                	sd	s0,0(sp)
 534:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 536:	00000097          	auipc	ra,0x0
 53a:	f66080e7          	jalr	-154(ra) # 49c <memmove>
}
 53e:	60a2                	ld	ra,8(sp)
 540:	6402                	ld	s0,0(sp)
 542:	0141                	addi	sp,sp,16
 544:	8082                	ret

0000000000000546 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 546:	4885                	li	a7,1
 ecall
 548:	00000073          	ecall
 ret
 54c:	8082                	ret

000000000000054e <exit>:
.global exit
exit:
 li a7, SYS_exit
 54e:	4889                	li	a7,2
 ecall
 550:	00000073          	ecall
 ret
 554:	8082                	ret

0000000000000556 <wait>:
.global wait
wait:
 li a7, SYS_wait
 556:	488d                	li	a7,3
 ecall
 558:	00000073          	ecall
 ret
 55c:	8082                	ret

000000000000055e <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 55e:	4891                	li	a7,4
 ecall
 560:	00000073          	ecall
 ret
 564:	8082                	ret

0000000000000566 <read>:
.global read
read:
 li a7, SYS_read
 566:	4895                	li	a7,5
 ecall
 568:	00000073          	ecall
 ret
 56c:	8082                	ret

000000000000056e <write>:
.global write
write:
 li a7, SYS_write
 56e:	48c1                	li	a7,16
 ecall
 570:	00000073          	ecall
 ret
 574:	8082                	ret

0000000000000576 <close>:
.global close
close:
 li a7, SYS_close
 576:	48d5                	li	a7,21
 ecall
 578:	00000073          	ecall
 ret
 57c:	8082                	ret

000000000000057e <kill>:
.global kill
kill:
 li a7, SYS_kill
 57e:	4899                	li	a7,6
 ecall
 580:	00000073          	ecall
 ret
 584:	8082                	ret

0000000000000586 <exec>:
.global exec
exec:
 li a7, SYS_exec
 586:	489d                	li	a7,7
 ecall
 588:	00000073          	ecall
 ret
 58c:	8082                	ret

000000000000058e <open>:
.global open
open:
 li a7, SYS_open
 58e:	48bd                	li	a7,15
 ecall
 590:	00000073          	ecall
 ret
 594:	8082                	ret

0000000000000596 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 596:	48c5                	li	a7,17
 ecall
 598:	00000073          	ecall
 ret
 59c:	8082                	ret

000000000000059e <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 59e:	48c9                	li	a7,18
 ecall
 5a0:	00000073          	ecall
 ret
 5a4:	8082                	ret

00000000000005a6 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 5a6:	48a1                	li	a7,8
 ecall
 5a8:	00000073          	ecall
 ret
 5ac:	8082                	ret

00000000000005ae <link>:
.global link
link:
 li a7, SYS_link
 5ae:	48cd                	li	a7,19
 ecall
 5b0:	00000073          	ecall
 ret
 5b4:	8082                	ret

00000000000005b6 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 5b6:	48d1                	li	a7,20
 ecall
 5b8:	00000073          	ecall
 ret
 5bc:	8082                	ret

00000000000005be <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 5be:	48a5                	li	a7,9
 ecall
 5c0:	00000073          	ecall
 ret
 5c4:	8082                	ret

00000000000005c6 <dup>:
.global dup
dup:
 li a7, SYS_dup
 5c6:	48a9                	li	a7,10
 ecall
 5c8:	00000073          	ecall
 ret
 5cc:	8082                	ret

00000000000005ce <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 5ce:	48ad                	li	a7,11
 ecall
 5d0:	00000073          	ecall
 ret
 5d4:	8082                	ret

00000000000005d6 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 5d6:	48b1                	li	a7,12
 ecall
 5d8:	00000073          	ecall
 ret
 5dc:	8082                	ret

00000000000005de <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 5de:	48b5                	li	a7,13
 ecall
 5e0:	00000073          	ecall
 ret
 5e4:	8082                	ret

00000000000005e6 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 5e6:	48b9                	li	a7,14
 ecall
 5e8:	00000073          	ecall
 ret
 5ec:	8082                	ret

00000000000005ee <memsize>:
.global memsize
memsize:
 li a7, SYS_memsize
 5ee:	48d9                	li	a7,22
 ecall
 5f0:	00000073          	ecall
 ret
 5f4:	8082                	ret

00000000000005f6 <set_ps_priority>:
.global set_ps_priority
set_ps_priority:
 li a7, SYS_set_ps_priority
 5f6:	48dd                	li	a7,23
 ecall
 5f8:	00000073          	ecall
 ret
 5fc:	8082                	ret

00000000000005fe <set_cfs_priority>:
.global set_cfs_priority
set_cfs_priority:
 li a7, SYS_set_cfs_priority
 5fe:	48e1                	li	a7,24
 ecall
 600:	00000073          	ecall
 ret
 604:	8082                	ret

0000000000000606 <get_cfs_stats>:
.global get_cfs_stats
get_cfs_stats:
 li a7, SYS_get_cfs_stats
 606:	48e5                	li	a7,25
 ecall
 608:	00000073          	ecall
 ret
 60c:	8082                	ret

000000000000060e <set_policy>:
.global set_policy
set_policy:
 li a7, SYS_set_policy
 60e:	48e9                	li	a7,26
 ecall
 610:	00000073          	ecall
 ret
 614:	8082                	ret

0000000000000616 <get_ps_priority>:
.global get_ps_priority
get_ps_priority:
 li a7, SYS_get_ps_priority
 616:	48ed                	li	a7,27
 ecall
 618:	00000073          	ecall
 ret
 61c:	8082                	ret

000000000000061e <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 61e:	1101                	addi	sp,sp,-32
 620:	ec06                	sd	ra,24(sp)
 622:	e822                	sd	s0,16(sp)
 624:	1000                	addi	s0,sp,32
 626:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 62a:	4605                	li	a2,1
 62c:	fef40593          	addi	a1,s0,-17
 630:	00000097          	auipc	ra,0x0
 634:	f3e080e7          	jalr	-194(ra) # 56e <write>
}
 638:	60e2                	ld	ra,24(sp)
 63a:	6442                	ld	s0,16(sp)
 63c:	6105                	addi	sp,sp,32
 63e:	8082                	ret

0000000000000640 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 640:	7139                	addi	sp,sp,-64
 642:	fc06                	sd	ra,56(sp)
 644:	f822                	sd	s0,48(sp)
 646:	f426                	sd	s1,40(sp)
 648:	f04a                	sd	s2,32(sp)
 64a:	ec4e                	sd	s3,24(sp)
 64c:	0080                	addi	s0,sp,64
 64e:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 650:	c299                	beqz	a3,656 <printint+0x16>
 652:	0805c863          	bltz	a1,6e2 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 656:	2581                	sext.w	a1,a1
  neg = 0;
 658:	4881                	li	a7,0
 65a:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 65e:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 660:	2601                	sext.w	a2,a2
 662:	00000517          	auipc	a0,0x0
 666:	48650513          	addi	a0,a0,1158 # ae8 <digits>
 66a:	883a                	mv	a6,a4
 66c:	2705                	addiw	a4,a4,1
 66e:	02c5f7bb          	remuw	a5,a1,a2
 672:	1782                	slli	a5,a5,0x20
 674:	9381                	srli	a5,a5,0x20
 676:	97aa                	add	a5,a5,a0
 678:	0007c783          	lbu	a5,0(a5)
 67c:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 680:	0005879b          	sext.w	a5,a1
 684:	02c5d5bb          	divuw	a1,a1,a2
 688:	0685                	addi	a3,a3,1
 68a:	fec7f0e3          	bgeu	a5,a2,66a <printint+0x2a>
  if(neg)
 68e:	00088b63          	beqz	a7,6a4 <printint+0x64>
    buf[i++] = '-';
 692:	fd040793          	addi	a5,s0,-48
 696:	973e                	add	a4,a4,a5
 698:	02d00793          	li	a5,45
 69c:	fef70823          	sb	a5,-16(a4)
 6a0:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 6a4:	02e05863          	blez	a4,6d4 <printint+0x94>
 6a8:	fc040793          	addi	a5,s0,-64
 6ac:	00e78933          	add	s2,a5,a4
 6b0:	fff78993          	addi	s3,a5,-1
 6b4:	99ba                	add	s3,s3,a4
 6b6:	377d                	addiw	a4,a4,-1
 6b8:	1702                	slli	a4,a4,0x20
 6ba:	9301                	srli	a4,a4,0x20
 6bc:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 6c0:	fff94583          	lbu	a1,-1(s2)
 6c4:	8526                	mv	a0,s1
 6c6:	00000097          	auipc	ra,0x0
 6ca:	f58080e7          	jalr	-168(ra) # 61e <putc>
  while(--i >= 0)
 6ce:	197d                	addi	s2,s2,-1
 6d0:	ff3918e3          	bne	s2,s3,6c0 <printint+0x80>
}
 6d4:	70e2                	ld	ra,56(sp)
 6d6:	7442                	ld	s0,48(sp)
 6d8:	74a2                	ld	s1,40(sp)
 6da:	7902                	ld	s2,32(sp)
 6dc:	69e2                	ld	s3,24(sp)
 6de:	6121                	addi	sp,sp,64
 6e0:	8082                	ret
    x = -xx;
 6e2:	40b005bb          	negw	a1,a1
    neg = 1;
 6e6:	4885                	li	a7,1
    x = -xx;
 6e8:	bf8d                	j	65a <printint+0x1a>

00000000000006ea <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 6ea:	7119                	addi	sp,sp,-128
 6ec:	fc86                	sd	ra,120(sp)
 6ee:	f8a2                	sd	s0,112(sp)
 6f0:	f4a6                	sd	s1,104(sp)
 6f2:	f0ca                	sd	s2,96(sp)
 6f4:	ecce                	sd	s3,88(sp)
 6f6:	e8d2                	sd	s4,80(sp)
 6f8:	e4d6                	sd	s5,72(sp)
 6fa:	e0da                	sd	s6,64(sp)
 6fc:	fc5e                	sd	s7,56(sp)
 6fe:	f862                	sd	s8,48(sp)
 700:	f466                	sd	s9,40(sp)
 702:	f06a                	sd	s10,32(sp)
 704:	ec6e                	sd	s11,24(sp)
 706:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 708:	0005c903          	lbu	s2,0(a1)
 70c:	18090f63          	beqz	s2,8aa <vprintf+0x1c0>
 710:	8aaa                	mv	s5,a0
 712:	8b32                	mv	s6,a2
 714:	00158493          	addi	s1,a1,1
  state = 0;
 718:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 71a:	02500a13          	li	s4,37
      if(c == 'd'){
 71e:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 722:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 726:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 72a:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 72e:	00000b97          	auipc	s7,0x0
 732:	3bab8b93          	addi	s7,s7,954 # ae8 <digits>
 736:	a839                	j	754 <vprintf+0x6a>
        putc(fd, c);
 738:	85ca                	mv	a1,s2
 73a:	8556                	mv	a0,s5
 73c:	00000097          	auipc	ra,0x0
 740:	ee2080e7          	jalr	-286(ra) # 61e <putc>
 744:	a019                	j	74a <vprintf+0x60>
    } else if(state == '%'){
 746:	01498f63          	beq	s3,s4,764 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 74a:	0485                	addi	s1,s1,1
 74c:	fff4c903          	lbu	s2,-1(s1)
 750:	14090d63          	beqz	s2,8aa <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 754:	0009079b          	sext.w	a5,s2
    if(state == 0){
 758:	fe0997e3          	bnez	s3,746 <vprintf+0x5c>
      if(c == '%'){
 75c:	fd479ee3          	bne	a5,s4,738 <vprintf+0x4e>
        state = '%';
 760:	89be                	mv	s3,a5
 762:	b7e5                	j	74a <vprintf+0x60>
      if(c == 'd'){
 764:	05878063          	beq	a5,s8,7a4 <vprintf+0xba>
      } else if(c == 'l') {
 768:	05978c63          	beq	a5,s9,7c0 <vprintf+0xd6>
      } else if(c == 'x') {
 76c:	07a78863          	beq	a5,s10,7dc <vprintf+0xf2>
      } else if(c == 'p') {
 770:	09b78463          	beq	a5,s11,7f8 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 774:	07300713          	li	a4,115
 778:	0ce78663          	beq	a5,a4,844 <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 77c:	06300713          	li	a4,99
 780:	0ee78e63          	beq	a5,a4,87c <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 784:	11478863          	beq	a5,s4,894 <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 788:	85d2                	mv	a1,s4
 78a:	8556                	mv	a0,s5
 78c:	00000097          	auipc	ra,0x0
 790:	e92080e7          	jalr	-366(ra) # 61e <putc>
        putc(fd, c);
 794:	85ca                	mv	a1,s2
 796:	8556                	mv	a0,s5
 798:	00000097          	auipc	ra,0x0
 79c:	e86080e7          	jalr	-378(ra) # 61e <putc>
      }
      state = 0;
 7a0:	4981                	li	s3,0
 7a2:	b765                	j	74a <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 7a4:	008b0913          	addi	s2,s6,8
 7a8:	4685                	li	a3,1
 7aa:	4629                	li	a2,10
 7ac:	000b2583          	lw	a1,0(s6)
 7b0:	8556                	mv	a0,s5
 7b2:	00000097          	auipc	ra,0x0
 7b6:	e8e080e7          	jalr	-370(ra) # 640 <printint>
 7ba:	8b4a                	mv	s6,s2
      state = 0;
 7bc:	4981                	li	s3,0
 7be:	b771                	j	74a <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 7c0:	008b0913          	addi	s2,s6,8
 7c4:	4681                	li	a3,0
 7c6:	4629                	li	a2,10
 7c8:	000b2583          	lw	a1,0(s6)
 7cc:	8556                	mv	a0,s5
 7ce:	00000097          	auipc	ra,0x0
 7d2:	e72080e7          	jalr	-398(ra) # 640 <printint>
 7d6:	8b4a                	mv	s6,s2
      state = 0;
 7d8:	4981                	li	s3,0
 7da:	bf85                	j	74a <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 7dc:	008b0913          	addi	s2,s6,8
 7e0:	4681                	li	a3,0
 7e2:	4641                	li	a2,16
 7e4:	000b2583          	lw	a1,0(s6)
 7e8:	8556                	mv	a0,s5
 7ea:	00000097          	auipc	ra,0x0
 7ee:	e56080e7          	jalr	-426(ra) # 640 <printint>
 7f2:	8b4a                	mv	s6,s2
      state = 0;
 7f4:	4981                	li	s3,0
 7f6:	bf91                	j	74a <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 7f8:	008b0793          	addi	a5,s6,8
 7fc:	f8f43423          	sd	a5,-120(s0)
 800:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 804:	03000593          	li	a1,48
 808:	8556                	mv	a0,s5
 80a:	00000097          	auipc	ra,0x0
 80e:	e14080e7          	jalr	-492(ra) # 61e <putc>
  putc(fd, 'x');
 812:	85ea                	mv	a1,s10
 814:	8556                	mv	a0,s5
 816:	00000097          	auipc	ra,0x0
 81a:	e08080e7          	jalr	-504(ra) # 61e <putc>
 81e:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 820:	03c9d793          	srli	a5,s3,0x3c
 824:	97de                	add	a5,a5,s7
 826:	0007c583          	lbu	a1,0(a5)
 82a:	8556                	mv	a0,s5
 82c:	00000097          	auipc	ra,0x0
 830:	df2080e7          	jalr	-526(ra) # 61e <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 834:	0992                	slli	s3,s3,0x4
 836:	397d                	addiw	s2,s2,-1
 838:	fe0914e3          	bnez	s2,820 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 83c:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 840:	4981                	li	s3,0
 842:	b721                	j	74a <vprintf+0x60>
        s = va_arg(ap, char*);
 844:	008b0993          	addi	s3,s6,8
 848:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 84c:	02090163          	beqz	s2,86e <vprintf+0x184>
        while(*s != 0){
 850:	00094583          	lbu	a1,0(s2)
 854:	c9a1                	beqz	a1,8a4 <vprintf+0x1ba>
          putc(fd, *s);
 856:	8556                	mv	a0,s5
 858:	00000097          	auipc	ra,0x0
 85c:	dc6080e7          	jalr	-570(ra) # 61e <putc>
          s++;
 860:	0905                	addi	s2,s2,1
        while(*s != 0){
 862:	00094583          	lbu	a1,0(s2)
 866:	f9e5                	bnez	a1,856 <vprintf+0x16c>
        s = va_arg(ap, char*);
 868:	8b4e                	mv	s6,s3
      state = 0;
 86a:	4981                	li	s3,0
 86c:	bdf9                	j	74a <vprintf+0x60>
          s = "(null)";
 86e:	00000917          	auipc	s2,0x0
 872:	27290913          	addi	s2,s2,626 # ae0 <malloc+0x12c>
        while(*s != 0){
 876:	02800593          	li	a1,40
 87a:	bff1                	j	856 <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 87c:	008b0913          	addi	s2,s6,8
 880:	000b4583          	lbu	a1,0(s6)
 884:	8556                	mv	a0,s5
 886:	00000097          	auipc	ra,0x0
 88a:	d98080e7          	jalr	-616(ra) # 61e <putc>
 88e:	8b4a                	mv	s6,s2
      state = 0;
 890:	4981                	li	s3,0
 892:	bd65                	j	74a <vprintf+0x60>
        putc(fd, c);
 894:	85d2                	mv	a1,s4
 896:	8556                	mv	a0,s5
 898:	00000097          	auipc	ra,0x0
 89c:	d86080e7          	jalr	-634(ra) # 61e <putc>
      state = 0;
 8a0:	4981                	li	s3,0
 8a2:	b565                	j	74a <vprintf+0x60>
        s = va_arg(ap, char*);
 8a4:	8b4e                	mv	s6,s3
      state = 0;
 8a6:	4981                	li	s3,0
 8a8:	b54d                	j	74a <vprintf+0x60>
    }
  }
}
 8aa:	70e6                	ld	ra,120(sp)
 8ac:	7446                	ld	s0,112(sp)
 8ae:	74a6                	ld	s1,104(sp)
 8b0:	7906                	ld	s2,96(sp)
 8b2:	69e6                	ld	s3,88(sp)
 8b4:	6a46                	ld	s4,80(sp)
 8b6:	6aa6                	ld	s5,72(sp)
 8b8:	6b06                	ld	s6,64(sp)
 8ba:	7be2                	ld	s7,56(sp)
 8bc:	7c42                	ld	s8,48(sp)
 8be:	7ca2                	ld	s9,40(sp)
 8c0:	7d02                	ld	s10,32(sp)
 8c2:	6de2                	ld	s11,24(sp)
 8c4:	6109                	addi	sp,sp,128
 8c6:	8082                	ret

00000000000008c8 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 8c8:	715d                	addi	sp,sp,-80
 8ca:	ec06                	sd	ra,24(sp)
 8cc:	e822                	sd	s0,16(sp)
 8ce:	1000                	addi	s0,sp,32
 8d0:	e010                	sd	a2,0(s0)
 8d2:	e414                	sd	a3,8(s0)
 8d4:	e818                	sd	a4,16(s0)
 8d6:	ec1c                	sd	a5,24(s0)
 8d8:	03043023          	sd	a6,32(s0)
 8dc:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 8e0:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 8e4:	8622                	mv	a2,s0
 8e6:	00000097          	auipc	ra,0x0
 8ea:	e04080e7          	jalr	-508(ra) # 6ea <vprintf>
}
 8ee:	60e2                	ld	ra,24(sp)
 8f0:	6442                	ld	s0,16(sp)
 8f2:	6161                	addi	sp,sp,80
 8f4:	8082                	ret

00000000000008f6 <printf>:

void
printf(const char *fmt, ...)
{
 8f6:	711d                	addi	sp,sp,-96
 8f8:	ec06                	sd	ra,24(sp)
 8fa:	e822                	sd	s0,16(sp)
 8fc:	1000                	addi	s0,sp,32
 8fe:	e40c                	sd	a1,8(s0)
 900:	e810                	sd	a2,16(s0)
 902:	ec14                	sd	a3,24(s0)
 904:	f018                	sd	a4,32(s0)
 906:	f41c                	sd	a5,40(s0)
 908:	03043823          	sd	a6,48(s0)
 90c:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 910:	00840613          	addi	a2,s0,8
 914:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 918:	85aa                	mv	a1,a0
 91a:	4505                	li	a0,1
 91c:	00000097          	auipc	ra,0x0
 920:	dce080e7          	jalr	-562(ra) # 6ea <vprintf>
}
 924:	60e2                	ld	ra,24(sp)
 926:	6442                	ld	s0,16(sp)
 928:	6125                	addi	sp,sp,96
 92a:	8082                	ret

000000000000092c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 92c:	1141                	addi	sp,sp,-16
 92e:	e422                	sd	s0,8(sp)
 930:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 932:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 936:	00000797          	auipc	a5,0x0
 93a:	6ca7b783          	ld	a5,1738(a5) # 1000 <freep>
 93e:	a805                	j	96e <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 940:	4618                	lw	a4,8(a2)
 942:	9db9                	addw	a1,a1,a4
 944:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 948:	6398                	ld	a4,0(a5)
 94a:	6318                	ld	a4,0(a4)
 94c:	fee53823          	sd	a4,-16(a0)
 950:	a091                	j	994 <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 952:	ff852703          	lw	a4,-8(a0)
 956:	9e39                	addw	a2,a2,a4
 958:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 95a:	ff053703          	ld	a4,-16(a0)
 95e:	e398                	sd	a4,0(a5)
 960:	a099                	j	9a6 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 962:	6398                	ld	a4,0(a5)
 964:	00e7e463          	bltu	a5,a4,96c <free+0x40>
 968:	00e6ea63          	bltu	a3,a4,97c <free+0x50>
{
 96c:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 96e:	fed7fae3          	bgeu	a5,a3,962 <free+0x36>
 972:	6398                	ld	a4,0(a5)
 974:	00e6e463          	bltu	a3,a4,97c <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 978:	fee7eae3          	bltu	a5,a4,96c <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 97c:	ff852583          	lw	a1,-8(a0)
 980:	6390                	ld	a2,0(a5)
 982:	02059713          	slli	a4,a1,0x20
 986:	9301                	srli	a4,a4,0x20
 988:	0712                	slli	a4,a4,0x4
 98a:	9736                	add	a4,a4,a3
 98c:	fae60ae3          	beq	a2,a4,940 <free+0x14>
    bp->s.ptr = p->s.ptr;
 990:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 994:	4790                	lw	a2,8(a5)
 996:	02061713          	slli	a4,a2,0x20
 99a:	9301                	srli	a4,a4,0x20
 99c:	0712                	slli	a4,a4,0x4
 99e:	973e                	add	a4,a4,a5
 9a0:	fae689e3          	beq	a3,a4,952 <free+0x26>
  } else
    p->s.ptr = bp;
 9a4:	e394                	sd	a3,0(a5)
  freep = p;
 9a6:	00000717          	auipc	a4,0x0
 9aa:	64f73d23          	sd	a5,1626(a4) # 1000 <freep>
}
 9ae:	6422                	ld	s0,8(sp)
 9b0:	0141                	addi	sp,sp,16
 9b2:	8082                	ret

00000000000009b4 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 9b4:	7139                	addi	sp,sp,-64
 9b6:	fc06                	sd	ra,56(sp)
 9b8:	f822                	sd	s0,48(sp)
 9ba:	f426                	sd	s1,40(sp)
 9bc:	f04a                	sd	s2,32(sp)
 9be:	ec4e                	sd	s3,24(sp)
 9c0:	e852                	sd	s4,16(sp)
 9c2:	e456                	sd	s5,8(sp)
 9c4:	e05a                	sd	s6,0(sp)
 9c6:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9c8:	02051493          	slli	s1,a0,0x20
 9cc:	9081                	srli	s1,s1,0x20
 9ce:	04bd                	addi	s1,s1,15
 9d0:	8091                	srli	s1,s1,0x4
 9d2:	0014899b          	addiw	s3,s1,1
 9d6:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 9d8:	00000517          	auipc	a0,0x0
 9dc:	62853503          	ld	a0,1576(a0) # 1000 <freep>
 9e0:	c515                	beqz	a0,a0c <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9e2:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 9e4:	4798                	lw	a4,8(a5)
 9e6:	02977f63          	bgeu	a4,s1,a24 <malloc+0x70>
 9ea:	8a4e                	mv	s4,s3
 9ec:	0009871b          	sext.w	a4,s3
 9f0:	6685                	lui	a3,0x1
 9f2:	00d77363          	bgeu	a4,a3,9f8 <malloc+0x44>
 9f6:	6a05                	lui	s4,0x1
 9f8:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 9fc:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 a00:	00000917          	auipc	s2,0x0
 a04:	60090913          	addi	s2,s2,1536 # 1000 <freep>
  if(p == (char*)-1)
 a08:	5afd                	li	s5,-1
 a0a:	a88d                	j	a7c <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 a0c:	00001797          	auipc	a5,0x1
 a10:	a0478793          	addi	a5,a5,-1532 # 1410 <base>
 a14:	00000717          	auipc	a4,0x0
 a18:	5ef73623          	sd	a5,1516(a4) # 1000 <freep>
 a1c:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 a1e:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 a22:	b7e1                	j	9ea <malloc+0x36>
      if(p->s.size == nunits)
 a24:	02e48b63          	beq	s1,a4,a5a <malloc+0xa6>
        p->s.size -= nunits;
 a28:	4137073b          	subw	a4,a4,s3
 a2c:	c798                	sw	a4,8(a5)
        p += p->s.size;
 a2e:	1702                	slli	a4,a4,0x20
 a30:	9301                	srli	a4,a4,0x20
 a32:	0712                	slli	a4,a4,0x4
 a34:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 a36:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 a3a:	00000717          	auipc	a4,0x0
 a3e:	5ca73323          	sd	a0,1478(a4) # 1000 <freep>
      return (void*)(p + 1);
 a42:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a46:	70e2                	ld	ra,56(sp)
 a48:	7442                	ld	s0,48(sp)
 a4a:	74a2                	ld	s1,40(sp)
 a4c:	7902                	ld	s2,32(sp)
 a4e:	69e2                	ld	s3,24(sp)
 a50:	6a42                	ld	s4,16(sp)
 a52:	6aa2                	ld	s5,8(sp)
 a54:	6b02                	ld	s6,0(sp)
 a56:	6121                	addi	sp,sp,64
 a58:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 a5a:	6398                	ld	a4,0(a5)
 a5c:	e118                	sd	a4,0(a0)
 a5e:	bff1                	j	a3a <malloc+0x86>
  hp->s.size = nu;
 a60:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 a64:	0541                	addi	a0,a0,16
 a66:	00000097          	auipc	ra,0x0
 a6a:	ec6080e7          	jalr	-314(ra) # 92c <free>
  return freep;
 a6e:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 a72:	d971                	beqz	a0,a46 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a74:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 a76:	4798                	lw	a4,8(a5)
 a78:	fa9776e3          	bgeu	a4,s1,a24 <malloc+0x70>
    if(p == freep)
 a7c:	00093703          	ld	a4,0(s2)
 a80:	853e                	mv	a0,a5
 a82:	fef719e3          	bne	a4,a5,a74 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 a86:	8552                	mv	a0,s4
 a88:	00000097          	auipc	ra,0x0
 a8c:	b4e080e7          	jalr	-1202(ra) # 5d6 <sbrk>
  if(p == (char*)-1)
 a90:	fd5518e3          	bne	a0,s5,a60 <malloc+0xac>
        return 0;
 a94:	4501                	li	a0,0
 a96:	bf45                	j	a46 <malloc+0x92>
