
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4 0f                	in     $0xf,%al

8010000c <entry>:

# Entering xv6 on boot processor, with paging off.
.globl entry
entry:
  # Turn on page size extension for 4Mbyte pages
  movl    %cr4, %eax
8010000c:	0f 20 e0             	mov    %cr4,%eax
  orl     $(CR4_PSE), %eax
8010000f:	83 c8 10             	or     $0x10,%eax
  movl    %eax, %cr4
80100012:	0f 22 e0             	mov    %eax,%cr4
  # Set page directory
  movl    $(V2P_WO(entrypgdir)), %eax
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
  movl    %eax, %cr3
8010001a:	0f 22 d8             	mov    %eax,%cr3
  # Turn on paging.
  movl    %cr0, %eax
8010001d:	0f 20 c0             	mov    %cr0,%eax
  orl     $(CR0_PG|CR0_WP), %eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
  movl    %eax, %cr0
80100025:	0f 22 c0             	mov    %eax,%cr0

  # Set up the stack pointer.
  movl $(stack + KSTACKSIZE), %esp
80100028:	bc b0 b5 10 80       	mov    $0x8010b5b0,%esp

  # Jump to main(), and switch to executing at
  # high addresses. The indirect call is needed because
  # the assembler produces a PC-relative instruction
  # for a direct jump.
  mov $main, %eax
8010002d:	b8 50 2e 10 80       	mov    $0x80102e50,%eax
  jmp *%eax
80100032:	ff e0                	jmp    *%eax
	...

80100040 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100044:	bb f4 b5 10 80       	mov    $0x8010b5f4,%ebx
  struct buf head;
} bcache;

void
binit(void)
{
80100049:	83 ec 14             	sub    $0x14,%esp
  struct buf *b;

  initlock(&bcache.lock, "bcache");
8010004c:	c7 44 24 04 40 6d 10 	movl   $0x80106d40,0x4(%esp)
80100053:	80 
80100054:	c7 04 24 c0 b5 10 80 	movl   $0x8010b5c0,(%esp)
8010005b:	e8 b0 40 00 00       	call   80104110 <initlock>

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
80100060:	ba bc fc 10 80       	mov    $0x8010fcbc,%edx

  initlock(&bcache.lock, "bcache");

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
80100065:	c7 05 0c fd 10 80 bc 	movl   $0x8010fcbc,0x8010fd0c
8010006c:	fc 10 80 
  bcache.head.next = &bcache.head;
8010006f:	c7 05 10 fd 10 80 bc 	movl   $0x8010fcbc,0x8010fd10
80100076:	fc 10 80 
80100079:	eb 09                	jmp    80100084 <binit+0x44>
8010007b:	90                   	nop
8010007c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100080:	89 da                	mov    %ebx,%edx
80100082:	89 c3                	mov    %eax,%ebx
    b->next = bcache.head.next;
80100084:	89 53 54             	mov    %edx,0x54(%ebx)
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
80100087:	8d 43 0c             	lea    0xc(%ebx),%eax
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    b->next = bcache.head.next;
    b->prev = &bcache.head;
8010008a:	c7 43 50 bc fc 10 80 	movl   $0x8010fcbc,0x50(%ebx)
    initsleeplock(&b->lock, "buffer");
80100091:	89 04 24             	mov    %eax,(%esp)
80100094:	c7 44 24 04 47 6d 10 	movl   $0x80106d47,0x4(%esp)
8010009b:	80 
8010009c:	e8 3f 3f 00 00       	call   80103fe0 <initsleeplock>
    bcache.head.next->prev = b;
801000a1:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
801000a6:	89 58 50             	mov    %ebx,0x50(%eax)

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000a9:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
801000af:	3d bc fc 10 80       	cmp    $0x8010fcbc,%eax
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
    bcache.head.next = b;
801000b4:	89 1d 10 fd 10 80    	mov    %ebx,0x8010fd10

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000ba:	72 c4                	jb     80100080 <binit+0x40>
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
    bcache.head.next = b;
  }
}
801000bc:	83 c4 14             	add    $0x14,%esp
801000bf:	5b                   	pop    %ebx
801000c0:	5d                   	pop    %ebp
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
}

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 1c             	sub    $0x1c,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
static struct buf*
bget(uint dev, uint blockno)
{
  struct buf *b;

  acquire(&bcache.lock);
801000df:	c7 04 24 c0 b5 10 80 	movl   $0x8010b5c0,(%esp)
801000e6:	e8 95 41 00 00       	call   80104280 <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
801000eb:	8b 1d 10 fd 10 80    	mov    0x8010fd10,%ebx
801000f1:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
801000f7:	75 12                	jne    8010010b <bread+0x3b>
801000f9:	eb 25                	jmp    80100120 <bread+0x50>
801000fb:	90                   	nop
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
    if(b->dev == dev && b->blockno == blockno){
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
      b->refcnt++;
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }

  // Not cached; recycle an unused buffer.
  // Even if refcnt==0, B_DIRTY indicates a buffer is in use
  // because log.c has modified it but not yet committed it.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
80100120:	8b 1d 0c fd 10 80    	mov    0x8010fd0c,%ebx
80100126:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 58                	jmp    80100188 <bread+0xb8>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
80100139:	74 4d                	je     80100188 <bread+0xb8>
    if(b->refcnt == 0 && (b->flags & B_DIRTY) == 0) {
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
      b->dev = dev;
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
      b->blockno = blockno;
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
      b->flags = 0;
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
      b->refcnt = 1;
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
      release(&bcache.lock);
8010015a:	c7 04 24 c0 b5 10 80 	movl   $0x8010b5c0,(%esp)
80100161:	e8 8a 41 00 00       	call   801042f0 <release>
      acquiresleep(&b->lock);
80100166:	8d 43 0c             	lea    0xc(%ebx),%eax
80100169:	89 04 24             	mov    %eax,(%esp)
8010016c:	e8 af 3e 00 00       	call   80104020 <acquiresleep>
bread(uint dev, uint blockno)
{
  struct buf *b;

  b = bget(dev, blockno);
  if((b->flags & B_VALID) == 0) {
80100171:	f6 03 02             	testb  $0x2,(%ebx)
80100174:	75 08                	jne    8010017e <bread+0xae>
    iderw(b);
80100176:	89 1c 24             	mov    %ebx,(%esp)
80100179:	e8 12 20 00 00       	call   80102190 <iderw>
  }
  return b;
}
8010017e:	83 c4 1c             	add    $0x1c,%esp
80100181:	89 d8                	mov    %ebx,%eax
80100183:	5b                   	pop    %ebx
80100184:	5e                   	pop    %esi
80100185:	5f                   	pop    %edi
80100186:	5d                   	pop    %ebp
80100187:	c3                   	ret    
      release(&bcache.lock);
      acquiresleep(&b->lock);
      return b;
    }
  }
  panic("bget: no buffers");
80100188:	c7 04 24 4e 6d 10 80 	movl   $0x80106d4e,(%esp)
8010018f:	e8 dc 01 00 00       	call   80100370 <panic>
80100194:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010019a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801001a0 <bwrite>:
}

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 14             	sub    $0x14,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	89 04 24             	mov    %eax,(%esp)
801001b0:	e8 0b 3f 00 00       	call   801040c0 <holdingsleep>
801001b5:	85 c0                	test   %eax,%eax
801001b7:	74 10                	je     801001c9 <bwrite+0x29>
    panic("bwrite");
  b->flags |= B_DIRTY;
801001b9:	83 0b 04             	orl    $0x4,(%ebx)
  iderw(b);
801001bc:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801001bf:	83 c4 14             	add    $0x14,%esp
801001c2:	5b                   	pop    %ebx
801001c3:	5d                   	pop    %ebp
bwrite(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("bwrite");
  b->flags |= B_DIRTY;
  iderw(b);
801001c4:	e9 c7 1f 00 00       	jmp    80102190 <iderw>
// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("bwrite");
801001c9:	c7 04 24 5f 6d 10 80 	movl   $0x80106d5f,(%esp)
801001d0:	e8 9b 01 00 00       	call   80100370 <panic>
801001d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:

// Release a locked buffer.
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	83 ec 10             	sub    $0x10,%esp
801001e8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	89 34 24             	mov    %esi,(%esp)
801001f1:	e8 ca 3e 00 00       	call   801040c0 <holdingsleep>
801001f6:	85 c0                	test   %eax,%eax
801001f8:	74 62                	je     8010025c <brelse+0x7c>
    panic("brelse");

  releasesleep(&b->lock);
801001fa:	89 34 24             	mov    %esi,(%esp)
801001fd:	e8 7e 3e 00 00       	call   80104080 <releasesleep>

  acquire(&bcache.lock);
80100202:	c7 04 24 c0 b5 10 80 	movl   $0x8010b5c0,(%esp)
80100209:	e8 72 40 00 00       	call   80104280 <acquire>
  b->refcnt--;
8010020e:	8b 43 4c             	mov    0x4c(%ebx),%eax
80100211:	83 e8 01             	sub    $0x1,%eax
  if (b->refcnt == 0) {
80100214:	85 c0                	test   %eax,%eax
    panic("brelse");

  releasesleep(&b->lock);

  acquire(&bcache.lock);
  b->refcnt--;
80100216:	89 43 4c             	mov    %eax,0x4c(%ebx)
  if (b->refcnt == 0) {
80100219:	75 2f                	jne    8010024a <brelse+0x6a>
    // no one is waiting for it.
    b->next->prev = b->prev;
8010021b:	8b 43 54             	mov    0x54(%ebx),%eax
8010021e:	8b 53 50             	mov    0x50(%ebx),%edx
80100221:	89 50 50             	mov    %edx,0x50(%eax)
    b->prev->next = b->next;
80100224:	8b 43 50             	mov    0x50(%ebx),%eax
80100227:	8b 53 54             	mov    0x54(%ebx),%edx
8010022a:	89 50 54             	mov    %edx,0x54(%eax)
    b->next = bcache.head.next;
8010022d:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
    b->prev = &bcache.head;
80100232:	c7 43 50 bc fc 10 80 	movl   $0x8010fcbc,0x50(%ebx)
  b->refcnt--;
  if (b->refcnt == 0) {
    // no one is waiting for it.
    b->next->prev = b->prev;
    b->prev->next = b->next;
    b->next = bcache.head.next;
80100239:	89 43 54             	mov    %eax,0x54(%ebx)
    b->prev = &bcache.head;
    bcache.head.next->prev = b;
8010023c:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
80100241:	89 58 50             	mov    %ebx,0x50(%eax)
    bcache.head.next = b;
80100244:	89 1d 10 fd 10 80    	mov    %ebx,0x8010fd10
  }
  
  release(&bcache.lock);
8010024a:	c7 45 08 c0 b5 10 80 	movl   $0x8010b5c0,0x8(%ebp)
}
80100251:	83 c4 10             	add    $0x10,%esp
80100254:	5b                   	pop    %ebx
80100255:	5e                   	pop    %esi
80100256:	5d                   	pop    %ebp
    b->prev = &bcache.head;
    bcache.head.next->prev = b;
    bcache.head.next = b;
  }
  
  release(&bcache.lock);
80100257:	e9 94 40 00 00       	jmp    801042f0 <release>
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("brelse");
8010025c:	c7 04 24 66 6d 10 80 	movl   $0x80106d66,(%esp)
80100263:	e8 08 01 00 00       	call   80100370 <panic>
	...

80100270 <consoleread>:
  }
}

int
consoleread(struct inode *ip, char *dst, int n)
{
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 2c             	sub    $0x2c,%esp
80100279:	8b 5d 10             	mov    0x10(%ebp),%ebx
8010027c:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027f:	8b 75 0c             	mov    0xc(%ebp),%esi
  uint target;
  int c;

  iunlock(ip);
80100282:	89 3c 24             	mov    %edi,(%esp)
80100285:	e8 f6 14 00 00       	call   80101780 <iunlock>
  target = n;
8010028a:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
  acquire(&cons.lock);
8010028d:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
80100294:	e8 e7 3f 00 00       	call   80104280 <acquire>
  while(n > 0){
80100299:	31 c0                	xor    %eax,%eax
8010029b:	85 db                	test   %ebx,%ebx
8010029d:	7f 29                	jg     801002c8 <consoleread+0x58>
8010029f:	eb 6a                	jmp    8010030b <consoleread+0x9b>
801002a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    while(input.r == input.w){
      if(myproc()->killed){
801002a8:	e8 83 34 00 00       	call   80103730 <myproc>
801002ad:	8b 40 24             	mov    0x24(%eax),%eax
801002b0:	85 c0                	test   %eax,%eax
801002b2:	75 7c                	jne    80100330 <consoleread+0xc0>
        release(&cons.lock);
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
801002b4:	c7 44 24 04 20 a5 10 	movl   $0x8010a520,0x4(%esp)
801002bb:	80 
801002bc:	c7 04 24 a0 ff 10 80 	movl   $0x8010ffa0,(%esp)
801002c3:	e8 c8 39 00 00       	call   80103c90 <sleep>

  iunlock(ip);
  target = n;
  acquire(&cons.lock);
  while(n > 0){
    while(input.r == input.w){
801002c8:	a1 a0 ff 10 80       	mov    0x8010ffa0,%eax
801002cd:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
801002d3:	74 d3                	je     801002a8 <consoleread+0x38>
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
801002d5:	89 c2                	mov    %eax,%edx
801002d7:	83 e2 7f             	and    $0x7f,%edx
801002da:	0f b6 8a 20 ff 10 80 	movzbl -0x7fef00e0(%edx),%ecx
801002e1:	0f be d1             	movsbl %cl,%edx
801002e4:	89 55 dc             	mov    %edx,-0x24(%ebp)
801002e7:	8d 50 01             	lea    0x1(%eax),%edx
    if(c == C('D')){  // EOF
801002ea:	83 7d dc 04          	cmpl   $0x4,-0x24(%ebp)
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
801002ee:	89 15 a0 ff 10 80    	mov    %edx,0x8010ffa0
    if(c == C('D')){  // EOF
801002f4:	74 5b                	je     80100351 <consoleread+0xe1>
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
801002f6:	88 0e                	mov    %cl,(%esi)
    --n;
801002f8:	83 eb 01             	sub    $0x1,%ebx
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
801002fb:	83 c6 01             	add    $0x1,%esi
    --n;
    if(c == '\n')
801002fe:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
80100302:	74 57                	je     8010035b <consoleread+0xeb>
  int c;

  iunlock(ip);
  target = n;
  acquire(&cons.lock);
  while(n > 0){
80100304:	85 db                	test   %ebx,%ebx
80100306:	75 c0                	jne    801002c8 <consoleread+0x58>
80100308:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    *dst++ = c;
    --n;
    if(c == '\n')
      break;
  }
  release(&cons.lock);
8010030b:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010030e:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
80100315:	e8 d6 3f 00 00       	call   801042f0 <release>
  ilock(ip);
8010031a:	89 3c 24             	mov    %edi,(%esp)
8010031d:	e8 7e 13 00 00       	call   801016a0 <ilock>
80100322:	8b 45 e0             	mov    -0x20(%ebp),%eax

  return target - n;
}
80100325:	83 c4 2c             	add    $0x2c,%esp
80100328:	5b                   	pop    %ebx
80100329:	5e                   	pop    %esi
8010032a:	5f                   	pop    %edi
8010032b:	5d                   	pop    %ebp
8010032c:	c3                   	ret    
8010032d:	8d 76 00             	lea    0x0(%esi),%esi
  target = n;
  acquire(&cons.lock);
  while(n > 0){
    while(input.r == input.w){
      if(myproc()->killed){
        release(&cons.lock);
80100330:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
80100337:	e8 b4 3f 00 00       	call   801042f0 <release>
        ilock(ip);
8010033c:	89 3c 24             	mov    %edi,(%esp)
8010033f:	e8 5c 13 00 00       	call   801016a0 <ilock>
  }
  release(&cons.lock);
  ilock(ip);

  return target - n;
}
80100344:	83 c4 2c             	add    $0x2c,%esp
  while(n > 0){
    while(input.r == input.w){
      if(myproc()->killed){
        release(&cons.lock);
        ilock(ip);
        return -1;
80100347:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&cons.lock);
  ilock(ip);

  return target - n;
}
8010034c:	5b                   	pop    %ebx
8010034d:	5e                   	pop    %esi
8010034e:	5f                   	pop    %edi
8010034f:	5d                   	pop    %ebp
80100350:	c3                   	ret    
      }
      sleep(&input.r, &cons.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
    if(c == C('D')){  // EOF
      if(n < target){
80100351:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
80100354:	76 05                	jbe    8010035b <consoleread+0xeb>
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        input.r--;
80100356:	a3 a0 ff 10 80       	mov    %eax,0x8010ffa0
8010035b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010035e:	29 d8                	sub    %ebx,%eax
80100360:	eb a9                	jmp    8010030b <consoleread+0x9b>
80100362:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100369:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100370 <panic>:
    release(&cons.lock);
}

void
panic(char *s)
{
80100370:	55                   	push   %ebp
80100371:	89 e5                	mov    %esp,%ebp
80100373:	56                   	push   %esi
80100374:	53                   	push   %ebx
80100375:	83 ec 40             	sub    $0x40,%esp
  int i;
  uint pcs[10];

  cli();
  cons.locking = 0;
80100378:	c7 05 54 a5 10 80 00 	movl   $0x0,0x8010a554
8010037f:	00 00 00 
}

static inline void
cli(void)
{
  asm volatile("cli");
80100382:	fa                   	cli    
  // use lapiccpunum so that we can call panic from mycpu()
  cprintf("lapicid %d: panic: ", lapicid());
80100383:	e8 68 23 00 00       	call   801026f0 <lapicid>
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
80100388:	8d 5d d0             	lea    -0x30(%ebp),%ebx
  uint pcs[10];

  cli();
  cons.locking = 0;
  // use lapiccpunum so that we can call panic from mycpu()
  cprintf("lapicid %d: panic: ", lapicid());
8010038b:	c7 04 24 6d 6d 10 80 	movl   $0x80106d6d,(%esp)
  if(locking)
    release(&cons.lock);
}

void
panic(char *s)
80100392:	8d 75 f8             	lea    -0x8(%ebp),%esi
  uint pcs[10];

  cli();
  cons.locking = 0;
  // use lapiccpunum so that we can call panic from mycpu()
  cprintf("lapicid %d: panic: ", lapicid());
80100395:	89 44 24 04          	mov    %eax,0x4(%esp)
80100399:	e8 b2 02 00 00       	call   80100650 <cprintf>
  cprintf(s);
8010039e:	8b 45 08             	mov    0x8(%ebp),%eax
801003a1:	89 04 24             	mov    %eax,(%esp)
801003a4:	e8 a7 02 00 00       	call   80100650 <cprintf>
  cprintf("\n");
801003a9:	c7 04 24 97 76 10 80 	movl   $0x80107697,(%esp)
801003b0:	e8 9b 02 00 00       	call   80100650 <cprintf>
  getcallerpcs(&s, pcs);
801003b5:	8d 45 08             	lea    0x8(%ebp),%eax
801003b8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
801003bc:	89 04 24             	mov    %eax,(%esp)
801003bf:	e8 6c 3d 00 00       	call   80104130 <getcallerpcs>
801003c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i=0; i<10; i++)
    cprintf(" %p", pcs[i]);
801003c8:	8b 03                	mov    (%ebx),%eax
801003ca:	83 c3 04             	add    $0x4,%ebx
801003cd:	c7 04 24 81 6d 10 80 	movl   $0x80106d81,(%esp)
801003d4:	89 44 24 04          	mov    %eax,0x4(%esp)
801003d8:	e8 73 02 00 00       	call   80100650 <cprintf>
  // use lapiccpunum so that we can call panic from mycpu()
  cprintf("lapicid %d: panic: ", lapicid());
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
  for(i=0; i<10; i++)
801003dd:	39 f3                	cmp    %esi,%ebx
801003df:	75 e7                	jne    801003c8 <panic+0x58>
    cprintf(" %p", pcs[i]);
  panicked = 1; // freeze other CPU
801003e1:	c7 05 58 a5 10 80 01 	movl   $0x1,0x8010a558
801003e8:	00 00 00 
801003eb:	eb fe                	jmp    801003eb <panic+0x7b>
801003ed:	8d 76 00             	lea    0x0(%esi),%esi

801003f0 <consputc>:
  crt[pos] = ' ' | 0x0700;
}

void
consputc(int c)
{
801003f0:	55                   	push   %ebp
801003f1:	89 e5                	mov    %esp,%ebp
801003f3:	57                   	push   %edi
801003f4:	56                   	push   %esi
801003f5:	89 c6                	mov    %eax,%esi
801003f7:	53                   	push   %ebx
801003f8:	83 ec 1c             	sub    $0x1c,%esp
  if(panicked){
801003fb:	8b 15 58 a5 10 80    	mov    0x8010a558,%edx
80100401:	85 d2                	test   %edx,%edx
80100403:	74 03                	je     80100408 <consputc+0x18>
80100405:	fa                   	cli    
80100406:	eb fe                	jmp    80100406 <consputc+0x16>
    cli();
    for(;;)
      ;
  }

  if(c == BACKSPACE){
80100408:	3d 00 01 00 00       	cmp    $0x100,%eax
8010040d:	0f 84 ac 00 00 00    	je     801004bf <consputc+0xcf>
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else
    uartputc(c);
80100413:	89 04 24             	mov    %eax,(%esp)
80100416:	e8 75 54 00 00       	call   80105890 <uartputc>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010041b:	b9 d4 03 00 00       	mov    $0x3d4,%ecx
80100420:	b8 0e 00 00 00       	mov    $0xe,%eax
80100425:	89 ca                	mov    %ecx,%edx
80100427:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80100428:	bf d5 03 00 00       	mov    $0x3d5,%edi
8010042d:	89 fa                	mov    %edi,%edx
8010042f:	ec                   	in     (%dx),%al
{
  int pos;

  // Cursor position: col + 80*row.
  outb(CRTPORT, 14);
  pos = inb(CRTPORT+1) << 8;
80100430:	0f b6 d8             	movzbl %al,%ebx
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100433:	89 ca                	mov    %ecx,%edx
80100435:	c1 e3 08             	shl    $0x8,%ebx
80100438:	b8 0f 00 00 00       	mov    $0xf,%eax
8010043d:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010043e:	89 fa                	mov    %edi,%edx
80100440:	ec                   	in     (%dx),%al
  outb(CRTPORT, 15);
  pos |= inb(CRTPORT+1);
80100441:	0f b6 c0             	movzbl %al,%eax
80100444:	09 c3                	or     %eax,%ebx

  if(c == '\n')
80100446:	83 fe 0a             	cmp    $0xa,%esi
80100449:	0f 84 fd 00 00 00    	je     8010054c <consputc+0x15c>
    pos += 80 - pos%80;
  else if(c == BACKSPACE){
8010044f:	81 fe 00 01 00 00    	cmp    $0x100,%esi
80100455:	0f 84 e3 00 00 00    	je     8010053e <consputc+0x14e>
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
8010045b:	66 81 e6 ff 00       	and    $0xff,%si
80100460:	66 81 ce 00 07       	or     $0x700,%si
80100465:	66 89 b4 1b 00 80 0b 	mov    %si,-0x7ff48000(%ebx,%ebx,1)
8010046c:	80 
8010046d:	83 c3 01             	add    $0x1,%ebx

  if(pos < 0 || pos > 25*80)
80100470:	81 fb d0 07 00 00    	cmp    $0x7d0,%ebx
80100476:	0f 87 b6 00 00 00    	ja     80100532 <consputc+0x142>
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
8010047c:	81 fb 7f 07 00 00    	cmp    $0x77f,%ebx
80100482:	8d b4 1b 00 80 0b 80 	lea    -0x7ff48000(%ebx,%ebx,1),%esi
80100489:	7f 5d                	jg     801004e8 <consputc+0xf8>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010048b:	b9 d4 03 00 00       	mov    $0x3d4,%ecx
80100490:	b8 0e 00 00 00       	mov    $0xe,%eax
80100495:	89 ca                	mov    %ecx,%edx
80100497:	ee                   	out    %al,(%dx)
80100498:	bf d5 03 00 00       	mov    $0x3d5,%edi
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
  }

  outb(CRTPORT, 14);
  outb(CRTPORT+1, pos>>8);
8010049d:	89 d8                	mov    %ebx,%eax
8010049f:	c1 f8 08             	sar    $0x8,%eax
801004a2:	89 fa                	mov    %edi,%edx
801004a4:	ee                   	out    %al,(%dx)
801004a5:	b8 0f 00 00 00       	mov    $0xf,%eax
801004aa:	89 ca                	mov    %ecx,%edx
801004ac:	ee                   	out    %al,(%dx)
801004ad:	89 d8                	mov    %ebx,%eax
801004af:	89 fa                	mov    %edi,%edx
801004b1:	ee                   	out    %al,(%dx)
  outb(CRTPORT, 15);
  outb(CRTPORT+1, pos);
  crt[pos] = ' ' | 0x0700;
801004b2:	66 c7 06 20 07       	movw   $0x720,(%esi)
  if(c == BACKSPACE){
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else
    uartputc(c);
  cgaputc(c);
}
801004b7:	83 c4 1c             	add    $0x1c,%esp
801004ba:	5b                   	pop    %ebx
801004bb:	5e                   	pop    %esi
801004bc:	5f                   	pop    %edi
801004bd:	5d                   	pop    %ebp
801004be:	c3                   	ret    
    for(;;)
      ;
  }

  if(c == BACKSPACE){
    uartputc('\b'); uartputc(' '); uartputc('\b');
801004bf:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004c6:	e8 c5 53 00 00       	call   80105890 <uartputc>
801004cb:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004d2:	e8 b9 53 00 00       	call   80105890 <uartputc>
801004d7:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004de:	e8 ad 53 00 00       	call   80105890 <uartputc>
801004e3:	e9 33 ff ff ff       	jmp    8010041b <consputc+0x2b>

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004e8:	c7 44 24 08 60 0e 00 	movl   $0xe60,0x8(%esp)
801004ef:	00 
    pos -= 80;
801004f0:	8d 7b b0             	lea    -0x50(%ebx),%edi

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004f3:	c7 44 24 04 a0 80 0b 	movl   $0x800b80a0,0x4(%esp)
801004fa:	80 
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
801004fb:	8d b4 3f 00 80 0b 80 	lea    -0x7ff48000(%edi,%edi,1),%esi

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80100502:	c7 04 24 00 80 0b 80 	movl   $0x800b8000,(%esp)
80100509:	e8 f2 3e 00 00       	call   80104400 <memmove>
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
8010050e:	b8 d0 07 00 00       	mov    $0x7d0,%eax
80100513:	29 d8                	sub    %ebx,%eax
  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
    pos -= 80;
80100515:	89 fb                	mov    %edi,%ebx
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80100517:	01 c0                	add    %eax,%eax
80100519:	89 44 24 08          	mov    %eax,0x8(%esp)
8010051d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80100524:	00 
80100525:	89 34 24             	mov    %esi,(%esp)
80100528:	e8 13 3e 00 00       	call   80104340 <memset>
8010052d:	e9 59 ff ff ff       	jmp    8010048b <consputc+0x9b>
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");
80100532:	c7 04 24 85 6d 10 80 	movl   $0x80106d85,(%esp)
80100539:	e8 32 fe ff ff       	call   80100370 <panic>
  pos |= inb(CRTPORT+1);

  if(c == '\n')
    pos += 80 - pos%80;
  else if(c == BACKSPACE){
    if(pos > 0) --pos;
8010053e:	31 c0                	xor    %eax,%eax
80100540:	85 db                	test   %ebx,%ebx
80100542:	0f 9f c0             	setg   %al
80100545:	29 c3                	sub    %eax,%ebx
80100547:	e9 24 ff ff ff       	jmp    80100470 <consputc+0x80>
  pos = inb(CRTPORT+1) << 8;
  outb(CRTPORT, 15);
  pos |= inb(CRTPORT+1);

  if(c == '\n')
    pos += 80 - pos%80;
8010054c:	89 d8                	mov    %ebx,%eax
8010054e:	ba 67 66 66 66       	mov    $0x66666667,%edx
80100553:	f7 ea                	imul   %edx
80100555:	c1 ea 05             	shr    $0x5,%edx
80100558:	8d 04 92             	lea    (%edx,%edx,4),%eax
8010055b:	c1 e0 04             	shl    $0x4,%eax
8010055e:	8d 58 50             	lea    0x50(%eax),%ebx
80100561:	e9 0a ff ff ff       	jmp    80100470 <consputc+0x80>
80100566:	8d 76 00             	lea    0x0(%esi),%esi
80100569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100570 <consolewrite>:
  return target - n;
}

int
consolewrite(struct inode *ip, char *buf, int n)
{
80100570:	55                   	push   %ebp
80100571:	89 e5                	mov    %esp,%ebp
80100573:	57                   	push   %edi
80100574:	56                   	push   %esi
80100575:	53                   	push   %ebx
80100576:	83 ec 1c             	sub    $0x1c,%esp
  int i;

  iunlock(ip);
80100579:	8b 45 08             	mov    0x8(%ebp),%eax
  return target - n;
}

int
consolewrite(struct inode *ip, char *buf, int n)
{
8010057c:	8b 75 10             	mov    0x10(%ebp),%esi
8010057f:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  iunlock(ip);
80100582:	89 04 24             	mov    %eax,(%esp)
80100585:	e8 f6 11 00 00       	call   80101780 <iunlock>
  acquire(&cons.lock);
8010058a:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
80100591:	e8 ea 3c 00 00       	call   80104280 <acquire>
  for(i = 0; i < n; i++)
80100596:	85 f6                	test   %esi,%esi
80100598:	7e 16                	jle    801005b0 <consolewrite+0x40>
8010059a:	31 db                	xor    %ebx,%ebx
8010059c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    consputc(buf[i] & 0xff);
801005a0:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
{
  int i;

  iunlock(ip);
  acquire(&cons.lock);
  for(i = 0; i < n; i++)
801005a4:	83 c3 01             	add    $0x1,%ebx
    consputc(buf[i] & 0xff);
801005a7:	e8 44 fe ff ff       	call   801003f0 <consputc>
{
  int i;

  iunlock(ip);
  acquire(&cons.lock);
  for(i = 0; i < n; i++)
801005ac:	39 f3                	cmp    %esi,%ebx
801005ae:	75 f0                	jne    801005a0 <consolewrite+0x30>
    consputc(buf[i] & 0xff);
  release(&cons.lock);
801005b0:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
801005b7:	e8 34 3d 00 00       	call   801042f0 <release>
  ilock(ip);
801005bc:	8b 45 08             	mov    0x8(%ebp),%eax
801005bf:	89 04 24             	mov    %eax,(%esp)
801005c2:	e8 d9 10 00 00       	call   801016a0 <ilock>

  return n;
}
801005c7:	83 c4 1c             	add    $0x1c,%esp
801005ca:	89 f0                	mov    %esi,%eax
801005cc:	5b                   	pop    %ebx
801005cd:	5e                   	pop    %esi
801005ce:	5f                   	pop    %edi
801005cf:	5d                   	pop    %ebp
801005d0:	c3                   	ret    
801005d1:	eb 0d                	jmp    801005e0 <printint>
801005d3:	90                   	nop
801005d4:	90                   	nop
801005d5:	90                   	nop
801005d6:	90                   	nop
801005d7:	90                   	nop
801005d8:	90                   	nop
801005d9:	90                   	nop
801005da:	90                   	nop
801005db:	90                   	nop
801005dc:	90                   	nop
801005dd:	90                   	nop
801005de:	90                   	nop
801005df:	90                   	nop

801005e0 <printint>:
  int locking;
} cons;

static void
printint(int xx, int base, int sign)
{
801005e0:	55                   	push   %ebp
801005e1:	89 e5                	mov    %esp,%ebp
801005e3:	56                   	push   %esi
801005e4:	53                   	push   %ebx
801005e5:	89 d3                	mov    %edx,%ebx
801005e7:	83 ec 10             	sub    $0x10,%esp
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
801005ea:	85 c9                	test   %ecx,%ecx
801005ec:	74 5a                	je     80100648 <printint+0x68>
801005ee:	85 c0                	test   %eax,%eax
801005f0:	79 56                	jns    80100648 <printint+0x68>
    x = -xx;
801005f2:	f7 d8                	neg    %eax
801005f4:	be 01 00 00 00       	mov    $0x1,%esi
  else
    x = xx;

  i = 0;
801005f9:	31 c9                	xor    %ecx,%ecx
801005fb:	eb 05                	jmp    80100602 <printint+0x22>
801005fd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
80100600:	89 d1                	mov    %edx,%ecx
80100602:	31 d2                	xor    %edx,%edx
80100604:	f7 f3                	div    %ebx
80100606:	0f b6 92 b0 6d 10 80 	movzbl -0x7fef9250(%edx),%edx
  }while((x /= base) != 0);
8010060d:	85 c0                	test   %eax,%eax
  else
    x = xx;

  i = 0;
  do{
    buf[i++] = digits[x % base];
8010060f:	88 54 0d e8          	mov    %dl,-0x18(%ebp,%ecx,1)
80100613:	8d 51 01             	lea    0x1(%ecx),%edx
  }while((x /= base) != 0);
80100616:	75 e8                	jne    80100600 <printint+0x20>

  if(sign)
80100618:	85 f6                	test   %esi,%esi
8010061a:	74 08                	je     80100624 <printint+0x44>
    buf[i++] = '-';
8010061c:	c6 44 15 e8 2d       	movb   $0x2d,-0x18(%ebp,%edx,1)
80100621:	8d 51 02             	lea    0x2(%ecx),%edx

  while(--i >= 0)
80100624:	8d 5a ff             	lea    -0x1(%edx),%ebx
80100627:	90                   	nop
    consputc(buf[i]);
80100628:	0f be 44 1d e8       	movsbl -0x18(%ebp,%ebx,1),%eax
  }while((x /= base) != 0);

  if(sign)
    buf[i++] = '-';

  while(--i >= 0)
8010062d:	83 eb 01             	sub    $0x1,%ebx
    consputc(buf[i]);
80100630:	e8 bb fd ff ff       	call   801003f0 <consputc>
  }while((x /= base) != 0);

  if(sign)
    buf[i++] = '-';

  while(--i >= 0)
80100635:	83 fb ff             	cmp    $0xffffffff,%ebx
80100638:	75 ee                	jne    80100628 <printint+0x48>
    consputc(buf[i]);
}
8010063a:	83 c4 10             	add    $0x10,%esp
8010063d:	5b                   	pop    %ebx
8010063e:	5e                   	pop    %esi
8010063f:	5d                   	pop    %ebp
80100640:	c3                   	ret    
80100641:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  uint x;

  if(sign && (sign = xx < 0))
    x = -xx;
  else
    x = xx;
80100648:	31 f6                	xor    %esi,%esi
8010064a:	eb ad                	jmp    801005f9 <printint+0x19>
8010064c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100650 <cprintf>:
//PAGEBREAK: 50

// Print to the console. only understands %d, %x, %p, %s.
void
cprintf(char *fmt, ...)
{
80100650:	55                   	push   %ebp
80100651:	89 e5                	mov    %esp,%ebp
80100653:	57                   	push   %edi
80100654:	56                   	push   %esi
80100655:	53                   	push   %ebx
80100656:	83 ec 2c             	sub    $0x2c,%esp
  int i, c, locking;
  uint *argp;
  char *s;

  locking = cons.locking;
80100659:	8b 3d 54 a5 10 80    	mov    0x8010a554,%edi
  if(locking)
8010065f:	85 ff                	test   %edi,%edi
80100661:	0f 85 39 01 00 00    	jne    801007a0 <cprintf+0x150>
    acquire(&cons.lock);

  if (fmt == 0)
80100667:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010066a:	85 c9                	test   %ecx,%ecx
8010066c:	0f 84 3f 01 00 00    	je     801007b1 <cprintf+0x161>
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100672:	0f b6 01             	movzbl (%ecx),%eax
80100675:	31 db                	xor    %ebx,%ebx
80100677:	8d 75 0c             	lea    0xc(%ebp),%esi
8010067a:	85 c0                	test   %eax,%eax
8010067c:	0f 84 89 00 00 00    	je     8010070b <cprintf+0xbb>
80100682:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80100685:	eb 3c                	jmp    801006c3 <cprintf+0x73>
80100687:	90                   	nop
      continue;
    }
    c = fmt[++i] & 0xff;
    if(c == 0)
      break;
    switch(c){
80100688:	83 fa 25             	cmp    $0x25,%edx
8010068b:	0f 84 f7 00 00 00    	je     80100788 <cprintf+0x138>
80100691:	83 fa 64             	cmp    $0x64,%edx
80100694:	0f 84 ce 00 00 00    	je     80100768 <cprintf+0x118>
    case '%':
      consputc('%');
      break;
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
8010069a:	b8 25 00 00 00       	mov    $0x25,%eax
8010069f:	89 55 e0             	mov    %edx,-0x20(%ebp)
801006a2:	e8 49 fd ff ff       	call   801003f0 <consputc>
      consputc(c);
801006a7:	8b 55 e0             	mov    -0x20(%ebp),%edx
801006aa:	89 d0                	mov    %edx,%eax
801006ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801006b0:	e8 3b fd ff ff       	call   801003f0 <consputc>
801006b5:	8b 4d 08             	mov    0x8(%ebp),%ecx

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006b8:	83 c3 01             	add    $0x1,%ebx
801006bb:	0f b6 04 19          	movzbl (%ecx,%ebx,1),%eax
801006bf:	85 c0                	test   %eax,%eax
801006c1:	74 45                	je     80100708 <cprintf+0xb8>
    if(c != '%'){
801006c3:	83 f8 25             	cmp    $0x25,%eax
801006c6:	75 e8                	jne    801006b0 <cprintf+0x60>
      consputc(c);
      continue;
    }
    c = fmt[++i] & 0xff;
801006c8:	83 c3 01             	add    $0x1,%ebx
801006cb:	0f b6 14 19          	movzbl (%ecx,%ebx,1),%edx
    if(c == 0)
801006cf:	85 d2                	test   %edx,%edx
801006d1:	74 35                	je     80100708 <cprintf+0xb8>
      break;
    switch(c){
801006d3:	83 fa 70             	cmp    $0x70,%edx
801006d6:	74 0f                	je     801006e7 <cprintf+0x97>
801006d8:	7e ae                	jle    80100688 <cprintf+0x38>
801006da:	83 fa 73             	cmp    $0x73,%edx
801006dd:	8d 76 00             	lea    0x0(%esi),%esi
801006e0:	74 46                	je     80100728 <cprintf+0xd8>
801006e2:	83 fa 78             	cmp    $0x78,%edx
801006e5:	75 b3                	jne    8010069a <cprintf+0x4a>
    case 'd':
      printint(*argp++, 10, 1);
      break;
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
801006e7:	8b 06                	mov    (%esi),%eax
801006e9:	31 c9                	xor    %ecx,%ecx
801006eb:	ba 10 00 00 00       	mov    $0x10,%edx

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006f0:	83 c3 01             	add    $0x1,%ebx
    case 'd':
      printint(*argp++, 10, 1);
      break;
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
801006f3:	83 c6 04             	add    $0x4,%esi
801006f6:	e8 e5 fe ff ff       	call   801005e0 <printint>
801006fb:	8b 4d 08             	mov    0x8(%ebp),%ecx

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006fe:	0f b6 04 19          	movzbl (%ecx,%ebx,1),%eax
80100702:	85 c0                	test   %eax,%eax
80100704:	75 bd                	jne    801006c3 <cprintf+0x73>
80100706:	66 90                	xchg   %ax,%ax
80100708:	8b 7d e4             	mov    -0x1c(%ebp),%edi
      consputc(c);
      break;
    }
  }

  if(locking)
8010070b:	85 ff                	test   %edi,%edi
8010070d:	74 0c                	je     8010071b <cprintf+0xcb>
    release(&cons.lock);
8010070f:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
80100716:	e8 d5 3b 00 00       	call   801042f0 <release>
}
8010071b:	83 c4 2c             	add    $0x2c,%esp
8010071e:	5b                   	pop    %ebx
8010071f:	5e                   	pop    %esi
80100720:	5f                   	pop    %edi
80100721:	5d                   	pop    %ebp
80100722:	c3                   	ret    
80100723:	90                   	nop
80100724:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
80100728:	8b 16                	mov    (%esi),%edx
        s = "(null)";
8010072a:	b8 98 6d 10 80       	mov    $0x80106d98,%eax
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
8010072f:	83 c6 04             	add    $0x4,%esi
        s = "(null)";
80100732:	85 d2                	test   %edx,%edx
80100734:	0f 44 d0             	cmove  %eax,%edx
      for(; *s; s++)
80100737:	0f b6 02             	movzbl (%edx),%eax
8010073a:	84 c0                	test   %al,%al
8010073c:	0f 84 76 ff ff ff    	je     801006b8 <cprintf+0x68>
80100742:	89 f7                	mov    %esi,%edi
80100744:	89 de                	mov    %ebx,%esi
80100746:	89 d3                	mov    %edx,%ebx
        consputc(*s);
80100748:	0f be c0             	movsbl %al,%eax
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
        s = "(null)";
      for(; *s; s++)
8010074b:	83 c3 01             	add    $0x1,%ebx
        consputc(*s);
8010074e:	e8 9d fc ff ff       	call   801003f0 <consputc>
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
        s = "(null)";
      for(; *s; s++)
80100753:	0f b6 03             	movzbl (%ebx),%eax
80100756:	84 c0                	test   %al,%al
80100758:	75 ee                	jne    80100748 <cprintf+0xf8>
8010075a:	89 f3                	mov    %esi,%ebx
8010075c:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010075f:	89 fe                	mov    %edi,%esi
80100761:	e9 52 ff ff ff       	jmp    801006b8 <cprintf+0x68>
80100766:	66 90                	xchg   %ax,%ax
    c = fmt[++i] & 0xff;
    if(c == 0)
      break;
    switch(c){
    case 'd':
      printint(*argp++, 10, 1);
80100768:	8b 06                	mov    (%esi),%eax
8010076a:	b9 01 00 00 00       	mov    $0x1,%ecx
8010076f:	ba 0a 00 00 00       	mov    $0xa,%edx
80100774:	83 c6 04             	add    $0x4,%esi
80100777:	e8 64 fe ff ff       	call   801005e0 <printint>
8010077c:	8b 4d 08             	mov    0x8(%ebp),%ecx
      break;
8010077f:	e9 34 ff ff ff       	jmp    801006b8 <cprintf+0x68>
80100784:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = "(null)";
      for(; *s; s++)
        consputc(*s);
      break;
    case '%':
      consputc('%');
80100788:	b8 25 00 00 00       	mov    $0x25,%eax
8010078d:	e8 5e fc ff ff       	call   801003f0 <consputc>
80100792:	8b 4d 08             	mov    0x8(%ebp),%ecx
      break;
80100795:	e9 1e ff ff ff       	jmp    801006b8 <cprintf+0x68>
8010079a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  uint *argp;
  char *s;

  locking = cons.locking;
  if(locking)
    acquire(&cons.lock);
801007a0:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
801007a7:	e8 d4 3a 00 00       	call   80104280 <acquire>
801007ac:	e9 b6 fe ff ff       	jmp    80100667 <cprintf+0x17>

  if (fmt == 0)
    panic("null fmt");
801007b1:	c7 04 24 9f 6d 10 80 	movl   $0x80106d9f,(%esp)
801007b8:	e8 b3 fb ff ff       	call   80100370 <panic>
801007bd:	8d 76 00             	lea    0x0(%esi),%esi

801007c0 <consoleintr>:

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
801007c0:	55                   	push   %ebp
801007c1:	89 e5                	mov    %esp,%ebp
801007c3:	57                   	push   %edi
  int c, doprocdump = 0;
801007c4:	31 ff                	xor    %edi,%edi

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
801007c6:	56                   	push   %esi
801007c7:	53                   	push   %ebx
801007c8:	83 ec 1c             	sub    $0x1c,%esp
801007cb:	8b 75 08             	mov    0x8(%ebp),%esi
  int c, doprocdump = 0;

  acquire(&cons.lock);
801007ce:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
801007d5:	e8 a6 3a 00 00       	call   80104280 <acquire>
801007da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  while((c = getc()) >= 0){
801007e0:	ff d6                	call   *%esi
801007e2:	85 c0                	test   %eax,%eax
801007e4:	89 c3                	mov    %eax,%ebx
801007e6:	0f 88 8c 00 00 00    	js     80100878 <consoleintr+0xb8>
    switch(c){
801007ec:	83 fb 10             	cmp    $0x10,%ebx
801007ef:	90                   	nop
801007f0:	0f 84 da 00 00 00    	je     801008d0 <consoleintr+0x110>
801007f6:	0f 8f 9c 00 00 00    	jg     80100898 <consoleintr+0xd8>
801007fc:	83 fb 08             	cmp    $0x8,%ebx
801007ff:	90                   	nop
80100800:	0f 84 a0 00 00 00    	je     801008a6 <consoleintr+0xe6>
        input.e--;
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
80100806:	85 db                	test   %ebx,%ebx
80100808:	74 d6                	je     801007e0 <consoleintr+0x20>
8010080a:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
8010080f:	89 c2                	mov    %eax,%edx
80100811:	2b 15 a0 ff 10 80    	sub    0x8010ffa0,%edx
80100817:	83 fa 7f             	cmp    $0x7f,%edx
8010081a:	77 c4                	ja     801007e0 <consoleintr+0x20>
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
8010081c:	89 c2                	mov    %eax,%edx
8010081e:	83 e2 7f             	and    $0x7f,%edx
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
80100821:	83 fb 0d             	cmp    $0xd,%ebx
80100824:	0f 84 12 01 00 00    	je     8010093c <consoleintr+0x17c>
        input.buf[input.e++ % INPUT_BUF] = c;
8010082a:	83 c0 01             	add    $0x1,%eax
8010082d:	88 9a 20 ff 10 80    	mov    %bl,-0x7fef00e0(%edx)
80100833:	a3 a8 ff 10 80       	mov    %eax,0x8010ffa8
        consputc(c);
80100838:	89 d8                	mov    %ebx,%eax
8010083a:	e8 b1 fb ff ff       	call   801003f0 <consputc>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
8010083f:	83 fb 04             	cmp    $0x4,%ebx
80100842:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
80100847:	74 12                	je     8010085b <consoleintr+0x9b>
80100849:	83 fb 0a             	cmp    $0xa,%ebx
8010084c:	74 0d                	je     8010085b <consoleintr+0x9b>
8010084e:	8b 15 a0 ff 10 80    	mov    0x8010ffa0,%edx
80100854:	83 ea 80             	sub    $0xffffff80,%edx
80100857:	39 d0                	cmp    %edx,%eax
80100859:	75 85                	jne    801007e0 <consoleintr+0x20>
          input.w = input.e;
8010085b:	a3 a4 ff 10 80       	mov    %eax,0x8010ffa4
          wakeup(&input.r);
80100860:	c7 04 24 a0 ff 10 80 	movl   $0x8010ffa0,(%esp)
80100867:	e8 c4 35 00 00       	call   80103e30 <wakeup>
consoleintr(int (*getc)(void))
{
  int c, doprocdump = 0;

  acquire(&cons.lock);
  while((c = getc()) >= 0){
8010086c:	ff d6                	call   *%esi
8010086e:	85 c0                	test   %eax,%eax
80100870:	89 c3                	mov    %eax,%ebx
80100872:	0f 89 74 ff ff ff    	jns    801007ec <consoleintr+0x2c>
        }
      }
      break;
    }
  }
  release(&cons.lock);
80100878:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010087f:	e8 6c 3a 00 00       	call   801042f0 <release>
  if(doprocdump) {
80100884:	85 ff                	test   %edi,%edi
80100886:	0f 85 a4 00 00 00    	jne    80100930 <consoleintr+0x170>
    procdump();  // now call procdump() wo. cons.lock held
  }
}
8010088c:	83 c4 1c             	add    $0x1c,%esp
8010088f:	5b                   	pop    %ebx
80100890:	5e                   	pop    %esi
80100891:	5f                   	pop    %edi
80100892:	5d                   	pop    %ebp
80100893:	c3                   	ret    
80100894:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  int c, doprocdump = 0;

  acquire(&cons.lock);
  while((c = getc()) >= 0){
    switch(c){
80100898:	83 fb 15             	cmp    $0x15,%ebx
8010089b:	74 43                	je     801008e0 <consoleintr+0x120>
8010089d:	83 fb 7f             	cmp    $0x7f,%ebx
801008a0:	0f 85 60 ff ff ff    	jne    80100806 <consoleintr+0x46>
        input.e--;
        consputc(BACKSPACE);
      }
      break;
    case C('H'): case '\x7f':  // Backspace
      if(input.e != input.w){
801008a6:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
801008ab:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
801008b1:	0f 84 29 ff ff ff    	je     801007e0 <consoleintr+0x20>
        input.e--;
801008b7:	83 e8 01             	sub    $0x1,%eax
801008ba:	a3 a8 ff 10 80       	mov    %eax,0x8010ffa8
        consputc(BACKSPACE);
801008bf:	b8 00 01 00 00       	mov    $0x100,%eax
801008c4:	e8 27 fb ff ff       	call   801003f0 <consputc>
801008c9:	e9 12 ff ff ff       	jmp    801007e0 <consoleintr+0x20>
801008ce:	66 90                	xchg   %ax,%ax
  acquire(&cons.lock);
  while((c = getc()) >= 0){
    switch(c){
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
801008d0:	bf 01 00 00 00       	mov    $0x1,%edi
801008d5:	e9 06 ff ff ff       	jmp    801007e0 <consoleintr+0x20>
801008da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
801008e0:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
801008e5:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
801008eb:	75 2b                	jne    80100918 <consoleintr+0x158>
801008ed:	e9 ee fe ff ff       	jmp    801007e0 <consoleintr+0x20>
801008f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
        input.e--;
801008f8:	a3 a8 ff 10 80       	mov    %eax,0x8010ffa8
        consputc(BACKSPACE);
801008fd:	b8 00 01 00 00       	mov    $0x100,%eax
80100902:	e8 e9 fa ff ff       	call   801003f0 <consputc>
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
80100907:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
8010090c:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
80100912:	0f 84 c8 fe ff ff    	je     801007e0 <consoleintr+0x20>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
80100918:	83 e8 01             	sub    $0x1,%eax
8010091b:	89 c2                	mov    %eax,%edx
8010091d:	83 e2 7f             	and    $0x7f,%edx
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
80100920:	80 ba 20 ff 10 80 0a 	cmpb   $0xa,-0x7fef00e0(%edx)
80100927:	75 cf                	jne    801008f8 <consoleintr+0x138>
80100929:	e9 b2 fe ff ff       	jmp    801007e0 <consoleintr+0x20>
8010092e:	66 90                	xchg   %ax,%ax
  }
  release(&cons.lock);
  if(doprocdump) {
    procdump();  // now call procdump() wo. cons.lock held
  }
}
80100930:	83 c4 1c             	add    $0x1c,%esp
80100933:	5b                   	pop    %ebx
80100934:	5e                   	pop    %esi
80100935:	5f                   	pop    %edi
80100936:	5d                   	pop    %ebp
      break;
    }
  }
  release(&cons.lock);
  if(doprocdump) {
    procdump();  // now call procdump() wo. cons.lock held
80100937:	e9 d4 35 00 00       	jmp    80103f10 <procdump>
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
8010093c:	83 c0 01             	add    $0x1,%eax
8010093f:	c6 82 20 ff 10 80 0a 	movb   $0xa,-0x7fef00e0(%edx)
80100946:	a3 a8 ff 10 80       	mov    %eax,0x8010ffa8
        consputc(c);
8010094b:	b8 0a 00 00 00       	mov    $0xa,%eax
80100950:	e8 9b fa ff ff       	call   801003f0 <consputc>
80100955:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
8010095a:	e9 fc fe ff ff       	jmp    8010085b <consoleintr+0x9b>
8010095f:	90                   	nop

80100960 <consoleinit>:
  return n;
}

void
consoleinit(void)
{
80100960:	55                   	push   %ebp
80100961:	89 e5                	mov    %esp,%ebp
80100963:	83 ec 18             	sub    $0x18,%esp
  initlock(&cons.lock, "console");
80100966:	c7 44 24 04 a8 6d 10 	movl   $0x80106da8,0x4(%esp)
8010096d:	80 
8010096e:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
80100975:	e8 96 37 00 00       	call   80104110 <initlock>

  devsw[CONSOLE].write = consolewrite;
  devsw[CONSOLE].read = consoleread;
  cons.locking = 1;

  ioapicenable(IRQ_KBD, 0);
8010097a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80100981:	00 
80100982:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
void
consoleinit(void)
{
  initlock(&cons.lock, "console");

  devsw[CONSOLE].write = consolewrite;
80100989:	c7 05 6c 09 11 80 70 	movl   $0x80100570,0x8011096c
80100990:	05 10 80 
  devsw[CONSOLE].read = consoleread;
80100993:	c7 05 68 09 11 80 70 	movl   $0x80100270,0x80110968
8010099a:	02 10 80 
  cons.locking = 1;
8010099d:	c7 05 54 a5 10 80 01 	movl   $0x1,0x8010a554
801009a4:	00 00 00 

  ioapicenable(IRQ_KBD, 0);
801009a7:	e8 54 19 00 00       	call   80102300 <ioapicenable>
}
801009ac:	c9                   	leave  
801009ad:	c3                   	ret    
	...

801009b0 <exec>:
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
{
801009b0:	55                   	push   %ebp
801009b1:	89 e5                	mov    %esp,%ebp
801009b3:	81 ec 38 01 00 00    	sub    $0x138,%esp
801009b9:	89 5d f4             	mov    %ebx,-0xc(%ebp)
801009bc:	89 75 f8             	mov    %esi,-0x8(%ebp)
801009bf:	89 7d fc             	mov    %edi,-0x4(%ebp)
  uint argc, sz, sp, ustack[3+MAXARG+1];
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;
  struct proc *curproc = myproc();
801009c2:	e8 69 2d 00 00       	call   80103730 <myproc>
801009c7:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)

  begin_op();
801009cd:	e8 9e 21 00 00       	call   80102b70 <begin_op>

  if((ip = namei(path)) == 0){
801009d2:	8b 55 08             	mov    0x8(%ebp),%edx
801009d5:	89 14 24             	mov    %edx,(%esp)
801009d8:	e8 93 15 00 00       	call   80101f70 <namei>
801009dd:	85 c0                	test   %eax,%eax
801009df:	89 c3                	mov    %eax,%ebx
801009e1:	0f 84 42 02 00 00    	je     80100c29 <exec+0x279>
    end_op();
    cprintf("exec: fail\n");
    return -1;
  }
  ilock(ip);
801009e7:	89 04 24             	mov    %eax,(%esp)
801009ea:	e8 b1 0c 00 00       	call   801016a0 <ilock>
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
801009ef:	8d 45 94             	lea    -0x6c(%ebp),%eax
801009f2:	c7 44 24 0c 34 00 00 	movl   $0x34,0xc(%esp)
801009f9:	00 
801009fa:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80100a01:	00 
80100a02:	89 44 24 04          	mov    %eax,0x4(%esp)
80100a06:	89 1c 24             	mov    %ebx,(%esp)
80100a09:	e8 72 0f 00 00       	call   80101980 <readi>
80100a0e:	83 f8 34             	cmp    $0x34,%eax
80100a11:	74 25                	je     80100a38 <exec+0x88>

 bad:
  if(pgdir)
    freevm(pgdir);
  if(ip){
    iunlockput(ip);
80100a13:	89 1c 24             	mov    %ebx,(%esp)
80100a16:	e8 15 0f 00 00       	call   80101930 <iunlockput>
    end_op();
80100a1b:	e8 c0 21 00 00       	call   80102be0 <end_op>
  }
  return -1;
80100a20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100a25:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80100a28:	8b 75 f8             	mov    -0x8(%ebp),%esi
80100a2b:	8b 7d fc             	mov    -0x4(%ebp),%edi
80100a2e:	89 ec                	mov    %ebp,%esp
80100a30:	5d                   	pop    %ebp
80100a31:	c3                   	ret    
80100a32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
    goto bad;
  if(elf.magic != ELF_MAGIC)
80100a38:	81 7d 94 7f 45 4c 46 	cmpl   $0x464c457f,-0x6c(%ebp)
80100a3f:	75 d2                	jne    80100a13 <exec+0x63>
    goto bad;

  if((pgdir = setupkvm()) == 0)
80100a41:	e8 7a 60 00 00       	call   80106ac0 <setupkvm>
80100a46:	85 c0                	test   %eax,%eax
80100a48:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
80100a4e:	74 c3                	je     80100a13 <exec+0x63>
    goto bad;

  // Load program into memory.
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100a50:	66 83 7d c0 00       	cmpw   $0x0,-0x40(%ebp)
80100a55:	8b 75 b0             	mov    -0x50(%ebp),%esi

  if((pgdir = setupkvm()) == 0)
    goto bad;

  // Load program into memory.
  sz = 0;
80100a58:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
80100a5f:	00 00 00 
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100a62:	0f 84 cb 00 00 00    	je     80100b33 <exec+0x183>
80100a68:	31 ff                	xor    %edi,%edi
80100a6a:	eb 16                	jmp    80100a82 <exec+0xd2>
80100a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100a70:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
80100a74:	83 c7 01             	add    $0x1,%edi
#include "defs.h"
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
80100a77:	83 c6 20             	add    $0x20,%esi
  if((pgdir = setupkvm()) == 0)
    goto bad;

  // Load program into memory.
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100a7a:	39 f8                	cmp    %edi,%eax
80100a7c:	0f 8e b1 00 00 00    	jle    80100b33 <exec+0x183>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100a82:	8d 4d c8             	lea    -0x38(%ebp),%ecx
80100a85:	c7 44 24 0c 20 00 00 	movl   $0x20,0xc(%esp)
80100a8c:	00 
80100a8d:	89 74 24 08          	mov    %esi,0x8(%esp)
80100a91:	89 4c 24 04          	mov    %ecx,0x4(%esp)
80100a95:	89 1c 24             	mov    %ebx,(%esp)
80100a98:	e8 e3 0e 00 00       	call   80101980 <readi>
80100a9d:	83 f8 20             	cmp    $0x20,%eax
80100aa0:	75 76                	jne    80100b18 <exec+0x168>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
80100aa2:	83 7d c8 01          	cmpl   $0x1,-0x38(%ebp)
80100aa6:	75 c8                	jne    80100a70 <exec+0xc0>
      continue;
    if(ph.memsz < ph.filesz)
80100aa8:	8b 45 dc             	mov    -0x24(%ebp),%eax
80100aab:	3b 45 d8             	cmp    -0x28(%ebp),%eax
80100aae:	72 68                	jb     80100b18 <exec+0x168>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
80100ab0:	03 45 d0             	add    -0x30(%ebp),%eax
80100ab3:	72 63                	jb     80100b18 <exec+0x168>
      goto bad;
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100ab5:	89 44 24 08          	mov    %eax,0x8(%esp)
80100ab9:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
80100abf:	89 44 24 04          	mov    %eax,0x4(%esp)
80100ac3:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
80100ac9:	89 04 24             	mov    %eax,(%esp)
80100acc:	e8 3f 5e 00 00       	call   80106910 <allocuvm>
80100ad1:	85 c0                	test   %eax,%eax
80100ad3:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100ad9:	74 3d                	je     80100b18 <exec+0x168>
      goto bad;
    if(ph.vaddr % PGSIZE != 0)
80100adb:	8b 45 d0             	mov    -0x30(%ebp),%eax
80100ade:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100ae3:	75 33                	jne    80100b18 <exec+0x168>
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100ae5:	8b 55 d8             	mov    -0x28(%ebp),%edx
80100ae8:	89 44 24 04          	mov    %eax,0x4(%esp)
80100aec:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
80100af2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
80100af6:	89 54 24 10          	mov    %edx,0x10(%esp)
80100afa:	8b 55 cc             	mov    -0x34(%ebp),%edx
80100afd:	89 04 24             	mov    %eax,(%esp)
80100b00:	89 54 24 0c          	mov    %edx,0xc(%esp)
80100b04:	e8 a7 5c 00 00       	call   801067b0 <loaduvm>
80100b09:	85 c0                	test   %eax,%eax
80100b0b:	0f 89 5f ff ff ff    	jns    80100a70 <exec+0xc0>
80100b11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100b18:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
80100b1e:	89 04 24             	mov    %eax,(%esp)
80100b21:	e8 1a 5f 00 00       	call   80106a40 <freevm>
  if(ip){
80100b26:	85 db                	test   %ebx,%ebx
80100b28:	0f 85 e5 fe ff ff    	jne    80100a13 <exec+0x63>
80100b2e:	e9 ed fe ff ff       	jmp    80100a20 <exec+0x70>
    if(ph.vaddr % PGSIZE != 0)
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
      goto bad;
  }
  iunlockput(ip);
80100b33:	89 1c 24             	mov    %ebx,(%esp)
  end_op();
  ip = 0;
80100b36:	31 db                	xor    %ebx,%ebx
    if(ph.vaddr % PGSIZE != 0)
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
      goto bad;
  }
  iunlockput(ip);
80100b38:	e8 f3 0d 00 00       	call   80101930 <iunlockput>
  end_op();
80100b3d:	e8 9e 20 00 00       	call   80102be0 <end_op>
  ip = 0;

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
80100b42:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
80100b48:	05 ff 0f 00 00       	add    $0xfff,%eax
80100b4d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100b52:	8d 90 00 20 00 00    	lea    0x2000(%eax),%edx
80100b58:	89 44 24 04          	mov    %eax,0x4(%esp)
80100b5c:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
80100b62:	89 54 24 08          	mov    %edx,0x8(%esp)
80100b66:	89 04 24             	mov    %eax,(%esp)
80100b69:	e8 a2 5d 00 00       	call   80106910 <allocuvm>
80100b6e:	85 c0                	test   %eax,%eax
80100b70:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100b76:	74 a0                	je     80100b18 <exec+0x168>
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100b78:	2d 00 20 00 00       	sub    $0x2000,%eax
80100b7d:	89 44 24 04          	mov    %eax,0x4(%esp)
80100b81:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
80100b87:	89 04 24             	mov    %eax,(%esp)
80100b8a:	e8 d1 5f 00 00       	call   80106b60 <clearpteu>
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100b8f:	8b 55 0c             	mov    0xc(%ebp),%edx
80100b92:	8b 02                	mov    (%edx),%eax
80100b94:	85 c0                	test   %eax,%eax
80100b96:	0f 84 af 00 00 00    	je     80100c4b <exec+0x29b>
#include "defs.h"
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
80100b9c:	89 d7                	mov    %edx,%edi
80100b9e:	8b 9d f0 fe ff ff    	mov    -0x110(%ebp),%ebx
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100ba4:	31 f6                	xor    %esi,%esi
#include "defs.h"
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
80100ba6:	83 c7 04             	add    $0x4,%edi
80100ba9:	89 d1                	mov    %edx,%ecx
80100bab:	eb 27                	jmp    80100bd4 <exec+0x224>
80100bad:	8d 76 00             	lea    0x0(%esi),%esi
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100bb0:	8b 07                	mov    (%edi),%eax
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
80100bb2:	8d 95 04 ff ff ff    	lea    -0xfc(%ebp),%edx
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100bb8:	89 f9                	mov    %edi,%ecx
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
80100bba:	89 9c b5 10 ff ff ff 	mov    %ebx,-0xf0(%ebp,%esi,4)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100bc1:	83 c6 01             	add    $0x1,%esi
80100bc4:	85 c0                	test   %eax,%eax
80100bc6:	0f 84 8d 00 00 00    	je     80100c59 <exec+0x2a9>
80100bcc:	83 c7 04             	add    $0x4,%edi
    if(argc >= MAXARG)
80100bcf:	83 fe 20             	cmp    $0x20,%esi
80100bd2:	74 4e                	je     80100c22 <exec+0x272>
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100bd4:	89 8d e8 fe ff ff    	mov    %ecx,-0x118(%ebp)
80100bda:	89 04 24             	mov    %eax,(%esp)
80100bdd:	e8 8e 39 00 00       	call   80104570 <strlen>
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100be2:	8b 8d e8 fe ff ff    	mov    -0x118(%ebp),%ecx

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100be8:	f7 d0                	not    %eax
80100bea:	01 c3                	add    %eax,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100bec:	8b 01                	mov    (%ecx),%eax

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100bee:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100bf1:	89 04 24             	mov    %eax,(%esp)
80100bf4:	e8 77 39 00 00       	call   80104570 <strlen>
80100bf9:	8b 8d e8 fe ff ff    	mov    -0x118(%ebp),%ecx
80100bff:	83 c0 01             	add    $0x1,%eax
80100c02:	89 44 24 0c          	mov    %eax,0xc(%esp)
80100c06:	8b 01                	mov    (%ecx),%eax
80100c08:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80100c0c:	89 44 24 08          	mov    %eax,0x8(%esp)
80100c10:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
80100c16:	89 04 24             	mov    %eax,(%esp)
80100c19:	e8 82 60 00 00       	call   80106ca0 <copyout>
80100c1e:	85 c0                	test   %eax,%eax
80100c20:	79 8e                	jns    80100bb0 <exec+0x200>
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
      goto bad;
  }
  iunlockput(ip);
  end_op();
  ip = 0;
80100c22:	31 db                	xor    %ebx,%ebx
80100c24:	e9 ef fe ff ff       	jmp    80100b18 <exec+0x168>
80100c29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  struct proc *curproc = myproc();

  begin_op();

  if((ip = namei(path)) == 0){
    end_op();
80100c30:	e8 ab 1f 00 00       	call   80102be0 <end_op>
    cprintf("exec: fail\n");
80100c35:	c7 04 24 c1 6d 10 80 	movl   $0x80106dc1,(%esp)
80100c3c:	e8 0f fa ff ff       	call   80100650 <cprintf>
    return -1;
80100c41:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100c46:	e9 da fd ff ff       	jmp    80100a25 <exec+0x75>
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c4b:	8b 9d f0 fe ff ff    	mov    -0x110(%ebp),%ebx
80100c51:	31 f6                	xor    %esi,%esi
80100c53:	8d 95 04 ff ff ff    	lea    -0xfc(%ebp),%edx
  }
  ustack[3+argc] = 0;

  ustack[0] = 0xffffffff;  // fake return PC
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c59:	8d 04 b5 04 00 00 00 	lea    0x4(,%esi,4),%eax
80100c60:	89 d9                	mov    %ebx,%ecx
80100c62:	29 c1                	sub    %eax,%ecx

  sp -= (3+argc+1) * 4;
80100c64:	8d 04 b5 10 00 00 00 	lea    0x10(,%esi,4),%eax
80100c6b:	29 c3                	sub    %eax,%ebx
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100c6d:	89 44 24 0c          	mov    %eax,0xc(%esp)
80100c71:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
  }
  ustack[3+argc] = 0;
80100c77:	c7 84 b5 10 ff ff ff 	movl   $0x0,-0xf0(%ebp,%esi,4)
80100c7e:	00 00 00 00 
  ustack[0] = 0xffffffff;  // fake return PC
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer

  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100c82:	89 54 24 08          	mov    %edx,0x8(%esp)
      goto bad;
    ustack[3+argc] = sp;
  }
  ustack[3+argc] = 0;

  ustack[0] = 0xffffffff;  // fake return PC
80100c86:	c7 85 04 ff ff ff ff 	movl   $0xffffffff,-0xfc(%ebp)
80100c8d:	ff ff ff 
  ustack[1] = argc;
80100c90:	89 b5 08 ff ff ff    	mov    %esi,-0xf8(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c96:	89 8d 0c ff ff ff    	mov    %ecx,-0xf4(%ebp)

  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100c9c:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80100ca0:	89 04 24             	mov    %eax,(%esp)
80100ca3:	e8 f8 5f 00 00       	call   80106ca0 <copyout>
80100ca8:	85 c0                	test   %eax,%eax
80100caa:	0f 88 72 ff ff ff    	js     80100c22 <exec+0x272>
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100cb0:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100cb3:	0f b6 11             	movzbl (%ecx),%edx
80100cb6:	84 d2                	test   %dl,%dl
80100cb8:	74 14                	je     80100cce <exec+0x31e>
#include "defs.h"
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
80100cba:	8d 41 01             	lea    0x1(%ecx),%eax
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
    if(*s == '/')
      last = s+1;
80100cbd:	80 fa 2f             	cmp    $0x2f,%dl
80100cc0:	0f 44 c8             	cmove  %eax,%ecx
80100cc3:	83 c0 01             	add    $0x1,%eax
  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100cc6:	0f b6 50 ff          	movzbl -0x1(%eax),%edx
80100cca:	84 d2                	test   %dl,%dl
80100ccc:	75 ef                	jne    80100cbd <exec+0x30d>
    if(*s == '/')
      last = s+1;
  safestrcpy(curproc->name, last, sizeof(curproc->name));
80100cce:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
80100cd4:	89 4c 24 04          	mov    %ecx,0x4(%esp)
80100cd8:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80100cdf:	00 
80100ce0:	83 c0 6c             	add    $0x6c,%eax
80100ce3:	89 04 24             	mov    %eax,(%esp)
80100ce6:	e8 45 38 00 00       	call   80104530 <safestrcpy>

  // Commit to the user image.
  oldpgdir = curproc->pgdir;
80100ceb:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  curproc->pgdir = pgdir;
80100cf1:	8b 95 ec fe ff ff    	mov    -0x114(%ebp),%edx
  curproc->sz = sz;
80100cf7:	8b 8d f0 fe ff ff    	mov    -0x110(%ebp),%ecx
    if(*s == '/')
      last = s+1;
  safestrcpy(curproc->name, last, sizeof(curproc->name));

  // Commit to the user image.
  oldpgdir = curproc->pgdir;
80100cfd:	8b 70 04             	mov    0x4(%eax),%esi
  curproc->pgdir = pgdir;
80100d00:	89 50 04             	mov    %edx,0x4(%eax)
  curproc->sz = sz;
80100d03:	89 08                	mov    %ecx,(%eax)
  curproc->tf->eip = elf.entry;  // main
80100d05:	8b 40 18             	mov    0x18(%eax),%eax
  curproc->tf->esp = sp;
80100d08:	8b 8d f4 fe ff ff    	mov    -0x10c(%ebp),%ecx

  // Commit to the user image.
  oldpgdir = curproc->pgdir;
  curproc->pgdir = pgdir;
  curproc->sz = sz;
  curproc->tf->eip = elf.entry;  // main
80100d0e:	8b 55 ac             	mov    -0x54(%ebp),%edx
80100d11:	89 50 38             	mov    %edx,0x38(%eax)
  curproc->tf->esp = sp;
80100d14:	8b 41 18             	mov    0x18(%ecx),%eax
80100d17:	89 58 44             	mov    %ebx,0x44(%eax)
  switchuvm(curproc);
80100d1a:	89 0c 24             	mov    %ecx,(%esp)
80100d1d:	e8 fe 58 00 00       	call   80106620 <switchuvm>
  freevm(oldpgdir);
80100d22:	89 34 24             	mov    %esi,(%esp)
80100d25:	e8 16 5d 00 00       	call   80106a40 <freevm>
  return 0;
80100d2a:	31 c0                	xor    %eax,%eax
80100d2c:	e9 f4 fc ff ff       	jmp    80100a25 <exec+0x75>
	...

80100d40 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
80100d40:	55                   	push   %ebp
80100d41:	89 e5                	mov    %esp,%ebp
80100d43:	83 ec 18             	sub    $0x18,%esp
  initlock(&ftable.lock, "ftable");
80100d46:	c7 44 24 04 cd 6d 10 	movl   $0x80106dcd,0x4(%esp)
80100d4d:	80 
80100d4e:	c7 04 24 c0 ff 10 80 	movl   $0x8010ffc0,(%esp)
80100d55:	e8 b6 33 00 00       	call   80104110 <initlock>
}
80100d5a:	c9                   	leave  
80100d5b:	c3                   	ret    
80100d5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100d60 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
80100d60:	55                   	push   %ebp
80100d61:	89 e5                	mov    %esp,%ebp
80100d63:	53                   	push   %ebx
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100d64:	bb f4 ff 10 80       	mov    $0x8010fff4,%ebx
}

// Allocate a file structure.
struct file*
filealloc(void)
{
80100d69:	83 ec 14             	sub    $0x14,%esp
  struct file *f;

  acquire(&ftable.lock);
80100d6c:	c7 04 24 c0 ff 10 80 	movl   $0x8010ffc0,(%esp)
80100d73:	e8 08 35 00 00       	call   80104280 <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    if(f->ref == 0){
80100d78:	8b 15 f8 ff 10 80    	mov    0x8010fff8,%edx
80100d7e:	85 d2                	test   %edx,%edx
80100d80:	74 18                	je     80100d9a <filealloc+0x3a>
80100d82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
filealloc(void)
{
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100d88:	83 c3 18             	add    $0x18,%ebx
80100d8b:	81 fb 54 09 11 80    	cmp    $0x80110954,%ebx
80100d91:	73 25                	jae    80100db8 <filealloc+0x58>
    if(f->ref == 0){
80100d93:	8b 43 04             	mov    0x4(%ebx),%eax
80100d96:	85 c0                	test   %eax,%eax
80100d98:	75 ee                	jne    80100d88 <filealloc+0x28>
      f->ref = 1;
80100d9a:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
      release(&ftable.lock);
80100da1:	c7 04 24 c0 ff 10 80 	movl   $0x8010ffc0,(%esp)
80100da8:	e8 43 35 00 00       	call   801042f0 <release>
      return f;
    }
  }
  release(&ftable.lock);
  return 0;
}
80100dad:	83 c4 14             	add    $0x14,%esp
80100db0:	89 d8                	mov    %ebx,%eax
80100db2:	5b                   	pop    %ebx
80100db3:	5d                   	pop    %ebp
80100db4:	c3                   	ret    
80100db5:	8d 76 00             	lea    0x0(%esi),%esi
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
80100db8:	c7 04 24 c0 ff 10 80 	movl   $0x8010ffc0,(%esp)
  return 0;
80100dbf:	31 db                	xor    %ebx,%ebx
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
80100dc1:	e8 2a 35 00 00       	call   801042f0 <release>
  return 0;
}
80100dc6:	83 c4 14             	add    $0x14,%esp
80100dc9:	89 d8                	mov    %ebx,%eax
80100dcb:	5b                   	pop    %ebx
80100dcc:	5d                   	pop    %ebp
80100dcd:	c3                   	ret    
80100dce:	66 90                	xchg   %ax,%ax

80100dd0 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
80100dd0:	55                   	push   %ebp
80100dd1:	89 e5                	mov    %esp,%ebp
80100dd3:	53                   	push   %ebx
80100dd4:	83 ec 14             	sub    $0x14,%esp
80100dd7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ftable.lock);
80100dda:	c7 04 24 c0 ff 10 80 	movl   $0x8010ffc0,(%esp)
80100de1:	e8 9a 34 00 00       	call   80104280 <acquire>
  if(f->ref < 1)
80100de6:	8b 43 04             	mov    0x4(%ebx),%eax
80100de9:	85 c0                	test   %eax,%eax
80100deb:	7e 1a                	jle    80100e07 <filedup+0x37>
    panic("filedup");
  f->ref++;
80100ded:	83 c0 01             	add    $0x1,%eax
80100df0:	89 43 04             	mov    %eax,0x4(%ebx)
  release(&ftable.lock);
80100df3:	c7 04 24 c0 ff 10 80 	movl   $0x8010ffc0,(%esp)
80100dfa:	e8 f1 34 00 00       	call   801042f0 <release>
  return f;
}
80100dff:	83 c4 14             	add    $0x14,%esp
80100e02:	89 d8                	mov    %ebx,%eax
80100e04:	5b                   	pop    %ebx
80100e05:	5d                   	pop    %ebp
80100e06:	c3                   	ret    
struct file*
filedup(struct file *f)
{
  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("filedup");
80100e07:	c7 04 24 d4 6d 10 80 	movl   $0x80106dd4,(%esp)
80100e0e:	e8 5d f5 ff ff       	call   80100370 <panic>
80100e13:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e20 <fileclose>:
}

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
80100e20:	55                   	push   %ebp
80100e21:	89 e5                	mov    %esp,%ebp
80100e23:	83 ec 38             	sub    $0x38,%esp
80100e26:	89 5d f4             	mov    %ebx,-0xc(%ebp)
80100e29:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100e2c:	89 75 f8             	mov    %esi,-0x8(%ebp)
80100e2f:	89 7d fc             	mov    %edi,-0x4(%ebp)
  struct file ff;

  acquire(&ftable.lock);
80100e32:	c7 04 24 c0 ff 10 80 	movl   $0x8010ffc0,(%esp)
80100e39:	e8 42 34 00 00       	call   80104280 <acquire>
  if(f->ref < 1)
80100e3e:	8b 43 04             	mov    0x4(%ebx),%eax
80100e41:	85 c0                	test   %eax,%eax
80100e43:	0f 8e 9c 00 00 00    	jle    80100ee5 <fileclose+0xc5>
    panic("fileclose");
  if(--f->ref > 0){
80100e49:	83 e8 01             	sub    $0x1,%eax
80100e4c:	85 c0                	test   %eax,%eax
80100e4e:	89 43 04             	mov    %eax,0x4(%ebx)
80100e51:	74 1d                	je     80100e70 <fileclose+0x50>
    release(&ftable.lock);
80100e53:	c7 45 08 c0 ff 10 80 	movl   $0x8010ffc0,0x8(%ebp)
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100e5a:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80100e5d:	8b 75 f8             	mov    -0x8(%ebp),%esi
80100e60:	8b 7d fc             	mov    -0x4(%ebp),%edi
80100e63:	89 ec                	mov    %ebp,%esp
80100e65:	5d                   	pop    %ebp

  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
80100e66:	e9 85 34 00 00       	jmp    801042f0 <release>
80100e6b:	90                   	nop
80100e6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return;
  }
  ff = *f;
80100e70:	0f b6 43 09          	movzbl 0x9(%ebx),%eax
80100e74:	8b 33                	mov    (%ebx),%esi
  f->ref = 0;
  f->type = FD_NONE;
80100e76:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100e7c:	8b 7b 10             	mov    0x10(%ebx),%edi
80100e7f:	88 45 e7             	mov    %al,-0x19(%ebp)
80100e82:	8b 43 0c             	mov    0xc(%ebx),%eax
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100e85:	c7 04 24 c0 ff 10 80 	movl   $0x8010ffc0,(%esp)
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100e8c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100e8f:	e8 5c 34 00 00       	call   801042f0 <release>

  if(ff.type == FD_PIPE)
80100e94:	83 fe 01             	cmp    $0x1,%esi
80100e97:	74 37                	je     80100ed0 <fileclose+0xb0>
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
80100e99:	83 fe 02             	cmp    $0x2,%esi
80100e9c:	74 12                	je     80100eb0 <fileclose+0x90>
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100e9e:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80100ea1:	8b 75 f8             	mov    -0x8(%ebp),%esi
80100ea4:	8b 7d fc             	mov    -0x4(%ebp),%edi
80100ea7:	89 ec                	mov    %ebp,%esp
80100ea9:	5d                   	pop    %ebp
80100eaa:	c3                   	ret    
80100eab:	90                   	nop
80100eac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  release(&ftable.lock);

  if(ff.type == FD_PIPE)
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
    begin_op();
80100eb0:	e8 bb 1c 00 00       	call   80102b70 <begin_op>
    iput(ff.ip);
80100eb5:	89 3c 24             	mov    %edi,(%esp)
80100eb8:	e8 13 09 00 00       	call   801017d0 <iput>
    end_op();
  }
}
80100ebd:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80100ec0:	8b 75 f8             	mov    -0x8(%ebp),%esi
80100ec3:	8b 7d fc             	mov    -0x4(%ebp),%edi
80100ec6:	89 ec                	mov    %ebp,%esp
80100ec8:	5d                   	pop    %ebp
  if(ff.type == FD_PIPE)
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
80100ec9:	e9 12 1d 00 00       	jmp    80102be0 <end_op>
80100ece:	66 90                	xchg   %ax,%ax
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);

  if(ff.type == FD_PIPE)
    pipeclose(ff.pipe, ff.writable);
80100ed0:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
80100ed4:	89 44 24 04          	mov    %eax,0x4(%esp)
80100ed8:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100edb:	89 04 24             	mov    %eax,(%esp)
80100ede:	e8 ed 23 00 00       	call   801032d0 <pipeclose>
80100ee3:	eb b9                	jmp    80100e9e <fileclose+0x7e>
{
  struct file ff;

  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("fileclose");
80100ee5:	c7 04 24 dc 6d 10 80 	movl   $0x80106ddc,(%esp)
80100eec:	e8 7f f4 ff ff       	call   80100370 <panic>
80100ef1:	eb 0d                	jmp    80100f00 <filestat>
80100ef3:	90                   	nop
80100ef4:	90                   	nop
80100ef5:	90                   	nop
80100ef6:	90                   	nop
80100ef7:	90                   	nop
80100ef8:	90                   	nop
80100ef9:	90                   	nop
80100efa:	90                   	nop
80100efb:	90                   	nop
80100efc:	90                   	nop
80100efd:	90                   	nop
80100efe:	90                   	nop
80100eff:	90                   	nop

80100f00 <filestat>:
}

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
80100f00:	55                   	push   %ebp
    ilock(f->ip);
    stati(f->ip, st);
    iunlock(f->ip);
    return 0;
  }
  return -1;
80100f01:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
80100f06:	89 e5                	mov    %esp,%ebp
80100f08:	53                   	push   %ebx
80100f09:	83 ec 14             	sub    $0x14,%esp
80100f0c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(f->type == FD_INODE){
80100f0f:	83 3b 02             	cmpl   $0x2,(%ebx)
80100f12:	75 2a                	jne    80100f3e <filestat+0x3e>
    ilock(f->ip);
80100f14:	8b 43 10             	mov    0x10(%ebx),%eax
80100f17:	89 04 24             	mov    %eax,(%esp)
80100f1a:	e8 81 07 00 00       	call   801016a0 <ilock>
    stati(f->ip, st);
80100f1f:	8b 45 0c             	mov    0xc(%ebp),%eax
80100f22:	89 44 24 04          	mov    %eax,0x4(%esp)
80100f26:	8b 43 10             	mov    0x10(%ebx),%eax
80100f29:	89 04 24             	mov    %eax,(%esp)
80100f2c:	e8 1f 0a 00 00       	call   80101950 <stati>
    iunlock(f->ip);
80100f31:	8b 43 10             	mov    0x10(%ebx),%eax
80100f34:	89 04 24             	mov    %eax,(%esp)
80100f37:	e8 44 08 00 00       	call   80101780 <iunlock>
    return 0;
80100f3c:	31 c0                	xor    %eax,%eax
  }
  return -1;
}
80100f3e:	83 c4 14             	add    $0x14,%esp
80100f41:	5b                   	pop    %ebx
80100f42:	5d                   	pop    %ebp
80100f43:	c3                   	ret    
80100f44:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100f4a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80100f50 <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
80100f50:	55                   	push   %ebp
80100f51:	89 e5                	mov    %esp,%ebp
80100f53:	83 ec 28             	sub    $0x28,%esp
80100f56:	89 5d f4             	mov    %ebx,-0xc(%ebp)
80100f59:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f5c:	89 75 f8             	mov    %esi,-0x8(%ebp)
80100f5f:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f62:	89 7d fc             	mov    %edi,-0x4(%ebp)
80100f65:	8b 7d 10             	mov    0x10(%ebp),%edi
  int r;

  if(f->readable == 0)
80100f68:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f6c:	74 72                	je     80100fe0 <fileread+0x90>
    return -1;
  if(f->type == FD_PIPE)
80100f6e:	8b 03                	mov    (%ebx),%eax
80100f70:	83 f8 01             	cmp    $0x1,%eax
80100f73:	74 53                	je     80100fc8 <fileread+0x78>
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100f75:	83 f8 02             	cmp    $0x2,%eax
80100f78:	75 6d                	jne    80100fe7 <fileread+0x97>
    ilock(f->ip);
80100f7a:	8b 43 10             	mov    0x10(%ebx),%eax
80100f7d:	89 04 24             	mov    %eax,(%esp)
80100f80:	e8 1b 07 00 00       	call   801016a0 <ilock>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100f85:	89 7c 24 0c          	mov    %edi,0xc(%esp)
80100f89:	8b 43 14             	mov    0x14(%ebx),%eax
80100f8c:	89 74 24 04          	mov    %esi,0x4(%esp)
80100f90:	89 44 24 08          	mov    %eax,0x8(%esp)
80100f94:	8b 43 10             	mov    0x10(%ebx),%eax
80100f97:	89 04 24             	mov    %eax,(%esp)
80100f9a:	e8 e1 09 00 00       	call   80101980 <readi>
80100f9f:	85 c0                	test   %eax,%eax
80100fa1:	89 c6                	mov    %eax,%esi
80100fa3:	7e 03                	jle    80100fa8 <fileread+0x58>
      f->off += r;
80100fa5:	01 43 14             	add    %eax,0x14(%ebx)
    iunlock(f->ip);
80100fa8:	8b 43 10             	mov    0x10(%ebx),%eax
80100fab:	89 04 24             	mov    %eax,(%esp)
80100fae:	e8 cd 07 00 00       	call   80101780 <iunlock>
    return r;
  }
  panic("fileread");
}
80100fb3:	89 f0                	mov    %esi,%eax
80100fb5:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80100fb8:	8b 75 f8             	mov    -0x8(%ebp),%esi
80100fbb:	8b 7d fc             	mov    -0x4(%ebp),%edi
80100fbe:	89 ec                	mov    %ebp,%esp
80100fc0:	5d                   	pop    %ebp
80100fc1:	c3                   	ret    
80100fc2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  int r;

  if(f->readable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
80100fc8:	8b 43 0c             	mov    0xc(%ebx),%eax
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
}
80100fcb:	8b 75 f8             	mov    -0x8(%ebp),%esi
80100fce:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80100fd1:	8b 7d fc             	mov    -0x4(%ebp),%edi
  int r;

  if(f->readable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
80100fd4:	89 45 08             	mov    %eax,0x8(%ebp)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
}
80100fd7:	89 ec                	mov    %ebp,%esp
80100fd9:	5d                   	pop    %ebp
  int r;

  if(f->readable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
80100fda:	e9 81 24 00 00       	jmp    80103460 <piperead>
80100fdf:	90                   	nop
fileread(struct file *f, char *addr, int n)
{
  int r;

  if(f->readable == 0)
    return -1;
80100fe0:	be ff ff ff ff       	mov    $0xffffffff,%esi
80100fe5:	eb cc                	jmp    80100fb3 <fileread+0x63>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
80100fe7:	c7 04 24 e6 6d 10 80 	movl   $0x80106de6,(%esp)
80100fee:	e8 7d f3 ff ff       	call   80100370 <panic>
80100ff3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100ff9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101000 <filewrite>:

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80101000:	55                   	push   %ebp
80101001:	89 e5                	mov    %esp,%ebp
80101003:	57                   	push   %edi
80101004:	56                   	push   %esi
80101005:	53                   	push   %ebx
80101006:	83 ec 2c             	sub    $0x2c,%esp
80101009:	8b 45 0c             	mov    0xc(%ebp),%eax
8010100c:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010100f:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101012:	8b 45 10             	mov    0x10(%ebp),%eax
  int r;

  if(f->writable == 0)
80101015:	80 7b 09 00          	cmpb   $0x0,0x9(%ebx)

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80101019:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int r;

  if(f->writable == 0)
8010101c:	0f 84 ae 00 00 00    	je     801010d0 <filewrite+0xd0>
    return -1;
  if(f->type == FD_PIPE)
80101022:	8b 03                	mov    (%ebx),%eax
80101024:	83 f8 01             	cmp    $0x1,%eax
80101027:	0f 84 c6 00 00 00    	je     801010f3 <filewrite+0xf3>
    return pipewrite(f->pipe, addr, n);
  if(f->type == FD_INODE){
8010102d:	83 f8 02             	cmp    $0x2,%eax
80101030:	0f 85 db 00 00 00    	jne    80101111 <filewrite+0x111>
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
80101036:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101039:	31 f6                	xor    %esi,%esi
8010103b:	85 c9                	test   %ecx,%ecx
8010103d:	7f 31                	jg     80101070 <filewrite+0x70>
8010103f:	e9 9c 00 00 00       	jmp    801010e0 <filewrite+0xe0>
80101044:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
80101048:	01 43 14             	add    %eax,0x14(%ebx)
      iunlock(f->ip);
8010104b:	8b 53 10             	mov    0x10(%ebx),%edx
8010104e:	89 45 dc             	mov    %eax,-0x24(%ebp)
80101051:	89 14 24             	mov    %edx,(%esp)
80101054:	e8 27 07 00 00       	call   80101780 <iunlock>
      end_op();
80101059:	e8 82 1b 00 00       	call   80102be0 <end_op>
8010105e:	8b 45 dc             	mov    -0x24(%ebp),%eax

      if(r < 0)
        break;
      if(r != n1)
80101061:	39 f8                	cmp    %edi,%eax
80101063:	0f 85 9c 00 00 00    	jne    80101105 <filewrite+0x105>
        panic("short filewrite");
      i += r;
80101069:	01 c6                	add    %eax,%esi
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
8010106b:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
8010106e:	7e 70                	jle    801010e0 <filewrite+0xe0>
      int n1 = n - i;
80101070:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101073:	b8 00 06 00 00       	mov    $0x600,%eax
80101078:	29 f7                	sub    %esi,%edi
8010107a:	81 ff 00 06 00 00    	cmp    $0x600,%edi
80101080:	0f 4f f8             	cmovg  %eax,%edi
      if(n1 > max)
        n1 = max;

      begin_op();
80101083:	e8 e8 1a 00 00       	call   80102b70 <begin_op>
      ilock(f->ip);
80101088:	8b 43 10             	mov    0x10(%ebx),%eax
8010108b:	89 04 24             	mov    %eax,(%esp)
8010108e:	e8 0d 06 00 00       	call   801016a0 <ilock>
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
80101093:	89 7c 24 0c          	mov    %edi,0xc(%esp)
80101097:	8b 43 14             	mov    0x14(%ebx),%eax
8010109a:	89 44 24 08          	mov    %eax,0x8(%esp)
8010109e:	8b 45 e0             	mov    -0x20(%ebp),%eax
801010a1:	01 f0                	add    %esi,%eax
801010a3:	89 44 24 04          	mov    %eax,0x4(%esp)
801010a7:	8b 43 10             	mov    0x10(%ebx),%eax
801010aa:	89 04 24             	mov    %eax,(%esp)
801010ad:	e8 fe 09 00 00       	call   80101ab0 <writei>
801010b2:	85 c0                	test   %eax,%eax
801010b4:	7f 92                	jg     80101048 <filewrite+0x48>
        f->off += r;
      iunlock(f->ip);
801010b6:	8b 53 10             	mov    0x10(%ebx),%edx
801010b9:	89 45 dc             	mov    %eax,-0x24(%ebp)
801010bc:	89 14 24             	mov    %edx,(%esp)
801010bf:	e8 bc 06 00 00       	call   80101780 <iunlock>
      end_op();
801010c4:	e8 17 1b 00 00       	call   80102be0 <end_op>

      if(r < 0)
801010c9:	8b 45 dc             	mov    -0x24(%ebp),%eax
801010cc:	85 c0                	test   %eax,%eax
801010ce:	74 91                	je     80101061 <filewrite+0x61>
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
801010d0:	83 c4 2c             	add    $0x2c,%esp
        break;
      if(r != n1)
        panic("short filewrite");
      i += r;
    }
    return i == n ? n : -1;
801010d3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  panic("filewrite");
}
801010d8:	5b                   	pop    %ebx
801010d9:	5e                   	pop    %esi
801010da:	5f                   	pop    %edi
801010db:	5d                   	pop    %ebp
801010dc:	c3                   	ret    
801010dd:	8d 76 00             	lea    0x0(%esi),%esi
        break;
      if(r != n1)
        panic("short filewrite");
      i += r;
    }
    return i == n ? n : -1;
801010e0:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
801010e3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801010e8:	0f 44 c6             	cmove  %esi,%eax
  }
  panic("filewrite");
}
801010eb:	83 c4 2c             	add    $0x2c,%esp
801010ee:	5b                   	pop    %ebx
801010ef:	5e                   	pop    %esi
801010f0:	5f                   	pop    %edi
801010f1:	5d                   	pop    %ebp
801010f2:	c3                   	ret    
  int r;

  if(f->writable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return pipewrite(f->pipe, addr, n);
801010f3:	8b 43 0c             	mov    0xc(%ebx),%eax
801010f6:	89 45 08             	mov    %eax,0x8(%ebp)
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
801010f9:	83 c4 2c             	add    $0x2c,%esp
801010fc:	5b                   	pop    %ebx
801010fd:	5e                   	pop    %esi
801010fe:	5f                   	pop    %edi
801010ff:	5d                   	pop    %ebp
  int r;

  if(f->writable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return pipewrite(f->pipe, addr, n);
80101100:	e9 6b 22 00 00       	jmp    80103370 <pipewrite>
      end_op();

      if(r < 0)
        break;
      if(r != n1)
        panic("short filewrite");
80101105:	c7 04 24 ef 6d 10 80 	movl   $0x80106def,(%esp)
8010110c:	e8 5f f2 ff ff       	call   80100370 <panic>
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
80101111:	c7 04 24 f5 6d 10 80 	movl   $0x80106df5,(%esp)
80101118:	e8 53 f2 ff ff       	call   80100370 <panic>
8010111d:	00 00                	add    %al,(%eax)
	...

80101120 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
80101120:	55                   	push   %ebp
80101121:	89 e5                	mov    %esp,%ebp
80101123:	57                   	push   %edi
80101124:	89 d7                	mov    %edx,%edi
80101126:	56                   	push   %esi
  struct inode *ip, *empty;

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
80101127:	31 f6                	xor    %esi,%esi
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
80101129:	53                   	push   %ebx
8010112a:	89 c3                	mov    %eax,%ebx
8010112c:	83 ec 2c             	sub    $0x2c,%esp
  struct inode *ip, *empty;

  acquire(&icache.lock);
8010112f:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
80101136:	e8 45 31 00 00       	call   80104280 <acquire>

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010113b:	b8 14 0a 11 80       	mov    $0x80110a14,%eax
80101140:	eb 16                	jmp    80101158 <iget+0x38>
80101142:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101148:	85 f6                	test   %esi,%esi
8010114a:	74 3c                	je     80101188 <iget+0x68>

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010114c:	05 90 00 00 00       	add    $0x90,%eax
80101151:	3d 34 26 11 80       	cmp    $0x80112634,%eax
80101156:	73 48                	jae    801011a0 <iget+0x80>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
80101158:	8b 48 08             	mov    0x8(%eax),%ecx
8010115b:	85 c9                	test   %ecx,%ecx
8010115d:	7e e9                	jle    80101148 <iget+0x28>
8010115f:	39 18                	cmp    %ebx,(%eax)
80101161:	75 e5                	jne    80101148 <iget+0x28>
80101163:	39 78 04             	cmp    %edi,0x4(%eax)
80101166:	75 e0                	jne    80101148 <iget+0x28>
      ip->ref++;
80101168:	83 c1 01             	add    $0x1,%ecx
8010116b:	89 48 08             	mov    %ecx,0x8(%eax)
      release(&icache.lock);
8010116e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101171:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
80101178:	e8 73 31 00 00       	call   801042f0 <release>
      return ip;
8010117d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  ip->ref = 1;
  ip->valid = 0;
  release(&icache.lock);

  return ip;
}
80101180:	83 c4 2c             	add    $0x2c,%esp
80101183:	5b                   	pop    %ebx
80101184:	5e                   	pop    %esi
80101185:	5f                   	pop    %edi
80101186:	5d                   	pop    %ebp
80101187:	c3                   	ret    
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101188:	85 c9                	test   %ecx,%ecx
8010118a:	0f 44 f0             	cmove  %eax,%esi

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010118d:	05 90 00 00 00       	add    $0x90,%eax
80101192:	3d 34 26 11 80       	cmp    $0x80112634,%eax
80101197:	72 bf                	jb     80101158 <iget+0x38>
80101199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
801011a0:	85 f6                	test   %esi,%esi
801011a2:	74 29                	je     801011cd <iget+0xad>
    panic("iget: no inodes");

  ip = empty;
  ip->dev = dev;
801011a4:	89 1e                	mov    %ebx,(%esi)
  ip->inum = inum;
801011a6:	89 7e 04             	mov    %edi,0x4(%esi)
  ip->ref = 1;
801011a9:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
  ip->valid = 0;
801011b0:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
  release(&icache.lock);
801011b7:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
801011be:	e8 2d 31 00 00       	call   801042f0 <release>

  return ip;
}
801011c3:	83 c4 2c             	add    $0x2c,%esp
  ip->inum = inum;
  ip->ref = 1;
  ip->valid = 0;
  release(&icache.lock);

  return ip;
801011c6:	89 f0                	mov    %esi,%eax
}
801011c8:	5b                   	pop    %ebx
801011c9:	5e                   	pop    %esi
801011ca:	5f                   	pop    %edi
801011cb:	5d                   	pop    %ebp
801011cc:	c3                   	ret    
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
    panic("iget: no inodes");
801011cd:	c7 04 24 ff 6d 10 80 	movl   $0x80106dff,(%esp)
801011d4:	e8 97 f1 ff ff       	call   80100370 <panic>
801011d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801011e0 <bfree>:
}

// Free a disk block.
static void
bfree(int dev, uint b)
{
801011e0:	55                   	push   %ebp
801011e1:	89 e5                	mov    %esp,%ebp
801011e3:	83 ec 28             	sub    $0x28,%esp
801011e6:	89 75 f8             	mov    %esi,-0x8(%ebp)
801011e9:	89 d6                	mov    %edx,%esi
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
801011eb:	c1 ea 0c             	shr    $0xc,%edx
801011ee:	03 15 d8 09 11 80    	add    0x801109d8,%edx
}

// Free a disk block.
static void
bfree(int dev, uint b)
{
801011f4:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
801011f7:	89 f3                	mov    %esi,%ebx
}

// Free a disk block.
static void
bfree(int dev, uint b)
{
801011f9:	89 7d fc             	mov    %edi,-0x4(%ebp)
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
801011fc:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
bfree(int dev, uint b)
{
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
80101202:	89 54 24 04          	mov    %edx,0x4(%esp)
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
80101206:	c1 fb 03             	sar    $0x3,%ebx
bfree(int dev, uint b)
{
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
80101209:	89 04 24             	mov    %eax,(%esp)
8010120c:	e8 bf ee ff ff       	call   801000d0 <bread>
  bi = b % BPB;
  m = 1 << (bi % 8);
80101211:	89 f1                	mov    %esi,%ecx
80101213:	be 01 00 00 00       	mov    $0x1,%esi
80101218:	83 e1 07             	and    $0x7,%ecx
8010121b:	d3 e6                	shl    %cl,%esi
  if((bp->data[bi/8] & m) == 0)
8010121d:	0f b6 54 18 5c       	movzbl 0x5c(%eax,%ebx,1),%edx
bfree(int dev, uint b)
{
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
80101222:	89 c7                	mov    %eax,%edi
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
80101224:	0f b6 c2             	movzbl %dl,%eax
80101227:	85 f0                	test   %esi,%eax
80101229:	74 27                	je     80101252 <bfree+0x72>
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
8010122b:	89 f0                	mov    %esi,%eax
8010122d:	f7 d0                	not    %eax
8010122f:	21 d0                	and    %edx,%eax
80101231:	88 44 1f 5c          	mov    %al,0x5c(%edi,%ebx,1)
  log_write(bp);
80101235:	89 3c 24             	mov    %edi,(%esp)
80101238:	e8 d3 1a 00 00       	call   80102d10 <log_write>
  brelse(bp);
8010123d:	89 3c 24             	mov    %edi,(%esp)
80101240:	e8 9b ef ff ff       	call   801001e0 <brelse>
}
80101245:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80101248:	8b 75 f8             	mov    -0x8(%ebp),%esi
8010124b:	8b 7d fc             	mov    -0x4(%ebp),%edi
8010124e:	89 ec                	mov    %ebp,%esp
80101250:	5d                   	pop    %ebp
80101251:	c3                   	ret    

  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
    panic("freeing free block");
80101252:	c7 04 24 0f 6e 10 80 	movl   $0x80106e0f,(%esp)
80101259:	e8 12 f1 ff ff       	call   80100370 <panic>
8010125e:	66 90                	xchg   %ax,%ax

80101260 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
80101260:	55                   	push   %ebp
80101261:	89 e5                	mov    %esp,%ebp
80101263:	57                   	push   %edi
80101264:	56                   	push   %esi
80101265:	53                   	push   %ebx
80101266:	83 ec 3c             	sub    $0x3c,%esp
80101269:	89 45 d8             	mov    %eax,-0x28(%ebp)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
8010126c:	a1 c0 09 11 80       	mov    0x801109c0,%eax
80101271:	85 c0                	test   %eax,%eax
80101273:	0f 84 90 00 00 00    	je     80101309 <balloc+0xa9>
80101279:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    bp = bread(dev, BBLOCK(b, sb));
80101280:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101283:	c1 f8 0c             	sar    $0xc,%eax
80101286:	03 05 d8 09 11 80    	add    0x801109d8,%eax
8010128c:	89 44 24 04          	mov    %eax,0x4(%esp)
80101290:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101293:	89 04 24             	mov    %eax,(%esp)
80101296:	e8 35 ee ff ff       	call   801000d0 <bread>
8010129b:	8b 15 c0 09 11 80    	mov    0x801109c0,%edx
801012a1:	8b 5d dc             	mov    -0x24(%ebp),%ebx
801012a4:	89 55 e0             	mov    %edx,-0x20(%ebp)
801012a7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
801012aa:	31 c0                	xor    %eax,%eax
801012ac:	eb 35                	jmp    801012e3 <balloc+0x83>
801012ae:	66 90                	xchg   %ax,%ax
      m = 1 << (bi % 8);
801012b0:	89 c1                	mov    %eax,%ecx
801012b2:	bf 01 00 00 00       	mov    $0x1,%edi
801012b7:	83 e1 07             	and    $0x7,%ecx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
801012ba:	89 c2                	mov    %eax,%edx

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
801012bc:	d3 e7                	shl    %cl,%edi
      if((bp->data[bi/8] & m) == 0){  // Is block free?
801012be:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801012c1:	c1 fa 03             	sar    $0x3,%edx

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
801012c4:	89 7d d4             	mov    %edi,-0x2c(%ebp)
      if((bp->data[bi/8] & m) == 0){  // Is block free?
801012c7:	0f b6 74 11 5c       	movzbl 0x5c(%ecx,%edx,1),%esi
801012cc:	89 f1                	mov    %esi,%ecx
801012ce:	0f b6 f9             	movzbl %cl,%edi
801012d1:	85 7d d4             	test   %edi,-0x2c(%ebp)
801012d4:	74 42                	je     80101318 <balloc+0xb8>
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
801012d6:	83 c0 01             	add    $0x1,%eax
801012d9:	83 c3 01             	add    $0x1,%ebx
801012dc:	3d 00 10 00 00       	cmp    $0x1000,%eax
801012e1:	74 05                	je     801012e8 <balloc+0x88>
801012e3:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
801012e6:	72 c8                	jb     801012b0 <balloc+0x50>
        brelse(bp);
        bzero(dev, b + bi);
        return b + bi;
      }
    }
    brelse(bp);
801012e8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801012eb:	89 04 24             	mov    %eax,(%esp)
801012ee:	e8 ed ee ff ff       	call   801001e0 <brelse>
{
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
801012f3:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
801012fa:	8b 55 dc             	mov    -0x24(%ebp),%edx
801012fd:	3b 15 c0 09 11 80    	cmp    0x801109c0,%edx
80101303:	0f 82 77 ff ff ff    	jb     80101280 <balloc+0x20>
        return b + bi;
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
80101309:	c7 04 24 22 6e 10 80 	movl   $0x80106e22,(%esp)
80101310:	e8 5b f0 ff ff       	call   80100370 <panic>
80101315:	8d 76 00             	lea    0x0(%esi),%esi
80101318:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
      if((bp->data[bi/8] & m) == 0){  // Is block free?
        bp->data[bi/8] |= m;  // Mark block in use.
8010131b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010131e:	09 f1                	or     %esi,%ecx
80101320:	88 4c 10 5c          	mov    %cl,0x5c(%eax,%edx,1)
        log_write(bp);
80101324:	89 04 24             	mov    %eax,(%esp)
80101327:	e8 e4 19 00 00       	call   80102d10 <log_write>
        brelse(bp);
8010132c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010132f:	89 04 24             	mov    %eax,(%esp)
80101332:	e8 a9 ee ff ff       	call   801001e0 <brelse>
static void
bzero(int dev, int bno)
{
  struct buf *bp;

  bp = bread(dev, bno);
80101337:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010133a:	89 5c 24 04          	mov    %ebx,0x4(%esp)
8010133e:	89 04 24             	mov    %eax,(%esp)
80101341:	e8 8a ed ff ff       	call   801000d0 <bread>
  memset(bp->data, 0, BSIZE);
80101346:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
8010134d:	00 
8010134e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80101355:	00 
static void
bzero(int dev, int bno)
{
  struct buf *bp;

  bp = bread(dev, bno);
80101356:	89 c6                	mov    %eax,%esi
  memset(bp->data, 0, BSIZE);
80101358:	8d 40 5c             	lea    0x5c(%eax),%eax
8010135b:	89 04 24             	mov    %eax,(%esp)
8010135e:	e8 dd 2f 00 00       	call   80104340 <memset>
  log_write(bp);
80101363:	89 34 24             	mov    %esi,(%esp)
80101366:	e8 a5 19 00 00       	call   80102d10 <log_write>
  brelse(bp);
8010136b:	89 34 24             	mov    %esi,(%esp)
8010136e:	e8 6d ee ff ff       	call   801001e0 <brelse>
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
}
80101373:	83 c4 3c             	add    $0x3c,%esp
80101376:	89 d8                	mov    %ebx,%eax
80101378:	5b                   	pop    %ebx
80101379:	5e                   	pop    %esi
8010137a:	5f                   	pop    %edi
8010137b:	5d                   	pop    %ebp
8010137c:	c3                   	ret    
8010137d:	8d 76 00             	lea    0x0(%esi),%esi

80101380 <bmap.part.0>:
// listed in block ip->addrs[NDIRECT].

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
80101380:	55                   	push   %ebp
80101381:	89 e5                	mov    %esp,%ebp
80101383:	83 ec 38             	sub    $0x38,%esp
80101386:	89 7d fc             	mov    %edi,-0x4(%ebp)
  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
    return addr;
  }
  bn -= NDIRECT;
80101389:	8d 7a f4             	lea    -0xc(%edx),%edi

  if(bn < NINDIRECT){
8010138c:	83 ff 7f             	cmp    $0x7f,%edi
// listed in block ip->addrs[NDIRECT].

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
8010138f:	89 5d f4             	mov    %ebx,-0xc(%ebp)
80101392:	89 c3                	mov    %eax,%ebx
80101394:	89 75 f8             	mov    %esi,-0x8(%ebp)
      ip->addrs[bn] = addr = balloc(ip->dev);
    return addr;
  }
  bn -= NDIRECT;

  if(bn < NINDIRECT){
80101397:	77 66                	ja     801013ff <bmap.part.0+0x7f>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
80101399:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
8010139f:	85 c0                	test   %eax,%eax
801013a1:	74 4d                	je     801013f0 <bmap.part.0+0x70>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
801013a3:	89 44 24 04          	mov    %eax,0x4(%esp)
801013a7:	8b 03                	mov    (%ebx),%eax
801013a9:	89 04 24             	mov    %eax,(%esp)
801013ac:	e8 1f ed ff ff       	call   801000d0 <bread>
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
801013b1:	8d 7c b8 5c          	lea    0x5c(%eax,%edi,4),%edi

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
801013b5:	89 c6                	mov    %eax,%esi
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
801013b7:	8b 07                	mov    (%edi),%eax
801013b9:	85 c0                	test   %eax,%eax
801013bb:	75 17                	jne    801013d4 <bmap.part.0+0x54>
      a[bn] = addr = balloc(ip->dev);
801013bd:	8b 03                	mov    (%ebx),%eax
801013bf:	e8 9c fe ff ff       	call   80101260 <balloc>
801013c4:	89 07                	mov    %eax,(%edi)
      log_write(bp);
801013c6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801013c9:	89 34 24             	mov    %esi,(%esp)
801013cc:	e8 3f 19 00 00       	call   80102d10 <log_write>
801013d1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    }
    brelse(bp);
801013d4:	89 34 24             	mov    %esi,(%esp)
801013d7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801013da:	e8 01 ee ff ff       	call   801001e0 <brelse>
    return addr;
  }

  panic("bmap: out of range");
}
801013df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801013e2:	8b 5d f4             	mov    -0xc(%ebp),%ebx
801013e5:	8b 75 f8             	mov    -0x8(%ebp),%esi
801013e8:	8b 7d fc             	mov    -0x4(%ebp),%edi
801013eb:	89 ec                	mov    %ebp,%esp
801013ed:	5d                   	pop    %ebp
801013ee:	c3                   	ret    
801013ef:	90                   	nop
  bn -= NDIRECT;

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
801013f0:	8b 03                	mov    (%ebx),%eax
801013f2:	e8 69 fe ff ff       	call   80101260 <balloc>
801013f7:	89 83 8c 00 00 00    	mov    %eax,0x8c(%ebx)
801013fd:	eb a4                	jmp    801013a3 <bmap.part.0+0x23>
    }
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
801013ff:	c7 04 24 38 6e 10 80 	movl   $0x80106e38,(%esp)
80101406:	e8 65 ef ff ff       	call   80100370 <panic>
8010140b:	90                   	nop
8010140c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101410 <readsb>:
struct superblock sb; 

// Read the super block.
void
readsb(int dev, struct superblock *sb)
{
80101410:	55                   	push   %ebp
80101411:	89 e5                	mov    %esp,%ebp
80101413:	83 ec 18             	sub    $0x18,%esp
  struct buf *bp;

  bp = bread(dev, 1);
80101416:	8b 45 08             	mov    0x8(%ebp),%eax
struct superblock sb; 

// Read the super block.
void
readsb(int dev, struct superblock *sb)
{
80101419:	89 5d f8             	mov    %ebx,-0x8(%ebp)
8010141c:	89 75 fc             	mov    %esi,-0x4(%ebp)
8010141f:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct buf *bp;

  bp = bread(dev, 1);
80101422:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
80101429:	00 
8010142a:	89 04 24             	mov    %eax,(%esp)
8010142d:	e8 9e ec ff ff       	call   801000d0 <bread>
  memmove(sb, bp->data, sizeof(*sb));
80101432:	89 34 24             	mov    %esi,(%esp)
80101435:	c7 44 24 08 1c 00 00 	movl   $0x1c,0x8(%esp)
8010143c:	00 
void
readsb(int dev, struct superblock *sb)
{
  struct buf *bp;

  bp = bread(dev, 1);
8010143d:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
8010143f:	8d 40 5c             	lea    0x5c(%eax),%eax
80101442:	89 44 24 04          	mov    %eax,0x4(%esp)
80101446:	e8 b5 2f 00 00       	call   80104400 <memmove>
  brelse(bp);
}
8010144b:	8b 75 fc             	mov    -0x4(%ebp),%esi
{
  struct buf *bp;

  bp = bread(dev, 1);
  memmove(sb, bp->data, sizeof(*sb));
  brelse(bp);
8010144e:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80101451:	8b 5d f8             	mov    -0x8(%ebp),%ebx
80101454:	89 ec                	mov    %ebp,%esp
80101456:	5d                   	pop    %ebp
{
  struct buf *bp;

  bp = bread(dev, 1);
  memmove(sb, bp->data, sizeof(*sb));
  brelse(bp);
80101457:	e9 84 ed ff ff       	jmp    801001e0 <brelse>
8010145c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101460 <iinit>:
  struct inode inode[NINODE];
} icache;

void
iinit(int dev)
{
80101460:	55                   	push   %ebp
80101461:	89 e5                	mov    %esp,%ebp
80101463:	53                   	push   %ebx
  int i = 0;
  
  initlock(&icache.lock, "icache");
  for(i = 0; i < NINODE; i++) {
80101464:	31 db                	xor    %ebx,%ebx
  struct inode inode[NINODE];
} icache;

void
iinit(int dev)
{
80101466:	83 ec 24             	sub    $0x24,%esp
  int i = 0;
  
  initlock(&icache.lock, "icache");
80101469:	c7 44 24 04 4b 6e 10 	movl   $0x80106e4b,0x4(%esp)
80101470:	80 
80101471:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
80101478:	e8 93 2c 00 00       	call   80104110 <initlock>
8010147d:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; i < NINODE; i++) {
    initsleeplock(&icache.inode[i].lock, "inode");
80101480:	8d 04 db             	lea    (%ebx,%ebx,8),%eax
iinit(int dev)
{
  int i = 0;
  
  initlock(&icache.lock, "icache");
  for(i = 0; i < NINODE; i++) {
80101483:	83 c3 01             	add    $0x1,%ebx
    initsleeplock(&icache.inode[i].lock, "inode");
80101486:	c1 e0 04             	shl    $0x4,%eax
80101489:	05 20 0a 11 80       	add    $0x80110a20,%eax
8010148e:	c7 44 24 04 52 6e 10 	movl   $0x80106e52,0x4(%esp)
80101495:	80 
80101496:	89 04 24             	mov    %eax,(%esp)
80101499:	e8 42 2b 00 00       	call   80103fe0 <initsleeplock>
iinit(int dev)
{
  int i = 0;
  
  initlock(&icache.lock, "icache");
  for(i = 0; i < NINODE; i++) {
8010149e:	83 fb 32             	cmp    $0x32,%ebx
801014a1:	75 dd                	jne    80101480 <iinit+0x20>
    initsleeplock(&icache.inode[i].lock, "inode");
  }

  readsb(dev, &sb);
801014a3:	8b 45 08             	mov    0x8(%ebp),%eax
801014a6:	c7 44 24 04 c0 09 11 	movl   $0x801109c0,0x4(%esp)
801014ad:	80 
801014ae:	89 04 24             	mov    %eax,(%esp)
801014b1:	e8 5a ff ff ff       	call   80101410 <readsb>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
801014b6:	a1 d8 09 11 80       	mov    0x801109d8,%eax
801014bb:	c7 04 24 b8 6e 10 80 	movl   $0x80106eb8,(%esp)
801014c2:	89 44 24 1c          	mov    %eax,0x1c(%esp)
801014c6:	a1 d4 09 11 80       	mov    0x801109d4,%eax
801014cb:	89 44 24 18          	mov    %eax,0x18(%esp)
801014cf:	a1 d0 09 11 80       	mov    0x801109d0,%eax
801014d4:	89 44 24 14          	mov    %eax,0x14(%esp)
801014d8:	a1 cc 09 11 80       	mov    0x801109cc,%eax
801014dd:	89 44 24 10          	mov    %eax,0x10(%esp)
801014e1:	a1 c8 09 11 80       	mov    0x801109c8,%eax
801014e6:	89 44 24 0c          	mov    %eax,0xc(%esp)
801014ea:	a1 c4 09 11 80       	mov    0x801109c4,%eax
801014ef:	89 44 24 08          	mov    %eax,0x8(%esp)
801014f3:	a1 c0 09 11 80       	mov    0x801109c0,%eax
801014f8:	89 44 24 04          	mov    %eax,0x4(%esp)
801014fc:	e8 4f f1 ff ff       	call   80100650 <cprintf>
 inodestart %d bmap start %d\n", sb.size, sb.nblocks,
          sb.ninodes, sb.nlog, sb.logstart, sb.inodestart,
          sb.bmapstart);
}
80101501:	83 c4 24             	add    $0x24,%esp
80101504:	5b                   	pop    %ebx
80101505:	5d                   	pop    %ebp
80101506:	c3                   	ret    
80101507:	89 f6                	mov    %esi,%esi
80101509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101510 <ialloc>:
// Allocate an inode on device dev.
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode.
struct inode*
ialloc(uint dev, short type)
{
80101510:	55                   	push   %ebp
80101511:	89 e5                	mov    %esp,%ebp
80101513:	57                   	push   %edi
80101514:	56                   	push   %esi
80101515:	53                   	push   %ebx
80101516:	83 ec 2c             	sub    $0x2c,%esp
80101519:	8b 45 08             	mov    0x8(%ebp),%eax
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
8010151c:	83 3d c8 09 11 80 01 	cmpl   $0x1,0x801109c8
// Allocate an inode on device dev.
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode.
struct inode*
ialloc(uint dev, short type)
{
80101523:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101526:	0f b7 45 0c          	movzwl 0xc(%ebp),%eax
8010152a:	66 89 45 e2          	mov    %ax,-0x1e(%ebp)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
8010152e:	0f 86 95 00 00 00    	jbe    801015c9 <ialloc+0xb9>
80101534:	be 01 00 00 00       	mov    $0x1,%esi
80101539:	bb 01 00 00 00       	mov    $0x1,%ebx
8010153e:	eb 15                	jmp    80101555 <ialloc+0x45>
80101540:	83 c3 01             	add    $0x1,%ebx
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
80101543:	89 3c 24             	mov    %edi,(%esp)
{
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
80101546:	89 de                	mov    %ebx,%esi
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
80101548:	e8 93 ec ff ff       	call   801001e0 <brelse>
{
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
8010154d:	3b 1d c8 09 11 80    	cmp    0x801109c8,%ebx
80101553:	73 74                	jae    801015c9 <ialloc+0xb9>
    bp = bread(dev, IBLOCK(inum, sb));
80101555:	89 f0                	mov    %esi,%eax
80101557:	c1 e8 03             	shr    $0x3,%eax
8010155a:	03 05 d4 09 11 80    	add    0x801109d4,%eax
80101560:	89 44 24 04          	mov    %eax,0x4(%esp)
80101564:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101567:	89 04 24             	mov    %eax,(%esp)
8010156a:	e8 61 eb ff ff       	call   801000d0 <bread>
8010156f:	89 c7                	mov    %eax,%edi
    dip = (struct dinode*)bp->data + inum%IPB;
80101571:	89 f0                	mov    %esi,%eax
80101573:	83 e0 07             	and    $0x7,%eax
80101576:	c1 e0 06             	shl    $0x6,%eax
80101579:	8d 54 07 5c          	lea    0x5c(%edi,%eax,1),%edx
    if(dip->type == 0){  // a free inode
8010157d:	66 83 3a 00          	cmpw   $0x0,(%edx)
80101581:	75 bd                	jne    80101540 <ialloc+0x30>
      memset(dip, 0, sizeof(*dip));
80101583:	89 14 24             	mov    %edx,(%esp)
80101586:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101589:	c7 44 24 08 40 00 00 	movl   $0x40,0x8(%esp)
80101590:	00 
80101591:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80101598:	00 
80101599:	e8 a2 2d 00 00       	call   80104340 <memset>
      dip->type = type;
8010159e:	8b 55 dc             	mov    -0x24(%ebp),%edx
801015a1:	0f b7 45 e2          	movzwl -0x1e(%ebp),%eax
801015a5:	66 89 02             	mov    %ax,(%edx)
      log_write(bp);   // mark it allocated on the disk
801015a8:	89 3c 24             	mov    %edi,(%esp)
801015ab:	e8 60 17 00 00       	call   80102d10 <log_write>
      brelse(bp);
801015b0:	89 3c 24             	mov    %edi,(%esp)
801015b3:	e8 28 ec ff ff       	call   801001e0 <brelse>
      return iget(dev, inum);
801015b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
801015bb:	83 c4 2c             	add    $0x2c,%esp
801015be:	5b                   	pop    %ebx
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
801015bf:	89 f2                	mov    %esi,%edx
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
801015c1:	5e                   	pop    %esi
801015c2:	5f                   	pop    %edi
801015c3:	5d                   	pop    %ebp
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
801015c4:	e9 57 fb ff ff       	jmp    80101120 <iget>
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
801015c9:	c7 04 24 58 6e 10 80 	movl   $0x80106e58,(%esp)
801015d0:	e8 9b ed ff ff       	call   80100370 <panic>
801015d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801015d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801015e0 <iupdate>:
// Must be called after every change to an ip->xxx field
// that lives on disk, since i-node cache is write-through.
// Caller must hold ip->lock.
void
iupdate(struct inode *ip)
{
801015e0:	55                   	push   %ebp
801015e1:	89 e5                	mov    %esp,%ebp
801015e3:	56                   	push   %esi
801015e4:	53                   	push   %ebx
801015e5:	83 ec 10             	sub    $0x10,%esp
801015e8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801015eb:	8b 43 04             	mov    0x4(%ebx),%eax
801015ee:	c1 e8 03             	shr    $0x3,%eax
801015f1:	03 05 d4 09 11 80    	add    0x801109d4,%eax
801015f7:	89 44 24 04          	mov    %eax,0x4(%esp)
801015fb:	8b 03                	mov    (%ebx),%eax
801015fd:	89 04 24             	mov    %eax,(%esp)
80101600:	e8 cb ea ff ff       	call   801000d0 <bread>
  dip = (struct dinode*)bp->data + ip->inum%IPB;
  dip->type = ip->type;
80101605:	0f b7 53 50          	movzwl 0x50(%ebx),%edx
iupdate(struct inode *ip)
{
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101609:	89 c6                	mov    %eax,%esi
  dip = (struct dinode*)bp->data + ip->inum%IPB;
8010160b:	8b 43 04             	mov    0x4(%ebx),%eax
8010160e:	83 e0 07             	and    $0x7,%eax
80101611:	c1 e0 06             	shl    $0x6,%eax
80101614:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
  dip->type = ip->type;
80101618:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
8010161b:	0f b7 53 52          	movzwl 0x52(%ebx),%edx
8010161f:	66 89 50 02          	mov    %dx,0x2(%eax)
  dip->minor = ip->minor;
80101623:	0f b7 53 54          	movzwl 0x54(%ebx),%edx
80101627:	66 89 50 04          	mov    %dx,0x4(%eax)
  dip->nlink = ip->nlink;
8010162b:	0f b7 53 56          	movzwl 0x56(%ebx),%edx
8010162f:	66 89 50 06          	mov    %dx,0x6(%eax)
  dip->size = ip->size;
80101633:	8b 53 58             	mov    0x58(%ebx),%edx
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
80101636:	83 c3 5c             	add    $0x5c,%ebx
  dip = (struct dinode*)bp->data + ip->inum%IPB;
  dip->type = ip->type;
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
80101639:	89 50 08             	mov    %edx,0x8(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010163c:	83 c0 0c             	add    $0xc,%eax
8010163f:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80101643:	c7 44 24 08 34 00 00 	movl   $0x34,0x8(%esp)
8010164a:	00 
8010164b:	89 04 24             	mov    %eax,(%esp)
8010164e:	e8 ad 2d 00 00       	call   80104400 <memmove>
  log_write(bp);
80101653:	89 34 24             	mov    %esi,(%esp)
80101656:	e8 b5 16 00 00       	call   80102d10 <log_write>
  brelse(bp);
8010165b:	89 75 08             	mov    %esi,0x8(%ebp)
}
8010165e:	83 c4 10             	add    $0x10,%esp
80101661:	5b                   	pop    %ebx
80101662:	5e                   	pop    %esi
80101663:	5d                   	pop    %ebp
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
  log_write(bp);
  brelse(bp);
80101664:	e9 77 eb ff ff       	jmp    801001e0 <brelse>
80101669:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101670 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
80101670:	55                   	push   %ebp
80101671:	89 e5                	mov    %esp,%ebp
80101673:	53                   	push   %ebx
80101674:	83 ec 14             	sub    $0x14,%esp
80101677:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
8010167a:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
80101681:	e8 fa 2b 00 00       	call   80104280 <acquire>
  ip->ref++;
80101686:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
8010168a:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
80101691:	e8 5a 2c 00 00       	call   801042f0 <release>
  return ip;
}
80101696:	83 c4 14             	add    $0x14,%esp
80101699:	89 d8                	mov    %ebx,%eax
8010169b:	5b                   	pop    %ebx
8010169c:	5d                   	pop    %ebp
8010169d:	c3                   	ret    
8010169e:	66 90                	xchg   %ax,%ax

801016a0 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
801016a0:	55                   	push   %ebp
801016a1:	89 e5                	mov    %esp,%ebp
801016a3:	56                   	push   %esi
801016a4:	53                   	push   %ebx
801016a5:	83 ec 10             	sub    $0x10,%esp
801016a8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
801016ab:	85 db                	test   %ebx,%ebx
801016ad:	0f 84 b3 00 00 00    	je     80101766 <ilock+0xc6>
801016b3:	8b 4b 08             	mov    0x8(%ebx),%ecx
801016b6:	85 c9                	test   %ecx,%ecx
801016b8:	0f 8e a8 00 00 00    	jle    80101766 <ilock+0xc6>
    panic("ilock");

  acquiresleep(&ip->lock);
801016be:	8d 43 0c             	lea    0xc(%ebx),%eax
801016c1:	89 04 24             	mov    %eax,(%esp)
801016c4:	e8 57 29 00 00       	call   80104020 <acquiresleep>

  if(ip->valid == 0){
801016c9:	8b 53 4c             	mov    0x4c(%ebx),%edx
801016cc:	85 d2                	test   %edx,%edx
801016ce:	74 08                	je     801016d8 <ilock+0x38>
    brelse(bp);
    ip->valid = 1;
    if(ip->type == 0)
      panic("ilock: no type");
  }
}
801016d0:	83 c4 10             	add    $0x10,%esp
801016d3:	5b                   	pop    %ebx
801016d4:	5e                   	pop    %esi
801016d5:	5d                   	pop    %ebp
801016d6:	c3                   	ret    
801016d7:	90                   	nop
    panic("ilock");

  acquiresleep(&ip->lock);

  if(ip->valid == 0){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801016d8:	8b 43 04             	mov    0x4(%ebx),%eax
801016db:	c1 e8 03             	shr    $0x3,%eax
801016de:	03 05 d4 09 11 80    	add    0x801109d4,%eax
801016e4:	89 44 24 04          	mov    %eax,0x4(%esp)
801016e8:	8b 03                	mov    (%ebx),%eax
801016ea:	89 04 24             	mov    %eax,(%esp)
801016ed:	e8 de e9 ff ff       	call   801000d0 <bread>
801016f2:	89 c6                	mov    %eax,%esi
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801016f4:	8b 43 04             	mov    0x4(%ebx),%eax
801016f7:	83 e0 07             	and    $0x7,%eax
801016fa:	c1 e0 06             	shl    $0x6,%eax
801016fd:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
    ip->type = dip->type;
80101701:	0f b7 10             	movzwl (%eax),%edx
80101704:	66 89 53 50          	mov    %dx,0x50(%ebx)
    ip->major = dip->major;
80101708:	0f b7 50 02          	movzwl 0x2(%eax),%edx
8010170c:	66 89 53 52          	mov    %dx,0x52(%ebx)
    ip->minor = dip->minor;
80101710:	0f b7 50 04          	movzwl 0x4(%eax),%edx
80101714:	66 89 53 54          	mov    %dx,0x54(%ebx)
    ip->nlink = dip->nlink;
80101718:	0f b7 50 06          	movzwl 0x6(%eax),%edx
8010171c:	66 89 53 56          	mov    %dx,0x56(%ebx)
    ip->size = dip->size;
80101720:	8b 50 08             	mov    0x8(%eax),%edx
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
80101723:	83 c0 0c             	add    $0xc,%eax
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    ip->type = dip->type;
    ip->major = dip->major;
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
80101726:	89 53 58             	mov    %edx,0x58(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
80101729:	89 44 24 04          	mov    %eax,0x4(%esp)
8010172d:	8d 43 5c             	lea    0x5c(%ebx),%eax
80101730:	c7 44 24 08 34 00 00 	movl   $0x34,0x8(%esp)
80101737:	00 
80101738:	89 04 24             	mov    %eax,(%esp)
8010173b:	e8 c0 2c 00 00       	call   80104400 <memmove>
    brelse(bp);
80101740:	89 34 24             	mov    %esi,(%esp)
80101743:	e8 98 ea ff ff       	call   801001e0 <brelse>
    ip->valid = 1;
    if(ip->type == 0)
80101748:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
    brelse(bp);
    ip->valid = 1;
8010174d:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
    if(ip->type == 0)
80101754:	0f 85 76 ff ff ff    	jne    801016d0 <ilock+0x30>
      panic("ilock: no type");
8010175a:	c7 04 24 70 6e 10 80 	movl   $0x80106e70,(%esp)
80101761:	e8 0a ec ff ff       	call   80100370 <panic>
{
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    panic("ilock");
80101766:	c7 04 24 6a 6e 10 80 	movl   $0x80106e6a,(%esp)
8010176d:	e8 fe eb ff ff       	call   80100370 <panic>
80101772:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101780 <iunlock>:
}

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
80101780:	55                   	push   %ebp
80101781:	89 e5                	mov    %esp,%ebp
80101783:	83 ec 18             	sub    $0x18,%esp
80101786:	89 5d f8             	mov    %ebx,-0x8(%ebp)
80101789:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010178c:	89 75 fc             	mov    %esi,-0x4(%ebp)
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
8010178f:	85 db                	test   %ebx,%ebx
80101791:	74 27                	je     801017ba <iunlock+0x3a>
80101793:	8d 73 0c             	lea    0xc(%ebx),%esi
80101796:	89 34 24             	mov    %esi,(%esp)
80101799:	e8 22 29 00 00       	call   801040c0 <holdingsleep>
8010179e:	85 c0                	test   %eax,%eax
801017a0:	74 18                	je     801017ba <iunlock+0x3a>
801017a2:	8b 5b 08             	mov    0x8(%ebx),%ebx
801017a5:	85 db                	test   %ebx,%ebx
801017a7:	7e 11                	jle    801017ba <iunlock+0x3a>
    panic("iunlock");

  releasesleep(&ip->lock);
801017a9:	89 75 08             	mov    %esi,0x8(%ebp)
}
801017ac:	8b 5d f8             	mov    -0x8(%ebp),%ebx
801017af:	8b 75 fc             	mov    -0x4(%ebp),%esi
801017b2:	89 ec                	mov    %ebp,%esp
801017b4:	5d                   	pop    %ebp
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");

  releasesleep(&ip->lock);
801017b5:	e9 c6 28 00 00       	jmp    80104080 <releasesleep>
// Unlock the given inode.
void
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");
801017ba:	c7 04 24 7f 6e 10 80 	movl   $0x80106e7f,(%esp)
801017c1:	e8 aa eb ff ff       	call   80100370 <panic>
801017c6:	8d 76 00             	lea    0x0(%esi),%esi
801017c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801017d0 <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
801017d0:	55                   	push   %ebp
801017d1:	89 e5                	mov    %esp,%ebp
801017d3:	83 ec 38             	sub    $0x38,%esp
801017d6:	89 75 f8             	mov    %esi,-0x8(%ebp)
801017d9:	8b 75 08             	mov    0x8(%ebp),%esi
801017dc:	89 7d fc             	mov    %edi,-0x4(%ebp)
801017df:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  acquiresleep(&ip->lock);
801017e2:	8d 7e 0c             	lea    0xc(%esi),%edi
801017e5:	89 3c 24             	mov    %edi,(%esp)
801017e8:	e8 33 28 00 00       	call   80104020 <acquiresleep>
  if(ip->valid && ip->nlink == 0){
801017ed:	8b 46 4c             	mov    0x4c(%esi),%eax
801017f0:	85 c0                	test   %eax,%eax
801017f2:	74 07                	je     801017fb <iput+0x2b>
801017f4:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
801017f9:	74 35                	je     80101830 <iput+0x60>
      ip->type = 0;
      iupdate(ip);
      ip->valid = 0;
    }
  }
  releasesleep(&ip->lock);
801017fb:	89 3c 24             	mov    %edi,(%esp)
801017fe:	e8 7d 28 00 00       	call   80104080 <releasesleep>

  acquire(&icache.lock);
80101803:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
8010180a:	e8 71 2a 00 00       	call   80104280 <acquire>
  ip->ref--;
8010180f:	83 6e 08 01          	subl   $0x1,0x8(%esi)
  release(&icache.lock);
}
80101813:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  }
  releasesleep(&ip->lock);

  acquire(&icache.lock);
  ip->ref--;
  release(&icache.lock);
80101816:	c7 45 08 e0 09 11 80 	movl   $0x801109e0,0x8(%ebp)
}
8010181d:	8b 75 f8             	mov    -0x8(%ebp),%esi
80101820:	8b 7d fc             	mov    -0x4(%ebp),%edi
80101823:	89 ec                	mov    %ebp,%esp
80101825:	5d                   	pop    %ebp
  }
  releasesleep(&ip->lock);

  acquire(&icache.lock);
  ip->ref--;
  release(&icache.lock);
80101826:	e9 c5 2a 00 00       	jmp    801042f0 <release>
8010182b:	90                   	nop
8010182c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
void
iput(struct inode *ip)
{
  acquiresleep(&ip->lock);
  if(ip->valid && ip->nlink == 0){
    acquire(&icache.lock);
80101830:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
80101837:	e8 44 2a 00 00       	call   80104280 <acquire>
    int r = ip->ref;
8010183c:	8b 5e 08             	mov    0x8(%esi),%ebx
    release(&icache.lock);
8010183f:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
80101846:	e8 a5 2a 00 00       	call   801042f0 <release>
    if(r == 1){
8010184b:	83 fb 01             	cmp    $0x1,%ebx
8010184e:	75 ab                	jne    801017fb <iput+0x2b>
// If that was the last reference and the inode has no links
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
80101850:	8d 4e 30             	lea    0x30(%esi),%ecx
  acquiresleep(&ip->lock);
  if(ip->valid && ip->nlink == 0){
    acquire(&icache.lock);
    int r = ip->ref;
    release(&icache.lock);
    if(r == 1){
80101853:	89 f3                	mov    %esi,%ebx
// If that was the last reference and the inode has no links
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
80101855:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101858:	89 cf                	mov    %ecx,%edi
8010185a:	eb 0b                	jmp    80101867 <iput+0x97>
8010185c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint *a;

  for(i = 0; i < NDIRECT; i++){
    if(ip->addrs[i]){
      bfree(ip->dev, ip->addrs[i]);
      ip->addrs[i] = 0;
80101860:	83 c3 04             	add    $0x4,%ebx
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
80101863:	39 fb                	cmp    %edi,%ebx
80101865:	74 19                	je     80101880 <iput+0xb0>
    if(ip->addrs[i]){
80101867:	8b 53 5c             	mov    0x5c(%ebx),%edx
8010186a:	85 d2                	test   %edx,%edx
8010186c:	74 f2                	je     80101860 <iput+0x90>
      bfree(ip->dev, ip->addrs[i]);
8010186e:	8b 06                	mov    (%esi),%eax
80101870:	e8 6b f9 ff ff       	call   801011e0 <bfree>
      ip->addrs[i] = 0;
80101875:	c7 43 5c 00 00 00 00 	movl   $0x0,0x5c(%ebx)
8010187c:	eb e2                	jmp    80101860 <iput+0x90>
8010187e:	66 90                	xchg   %ax,%ax
    }
  }

  if(ip->addrs[NDIRECT]){
80101880:	8b 86 8c 00 00 00    	mov    0x8c(%esi),%eax
80101886:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101889:	85 c0                	test   %eax,%eax
8010188b:	75 2b                	jne    801018b8 <iput+0xe8>
    brelse(bp);
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
8010188d:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
  iupdate(ip);
80101894:	89 34 24             	mov    %esi,(%esp)
80101897:	e8 44 fd ff ff       	call   801015e0 <iupdate>
    int r = ip->ref;
    release(&icache.lock);
    if(r == 1){
      // inode has no links and no other references: truncate and free.
      itrunc(ip);
      ip->type = 0;
8010189c:	66 c7 46 50 00 00    	movw   $0x0,0x50(%esi)
      iupdate(ip);
801018a2:	89 34 24             	mov    %esi,(%esp)
801018a5:	e8 36 fd ff ff       	call   801015e0 <iupdate>
      ip->valid = 0;
801018aa:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
801018b1:	e9 45 ff ff ff       	jmp    801017fb <iput+0x2b>
801018b6:	66 90                	xchg   %ax,%ax
      ip->addrs[i] = 0;
    }
  }

  if(ip->addrs[NDIRECT]){
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
801018b8:	89 44 24 04          	mov    %eax,0x4(%esp)
801018bc:	8b 06                	mov    (%esi),%eax
    a = (uint*)bp->data;
    for(j = 0; j < NINDIRECT; j++){
801018be:	31 db                	xor    %ebx,%ebx
      ip->addrs[i] = 0;
    }
  }

  if(ip->addrs[NDIRECT]){
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
801018c0:	89 04 24             	mov    %eax,(%esp)
801018c3:	e8 08 e8 ff ff       	call   801000d0 <bread>
    a = (uint*)bp->data;
    for(j = 0; j < NINDIRECT; j++){
801018c8:	89 7d e0             	mov    %edi,-0x20(%ebp)
801018cb:	89 f7                	mov    %esi,%edi
    }
  }

  if(ip->addrs[NDIRECT]){
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
    a = (uint*)bp->data;
801018cd:	89 c1                	mov    %eax,%ecx
801018cf:	83 c1 5c             	add    $0x5c,%ecx
      ip->addrs[i] = 0;
    }
  }

  if(ip->addrs[NDIRECT]){
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
801018d2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    a = (uint*)bp->data;
    for(j = 0; j < NINDIRECT; j++){
801018d5:	89 ce                	mov    %ecx,%esi
801018d7:	31 c0                	xor    %eax,%eax
801018d9:	eb 12                	jmp    801018ed <iput+0x11d>
801018db:	90                   	nop
801018dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801018e0:	83 c3 01             	add    $0x1,%ebx
801018e3:	81 fb 80 00 00 00    	cmp    $0x80,%ebx
801018e9:	89 d8                	mov    %ebx,%eax
801018eb:	74 10                	je     801018fd <iput+0x12d>
      if(a[j])
801018ed:	8b 14 86             	mov    (%esi,%eax,4),%edx
801018f0:	85 d2                	test   %edx,%edx
801018f2:	74 ec                	je     801018e0 <iput+0x110>
        bfree(ip->dev, a[j]);
801018f4:	8b 07                	mov    (%edi),%eax
801018f6:	e8 e5 f8 ff ff       	call   801011e0 <bfree>
801018fb:	eb e3                	jmp    801018e0 <iput+0x110>
    }
    brelse(bp);
801018fd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101900:	89 fe                	mov    %edi,%esi
80101902:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101905:	89 04 24             	mov    %eax,(%esp)
80101908:	e8 d3 e8 ff ff       	call   801001e0 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
8010190d:	8b 96 8c 00 00 00    	mov    0x8c(%esi),%edx
80101913:	8b 06                	mov    (%esi),%eax
80101915:	e8 c6 f8 ff ff       	call   801011e0 <bfree>
    ip->addrs[NDIRECT] = 0;
8010191a:	c7 86 8c 00 00 00 00 	movl   $0x0,0x8c(%esi)
80101921:	00 00 00 
80101924:	e9 64 ff ff ff       	jmp    8010188d <iput+0xbd>
80101929:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101930 <iunlockput>:
}

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
80101930:	55                   	push   %ebp
80101931:	89 e5                	mov    %esp,%ebp
80101933:	53                   	push   %ebx
80101934:	83 ec 14             	sub    $0x14,%esp
80101937:	8b 5d 08             	mov    0x8(%ebp),%ebx
  iunlock(ip);
8010193a:	89 1c 24             	mov    %ebx,(%esp)
8010193d:	e8 3e fe ff ff       	call   80101780 <iunlock>
  iput(ip);
80101942:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80101945:	83 c4 14             	add    $0x14,%esp
80101948:	5b                   	pop    %ebx
80101949:	5d                   	pop    %ebp
// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
  iput(ip);
8010194a:	e9 81 fe ff ff       	jmp    801017d0 <iput>
8010194f:	90                   	nop

80101950 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
80101950:	55                   	push   %ebp
80101951:	89 e5                	mov    %esp,%ebp
80101953:	8b 55 08             	mov    0x8(%ebp),%edx
80101956:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
80101959:	8b 0a                	mov    (%edx),%ecx
8010195b:	89 48 04             	mov    %ecx,0x4(%eax)
  st->ino = ip->inum;
8010195e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101961:	89 48 08             	mov    %ecx,0x8(%eax)
  st->type = ip->type;
80101964:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101968:	66 89 08             	mov    %cx,(%eax)
  st->nlink = ip->nlink;
8010196b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010196f:	66 89 48 0c          	mov    %cx,0xc(%eax)
  st->size = ip->size;
80101973:	8b 52 58             	mov    0x58(%edx),%edx
80101976:	89 50 10             	mov    %edx,0x10(%eax)
}
80101979:	5d                   	pop    %ebp
8010197a:	c3                   	ret    
8010197b:	90                   	nop
8010197c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101980 <readi>:
//PAGEBREAK!
// Read data from inode.
// Caller must hold ip->lock.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101980:	55                   	push   %ebp
80101981:	89 e5                	mov    %esp,%ebp
80101983:	57                   	push   %edi
80101984:	56                   	push   %esi
80101985:	53                   	push   %ebx
80101986:	83 ec 2c             	sub    $0x2c,%esp
80101989:	8b 75 08             	mov    0x8(%ebp),%esi
8010198c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010198f:	8b 55 14             	mov    0x14(%ebp),%edx
80101992:	8b 5d 10             	mov    0x10(%ebp),%ebx
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101995:	66 83 7e 50 03       	cmpw   $0x3,0x50(%esi)
//PAGEBREAK!
// Read data from inode.
// Caller must hold ip->lock.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
8010199a:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010199d:	89 55 dc             	mov    %edx,-0x24(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
801019a0:	0f 84 da 00 00 00    	je     80101a80 <readi+0x100>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
801019a6:	8b 56 58             	mov    0x58(%esi),%edx
    return -1;
801019a9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
801019ae:	39 da                	cmp    %ebx,%edx
801019b0:	0f 82 bd 00 00 00    	jb     80101a73 <readi+0xf3>
801019b6:	8b 4d dc             	mov    -0x24(%ebp),%ecx
801019b9:	01 d9                	add    %ebx,%ecx
801019bb:	0f 82 b2 00 00 00    	jb     80101a73 <readi+0xf3>
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
801019c1:	89 d0                	mov    %edx,%eax
801019c3:	29 d8                	sub    %ebx,%eax
801019c5:	39 ca                	cmp    %ecx,%edx
801019c7:	0f 43 45 dc          	cmovae -0x24(%ebp),%eax

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019cb:	85 c0                	test   %eax,%eax
  }

  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
801019cd:	89 45 dc             	mov    %eax,-0x24(%ebp)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019d0:	0f 84 9a 00 00 00    	je     80101a70 <readi+0xf0>
801019d6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
801019dd:	eb 6a                	jmp    80101a49 <readi+0xc9>
801019df:	90                   	nop
{
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
801019e0:	8d 7a 14             	lea    0x14(%edx),%edi
801019e3:	8b 44 be 0c          	mov    0xc(%esi,%edi,4),%eax
801019e7:	85 c0                	test   %eax,%eax
801019e9:	74 75                	je     80101a60 <readi+0xe0>
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019eb:	89 44 24 04          	mov    %eax,0x4(%esp)
801019ef:	8b 06                	mov    (%esi),%eax
    m = min(n - tot, BSIZE - off%BSIZE);
801019f1:	bf 00 02 00 00       	mov    $0x200,%edi
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019f6:	89 04 24             	mov    %eax,(%esp)
801019f9:	e8 d2 e6 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
801019fe:	8b 4d dc             	mov    -0x24(%ebp),%ecx
80101a01:	2b 4d e4             	sub    -0x1c(%ebp),%ecx
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101a04:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
80101a06:	89 d8                	mov    %ebx,%eax
80101a08:	25 ff 01 00 00       	and    $0x1ff,%eax
80101a0d:	29 c7                	sub    %eax,%edi
    memmove(dst, bp->data + off%BSIZE, m);
80101a0f:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
80101a13:	39 cf                	cmp    %ecx,%edi
    memmove(dst, bp->data + off%BSIZE, m);
80101a15:	89 44 24 04          	mov    %eax,0x4(%esp)
80101a19:	8b 45 e0             	mov    -0x20(%ebp),%eax
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
80101a1c:	0f 47 f9             	cmova  %ecx,%edi
    memmove(dst, bp->data + off%BSIZE, m);
80101a1f:	89 55 d8             	mov    %edx,-0x28(%ebp)
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a22:	01 fb                	add    %edi,%ebx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
80101a24:	89 7c 24 08          	mov    %edi,0x8(%esp)
80101a28:	89 04 24             	mov    %eax,(%esp)
80101a2b:	e8 d0 29 00 00       	call   80104400 <memmove>
    brelse(bp);
80101a30:	8b 55 d8             	mov    -0x28(%ebp),%edx
80101a33:	89 14 24             	mov    %edx,(%esp)
80101a36:	e8 a5 e7 ff ff       	call   801001e0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a3b:	01 7d e4             	add    %edi,-0x1c(%ebp)
80101a3e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101a41:	01 7d e0             	add    %edi,-0x20(%ebp)
80101a44:	39 55 dc             	cmp    %edx,-0x24(%ebp)
80101a47:	76 27                	jbe    80101a70 <readi+0xf0>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101a49:	89 da                	mov    %ebx,%edx
80101a4b:	c1 ea 09             	shr    $0x9,%edx
bmap(struct inode *ip, uint bn)
{
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
80101a4e:	83 fa 0b             	cmp    $0xb,%edx
80101a51:	76 8d                	jbe    801019e0 <readi+0x60>
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
80101a53:	89 f0                	mov    %esi,%eax
80101a55:	e8 26 f9 ff ff       	call   80101380 <bmap.part.0>
80101a5a:	eb 8f                	jmp    801019eb <readi+0x6b>
80101a5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101a60:	8b 06                	mov    (%esi),%eax
80101a62:	e8 f9 f7 ff ff       	call   80101260 <balloc>
80101a67:	89 44 be 0c          	mov    %eax,0xc(%esi,%edi,4)
80101a6b:	e9 7b ff ff ff       	jmp    801019eb <readi+0x6b>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
80101a70:	8b 45 dc             	mov    -0x24(%ebp),%eax
}
80101a73:	83 c4 2c             	add    $0x2c,%esp
80101a76:	5b                   	pop    %ebx
80101a77:	5e                   	pop    %esi
80101a78:	5f                   	pop    %edi
80101a79:	5d                   	pop    %ebp
80101a7a:	c3                   	ret    
80101a7b:	90                   	nop
80101a7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
80101a80:	0f b7 46 52          	movzwl 0x52(%esi),%eax
80101a84:	66 83 f8 09          	cmp    $0x9,%ax
80101a88:	77 18                	ja     80101aa2 <readi+0x122>
80101a8a:	98                   	cwtl   
80101a8b:	8b 04 c5 60 09 11 80 	mov    -0x7feef6a0(,%eax,8),%eax
80101a92:	85 c0                	test   %eax,%eax
80101a94:	74 0c                	je     80101aa2 <readi+0x122>
      return -1;
    return devsw[ip->major].read(ip, dst, n);
80101a96:	89 55 10             	mov    %edx,0x10(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
}
80101a99:	83 c4 2c             	add    $0x2c,%esp
80101a9c:	5b                   	pop    %ebx
80101a9d:	5e                   	pop    %esi
80101a9e:	5f                   	pop    %edi
80101a9f:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
80101aa0:	ff e0                	jmp    *%eax
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
80101aa2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101aa7:	eb ca                	jmp    80101a73 <readi+0xf3>
80101aa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101ab0 <writei>:
// PAGEBREAK!
// Write data to inode.
// Caller must hold ip->lock.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101ab0:	55                   	push   %ebp
80101ab1:	89 e5                	mov    %esp,%ebp
80101ab3:	57                   	push   %edi
80101ab4:	56                   	push   %esi
80101ab5:	53                   	push   %ebx
80101ab6:	83 ec 2c             	sub    $0x2c,%esp
80101ab9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101abc:	8b 75 08             	mov    0x8(%ebp),%esi
80101abf:	8b 5d 10             	mov    0x10(%ebp),%ebx
80101ac2:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101ac5:	8b 4d 14             	mov    0x14(%ebp),%ecx
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101ac8:	66 83 7e 50 03       	cmpw   $0x3,0x50(%esi)
// PAGEBREAK!
// Write data to inode.
// Caller must hold ip->lock.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101acd:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101ad0:	0f 84 f2 00 00 00    	je     80101bc8 <writei+0x118>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  if(off > ip->size || off + n < off)
80101ad6:	39 5e 58             	cmp    %ebx,0x58(%esi)
    return -1;
80101ad9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  if(off > ip->size || off + n < off)
80101ade:	0f 82 d7 00 00 00    	jb     80101bbb <writei+0x10b>
80101ae4:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101ae7:	01 da                	add    %ebx,%edx
80101ae9:	0f 82 cc 00 00 00    	jb     80101bbb <writei+0x10b>
    return -1;
  if(off + n > MAXFILE*BSIZE)
80101aef:	81 fa 00 18 01 00    	cmp    $0x11800,%edx
80101af5:	0f 87 c0 00 00 00    	ja     80101bbb <writei+0x10b>
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101afb:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101afe:	85 c0                	test   %eax,%eax
80101b00:	0f 84 b2 00 00 00    	je     80101bb8 <writei+0x108>
80101b06:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101b0d:	eb 75                	jmp    80101b84 <writei+0xd4>
80101b0f:	90                   	nop
{
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
80101b10:	8d 7a 14             	lea    0x14(%edx),%edi
80101b13:	8b 44 be 0c          	mov    0xc(%esi,%edi,4),%eax
80101b17:	85 c0                	test   %eax,%eax
80101b19:	74 7d                	je     80101b98 <writei+0xe8>
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101b1b:	89 44 24 04          	mov    %eax,0x4(%esp)
80101b1f:	8b 06                	mov    (%esi),%eax
    m = min(n - tot, BSIZE - off%BSIZE);
80101b21:	bf 00 02 00 00       	mov    $0x200,%edi
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101b26:	89 04 24             	mov    %eax,(%esp)
80101b29:	e8 a2 e5 ff ff       	call   801000d0 <bread>
    m = min(n - tot, BSIZE - off%BSIZE);
80101b2e:	8b 4d dc             	mov    -0x24(%ebp),%ecx
80101b31:	2b 4d e4             	sub    -0x1c(%ebp),%ecx
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101b34:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
80101b36:	89 d8                	mov    %ebx,%eax
80101b38:	25 ff 01 00 00       	and    $0x1ff,%eax
80101b3d:	29 c7                	sub    %eax,%edi
80101b3f:	39 cf                	cmp    %ecx,%edi
80101b41:	0f 47 f9             	cmova  %ecx,%edi
    memmove(bp->data + off%BSIZE, src, m);
80101b44:	8b 4d e0             	mov    -0x20(%ebp),%ecx
80101b47:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101b4b:	01 fb                	add    %edi,%ebx
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(bp->data + off%BSIZE, src, m);
80101b4d:	89 55 d8             	mov    %edx,-0x28(%ebp)
80101b50:	89 7c 24 08          	mov    %edi,0x8(%esp)
80101b54:	89 4c 24 04          	mov    %ecx,0x4(%esp)
80101b58:	89 04 24             	mov    %eax,(%esp)
80101b5b:	e8 a0 28 00 00       	call   80104400 <memmove>
    log_write(bp);
80101b60:	8b 55 d8             	mov    -0x28(%ebp),%edx
80101b63:	89 14 24             	mov    %edx,(%esp)
80101b66:	e8 a5 11 00 00       	call   80102d10 <log_write>
    brelse(bp);
80101b6b:	8b 55 d8             	mov    -0x28(%ebp),%edx
80101b6e:	89 14 24             	mov    %edx,(%esp)
80101b71:	e8 6a e6 ff ff       	call   801001e0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101b76:	01 7d e4             	add    %edi,-0x1c(%ebp)
80101b79:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101b7c:	01 7d e0             	add    %edi,-0x20(%ebp)
80101b7f:	39 4d dc             	cmp    %ecx,-0x24(%ebp)
80101b82:	76 24                	jbe    80101ba8 <writei+0xf8>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101b84:	89 da                	mov    %ebx,%edx
80101b86:	c1 ea 09             	shr    $0x9,%edx
bmap(struct inode *ip, uint bn)
{
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
80101b89:	83 fa 0b             	cmp    $0xb,%edx
80101b8c:	76 82                	jbe    80101b10 <writei+0x60>
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
80101b8e:	89 f0                	mov    %esi,%eax
80101b90:	e8 eb f7 ff ff       	call   80101380 <bmap.part.0>
80101b95:	eb 84                	jmp    80101b1b <writei+0x6b>
80101b97:	90                   	nop
80101b98:	8b 06                	mov    (%esi),%eax
80101b9a:	e8 c1 f6 ff ff       	call   80101260 <balloc>
80101b9f:	89 44 be 0c          	mov    %eax,0xc(%esi,%edi,4)
80101ba3:	e9 73 ff ff ff       	jmp    80101b1b <writei+0x6b>
    memmove(bp->data + off%BSIZE, src, m);
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
80101ba8:	39 5e 58             	cmp    %ebx,0x58(%esi)
80101bab:	73 0b                	jae    80101bb8 <writei+0x108>
    ip->size = off;
80101bad:	89 5e 58             	mov    %ebx,0x58(%esi)
    iupdate(ip);
80101bb0:	89 34 24             	mov    %esi,(%esp)
80101bb3:	e8 28 fa ff ff       	call   801015e0 <iupdate>
  }
  return n;
80101bb8:	8b 45 dc             	mov    -0x24(%ebp),%eax
}
80101bbb:	83 c4 2c             	add    $0x2c,%esp
80101bbe:	5b                   	pop    %ebx
80101bbf:	5e                   	pop    %esi
80101bc0:	5f                   	pop    %edi
80101bc1:	5d                   	pop    %ebp
80101bc2:	c3                   	ret    
80101bc3:	90                   	nop
80101bc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101bc8:	0f b7 46 52          	movzwl 0x52(%esi),%eax
80101bcc:	66 83 f8 09          	cmp    $0x9,%ax
80101bd0:	77 18                	ja     80101bea <writei+0x13a>
80101bd2:	98                   	cwtl   
80101bd3:	8b 04 c5 64 09 11 80 	mov    -0x7feef69c(,%eax,8),%eax
80101bda:	85 c0                	test   %eax,%eax
80101bdc:	74 0c                	je     80101bea <writei+0x13a>
      return -1;
    return devsw[ip->major].write(ip, src, n);
80101bde:	89 4d 10             	mov    %ecx,0x10(%ebp)
  if(n > 0 && off > ip->size){
    ip->size = off;
    iupdate(ip);
  }
  return n;
}
80101be1:	83 c4 2c             	add    $0x2c,%esp
80101be4:	5b                   	pop    %ebx
80101be5:	5e                   	pop    %esi
80101be6:	5f                   	pop    %edi
80101be7:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
80101be8:	ff e0                	jmp    *%eax
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
80101bea:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101bef:	eb ca                	jmp    80101bbb <writei+0x10b>
80101bf1:	eb 0d                	jmp    80101c00 <namecmp>
80101bf3:	90                   	nop
80101bf4:	90                   	nop
80101bf5:	90                   	nop
80101bf6:	90                   	nop
80101bf7:	90                   	nop
80101bf8:	90                   	nop
80101bf9:	90                   	nop
80101bfa:	90                   	nop
80101bfb:	90                   	nop
80101bfc:	90                   	nop
80101bfd:	90                   	nop
80101bfe:	90                   	nop
80101bff:	90                   	nop

80101c00 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80101c00:	55                   	push   %ebp
80101c01:	89 e5                	mov    %esp,%ebp
80101c03:	83 ec 18             	sub    $0x18,%esp
  return strncmp(s, t, DIRSIZ);
80101c06:	8b 45 0c             	mov    0xc(%ebp),%eax
80101c09:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
80101c10:	00 
80101c11:	89 44 24 04          	mov    %eax,0x4(%esp)
80101c15:	8b 45 08             	mov    0x8(%ebp),%eax
80101c18:	89 04 24             	mov    %eax,(%esp)
80101c1b:	e8 60 28 00 00       	call   80104480 <strncmp>
}
80101c20:	c9                   	leave  
80101c21:	c3                   	ret    
80101c22:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101c30 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
80101c30:	55                   	push   %ebp
80101c31:	89 e5                	mov    %esp,%ebp
80101c33:	57                   	push   %edi
80101c34:	56                   	push   %esi
80101c35:	53                   	push   %ebx
80101c36:	83 ec 2c             	sub    $0x2c,%esp
80101c39:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
80101c3c:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101c41:	0f 85 8f 00 00 00    	jne    80101cd6 <dirlookup+0xa6>
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80101c47:	8b 43 58             	mov    0x58(%ebx),%eax
80101c4a:	31 f6                	xor    %esi,%esi
80101c4c:	8d 7d d8             	lea    -0x28(%ebp),%edi
80101c4f:	85 c0                	test   %eax,%eax
80101c51:	75 0d                	jne    80101c60 <dirlookup+0x30>
80101c53:	eb 6b                	jmp    80101cc0 <dirlookup+0x90>
80101c55:	8d 76 00             	lea    0x0(%esi),%esi
80101c58:	83 c6 10             	add    $0x10,%esi
80101c5b:	39 73 58             	cmp    %esi,0x58(%ebx)
80101c5e:	76 60                	jbe    80101cc0 <dirlookup+0x90>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101c60:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80101c67:	00 
80101c68:	89 74 24 08          	mov    %esi,0x8(%esp)
80101c6c:	89 7c 24 04          	mov    %edi,0x4(%esp)
80101c70:	89 1c 24             	mov    %ebx,(%esp)
80101c73:	e8 08 fd ff ff       	call   80101980 <readi>
80101c78:	83 f8 10             	cmp    $0x10,%eax
80101c7b:	75 4d                	jne    80101cca <dirlookup+0x9a>
      panic("dirlookup read");
    if(de.inum == 0)
80101c7d:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101c82:	74 d4                	je     80101c58 <dirlookup+0x28>
      continue;
    if(namecmp(name, de.name) == 0){
80101c84:	8d 45 da             	lea    -0x26(%ebp),%eax
80101c87:	89 44 24 04          	mov    %eax,0x4(%esp)
80101c8b:	8b 45 0c             	mov    0xc(%ebp),%eax
80101c8e:	89 04 24             	mov    %eax,(%esp)
80101c91:	e8 6a ff ff ff       	call   80101c00 <namecmp>
80101c96:	85 c0                	test   %eax,%eax
80101c98:	75 be                	jne    80101c58 <dirlookup+0x28>
      // entry matches path element
      if(poff)
80101c9a:	8b 45 10             	mov    0x10(%ebp),%eax
80101c9d:	85 c0                	test   %eax,%eax
80101c9f:	74 05                	je     80101ca6 <dirlookup+0x76>
        *poff = off;
80101ca1:	8b 45 10             	mov    0x10(%ebp),%eax
80101ca4:	89 30                	mov    %esi,(%eax)
      inum = de.inum;
80101ca6:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
      return iget(dp->dev, inum);
80101caa:	8b 03                	mov    (%ebx),%eax
80101cac:	e8 6f f4 ff ff       	call   80101120 <iget>
    }
  }

  return 0;
}
80101cb1:	83 c4 2c             	add    $0x2c,%esp
80101cb4:	5b                   	pop    %ebx
80101cb5:	5e                   	pop    %esi
80101cb6:	5f                   	pop    %edi
80101cb7:	5d                   	pop    %ebp
80101cb8:	c3                   	ret    
80101cb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101cc0:	83 c4 2c             	add    $0x2c,%esp
      inum = de.inum;
      return iget(dp->dev, inum);
    }
  }

  return 0;
80101cc3:	31 c0                	xor    %eax,%eax
}
80101cc5:	5b                   	pop    %ebx
80101cc6:	5e                   	pop    %esi
80101cc7:	5f                   	pop    %edi
80101cc8:	5d                   	pop    %ebp
80101cc9:	c3                   	ret    
  if(dp->type != T_DIR)
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlookup read");
80101cca:	c7 04 24 99 6e 10 80 	movl   $0x80106e99,(%esp)
80101cd1:	e8 9a e6 ff ff       	call   80100370 <panic>
{
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    panic("dirlookup not DIR");
80101cd6:	c7 04 24 87 6e 10 80 	movl   $0x80106e87,(%esp)
80101cdd:	e8 8e e6 ff ff       	call   80100370 <panic>
80101ce2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101ce9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101cf0 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101cf0:	55                   	push   %ebp
80101cf1:	89 e5                	mov    %esp,%ebp
80101cf3:	57                   	push   %edi
80101cf4:	56                   	push   %esi
80101cf5:	53                   	push   %ebx
80101cf6:	89 c3                	mov    %eax,%ebx
80101cf8:	83 ec 2c             	sub    $0x2c,%esp
  struct inode *ip, *next;

  if(*path == '/')
80101cfb:	80 38 2f             	cmpb   $0x2f,(%eax)
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101cfe:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101d01:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  struct inode *ip, *next;

  if(*path == '/')
80101d04:	0f 84 1d 01 00 00    	je     80101e27 <namex+0x137>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);
80101d0a:	e8 21 1a 00 00       	call   80103730 <myproc>
80101d0f:	8b 40 68             	mov    0x68(%eax),%eax
80101d12:	89 04 24             	mov    %eax,(%esp)
80101d15:	e8 56 f9 ff ff       	call   80101670 <idup>
80101d1a:	89 c7                	mov    %eax,%edi
80101d1c:	eb 05                	jmp    80101d23 <namex+0x33>
80101d1e:	66 90                	xchg   %ax,%ax
{
  char *s;
  int len;

  while(*path == '/')
    path++;
80101d20:	83 c3 01             	add    $0x1,%ebx
skipelem(char *path, char *name)
{
  char *s;
  int len;

  while(*path == '/')
80101d23:	0f b6 03             	movzbl (%ebx),%eax
80101d26:	3c 2f                	cmp    $0x2f,%al
80101d28:	74 f6                	je     80101d20 <namex+0x30>
    path++;
  if(*path == 0)
80101d2a:	84 c0                	test   %al,%al
80101d2c:	75 1a                	jne    80101d48 <namex+0x58>
      return 0;
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
80101d2e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101d31:	85 c0                	test   %eax,%eax
80101d33:	0f 85 3b 01 00 00    	jne    80101e74 <namex+0x184>
    iput(ip);
    return 0;
  }
  return ip;
}
80101d39:	83 c4 2c             	add    $0x2c,%esp
80101d3c:	89 f8                	mov    %edi,%eax
80101d3e:	5b                   	pop    %ebx
80101d3f:	5e                   	pop    %esi
80101d40:	5f                   	pop    %edi
80101d41:	5d                   	pop    %ebp
80101d42:	c3                   	ret    
80101d43:	90                   	nop
80101d44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101d48:	0f b6 03             	movzbl (%ebx),%eax
80101d4b:	89 de                	mov    %ebx,%esi
80101d4d:	84 c0                	test   %al,%al
80101d4f:	0f 84 a6 00 00 00    	je     80101dfb <namex+0x10b>
80101d55:	3c 2f                	cmp    $0x2f,%al
80101d57:	75 0b                	jne    80101d64 <namex+0x74>
80101d59:	e9 9d 00 00 00       	jmp    80101dfb <namex+0x10b>
80101d5e:	66 90                	xchg   %ax,%ax
80101d60:	3c 2f                	cmp    $0x2f,%al
80101d62:	74 0a                	je     80101d6e <namex+0x7e>
    path++;
80101d64:	83 c6 01             	add    $0x1,%esi
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101d67:	0f b6 06             	movzbl (%esi),%eax
80101d6a:	84 c0                	test   %al,%al
80101d6c:	75 f2                	jne    80101d60 <namex+0x70>
80101d6e:	89 f2                	mov    %esi,%edx
80101d70:	29 da                	sub    %ebx,%edx
    path++;
  len = path - s;
  if(len >= DIRSIZ)
80101d72:	83 fa 0d             	cmp    $0xd,%edx
80101d75:	0f 8e 85 00 00 00    	jle    80101e00 <namex+0x110>
    memmove(name, s, DIRSIZ);
80101d7b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101d7e:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
    path++;
80101d82:	89 f3                	mov    %esi,%ebx
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
80101d84:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
80101d8b:	00 
80101d8c:	89 04 24             	mov    %eax,(%esp)
80101d8f:	e8 6c 26 00 00       	call   80104400 <memmove>
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
80101d94:	80 3e 2f             	cmpb   $0x2f,(%esi)
80101d97:	75 0f                	jne    80101da8 <namex+0xb8>
80101d99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    path++;
80101da0:	83 c3 01             	add    $0x1,%ebx
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
80101da3:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101da6:	74 f8                	je     80101da0 <namex+0xb0>
  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);

  while((path = skipelem(path, name)) != 0){
80101da8:	85 db                	test   %ebx,%ebx
80101daa:	74 82                	je     80101d2e <namex+0x3e>
    ilock(ip);
80101dac:	89 3c 24             	mov    %edi,(%esp)
80101daf:	e8 ec f8 ff ff       	call   801016a0 <ilock>
    if(ip->type != T_DIR){
80101db4:	66 83 7f 50 01       	cmpw   $0x1,0x50(%edi)
80101db9:	0f 85 7e 00 00 00    	jne    80101e3d <namex+0x14d>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
80101dbf:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101dc2:	85 c0                	test   %eax,%eax
80101dc4:	74 09                	je     80101dcf <namex+0xdf>
80101dc6:	80 3b 00             	cmpb   $0x0,(%ebx)
80101dc9:	0f 84 93 00 00 00    	je     80101e62 <namex+0x172>
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80101dcf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101dd2:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80101dd9:	00 
80101dda:	89 3c 24             	mov    %edi,(%esp)
80101ddd:	89 44 24 04          	mov    %eax,0x4(%esp)
80101de1:	e8 4a fe ff ff       	call   80101c30 <dirlookup>
      iunlockput(ip);
80101de6:	89 3c 24             	mov    %edi,(%esp)
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80101de9:	85 c0                	test   %eax,%eax
80101deb:	89 c6                	mov    %eax,%esi
80101ded:	74 62                	je     80101e51 <namex+0x161>
      iunlockput(ip);
      return 0;
    }
    iunlockput(ip);
80101def:	e8 3c fb ff ff       	call   80101930 <iunlockput>
    ip = next;
80101df4:	89 f7                	mov    %esi,%edi
80101df6:	e9 28 ff ff ff       	jmp    80101d23 <namex+0x33>
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101dfb:	31 d2                	xor    %edx,%edx
80101dfd:	8d 76 00             	lea    0x0(%esi),%esi
    path++;
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
80101e00:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101e03:	89 54 24 08          	mov    %edx,0x8(%esp)
80101e07:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    name[len] = 0;
80101e0b:	89 f3                	mov    %esi,%ebx
    path++;
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
80101e0d:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101e10:	89 04 24             	mov    %eax,(%esp)
80101e13:	e8 e8 25 00 00       	call   80104400 <memmove>
    name[len] = 0;
80101e18:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101e1b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101e1e:	c6 04 10 00          	movb   $0x0,(%eax,%edx,1)
80101e22:	e9 6d ff ff ff       	jmp    80101d94 <namex+0xa4>
namex(char *path, int nameiparent, char *name)
{
  struct inode *ip, *next;

  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
80101e27:	ba 01 00 00 00       	mov    $0x1,%edx
80101e2c:	b8 01 00 00 00       	mov    $0x1,%eax
80101e31:	e8 ea f2 ff ff       	call   80101120 <iget>
80101e36:	89 c7                	mov    %eax,%edi
80101e38:	e9 e6 fe ff ff       	jmp    80101d23 <namex+0x33>
    ip = idup(myproc()->cwd);

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
    if(ip->type != T_DIR){
      iunlockput(ip);
80101e3d:	89 3c 24             	mov    %edi,(%esp)
      return 0;
80101e40:	31 ff                	xor    %edi,%edi
    ip = idup(myproc()->cwd);

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
    if(ip->type != T_DIR){
      iunlockput(ip);
80101e42:	e8 e9 fa ff ff       	call   80101930 <iunlockput>
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101e47:	83 c4 2c             	add    $0x2c,%esp
80101e4a:	89 f8                	mov    %edi,%eax
80101e4c:	5b                   	pop    %ebx
80101e4d:	5e                   	pop    %esi
80101e4e:	5f                   	pop    %edi
80101e4f:	5d                   	pop    %ebp
80101e50:	c3                   	ret    
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
      iunlockput(ip);
80101e51:	e8 da fa ff ff       	call   80101930 <iunlockput>
      return 0;
80101e56:	31 ff                	xor    %edi,%edi
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101e58:	83 c4 2c             	add    $0x2c,%esp
80101e5b:	5b                   	pop    %ebx
80101e5c:	89 f8                	mov    %edi,%eax
80101e5e:	5e                   	pop    %esi
80101e5f:	5f                   	pop    %edi
80101e60:	5d                   	pop    %ebp
80101e61:	c3                   	ret    
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      iunlock(ip);
80101e62:	89 3c 24             	mov    %edi,(%esp)
80101e65:	e8 16 f9 ff ff       	call   80101780 <iunlock>
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101e6a:	83 c4 2c             	add    $0x2c,%esp
80101e6d:	89 f8                	mov    %edi,%eax
80101e6f:	5b                   	pop    %ebx
80101e70:	5e                   	pop    %esi
80101e71:	5f                   	pop    %edi
80101e72:	5d                   	pop    %ebp
80101e73:	c3                   	ret    
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
    iput(ip);
80101e74:	89 3c 24             	mov    %edi,(%esp)
    return 0;
80101e77:	31 ff                	xor    %edi,%edi
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
    iput(ip);
80101e79:	e8 52 f9 ff ff       	call   801017d0 <iput>
    return 0;
80101e7e:	e9 b6 fe ff ff       	jmp    80101d39 <namex+0x49>
80101e83:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101e89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101e90 <dirlink>:
}

// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
80101e90:	55                   	push   %ebp
80101e91:	89 e5                	mov    %esp,%ebp
80101e93:	57                   	push   %edi
80101e94:	56                   	push   %esi
80101e95:	53                   	push   %ebx
80101e96:	83 ec 2c             	sub    $0x2c,%esp
80101e99:	8b 75 08             	mov    0x8(%ebp),%esi
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
80101e9c:	8b 45 0c             	mov    0xc(%ebp),%eax
80101e9f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80101ea6:	00 
80101ea7:	89 34 24             	mov    %esi,(%esp)
80101eaa:	89 44 24 04          	mov    %eax,0x4(%esp)
80101eae:	e8 7d fd ff ff       	call   80101c30 <dirlookup>
80101eb3:	85 c0                	test   %eax,%eax
80101eb5:	0f 85 89 00 00 00    	jne    80101f44 <dirlink+0xb4>
    iput(ip);
    return -1;
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
80101ebb:	8b 56 58             	mov    0x58(%esi),%edx
80101ebe:	31 db                	xor    %ebx,%ebx
80101ec0:	8d 7d d8             	lea    -0x28(%ebp),%edi
80101ec3:	85 d2                	test   %edx,%edx
80101ec5:	75 11                	jne    80101ed8 <dirlink+0x48>
80101ec7:	eb 33                	jmp    80101efc <dirlink+0x6c>
80101ec9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101ed0:	83 c3 10             	add    $0x10,%ebx
80101ed3:	39 5e 58             	cmp    %ebx,0x58(%esi)
80101ed6:	76 24                	jbe    80101efc <dirlink+0x6c>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101ed8:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80101edf:	00 
80101ee0:	89 5c 24 08          	mov    %ebx,0x8(%esp)
80101ee4:	89 7c 24 04          	mov    %edi,0x4(%esp)
80101ee8:	89 34 24             	mov    %esi,(%esp)
80101eeb:	e8 90 fa ff ff       	call   80101980 <readi>
80101ef0:	83 f8 10             	cmp    $0x10,%eax
80101ef3:	75 5e                	jne    80101f53 <dirlink+0xc3>
      panic("dirlink read");
    if(de.inum == 0)
80101ef5:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101efa:	75 d4                	jne    80101ed0 <dirlink+0x40>
      break;
  }

  strncpy(de.name, name, DIRSIZ);
80101efc:	8b 45 0c             	mov    0xc(%ebp),%eax
80101eff:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
80101f06:	00 
80101f07:	89 44 24 04          	mov    %eax,0x4(%esp)
80101f0b:	8d 45 da             	lea    -0x26(%ebp),%eax
80101f0e:	89 04 24             	mov    %eax,(%esp)
80101f11:	e8 ca 25 00 00       	call   801044e0 <strncpy>
  de.inum = inum;
80101f16:	8b 45 10             	mov    0x10(%ebp),%eax
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101f19:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80101f20:	00 
80101f21:	89 5c 24 08          	mov    %ebx,0x8(%esp)
80101f25:	89 7c 24 04          	mov    %edi,0x4(%esp)
    if(de.inum == 0)
      break;
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
80101f29:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101f2d:	89 34 24             	mov    %esi,(%esp)
80101f30:	e8 7b fb ff ff       	call   80101ab0 <writei>
80101f35:	83 f8 10             	cmp    $0x10,%eax
80101f38:	75 25                	jne    80101f5f <dirlink+0xcf>
    panic("dirlink");

  return 0;
80101f3a:	31 c0                	xor    %eax,%eax
}
80101f3c:	83 c4 2c             	add    $0x2c,%esp
80101f3f:	5b                   	pop    %ebx
80101f40:	5e                   	pop    %esi
80101f41:	5f                   	pop    %edi
80101f42:	5d                   	pop    %ebp
80101f43:	c3                   	ret    
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    iput(ip);
80101f44:	89 04 24             	mov    %eax,(%esp)
80101f47:	e8 84 f8 ff ff       	call   801017d0 <iput>
    return -1;
80101f4c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101f51:	eb e9                	jmp    80101f3c <dirlink+0xac>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
80101f53:	c7 04 24 a8 6e 10 80 	movl   $0x80106ea8,(%esp)
80101f5a:	e8 11 e4 ff ff       	call   80100370 <panic>
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("dirlink");
80101f5f:	c7 04 24 7e 74 10 80 	movl   $0x8010747e,(%esp)
80101f66:	e8 05 e4 ff ff       	call   80100370 <panic>
80101f6b:	90                   	nop
80101f6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101f70 <namei>:
  return ip;
}

struct inode*
namei(char *path)
{
80101f70:	55                   	push   %ebp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101f71:	31 d2                	xor    %edx,%edx
  return ip;
}

struct inode*
namei(char *path)
{
80101f73:	89 e5                	mov    %esp,%ebp
80101f75:	83 ec 18             	sub    $0x18,%esp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101f78:	8b 45 08             	mov    0x8(%ebp),%eax
80101f7b:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101f7e:	e8 6d fd ff ff       	call   80101cf0 <namex>
}
80101f83:	c9                   	leave  
80101f84:	c3                   	ret    
80101f85:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101f89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101f90 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
80101f90:	55                   	push   %ebp
  return namex(path, 1, name);
80101f91:	ba 01 00 00 00       	mov    $0x1,%edx
  return namex(path, 0, name);
}

struct inode*
nameiparent(char *path, char *name)
{
80101f96:	89 e5                	mov    %esp,%ebp
  return namex(path, 1, name);
80101f98:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101f9b:	8b 45 08             	mov    0x8(%ebp),%eax
}
80101f9e:	5d                   	pop    %ebp
}

struct inode*
nameiparent(char *path, char *name)
{
  return namex(path, 1, name);
80101f9f:	e9 4c fd ff ff       	jmp    80101cf0 <namex>
	...

80101fb0 <idestart>:
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101fb0:	55                   	push   %ebp
80101fb1:	89 e5                	mov    %esp,%ebp
80101fb3:	56                   	push   %esi
80101fb4:	89 c6                	mov    %eax,%esi
80101fb6:	53                   	push   %ebx
80101fb7:	83 ec 10             	sub    $0x10,%esp
  if(b == 0)
80101fba:	85 c0                	test   %eax,%eax
80101fbc:	0f 84 99 00 00 00    	je     8010205b <idestart+0xab>
    panic("idestart");
  if(b->blockno >= FSSIZE)
80101fc2:	8b 48 08             	mov    0x8(%eax),%ecx
80101fc5:	81 f9 e7 03 00 00    	cmp    $0x3e7,%ecx
80101fcb:	0f 87 7e 00 00 00    	ja     8010204f <idestart+0x9f>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101fd1:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101fd6:	66 90                	xchg   %ax,%ax
80101fd8:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101fd9:	25 c0 00 00 00       	and    $0xc0,%eax
80101fde:	83 f8 40             	cmp    $0x40,%eax
80101fe1:	75 f5                	jne    80101fd8 <idestart+0x28>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101fe3:	31 db                	xor    %ebx,%ebx
80101fe5:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101fea:	89 d8                	mov    %ebx,%eax
80101fec:	ee                   	out    %al,(%dx)
80101fed:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101ff2:	b8 01 00 00 00       	mov    $0x1,%eax
80101ff7:	ee                   	out    %al,(%dx)
80101ff8:	b2 f3                	mov    $0xf3,%dl
80101ffa:	89 c8                	mov    %ecx,%eax
80101ffc:	ee                   	out    %al,(%dx)

  idewait(0);
  outb(0x3f6, 0);  // generate interrupt
  outb(0x1f2, sector_per_block);  // number of sectors
  outb(0x1f3, sector & 0xff);
  outb(0x1f4, (sector >> 8) & 0xff);
80101ffd:	89 c8                	mov    %ecx,%eax
80101fff:	b2 f4                	mov    $0xf4,%dl
80102001:	c1 f8 08             	sar    $0x8,%eax
80102004:	ee                   	out    %al,(%dx)
80102005:	b2 f5                	mov    $0xf5,%dl
80102007:	89 d8                	mov    %ebx,%eax
80102009:	ee                   	out    %al,(%dx)
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
8010200a:	8b 46 04             	mov    0x4(%esi),%eax
8010200d:	b2 f6                	mov    $0xf6,%dl
8010200f:	83 e0 01             	and    $0x1,%eax
80102012:	c1 e0 04             	shl    $0x4,%eax
80102015:	83 c8 e0             	or     $0xffffffe0,%eax
80102018:	ee                   	out    %al,(%dx)
  if(b->flags & B_DIRTY){
80102019:	f6 06 04             	testb  $0x4,(%esi)
8010201c:	75 12                	jne    80102030 <idestart+0x80>
8010201e:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102023:	b8 20 00 00 00       	mov    $0x20,%eax
80102028:	ee                   	out    %al,(%dx)
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
  } else {
    outb(0x1f7, read_cmd);
  }
}
80102029:	83 c4 10             	add    $0x10,%esp
8010202c:	5b                   	pop    %ebx
8010202d:	5e                   	pop    %esi
8010202e:	5d                   	pop    %ebp
8010202f:	c3                   	ret    
80102030:	b2 f7                	mov    $0xf7,%dl
80102032:	b8 30 00 00 00       	mov    $0x30,%eax
80102037:	ee                   	out    %al,(%dx)
}

static inline void
outsl(int port, const void *addr, int cnt)
{
  asm volatile("cld; rep outsl" :
80102038:	b9 80 00 00 00       	mov    $0x80,%ecx
  outb(0x1f4, (sector >> 8) & 0xff);
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
  if(b->flags & B_DIRTY){
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
8010203d:	83 c6 5c             	add    $0x5c,%esi
80102040:	ba f0 01 00 00       	mov    $0x1f0,%edx
80102045:	fc                   	cld    
80102046:	f3 6f                	rep outsl %ds:(%esi),(%dx)
  } else {
    outb(0x1f7, read_cmd);
  }
}
80102048:	83 c4 10             	add    $0x10,%esp
8010204b:	5b                   	pop    %ebx
8010204c:	5e                   	pop    %esi
8010204d:	5d                   	pop    %ebp
8010204e:	c3                   	ret    
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
  if(b->blockno >= FSSIZE)
    panic("incorrect blockno");
8010204f:	c7 04 24 14 6f 10 80 	movl   $0x80106f14,(%esp)
80102056:	e8 15 e3 ff ff       	call   80100370 <panic>
// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
8010205b:	c7 04 24 0b 6f 10 80 	movl   $0x80106f0b,(%esp)
80102062:	e8 09 e3 ff ff       	call   80100370 <panic>
80102067:	89 f6                	mov    %esi,%esi
80102069:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102070 <ideinit>:
  return 0;
}

void
ideinit(void)
{
80102070:	55                   	push   %ebp
80102071:	89 e5                	mov    %esp,%ebp
80102073:	83 ec 18             	sub    $0x18,%esp
  int i;

  initlock(&idelock, "ide");
80102076:	c7 44 24 04 26 6f 10 	movl   $0x80106f26,0x4(%esp)
8010207d:	80 
8010207e:	c7 04 24 60 a5 10 80 	movl   $0x8010a560,(%esp)
80102085:	e8 86 20 00 00       	call   80104110 <initlock>
  ioapicenable(IRQ_IDE, ncpu - 1);
8010208a:	a1 00 2d 11 80       	mov    0x80112d00,%eax
8010208f:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
80102096:	83 e8 01             	sub    $0x1,%eax
80102099:	89 44 24 04          	mov    %eax,0x4(%esp)
8010209d:	e8 5e 02 00 00       	call   80102300 <ioapicenable>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801020a2:	ba f7 01 00 00       	mov    $0x1f7,%edx
801020a7:	90                   	nop
801020a8:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
801020a9:	25 c0 00 00 00       	and    $0xc0,%eax
801020ae:	83 f8 40             	cmp    $0x40,%eax
801020b1:	75 f5                	jne    801020a8 <ideinit+0x38>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801020b3:	ba f6 01 00 00       	mov    $0x1f6,%edx
801020b8:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
801020bd:	ee                   	out    %al,(%dx)
801020be:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801020c3:	b2 f7                	mov    $0xf7,%dl
801020c5:	eb 06                	jmp    801020cd <ideinit+0x5d>
801020c7:	90                   	nop
  ioapicenable(IRQ_IDE, ncpu - 1);
  idewait(0);

  // Check if disk 1 is present
  outb(0x1f6, 0xe0 | (1<<4));
  for(i=0; i<1000; i++){
801020c8:	83 e9 01             	sub    $0x1,%ecx
801020cb:	74 0f                	je     801020dc <ideinit+0x6c>
801020cd:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
801020ce:	84 c0                	test   %al,%al
801020d0:	74 f6                	je     801020c8 <ideinit+0x58>
      havedisk1 = 1;
801020d2:	c7 05 94 a5 10 80 01 	movl   $0x1,0x8010a594
801020d9:	00 00 00 
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801020dc:	ba f6 01 00 00       	mov    $0x1f6,%edx
801020e1:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
801020e6:	ee                   	out    %al,(%dx)
    }
  }

  // Switch back to disk 0.
  outb(0x1f6, 0xe0 | (0<<4));
}
801020e7:	c9                   	leave  
801020e8:	c3                   	ret    
801020e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801020f0 <ideintr>:
}

// Interrupt handler.
void
ideintr(void)
{
801020f0:	55                   	push   %ebp
801020f1:	89 e5                	mov    %esp,%ebp
801020f3:	57                   	push   %edi
801020f4:	53                   	push   %ebx
801020f5:	83 ec 10             	sub    $0x10,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
801020f8:	c7 04 24 60 a5 10 80 	movl   $0x8010a560,(%esp)
801020ff:	e8 7c 21 00 00       	call   80104280 <acquire>

  if((b = idequeue) == 0){
80102104:	8b 1d 98 a5 10 80    	mov    0x8010a598,%ebx
8010210a:	85 db                	test   %ebx,%ebx
8010210c:	74 2d                	je     8010213b <ideintr+0x4b>
    release(&idelock);
    return;
  }
  idequeue = b->qnext;
8010210e:	8b 43 58             	mov    0x58(%ebx),%eax
80102111:	a3 98 a5 10 80       	mov    %eax,0x8010a598

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
80102116:	8b 0b                	mov    (%ebx),%ecx
80102118:	f6 c1 04             	test   $0x4,%cl
8010211b:	74 33                	je     80102150 <ideintr+0x60>
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
8010211d:	83 c9 02             	or     $0x2,%ecx
  b->flags &= ~B_DIRTY;
80102120:	83 e1 fb             	and    $0xfffffffb,%ecx
80102123:	89 0b                	mov    %ecx,(%ebx)
  wakeup(b);
80102125:	89 1c 24             	mov    %ebx,(%esp)
80102128:	e8 03 1d 00 00       	call   80103e30 <wakeup>

  // Start disk on next buf in queue.
  if(idequeue != 0)
8010212d:	a1 98 a5 10 80       	mov    0x8010a598,%eax
80102132:	85 c0                	test   %eax,%eax
80102134:	74 05                	je     8010213b <ideintr+0x4b>
    idestart(idequeue);
80102136:	e8 75 fe ff ff       	call   80101fb0 <idestart>

  release(&idelock);
8010213b:	c7 04 24 60 a5 10 80 	movl   $0x8010a560,(%esp)
80102142:	e8 a9 21 00 00       	call   801042f0 <release>
}
80102147:	83 c4 10             	add    $0x10,%esp
8010214a:	5b                   	pop    %ebx
8010214b:	5f                   	pop    %edi
8010214c:	5d                   	pop    %ebp
8010214d:	c3                   	ret    
8010214e:	66 90                	xchg   %ax,%ax
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102150:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102155:	8d 76 00             	lea    0x0(%esi),%esi
80102158:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102159:	0f b6 c0             	movzbl %al,%eax
8010215c:	89 c7                	mov    %eax,%edi
8010215e:	81 e7 c0 00 00 00    	and    $0xc0,%edi
80102164:	83 ff 40             	cmp    $0x40,%edi
80102167:	75 ef                	jne    80102158 <ideintr+0x68>
    ;
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
80102169:	a8 21                	test   $0x21,%al
8010216b:	75 b0                	jne    8010211d <ideintr+0x2d>
  }
  idequeue = b->qnext;

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
    insl(0x1f0, b->data, BSIZE/4);
8010216d:	8d 7b 5c             	lea    0x5c(%ebx),%edi
}

static inline void
insl(int port, void *addr, int cnt)
{
  asm volatile("cld; rep insl" :
80102170:	b9 80 00 00 00       	mov    $0x80,%ecx
80102175:	ba f0 01 00 00       	mov    $0x1f0,%edx
8010217a:	fc                   	cld    
8010217b:	f3 6d                	rep insl (%dx),%es:(%edi)
8010217d:	8b 0b                	mov    (%ebx),%ecx
8010217f:	eb 9c                	jmp    8010211d <ideintr+0x2d>
80102181:	eb 0d                	jmp    80102190 <iderw>
80102183:	90                   	nop
80102184:	90                   	nop
80102185:	90                   	nop
80102186:	90                   	nop
80102187:	90                   	nop
80102188:	90                   	nop
80102189:	90                   	nop
8010218a:	90                   	nop
8010218b:	90                   	nop
8010218c:	90                   	nop
8010218d:	90                   	nop
8010218e:	90                   	nop
8010218f:	90                   	nop

80102190 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
80102190:	55                   	push   %ebp
80102191:	89 e5                	mov    %esp,%ebp
80102193:	53                   	push   %ebx
80102194:	83 ec 14             	sub    $0x14,%esp
80102197:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!holdingsleep(&b->lock))
8010219a:	8d 43 0c             	lea    0xc(%ebx),%eax
8010219d:	89 04 24             	mov    %eax,(%esp)
801021a0:	e8 1b 1f 00 00       	call   801040c0 <holdingsleep>
801021a5:	85 c0                	test   %eax,%eax
801021a7:	0f 84 8f 00 00 00    	je     8010223c <iderw+0xac>
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
801021ad:	8b 03                	mov    (%ebx),%eax
801021af:	83 e0 06             	and    $0x6,%eax
801021b2:	83 f8 02             	cmp    $0x2,%eax
801021b5:	0f 84 99 00 00 00    	je     80102254 <iderw+0xc4>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
801021bb:	8b 53 04             	mov    0x4(%ebx),%edx
801021be:	85 d2                	test   %edx,%edx
801021c0:	74 09                	je     801021cb <iderw+0x3b>
801021c2:	a1 94 a5 10 80       	mov    0x8010a594,%eax
801021c7:	85 c0                	test   %eax,%eax
801021c9:	74 7d                	je     80102248 <iderw+0xb8>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
801021cb:	c7 04 24 60 a5 10 80 	movl   $0x8010a560,(%esp)
801021d2:	e8 a9 20 00 00       	call   80104280 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
801021d7:	a1 98 a5 10 80       	mov    0x8010a598,%eax
801021dc:	ba 98 a5 10 80       	mov    $0x8010a598,%edx
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock

  // Append b to idequeue.
  b->qnext = 0;
801021e1:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
801021e8:	85 c0                	test   %eax,%eax
801021ea:	74 0e                	je     801021fa <iderw+0x6a>
801021ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801021f0:	8d 50 58             	lea    0x58(%eax),%edx
801021f3:	8b 40 58             	mov    0x58(%eax),%eax
801021f6:	85 c0                	test   %eax,%eax
801021f8:	75 f6                	jne    801021f0 <iderw+0x60>
    ;
  *pp = b;
801021fa:	89 1a                	mov    %ebx,(%edx)

  // Start disk if necessary.
  if(idequeue == b)
801021fc:	39 1d 98 a5 10 80    	cmp    %ebx,0x8010a598
80102202:	75 14                	jne    80102218 <iderw+0x88>
80102204:	eb 2d                	jmp    80102233 <iderw+0xa3>
80102206:	66 90                	xchg   %ax,%ax
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
    sleep(b, &idelock);
80102208:	c7 44 24 04 60 a5 10 	movl   $0x8010a560,0x4(%esp)
8010220f:	80 
80102210:	89 1c 24             	mov    %ebx,(%esp)
80102213:	e8 78 1a 00 00       	call   80103c90 <sleep>
  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
80102218:	8b 03                	mov    (%ebx),%eax
8010221a:	83 e0 06             	and    $0x6,%eax
8010221d:	83 f8 02             	cmp    $0x2,%eax
80102220:	75 e6                	jne    80102208 <iderw+0x78>
    sleep(b, &idelock);
  }


  release(&idelock);
80102222:	c7 45 08 60 a5 10 80 	movl   $0x8010a560,0x8(%ebp)
}
80102229:	83 c4 14             	add    $0x14,%esp
8010222c:	5b                   	pop    %ebx
8010222d:	5d                   	pop    %ebp
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
    sleep(b, &idelock);
  }


  release(&idelock);
8010222e:	e9 bd 20 00 00       	jmp    801042f0 <release>
    ;
  *pp = b;

  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);
80102233:	89 d8                	mov    %ebx,%eax
80102235:	e8 76 fd ff ff       	call   80101fb0 <idestart>
8010223a:	eb dc                	jmp    80102218 <iderw+0x88>
iderw(struct buf *b)
{
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
8010223c:	c7 04 24 2a 6f 10 80 	movl   $0x80106f2a,(%esp)
80102243:	e8 28 e1 ff ff       	call   80100370 <panic>
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
    panic("iderw: ide disk 1 not present");
80102248:	c7 04 24 55 6f 10 80 	movl   $0x80106f55,(%esp)
8010224f:	e8 1c e1 ff ff       	call   80100370 <panic>
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
80102254:	c7 04 24 40 6f 10 80 	movl   $0x80106f40,(%esp)
8010225b:	e8 10 e1 ff ff       	call   80100370 <panic>

80102260 <ioapicinit>:
  ioapic->data = data;
}

void
ioapicinit(void)
{
80102260:	55                   	push   %ebp
80102261:	89 e5                	mov    %esp,%ebp
80102263:	56                   	push   %esi
80102264:	53                   	push   %ebx

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
  return ioapic->data;
80102265:	bb 00 00 c0 fe       	mov    $0xfec00000,%ebx
  ioapic->data = data;
}

void
ioapicinit(void)
{
8010226a:	83 ec 10             	sub    $0x10,%esp
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
8010226d:	0f b6 15 60 27 11 80 	movzbl 0x80112760,%edx
};

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
80102274:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
8010227b:	00 00 00 
  return ioapic->data;
8010227e:	8b 35 10 00 c0 fe    	mov    0xfec00010,%esi
};

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
80102284:	c7 05 00 00 c0 fe 00 	movl   $0x0,0xfec00000
8010228b:	00 00 00 
  return ioapic->data;
8010228e:	a1 10 00 c0 fe       	mov    0xfec00010,%eax
void
ioapicinit(void)
{
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
80102293:	c7 05 34 26 11 80 00 	movl   $0xfec00000,0x80112634
8010229a:	00 c0 fe 
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
8010229d:	c1 ee 10             	shr    $0x10,%esi
  id = ioapicread(REG_ID) >> 24;
801022a0:	c1 e8 18             	shr    $0x18,%eax
ioapicinit(void)
{
  int i, id, maxintr;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
801022a3:	81 e6 ff 00 00 00    	and    $0xff,%esi
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
801022a9:	39 c2                	cmp    %eax,%edx
801022ab:	74 12                	je     801022bf <ioapicinit+0x5f>
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");
801022ad:	c7 04 24 74 6f 10 80 	movl   $0x80106f74,(%esp)
801022b4:	e8 97 e3 ff ff       	call   80100650 <cprintf>
801022b9:	8b 1d 34 26 11 80    	mov    0x80112634,%ebx
  ioapic->data = data;
}

void
ioapicinit(void)
{
801022bf:	ba 10 00 00 00       	mov    $0x10,%edx
801022c4:	31 c0                	xor    %eax,%eax
801022c6:	66 90                	xchg   %ax,%ax
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
801022c8:	89 13                	mov    %edx,(%ebx)
  ioapic->data = data;
801022ca:	8b 1d 34 26 11 80    	mov    0x80112634,%ebx
}

void
ioapicinit(void)
801022d0:	8d 48 20             	lea    0x20(%eax),%ecx
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
801022d3:	81 c9 00 00 01 00    	or     $0x10000,%ecx
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
801022d9:	83 c0 01             	add    $0x1,%eax

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
801022dc:	89 4b 10             	mov    %ecx,0x10(%ebx)
}

void
ioapicinit(void)
801022df:	8d 4a 01             	lea    0x1(%edx),%ecx
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
801022e2:	83 c2 02             	add    $0x2,%edx
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
801022e5:	89 0b                	mov    %ecx,(%ebx)
  ioapic->data = data;
801022e7:	8b 1d 34 26 11 80    	mov    0x80112634,%ebx
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
801022ed:	39 c6                	cmp    %eax,%esi

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
801022ef:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
801022f6:	7d d0                	jge    801022c8 <ioapicinit+0x68>
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
    ioapicwrite(REG_TABLE+2*i+1, 0);
  }
}
801022f8:	83 c4 10             	add    $0x10,%esp
801022fb:	5b                   	pop    %ebx
801022fc:	5e                   	pop    %esi
801022fd:	5d                   	pop    %ebp
801022fe:	c3                   	ret    
801022ff:	90                   	nop

80102300 <ioapicenable>:

void
ioapicenable(int irq, int cpunum)
{
80102300:	55                   	push   %ebp
80102301:	89 e5                	mov    %esp,%ebp
80102303:	8b 55 08             	mov    0x8(%ebp),%edx
80102306:	53                   	push   %ebx
80102307:	8b 45 0c             	mov    0xc(%ebp),%eax
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
8010230a:	8d 5a 20             	lea    0x20(%edx),%ebx
8010230d:	8d 4c 12 10          	lea    0x10(%edx,%edx,1),%ecx
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
80102311:	8b 15 34 26 11 80    	mov    0x80112634,%edx
{
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
80102317:	c1 e0 18             	shl    $0x18,%eax
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
8010231a:	89 0a                	mov    %ecx,(%edx)
  ioapic->data = data;
8010231c:	8b 15 34 26 11 80    	mov    0x80112634,%edx
{
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
80102322:	83 c1 01             	add    $0x1,%ecx

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
80102325:	89 5a 10             	mov    %ebx,0x10(%edx)
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
80102328:	89 0a                	mov    %ecx,(%edx)
  ioapic->data = data;
8010232a:	8b 15 34 26 11 80    	mov    0x80112634,%edx
80102330:	89 42 10             	mov    %eax,0x10(%edx)
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
}
80102333:	5b                   	pop    %ebx
80102334:	5d                   	pop    %ebp
80102335:	c3                   	ret    
	...

80102340 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
80102340:	55                   	push   %ebp
80102341:	89 e5                	mov    %esp,%ebp
80102343:	53                   	push   %ebx
80102344:	83 ec 14             	sub    $0x14,%esp
80102347:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
8010234a:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80102350:	75 7c                	jne    801023ce <kfree+0x8e>
80102352:	81 fb a8 54 11 80    	cmp    $0x801154a8,%ebx
80102358:	72 74                	jb     801023ce <kfree+0x8e>
8010235a:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102360:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102365:	77 67                	ja     801023ce <kfree+0x8e>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);
80102367:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
8010236e:	00 
8010236f:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
80102376:	00 
80102377:	89 1c 24             	mov    %ebx,(%esp)
8010237a:	e8 c1 1f 00 00       	call   80104340 <memset>

  if(kmem.use_lock)
8010237f:	8b 15 74 26 11 80    	mov    0x80112674,%edx
80102385:	85 d2                	test   %edx,%edx
80102387:	75 37                	jne    801023c0 <kfree+0x80>
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
80102389:	a1 78 26 11 80       	mov    0x80112678,%eax
8010238e:	89 03                	mov    %eax,(%ebx)
  kmem.freelist = r;
  if(kmem.use_lock)
80102390:	a1 74 26 11 80       	mov    0x80112674,%eax

  if(kmem.use_lock)
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
80102395:	89 1d 78 26 11 80    	mov    %ebx,0x80112678
  if(kmem.use_lock)
8010239b:	85 c0                	test   %eax,%eax
8010239d:	75 09                	jne    801023a8 <kfree+0x68>
    release(&kmem.lock);
}
8010239f:	83 c4 14             	add    $0x14,%esp
801023a2:	5b                   	pop    %ebx
801023a3:	5d                   	pop    %ebp
801023a4:	c3                   	ret    
801023a5:	8d 76 00             	lea    0x0(%esi),%esi
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
  if(kmem.use_lock)
    release(&kmem.lock);
801023a8:	c7 45 08 40 26 11 80 	movl   $0x80112640,0x8(%ebp)
}
801023af:	83 c4 14             	add    $0x14,%esp
801023b2:	5b                   	pop    %ebx
801023b3:	5d                   	pop    %ebp
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
  if(kmem.use_lock)
    release(&kmem.lock);
801023b4:	e9 37 1f 00 00       	jmp    801042f0 <release>
801023b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);

  if(kmem.use_lock)
    acquire(&kmem.lock);
801023c0:	c7 04 24 40 26 11 80 	movl   $0x80112640,(%esp)
801023c7:	e8 b4 1e 00 00       	call   80104280 <acquire>
801023cc:	eb bb                	jmp    80102389 <kfree+0x49>
kfree(char *v)
{
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
    panic("kfree");
801023ce:	c7 04 24 a6 6f 10 80 	movl   $0x80106fa6,(%esp)
801023d5:	e8 96 df ff ff       	call   80100370 <panic>
801023da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801023e0 <freerange>:
  kmem.use_lock = 1;
}

void
freerange(void *vstart, void *vend)
{
801023e0:	55                   	push   %ebp
801023e1:	89 e5                	mov    %esp,%ebp
801023e3:	56                   	push   %esi
801023e4:	53                   	push   %ebx
801023e5:	83 ec 10             	sub    $0x10,%esp
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
801023e8:	8b 55 08             	mov    0x8(%ebp),%edx
  kmem.use_lock = 1;
}

void
freerange(void *vstart, void *vend)
{
801023eb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
801023ee:	81 c2 ff 0f 00 00    	add    $0xfff,%edx
801023f4:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023fa:	8d 9a 00 10 00 00    	lea    0x1000(%edx),%ebx
80102400:	39 de                	cmp    %ebx,%esi
80102402:	73 08                	jae    8010240c <freerange+0x2c>
80102404:	eb 18                	jmp    8010241e <freerange+0x3e>
80102406:	66 90                	xchg   %ax,%ax
80102408:	89 da                	mov    %ebx,%edx
8010240a:	89 c3                	mov    %eax,%ebx
    kfree(p);
8010240c:	89 14 24             	mov    %edx,(%esp)
8010240f:	e8 2c ff ff ff       	call   80102340 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102414:	8d 83 00 10 00 00    	lea    0x1000(%ebx),%eax
8010241a:	39 f0                	cmp    %esi,%eax
8010241c:	76 ea                	jbe    80102408 <freerange+0x28>
    kfree(p);
}
8010241e:	83 c4 10             	add    $0x10,%esp
80102421:	5b                   	pop    %ebx
80102422:	5e                   	pop    %esi
80102423:	5d                   	pop    %ebp
80102424:	c3                   	ret    
80102425:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102430 <kinit2>:
  freerange(vstart, vend);
}

void
kinit2(void *vstart, void *vend)
{
80102430:	55                   	push   %ebp
80102431:	89 e5                	mov    %esp,%ebp
80102433:	83 ec 18             	sub    $0x18,%esp
  freerange(vstart, vend);
80102436:	8b 45 0c             	mov    0xc(%ebp),%eax
80102439:	89 44 24 04          	mov    %eax,0x4(%esp)
8010243d:	8b 45 08             	mov    0x8(%ebp),%eax
80102440:	89 04 24             	mov    %eax,(%esp)
80102443:	e8 98 ff ff ff       	call   801023e0 <freerange>
  kmem.use_lock = 1;
80102448:	c7 05 74 26 11 80 01 	movl   $0x1,0x80112674
8010244f:	00 00 00 
}
80102452:	c9                   	leave  
80102453:	c3                   	ret    
80102454:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010245a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80102460 <kinit1>:
// the pages mapped by entrypgdir on free list.
// 2. main() calls kinit2() with the rest of the physical pages
// after installing a full page table that maps them on all cores.
void
kinit1(void *vstart, void *vend)
{
80102460:	55                   	push   %ebp
80102461:	89 e5                	mov    %esp,%ebp
80102463:	83 ec 18             	sub    $0x18,%esp
80102466:	89 5d f8             	mov    %ebx,-0x8(%ebp)
80102469:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010246c:	89 75 fc             	mov    %esi,-0x4(%ebp)
8010246f:	8b 75 0c             	mov    0xc(%ebp),%esi
  initlock(&kmem.lock, "kmem");
80102472:	c7 44 24 04 ac 6f 10 	movl   $0x80106fac,0x4(%esp)
80102479:	80 
8010247a:	c7 04 24 40 26 11 80 	movl   $0x80112640,(%esp)
80102481:	e8 8a 1c 00 00       	call   80104110 <initlock>
  kmem.use_lock = 0;
  freerange(vstart, vend);
80102486:	89 75 0c             	mov    %esi,0xc(%ebp)
}
80102489:	8b 75 fc             	mov    -0x4(%ebp),%esi
void
kinit1(void *vstart, void *vend)
{
  initlock(&kmem.lock, "kmem");
  kmem.use_lock = 0;
  freerange(vstart, vend);
8010248c:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
8010248f:	8b 5d f8             	mov    -0x8(%ebp),%ebx
// after installing a full page table that maps them on all cores.
void
kinit1(void *vstart, void *vend)
{
  initlock(&kmem.lock, "kmem");
  kmem.use_lock = 0;
80102492:	c7 05 74 26 11 80 00 	movl   $0x0,0x80112674
80102499:	00 00 00 
  freerange(vstart, vend);
}
8010249c:	89 ec                	mov    %ebp,%esp
8010249e:	5d                   	pop    %ebp
void
kinit1(void *vstart, void *vend)
{
  initlock(&kmem.lock, "kmem");
  kmem.use_lock = 0;
  freerange(vstart, vend);
8010249f:	e9 3c ff ff ff       	jmp    801023e0 <freerange>
801024a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801024aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801024b0 <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
char*
kalloc(void)
{
801024b0:	55                   	push   %ebp
  struct run *r;

  if(kmem.use_lock)
801024b1:	31 c0                	xor    %eax,%eax
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
char*
kalloc(void)
{
801024b3:	89 e5                	mov    %esp,%ebp
801024b5:	53                   	push   %ebx
801024b6:	83 ec 14             	sub    $0x14,%esp
  struct run *r;

  if(kmem.use_lock)
801024b9:	8b 0d 74 26 11 80    	mov    0x80112674,%ecx
801024bf:	85 c9                	test   %ecx,%ecx
801024c1:	75 2d                	jne    801024f0 <kalloc+0x40>
    acquire(&kmem.lock);
  r = kmem.freelist;
801024c3:	8b 1d 78 26 11 80    	mov    0x80112678,%ebx
  if(r)
801024c9:	85 db                	test   %ebx,%ebx
801024cb:	74 08                	je     801024d5 <kalloc+0x25>
    kmem.freelist = r->next;
801024cd:	8b 13                	mov    (%ebx),%edx
801024cf:	89 15 78 26 11 80    	mov    %edx,0x80112678
  if(kmem.use_lock)
801024d5:	85 c0                	test   %eax,%eax
801024d7:	74 0c                	je     801024e5 <kalloc+0x35>
    release(&kmem.lock);
801024d9:	c7 04 24 40 26 11 80 	movl   $0x80112640,(%esp)
801024e0:	e8 0b 1e 00 00       	call   801042f0 <release>
  return (char*)r;
}
801024e5:	83 c4 14             	add    $0x14,%esp
801024e8:	89 d8                	mov    %ebx,%eax
801024ea:	5b                   	pop    %ebx
801024eb:	5d                   	pop    %ebp
801024ec:	c3                   	ret    
801024ed:	8d 76 00             	lea    0x0(%esi),%esi
kalloc(void)
{
  struct run *r;

  if(kmem.use_lock)
    acquire(&kmem.lock);
801024f0:	c7 04 24 40 26 11 80 	movl   $0x80112640,(%esp)
801024f7:	e8 84 1d 00 00       	call   80104280 <acquire>
801024fc:	a1 74 26 11 80       	mov    0x80112674,%eax
80102501:	eb c0                	jmp    801024c3 <kalloc+0x13>
	...

80102510 <kbdgetc>:
#include "defs.h"
#include "kbd.h"

int
kbdgetc(void)
{
80102510:	55                   	push   %ebp
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102511:	ba 64 00 00 00       	mov    $0x64,%edx
80102516:	89 e5                	mov    %esp,%ebp
80102518:	ec                   	in     (%dx),%al
    normalmap, shiftmap, ctlmap, ctlmap
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
80102519:	a8 01                	test   $0x1,%al
    return -1;
8010251b:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
    normalmap, shiftmap, ctlmap, ctlmap
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
80102520:	74 3e                	je     80102560 <kbdgetc+0x50>
80102522:	b2 60                	mov    $0x60,%dl
80102524:	ec                   	in     (%dx),%al
    return -1;
  data = inb(KBDATAP);
80102525:	0f b6 c0             	movzbl %al,%eax

  if(data == 0xE0){
80102528:	3d e0 00 00 00       	cmp    $0xe0,%eax
8010252d:	0f 84 85 00 00 00    	je     801025b8 <kbdgetc+0xa8>
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
80102533:	a8 80                	test   $0x80,%al
80102535:	74 31                	je     80102568 <kbdgetc+0x58>
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
80102537:	8b 15 9c a5 10 80    	mov    0x8010a59c,%edx
8010253d:	89 c1                	mov    %eax,%ecx
8010253f:	83 e1 7f             	and    $0x7f,%ecx
80102542:	f6 c2 40             	test   $0x40,%dl
80102545:	0f 44 c1             	cmove  %ecx,%eax
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
80102548:	31 c9                	xor    %ecx,%ecx
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
8010254a:	0f b6 80 c0 6f 10 80 	movzbl -0x7fef9040(%eax),%eax
80102551:	83 c8 40             	or     $0x40,%eax
80102554:	0f b6 c0             	movzbl %al,%eax
80102557:	f7 d0                	not    %eax
80102559:	21 d0                	and    %edx,%eax
8010255b:	a3 9c a5 10 80       	mov    %eax,0x8010a59c
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
80102560:	89 c8                	mov    %ecx,%eax
80102562:	5d                   	pop    %ebp
80102563:	c3                   	ret    
80102564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  } else if(data & 0x80){
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
80102568:	8b 0d 9c a5 10 80    	mov    0x8010a59c,%ecx
8010256e:	f6 c1 40             	test   $0x40,%cl
80102571:	74 05                	je     80102578 <kbdgetc+0x68>
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
80102573:	0c 80                	or     $0x80,%al
    shift &= ~E0ESC;
80102575:	83 e1 bf             	and    $0xffffffbf,%ecx
  }

  shift |= shiftcode[data];
80102578:	0f b6 90 c0 6f 10 80 	movzbl -0x7fef9040(%eax),%edx
8010257f:	09 ca                	or     %ecx,%edx
  shift ^= togglecode[data];
80102581:	0f b6 88 c0 70 10 80 	movzbl -0x7fef8f40(%eax),%ecx
80102588:	31 ca                	xor    %ecx,%edx
  c = charcode[shift & (CTL | SHIFT)][data];
8010258a:	89 d1                	mov    %edx,%ecx
8010258c:	83 e1 03             	and    $0x3,%ecx
8010258f:	8b 0c 8d c0 71 10 80 	mov    -0x7fef8e40(,%ecx,4),%ecx
    data |= 0x80;
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
80102596:	89 15 9c a5 10 80    	mov    %edx,0x8010a59c
  c = charcode[shift & (CTL | SHIFT)][data];
  if(shift & CAPSLOCK){
8010259c:	83 e2 08             	and    $0x8,%edx
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
  c = charcode[shift & (CTL | SHIFT)][data];
8010259f:	0f b6 0c 01          	movzbl (%ecx,%eax,1),%ecx
  if(shift & CAPSLOCK){
801025a3:	74 bb                	je     80102560 <kbdgetc+0x50>
    if('a' <= c && c <= 'z')
801025a5:	8d 41 9f             	lea    -0x61(%ecx),%eax
801025a8:	83 f8 19             	cmp    $0x19,%eax
801025ab:	77 1b                	ja     801025c8 <kbdgetc+0xb8>
      c += 'A' - 'a';
801025ad:	83 e9 20             	sub    $0x20,%ecx
801025b0:	eb ae                	jmp    80102560 <kbdgetc+0x50>
801025b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
    return 0;
801025b8:	31 c9                	xor    %ecx,%ecx
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
801025ba:	89 c8                	mov    %ecx,%eax
  if((st & KBS_DIB) == 0)
    return -1;
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
801025bc:	83 0d 9c a5 10 80 40 	orl    $0x40,0x8010a59c
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
801025c3:	5d                   	pop    %ebp
801025c4:	c3                   	ret    
801025c5:	8d 76 00             	lea    0x0(%esi),%esi
  shift ^= togglecode[data];
  c = charcode[shift & (CTL | SHIFT)][data];
  if(shift & CAPSLOCK){
    if('a' <= c && c <= 'z')
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
801025c8:	8d 51 bf             	lea    -0x41(%ecx),%edx
      c += 'a' - 'A';
801025cb:	8d 41 20             	lea    0x20(%ecx),%eax
801025ce:	83 fa 19             	cmp    $0x19,%edx
801025d1:	0f 46 c8             	cmovbe %eax,%ecx
  }
  return c;
801025d4:	eb 8a                	jmp    80102560 <kbdgetc+0x50>
801025d6:	8d 76 00             	lea    0x0(%esi),%esi
801025d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801025e0 <kbdintr>:
}

void
kbdintr(void)
{
801025e0:	55                   	push   %ebp
801025e1:	89 e5                	mov    %esp,%ebp
801025e3:	83 ec 18             	sub    $0x18,%esp
  consoleintr(kbdgetc);
801025e6:	c7 04 24 10 25 10 80 	movl   $0x80102510,(%esp)
801025ed:	e8 ce e1 ff ff       	call   801007c0 <consoleintr>
}
801025f2:	c9                   	leave  
801025f3:	c3                   	ret    
	...

80102600 <lapicinit>:
}

void
lapicinit(void)
{
  if(!lapic)
80102600:	a1 7c 26 11 80       	mov    0x8011267c,%eax
  lapic[ID];  // wait for write to finish, by reading
}

void
lapicinit(void)
{
80102605:	55                   	push   %ebp
80102606:	89 e5                	mov    %esp,%ebp
  if(!lapic)
80102608:	85 c0                	test   %eax,%eax
8010260a:	0f 84 c0 00 00 00    	je     801026d0 <lapicinit+0xd0>

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102610:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102617:	01 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010261a:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010261d:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102624:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102627:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010262a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
80102631:	00 02 00 
  lapic[ID];  // wait for write to finish, by reading
80102634:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102637:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010263e:	96 98 00 
  lapic[ID];  // wait for write to finish, by reading
80102641:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102644:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
8010264b:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010264e:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102651:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102658:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010265b:	8b 50 20             	mov    0x20(%eax),%edx
  lapicw(LINT0, MASKED);
  lapicw(LINT1, MASKED);

  // Disable performance counter overflow interrupts
  // on machines that provide that interrupt entry.
  if(((lapic[VER]>>16) & 0xFF) >= 4)
8010265e:	8b 50 30             	mov    0x30(%eax),%edx
80102661:	c1 ea 10             	shr    $0x10,%edx
80102664:	80 fa 03             	cmp    $0x3,%dl
80102667:	77 6f                	ja     801026d8 <lapicinit+0xd8>

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102669:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
80102670:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102673:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102676:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010267d:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102680:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102683:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010268a:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010268d:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102690:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102697:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010269a:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010269d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
801026a4:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026a7:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026aa:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
801026b1:	85 08 00 
  lapic[ID];  // wait for write to finish, by reading
801026b4:	8b 50 20             	mov    0x20(%eax),%edx
801026b7:	90                   	nop
  lapicw(EOI, 0);

  // Send an Init Level De-Assert to synchronise arbitration ID's.
  lapicw(ICRHI, 0);
  lapicw(ICRLO, BCAST | INIT | LEVEL);
  while(lapic[ICRLO] & DELIVS)
801026b8:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
801026be:	80 e6 10             	and    $0x10,%dh
801026c1:	75 f5                	jne    801026b8 <lapicinit+0xb8>

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026c3:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
801026ca:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026cd:	8b 40 20             	mov    0x20(%eax),%eax
  while(lapic[ICRLO] & DELIVS)
    ;

  // Enable interrupts on the APIC (but not on the processor).
  lapicw(TPR, 0);
}
801026d0:	5d                   	pop    %ebp
801026d1:	c3                   	ret    
801026d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026d8:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
801026df:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
801026e2:	8b 50 20             	mov    0x20(%eax),%edx
801026e5:	eb 82                	jmp    80102669 <lapicinit+0x69>
801026e7:	89 f6                	mov    %esi,%esi
801026e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801026f0 <lapicid>:
}

int
lapicid(void)
{
  if (!lapic)
801026f0:	8b 15 7c 26 11 80    	mov    0x8011267c,%edx
    return 0;
801026f6:	31 c0                	xor    %eax,%eax
  lapicw(TPR, 0);
}

int
lapicid(void)
{
801026f8:	55                   	push   %ebp
801026f9:	89 e5                	mov    %esp,%ebp
  if (!lapic)
801026fb:	85 d2                	test   %edx,%edx
801026fd:	74 06                	je     80102705 <lapicid+0x15>
    return 0;
  return lapic[ID] >> 24;
801026ff:	8b 42 20             	mov    0x20(%edx),%eax
80102702:	c1 e8 18             	shr    $0x18,%eax
}
80102705:	5d                   	pop    %ebp
80102706:	c3                   	ret    
80102707:	89 f6                	mov    %esi,%esi
80102709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102710 <lapiceoi>:

// Acknowledge interrupt.
void
lapiceoi(void)
{
  if(lapic)
80102710:	a1 7c 26 11 80       	mov    0x8011267c,%eax
}

// Acknowledge interrupt.
void
lapiceoi(void)
{
80102715:	55                   	push   %ebp
80102716:	89 e5                	mov    %esp,%ebp
  if(lapic)
80102718:	85 c0                	test   %eax,%eax
8010271a:	74 0d                	je     80102729 <lapiceoi+0x19>

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010271c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102723:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102726:	8b 40 20             	mov    0x20(%eax),%eax
void
lapiceoi(void)
{
  if(lapic)
    lapicw(EOI, 0);
}
80102729:	5d                   	pop    %ebp
8010272a:	c3                   	ret    
8010272b:	90                   	nop
8010272c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102730 <microdelay>:

// Spin for a given number of microseconds.
// On real hardware would want to tune this dynamically.
void
microdelay(int us)
{
80102730:	55                   	push   %ebp
80102731:	89 e5                	mov    %esp,%ebp
}
80102733:	5d                   	pop    %ebp
80102734:	c3                   	ret    
80102735:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102740 <lapicstartap>:

// Start additional processor running entry code at addr.
// See Appendix B of MultiProcessor Specification.
void
lapicstartap(uchar apicid, uint addr)
{
80102740:	55                   	push   %ebp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102741:	ba 70 00 00 00       	mov    $0x70,%edx
80102746:	89 e5                	mov    %esp,%ebp
80102748:	b8 0f 00 00 00       	mov    $0xf,%eax
8010274d:	53                   	push   %ebx
8010274e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102751:	0f b6 5d 08          	movzbl 0x8(%ebp),%ebx
80102755:	ee                   	out    %al,(%dx)
80102756:	b8 0a 00 00 00       	mov    $0xa,%eax
8010275b:	b2 71                	mov    $0x71,%dl
8010275d:	ee                   	out    %al,(%dx)
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
  wrv[1] = addr >> 4;
8010275e:	89 c8                	mov    %ecx,%eax
80102760:	c1 e8 04             	shr    $0x4,%eax
80102763:	66 a3 69 04 00 80    	mov    %ax,0x80000469

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102769:	a1 7c 26 11 80       	mov    0x8011267c,%eax
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
8010276e:	c1 e9 0c             	shr    $0xc,%ecx
  wrv[0] = 0;
  wrv[1] = addr >> 4;

  // "Universal startup algorithm."
  // Send INIT (level-triggered) interrupt to reset other CPU.
  lapicw(ICRHI, apicid<<24);
80102771:	c1 e3 18             	shl    $0x18,%ebx
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
80102774:	80 cd 06             	or     $0x6,%ch
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
80102777:	66 c7 05 67 04 00 80 	movw   $0x0,0x80000467
8010277e:	00 00 

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102780:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102786:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102789:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
80102790:	c5 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102793:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102796:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
8010279d:	85 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027a0:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027a3:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
801027a9:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027ac:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
801027b2:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027b5:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
801027bb:	8b 50 20             	mov    0x20(%eax),%edx

//PAGEBREAK!
static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027be:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
801027c4:	8b 40 20             	mov    0x20(%eax),%eax
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
    microdelay(200);
  }
}
801027c7:	5b                   	pop    %ebx
801027c8:	5d                   	pop    %ebp
801027c9:	c3                   	ret    
801027ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801027d0 <cmostime>:
}

// qemu seems to use 24-hour GWT and the values are BCD encoded
void
cmostime(struct rtcdate *r)
{
801027d0:	55                   	push   %ebp
801027d1:	ba 70 00 00 00       	mov    $0x70,%edx
801027d6:	89 e5                	mov    %esp,%ebp
801027d8:	b8 0b 00 00 00       	mov    $0xb,%eax
801027dd:	57                   	push   %edi
801027de:	56                   	push   %esi
801027df:	53                   	push   %ebx
801027e0:	83 ec 6c             	sub    $0x6c,%esp
801027e3:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801027e4:	b2 71                	mov    $0x71,%dl
801027e6:	ec                   	in     (%dx),%al
  struct rtcdate t1, t2;
  int sb, bcd;

  sb = cmos_read(CMOS_STATB);

  bcd = (sb & (1 << 2)) == 0;
801027e7:	89 c2                	mov    %eax,%edx
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801027e9:	bb 70 00 00 00       	mov    $0x70,%ebx
801027ee:	83 e2 04             	and    $0x4,%edx
801027f1:	89 55 a4             	mov    %edx,-0x5c(%ebp)
801027f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801027f8:	31 c0                	xor    %eax,%eax
801027fa:	89 da                	mov    %ebx,%edx
801027fc:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801027fd:	b9 71 00 00 00       	mov    $0x71,%ecx
80102802:	89 ca                	mov    %ecx,%edx
80102804:	ec                   	in     (%dx),%al
cmos_read(uint reg)
{
  outb(CMOS_PORT,  reg);
  microdelay(200);

  return inb(CMOS_RETURN);
80102805:	0f b6 f0             	movzbl %al,%esi
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102808:	89 da                	mov    %ebx,%edx
8010280a:	b8 02 00 00 00       	mov    $0x2,%eax
8010280f:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102810:	89 ca                	mov    %ecx,%edx
80102812:	ec                   	in     (%dx),%al
80102813:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102816:	89 da                	mov    %ebx,%edx
80102818:	89 45 b4             	mov    %eax,-0x4c(%ebp)
8010281b:	b8 04 00 00 00       	mov    $0x4,%eax
80102820:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102821:	89 ca                	mov    %ecx,%edx
80102823:	ec                   	in     (%dx),%al
80102824:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102827:	89 da                	mov    %ebx,%edx
80102829:	89 45 b0             	mov    %eax,-0x50(%ebp)
8010282c:	b8 07 00 00 00       	mov    $0x7,%eax
80102831:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102832:	89 ca                	mov    %ecx,%edx
80102834:	ec                   	in     (%dx),%al
80102835:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102838:	89 da                	mov    %ebx,%edx
8010283a:	89 45 ac             	mov    %eax,-0x54(%ebp)
8010283d:	b8 08 00 00 00       	mov    $0x8,%eax
80102842:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102843:	89 ca                	mov    %ecx,%edx
80102845:	ec                   	in     (%dx),%al
80102846:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102849:	89 da                	mov    %ebx,%edx
8010284b:	89 45 a8             	mov    %eax,-0x58(%ebp)
8010284e:	b8 09 00 00 00       	mov    $0x9,%eax
80102853:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102854:	89 ca                	mov    %ecx,%edx
80102856:	ec                   	in     (%dx),%al
80102857:	0f b6 f8             	movzbl %al,%edi
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010285a:	89 da                	mov    %ebx,%edx
8010285c:	b8 0a 00 00 00       	mov    $0xa,%eax
80102861:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102862:	89 ca                	mov    %ecx,%edx
80102864:	ec                   	in     (%dx),%al
  bcd = (sb & (1 << 2)) == 0;

  // make sure CMOS doesn't modify time while we read it
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
80102865:	a8 80                	test   $0x80,%al
80102867:	75 8f                	jne    801027f8 <cmostime+0x28>
80102869:	8b 45 b4             	mov    -0x4c(%ebp),%eax
8010286c:	8b 55 b0             	mov    -0x50(%ebp),%edx
8010286f:	89 75 b8             	mov    %esi,-0x48(%ebp)
80102872:	89 7d cc             	mov    %edi,-0x34(%ebp)
80102875:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102878:	8b 45 ac             	mov    -0x54(%ebp),%eax
8010287b:	89 55 c0             	mov    %edx,-0x40(%ebp)
8010287e:	8b 55 a8             	mov    -0x58(%ebp),%edx
80102881:	89 45 c4             	mov    %eax,-0x3c(%ebp)
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102884:	31 c0                	xor    %eax,%eax
80102886:	89 55 c8             	mov    %edx,-0x38(%ebp)
80102889:	89 da                	mov    %ebx,%edx
8010288b:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010288c:	89 ca                	mov    %ecx,%edx
8010288e:	ec                   	in     (%dx),%al
cmos_read(uint reg)
{
  outb(CMOS_PORT,  reg);
  microdelay(200);

  return inb(CMOS_RETURN);
8010288f:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102892:	89 da                	mov    %ebx,%edx
80102894:	89 45 d0             	mov    %eax,-0x30(%ebp)
80102897:	b8 02 00 00 00       	mov    $0x2,%eax
8010289c:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010289d:	89 ca                	mov    %ecx,%edx
8010289f:	ec                   	in     (%dx),%al
801028a0:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028a3:	89 da                	mov    %ebx,%edx
801028a5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
801028a8:	b8 04 00 00 00       	mov    $0x4,%eax
801028ad:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028ae:	89 ca                	mov    %ecx,%edx
801028b0:	ec                   	in     (%dx),%al
801028b1:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028b4:	89 da                	mov    %ebx,%edx
801028b6:	89 45 d8             	mov    %eax,-0x28(%ebp)
801028b9:	b8 07 00 00 00       	mov    $0x7,%eax
801028be:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028bf:	89 ca                	mov    %ecx,%edx
801028c1:	ec                   	in     (%dx),%al
801028c2:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028c5:	89 da                	mov    %ebx,%edx
801028c7:	89 45 dc             	mov    %eax,-0x24(%ebp)
801028ca:	b8 08 00 00 00       	mov    $0x8,%eax
801028cf:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028d0:	89 ca                	mov    %ecx,%edx
801028d2:	ec                   	in     (%dx),%al
801028d3:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028d6:	89 da                	mov    %ebx,%edx
801028d8:	89 45 e0             	mov    %eax,-0x20(%ebp)
801028db:	b8 09 00 00 00       	mov    $0x9,%eax
801028e0:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028e1:	89 ca                	mov    %ecx,%edx
801028e3:	ec                   	in     (%dx),%al
801028e4:	0f b6 c8             	movzbl %al,%ecx
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
        continue;
    fill_rtcdate(&t2);
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
801028e7:	8d 55 b8             	lea    -0x48(%ebp),%edx
801028ea:	8d 45 d0             	lea    -0x30(%ebp),%eax
cmos_read(uint reg)
{
  outb(CMOS_PORT,  reg);
  microdelay(200);

  return inb(CMOS_RETURN);
801028ed:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
        continue;
    fill_rtcdate(&t2);
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
801028f0:	c7 44 24 08 18 00 00 	movl   $0x18,0x8(%esp)
801028f7:	00 
801028f8:	89 44 24 04          	mov    %eax,0x4(%esp)
801028fc:	89 14 24             	mov    %edx,(%esp)
801028ff:	e8 9c 1a 00 00       	call   801043a0 <memcmp>
80102904:	85 c0                	test   %eax,%eax
80102906:	0f 85 ec fe ff ff    	jne    801027f8 <cmostime+0x28>
      break;
  }

  // convert
  if(bcd) {
8010290c:	8b 45 a4             	mov    -0x5c(%ebp),%eax
8010290f:	85 c0                	test   %eax,%eax
80102911:	75 78                	jne    8010298b <cmostime+0x1bb>
#define    CONV(x)     (t1.x = ((t1.x >> 4) * 10) + (t1.x & 0xf))
    CONV(second);
80102913:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102916:	89 c2                	mov    %eax,%edx
80102918:	83 e0 0f             	and    $0xf,%eax
8010291b:	c1 ea 04             	shr    $0x4,%edx
8010291e:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102921:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102924:	89 45 b8             	mov    %eax,-0x48(%ebp)
    CONV(minute);
80102927:	8b 45 bc             	mov    -0x44(%ebp),%eax
8010292a:	89 c2                	mov    %eax,%edx
8010292c:	83 e0 0f             	and    $0xf,%eax
8010292f:	c1 ea 04             	shr    $0x4,%edx
80102932:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102935:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102938:	89 45 bc             	mov    %eax,-0x44(%ebp)
    CONV(hour  );
8010293b:	8b 45 c0             	mov    -0x40(%ebp),%eax
8010293e:	89 c2                	mov    %eax,%edx
80102940:	83 e0 0f             	and    $0xf,%eax
80102943:	c1 ea 04             	shr    $0x4,%edx
80102946:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102949:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010294c:	89 45 c0             	mov    %eax,-0x40(%ebp)
    CONV(day   );
8010294f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102952:	89 c2                	mov    %eax,%edx
80102954:	83 e0 0f             	and    $0xf,%eax
80102957:	c1 ea 04             	shr    $0x4,%edx
8010295a:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010295d:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102960:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    CONV(month );
80102963:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102966:	89 c2                	mov    %eax,%edx
80102968:	83 e0 0f             	and    $0xf,%eax
8010296b:	c1 ea 04             	shr    $0x4,%edx
8010296e:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102971:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102974:	89 45 c8             	mov    %eax,-0x38(%ebp)
    CONV(year  );
80102977:	8b 45 cc             	mov    -0x34(%ebp),%eax
8010297a:	89 c2                	mov    %eax,%edx
8010297c:	83 e0 0f             	and    $0xf,%eax
8010297f:	c1 ea 04             	shr    $0x4,%edx
80102982:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102985:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102988:	89 45 cc             	mov    %eax,-0x34(%ebp)
#undef     CONV
  }

  *r = t1;
8010298b:	8b 55 08             	mov    0x8(%ebp),%edx
8010298e:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102991:	89 02                	mov    %eax,(%edx)
80102993:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102996:	89 42 04             	mov    %eax,0x4(%edx)
80102999:	8b 45 c0             	mov    -0x40(%ebp),%eax
8010299c:	89 42 08             	mov    %eax,0x8(%edx)
8010299f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
801029a2:	89 42 0c             	mov    %eax,0xc(%edx)
801029a5:	8b 45 c8             	mov    -0x38(%ebp),%eax
801029a8:	89 42 10             	mov    %eax,0x10(%edx)
801029ab:	8b 45 cc             	mov    -0x34(%ebp),%eax
801029ae:	89 42 14             	mov    %eax,0x14(%edx)
  r->year += 2000;
801029b1:	81 42 14 d0 07 00 00 	addl   $0x7d0,0x14(%edx)
}
801029b8:	83 c4 6c             	add    $0x6c,%esp
801029bb:	5b                   	pop    %ebx
801029bc:	5e                   	pop    %esi
801029bd:	5f                   	pop    %edi
801029be:	5d                   	pop    %ebp
801029bf:	c3                   	ret    

801029c0 <install_trans>:
}

// Copy committed blocks from log to their home location
static void
install_trans(void)
{
801029c0:	55                   	push   %ebp
801029c1:	89 e5                	mov    %esp,%ebp
801029c3:	57                   	push   %edi
801029c4:	56                   	push   %esi
801029c5:	53                   	push   %ebx
801029c6:	83 ec 1c             	sub    $0x1c,%esp
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
801029c9:	a1 c8 26 11 80       	mov    0x801126c8,%eax
801029ce:	85 c0                	test   %eax,%eax
801029d0:	7e 7a                	jle    80102a4c <install_trans+0x8c>
801029d2:	31 db                	xor    %ebx,%ebx
801029d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
801029d8:	a1 b4 26 11 80       	mov    0x801126b4,%eax
801029dd:	01 d8                	add    %ebx,%eax
801029df:	83 c0 01             	add    $0x1,%eax
801029e2:	89 44 24 04          	mov    %eax,0x4(%esp)
801029e6:	a1 c4 26 11 80       	mov    0x801126c4,%eax
801029eb:	89 04 24             	mov    %eax,(%esp)
801029ee:	e8 dd d6 ff ff       	call   801000d0 <bread>
801029f3:	89 c7                	mov    %eax,%edi
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
801029f5:	8b 04 9d cc 26 11 80 	mov    -0x7feed934(,%ebx,4),%eax
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
801029fc:	83 c3 01             	add    $0x1,%ebx
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
801029ff:	89 44 24 04          	mov    %eax,0x4(%esp)
80102a03:	a1 c4 26 11 80       	mov    0x801126c4,%eax
80102a08:	89 04 24             	mov    %eax,(%esp)
80102a0b:	e8 c0 d6 ff ff       	call   801000d0 <bread>
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
80102a10:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
80102a17:	00 
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102a18:	89 c6                	mov    %eax,%esi
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
80102a1a:	8d 47 5c             	lea    0x5c(%edi),%eax
80102a1d:	89 44 24 04          	mov    %eax,0x4(%esp)
80102a21:	8d 46 5c             	lea    0x5c(%esi),%eax
80102a24:	89 04 24             	mov    %eax,(%esp)
80102a27:	e8 d4 19 00 00       	call   80104400 <memmove>
    bwrite(dbuf);  // write dst to disk
80102a2c:	89 34 24             	mov    %esi,(%esp)
80102a2f:	e8 6c d7 ff ff       	call   801001a0 <bwrite>
    brelse(lbuf);
80102a34:	89 3c 24             	mov    %edi,(%esp)
80102a37:	e8 a4 d7 ff ff       	call   801001e0 <brelse>
    brelse(dbuf);
80102a3c:	89 34 24             	mov    %esi,(%esp)
80102a3f:	e8 9c d7 ff ff       	call   801001e0 <brelse>
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102a44:	39 1d c8 26 11 80    	cmp    %ebx,0x801126c8
80102a4a:	7f 8c                	jg     801029d8 <install_trans+0x18>
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    bwrite(dbuf);  // write dst to disk
    brelse(lbuf);
    brelse(dbuf);
  }
}
80102a4c:	83 c4 1c             	add    $0x1c,%esp
80102a4f:	5b                   	pop    %ebx
80102a50:	5e                   	pop    %esi
80102a51:	5f                   	pop    %edi
80102a52:	5d                   	pop    %ebp
80102a53:	c3                   	ret    
80102a54:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102a5a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80102a60 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
80102a60:	55                   	push   %ebp
80102a61:	89 e5                	mov    %esp,%ebp
80102a63:	57                   	push   %edi
80102a64:	56                   	push   %esi
80102a65:	53                   	push   %ebx
80102a66:	83 ec 1c             	sub    $0x1c,%esp
  struct buf *buf = bread(log.dev, log.start);
80102a69:	a1 b4 26 11 80       	mov    0x801126b4,%eax
80102a6e:	89 44 24 04          	mov    %eax,0x4(%esp)
80102a72:	a1 c4 26 11 80       	mov    0x801126c4,%eax
80102a77:	89 04 24             	mov    %eax,(%esp)
80102a7a:	e8 51 d6 ff ff       	call   801000d0 <bread>
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102a7f:	8b 1d c8 26 11 80    	mov    0x801126c8,%ebx
  for (i = 0; i < log.lh.n; i++) {
80102a85:	85 db                	test   %ebx,%ebx
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102a87:	89 c7                	mov    %eax,%edi
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102a89:	89 58 5c             	mov    %ebx,0x5c(%eax)
  for (i = 0; i < log.lh.n; i++) {
80102a8c:	7e 1c                	jle    80102aaa <write_head+0x4a>
80102a8e:	31 d2                	xor    %edx,%edx
80102a90:	8d 70 5c             	lea    0x5c(%eax),%esi
80102a93:	90                   	nop
80102a94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    hb->block[i] = log.lh.block[i];
80102a98:	8b 0c 95 cc 26 11 80 	mov    -0x7feed934(,%edx,4),%ecx
80102a9f:	89 4c 96 04          	mov    %ecx,0x4(%esi,%edx,4)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
  for (i = 0; i < log.lh.n; i++) {
80102aa3:	83 c2 01             	add    $0x1,%edx
80102aa6:	39 da                	cmp    %ebx,%edx
80102aa8:	75 ee                	jne    80102a98 <write_head+0x38>
    hb->block[i] = log.lh.block[i];
  }
  bwrite(buf);
80102aaa:	89 3c 24             	mov    %edi,(%esp)
80102aad:	e8 ee d6 ff ff       	call   801001a0 <bwrite>
  brelse(buf);
80102ab2:	89 3c 24             	mov    %edi,(%esp)
80102ab5:	e8 26 d7 ff ff       	call   801001e0 <brelse>
}
80102aba:	83 c4 1c             	add    $0x1c,%esp
80102abd:	5b                   	pop    %ebx
80102abe:	5e                   	pop    %esi
80102abf:	5f                   	pop    %edi
80102ac0:	5d                   	pop    %ebp
80102ac1:	c3                   	ret    
80102ac2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102ac9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102ad0 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev)
{
80102ad0:	55                   	push   %ebp
80102ad1:	89 e5                	mov    %esp,%ebp
80102ad3:	56                   	push   %esi
80102ad4:	53                   	push   %ebx
80102ad5:	83 ec 30             	sub    $0x30,%esp
80102ad8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
80102adb:	c7 44 24 04 d0 71 10 	movl   $0x801071d0,0x4(%esp)
80102ae2:	80 
80102ae3:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102aea:	e8 21 16 00 00       	call   80104110 <initlock>
  readsb(dev, &sb);
80102aef:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102af2:	89 44 24 04          	mov    %eax,0x4(%esp)
80102af6:	89 1c 24             	mov    %ebx,(%esp)
80102af9:	e8 12 e9 ff ff       	call   80101410 <readsb>
  log.start = sb.logstart;
80102afe:	8b 45 ec             	mov    -0x14(%ebp),%eax
  log.size = sb.nlog;
80102b01:	8b 55 e8             	mov    -0x18(%ebp),%edx
  log.dev = dev;
80102b04:	89 1d c4 26 11 80    	mov    %ebx,0x801126c4

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102b0a:	89 1c 24             	mov    %ebx,(%esp)
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
80102b0d:	a3 b4 26 11 80       	mov    %eax,0x801126b4
  log.size = sb.nlog;
80102b12:	89 15 b8 26 11 80    	mov    %edx,0x801126b8

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102b18:	89 44 24 04          	mov    %eax,0x4(%esp)
80102b1c:	e8 af d5 ff ff       	call   801000d0 <bread>
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
80102b21:	8b 58 5c             	mov    0x5c(%eax),%ebx
  for (i = 0; i < log.lh.n; i++) {
80102b24:	85 db                	test   %ebx,%ebx
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
80102b26:	89 1d c8 26 11 80    	mov    %ebx,0x801126c8
  for (i = 0; i < log.lh.n; i++) {
80102b2c:	7e 1c                	jle    80102b4a <initlog+0x7a>
80102b2e:	31 d2                	xor    %edx,%edx
80102b30:	8d 70 5c             	lea    0x5c(%eax),%esi
80102b33:	90                   	nop
80102b34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    log.lh.block[i] = lh->block[i];
80102b38:	8b 4c 96 04          	mov    0x4(%esi,%edx,4),%ecx
80102b3c:	89 0c 95 cc 26 11 80 	mov    %ecx,-0x7feed934(,%edx,4)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
  for (i = 0; i < log.lh.n; i++) {
80102b43:	83 c2 01             	add    $0x1,%edx
80102b46:	39 da                	cmp    %ebx,%edx
80102b48:	75 ee                	jne    80102b38 <initlog+0x68>
    log.lh.block[i] = lh->block[i];
  }
  brelse(buf);
80102b4a:	89 04 24             	mov    %eax,(%esp)
80102b4d:	e8 8e d6 ff ff       	call   801001e0 <brelse>

static void
recover_from_log(void)
{
  read_head();
  install_trans(); // if committed, copy from log to disk
80102b52:	e8 69 fe ff ff       	call   801029c0 <install_trans>
  log.lh.n = 0;
80102b57:	c7 05 c8 26 11 80 00 	movl   $0x0,0x801126c8
80102b5e:	00 00 00 
  write_head(); // clear the log
80102b61:	e8 fa fe ff ff       	call   80102a60 <write_head>
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
  log.dev = dev;
  recover_from_log();
}
80102b66:	83 c4 30             	add    $0x30,%esp
80102b69:	5b                   	pop    %ebx
80102b6a:	5e                   	pop    %esi
80102b6b:	5d                   	pop    %ebp
80102b6c:	c3                   	ret    
80102b6d:	8d 76 00             	lea    0x0(%esi),%esi

80102b70 <begin_op>:
}

// called at the start of each FS system call.
void
begin_op(void)
{
80102b70:	55                   	push   %ebp
80102b71:	89 e5                	mov    %esp,%ebp
80102b73:	83 ec 18             	sub    $0x18,%esp
  acquire(&log.lock);
80102b76:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102b7d:	e8 fe 16 00 00       	call   80104280 <acquire>
80102b82:	eb 18                	jmp    80102b9c <begin_op+0x2c>
80102b84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while(1){
    if(log.committing){
      sleep(&log, &log.lock);
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
80102b88:	c7 44 24 04 80 26 11 	movl   $0x80112680,0x4(%esp)
80102b8f:	80 
80102b90:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102b97:	e8 f4 10 00 00       	call   80103c90 <sleep>
void
begin_op(void)
{
  acquire(&log.lock);
  while(1){
    if(log.committing){
80102b9c:	a1 c0 26 11 80       	mov    0x801126c0,%eax
80102ba1:	85 c0                	test   %eax,%eax
80102ba3:	75 e3                	jne    80102b88 <begin_op+0x18>
      sleep(&log, &log.lock);
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
80102ba5:	8b 15 bc 26 11 80    	mov    0x801126bc,%edx
80102bab:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
80102bb1:	83 c2 01             	add    $0x1,%edx
80102bb4:	8d 04 92             	lea    (%edx,%edx,4),%eax
80102bb7:	8d 04 41             	lea    (%ecx,%eax,2),%eax
80102bba:	83 f8 1e             	cmp    $0x1e,%eax
80102bbd:	7f c9                	jg     80102b88 <begin_op+0x18>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
      release(&log.lock);
80102bbf:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
      sleep(&log, &log.lock);
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
80102bc6:	89 15 bc 26 11 80    	mov    %edx,0x801126bc
      release(&log.lock);
80102bcc:	e8 1f 17 00 00       	call   801042f0 <release>
      break;
    }
  }
}
80102bd1:	c9                   	leave  
80102bd2:	c3                   	ret    
80102bd3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102be0 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
80102be0:	55                   	push   %ebp
80102be1:	89 e5                	mov    %esp,%ebp
80102be3:	57                   	push   %edi
80102be4:	56                   	push   %esi
80102be5:	53                   	push   %ebx
80102be6:	83 ec 1c             	sub    $0x1c,%esp
  int do_commit = 0;

  acquire(&log.lock);
80102be9:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102bf0:	e8 8b 16 00 00       	call   80104280 <acquire>
  log.outstanding -= 1;
80102bf5:	a1 bc 26 11 80       	mov    0x801126bc,%eax
  if(log.committing)
80102bfa:	8b 15 c0 26 11 80    	mov    0x801126c0,%edx
end_op(void)
{
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
80102c00:	83 e8 01             	sub    $0x1,%eax
  if(log.committing)
80102c03:	85 d2                	test   %edx,%edx
end_op(void)
{
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
80102c05:	a3 bc 26 11 80       	mov    %eax,0x801126bc
  if(log.committing)
80102c0a:	0f 85 f3 00 00 00    	jne    80102d03 <end_op+0x123>
    panic("log.committing");
  if(log.outstanding == 0){
80102c10:	85 c0                	test   %eax,%eax
80102c12:	0f 85 cb 00 00 00    	jne    80102ce3 <end_op+0x103>
    do_commit = 1;
    log.committing = 1;
80102c18:	c7 05 c0 26 11 80 01 	movl   $0x1,0x801126c0
80102c1f:	00 00 00 
}

static void
commit()
{
  if (log.lh.n > 0) {
80102c22:	31 db                	xor    %ebx,%ebx
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
  }
  release(&log.lock);
80102c24:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102c2b:	e8 c0 16 00 00       	call   801042f0 <release>
}

static void
commit()
{
  if (log.lh.n > 0) {
80102c30:	a1 c8 26 11 80       	mov    0x801126c8,%eax
80102c35:	85 c0                	test   %eax,%eax
80102c37:	0f 8e 90 00 00 00    	jle    80102ccd <end_op+0xed>
80102c3d:	8d 76 00             	lea    0x0(%esi),%esi
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
80102c40:	a1 b4 26 11 80       	mov    0x801126b4,%eax
80102c45:	01 d8                	add    %ebx,%eax
80102c47:	83 c0 01             	add    $0x1,%eax
80102c4a:	89 44 24 04          	mov    %eax,0x4(%esp)
80102c4e:	a1 c4 26 11 80       	mov    0x801126c4,%eax
80102c53:	89 04 24             	mov    %eax,(%esp)
80102c56:	e8 75 d4 ff ff       	call   801000d0 <bread>
80102c5b:	89 c6                	mov    %eax,%esi
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102c5d:	8b 04 9d cc 26 11 80 	mov    -0x7feed934(,%ebx,4),%eax
static void
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102c64:	83 c3 01             	add    $0x1,%ebx
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102c67:	89 44 24 04          	mov    %eax,0x4(%esp)
80102c6b:	a1 c4 26 11 80       	mov    0x801126c4,%eax
80102c70:	89 04 24             	mov    %eax,(%esp)
80102c73:	e8 58 d4 ff ff       	call   801000d0 <bread>
    memmove(to->data, from->data, BSIZE);
80102c78:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
80102c7f:	00 
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102c80:	89 c7                	mov    %eax,%edi
    memmove(to->data, from->data, BSIZE);
80102c82:	8d 40 5c             	lea    0x5c(%eax),%eax
80102c85:	89 44 24 04          	mov    %eax,0x4(%esp)
80102c89:	8d 46 5c             	lea    0x5c(%esi),%eax
80102c8c:	89 04 24             	mov    %eax,(%esp)
80102c8f:	e8 6c 17 00 00       	call   80104400 <memmove>
    bwrite(to);  // write the log
80102c94:	89 34 24             	mov    %esi,(%esp)
80102c97:	e8 04 d5 ff ff       	call   801001a0 <bwrite>
    brelse(from);
80102c9c:	89 3c 24             	mov    %edi,(%esp)
80102c9f:	e8 3c d5 ff ff       	call   801001e0 <brelse>
    brelse(to);
80102ca4:	89 34 24             	mov    %esi,(%esp)
80102ca7:	e8 34 d5 ff ff       	call   801001e0 <brelse>
static void
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102cac:	3b 1d c8 26 11 80    	cmp    0x801126c8,%ebx
80102cb2:	7c 8c                	jl     80102c40 <end_op+0x60>
static void
commit()
{
  if (log.lh.n > 0) {
    write_log();     // Write modified blocks from cache to log
    write_head();    // Write header to disk -- the real commit
80102cb4:	e8 a7 fd ff ff       	call   80102a60 <write_head>
    install_trans(); // Now install writes to home locations
80102cb9:	e8 02 fd ff ff       	call   801029c0 <install_trans>
    log.lh.n = 0;
80102cbe:	c7 05 c8 26 11 80 00 	movl   $0x0,0x801126c8
80102cc5:	00 00 00 
    write_head();    // Erase the transaction from the log
80102cc8:	e8 93 fd ff ff       	call   80102a60 <write_head>

  if(do_commit){
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    acquire(&log.lock);
80102ccd:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102cd4:	e8 a7 15 00 00       	call   80104280 <acquire>
    log.committing = 0;
80102cd9:	c7 05 c0 26 11 80 00 	movl   $0x0,0x801126c0
80102ce0:	00 00 00 
    wakeup(&log);
80102ce3:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102cea:	e8 41 11 00 00       	call   80103e30 <wakeup>
    release(&log.lock);
80102cef:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102cf6:	e8 f5 15 00 00       	call   801042f0 <release>
  }
}
80102cfb:	83 c4 1c             	add    $0x1c,%esp
80102cfe:	5b                   	pop    %ebx
80102cff:	5e                   	pop    %esi
80102d00:	5f                   	pop    %edi
80102d01:	5d                   	pop    %ebp
80102d02:	c3                   	ret    
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
  if(log.committing)
    panic("log.committing");
80102d03:	c7 04 24 d4 71 10 80 	movl   $0x801071d4,(%esp)
80102d0a:	e8 61 d6 ff ff       	call   80100370 <panic>
80102d0f:	90                   	nop

80102d10 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102d10:	55                   	push   %ebp
80102d11:	89 e5                	mov    %esp,%ebp
80102d13:	53                   	push   %ebx
80102d14:	83 ec 14             	sub    $0x14,%esp
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102d17:	a1 c8 26 11 80       	mov    0x801126c8,%eax
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102d1c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102d1f:	83 f8 1d             	cmp    $0x1d,%eax
80102d22:	0f 8f 98 00 00 00    	jg     80102dc0 <log_write+0xb0>
80102d28:	8b 15 b8 26 11 80    	mov    0x801126b8,%edx
80102d2e:	83 ea 01             	sub    $0x1,%edx
80102d31:	39 d0                	cmp    %edx,%eax
80102d33:	0f 8d 87 00 00 00    	jge    80102dc0 <log_write+0xb0>
    panic("too big a transaction");
  if (log.outstanding < 1)
80102d39:	8b 0d bc 26 11 80    	mov    0x801126bc,%ecx
80102d3f:	85 c9                	test   %ecx,%ecx
80102d41:	0f 8e 85 00 00 00    	jle    80102dcc <log_write+0xbc>
    panic("log_write outside of trans");

  acquire(&log.lock);
80102d47:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102d4e:	e8 2d 15 00 00       	call   80104280 <acquire>
  for (i = 0; i < log.lh.n; i++) {
80102d53:	8b 15 c8 26 11 80    	mov    0x801126c8,%edx
80102d59:	83 fa 00             	cmp    $0x0,%edx
80102d5c:	7e 53                	jle    80102db1 <log_write+0xa1>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102d5e:	8b 4b 08             	mov    0x8(%ebx),%ecx
    panic("too big a transaction");
  if (log.outstanding < 1)
    panic("log_write outside of trans");

  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
80102d61:	31 c0                	xor    %eax,%eax
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102d63:	39 0d cc 26 11 80    	cmp    %ecx,0x801126cc
80102d69:	75 0e                	jne    80102d79 <log_write+0x69>
80102d6b:	eb 3b                	jmp    80102da8 <log_write+0x98>
80102d6d:	8d 76 00             	lea    0x0(%esi),%esi
80102d70:	39 0c 85 cc 26 11 80 	cmp    %ecx,-0x7feed934(,%eax,4)
80102d77:	74 2f                	je     80102da8 <log_write+0x98>
    panic("too big a transaction");
  if (log.outstanding < 1)
    panic("log_write outside of trans");

  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
80102d79:	83 c0 01             	add    $0x1,%eax
80102d7c:	39 d0                	cmp    %edx,%eax
80102d7e:	75 f0                	jne    80102d70 <log_write+0x60>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
      break;
  }
  log.lh.block[i] = b->blockno;
80102d80:	89 0c 95 cc 26 11 80 	mov    %ecx,-0x7feed934(,%edx,4)
  if (i == log.lh.n)
    log.lh.n++;
80102d87:	83 c2 01             	add    $0x1,%edx
80102d8a:	89 15 c8 26 11 80    	mov    %edx,0x801126c8
  b->flags |= B_DIRTY; // prevent eviction
80102d90:	83 0b 04             	orl    $0x4,(%ebx)
  release(&log.lock);
80102d93:	c7 45 08 80 26 11 80 	movl   $0x80112680,0x8(%ebp)
}
80102d9a:	83 c4 14             	add    $0x14,%esp
80102d9d:	5b                   	pop    %ebx
80102d9e:	5d                   	pop    %ebp
  }
  log.lh.block[i] = b->blockno;
  if (i == log.lh.n)
    log.lh.n++;
  b->flags |= B_DIRTY; // prevent eviction
  release(&log.lock);
80102d9f:	e9 4c 15 00 00       	jmp    801042f0 <release>
80102da4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
    if (log.lh.block[i] == b->blockno)   // log absorbtion
      break;
  }
  log.lh.block[i] = b->blockno;
80102da8:	89 0c 85 cc 26 11 80 	mov    %ecx,-0x7feed934(,%eax,4)
80102daf:	eb df                	jmp    80102d90 <log_write+0x80>
80102db1:	8b 43 08             	mov    0x8(%ebx),%eax
80102db4:	a3 cc 26 11 80       	mov    %eax,0x801126cc
  if (i == log.lh.n)
80102db9:	75 d5                	jne    80102d90 <log_write+0x80>
80102dbb:	eb ca                	jmp    80102d87 <log_write+0x77>
80102dbd:	8d 76 00             	lea    0x0(%esi),%esi
log_write(struct buf *b)
{
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    panic("too big a transaction");
80102dc0:	c7 04 24 e3 71 10 80 	movl   $0x801071e3,(%esp)
80102dc7:	e8 a4 d5 ff ff       	call   80100370 <panic>
  if (log.outstanding < 1)
    panic("log_write outside of trans");
80102dcc:	c7 04 24 f9 71 10 80 	movl   $0x801071f9,(%esp)
80102dd3:	e8 98 d5 ff ff       	call   80100370 <panic>
	...

80102de0 <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
80102de0:	55                   	push   %ebp
80102de1:	89 e5                	mov    %esp,%ebp
80102de3:	53                   	push   %ebx
80102de4:	83 ec 14             	sub    $0x14,%esp
  cprintf("cpu%d: starting %d\n", cpuid(), cpuid());
80102de7:	e8 24 09 00 00       	call   80103710 <cpuid>
80102dec:	89 c3                	mov    %eax,%ebx
80102dee:	e8 1d 09 00 00       	call   80103710 <cpuid>
80102df3:	89 5c 24 08          	mov    %ebx,0x8(%esp)
80102df7:	c7 04 24 14 72 10 80 	movl   $0x80107214,(%esp)
80102dfe:	89 44 24 04          	mov    %eax,0x4(%esp)
80102e02:	e8 49 d8 ff ff       	call   80100650 <cprintf>
  idtinit();       // load idt register
80102e07:	e8 a4 27 00 00       	call   801055b0 <idtinit>
  xchg(&(mycpu()->started), 1); // tell startothers() we're up
80102e0c:	e8 7f 08 00 00       	call   80103690 <mycpu>
80102e11:	89 c2                	mov    %eax,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80102e13:	b8 01 00 00 00       	mov    $0x1,%eax
80102e18:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
  scheduler();     // start running processes
80102e1f:	e8 cc 0b 00 00       	call   801039f0 <scheduler>
80102e24:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102e2a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80102e30 <mpenter>:
}

// Other CPUs jump here from entryother.S.
static void
mpenter(void)
{
80102e30:	55                   	push   %ebp
80102e31:	89 e5                	mov    %esp,%ebp
80102e33:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
80102e36:	e8 c5 37 00 00       	call   80106600 <switchkvm>
  seginit();
80102e3b:	e8 e0 36 00 00       	call   80106520 <seginit>
  lapicinit();
80102e40:	e8 bb f7 ff ff       	call   80102600 <lapicinit>
  mpmain();
80102e45:	e8 96 ff ff ff       	call   80102de0 <mpmain>
80102e4a:	00 00                	add    %al,(%eax)
80102e4c:	00 00                	add    %al,(%eax)
	...

80102e50 <main>:
// Bootstrap processor starts running C code here.
// Allocate a real stack and switch to it, first
// doing some setup required for memory allocator to work.
int
main(void)
{
80102e50:	55                   	push   %ebp
80102e51:	89 e5                	mov    %esp,%ebp
80102e53:	53                   	push   %ebx
80102e54:	83 e4 f0             	and    $0xfffffff0,%esp
80102e57:	83 ec 10             	sub    $0x10,%esp
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
80102e5a:	c7 44 24 04 00 00 40 	movl   $0x80400000,0x4(%esp)
80102e61:	80 
80102e62:	c7 04 24 a8 54 11 80 	movl   $0x801154a8,(%esp)
80102e69:	e8 f2 f5 ff ff       	call   80102460 <kinit1>
  kvmalloc();      // kernel page table
80102e6e:	e8 cd 3c 00 00       	call   80106b40 <kvmalloc>
  mpinit();        // detect other processors
80102e73:	e8 68 01 00 00       	call   80102fe0 <mpinit>
  lapicinit();     // interrupt controller
80102e78:	e8 83 f7 ff ff       	call   80102600 <lapicinit>
80102e7d:	8d 76 00             	lea    0x0(%esi),%esi
  seginit();       // segment descriptors
80102e80:	e8 9b 36 00 00       	call   80106520 <seginit>
  picinit();       // disable pic
80102e85:	e8 26 03 00 00       	call   801031b0 <picinit>
  ioapicinit();    // another interrupt controller
80102e8a:	e8 d1 f3 ff ff       	call   80102260 <ioapicinit>
80102e8f:	90                   	nop
  consoleinit();   // console hardware
80102e90:	e8 cb da ff ff       	call   80100960 <consoleinit>
  uartinit();      // serial port
80102e95:	e8 46 2a 00 00       	call   801058e0 <uartinit>
  pinit();         // process table
80102e9a:	e8 d1 07 00 00       	call   80103670 <pinit>
80102e9f:	90                   	nop
  tvinit();        // trap vectors
80102ea0:	e8 7b 26 00 00       	call   80105520 <tvinit>
  binit();         // buffer cache
80102ea5:	e8 96 d1 ff ff       	call   80100040 <binit>
  fileinit();      // file table
80102eaa:	e8 91 de ff ff       	call   80100d40 <fileinit>
80102eaf:	90                   	nop
  ideinit();       // disk 
80102eb0:	e8 bb f1 ff ff       	call   80102070 <ideinit>

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80102eb5:	c7 44 24 08 8a 00 00 	movl   $0x8a,0x8(%esp)
80102ebc:	00 
80102ebd:	c7 44 24 04 8c a4 10 	movl   $0x8010a48c,0x4(%esp)
80102ec4:	80 
80102ec5:	c7 04 24 00 70 00 80 	movl   $0x80007000,(%esp)
80102ecc:	e8 2f 15 00 00       	call   80104400 <memmove>

  for(c = cpus; c < cpus+ncpu; c++){
80102ed1:	69 05 00 2d 11 80 b0 	imul   $0xb0,0x80112d00,%eax
80102ed8:	00 00 00 
80102edb:	05 80 27 11 80       	add    $0x80112780,%eax
80102ee0:	3d 80 27 11 80       	cmp    $0x80112780,%eax
80102ee5:	76 6c                	jbe    80102f53 <main+0x103>
80102ee7:	bb 80 27 11 80       	mov    $0x80112780,%ebx
80102eec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(c == mycpu())  // We've started already.
80102ef0:	e8 9b 07 00 00       	call   80103690 <mycpu>
80102ef5:	39 d8                	cmp    %ebx,%eax
80102ef7:	74 41                	je     80102f3a <main+0xea>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
80102ef9:	e8 b2 f5 ff ff       	call   801024b0 <kalloc>
    *(void**)(code-4) = stack + KSTACKSIZE;
    *(void(**)(void))(code-8) = mpenter;
80102efe:	c7 05 f8 6f 00 80 30 	movl   $0x80102e30,0x80006ff8
80102f05:	2e 10 80 
    *(int**)(code-12) = (void *) V2P(entrypgdir);
80102f08:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80102f0f:	90 10 00 

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
    *(void**)(code-4) = stack + KSTACKSIZE;
80102f12:	05 00 10 00 00       	add    $0x1000,%eax
80102f17:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
    *(void(**)(void))(code-8) = mpenter;
    *(int**)(code-12) = (void *) V2P(entrypgdir);

    lapicstartap(c->apicid, V2P(code));
80102f1c:	0f b6 03             	movzbl (%ebx),%eax
80102f1f:	c7 44 24 04 00 70 00 	movl   $0x7000,0x4(%esp)
80102f26:	00 
80102f27:	89 04 24             	mov    %eax,(%esp)
80102f2a:	e8 11 f8 ff ff       	call   80102740 <lapicstartap>
80102f2f:	90                   	nop

    // wait for cpu to finish mpmain()
    while(c->started == 0)
80102f30:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80102f36:	85 c0                	test   %eax,%eax
80102f38:	74 f6                	je     80102f30 <main+0xe0>
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);

  for(c = cpus; c < cpus+ncpu; c++){
80102f3a:	69 05 00 2d 11 80 b0 	imul   $0xb0,0x80112d00,%eax
80102f41:	00 00 00 
80102f44:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80102f4a:	05 80 27 11 80       	add    $0x80112780,%eax
80102f4f:	39 c3                	cmp    %eax,%ebx
80102f51:	72 9d                	jb     80102ef0 <main+0xa0>
  tvinit();        // trap vectors
  binit();         // buffer cache
  fileinit();      // file table
  ideinit();       // disk 
  startothers();   // start other processors
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80102f53:	c7 44 24 04 00 00 00 	movl   $0x8e000000,0x4(%esp)
80102f5a:	8e 
80102f5b:	c7 04 24 00 00 40 80 	movl   $0x80400000,(%esp)
80102f62:	e8 c9 f4 ff ff       	call   80102430 <kinit2>
  userinit();      // first user process
80102f67:	e8 f4 07 00 00       	call   80103760 <userinit>
  mpmain();        // finish this processor's setup
80102f6c:	e8 6f fe ff ff       	call   80102de0 <mpmain>
	...

80102f80 <mpsearch1>:
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102f80:	55                   	push   %ebp
  uchar *e, *p, *addr;

  addr = P2V(a);
80102f81:	05 00 00 00 80       	add    $0x80000000,%eax
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102f86:	89 e5                	mov    %esp,%ebp
80102f88:	56                   	push   %esi
80102f89:	53                   	push   %ebx
  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
80102f8a:	31 db                	xor    %ebx,%ebx
mpsearch1(uint a, int len)
{
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
80102f8c:	8d 34 10             	lea    (%eax,%edx,1),%esi
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102f8f:	83 ec 10             	sub    $0x10,%esp
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
80102f92:	39 f0                	cmp    %esi,%eax
80102f94:	73 3d                	jae    80102fd3 <mpsearch1+0x53>
80102f96:	89 c3                	mov    %eax,%ebx
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80102f98:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
80102f9f:	00 
80102fa0:	c7 44 24 04 28 72 10 	movl   $0x80107228,0x4(%esp)
80102fa7:	80 
80102fa8:	89 1c 24             	mov    %ebx,(%esp)
80102fab:	e8 f0 13 00 00       	call   801043a0 <memcmp>
80102fb0:	85 c0                	test   %eax,%eax
80102fb2:	75 16                	jne    80102fca <mpsearch1+0x4a>
80102fb4:	31 d2                	xor    %edx,%edx
80102fb6:	66 90                	xchg   %ax,%ax
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
    sum += addr[i];
80102fb8:	0f b6 0c 03          	movzbl (%ebx,%eax,1),%ecx
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
80102fbc:	83 c0 01             	add    $0x1,%eax
    sum += addr[i];
80102fbf:	01 ca                	add    %ecx,%edx
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
80102fc1:	83 f8 10             	cmp    $0x10,%eax
80102fc4:	75 f2                	jne    80102fb8 <mpsearch1+0x38>
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80102fc6:	84 d2                	test   %dl,%dl
80102fc8:	74 09                	je     80102fd3 <mpsearch1+0x53>
{
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
80102fca:	83 c3 10             	add    $0x10,%ebx
80102fcd:	39 de                	cmp    %ebx,%esi
80102fcf:	77 c7                	ja     80102f98 <mpsearch1+0x18>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
80102fd1:	31 db                	xor    %ebx,%ebx
}
80102fd3:	83 c4 10             	add    $0x10,%esp
80102fd6:	89 d8                	mov    %ebx,%eax
80102fd8:	5b                   	pop    %ebx
80102fd9:	5e                   	pop    %esi
80102fda:	5d                   	pop    %ebp
80102fdb:	c3                   	ret    
80102fdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102fe0 <mpinit>:
  return conf;
}

void
mpinit(void)
{
80102fe0:	55                   	push   %ebp
80102fe1:	89 e5                	mov    %esp,%ebp
80102fe3:	57                   	push   %edi
80102fe4:	56                   	push   %esi
80102fe5:	53                   	push   %ebx
80102fe6:	83 ec 2c             	sub    $0x2c,%esp
  uchar *bda;
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
80102fe9:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80102ff0:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80102ff7:	c1 e0 08             	shl    $0x8,%eax
80102ffa:	09 d0                	or     %edx,%eax
80102ffc:	c1 e0 04             	shl    $0x4,%eax
80102fff:	85 c0                	test   %eax,%eax
80103001:	75 1b                	jne    8010301e <mpinit+0x3e>
    if((mp = mpsearch1(p, 1024)))
      return mp;
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
80103003:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
8010300a:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80103011:	c1 e0 08             	shl    $0x8,%eax
80103014:	09 d0                	or     %edx,%eax
80103016:	c1 e0 0a             	shl    $0xa,%eax
    if((mp = mpsearch1(p-1024, 1024)))
80103019:	2d 00 04 00 00       	sub    $0x400,%eax
8010301e:	ba 00 04 00 00       	mov    $0x400,%edx
80103023:	e8 58 ff ff ff       	call   80102f80 <mpsearch1>
80103028:	85 c0                	test   %eax,%eax
8010302a:	89 c6                	mov    %eax,%esi
8010302c:	0f 84 38 01 00 00    	je     8010316a <mpinit+0x18a>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103032:	8b 5e 04             	mov    0x4(%esi),%ebx
80103035:	85 db                	test   %ebx,%ebx
80103037:	0f 84 46 01 00 00    	je     80103183 <mpinit+0x1a3>
    return 0;
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
8010303d:	8d 93 00 00 00 80    	lea    -0x80000000(%ebx),%edx
80103043:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  if(memcmp(conf, "PCMP", 4) != 0)
80103046:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
8010304d:	00 
8010304e:	c7 44 24 04 2d 72 10 	movl   $0x8010722d,0x4(%esp)
80103055:	80 
80103056:	89 14 24             	mov    %edx,(%esp)
80103059:	e8 42 13 00 00       	call   801043a0 <memcmp>
8010305e:	85 c0                	test   %eax,%eax
80103060:	0f 85 1d 01 00 00    	jne    80103183 <mpinit+0x1a3>
    return 0;
  if(conf->version != 1 && conf->version != 4)
80103066:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
8010306d:	3c 04                	cmp    $0x4,%al
8010306f:	0f 85 1b 01 00 00    	jne    80103190 <mpinit+0x1b0>
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
80103075:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
8010307c:	85 ff                	test   %edi,%edi
8010307e:	74 21                	je     801030a1 <mpinit+0xc1>
80103080:	31 d2                	xor    %edx,%edx
80103082:	31 c0                	xor    %eax,%eax
80103084:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    sum += addr[i];
80103088:	0f b6 8c 03 00 00 00 	movzbl -0x80000000(%ebx,%eax,1),%ecx
8010308f:	80 
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
80103090:	83 c0 01             	add    $0x1,%eax
    sum += addr[i];
80103093:	01 ca                	add    %ecx,%edx
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
80103095:	39 c7                	cmp    %eax,%edi
80103097:	7f ef                	jg     80103088 <mpinit+0xa8>
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
  if(memcmp(conf, "PCMP", 4) != 0)
    return 0;
  if(conf->version != 1 && conf->version != 4)
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
80103099:	84 d2                	test   %dl,%dl
8010309b:	0f 85 e2 00 00 00    	jne    80103183 <mpinit+0x1a3>
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
801030a1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801030a4:	85 c0                	test   %eax,%eax
801030a6:	0f 84 d7 00 00 00    	je     80103183 <mpinit+0x1a3>
    panic("Expect to run on an SMP");
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
801030ac:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
801030b2:	89 75 e0             	mov    %esi,-0x20(%ebp)
801030b5:	a3 7c 26 11 80       	mov    %eax,0x8011267c
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801030ba:	0f b7 8b 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%ecx
801030c1:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
801030c7:	03 4d e4             	add    -0x1c(%ebp),%ecx
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
    panic("Expect to run on an SMP");
  ismp = 1;
801030ca:	bb 01 00 00 00       	mov    $0x1,%ebx
801030cf:	90                   	nop
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801030d0:	39 c8                	cmp    %ecx,%eax
801030d2:	73 23                	jae    801030f7 <mpinit+0x117>
801030d4:	0f b6 10             	movzbl (%eax),%edx
    switch(*p){
801030d7:	80 fa 04             	cmp    $0x4,%dl
801030da:	76 07                	jbe    801030e3 <mpinit+0x103>
    case MPIOINTR:
    case MPLINTR:
      p += 8;
      continue;
    default:
      ismp = 0;
801030dc:	31 db                	xor    %ebx,%ebx
  if((conf = mpconfig(&mp)) == 0)
    panic("Expect to run on an SMP");
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
801030de:	80 fa 04             	cmp    $0x4,%dl
801030e1:	77 f9                	ja     801030dc <mpinit+0xfc>
801030e3:	0f b6 d2             	movzbl %dl,%edx
801030e6:	ff 24 95 6c 72 10 80 	jmp    *-0x7fef8d94(,%edx,4)
801030ed:	8d 76 00             	lea    0x0(%esi),%esi
      p += sizeof(struct mpioapic);
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
801030f0:	83 c0 08             	add    $0x8,%eax

  if((conf = mpconfig(&mp)) == 0)
    panic("Expect to run on an SMP");
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801030f3:	39 c8                	cmp    %ecx,%eax
801030f5:	72 dd                	jb     801030d4 <mpinit+0xf4>
    default:
      ismp = 0;
      break;
    }
  }
  if(!ismp)
801030f7:	85 db                	test   %ebx,%ebx
801030f9:	8b 75 e0             	mov    -0x20(%ebp),%esi
801030fc:	0f 84 98 00 00 00    	je     8010319a <mpinit+0x1ba>
    panic("Didn't find a suitable machine");

  if(mp->imcrp){
80103102:	80 7e 0c 00          	cmpb   $0x0,0xc(%esi)
80103106:	74 12                	je     8010311a <mpinit+0x13a>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103108:	ba 22 00 00 00       	mov    $0x22,%edx
8010310d:	b8 70 00 00 00       	mov    $0x70,%eax
80103112:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80103113:	b2 23                	mov    $0x23,%dl
80103115:	ec                   	in     (%dx),%al
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
80103116:	83 c8 01             	or     $0x1,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103119:	ee                   	out    %al,(%dx)
  }
}
8010311a:	83 c4 2c             	add    $0x2c,%esp
8010311d:	5b                   	pop    %ebx
8010311e:	5e                   	pop    %esi
8010311f:	5f                   	pop    %edi
80103120:	5d                   	pop    %ebp
80103121:	c3                   	ret    
80103122:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
80103128:	8b 15 00 2d 11 80    	mov    0x80112d00,%edx
8010312e:	83 fa 07             	cmp    $0x7,%edx
80103131:	7f 1b                	jg     8010314e <mpinit+0x16e>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80103133:	0f b6 78 01          	movzbl 0x1(%eax),%edi
80103137:	69 d2 b0 00 00 00    	imul   $0xb0,%edx,%edx
        ncpu++;
8010313d:	83 05 00 2d 11 80 01 	addl   $0x1,0x80112d00
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80103144:	89 d6                	mov    %edx,%esi
80103146:	89 fa                	mov    %edi,%edx
80103148:	88 96 80 27 11 80    	mov    %dl,-0x7feed880(%esi)
        ncpu++;
      }
      p += sizeof(struct mpproc);
8010314e:	83 c0 14             	add    $0x14,%eax
      continue;
80103151:	e9 7a ff ff ff       	jmp    801030d0 <mpinit+0xf0>
80103156:	66 90                	xchg   %ax,%ax
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
80103158:	0f b6 50 01          	movzbl 0x1(%eax),%edx
      p += sizeof(struct mpioapic);
8010315c:	83 c0 08             	add    $0x8,%eax
      }
      p += sizeof(struct mpproc);
      continue;
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
8010315f:	88 15 60 27 11 80    	mov    %dl,0x80112760
      p += sizeof(struct mpioapic);
      continue;
80103165:	e9 66 ff ff ff       	jmp    801030d0 <mpinit+0xf0>
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
8010316a:	ba 00 00 01 00       	mov    $0x10000,%edx
8010316f:	b8 00 00 0f 00       	mov    $0xf0000,%eax
80103174:	e8 07 fe ff ff       	call   80102f80 <mpsearch1>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103179:	85 c0                	test   %eax,%eax
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
8010317b:	89 c6                	mov    %eax,%esi
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
8010317d:	0f 85 af fe ff ff    	jne    80103032 <mpinit+0x52>
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
    panic("Expect to run on an SMP");
80103183:	c7 04 24 32 72 10 80 	movl   $0x80107232,(%esp)
8010318a:	e8 e1 d1 ff ff       	call   80100370 <panic>
8010318f:	90                   	nop
  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
    return 0;
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
  if(memcmp(conf, "PCMP", 4) != 0)
    return 0;
  if(conf->version != 1 && conf->version != 4)
80103190:	3c 01                	cmp    $0x1,%al
80103192:	0f 84 dd fe ff ff    	je     80103075 <mpinit+0x95>
80103198:	eb e9                	jmp    80103183 <mpinit+0x1a3>
      ismp = 0;
      break;
    }
  }
  if(!ismp)
    panic("Didn't find a suitable machine");
8010319a:	c7 04 24 4c 72 10 80 	movl   $0x8010724c,(%esp)
801031a1:	e8 ca d1 ff ff       	call   80100370 <panic>
	...

801031b0 <picinit>:
#define IO_PIC2         0xA0    // Slave (IRQs 8-15)

// Don't use the 8259A interrupt controllers.  Xv6 assumes SMP hardware.
void
picinit(void)
{
801031b0:	55                   	push   %ebp
801031b1:	ba 21 00 00 00       	mov    $0x21,%edx
801031b6:	89 e5                	mov    %esp,%ebp
801031b8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801031bd:	ee                   	out    %al,(%dx)
801031be:	b2 a1                	mov    $0xa1,%dl
801031c0:	ee                   	out    %al,(%dx)
  // mask all interrupts
  outb(IO_PIC1+1, 0xFF);
  outb(IO_PIC2+1, 0xFF);
}
801031c1:	5d                   	pop    %ebp
801031c2:	c3                   	ret    
	...

801031d0 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
801031d0:	55                   	push   %ebp
801031d1:	89 e5                	mov    %esp,%ebp
801031d3:	83 ec 28             	sub    $0x28,%esp
801031d6:	89 5d f4             	mov    %ebx,-0xc(%ebp)
801031d9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801031dc:	89 75 f8             	mov    %esi,-0x8(%ebp)
801031df:	8b 75 08             	mov    0x8(%ebp),%esi
801031e2:	89 7d fc             	mov    %edi,-0x4(%ebp)
  struct pipe *p;

  p = 0;
  *f0 = *f1 = 0;
801031e5:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801031eb:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
801031f1:	e8 6a db ff ff       	call   80100d60 <filealloc>
801031f6:	85 c0                	test   %eax,%eax
801031f8:	89 06                	mov    %eax,(%esi)
801031fa:	0f 84 a6 00 00 00    	je     801032a6 <pipealloc+0xd6>
80103200:	e8 5b db ff ff       	call   80100d60 <filealloc>
80103205:	85 c0                	test   %eax,%eax
80103207:	89 03                	mov    %eax,(%ebx)
80103209:	0f 84 89 00 00 00    	je     80103298 <pipealloc+0xc8>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
8010320f:	e8 9c f2 ff ff       	call   801024b0 <kalloc>
80103214:	85 c0                	test   %eax,%eax
80103216:	89 c7                	mov    %eax,%edi
80103218:	74 7e                	je     80103298 <pipealloc+0xc8>
    goto bad;
  p->readopen = 1;
8010321a:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
80103221:	00 00 00 
  p->writeopen = 1;
80103224:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
8010322b:	00 00 00 
  p->nwrite = 0;
8010322e:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80103235:	00 00 00 
  p->nread = 0;
80103238:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
8010323f:	00 00 00 
  initlock(&p->lock, "pipe");
80103242:	89 04 24             	mov    %eax,(%esp)
80103245:	c7 44 24 04 80 72 10 	movl   $0x80107280,0x4(%esp)
8010324c:	80 
8010324d:	e8 be 0e 00 00       	call   80104110 <initlock>
  (*f0)->type = FD_PIPE;
80103252:	8b 06                	mov    (%esi),%eax
80103254:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
8010325a:	8b 06                	mov    (%esi),%eax
8010325c:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
80103260:	8b 06                	mov    (%esi),%eax
80103262:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
80103266:	8b 06                	mov    (%esi),%eax
80103268:	89 78 0c             	mov    %edi,0xc(%eax)
  (*f1)->type = FD_PIPE;
8010326b:	8b 03                	mov    (%ebx),%eax
8010326d:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
80103273:	8b 03                	mov    (%ebx),%eax
80103275:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
80103279:	8b 03                	mov    (%ebx),%eax
8010327b:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
8010327f:	8b 03                	mov    (%ebx),%eax
  return 0;
80103281:	31 db                	xor    %ebx,%ebx
  (*f0)->writable = 0;
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
80103283:	89 78 0c             	mov    %edi,0xc(%eax)
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
80103286:	89 d8                	mov    %ebx,%eax
80103288:	8b 75 f8             	mov    -0x8(%ebp),%esi
8010328b:	8b 5d f4             	mov    -0xc(%ebp),%ebx
8010328e:	8b 7d fc             	mov    -0x4(%ebp),%edi
80103291:	89 ec                	mov    %ebp,%esp
80103293:	5d                   	pop    %ebp
80103294:	c3                   	ret    
80103295:	8d 76 00             	lea    0x0(%esi),%esi

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
80103298:	8b 06                	mov    (%esi),%eax
8010329a:	85 c0                	test   %eax,%eax
8010329c:	74 08                	je     801032a6 <pipealloc+0xd6>
    fileclose(*f0);
8010329e:	89 04 24             	mov    %eax,(%esp)
801032a1:	e8 7a db ff ff       	call   80100e20 <fileclose>
  if(*f1)
801032a6:	8b 03                	mov    (%ebx),%eax
    fileclose(*f1);
  return -1;
801032a8:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
    fileclose(*f0);
  if(*f1)
801032ad:	85 c0                	test   %eax,%eax
801032af:	74 d5                	je     80103286 <pipealloc+0xb6>
    fileclose(*f1);
801032b1:	89 04 24             	mov    %eax,(%esp)
801032b4:	e8 67 db ff ff       	call   80100e20 <fileclose>
  return -1;
}
801032b9:	89 d8                	mov    %ebx,%eax
801032bb:	8b 75 f8             	mov    -0x8(%ebp),%esi
801032be:	8b 5d f4             	mov    -0xc(%ebp),%ebx
801032c1:	8b 7d fc             	mov    -0x4(%ebp),%edi
801032c4:	89 ec                	mov    %ebp,%esp
801032c6:	5d                   	pop    %ebp
801032c7:	c3                   	ret    
801032c8:	90                   	nop
801032c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801032d0 <pipeclose>:

void
pipeclose(struct pipe *p, int writable)
{
801032d0:	55                   	push   %ebp
801032d1:	89 e5                	mov    %esp,%ebp
801032d3:	83 ec 18             	sub    $0x18,%esp
801032d6:	89 5d f8             	mov    %ebx,-0x8(%ebp)
801032d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801032dc:	89 75 fc             	mov    %esi,-0x4(%ebp)
801032df:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&p->lock);
801032e2:	89 1c 24             	mov    %ebx,(%esp)
801032e5:	e8 96 0f 00 00       	call   80104280 <acquire>
  if(writable){
801032ea:	85 f6                	test   %esi,%esi
801032ec:	74 42                	je     80103330 <pipeclose+0x60>
    p->writeopen = 0;
801032ee:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
801032f5:	00 00 00 
    wakeup(&p->nread);
801032f8:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
801032fe:	89 04 24             	mov    %eax,(%esp)
80103301:	e8 2a 0b 00 00       	call   80103e30 <wakeup>
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
80103306:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
8010330c:	85 d2                	test   %edx,%edx
8010330e:	75 0a                	jne    8010331a <pipeclose+0x4a>
80103310:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80103316:	85 c0                	test   %eax,%eax
80103318:	74 36                	je     80103350 <pipeclose+0x80>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
8010331a:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
8010331d:	8b 75 fc             	mov    -0x4(%ebp),%esi
80103320:	8b 5d f8             	mov    -0x8(%ebp),%ebx
80103323:	89 ec                	mov    %ebp,%esp
80103325:	5d                   	pop    %ebp
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
80103326:	e9 c5 0f 00 00       	jmp    801042f0 <release>
8010332b:	90                   	nop
8010332c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
80103330:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103337:	00 00 00 
    wakeup(&p->nwrite);
8010333a:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103340:	89 04 24             	mov    %eax,(%esp)
80103343:	e8 e8 0a 00 00       	call   80103e30 <wakeup>
80103348:	eb bc                	jmp    80103306 <pipeclose+0x36>
8010334a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
80103350:	89 1c 24             	mov    %ebx,(%esp)
80103353:	e8 98 0f 00 00       	call   801042f0 <release>
    kfree((char*)p);
  } else
    release(&p->lock);
}
80103358:	8b 75 fc             	mov    -0x4(%ebp),%esi
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
8010335b:	89 5d 08             	mov    %ebx,0x8(%ebp)
  } else
    release(&p->lock);
}
8010335e:	8b 5d f8             	mov    -0x8(%ebp),%ebx
80103361:	89 ec                	mov    %ebp,%esp
80103363:	5d                   	pop    %ebp
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
80103364:	e9 d7 ef ff ff       	jmp    80102340 <kfree>
80103369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103370 <pipewrite>:
}

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
80103370:	55                   	push   %ebp
80103371:	89 e5                	mov    %esp,%ebp
80103373:	57                   	push   %edi
80103374:	56                   	push   %esi
80103375:	53                   	push   %ebx
80103376:	83 ec 2c             	sub    $0x2c,%esp
80103379:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  acquire(&p->lock);
8010337c:	89 1c 24             	mov    %ebx,(%esp)
8010337f:	e8 fc 0e 00 00       	call   80104280 <acquire>
  for(i = 0; i < n; i++){
80103384:	8b 45 10             	mov    0x10(%ebp),%eax
80103387:	85 c0                	test   %eax,%eax
80103389:	0f 8e 97 00 00 00    	jle    80103426 <pipewrite+0xb6>
8010338f:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
      if(p->readopen == 0 || myproc()->killed){
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
80103395:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
pipewrite(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
8010339b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
      if(p->readopen == 0 || myproc()->killed){
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
801033a2:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
801033a8:	eb 3a                	jmp    801033e4 <pipewrite+0x74>
801033aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
      if(p->readopen == 0 || myproc()->killed){
801033b0:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
801033b6:	85 c0                	test   %eax,%eax
801033b8:	0f 84 82 00 00 00    	je     80103440 <pipewrite+0xd0>
801033be:	e8 6d 03 00 00       	call   80103730 <myproc>
801033c3:	8b 48 24             	mov    0x24(%eax),%ecx
801033c6:	85 c9                	test   %ecx,%ecx
801033c8:	75 76                	jne    80103440 <pipewrite+0xd0>
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
801033ca:	89 3c 24             	mov    %edi,(%esp)
801033cd:	e8 5e 0a 00 00       	call   80103e30 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
801033d2:	89 5c 24 04          	mov    %ebx,0x4(%esp)
801033d6:	89 34 24             	mov    %esi,(%esp)
801033d9:	e8 b2 08 00 00       	call   80103c90 <sleep>
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801033de:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
801033e4:	8b 93 34 02 00 00    	mov    0x234(%ebx),%edx
801033ea:	81 c2 00 02 00 00    	add    $0x200,%edx
801033f0:	39 d0                	cmp    %edx,%eax
801033f2:	74 bc                	je     801033b0 <pipewrite+0x40>
        return -1;
      }
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
801033f4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801033f7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
pipewrite(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
801033fa:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
        return -1;
      }
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
801033fe:	0f b6 14 11          	movzbl (%ecx,%edx,1),%edx
80103402:	88 55 e3             	mov    %dl,-0x1d(%ebp)
80103405:	0f b6 4d e3          	movzbl -0x1d(%ebp),%ecx
80103409:	89 c2                	mov    %eax,%edx
8010340b:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
80103411:	83 c0 01             	add    $0x1,%eax
80103414:	88 4c 13 34          	mov    %cl,0x34(%ebx,%edx,1)
pipewrite(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
80103418:	8b 55 10             	mov    0x10(%ebp),%edx
8010341b:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
        return -1;
      }
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
8010341e:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
pipewrite(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
80103424:	75 be                	jne    801033e4 <pipewrite+0x74>
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
80103426:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
8010342c:	89 04 24             	mov    %eax,(%esp)
8010342f:	e8 fc 09 00 00       	call   80103e30 <wakeup>
  release(&p->lock);
80103434:	89 1c 24             	mov    %ebx,(%esp)
80103437:	e8 b4 0e 00 00       	call   801042f0 <release>
  return n;
8010343c:	eb 11                	jmp    8010344f <pipewrite+0xdf>
8010343e:	66 90                	xchg   %ax,%ax

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
      if(p->readopen == 0 || myproc()->killed){
        release(&p->lock);
80103440:	89 1c 24             	mov    %ebx,(%esp)
80103443:	e8 a8 0e 00 00       	call   801042f0 <release>
        return -1;
80103448:	c7 45 10 ff ff ff ff 	movl   $0xffffffff,0x10(%ebp)
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
  release(&p->lock);
  return n;
}
8010344f:	8b 45 10             	mov    0x10(%ebp),%eax
80103452:	83 c4 2c             	add    $0x2c,%esp
80103455:	5b                   	pop    %ebx
80103456:	5e                   	pop    %esi
80103457:	5f                   	pop    %edi
80103458:	5d                   	pop    %ebp
80103459:	c3                   	ret    
8010345a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103460 <piperead>:

int
piperead(struct pipe *p, char *addr, int n)
{
80103460:	55                   	push   %ebp
80103461:	89 e5                	mov    %esp,%ebp
80103463:	57                   	push   %edi
80103464:	56                   	push   %esi
80103465:	53                   	push   %ebx
80103466:	83 ec 1c             	sub    $0x1c,%esp
80103469:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010346c:	8b 7d 10             	mov    0x10(%ebp),%edi
  int i;

  acquire(&p->lock);
8010346f:	89 1c 24             	mov    %ebx,(%esp)
80103472:	e8 09 0e 00 00       	call   80104280 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
80103477:	8b 93 34 02 00 00    	mov    0x234(%ebx),%edx
8010347d:	3b 93 38 02 00 00    	cmp    0x238(%ebx),%edx
80103483:	75 5b                	jne    801034e0 <piperead+0x80>
80103485:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
8010348b:	85 c0                	test   %eax,%eax
8010348d:	74 51                	je     801034e0 <piperead+0x80>
    if(myproc()->killed){
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
8010348f:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
80103495:	eb 25                	jmp    801034bc <piperead+0x5c>
80103497:	90                   	nop
80103498:	89 5c 24 04          	mov    %ebx,0x4(%esp)
8010349c:	89 34 24             	mov    %esi,(%esp)
8010349f:	e8 ec 07 00 00       	call   80103c90 <sleep>
piperead(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
801034a4:	8b 93 34 02 00 00    	mov    0x234(%ebx),%edx
801034aa:	3b 93 38 02 00 00    	cmp    0x238(%ebx),%edx
801034b0:	75 2e                	jne    801034e0 <piperead+0x80>
801034b2:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
801034b8:	85 c0                	test   %eax,%eax
801034ba:	74 24                	je     801034e0 <piperead+0x80>
    if(myproc()->killed){
801034bc:	e8 6f 02 00 00       	call   80103730 <myproc>
801034c1:	8b 40 24             	mov    0x24(%eax),%eax
801034c4:	85 c0                	test   %eax,%eax
801034c6:	74 d0                	je     80103498 <piperead+0x38>
      release(&p->lock);
801034c8:	89 1c 24             	mov    %ebx,(%esp)
      return -1;
801034cb:	be ff ff ff ff       	mov    $0xffffffff,%esi
  int i;

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
    if(myproc()->killed){
      release(&p->lock);
801034d0:	e8 1b 0e 00 00       	call   801042f0 <release>
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
801034d5:	83 c4 1c             	add    $0x1c,%esp
801034d8:	89 f0                	mov    %esi,%eax
801034da:	5b                   	pop    %ebx
801034db:	5e                   	pop    %esi
801034dc:	5f                   	pop    %edi
801034dd:	5d                   	pop    %ebp
801034de:	c3                   	ret    
801034df:	90                   	nop
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
801034e0:	31 f6                	xor    %esi,%esi
801034e2:	85 ff                	test   %edi,%edi
801034e4:	7e 39                	jle    8010351f <piperead+0xbf>
    if(p->nread == p->nwrite)
801034e6:	3b 93 38 02 00 00    	cmp    0x238(%ebx),%edx
801034ec:	74 31                	je     8010351f <piperead+0xbf>
  release(&p->lock);
  return n;
}

int
piperead(struct pipe *p, char *addr, int n)
801034ee:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801034f1:	29 d1                	sub    %edx,%ecx
801034f3:	eb 0b                	jmp    80103500 <piperead+0xa0>
801034f5:	8d 76 00             	lea    0x0(%esi),%esi
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    if(p->nread == p->nwrite)
801034f8:	39 93 38 02 00 00    	cmp    %edx,0x238(%ebx)
801034fe:	74 1f                	je     8010351f <piperead+0xbf>
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
80103500:	89 d0                	mov    %edx,%eax
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103502:	83 c6 01             	add    $0x1,%esi
    if(p->nread == p->nwrite)
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
80103505:	25 ff 01 00 00       	and    $0x1ff,%eax
8010350a:	0f b6 44 03 34       	movzbl 0x34(%ebx,%eax,1),%eax
8010350f:	88 04 11             	mov    %al,(%ecx,%edx,1)
80103512:	83 c2 01             	add    $0x1,%edx
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103515:	39 fe                	cmp    %edi,%esi
    if(p->nread == p->nwrite)
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
80103517:	89 93 34 02 00 00    	mov    %edx,0x234(%ebx)
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
8010351d:	75 d9                	jne    801034f8 <piperead+0x98>
    if(p->nread == p->nwrite)
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
8010351f:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103525:	89 04 24             	mov    %eax,(%esp)
80103528:	e8 03 09 00 00       	call   80103e30 <wakeup>
  release(&p->lock);
8010352d:	89 1c 24             	mov    %ebx,(%esp)
80103530:	e8 bb 0d 00 00       	call   801042f0 <release>
  return i;
}
80103535:	83 c4 1c             	add    $0x1c,%esp
80103538:	89 f0                	mov    %esi,%eax
8010353a:	5b                   	pop    %ebx
8010353b:	5e                   	pop    %esi
8010353c:	5f                   	pop    %edi
8010353d:	5d                   	pop    %ebp
8010353e:	c3                   	ret    
	...

80103540 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103540:	55                   	push   %ebp
80103541:	89 e5                	mov    %esp,%ebp
80103543:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103544:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103549:	83 ec 14             	sub    $0x14,%esp
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);
8010354c:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103553:	e8 28 0d 00 00       	call   80104280 <acquire>

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
80103558:	8b 15 60 2d 11 80    	mov    0x80112d60,%edx
8010355e:	85 d2                	test   %edx,%edx
80103560:	74 18                	je     8010357a <allocproc+0x3a>
80103562:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103568:	83 c3 7c             	add    $0x7c,%ebx
8010356b:	81 fb 54 4c 11 80    	cmp    $0x80114c54,%ebx
80103571:	73 7d                	jae    801035f0 <allocproc+0xb0>
    if(p->state == UNUSED)
80103573:	8b 43 0c             	mov    0xc(%ebx),%eax
80103576:	85 c0                	test   %eax,%eax
80103578:	75 ee                	jne    80103568 <allocproc+0x28>
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
8010357a:	a1 00 a0 10 80       	mov    0x8010a000,%eax

  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
8010357f:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->pid = nextpid++;
80103586:	89 43 10             	mov    %eax,0x10(%ebx)
80103589:	83 c0 01             	add    $0x1,%eax
8010358c:	a3 00 a0 10 80       	mov    %eax,0x8010a000

  release(&ptable.lock);
80103591:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103598:	e8 53 0d 00 00       	call   801042f0 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
8010359d:	e8 0e ef ff ff       	call   801024b0 <kalloc>
801035a2:	85 c0                	test   %eax,%eax
801035a4:	89 43 08             	mov    %eax,0x8(%ebx)
801035a7:	74 5d                	je     80103606 <allocproc+0xc6>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
801035a9:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
801035af:	89 53 18             	mov    %edx,0x18(%ebx)
  p->tf = (struct trapframe*)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;
801035b2:	c7 80 b0 0f 00 00 08 	movl   $0x80105508,0xfb0(%eax)
801035b9:	55 10 80 

  sp -= sizeof *p->context;
801035bc:	05 9c 0f 00 00       	add    $0xf9c,%eax
  p->context = (struct context*)sp;
801035c1:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
801035c4:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
801035cb:	00 
801035cc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801035d3:	00 
801035d4:	89 04 24             	mov    %eax,(%esp)
801035d7:	e8 64 0d 00 00       	call   80104340 <memset>
  p->context->eip = (uint)forkret;
801035dc:	8b 43 1c             	mov    0x1c(%ebx),%eax
801035df:	c7 40 10 20 36 10 80 	movl   $0x80103620,0x10(%eax)

  return p;
}
801035e6:	83 c4 14             	add    $0x14,%esp
801035e9:	89 d8                	mov    %ebx,%eax
801035eb:	5b                   	pop    %ebx
801035ec:	5d                   	pop    %ebp
801035ed:	c3                   	ret    
801035ee:	66 90                	xchg   %ax,%ax

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
801035f0:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
  return 0;
801035f7:	31 db                	xor    %ebx,%ebx

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
801035f9:	e8 f2 0c 00 00       	call   801042f0 <release>
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  return p;
}
801035fe:	83 c4 14             	add    $0x14,%esp
80103601:	89 d8                	mov    %ebx,%eax
80103603:	5b                   	pop    %ebx
80103604:	5d                   	pop    %ebp
80103605:	c3                   	ret    

  release(&ptable.lock);

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
    p->state = UNUSED;
80103606:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
8010360d:	31 db                	xor    %ebx,%ebx
8010360f:	eb d5                	jmp    801035e6 <allocproc+0xa6>
80103611:	eb 0d                	jmp    80103620 <forkret>
80103613:	90                   	nop
80103614:	90                   	nop
80103615:	90                   	nop
80103616:	90                   	nop
80103617:	90                   	nop
80103618:	90                   	nop
80103619:	90                   	nop
8010361a:	90                   	nop
8010361b:	90                   	nop
8010361c:	90                   	nop
8010361d:	90                   	nop
8010361e:	90                   	nop
8010361f:	90                   	nop

80103620 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
80103620:	55                   	push   %ebp
80103621:	89 e5                	mov    %esp,%ebp
80103623:	83 ec 18             	sub    $0x18,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
80103626:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
8010362d:	e8 be 0c 00 00       	call   801042f0 <release>

  if (first) {
80103632:	8b 0d 04 a0 10 80    	mov    0x8010a004,%ecx
80103638:	85 c9                	test   %ecx,%ecx
8010363a:	75 04                	jne    80103640 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
8010363c:	c9                   	leave  
8010363d:	c3                   	ret    
8010363e:	66 90                	xchg   %ax,%ax
  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
80103640:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)

  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
80103647:	c7 05 04 a0 10 80 00 	movl   $0x0,0x8010a004
8010364e:	00 00 00 
    iinit(ROOTDEV);
80103651:	e8 0a de ff ff       	call   80101460 <iinit>
    initlog(ROOTDEV);
80103656:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010365d:	e8 6e f4 ff ff       	call   80102ad0 <initlog>
  }

  // Return to "caller", actually trapret (see allocproc).
}
80103662:	c9                   	leave  
80103663:	c3                   	ret    
80103664:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010366a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103670 <pinit>:

static void wakeup1(void *chan);

void
pinit(void)
{
80103670:	55                   	push   %ebp
80103671:	89 e5                	mov    %esp,%ebp
80103673:	83 ec 18             	sub    $0x18,%esp
  initlock(&ptable.lock, "ptable");
80103676:	c7 44 24 04 85 72 10 	movl   $0x80107285,0x4(%esp)
8010367d:	80 
8010367e:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103685:	e8 86 0a 00 00       	call   80104110 <initlock>
}
8010368a:	c9                   	leave  
8010368b:	c3                   	ret    
8010368c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103690 <mycpu>:

// Must be called with interrupts disabled to avoid the caller being
// rescheduled between reading lapicid and running through the loop.
struct cpu*
mycpu(void)
{
80103690:	55                   	push   %ebp
80103691:	89 e5                	mov    %esp,%ebp
80103693:	56                   	push   %esi
80103694:	53                   	push   %ebx
80103695:	83 ec 10             	sub    $0x10,%esp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103698:	9c                   	pushf  
80103699:	58                   	pop    %eax
  int apicid, i;
  
  if(readeflags()&FL_IF)
8010369a:	f6 c4 02             	test   $0x2,%ah
8010369d:	75 57                	jne    801036f6 <mycpu+0x66>
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
8010369f:	e8 4c f0 ff ff       	call   801026f0 <lapicid>
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
801036a4:	8b 35 00 2d 11 80    	mov    0x80112d00,%esi
801036aa:	85 f6                	test   %esi,%esi
801036ac:	7e 3c                	jle    801036ea <mycpu+0x5a>
    if (cpus[i].apicid == apicid)
801036ae:	0f b6 15 80 27 11 80 	movzbl 0x80112780,%edx
801036b5:	39 c2                	cmp    %eax,%edx
801036b7:	74 2d                	je     801036e6 <mycpu+0x56>
      return &cpus[i];
801036b9:	b9 30 28 11 80       	mov    $0x80112830,%ecx
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
801036be:	31 d2                	xor    %edx,%edx
801036c0:	83 c2 01             	add    $0x1,%edx
801036c3:	39 f2                	cmp    %esi,%edx
801036c5:	74 23                	je     801036ea <mycpu+0x5a>
    if (cpus[i].apicid == apicid)
801036c7:	0f b6 19             	movzbl (%ecx),%ebx
801036ca:	81 c1 b0 00 00 00    	add    $0xb0,%ecx
801036d0:	39 c3                	cmp    %eax,%ebx
801036d2:	75 ec                	jne    801036c0 <mycpu+0x30>
      return &cpus[i];
801036d4:	69 c2 b0 00 00 00    	imul   $0xb0,%edx,%eax
  }
  panic("unknown apicid\n");
}
801036da:	83 c4 10             	add    $0x10,%esp
801036dd:	5b                   	pop    %ebx
801036de:	5e                   	pop    %esi
801036df:	5d                   	pop    %ebp
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return &cpus[i];
801036e0:	05 80 27 11 80       	add    $0x80112780,%eax
  }
  panic("unknown apicid\n");
}
801036e5:	c3                   	ret    
  
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
801036e6:	31 d2                	xor    %edx,%edx
801036e8:	eb ea                	jmp    801036d4 <mycpu+0x44>
      return &cpus[i];
  }
  panic("unknown apicid\n");
801036ea:	c7 04 24 8c 72 10 80 	movl   $0x8010728c,(%esp)
801036f1:	e8 7a cc ff ff       	call   80100370 <panic>
mycpu(void)
{
  int apicid, i;
  
  if(readeflags()&FL_IF)
    panic("mycpu called with interrupts enabled\n");
801036f6:	c7 04 24 68 73 10 80 	movl   $0x80107368,(%esp)
801036fd:	e8 6e cc ff ff       	call   80100370 <panic>
80103702:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103710 <cpuid>:
  initlock(&ptable.lock, "ptable");
}

// Must be called with interrupts disabled
int
cpuid() {
80103710:	55                   	push   %ebp
80103711:	89 e5                	mov    %esp,%ebp
80103713:	83 ec 08             	sub    $0x8,%esp
  return mycpu()-cpus;
80103716:	e8 75 ff ff ff       	call   80103690 <mycpu>
}
8010371b:	c9                   	leave  
}

// Must be called with interrupts disabled
int
cpuid() {
  return mycpu()-cpus;
8010371c:	2d 80 27 11 80       	sub    $0x80112780,%eax
80103721:	c1 f8 04             	sar    $0x4,%eax
80103724:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
}
8010372a:	c3                   	ret    
8010372b:	90                   	nop
8010372c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103730 <myproc>:
}

// Disable interrupts so that we are not rescheduled
// while reading proc from the cpu structure
struct proc*
myproc(void) {
80103730:	55                   	push   %ebp
80103731:	89 e5                	mov    %esp,%ebp
80103733:	53                   	push   %ebx
80103734:	83 ec 04             	sub    $0x4,%esp
  struct cpu *c;
  struct proc *p;
  pushcli();
80103737:	e8 54 0a 00 00       	call   80104190 <pushcli>
  c = mycpu();
8010373c:	e8 4f ff ff ff       	call   80103690 <mycpu>
  p = c->proc;
80103741:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103747:	e8 84 0a 00 00       	call   801041d0 <popcli>
  return p;
}
8010374c:	83 c4 04             	add    $0x4,%esp
8010374f:	89 d8                	mov    %ebx,%eax
80103751:	5b                   	pop    %ebx
80103752:	5d                   	pop    %ebp
80103753:	c3                   	ret    
80103754:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010375a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103760 <userinit>:

//PAGEBREAK: 32
// Set up first user process.
void
userinit(void)
{
80103760:	55                   	push   %ebp
80103761:	89 e5                	mov    %esp,%ebp
80103763:	53                   	push   %ebx
80103764:	83 ec 14             	sub    $0x14,%esp
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  p = allocproc();
80103767:	e8 d4 fd ff ff       	call   80103540 <allocproc>
8010376c:	89 c3                	mov    %eax,%ebx
  
  initproc = p;
8010376e:	a3 a0 a5 10 80       	mov    %eax,0x8010a5a0
  if((p->pgdir = setupkvm()) == 0)
80103773:	e8 48 33 00 00       	call   80106ac0 <setupkvm>
80103778:	85 c0                	test   %eax,%eax
8010377a:	89 43 04             	mov    %eax,0x4(%ebx)
8010377d:	0f 84 ce 00 00 00    	je     80103851 <userinit+0xf1>
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
80103783:	89 04 24             	mov    %eax,(%esp)
80103786:	c7 44 24 08 2c 00 00 	movl   $0x2c,0x8(%esp)
8010378d:	00 
8010378e:	c7 44 24 04 60 a4 10 	movl   $0x8010a460,0x4(%esp)
80103795:	80 
80103796:	e8 85 2f 00 00       	call   80106720 <inituvm>
  p->sz = PGSIZE;
8010379b:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
801037a1:	c7 44 24 08 4c 00 00 	movl   $0x4c,0x8(%esp)
801037a8:	00 
801037a9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
801037b0:	00 
801037b1:	8b 43 18             	mov    0x18(%ebx),%eax
801037b4:	89 04 24             	mov    %eax,(%esp)
801037b7:	e8 84 0b 00 00       	call   80104340 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
801037bc:	8b 43 18             	mov    0x18(%ebx),%eax
801037bf:	66 c7 40 3c 1b 00    	movw   $0x1b,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
801037c5:	8b 43 18             	mov    0x18(%ebx),%eax
801037c8:	66 c7 40 2c 23 00    	movw   $0x23,0x2c(%eax)
  p->tf->es = p->tf->ds;
801037ce:	8b 43 18             	mov    0x18(%ebx),%eax
801037d1:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801037d5:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
801037d9:	8b 43 18             	mov    0x18(%ebx),%eax
801037dc:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801037e0:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
801037e4:	8b 43 18             	mov    0x18(%ebx),%eax
801037e7:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
801037ee:	8b 43 18             	mov    0x18(%ebx),%eax
801037f1:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
801037f8:	8b 43 18             	mov    0x18(%ebx),%eax
801037fb:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)

  safestrcpy(p->name, "initcode", sizeof(p->name));
80103802:	8d 43 6c             	lea    0x6c(%ebx),%eax
80103805:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
8010380c:	00 
8010380d:	c7 44 24 04 b5 72 10 	movl   $0x801072b5,0x4(%esp)
80103814:	80 
80103815:	89 04 24             	mov    %eax,(%esp)
80103818:	e8 13 0d 00 00       	call   80104530 <safestrcpy>
  p->cwd = namei("/");
8010381d:	c7 04 24 be 72 10 80 	movl   $0x801072be,(%esp)
80103824:	e8 47 e7 ff ff       	call   80101f70 <namei>
80103829:	89 43 68             	mov    %eax,0x68(%ebx)

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);
8010382c:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103833:	e8 48 0a 00 00       	call   80104280 <acquire>

  p->state = RUNNABLE;
80103838:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)

  release(&ptable.lock);
8010383f:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103846:	e8 a5 0a 00 00       	call   801042f0 <release>
}
8010384b:	83 c4 14             	add    $0x14,%esp
8010384e:	5b                   	pop    %ebx
8010384f:	5d                   	pop    %ebp
80103850:	c3                   	ret    

  p = allocproc();
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
80103851:	c7 04 24 9c 72 10 80 	movl   $0x8010729c,(%esp)
80103858:	e8 13 cb ff ff       	call   80100370 <panic>
8010385d:	8d 76 00             	lea    0x0(%esi),%esi

80103860 <growproc>:

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
80103860:	55                   	push   %ebp
80103861:	89 e5                	mov    %esp,%ebp
80103863:	83 ec 18             	sub    $0x18,%esp
80103866:	89 5d f8             	mov    %ebx,-0x8(%ebp)
80103869:	89 75 fc             	mov    %esi,-0x4(%ebp)
8010386c:	8b 75 08             	mov    0x8(%ebp),%esi
  uint sz;
  struct proc *curproc = myproc();
8010386f:	e8 bc fe ff ff       	call   80103730 <myproc>

  sz = curproc->sz;
  if(n > 0){
80103874:	83 fe 00             	cmp    $0x0,%esi
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
  uint sz;
  struct proc *curproc = myproc();
80103877:	89 c3                	mov    %eax,%ebx

  sz = curproc->sz;
80103879:	8b 10                	mov    (%eax),%edx
  if(n > 0){
8010387b:	7e 3b                	jle    801038b8 <growproc+0x58>
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
8010387d:	01 d6                	add    %edx,%esi
8010387f:	89 54 24 04          	mov    %edx,0x4(%esp)
80103883:	89 74 24 08          	mov    %esi,0x8(%esp)
80103887:	8b 40 04             	mov    0x4(%eax),%eax
8010388a:	89 04 24             	mov    %eax,(%esp)
8010388d:	e8 7e 30 00 00       	call   80106910 <allocuvm>
80103892:	89 c2                	mov    %eax,%edx
      return -1;
80103894:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  uint sz;
  struct proc *curproc = myproc();

  sz = curproc->sz;
  if(n > 0){
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103899:	85 d2                	test   %edx,%edx
8010389b:	74 0c                	je     801038a9 <growproc+0x49>
      return -1;
  } else if(n < 0){
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  curproc->sz = sz;
8010389d:	89 13                	mov    %edx,(%ebx)
  switchuvm(curproc);
8010389f:	89 1c 24             	mov    %ebx,(%esp)
801038a2:	e8 79 2d 00 00       	call   80106620 <switchuvm>
  return 0;
801038a7:	31 c0                	xor    %eax,%eax
}
801038a9:	8b 5d f8             	mov    -0x8(%ebp),%ebx
801038ac:	8b 75 fc             	mov    -0x4(%ebp),%esi
801038af:	89 ec                	mov    %ebp,%esp
801038b1:	5d                   	pop    %ebp
801038b2:	c3                   	ret    
801038b3:	90                   	nop
801038b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  sz = curproc->sz;
  if(n > 0){
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  } else if(n < 0){
801038b8:	74 e3                	je     8010389d <growproc+0x3d>
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
801038ba:	01 d6                	add    %edx,%esi
801038bc:	89 54 24 04          	mov    %edx,0x4(%esp)
801038c0:	89 74 24 08          	mov    %esi,0x8(%esp)
801038c4:	8b 40 04             	mov    0x4(%eax),%eax
801038c7:	89 04 24             	mov    %eax,(%esp)
801038ca:	e8 a1 2f 00 00       	call   80106870 <deallocuvm>
801038cf:	89 c2                	mov    %eax,%edx
      return -1;
801038d1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  sz = curproc->sz;
  if(n > 0){
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  } else if(n < 0){
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
801038d6:	85 d2                	test   %edx,%edx
801038d8:	75 c3                	jne    8010389d <growproc+0x3d>
801038da:	eb cd                	jmp    801038a9 <growproc+0x49>
801038dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801038e0 <fork>:
// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int
fork(void)
{
801038e0:	55                   	push   %ebp
801038e1:	89 e5                	mov    %esp,%ebp
801038e3:	57                   	push   %edi
801038e4:	56                   	push   %esi
801038e5:	53                   	push   %ebx
801038e6:	83 ec 2c             	sub    $0x2c,%esp
  int i, pid;
  struct proc *np;
  struct proc *curproc = myproc();
801038e9:	e8 42 fe ff ff       	call   80103730 <myproc>
801038ee:	89 c3                	mov    %eax,%ebx

  // Allocate process.
  if((np = allocproc()) == 0){
801038f0:	e8 4b fc ff ff       	call   80103540 <allocproc>
801038f5:	85 c0                	test   %eax,%eax
801038f7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801038fa:	0f 84 c6 00 00 00    	je     801039c6 <fork+0xe6>
    return -1;
  }

  // Copy process state from proc.
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
80103900:	8b 03                	mov    (%ebx),%eax
80103902:	89 44 24 04          	mov    %eax,0x4(%esp)
80103906:	8b 43 04             	mov    0x4(%ebx),%eax
80103909:	89 04 24             	mov    %eax,(%esp)
8010390c:	e8 7f 32 00 00       	call   80106b90 <copyuvm>
80103911:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103914:	85 c0                	test   %eax,%eax
80103916:	89 42 04             	mov    %eax,0x4(%edx)
80103919:	0f 84 ae 00 00 00    	je     801039cd <fork+0xed>
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = curproc->sz;
8010391f:	8b 03                	mov    (%ebx),%eax
  np->parent = curproc;
  *np->tf = *curproc->tf;
80103921:	b9 13 00 00 00       	mov    $0x13,%ecx
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = curproc->sz;
80103926:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103929:	89 02                	mov    %eax,(%edx)
  np->parent = curproc;
  *np->tf = *curproc->tf;
8010392b:	8b 42 18             	mov    0x18(%edx),%eax
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = curproc->sz;
  np->parent = curproc;
8010392e:	89 5a 14             	mov    %ebx,0x14(%edx)
  *np->tf = *curproc->tf;
80103931:	8b 73 18             	mov    0x18(%ebx),%esi
80103934:	89 c7                	mov    %eax,%edi
80103936:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
80103938:	31 f6                	xor    %esi,%esi
  np->sz = curproc->sz;
  np->parent = curproc;
  *np->tf = *curproc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;
8010393a:	8b 42 18             	mov    0x18(%edx),%eax
8010393d:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
80103944:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
80103948:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
8010394c:	85 c0                	test   %eax,%eax
8010394e:	74 0f                	je     8010395f <fork+0x7f>
      np->ofile[i] = filedup(curproc->ofile[i]);
80103950:	89 04 24             	mov    %eax,(%esp)
80103953:	e8 78 d4 ff ff       	call   80100dd0 <filedup>
80103958:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010395b:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
  *np->tf = *curproc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
8010395f:	83 c6 01             	add    $0x1,%esi
80103962:	83 fe 10             	cmp    $0x10,%esi
80103965:	75 e1                	jne    80103948 <fork+0x68>
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
80103967:	8b 43 68             	mov    0x68(%ebx),%eax

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
8010396a:	83 c3 6c             	add    $0x6c,%ebx
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
8010396d:	89 04 24             	mov    %eax,(%esp)
80103970:	e8 fb dc ff ff       	call   80101670 <idup>
80103975:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103978:	89 42 68             	mov    %eax,0x68(%edx)

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
8010397b:	89 d0                	mov    %edx,%eax
8010397d:	83 c0 6c             	add    $0x6c,%eax
80103980:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80103984:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
8010398b:	00 
8010398c:	89 04 24             	mov    %eax,(%esp)
8010398f:	e8 9c 0b 00 00       	call   80104530 <safestrcpy>

  pid = np->pid;
80103994:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103997:	8b 58 10             	mov    0x10(%eax),%ebx

  acquire(&ptable.lock);
8010399a:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
801039a1:	e8 da 08 00 00       	call   80104280 <acquire>

  np->state = RUNNABLE;
801039a6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801039a9:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)

  release(&ptable.lock);
801039b0:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
801039b7:	e8 34 09 00 00       	call   801042f0 <release>

  return pid;
}
801039bc:	83 c4 2c             	add    $0x2c,%esp
801039bf:	89 d8                	mov    %ebx,%eax
801039c1:	5b                   	pop    %ebx
801039c2:	5e                   	pop    %esi
801039c3:	5f                   	pop    %edi
801039c4:	5d                   	pop    %ebp
801039c5:	c3                   	ret    
  struct proc *np;
  struct proc *curproc = myproc();

  // Allocate process.
  if((np = allocproc()) == 0){
    return -1;
801039c6:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801039cb:	eb ef                	jmp    801039bc <fork+0xdc>
  }

  // Copy process state from proc.
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
    kfree(np->kstack);
801039cd:	8b 42 08             	mov    0x8(%edx),%eax
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
801039d0:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
    return -1;
  }

  // Copy process state from proc.
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
    kfree(np->kstack);
801039d5:	89 04 24             	mov    %eax,(%esp)
801039d8:	e8 63 e9 ff ff       	call   80102340 <kfree>
    np->kstack = 0;
801039dd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801039e0:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
    np->state = UNUSED;
801039e7:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
    return -1;
801039ee:	eb cc                	jmp    801039bc <fork+0xdc>

801039f0 <scheduler>:
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
void
scheduler(void)
{
801039f0:	55                   	push   %ebp
801039f1:	89 e5                	mov    %esp,%ebp
801039f3:	57                   	push   %edi
801039f4:	56                   	push   %esi
801039f5:	53                   	push   %ebx
801039f6:	83 ec 1c             	sub    $0x1c,%esp
  struct proc *p;
  struct cpu *c = mycpu();
801039f9:	e8 92 fc ff ff       	call   80103690 <mycpu>
801039fe:	89 c6                	mov    %eax,%esi
  c->proc = 0;
80103a00:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103a07:	00 00 00 
80103a0a:	8d 78 04             	lea    0x4(%eax),%edi
80103a0d:	8d 76 00             	lea    0x0(%esi),%esi
}

static inline void
sti(void)
{
  asm volatile("sti");
80103a10:	fb                   	sti    
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103a11:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80103a16:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103a1d:	e8 5e 08 00 00       	call   80104280 <acquire>
80103a22:	eb 0f                	jmp    80103a33 <scheduler+0x43>
80103a24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103a28:	83 c3 7c             	add    $0x7c,%ebx
80103a2b:	81 fb 54 4c 11 80    	cmp    $0x80114c54,%ebx
80103a31:	73 45                	jae    80103a78 <scheduler+0x88>
      if(p->state != RUNNABLE)
80103a33:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103a37:	75 ef                	jne    80103a28 <scheduler+0x38>
        continue;

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
80103a39:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
      switchuvm(p);
80103a3f:	89 1c 24             	mov    %ebx,(%esp)
80103a42:	e8 d9 2b 00 00       	call   80106620 <switchuvm>
      p->state = RUNNING;

      swtch(&(c->scheduler), p->context);
80103a47:	8b 43 1c             	mov    0x1c(%ebx),%eax
      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
      switchuvm(p);
      p->state = RUNNING;
80103a4a:	c7 43 0c 04 00 00 00 	movl   $0x4,0xc(%ebx)
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103a51:	83 c3 7c             	add    $0x7c,%ebx
      // before jumping back to us.
      c->proc = p;
      switchuvm(p);
      p->state = RUNNING;

      swtch(&(c->scheduler), p->context);
80103a54:	89 3c 24             	mov    %edi,(%esp)
80103a57:	89 44 24 04          	mov    %eax,0x4(%esp)
80103a5b:	e8 2c 0b 00 00       	call   8010458c <swtch>
      switchkvm();
80103a60:	e8 9b 2b 00 00       	call   80106600 <switchkvm>
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103a65:	81 fb 54 4c 11 80    	cmp    $0x80114c54,%ebx
      swtch(&(c->scheduler), p->context);
      switchkvm();

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
80103a6b:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
80103a72:	00 00 00 
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103a75:	72 bc                	jb     80103a33 <scheduler+0x43>
80103a77:	90                   	nop

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
    }
    release(&ptable.lock);
80103a78:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103a7f:	e8 6c 08 00 00       	call   801042f0 <release>

  }
80103a84:	eb 8a                	jmp    80103a10 <scheduler+0x20>
80103a86:	8d 76 00             	lea    0x0(%esi),%esi
80103a89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103a90 <sched>:
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
80103a90:	55                   	push   %ebp
80103a91:	89 e5                	mov    %esp,%ebp
80103a93:	56                   	push   %esi
80103a94:	53                   	push   %ebx
80103a95:	83 ec 10             	sub    $0x10,%esp
  int intena;
  struct proc *p = myproc();
80103a98:	e8 93 fc ff ff       	call   80103730 <myproc>

  if(!holding(&ptable.lock))
80103a9d:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
// there's no process.
void
sched(void)
{
  int intena;
  struct proc *p = myproc();
80103aa4:	89 c3                	mov    %eax,%ebx

  if(!holding(&ptable.lock))
80103aa6:	e8 95 07 00 00       	call   80104240 <holding>
80103aab:	85 c0                	test   %eax,%eax
80103aad:	74 4f                	je     80103afe <sched+0x6e>
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
80103aaf:	e8 dc fb ff ff       	call   80103690 <mycpu>
80103ab4:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103abb:	75 65                	jne    80103b22 <sched+0x92>
    panic("sched locks");
  if(p->state == RUNNING)
80103abd:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103ac1:	74 53                	je     80103b16 <sched+0x86>

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103ac3:	9c                   	pushf  
80103ac4:	58                   	pop    %eax
    panic("sched running");
  if(readeflags()&FL_IF)
80103ac5:	f6 c4 02             	test   $0x2,%ah
80103ac8:	75 40                	jne    80103b0a <sched+0x7a>
    panic("sched interruptible");
  intena = mycpu()->intena;
80103aca:	e8 c1 fb ff ff       	call   80103690 <mycpu>
  swtch(&p->context, mycpu()->scheduler);
80103acf:	83 c3 1c             	add    $0x1c,%ebx
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = mycpu()->intena;
80103ad2:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
80103ad8:	e8 b3 fb ff ff       	call   80103690 <mycpu>
80103add:	8b 40 04             	mov    0x4(%eax),%eax
80103ae0:	89 1c 24             	mov    %ebx,(%esp)
80103ae3:	89 44 24 04          	mov    %eax,0x4(%esp)
80103ae7:	e8 a0 0a 00 00       	call   8010458c <swtch>
  mycpu()->intena = intena;
80103aec:	e8 9f fb ff ff       	call   80103690 <mycpu>
80103af1:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
80103af7:	83 c4 10             	add    $0x10,%esp
80103afa:	5b                   	pop    %ebx
80103afb:	5e                   	pop    %esi
80103afc:	5d                   	pop    %ebp
80103afd:	c3                   	ret    
{
  int intena;
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
80103afe:	c7 04 24 c0 72 10 80 	movl   $0x801072c0,(%esp)
80103b05:	e8 66 c8 ff ff       	call   80100370 <panic>
  if(mycpu()->ncli != 1)
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
80103b0a:	c7 04 24 ec 72 10 80 	movl   $0x801072ec,(%esp)
80103b11:	e8 5a c8 ff ff       	call   80100370 <panic>
  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
80103b16:	c7 04 24 de 72 10 80 	movl   $0x801072de,(%esp)
80103b1d:	e8 4e c8 ff ff       	call   80100370 <panic>
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
    panic("sched locks");
80103b22:	c7 04 24 d2 72 10 80 	movl   $0x801072d2,(%esp)
80103b29:	e8 42 c8 ff ff       	call   80100370 <panic>
80103b2e:	66 90                	xchg   %ax,%ax

80103b30 <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void
exit(void)
{
80103b30:	55                   	push   %ebp
80103b31:	89 e5                	mov    %esp,%ebp
80103b33:	56                   	push   %esi
  struct proc *curproc = myproc();
  struct proc *p;
  int fd;

  if(curproc == initproc)
80103b34:	31 f6                	xor    %esi,%esi
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void
exit(void)
{
80103b36:	53                   	push   %ebx
80103b37:	83 ec 10             	sub    $0x10,%esp
  struct proc *curproc = myproc();
80103b3a:	e8 f1 fb ff ff       	call   80103730 <myproc>
  struct proc *p;
  int fd;

  if(curproc == initproc)
80103b3f:	3b 05 a0 a5 10 80    	cmp    0x8010a5a0,%eax
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void
exit(void)
{
  struct proc *curproc = myproc();
80103b45:	89 c3                	mov    %eax,%ebx
  struct proc *p;
  int fd;

  if(curproc == initproc)
80103b47:	0f 84 ea 00 00 00    	je     80103c37 <exit+0x107>
80103b4d:	8d 76 00             	lea    0x0(%esi),%esi
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd]){
80103b50:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
80103b54:	85 c0                	test   %eax,%eax
80103b56:	74 10                	je     80103b68 <exit+0x38>
      fileclose(curproc->ofile[fd]);
80103b58:	89 04 24             	mov    %eax,(%esp)
80103b5b:	e8 c0 d2 ff ff       	call   80100e20 <fileclose>
      curproc->ofile[fd] = 0;
80103b60:	c7 44 b3 28 00 00 00 	movl   $0x0,0x28(%ebx,%esi,4)
80103b67:	00 

  if(curproc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
80103b68:	83 c6 01             	add    $0x1,%esi
80103b6b:	83 fe 10             	cmp    $0x10,%esi
80103b6e:	75 e0                	jne    80103b50 <exit+0x20>
      fileclose(curproc->ofile[fd]);
      curproc->ofile[fd] = 0;
    }
  }

  begin_op();
80103b70:	e8 fb ef ff ff       	call   80102b70 <begin_op>
  iput(curproc->cwd);
80103b75:	8b 43 68             	mov    0x68(%ebx),%eax
80103b78:	89 04 24             	mov    %eax,(%esp)
80103b7b:	e8 50 dc ff ff       	call   801017d0 <iput>
  end_op();
80103b80:	e8 5b f0 ff ff       	call   80102be0 <end_op>
  curproc->cwd = 0;
80103b85:	c7 43 68 00 00 00 00 	movl   $0x0,0x68(%ebx)

  acquire(&ptable.lock);
80103b8c:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103b93:	e8 e8 06 00 00       	call   80104280 <acquire>

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);
80103b98:	8b 43 14             	mov    0x14(%ebx),%eax
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103b9b:	ba 54 2d 11 80       	mov    $0x80112d54,%edx
80103ba0:	eb 11                	jmp    80103bb3 <exit+0x83>
80103ba2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103ba8:	83 c2 7c             	add    $0x7c,%edx
80103bab:	81 fa 54 4c 11 80    	cmp    $0x80114c54,%edx
80103bb1:	73 1d                	jae    80103bd0 <exit+0xa0>
    if(p->state == SLEEPING && p->chan == chan)
80103bb3:	83 7a 0c 02          	cmpl   $0x2,0xc(%edx)
80103bb7:	75 ef                	jne    80103ba8 <exit+0x78>
80103bb9:	3b 42 20             	cmp    0x20(%edx),%eax
80103bbc:	75 ea                	jne    80103ba8 <exit+0x78>
      p->state = RUNNABLE;
80103bbe:	c7 42 0c 03 00 00 00 	movl   $0x3,0xc(%edx)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103bc5:	83 c2 7c             	add    $0x7c,%edx
80103bc8:	81 fa 54 4c 11 80    	cmp    $0x80114c54,%edx
80103bce:	72 e3                	jb     80103bb3 <exit+0x83>
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == curproc){
      p->parent = initproc;
80103bd0:	a1 a0 a5 10 80       	mov    0x8010a5a0,%eax
80103bd5:	b9 54 2d 11 80       	mov    $0x80112d54,%ecx
80103bda:	eb 0f                	jmp    80103beb <exit+0xbb>
80103bdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103be0:	83 c1 7c             	add    $0x7c,%ecx
80103be3:	81 f9 54 4c 11 80    	cmp    $0x80114c54,%ecx
80103be9:	73 34                	jae    80103c1f <exit+0xef>
    if(p->parent == curproc){
80103beb:	39 59 14             	cmp    %ebx,0x14(%ecx)
80103bee:	75 f0                	jne    80103be0 <exit+0xb0>
      p->parent = initproc;
      if(p->state == ZOMBIE)
80103bf0:	83 79 0c 05          	cmpl   $0x5,0xc(%ecx)
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == curproc){
      p->parent = initproc;
80103bf4:	89 41 14             	mov    %eax,0x14(%ecx)
      if(p->state == ZOMBIE)
80103bf7:	75 e7                	jne    80103be0 <exit+0xb0>
80103bf9:	ba 54 2d 11 80       	mov    $0x80112d54,%edx
80103bfe:	eb 0b                	jmp    80103c0b <exit+0xdb>
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103c00:	83 c2 7c             	add    $0x7c,%edx
80103c03:	81 fa 54 4c 11 80    	cmp    $0x80114c54,%edx
80103c09:	73 d5                	jae    80103be0 <exit+0xb0>
    if(p->state == SLEEPING && p->chan == chan)
80103c0b:	83 7a 0c 02          	cmpl   $0x2,0xc(%edx)
80103c0f:	75 ef                	jne    80103c00 <exit+0xd0>
80103c11:	3b 42 20             	cmp    0x20(%edx),%eax
80103c14:	75 ea                	jne    80103c00 <exit+0xd0>
      p->state = RUNNABLE;
80103c16:	c7 42 0c 03 00 00 00 	movl   $0x3,0xc(%edx)
80103c1d:	eb e1                	jmp    80103c00 <exit+0xd0>
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  curproc->state = ZOMBIE;
80103c1f:	c7 43 0c 05 00 00 00 	movl   $0x5,0xc(%ebx)
  sched();
80103c26:	e8 65 fe ff ff       	call   80103a90 <sched>
  panic("zombie exit");
80103c2b:	c7 04 24 0d 73 10 80 	movl   $0x8010730d,(%esp)
80103c32:	e8 39 c7 ff ff       	call   80100370 <panic>
  struct proc *curproc = myproc();
  struct proc *p;
  int fd;

  if(curproc == initproc)
    panic("init exiting");
80103c37:	c7 04 24 00 73 10 80 	movl   $0x80107300,(%esp)
80103c3e:	e8 2d c7 ff ff       	call   80100370 <panic>
80103c43:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103c49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103c50 <yield>:
}

// Give up the CPU for one scheduling round.
void
yield(void)
{
80103c50:	55                   	push   %ebp
80103c51:	89 e5                	mov    %esp,%ebp
80103c53:	83 ec 18             	sub    $0x18,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103c56:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103c5d:	e8 1e 06 00 00       	call   80104280 <acquire>
  myproc()->state = RUNNABLE;
80103c62:	e8 c9 fa ff ff       	call   80103730 <myproc>
80103c67:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  sched();
80103c6e:	e8 1d fe ff ff       	call   80103a90 <sched>
  release(&ptable.lock);
80103c73:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103c7a:	e8 71 06 00 00       	call   801042f0 <release>
}
80103c7f:	c9                   	leave  
80103c80:	c3                   	ret    
80103c81:	eb 0d                	jmp    80103c90 <sleep>
80103c83:	90                   	nop
80103c84:	90                   	nop
80103c85:	90                   	nop
80103c86:	90                   	nop
80103c87:	90                   	nop
80103c88:	90                   	nop
80103c89:	90                   	nop
80103c8a:	90                   	nop
80103c8b:	90                   	nop
80103c8c:	90                   	nop
80103c8d:	90                   	nop
80103c8e:	90                   	nop
80103c8f:	90                   	nop

80103c90 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80103c90:	55                   	push   %ebp
80103c91:	89 e5                	mov    %esp,%ebp
80103c93:	83 ec 28             	sub    $0x28,%esp
80103c96:	89 5d f4             	mov    %ebx,-0xc(%ebp)
80103c99:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80103c9c:	89 75 f8             	mov    %esi,-0x8(%ebp)
80103c9f:	8b 75 08             	mov    0x8(%ebp),%esi
80103ca2:	89 7d fc             	mov    %edi,-0x4(%ebp)
  struct proc *p = myproc();
80103ca5:	e8 86 fa ff ff       	call   80103730 <myproc>
  
  if(p == 0)
80103caa:	85 c0                	test   %eax,%eax
// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();
80103cac:	89 c7                	mov    %eax,%edi
  
  if(p == 0)
80103cae:	0f 84 8b 00 00 00    	je     80103d3f <sleep+0xaf>
    panic("sleep");

  if(lk == 0)
80103cb4:	85 db                	test   %ebx,%ebx
80103cb6:	74 7b                	je     80103d33 <sleep+0xa3>
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103cb8:	81 fb 20 2d 11 80    	cmp    $0x80112d20,%ebx
80103cbe:	74 50                	je     80103d10 <sleep+0x80>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103cc0:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103cc7:	e8 b4 05 00 00       	call   80104280 <acquire>
    release(lk);
80103ccc:	89 1c 24             	mov    %ebx,(%esp)
80103ccf:	e8 1c 06 00 00       	call   801042f0 <release>
  }
  // Go to sleep.
  p->chan = chan;
80103cd4:	89 77 20             	mov    %esi,0x20(%edi)
  p->state = SLEEPING;
80103cd7:	c7 47 0c 02 00 00 00 	movl   $0x2,0xc(%edi)

  sched();
80103cde:	e8 ad fd ff ff       	call   80103a90 <sched>

  // Tidy up.
  p->chan = 0;
80103ce3:	c7 47 20 00 00 00 00 	movl   $0x0,0x20(%edi)

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
80103cea:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103cf1:	e8 fa 05 00 00       	call   801042f0 <release>
    acquire(lk);
  }
}
80103cf6:	8b 75 f8             	mov    -0x8(%ebp),%esi
  p->chan = 0;

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
80103cf9:	89 5d 08             	mov    %ebx,0x8(%ebp)
  }
}
80103cfc:	8b 7d fc             	mov    -0x4(%ebp),%edi
80103cff:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80103d02:	89 ec                	mov    %ebp,%esp
80103d04:	5d                   	pop    %ebp
  p->chan = 0;

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
80103d05:	e9 76 05 00 00       	jmp    80104280 <acquire>
80103d0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if(lk != &ptable.lock){  //DOC: sleeplock0
    acquire(&ptable.lock);  //DOC: sleeplock1
    release(lk);
  }
  // Go to sleep.
  p->chan = chan;
80103d10:	89 70 20             	mov    %esi,0x20(%eax)
  p->state = SLEEPING;
80103d13:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)

  sched();
80103d1a:	e8 71 fd ff ff       	call   80103a90 <sched>

  // Tidy up.
  p->chan = 0;
80103d1f:	c7 47 20 00 00 00 00 	movl   $0x0,0x20(%edi)
  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}
80103d26:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80103d29:	8b 75 f8             	mov    -0x8(%ebp),%esi
80103d2c:	8b 7d fc             	mov    -0x4(%ebp),%edi
80103d2f:	89 ec                	mov    %ebp,%esp
80103d31:	5d                   	pop    %ebp
80103d32:	c3                   	ret    
  
  if(p == 0)
    panic("sleep");

  if(lk == 0)
    panic("sleep without lk");
80103d33:	c7 04 24 1f 73 10 80 	movl   $0x8010731f,(%esp)
80103d3a:	e8 31 c6 ff ff       	call   80100370 <panic>
sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();
  
  if(p == 0)
    panic("sleep");
80103d3f:	c7 04 24 19 73 10 80 	movl   $0x80107319,(%esp)
80103d46:	e8 25 c6 ff ff       	call   80100370 <panic>
80103d4b:	90                   	nop
80103d4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103d50 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(void)
{
80103d50:	55                   	push   %ebp
80103d51:	89 e5                	mov    %esp,%ebp
80103d53:	56                   	push   %esi
80103d54:	53                   	push   %ebx
80103d55:	83 ec 10             	sub    $0x10,%esp
  struct proc *p;
  int havekids, pid;
  struct proc *curproc = myproc();
80103d58:	e8 d3 f9 ff ff       	call   80103730 <myproc>
  
  acquire(&ptable.lock);
80103d5d:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
int
wait(void)
{
  struct proc *p;
  int havekids, pid;
  struct proc *curproc = myproc();
80103d64:	89 c6                	mov    %eax,%esi
  
  acquire(&ptable.lock);
80103d66:	e8 15 05 00 00       	call   80104280 <acquire>
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
80103d6b:	31 c0                	xor    %eax,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103d6d:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
80103d72:	eb 0f                	jmp    80103d83 <wait+0x33>
80103d74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103d78:	83 c3 7c             	add    $0x7c,%ebx
80103d7b:	81 fb 54 4c 11 80    	cmp    $0x80114c54,%ebx
80103d81:	73 1d                	jae    80103da0 <wait+0x50>
      if(p->parent != curproc)
80103d83:	39 73 14             	cmp    %esi,0x14(%ebx)
80103d86:	75 f0                	jne    80103d78 <wait+0x28>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
80103d88:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103d8c:	74 2f                	je     80103dbd <wait+0x6d>
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103d8e:	83 c3 7c             	add    $0x7c,%ebx
      if(p->parent != curproc)
        continue;
      havekids = 1;
80103d91:	b8 01 00 00 00       	mov    $0x1,%eax
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103d96:	81 fb 54 4c 11 80    	cmp    $0x80114c54,%ebx
80103d9c:	72 e5                	jb     80103d83 <wait+0x33>
80103d9e:	66 90                	xchg   %ax,%ax
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
80103da0:	85 c0                	test   %eax,%eax
80103da2:	74 6e                	je     80103e12 <wait+0xc2>
80103da4:	8b 5e 24             	mov    0x24(%esi),%ebx
80103da7:	85 db                	test   %ebx,%ebx
80103da9:	75 67                	jne    80103e12 <wait+0xc2>
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
80103dab:	c7 44 24 04 20 2d 11 	movl   $0x80112d20,0x4(%esp)
80103db2:	80 
80103db3:	89 34 24             	mov    %esi,(%esp)
80103db6:	e8 d5 fe ff ff       	call   80103c90 <sleep>
  }
80103dbb:	eb ae                	jmp    80103d6b <wait+0x1b>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
80103dbd:	8b 43 08             	mov    0x8(%ebx),%eax
      if(p->parent != curproc)
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
80103dc0:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
80103dc3:	89 04 24             	mov    %eax,(%esp)
80103dc6:	e8 75 e5 ff ff       	call   80102340 <kfree>
        p->kstack = 0;
        freevm(p->pgdir);
80103dcb:	8b 43 04             	mov    0x4(%ebx),%eax
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
80103dce:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
80103dd5:	89 04 24             	mov    %eax,(%esp)
80103dd8:	e8 63 2c 00 00       	call   80106a40 <freevm>
        p->pid = 0;
80103ddd:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
80103de4:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
80103deb:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
80103def:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
80103df6:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
80103dfd:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103e04:	e8 e7 04 00 00       	call   801042f0 <release>
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103e09:	83 c4 10             	add    $0x10,%esp
80103e0c:	89 f0                	mov    %esi,%eax
80103e0e:	5b                   	pop    %ebx
80103e0f:	5e                   	pop    %esi
80103e10:	5d                   	pop    %ebp
80103e11:	c3                   	ret    
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
80103e12:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
      return -1;
80103e19:	be ff ff ff ff       	mov    $0xffffffff,%esi
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
80103e1e:	e8 cd 04 00 00       	call   801042f0 <release>
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103e23:	83 c4 10             	add    $0x10,%esp
80103e26:	89 f0                	mov    %esi,%eax
80103e28:	5b                   	pop    %ebx
80103e29:	5e                   	pop    %esi
80103e2a:	5d                   	pop    %ebp
80103e2b:	c3                   	ret    
80103e2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103e30 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80103e30:	55                   	push   %ebp
80103e31:	89 e5                	mov    %esp,%ebp
80103e33:	53                   	push   %ebx
80103e34:	83 ec 14             	sub    $0x14,%esp
80103e37:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
80103e3a:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103e41:	e8 3a 04 00 00       	call   80104280 <acquire>
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103e46:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103e4b:	eb 0d                	jmp    80103e5a <wakeup+0x2a>
80103e4d:	8d 76 00             	lea    0x0(%esi),%esi
80103e50:	83 c0 7c             	add    $0x7c,%eax
80103e53:	3d 54 4c 11 80       	cmp    $0x80114c54,%eax
80103e58:	73 1e                	jae    80103e78 <wakeup+0x48>
    if(p->state == SLEEPING && p->chan == chan)
80103e5a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103e5e:	75 f0                	jne    80103e50 <wakeup+0x20>
80103e60:	3b 58 20             	cmp    0x20(%eax),%ebx
80103e63:	75 eb                	jne    80103e50 <wakeup+0x20>
      p->state = RUNNABLE;
80103e65:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103e6c:	83 c0 7c             	add    $0x7c,%eax
80103e6f:	3d 54 4c 11 80       	cmp    $0x80114c54,%eax
80103e74:	72 e4                	jb     80103e5a <wakeup+0x2a>
80103e76:	66 90                	xchg   %ax,%ax
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
80103e78:	c7 45 08 20 2d 11 80 	movl   $0x80112d20,0x8(%ebp)
}
80103e7f:	83 c4 14             	add    $0x14,%esp
80103e82:	5b                   	pop    %ebx
80103e83:	5d                   	pop    %ebp
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
80103e84:	e9 67 04 00 00       	jmp    801042f0 <release>
80103e89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103e90 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
80103e90:	55                   	push   %ebp
80103e91:	89 e5                	mov    %esp,%ebp
80103e93:	53                   	push   %ebx
80103e94:	83 ec 14             	sub    $0x14,%esp
80103e97:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
80103e9a:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103ea1:	e8 da 03 00 00       	call   80104280 <acquire>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103ea6:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
    if(p->pid == pid){
80103eab:	39 1d 64 2d 11 80    	cmp    %ebx,0x80112d64
80103eb1:	74 14                	je     80103ec7 <kill+0x37>
80103eb3:	90                   	nop
80103eb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
kill(int pid)
{
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103eb8:	83 c0 7c             	add    $0x7c,%eax
80103ebb:	3d 54 4c 11 80       	cmp    $0x80114c54,%eax
80103ec0:	73 36                	jae    80103ef8 <kill+0x68>
    if(p->pid == pid){
80103ec2:	39 58 10             	cmp    %ebx,0x10(%eax)
80103ec5:	75 f1                	jne    80103eb8 <kill+0x28>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80103ec7:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
80103ecb:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80103ed2:	74 14                	je     80103ee8 <kill+0x58>
        p->state = RUNNABLE;
      release(&ptable.lock);
80103ed4:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103edb:	e8 10 04 00 00       	call   801042f0 <release>
      return 0;
    }
  }
  release(&ptable.lock);
  return -1;
}
80103ee0:	83 c4 14             	add    $0x14,%esp
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
        p->state = RUNNABLE;
      release(&ptable.lock);
      return 0;
80103ee3:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
80103ee5:	5b                   	pop    %ebx
80103ee6:	5d                   	pop    %ebp
80103ee7:	c3                   	ret    
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
        p->state = RUNNABLE;
80103ee8:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103eef:	eb e3                	jmp    80103ed4 <kill+0x44>
80103ef1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
80103ef8:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103eff:	e8 ec 03 00 00       	call   801042f0 <release>
  return -1;
}
80103f04:	83 c4 14             	add    $0x14,%esp
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
  return -1;
80103f07:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80103f0c:	5b                   	pop    %ebx
80103f0d:	5d                   	pop    %ebp
80103f0e:	c3                   	ret    
80103f0f:	90                   	nop

80103f10 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80103f10:	55                   	push   %ebp
80103f11:	89 e5                	mov    %esp,%ebp
80103f13:	57                   	push   %edi
80103f14:	56                   	push   %esi
80103f15:	53                   	push   %ebx
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103f16:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80103f1b:	83 ec 4c             	sub    $0x4c,%esp
//PAGEBREAK: 36
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
80103f1e:	8d 7d e8             	lea    -0x18(%ebp),%edi
80103f21:	eb 20                	jmp    80103f43 <procdump+0x33>
80103f23:	90                   	nop
80103f24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
80103f28:	c7 04 24 97 76 10 80 	movl   $0x80107697,(%esp)
80103f2f:	e8 1c c7 ff ff       	call   80100650 <cprintf>
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103f34:	83 c3 7c             	add    $0x7c,%ebx
80103f37:	81 fb 54 4c 11 80    	cmp    $0x80114c54,%ebx
80103f3d:	0f 83 8d 00 00 00    	jae    80103fd0 <procdump+0xc0>
    if(p->state == UNUSED)
80103f43:	8b 43 0c             	mov    0xc(%ebx),%eax
80103f46:	85 c0                	test   %eax,%eax
80103f48:	74 ea                	je     80103f34 <procdump+0x24>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80103f4a:	83 f8 05             	cmp    $0x5,%eax
      state = states[p->state];
    else
      state = "???";
80103f4d:	ba 30 73 10 80       	mov    $0x80107330,%edx
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80103f52:	77 11                	ja     80103f65 <procdump+0x55>
80103f54:	8b 14 85 90 73 10 80 	mov    -0x7fef8c70(,%eax,4),%edx
      state = states[p->state];
    else
      state = "???";
80103f5b:	b8 30 73 10 80       	mov    $0x80107330,%eax
80103f60:	85 d2                	test   %edx,%edx
80103f62:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %s", p->pid, state, p->name);
80103f65:	8d 43 6c             	lea    0x6c(%ebx),%eax
80103f68:	89 44 24 0c          	mov    %eax,0xc(%esp)
80103f6c:	8b 43 10             	mov    0x10(%ebx),%eax
80103f6f:	89 54 24 08          	mov    %edx,0x8(%esp)
80103f73:	c7 04 24 34 73 10 80 	movl   $0x80107334,(%esp)
80103f7a:	89 44 24 04          	mov    %eax,0x4(%esp)
80103f7e:	e8 cd c6 ff ff       	call   80100650 <cprintf>
    if(p->state == SLEEPING){
80103f83:	83 7b 0c 02          	cmpl   $0x2,0xc(%ebx)
80103f87:	75 9f                	jne    80103f28 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
80103f89:	8d 45 c0             	lea    -0x40(%ebp),%eax
80103f8c:	89 44 24 04          	mov    %eax,0x4(%esp)
80103f90:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103f93:	8d 75 c0             	lea    -0x40(%ebp),%esi
80103f96:	8b 40 0c             	mov    0xc(%eax),%eax
80103f99:	83 c0 08             	add    $0x8,%eax
80103f9c:	89 04 24             	mov    %eax,(%esp)
80103f9f:	e8 8c 01 00 00       	call   80104130 <getcallerpcs>
80103fa4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      for(i=0; i<10 && pc[i] != 0; i++)
80103fa8:	8b 06                	mov    (%esi),%eax
80103faa:	85 c0                	test   %eax,%eax
80103fac:	0f 84 76 ff ff ff    	je     80103f28 <procdump+0x18>
        cprintf(" %p", pc[i]);
80103fb2:	83 c6 04             	add    $0x4,%esi
80103fb5:	89 44 24 04          	mov    %eax,0x4(%esp)
80103fb9:	c7 04 24 81 6d 10 80 	movl   $0x80106d81,(%esp)
80103fc0:	e8 8b c6 ff ff       	call   80100650 <cprintf>
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
80103fc5:	39 fe                	cmp    %edi,%esi
80103fc7:	75 df                	jne    80103fa8 <procdump+0x98>
80103fc9:	e9 5a ff ff ff       	jmp    80103f28 <procdump+0x18>
80103fce:	66 90                	xchg   %ax,%ax
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}
80103fd0:	83 c4 4c             	add    $0x4c,%esp
80103fd3:	5b                   	pop    %ebx
80103fd4:	5e                   	pop    %esi
80103fd5:	5f                   	pop    %edi
80103fd6:	5d                   	pop    %ebp
80103fd7:	c3                   	ret    
	...

80103fe0 <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
80103fe0:	55                   	push   %ebp
80103fe1:	89 e5                	mov    %esp,%ebp
80103fe3:	53                   	push   %ebx
80103fe4:	83 ec 14             	sub    $0x14,%esp
80103fe7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
80103fea:	c7 44 24 04 a8 73 10 	movl   $0x801073a8,0x4(%esp)
80103ff1:	80 
80103ff2:	8d 43 04             	lea    0x4(%ebx),%eax
80103ff5:	89 04 24             	mov    %eax,(%esp)
80103ff8:	e8 13 01 00 00       	call   80104110 <initlock>
  lk->name = name;
80103ffd:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
80104000:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
80104006:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)

void
initsleeplock(struct sleeplock *lk, char *name)
{
  initlock(&lk->lk, "sleep lock");
  lk->name = name;
8010400d:	89 43 38             	mov    %eax,0x38(%ebx)
  lk->locked = 0;
  lk->pid = 0;
}
80104010:	83 c4 14             	add    $0x14,%esp
80104013:	5b                   	pop    %ebx
80104014:	5d                   	pop    %ebp
80104015:	c3                   	ret    
80104016:	8d 76 00             	lea    0x0(%esi),%esi
80104019:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104020 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
80104020:	55                   	push   %ebp
80104021:	89 e5                	mov    %esp,%ebp
80104023:	56                   	push   %esi
80104024:	53                   	push   %ebx
80104025:	83 ec 10             	sub    $0x10,%esp
80104028:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
8010402b:	8d 73 04             	lea    0x4(%ebx),%esi
8010402e:	89 34 24             	mov    %esi,(%esp)
80104031:	e8 4a 02 00 00       	call   80104280 <acquire>
  while (lk->locked) {
80104036:	8b 13                	mov    (%ebx),%edx
80104038:	85 d2                	test   %edx,%edx
8010403a:	74 16                	je     80104052 <acquiresleep+0x32>
8010403c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    sleep(lk, &lk->lk);
80104040:	89 74 24 04          	mov    %esi,0x4(%esp)
80104044:	89 1c 24             	mov    %ebx,(%esp)
80104047:	e8 44 fc ff ff       	call   80103c90 <sleep>

void
acquiresleep(struct sleeplock *lk)
{
  acquire(&lk->lk);
  while (lk->locked) {
8010404c:	8b 03                	mov    (%ebx),%eax
8010404e:	85 c0                	test   %eax,%eax
80104050:	75 ee                	jne    80104040 <acquiresleep+0x20>
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
80104052:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = myproc()->pid;
80104058:	e8 d3 f6 ff ff       	call   80103730 <myproc>
8010405d:	8b 40 10             	mov    0x10(%eax),%eax
80104060:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
80104063:	89 75 08             	mov    %esi,0x8(%ebp)
}
80104066:	83 c4 10             	add    $0x10,%esp
80104069:	5b                   	pop    %ebx
8010406a:	5e                   	pop    %esi
8010406b:	5d                   	pop    %ebp
  while (lk->locked) {
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
  lk->pid = myproc()->pid;
  release(&lk->lk);
8010406c:	e9 7f 02 00 00       	jmp    801042f0 <release>
80104071:	eb 0d                	jmp    80104080 <releasesleep>
80104073:	90                   	nop
80104074:	90                   	nop
80104075:	90                   	nop
80104076:	90                   	nop
80104077:	90                   	nop
80104078:	90                   	nop
80104079:	90                   	nop
8010407a:	90                   	nop
8010407b:	90                   	nop
8010407c:	90                   	nop
8010407d:	90                   	nop
8010407e:	90                   	nop
8010407f:	90                   	nop

80104080 <releasesleep>:
}

void
releasesleep(struct sleeplock *lk)
{
80104080:	55                   	push   %ebp
80104081:	89 e5                	mov    %esp,%ebp
80104083:	83 ec 18             	sub    $0x18,%esp
80104086:	89 5d f8             	mov    %ebx,-0x8(%ebp)
80104089:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010408c:	89 75 fc             	mov    %esi,-0x4(%ebp)
  acquire(&lk->lk);
8010408f:	8d 73 04             	lea    0x4(%ebx),%esi
80104092:	89 34 24             	mov    %esi,(%esp)
80104095:	e8 e6 01 00 00       	call   80104280 <acquire>
  lk->locked = 0;
8010409a:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
801040a0:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
801040a7:	89 1c 24             	mov    %ebx,(%esp)
801040aa:	e8 81 fd ff ff       	call   80103e30 <wakeup>
  release(&lk->lk);
}
801040af:	8b 5d f8             	mov    -0x8(%ebp),%ebx
{
  acquire(&lk->lk);
  lk->locked = 0;
  lk->pid = 0;
  wakeup(lk);
  release(&lk->lk);
801040b2:	89 75 08             	mov    %esi,0x8(%ebp)
}
801040b5:	8b 75 fc             	mov    -0x4(%ebp),%esi
801040b8:	89 ec                	mov    %ebp,%esp
801040ba:	5d                   	pop    %ebp
{
  acquire(&lk->lk);
  lk->locked = 0;
  lk->pid = 0;
  wakeup(lk);
  release(&lk->lk);
801040bb:	e9 30 02 00 00       	jmp    801042f0 <release>

801040c0 <holdingsleep>:
}

int
holdingsleep(struct sleeplock *lk)
{
801040c0:	55                   	push   %ebp
801040c1:	89 e5                	mov    %esp,%ebp
801040c3:	83 ec 28             	sub    $0x28,%esp
801040c6:	89 75 f8             	mov    %esi,-0x8(%ebp)
801040c9:	8b 75 08             	mov    0x8(%ebp),%esi
801040cc:	89 5d f4             	mov    %ebx,-0xc(%ebp)
801040cf:	89 7d fc             	mov    %edi,-0x4(%ebp)
  int r;
  
  acquire(&lk->lk);
  r = lk->locked && (lk->pid == myproc()->pid);
801040d2:	31 ff                	xor    %edi,%edi
int
holdingsleep(struct sleeplock *lk)
{
  int r;
  
  acquire(&lk->lk);
801040d4:	8d 5e 04             	lea    0x4(%esi),%ebx
801040d7:	89 1c 24             	mov    %ebx,(%esp)
801040da:	e8 a1 01 00 00       	call   80104280 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
801040df:	8b 0e                	mov    (%esi),%ecx
801040e1:	85 c9                	test   %ecx,%ecx
801040e3:	74 13                	je     801040f8 <holdingsleep+0x38>
801040e5:	8b 76 3c             	mov    0x3c(%esi),%esi
801040e8:	e8 43 f6 ff ff       	call   80103730 <myproc>
801040ed:	3b 70 10             	cmp    0x10(%eax),%esi
801040f0:	0f 94 c0             	sete   %al
801040f3:	0f b6 c0             	movzbl %al,%eax
801040f6:	89 c7                	mov    %eax,%edi
  release(&lk->lk);
801040f8:	89 1c 24             	mov    %ebx,(%esp)
801040fb:	e8 f0 01 00 00       	call   801042f0 <release>
  return r;
}
80104100:	89 f8                	mov    %edi,%eax
80104102:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80104105:	8b 75 f8             	mov    -0x8(%ebp),%esi
80104108:	8b 7d fc             	mov    -0x4(%ebp),%edi
8010410b:	89 ec                	mov    %ebp,%esp
8010410d:	5d                   	pop    %ebp
8010410e:	c3                   	ret    
	...

80104110 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
80104110:	55                   	push   %ebp
80104111:	89 e5                	mov    %esp,%ebp
80104113:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
80104116:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
80104119:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
  lk->name = name;
8010411f:	89 50 04             	mov    %edx,0x4(%eax)
  lk->locked = 0;
  lk->cpu = 0;
80104122:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
80104129:	5d                   	pop    %ebp
8010412a:	c3                   	ret    
8010412b:	90                   	nop
8010412c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104130 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104130:	55                   	push   %ebp
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104131:	31 c0                	xor    %eax,%eax
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104133:	89 e5                	mov    %esp,%ebp
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
80104135:	8b 55 08             	mov    0x8(%ebp),%edx
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104138:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010413b:	53                   	push   %ebx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
8010413c:	83 ea 08             	sub    $0x8,%edx
8010413f:	90                   	nop
  for(i = 0; i < 10; i++){
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104140:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80104146:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010414c:	77 1a                	ja     80104168 <getcallerpcs+0x38>
      break;
    pcs[i] = ebp[1];     // saved %eip
8010414e:	8b 5a 04             	mov    0x4(%edx),%ebx
80104151:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104154:	83 c0 01             	add    $0x1,%eax
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
80104157:	8b 12                	mov    (%edx),%edx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104159:	83 f8 0a             	cmp    $0xa,%eax
8010415c:	75 e2                	jne    80104140 <getcallerpcs+0x10>
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
8010415e:	5b                   	pop    %ebx
8010415f:	5d                   	pop    %ebp
80104160:	c3                   	ret    
80104161:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
80104168:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
8010416f:	83 c0 01             	add    $0x1,%eax
80104172:	83 f8 0a             	cmp    $0xa,%eax
80104175:	74 e7                	je     8010415e <getcallerpcs+0x2e>
    pcs[i] = 0;
80104177:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
8010417e:	83 c0 01             	add    $0x1,%eax
80104181:	83 f8 0a             	cmp    $0xa,%eax
80104184:	75 e2                	jne    80104168 <getcallerpcs+0x38>
80104186:	eb d6                	jmp    8010415e <getcallerpcs+0x2e>
80104188:	90                   	nop
80104189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104190 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
80104190:	55                   	push   %ebp
80104191:	89 e5                	mov    %esp,%ebp
80104193:	53                   	push   %ebx
80104194:	83 ec 04             	sub    $0x4,%esp
80104197:	9c                   	pushf  
80104198:	5b                   	pop    %ebx
}

static inline void
cli(void)
{
  asm volatile("cli");
80104199:	fa                   	cli    
  int eflags;

  eflags = readeflags();
  cli();
  if(mycpu()->ncli == 0)
8010419a:	e8 f1 f4 ff ff       	call   80103690 <mycpu>
8010419f:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
801041a5:	85 c0                	test   %eax,%eax
801041a7:	75 11                	jne    801041ba <pushcli+0x2a>
    mycpu()->intena = eflags & FL_IF;
801041a9:	e8 e2 f4 ff ff       	call   80103690 <mycpu>
801041ae:	81 e3 00 02 00 00    	and    $0x200,%ebx
801041b4:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
  mycpu()->ncli += 1;
801041ba:	e8 d1 f4 ff ff       	call   80103690 <mycpu>
801041bf:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
}
801041c6:	83 c4 04             	add    $0x4,%esp
801041c9:	5b                   	pop    %ebx
801041ca:	5d                   	pop    %ebp
801041cb:	c3                   	ret    
801041cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801041d0 <popcli>:

void
popcli(void)
{
801041d0:	55                   	push   %ebp
801041d1:	89 e5                	mov    %esp,%ebp
801041d3:	83 ec 18             	sub    $0x18,%esp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801041d6:	9c                   	pushf  
801041d7:	58                   	pop    %eax
  if(readeflags()&FL_IF)
801041d8:	f6 c4 02             	test   $0x2,%ah
801041db:	75 49                	jne    80104226 <popcli+0x56>
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
801041dd:	e8 ae f4 ff ff       	call   80103690 <mycpu>
801041e2:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
801041e8:	83 ea 01             	sub    $0x1,%edx
801041eb:	85 d2                	test   %edx,%edx
801041ed:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
801041f3:	78 25                	js     8010421a <popcli+0x4a>
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
801041f5:	e8 96 f4 ff ff       	call   80103690 <mycpu>
801041fa:	8b 88 a4 00 00 00    	mov    0xa4(%eax),%ecx
80104200:	85 c9                	test   %ecx,%ecx
80104202:	74 04                	je     80104208 <popcli+0x38>
    sti();
}
80104204:	c9                   	leave  
80104205:	c3                   	ret    
80104206:	66 90                	xchg   %ax,%ax
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
80104208:	e8 83 f4 ff ff       	call   80103690 <mycpu>
8010420d:	8b 90 a8 00 00 00    	mov    0xa8(%eax),%edx
80104213:	85 d2                	test   %edx,%edx
80104215:	74 ed                	je     80104204 <popcli+0x34>
}

static inline void
sti(void)
{
  asm volatile("sti");
80104217:	fb                   	sti    
    sti();
}
80104218:	c9                   	leave  
80104219:	c3                   	ret    
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
    panic("popcli");
8010421a:	c7 04 24 ca 73 10 80 	movl   $0x801073ca,(%esp)
80104221:	e8 4a c1 ff ff       	call   80100370 <panic>

void
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
80104226:	c7 04 24 b3 73 10 80 	movl   $0x801073b3,(%esp)
8010422d:	e8 3e c1 ff ff       	call   80100370 <panic>
80104232:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104240 <holding>:
}

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
80104240:	55                   	push   %ebp
80104241:	89 e5                	mov    %esp,%ebp
80104243:	83 ec 08             	sub    $0x8,%esp
80104246:	89 75 fc             	mov    %esi,-0x4(%ebp)
80104249:	8b 75 08             	mov    0x8(%ebp),%esi
8010424c:	89 5d f8             	mov    %ebx,-0x8(%ebp)
  int r;
  pushcli();
  r = lock->locked && lock->cpu == mycpu();
8010424f:	31 db                	xor    %ebx,%ebx
// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  int r;
  pushcli();
80104251:	e8 3a ff ff ff       	call   80104190 <pushcli>
  r = lock->locked && lock->cpu == mycpu();
80104256:	8b 06                	mov    (%esi),%eax
80104258:	85 c0                	test   %eax,%eax
8010425a:	74 10                	je     8010426c <holding+0x2c>
8010425c:	8b 5e 08             	mov    0x8(%esi),%ebx
8010425f:	e8 2c f4 ff ff       	call   80103690 <mycpu>
80104264:	39 c3                	cmp    %eax,%ebx
80104266:	0f 94 c3             	sete   %bl
80104269:	0f b6 db             	movzbl %bl,%ebx
  popcli();
8010426c:	e8 5f ff ff ff       	call   801041d0 <popcli>
  return r;
}
80104271:	89 d8                	mov    %ebx,%eax
80104273:	8b 75 fc             	mov    -0x4(%ebp),%esi
80104276:	8b 5d f8             	mov    -0x8(%ebp),%ebx
80104279:	89 ec                	mov    %ebp,%esp
8010427b:	5d                   	pop    %ebp
8010427c:	c3                   	ret    
8010427d:	8d 76 00             	lea    0x0(%esi),%esi

80104280 <acquire>:
// Loops (spins) until the lock is acquired.
// Holding a lock for a long time may cause
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
80104280:	55                   	push   %ebp
80104281:	89 e5                	mov    %esp,%ebp
80104283:	53                   	push   %ebx
80104284:	83 ec 14             	sub    $0x14,%esp
  pushcli(); // disable interrupts to avoid deadlock.
80104287:	e8 04 ff ff ff       	call   80104190 <pushcli>
  if(holding(lk))
8010428c:	8b 45 08             	mov    0x8(%ebp),%eax
8010428f:	89 04 24             	mov    %eax,(%esp)
80104292:	e8 a9 ff ff ff       	call   80104240 <holding>
80104297:	85 c0                	test   %eax,%eax
80104299:	75 3c                	jne    801042d7 <acquire+0x57>
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
8010429b:	b9 01 00 00 00       	mov    $0x1,%ecx
    panic("acquire");

  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
801042a0:	8b 55 08             	mov    0x8(%ebp),%edx
801042a3:	89 c8                	mov    %ecx,%eax
801042a5:	f0 87 02             	lock xchg %eax,(%edx)
801042a8:	85 c0                	test   %eax,%eax
801042aa:	75 f4                	jne    801042a0 <acquire+0x20>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
801042ac:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Record info about lock acquisition for debugging.
  lk->cpu = mycpu();
801042b1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801042b4:	e8 d7 f3 ff ff       	call   80103690 <mycpu>
801042b9:	89 43 08             	mov    %eax,0x8(%ebx)
  getcallerpcs(&lk, lk->pcs);
801042bc:	8b 45 08             	mov    0x8(%ebp),%eax
801042bf:	83 c0 0c             	add    $0xc,%eax
801042c2:	89 44 24 04          	mov    %eax,0x4(%esp)
801042c6:	8d 45 08             	lea    0x8(%ebp),%eax
801042c9:	89 04 24             	mov    %eax,(%esp)
801042cc:	e8 5f fe ff ff       	call   80104130 <getcallerpcs>
}
801042d1:	83 c4 14             	add    $0x14,%esp
801042d4:	5b                   	pop    %ebx
801042d5:	5d                   	pop    %ebp
801042d6:	c3                   	ret    
void
acquire(struct spinlock *lk)
{
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
    panic("acquire");
801042d7:	c7 04 24 d1 73 10 80 	movl   $0x801073d1,(%esp)
801042de:	e8 8d c0 ff ff       	call   80100370 <panic>
801042e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801042e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801042f0 <release>:
}

// Release the lock.
void
release(struct spinlock *lk)
{
801042f0:	55                   	push   %ebp
801042f1:	89 e5                	mov    %esp,%ebp
801042f3:	53                   	push   %ebx
801042f4:	83 ec 14             	sub    $0x14,%esp
801042f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holding(lk))
801042fa:	89 1c 24             	mov    %ebx,(%esp)
801042fd:	e8 3e ff ff ff       	call   80104240 <holding>
80104302:	85 c0                	test   %eax,%eax
80104304:	74 23                	je     80104329 <release+0x39>
    panic("release");

  lk->pcs[0] = 0;
80104306:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
  lk->cpu = 0;
8010430d:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that all the stores in the critical
  // section are visible to other cores before the lock is released.
  // Both the C compiler and the hardware may re-order loads and
  // stores; __sync_synchronize() tells them both not to.
  __sync_synchronize();
80104314:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
80104319:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)

  popcli();
}
8010431f:	83 c4 14             	add    $0x14,%esp
80104322:	5b                   	pop    %ebx
80104323:	5d                   	pop    %ebp
  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );

  popcli();
80104324:	e9 a7 fe ff ff       	jmp    801041d0 <popcli>
// Release the lock.
void
release(struct spinlock *lk)
{
  if(!holding(lk))
    panic("release");
80104329:	c7 04 24 d9 73 10 80 	movl   $0x801073d9,(%esp)
80104330:	e8 3b c0 ff ff       	call   80100370 <panic>
	...

80104340 <memset>:
#include "types.h"
#include "x86.h"

void*
memset(void *dst, int c, uint n)
{
80104340:	55                   	push   %ebp
80104341:	89 e5                	mov    %esp,%ebp
80104343:	83 ec 08             	sub    $0x8,%esp
80104346:	8b 55 08             	mov    0x8(%ebp),%edx
80104349:	89 5d f8             	mov    %ebx,-0x8(%ebp)
8010434c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010434f:	89 7d fc             	mov    %edi,-0x4(%ebp)
80104352:	8b 4d 10             	mov    0x10(%ebp),%ecx
  if ((int)dst%4 == 0 && n%4 == 0){
80104355:	f6 c2 03             	test   $0x3,%dl
80104358:	75 05                	jne    8010435f <memset+0x1f>
8010435a:	f6 c1 03             	test   $0x3,%cl
8010435d:	74 11                	je     80104370 <memset+0x30>
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
8010435f:	89 d7                	mov    %edx,%edi
80104361:	fc                   	cld    
80104362:	f3 aa                	rep stos %al,%es:(%edi)
    c &= 0xFF;
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
  } else
    stosb(dst, c, n);
  return dst;
}
80104364:	8b 5d f8             	mov    -0x8(%ebp),%ebx
80104367:	89 d0                	mov    %edx,%eax
80104369:	8b 7d fc             	mov    -0x4(%ebp),%edi
8010436c:	89 ec                	mov    %ebp,%esp
8010436e:	5d                   	pop    %ebp
8010436f:	c3                   	ret    

void*
memset(void *dst, int c, uint n)
{
  if ((int)dst%4 == 0 && n%4 == 0){
    c &= 0xFF;
80104370:	0f b6 f8             	movzbl %al,%edi
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
80104373:	89 f8                	mov    %edi,%eax
80104375:	89 fb                	mov    %edi,%ebx
80104377:	c1 e0 18             	shl    $0x18,%eax
8010437a:	c1 e3 10             	shl    $0x10,%ebx
8010437d:	09 d8                	or     %ebx,%eax
8010437f:	09 f8                	or     %edi,%eax
80104381:	c1 e7 08             	shl    $0x8,%edi
80104384:	09 f8                	or     %edi,%eax
}

static inline void
stosl(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosl" :
80104386:	89 d7                	mov    %edx,%edi
80104388:	c1 e9 02             	shr    $0x2,%ecx
8010438b:	fc                   	cld    
8010438c:	f3 ab                	rep stos %eax,%es:(%edi)
  } else
    stosb(dst, c, n);
  return dst;
}
8010438e:	8b 5d f8             	mov    -0x8(%ebp),%ebx
80104391:	89 d0                	mov    %edx,%eax
80104393:	8b 7d fc             	mov    -0x4(%ebp),%edi
80104396:	89 ec                	mov    %ebp,%esp
80104398:	5d                   	pop    %ebp
80104399:	c3                   	ret    
8010439a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801043a0 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
801043a0:	55                   	push   %ebp
    if(*s1 != *s2)
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
801043a1:	31 c0                	xor    %eax,%eax
  return dst;
}

int
memcmp(const void *v1, const void *v2, uint n)
{
801043a3:	89 e5                	mov    %esp,%ebp
801043a5:	57                   	push   %edi
801043a6:	8b 7d 10             	mov    0x10(%ebp),%edi
801043a9:	56                   	push   %esi
801043aa:	8b 75 0c             	mov    0xc(%ebp),%esi
801043ad:	53                   	push   %ebx
801043ae:	8b 5d 08             	mov    0x8(%ebp),%ebx
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
801043b1:	85 ff                	test   %edi,%edi
801043b3:	74 29                	je     801043de <memcmp+0x3e>
    if(*s1 != *s2)
801043b5:	0f b6 03             	movzbl (%ebx),%eax
{
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
801043b8:	83 ef 01             	sub    $0x1,%edi
801043bb:	31 d2                	xor    %edx,%edx
    if(*s1 != *s2)
801043bd:	0f b6 0e             	movzbl (%esi),%ecx
801043c0:	38 c8                	cmp    %cl,%al
801043c2:	74 14                	je     801043d8 <memcmp+0x38>
801043c4:	eb 22                	jmp    801043e8 <memcmp+0x48>
801043c6:	66 90                	xchg   %ax,%ax
801043c8:	0f b6 44 13 01       	movzbl 0x1(%ebx,%edx,1),%eax
801043cd:	83 c2 01             	add    $0x1,%edx
801043d0:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
801043d4:	38 c8                	cmp    %cl,%al
801043d6:	75 10                	jne    801043e8 <memcmp+0x48>
{
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
801043d8:	39 d7                	cmp    %edx,%edi
801043da:	75 ec                	jne    801043c8 <memcmp+0x28>
    if(*s1 != *s2)
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
801043dc:	31 c0                	xor    %eax,%eax
}
801043de:	5b                   	pop    %ebx
801043df:	5e                   	pop    %esi
801043e0:	5f                   	pop    %edi
801043e1:	5d                   	pop    %ebp
801043e2:	c3                   	ret    
801043e3:	90                   	nop
801043e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
    if(*s1 != *s2)
      return *s1 - *s2;
801043e8:	0f b6 c0             	movzbl %al,%eax
801043eb:	0f b6 c9             	movzbl %cl,%ecx
    s1++, s2++;
  }

  return 0;
}
801043ee:	5b                   	pop    %ebx

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
    if(*s1 != *s2)
      return *s1 - *s2;
801043ef:	29 c8                	sub    %ecx,%eax
    s1++, s2++;
  }

  return 0;
}
801043f1:	5e                   	pop    %esi
801043f2:	5f                   	pop    %edi
801043f3:	5d                   	pop    %ebp
801043f4:	c3                   	ret    
801043f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801043f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104400 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
80104400:	55                   	push   %ebp
80104401:	89 e5                	mov    %esp,%ebp
80104403:	57                   	push   %edi
80104404:	8b 45 08             	mov    0x8(%ebp),%eax
80104407:	56                   	push   %esi
80104408:	8b 75 0c             	mov    0xc(%ebp),%esi
8010440b:	53                   	push   %ebx
8010440c:	8b 5d 10             	mov    0x10(%ebp),%ebx
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
8010440f:	39 c6                	cmp    %eax,%esi
80104411:	73 35                	jae    80104448 <memmove+0x48>
80104413:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
80104416:	39 c8                	cmp    %ecx,%eax
80104418:	73 2e                	jae    80104448 <memmove+0x48>
    s += n;
    d += n;
    while(n-- > 0)
8010441a:	85 db                	test   %ebx,%ebx
8010441c:	74 20                	je     8010443e <memmove+0x3e>

  s = src;
  d = dst;
  if(s < d && s + n > d){
    s += n;
    d += n;
8010441e:	8d 3c 18             	lea    (%eax,%ebx,1),%edi
80104421:	89 da                	mov    %ebx,%edx

  return 0;
}

void*
memmove(void *dst, const void *src, uint n)
80104423:	f7 db                	neg    %ebx
80104425:	8d 34 19             	lea    (%ecx,%ebx,1),%esi
80104428:	01 fb                	add    %edi,%ebx
8010442a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  d = dst;
  if(s < d && s + n > d){
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
80104430:	0f b6 4c 16 ff       	movzbl -0x1(%esi,%edx,1),%ecx
80104435:	88 4c 13 ff          	mov    %cl,-0x1(%ebx,%edx,1)
  s = src;
  d = dst;
  if(s < d && s + n > d){
    s += n;
    d += n;
    while(n-- > 0)
80104439:	83 ea 01             	sub    $0x1,%edx
8010443c:	75 f2                	jne    80104430 <memmove+0x30>
  } else
    while(n-- > 0)
      *d++ = *s++;

  return dst;
}
8010443e:	5b                   	pop    %ebx
8010443f:	5e                   	pop    %esi
80104440:	5f                   	pop    %edi
80104441:	5d                   	pop    %ebp
80104442:	c3                   	ret    
80104443:	90                   	nop
80104444:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
80104448:	31 d2                	xor    %edx,%edx
8010444a:	85 db                	test   %ebx,%ebx
8010444c:	74 f0                	je     8010443e <memmove+0x3e>
8010444e:	66 90                	xchg   %ax,%ax
      *d++ = *s++;
80104450:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
80104454:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104457:	83 c2 01             	add    $0x1,%edx
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
8010445a:	39 d3                	cmp    %edx,%ebx
8010445c:	75 f2                	jne    80104450 <memmove+0x50>
      *d++ = *s++;

  return dst;
}
8010445e:	5b                   	pop    %ebx
8010445f:	5e                   	pop    %esi
80104460:	5f                   	pop    %edi
80104461:	5d                   	pop    %ebp
80104462:	c3                   	ret    
80104463:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104470 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
80104470:	55                   	push   %ebp
80104471:	89 e5                	mov    %esp,%ebp
  return memmove(dst, src, n);
}
80104473:	5d                   	pop    %ebp

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
  return memmove(dst, src, n);
80104474:	e9 87 ff ff ff       	jmp    80104400 <memmove>
80104479:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104480 <strncmp>:
}

int
strncmp(const char *p, const char *q, uint n)
{
80104480:	55                   	push   %ebp
  while(n > 0 && *p && *p == *q)
    n--, p++, q++;
  if(n == 0)
    return 0;
80104481:	31 c0                	xor    %eax,%eax
  return memmove(dst, src, n);
}

int
strncmp(const char *p, const char *q, uint n)
{
80104483:	89 e5                	mov    %esp,%ebp
  while(n > 0 && *p && *p == *q)
80104485:	8b 55 10             	mov    0x10(%ebp),%edx
  return memmove(dst, src, n);
}

int
strncmp(const char *p, const char *q, uint n)
{
80104488:	57                   	push   %edi
80104489:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010448c:	56                   	push   %esi
8010448d:	53                   	push   %ebx
8010448e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while(n > 0 && *p && *p == *q)
80104491:	85 d2                	test   %edx,%edx
80104493:	74 34                	je     801044c9 <strncmp+0x49>
80104495:	0f b6 01             	movzbl (%ecx),%eax
80104498:	0f b6 33             	movzbl (%ebx),%esi
8010449b:	84 c0                	test   %al,%al
8010449d:	74 31                	je     801044d0 <strncmp+0x50>
8010449f:	89 f2                	mov    %esi,%edx
801044a1:	38 d0                	cmp    %dl,%al
801044a3:	74 1c                	je     801044c1 <strncmp+0x41>
801044a5:	eb 29                	jmp    801044d0 <strncmp+0x50>
801044a7:	90                   	nop
    n--, p++, q++;
801044a8:	83 c1 01             	add    $0x1,%ecx
}

int
strncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
801044ab:	0f b6 73 01          	movzbl 0x1(%ebx),%esi
801044af:	0f b6 01             	movzbl (%ecx),%eax
    n--, p++, q++;
801044b2:	8d 7b 01             	lea    0x1(%ebx),%edi
}

int
strncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
801044b5:	84 c0                	test   %al,%al
801044b7:	74 17                	je     801044d0 <strncmp+0x50>
801044b9:	89 f2                	mov    %esi,%edx
801044bb:	38 d0                	cmp    %dl,%al
801044bd:	75 11                	jne    801044d0 <strncmp+0x50>
    n--, p++, q++;
801044bf:	89 fb                	mov    %edi,%ebx
}

int
strncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
801044c1:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
801044c5:	75 e1                	jne    801044a8 <strncmp+0x28>
    n--, p++, q++;
  if(n == 0)
    return 0;
801044c7:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}
801044c9:	5b                   	pop    %ebx
801044ca:	5e                   	pop    %esi
801044cb:	5f                   	pop    %edi
801044cc:	5d                   	pop    %ebp
801044cd:	c3                   	ret    
801044ce:	66 90                	xchg   %ax,%ax
{
  while(n > 0 && *p && *p == *q)
    n--, p++, q++;
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
801044d0:	81 e6 ff 00 00 00    	and    $0xff,%esi
801044d6:	0f b6 c0             	movzbl %al,%eax
}
801044d9:	5b                   	pop    %ebx
{
  while(n > 0 && *p && *p == *q)
    n--, p++, q++;
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
801044da:	29 f0                	sub    %esi,%eax
}
801044dc:	5e                   	pop    %esi
801044dd:	5f                   	pop    %edi
801044de:	5d                   	pop    %ebp
801044df:	c3                   	ret    

801044e0 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
801044e0:	55                   	push   %ebp
801044e1:	89 e5                	mov    %esp,%ebp
801044e3:	57                   	push   %edi
801044e4:	8b 7d 08             	mov    0x8(%ebp),%edi
801044e7:	56                   	push   %esi
801044e8:	8b 4d 10             	mov    0x10(%ebp),%ecx
801044eb:	53                   	push   %ebx
801044ec:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
801044ef:	89 fa                	mov    %edi,%edx
801044f1:	eb 14                	jmp    80104507 <strncpy+0x27>
801044f3:	90                   	nop
801044f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801044f8:	0f b6 03             	movzbl (%ebx),%eax
801044fb:	83 c3 01             	add    $0x1,%ebx
801044fe:	88 02                	mov    %al,(%edx)
80104500:	83 c2 01             	add    $0x1,%edx
80104503:	84 c0                	test   %al,%al
80104505:	74 0a                	je     80104511 <strncpy+0x31>
80104507:	83 e9 01             	sub    $0x1,%ecx
    return 0;
  return (uchar)*p - (uchar)*q;
}

char*
strncpy(char *s, const char *t, int n)
8010450a:	8d 71 01             	lea    0x1(%ecx),%esi
{
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
8010450d:	85 f6                	test   %esi,%esi
8010450f:	7f e7                	jg     801044f8 <strncpy+0x18>
    ;
  while(n-- > 0)
80104511:	85 c9                	test   %ecx,%ecx
    return 0;
  return (uchar)*p - (uchar)*q;
}

char*
strncpy(char *s, const char *t, int n)
80104513:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
80104516:	7e 0a                	jle    80104522 <strncpy+0x42>
    *s++ = 0;
80104518:	c6 02 00             	movb   $0x0,(%edx)
8010451b:	83 c2 01             	add    $0x1,%edx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
8010451e:	39 c2                	cmp    %eax,%edx
80104520:	75 f6                	jne    80104518 <strncpy+0x38>
    *s++ = 0;
  return os;
}
80104522:	5b                   	pop    %ebx
80104523:	89 f8                	mov    %edi,%eax
80104525:	5e                   	pop    %esi
80104526:	5f                   	pop    %edi
80104527:	5d                   	pop    %ebp
80104528:	c3                   	ret    
80104529:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104530 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
80104530:	55                   	push   %ebp
80104531:	89 e5                	mov    %esp,%ebp
80104533:	8b 55 10             	mov    0x10(%ebp),%edx
80104536:	56                   	push   %esi
80104537:	8b 75 08             	mov    0x8(%ebp),%esi
8010453a:	53                   	push   %ebx
8010453b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *os;

  os = s;
  if(n <= 0)
8010453e:	85 d2                	test   %edx,%edx
80104540:	7e 1d                	jle    8010455f <safestrcpy+0x2f>
80104542:	89 f1                	mov    %esi,%ecx
80104544:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
80104548:	83 ea 01             	sub    $0x1,%edx
8010454b:	74 0f                	je     8010455c <safestrcpy+0x2c>
8010454d:	0f b6 03             	movzbl (%ebx),%eax
80104550:	83 c3 01             	add    $0x1,%ebx
80104553:	88 01                	mov    %al,(%ecx)
80104555:	83 c1 01             	add    $0x1,%ecx
80104558:	84 c0                	test   %al,%al
8010455a:	75 ec                	jne    80104548 <safestrcpy+0x18>
    ;
  *s = 0;
8010455c:	c6 01 00             	movb   $0x0,(%ecx)
  return os;
}
8010455f:	89 f0                	mov    %esi,%eax
80104561:	5b                   	pop    %ebx
80104562:	5e                   	pop    %esi
80104563:	5d                   	pop    %ebp
80104564:	c3                   	ret    
80104565:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104570 <strlen>:

int
strlen(const char *s)
{
80104570:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
80104571:	31 c0                	xor    %eax,%eax
  return os;
}

int
strlen(const char *s)
{
80104573:	89 e5                	mov    %esp,%ebp
80104575:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
80104578:	80 3a 00             	cmpb   $0x0,(%edx)
8010457b:	74 0c                	je     80104589 <strlen+0x19>
8010457d:	8d 76 00             	lea    0x0(%esi),%esi
80104580:	83 c0 01             	add    $0x1,%eax
80104583:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80104587:	75 f7                	jne    80104580 <strlen+0x10>
    ;
  return n;
}
80104589:	5d                   	pop    %ebp
8010458a:	c3                   	ret    
	...

8010458c <swtch>:
# a struct context, and save its address in *old.
# Switch stacks to new and pop previously-saved registers.

.globl swtch
swtch:
  movl 4(%esp), %eax
8010458c:	8b 44 24 04          	mov    0x4(%esp),%eax
  movl 8(%esp), %edx
80104590:	8b 54 24 08          	mov    0x8(%esp),%edx

  # Save old callee-saved registers
  pushl %ebp
80104594:	55                   	push   %ebp
  pushl %ebx
80104595:	53                   	push   %ebx
  pushl %esi
80104596:	56                   	push   %esi
  pushl %edi
80104597:	57                   	push   %edi

  # Switch stacks
  movl %esp, (%eax)
80104598:	89 20                	mov    %esp,(%eax)
  movl %edx, %esp
8010459a:	89 d4                	mov    %edx,%esp

  # Load new callee-saved registers
  popl %edi
8010459c:	5f                   	pop    %edi
  popl %esi
8010459d:	5e                   	pop    %esi
  popl %ebx
8010459e:	5b                   	pop    %ebx
  popl %ebp
8010459f:	5d                   	pop    %ebp
  ret
801045a0:	c3                   	ret    
	...

801045b0 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
801045b0:	55                   	push   %ebp
801045b1:	89 e5                	mov    %esp,%ebp
801045b3:	53                   	push   %ebx
801045b4:	83 ec 04             	sub    $0x4,%esp
801045b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *curproc = myproc();
801045ba:	e8 71 f1 ff ff       	call   80103730 <myproc>

  if(addr >= curproc->sz || addr+4 > curproc->sz)
801045bf:	8b 10                	mov    (%eax),%edx
    return -1;
801045c1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
int
fetchint(uint addr, int *ip)
{
  struct proc *curproc = myproc();

  if(addr >= curproc->sz || addr+4 > curproc->sz)
801045c6:	39 da                	cmp    %ebx,%edx
801045c8:	76 10                	jbe    801045da <fetchint+0x2a>
801045ca:	8d 4b 04             	lea    0x4(%ebx),%ecx
801045cd:	39 ca                	cmp    %ecx,%edx
801045cf:	72 09                	jb     801045da <fetchint+0x2a>
    return -1;
  *ip = *(int*)(addr);
801045d1:	8b 45 0c             	mov    0xc(%ebp),%eax
801045d4:	8b 13                	mov    (%ebx),%edx
801045d6:	89 10                	mov    %edx,(%eax)
  return 0;
801045d8:	31 c0                	xor    %eax,%eax
}
801045da:	83 c4 04             	add    $0x4,%esp
801045dd:	5b                   	pop    %ebx
801045de:	5d                   	pop    %ebp
801045df:	c3                   	ret    

801045e0 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
801045e0:	55                   	push   %ebp
801045e1:	89 e5                	mov    %esp,%ebp
801045e3:	53                   	push   %ebx
801045e4:	83 ec 04             	sub    $0x4,%esp
801045e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char *s, *ep;
  struct proc *curproc = myproc();
801045ea:	e8 41 f1 ff ff       	call   80103730 <myproc>

  if(addr >= curproc->sz)
    return -1;
801045ef:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
fetchstr(uint addr, char **pp)
{
  char *s, *ep;
  struct proc *curproc = myproc();

  if(addr >= curproc->sz)
801045f4:	39 18                	cmp    %ebx,(%eax)
801045f6:	76 29                	jbe    80104621 <fetchstr+0x41>
    return -1;
  *pp = (char*)addr;
801045f8:	8b 55 0c             	mov    0xc(%ebp),%edx
801045fb:	89 1a                	mov    %ebx,(%edx)
  ep = (char*)curproc->sz;
801045fd:	8b 10                	mov    (%eax),%edx
  for(s = *pp; s < ep; s++){
801045ff:	39 d3                	cmp    %edx,%ebx
80104601:	73 1e                	jae    80104621 <fetchstr+0x41>
    if(*s == 0)
80104603:	31 c9                	xor    %ecx,%ecx
80104605:	89 d8                	mov    %ebx,%eax
80104607:	80 3b 00             	cmpb   $0x0,(%ebx)
8010460a:	75 09                	jne    80104615 <fetchstr+0x35>
8010460c:	eb 13                	jmp    80104621 <fetchstr+0x41>
8010460e:	66 90                	xchg   %ax,%ax
80104610:	80 38 00             	cmpb   $0x0,(%eax)
80104613:	74 1b                	je     80104630 <fetchstr+0x50>

  if(addr >= curproc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)curproc->sz;
  for(s = *pp; s < ep; s++){
80104615:	83 c0 01             	add    $0x1,%eax
80104618:	39 c2                	cmp    %eax,%edx
8010461a:	77 f4                	ja     80104610 <fetchstr+0x30>
    if(*s == 0)
      return s - *pp;
  }
  return -1;
8010461c:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
}
80104621:	83 c4 04             	add    $0x4,%esp
80104624:	89 c8                	mov    %ecx,%eax
80104626:	5b                   	pop    %ebx
80104627:	5d                   	pop    %ebp
80104628:	c3                   	ret    
80104629:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(addr >= curproc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)curproc->sz;
  for(s = *pp; s < ep; s++){
    if(*s == 0)
80104630:	89 c1                	mov    %eax,%ecx
      return s - *pp;
  }
  return -1;
}
80104632:	83 c4 04             	add    $0x4,%esp
  if(addr >= curproc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)curproc->sz;
  for(s = *pp; s < ep; s++){
    if(*s == 0)
80104635:	29 d9                	sub    %ebx,%ecx
      return s - *pp;
  }
  return -1;
}
80104637:	89 c8                	mov    %ecx,%eax
80104639:	5b                   	pop    %ebx
8010463a:	5d                   	pop    %ebp
8010463b:	c3                   	ret    
8010463c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104640 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
80104640:	55                   	push   %ebp
80104641:	89 e5                	mov    %esp,%ebp
80104643:	83 ec 08             	sub    $0x8,%esp
80104646:	89 5d f8             	mov    %ebx,-0x8(%ebp)
80104649:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010464c:	89 75 fc             	mov    %esi,-0x4(%ebp)
8010464f:	8b 75 0c             	mov    0xc(%ebp),%esi
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104652:	e8 d9 f0 ff ff       	call   80103730 <myproc>
80104657:	89 75 0c             	mov    %esi,0xc(%ebp)
}
8010465a:	8b 75 fc             	mov    -0x4(%ebp),%esi

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
8010465d:	8b 40 18             	mov    0x18(%eax),%eax
80104660:	8b 40 44             	mov    0x44(%eax),%eax
80104663:	8d 44 98 04          	lea    0x4(%eax,%ebx,4),%eax
}
80104667:	8b 5d f8             	mov    -0x8(%ebp),%ebx

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
8010466a:	89 45 08             	mov    %eax,0x8(%ebp)
}
8010466d:	89 ec                	mov    %ebp,%esp
8010466f:	5d                   	pop    %ebp

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
80104670:	e9 3b ff ff ff       	jmp    801045b0 <fetchint>
80104675:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104679:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104680 <argptr>:
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104680:	55                   	push   %ebp
80104681:	89 e5                	mov    %esp,%ebp
80104683:	56                   	push   %esi
80104684:	53                   	push   %ebx
80104685:	83 ec 20             	sub    $0x20,%esp
80104688:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int i;
  struct proc *curproc = myproc();
8010468b:	e8 a0 f0 ff ff       	call   80103730 <myproc>
80104690:	89 c6                	mov    %eax,%esi
 
  if(argint(n, &i) < 0)
80104692:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104695:	89 44 24 04          	mov    %eax,0x4(%esp)
80104699:	8b 45 08             	mov    0x8(%ebp),%eax
8010469c:	89 04 24             	mov    %eax,(%esp)
8010469f:	e8 9c ff ff ff       	call   80104640 <argint>
801046a4:	85 c0                	test   %eax,%eax
801046a6:	78 28                	js     801046d0 <argptr+0x50>
    return -1;
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
801046a8:	85 db                	test   %ebx,%ebx
801046aa:	78 24                	js     801046d0 <argptr+0x50>
801046ac:	8b 55 f4             	mov    -0xc(%ebp),%edx
    return -1;
801046af:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  int i;
  struct proc *curproc = myproc();
 
  if(argint(n, &i) < 0)
    return -1;
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
801046b4:	8b 0e                	mov    (%esi),%ecx
801046b6:	39 ca                	cmp    %ecx,%edx
801046b8:	73 0d                	jae    801046c7 <argptr+0x47>
801046ba:	01 d3                	add    %edx,%ebx
801046bc:	39 d9                	cmp    %ebx,%ecx
801046be:	72 07                	jb     801046c7 <argptr+0x47>
    return -1;
  *pp = (char*)i;
801046c0:	8b 45 0c             	mov    0xc(%ebp),%eax
801046c3:	89 10                	mov    %edx,(%eax)
  return 0;
801046c5:	31 c0                	xor    %eax,%eax
}
801046c7:	83 c4 20             	add    $0x20,%esp
801046ca:	5b                   	pop    %ebx
801046cb:	5e                   	pop    %esi
801046cc:	5d                   	pop    %ebp
801046cd:	c3                   	ret    
801046ce:	66 90                	xchg   %ax,%ax
  struct proc *curproc = myproc();
 
  if(argint(n, &i) < 0)
    return -1;
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
    return -1;
801046d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801046d5:	eb f0                	jmp    801046c7 <argptr+0x47>
801046d7:	89 f6                	mov    %esi,%esi
801046d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801046e0 <argstr>:
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
801046e0:	55                   	push   %ebp
801046e1:	89 e5                	mov    %esp,%ebp
801046e3:	83 ec 28             	sub    $0x28,%esp
  int addr;
  if(argint(n, &addr) < 0)
801046e6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801046e9:	89 44 24 04          	mov    %eax,0x4(%esp)
801046ed:	8b 45 08             	mov    0x8(%ebp),%eax
801046f0:	89 04 24             	mov    %eax,(%esp)
801046f3:	e8 48 ff ff ff       	call   80104640 <argint>
801046f8:	89 c2                	mov    %eax,%edx
    return -1;
801046fa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
  int addr;
  if(argint(n, &addr) < 0)
801046ff:	85 d2                	test   %edx,%edx
80104701:	78 12                	js     80104715 <argstr+0x35>
    return -1;
  return fetchstr(addr, pp);
80104703:	8b 45 0c             	mov    0xc(%ebp),%eax
80104706:	89 44 24 04          	mov    %eax,0x4(%esp)
8010470a:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010470d:	89 04 24             	mov    %eax,(%esp)
80104710:	e8 cb fe ff ff       	call   801045e0 <fetchstr>
}
80104715:	c9                   	leave  
80104716:	c3                   	ret    
80104717:	89 f6                	mov    %esi,%esi
80104719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104720 <syscall>:
[SYS_close]   sys_close,
};

void
syscall(void)
{
80104720:	55                   	push   %ebp
80104721:	89 e5                	mov    %esp,%ebp
80104723:	83 ec 18             	sub    $0x18,%esp
80104726:	89 5d f8             	mov    %ebx,-0x8(%ebp)
80104729:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int num;
  struct proc *curproc = myproc();
8010472c:	e8 ff ef ff ff       	call   80103730 <myproc>

  num = curproc->tf->eax;
80104731:	8b 58 18             	mov    0x18(%eax),%ebx

void
syscall(void)
{
  int num;
  struct proc *curproc = myproc();
80104734:	89 c6                	mov    %eax,%esi

  num = curproc->tf->eax;
80104736:	8b 43 1c             	mov    0x1c(%ebx),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104739:	8d 50 ff             	lea    -0x1(%eax),%edx
8010473c:	83 fa 14             	cmp    $0x14,%edx
8010473f:	77 1f                	ja     80104760 <syscall+0x40>
80104741:	8b 14 85 00 74 10 80 	mov    -0x7fef8c00(,%eax,4),%edx
80104748:	85 d2                	test   %edx,%edx
8010474a:	74 14                	je     80104760 <syscall+0x40>
    curproc->tf->eax = syscalls[num]();
8010474c:	ff d2                	call   *%edx
8010474e:	89 43 1c             	mov    %eax,0x1c(%ebx)
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
  }
}
80104751:	8b 5d f8             	mov    -0x8(%ebp),%ebx
80104754:	8b 75 fc             	mov    -0x4(%ebp),%esi
80104757:	89 ec                	mov    %ebp,%esp
80104759:	5d                   	pop    %ebp
8010475a:	c3                   	ret    
8010475b:	90                   	nop
8010475c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  num = curproc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    curproc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
80104760:	89 44 24 0c          	mov    %eax,0xc(%esp)
            curproc->pid, curproc->name, num);
80104764:	8d 46 6c             	lea    0x6c(%esi),%eax
80104767:	89 44 24 08          	mov    %eax,0x8(%esp)

  num = curproc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    curproc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
8010476b:	8b 46 10             	mov    0x10(%esi),%eax
8010476e:	c7 04 24 e1 73 10 80 	movl   $0x801073e1,(%esp)
80104775:	89 44 24 04          	mov    %eax,0x4(%esp)
80104779:	e8 d2 be ff ff       	call   80100650 <cprintf>
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
8010477e:	8b 46 18             	mov    0x18(%esi),%eax
80104781:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
  }
}
80104788:	8b 5d f8             	mov    -0x8(%ebp),%ebx
8010478b:	8b 75 fc             	mov    -0x4(%ebp),%esi
8010478e:	89 ec                	mov    %ebp,%esp
80104790:	5d                   	pop    %ebp
80104791:	c3                   	ret    
	...

801047a0 <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
801047a0:	55                   	push   %ebp
801047a1:	89 e5                	mov    %esp,%ebp
801047a3:	53                   	push   %ebx
801047a4:	89 c3                	mov    %eax,%ebx
801047a6:	83 ec 04             	sub    $0x4,%esp
  int fd;
  struct proc *curproc = myproc();
801047a9:	e8 82 ef ff ff       	call   80103730 <myproc>

  for(fd = 0; fd < NOFILE; fd++){
801047ae:	31 d2                	xor    %edx,%edx
    if(curproc->ofile[fd] == 0){
801047b0:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
801047b4:	85 c9                	test   %ecx,%ecx
801047b6:	74 18                	je     801047d0 <fdalloc+0x30>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
801047b8:	83 c2 01             	add    $0x1,%edx
801047bb:	83 fa 10             	cmp    $0x10,%edx
801047be:	75 f0                	jne    801047b0 <fdalloc+0x10>
      curproc->ofile[fd] = f;
      return fd;
    }
  }
  return -1;
}
801047c0:	83 c4 04             	add    $0x4,%esp
    if(curproc->ofile[fd] == 0){
      curproc->ofile[fd] = f;
      return fd;
    }
  }
  return -1;
801047c3:	ba ff ff ff ff       	mov    $0xffffffff,%edx
}
801047c8:	89 d0                	mov    %edx,%eax
801047ca:	5b                   	pop    %ebx
801047cb:	5d                   	pop    %ebp
801047cc:	c3                   	ret    
801047cd:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
      curproc->ofile[fd] = f;
801047d0:	89 5c 90 28          	mov    %ebx,0x28(%eax,%edx,4)
      return fd;
    }
  }
  return -1;
}
801047d4:	83 c4 04             	add    $0x4,%esp
801047d7:	89 d0                	mov    %edx,%eax
801047d9:	5b                   	pop    %ebx
801047da:	5d                   	pop    %ebp
801047db:	c3                   	ret    
801047dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801047e0 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
801047e0:	55                   	push   %ebp
801047e1:	89 e5                	mov    %esp,%ebp
801047e3:	83 ec 48             	sub    $0x48,%esp
801047e6:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
801047e9:	8b 4d 08             	mov    0x8(%ebp),%ecx
801047ec:	89 75 f8             	mov    %esi,-0x8(%ebp)
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
801047ef:	8d 75 da             	lea    -0x26(%ebp),%esi
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
801047f2:	89 7d fc             	mov    %edi,-0x4(%ebp)
801047f5:	89 d7                	mov    %edx,%edi
801047f7:	89 5d f4             	mov    %ebx,-0xc(%ebp)
801047fa:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
801047fd:	89 74 24 04          	mov    %esi,0x4(%esp)
80104801:	89 04 24             	mov    %eax,(%esp)
80104804:	e8 87 d7 ff ff       	call   80101f90 <nameiparent>
80104809:	85 c0                	test   %eax,%eax
8010480b:	0f 84 ff 00 00 00    	je     80104910 <create+0x130>
    return 0;
  ilock(dp);
80104811:	89 04 24             	mov    %eax,(%esp)
80104814:	89 45 cc             	mov    %eax,-0x34(%ebp)
80104817:	e8 84 ce ff ff       	call   801016a0 <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
8010481c:	8b 55 cc             	mov    -0x34(%ebp),%edx
8010481f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80104826:	00 
80104827:	89 74 24 04          	mov    %esi,0x4(%esp)
8010482b:	89 14 24             	mov    %edx,(%esp)
8010482e:	e8 fd d3 ff ff       	call   80101c30 <dirlookup>
80104833:	8b 55 cc             	mov    -0x34(%ebp),%edx
80104836:	85 c0                	test   %eax,%eax
80104838:	89 c3                	mov    %eax,%ebx
8010483a:	74 4c                	je     80104888 <create+0xa8>
    iunlockput(dp);
8010483c:	89 14 24             	mov    %edx,(%esp)
8010483f:	e8 ec d0 ff ff       	call   80101930 <iunlockput>
    ilock(ip);
80104844:	89 1c 24             	mov    %ebx,(%esp)
80104847:	e8 54 ce ff ff       	call   801016a0 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
8010484c:	66 83 ff 02          	cmp    $0x2,%di
80104850:	75 16                	jne    80104868 <create+0x88>
80104852:	66 83 7b 50 02       	cmpw   $0x2,0x50(%ebx)
80104857:	75 0f                	jne    80104868 <create+0x88>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104859:	89 d8                	mov    %ebx,%eax
8010485b:	8b 75 f8             	mov    -0x8(%ebp),%esi
8010485e:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80104861:	8b 7d fc             	mov    -0x4(%ebp),%edi
80104864:	89 ec                	mov    %ebp,%esp
80104866:	5d                   	pop    %ebp
80104867:	c3                   	ret    
  if((ip = dirlookup(dp, name, 0)) != 0){
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
80104868:	89 1c 24             	mov    %ebx,(%esp)
    return 0;
8010486b:	31 db                	xor    %ebx,%ebx
  if((ip = dirlookup(dp, name, 0)) != 0){
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
8010486d:	e8 be d0 ff ff       	call   80101930 <iunlockput>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104872:	89 d8                	mov    %ebx,%eax
80104874:	8b 75 f8             	mov    -0x8(%ebp),%esi
80104877:	8b 5d f4             	mov    -0xc(%ebp),%ebx
8010487a:	8b 7d fc             	mov    -0x4(%ebp),%edi
8010487d:	89 ec                	mov    %ebp,%esp
8010487f:	5d                   	pop    %ebp
80104880:	c3                   	ret    
80104881:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      return ip;
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
80104888:	0f bf c7             	movswl %di,%eax
8010488b:	89 44 24 04          	mov    %eax,0x4(%esp)
8010488f:	8b 02                	mov    (%edx),%eax
80104891:	89 55 cc             	mov    %edx,-0x34(%ebp)
80104894:	89 04 24             	mov    %eax,(%esp)
80104897:	e8 74 cc ff ff       	call   80101510 <ialloc>
8010489c:	8b 55 cc             	mov    -0x34(%ebp),%edx
8010489f:	85 c0                	test   %eax,%eax
801048a1:	89 c3                	mov    %eax,%ebx
801048a3:	0f 84 d7 00 00 00    	je     80104980 <create+0x1a0>
    panic("create: ialloc");

  ilock(ip);
801048a9:	89 55 cc             	mov    %edx,-0x34(%ebp)
801048ac:	89 04 24             	mov    %eax,(%esp)
801048af:	e8 ec cd ff ff       	call   801016a0 <ilock>
  ip->major = major;
801048b4:	0f b7 45 d4          	movzwl -0x2c(%ebp),%eax
  ip->minor = minor;
801048b8:	0f b7 4d d0          	movzwl -0x30(%ebp),%ecx
  ip->nlink = 1;
801048bc:	66 c7 43 56 01 00    	movw   $0x1,0x56(%ebx)

  if((ip = ialloc(dp->dev, type)) == 0)
    panic("create: ialloc");

  ilock(ip);
  ip->major = major;
801048c2:	66 89 43 52          	mov    %ax,0x52(%ebx)
  ip->minor = minor;
801048c6:	66 89 4b 54          	mov    %cx,0x54(%ebx)
  ip->nlink = 1;
  iupdate(ip);
801048ca:	89 1c 24             	mov    %ebx,(%esp)
801048cd:	e8 0e cd ff ff       	call   801015e0 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
801048d2:	66 83 ff 01          	cmp    $0x1,%di
801048d6:	8b 55 cc             	mov    -0x34(%ebp),%edx
801048d9:	74 3d                	je     80104918 <create+0x138>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
      panic("create dots");
  }

  if(dirlink(dp, name, ip->inum) < 0)
801048db:	8b 43 04             	mov    0x4(%ebx),%eax
801048de:	89 14 24             	mov    %edx,(%esp)
801048e1:	89 55 cc             	mov    %edx,-0x34(%ebp)
801048e4:	89 74 24 04          	mov    %esi,0x4(%esp)
801048e8:	89 44 24 08          	mov    %eax,0x8(%esp)
801048ec:	e8 9f d5 ff ff       	call   80101e90 <dirlink>
801048f1:	8b 55 cc             	mov    -0x34(%ebp),%edx
801048f4:	85 c0                	test   %eax,%eax
801048f6:	78 7c                	js     80104974 <create+0x194>
    panic("create: dirlink");

  iunlockput(dp);
801048f8:	89 14 24             	mov    %edx,(%esp)
801048fb:	e8 30 d0 ff ff       	call   80101930 <iunlockput>

  return ip;
}
80104900:	89 d8                	mov    %ebx,%eax
80104902:	8b 75 f8             	mov    -0x8(%ebp),%esi
80104905:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80104908:	8b 7d fc             	mov    -0x4(%ebp),%edi
8010490b:	89 ec                	mov    %ebp,%esp
8010490d:	5d                   	pop    %ebp
8010490e:	c3                   	ret    
8010490f:	90                   	nop
{
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    return 0;
80104910:	31 db                	xor    %ebx,%ebx
80104912:	e9 42 ff ff ff       	jmp    80104859 <create+0x79>
80104917:	90                   	nop
  ip->minor = minor;
  ip->nlink = 1;
  iupdate(ip);

  if(type == T_DIR){  // Create . and .. entries.
    dp->nlink++;  // for ".."
80104918:	66 83 42 56 01       	addw   $0x1,0x56(%edx)
    iupdate(dp);
8010491d:	89 14 24             	mov    %edx,(%esp)
80104920:	89 55 cc             	mov    %edx,-0x34(%ebp)
80104923:	e8 b8 cc ff ff       	call   801015e0 <iupdate>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
80104928:	8b 43 04             	mov    0x4(%ebx),%eax
8010492b:	c7 44 24 04 68 74 10 	movl   $0x80107468,0x4(%esp)
80104932:	80 
80104933:	89 1c 24             	mov    %ebx,(%esp)
80104936:	89 44 24 08          	mov    %eax,0x8(%esp)
8010493a:	e8 51 d5 ff ff       	call   80101e90 <dirlink>
8010493f:	8b 55 cc             	mov    -0x34(%ebp),%edx
80104942:	85 c0                	test   %eax,%eax
80104944:	78 22                	js     80104968 <create+0x188>
80104946:	8b 42 04             	mov    0x4(%edx),%eax
80104949:	c7 44 24 04 67 74 10 	movl   $0x80107467,0x4(%esp)
80104950:	80 
80104951:	89 1c 24             	mov    %ebx,(%esp)
80104954:	89 44 24 08          	mov    %eax,0x8(%esp)
80104958:	e8 33 d5 ff ff       	call   80101e90 <dirlink>
8010495d:	8b 55 cc             	mov    -0x34(%ebp),%edx
80104960:	85 c0                	test   %eax,%eax
80104962:	0f 89 73 ff ff ff    	jns    801048db <create+0xfb>
      panic("create dots");
80104968:	c7 04 24 6a 74 10 80 	movl   $0x8010746a,(%esp)
8010496f:	e8 fc b9 ff ff       	call   80100370 <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");
80104974:	c7 04 24 76 74 10 80 	movl   $0x80107476,(%esp)
8010497b:	e8 f0 b9 ff ff       	call   80100370 <panic>
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
    panic("create: ialloc");
80104980:	c7 04 24 58 74 10 80 	movl   $0x80107458,(%esp)
80104987:	e8 e4 b9 ff ff       	call   80100370 <panic>
8010498c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104990 <argfd.constprop.0>:
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
80104990:	55                   	push   %ebp
80104991:	89 e5                	mov    %esp,%ebp
80104993:	83 ec 38             	sub    $0x38,%esp
80104996:	89 5d f4             	mov    %ebx,-0xc(%ebp)
80104999:	89 c3                	mov    %eax,%ebx
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
8010499b:	8d 45 e4             	lea    -0x1c(%ebp),%eax
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
8010499e:	89 75 f8             	mov    %esi,-0x8(%ebp)
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    return -1;
801049a1:	be ff ff ff ff       	mov    $0xffffffff,%esi
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
801049a6:	89 7d fc             	mov    %edi,-0x4(%ebp)
801049a9:	89 d7                	mov    %edx,%edi
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
801049ab:	89 44 24 04          	mov    %eax,0x4(%esp)
801049af:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801049b6:	e8 85 fc ff ff       	call   80104640 <argint>
801049bb:	85 c0                	test   %eax,%eax
801049bd:	78 24                	js     801049e3 <argfd.constprop.0+0x53>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
801049bf:	83 7d e4 0f          	cmpl   $0xf,-0x1c(%ebp)
801049c3:	77 1e                	ja     801049e3 <argfd.constprop.0+0x53>
801049c5:	e8 66 ed ff ff       	call   80103730 <myproc>
801049ca:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801049cd:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
801049d1:	85 c0                	test   %eax,%eax
801049d3:	74 0e                	je     801049e3 <argfd.constprop.0+0x53>
    return -1;
  if(pfd)
801049d5:	85 db                	test   %ebx,%ebx
801049d7:	74 02                	je     801049db <argfd.constprop.0+0x4b>
    *pfd = fd;
801049d9:	89 13                	mov    %edx,(%ebx)
  if(pf)
    *pf = f;
  return 0;
801049db:	31 f6                	xor    %esi,%esi
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
    return -1;
  if(pfd)
    *pfd = fd;
  if(pf)
801049dd:	85 ff                	test   %edi,%edi
801049df:	74 02                	je     801049e3 <argfd.constprop.0+0x53>
    *pf = f;
801049e1:	89 07                	mov    %eax,(%edi)
  return 0;
}
801049e3:	89 f0                	mov    %esi,%eax
801049e5:	8b 5d f4             	mov    -0xc(%ebp),%ebx
801049e8:	8b 75 f8             	mov    -0x8(%ebp),%esi
801049eb:	8b 7d fc             	mov    -0x4(%ebp),%edi
801049ee:	89 ec                	mov    %ebp,%esp
801049f0:	5d                   	pop    %ebp
801049f1:	c3                   	ret    
801049f2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801049f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104a00 <sys_dup>:
  return -1;
}

int
sys_dup(void)
{
80104a00:	55                   	push   %ebp
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104a01:	31 c0                	xor    %eax,%eax
  return -1;
}

int
sys_dup(void)
{
80104a03:	89 e5                	mov    %esp,%ebp
80104a05:	53                   	push   %ebx
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    return -1;
80104a06:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  return -1;
}

int
sys_dup(void)
{
80104a0b:	83 ec 24             	sub    $0x24,%esp
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104a0e:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104a11:	e8 7a ff ff ff       	call   80104990 <argfd.constprop.0>
80104a16:	85 c0                	test   %eax,%eax
80104a18:	78 19                	js     80104a33 <sys_dup+0x33>
    return -1;
  if((fd=fdalloc(f)) < 0)
80104a1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104a1d:	e8 7e fd ff ff       	call   801047a0 <fdalloc>
80104a22:	85 c0                	test   %eax,%eax
80104a24:	89 c3                	mov    %eax,%ebx
80104a26:	78 18                	js     80104a40 <sys_dup+0x40>
    return -1;
  filedup(f);
80104a28:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104a2b:	89 04 24             	mov    %eax,(%esp)
80104a2e:	e8 9d c3 ff ff       	call   80100dd0 <filedup>
  return fd;
}
80104a33:	83 c4 24             	add    $0x24,%esp
80104a36:	89 d8                	mov    %ebx,%eax
80104a38:	5b                   	pop    %ebx
80104a39:	5d                   	pop    %ebp
80104a3a:	c3                   	ret    
80104a3b:	90                   	nop
80104a3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
80104a40:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80104a45:	eb ec                	jmp    80104a33 <sys_dup+0x33>
80104a47:	89 f6                	mov    %esi,%esi
80104a49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104a50 <sys_read>:
  return fd;
}

int
sys_read(void)
{
80104a50:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104a51:	31 c0                	xor    %eax,%eax
  return fd;
}

int
sys_read(void)
{
80104a53:	89 e5                	mov    %esp,%ebp
80104a55:	53                   	push   %ebx
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
80104a56:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  return fd;
}

int
sys_read(void)
{
80104a5b:	83 ec 24             	sub    $0x24,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104a5e:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104a61:	e8 2a ff ff ff       	call   80104990 <argfd.constprop.0>
80104a66:	85 c0                	test   %eax,%eax
80104a68:	78 50                	js     80104aba <sys_read+0x6a>
80104a6a:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104a6d:	89 44 24 04          	mov    %eax,0x4(%esp)
80104a71:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
80104a78:	e8 c3 fb ff ff       	call   80104640 <argint>
80104a7d:	85 c0                	test   %eax,%eax
80104a7f:	78 39                	js     80104aba <sys_read+0x6a>
80104a81:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104a84:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80104a8b:	89 44 24 08          	mov    %eax,0x8(%esp)
80104a8f:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104a92:	89 44 24 04          	mov    %eax,0x4(%esp)
80104a96:	e8 e5 fb ff ff       	call   80104680 <argptr>
80104a9b:	85 c0                	test   %eax,%eax
80104a9d:	78 1b                	js     80104aba <sys_read+0x6a>
    return -1;
  return fileread(f, p, n);
80104a9f:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104aa2:	89 44 24 08          	mov    %eax,0x8(%esp)
80104aa6:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104aa9:	89 44 24 04          	mov    %eax,0x4(%esp)
80104aad:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104ab0:	89 04 24             	mov    %eax,(%esp)
80104ab3:	e8 98 c4 ff ff       	call   80100f50 <fileread>
80104ab8:	89 c3                	mov    %eax,%ebx
}
80104aba:	83 c4 24             	add    $0x24,%esp
80104abd:	89 d8                	mov    %ebx,%eax
80104abf:	5b                   	pop    %ebx
80104ac0:	5d                   	pop    %ebp
80104ac1:	c3                   	ret    
80104ac2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104ac9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104ad0 <sys_write>:

int
sys_write(void)
{
80104ad0:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104ad1:	31 c0                	xor    %eax,%eax
  return fileread(f, p, n);
}

int
sys_write(void)
{
80104ad3:	89 e5                	mov    %esp,%ebp
80104ad5:	53                   	push   %ebx
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
80104ad6:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  return fileread(f, p, n);
}

int
sys_write(void)
{
80104adb:	83 ec 24             	sub    $0x24,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104ade:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104ae1:	e8 aa fe ff ff       	call   80104990 <argfd.constprop.0>
80104ae6:	85 c0                	test   %eax,%eax
80104ae8:	78 50                	js     80104b3a <sys_write+0x6a>
80104aea:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104aed:	89 44 24 04          	mov    %eax,0x4(%esp)
80104af1:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
80104af8:	e8 43 fb ff ff       	call   80104640 <argint>
80104afd:	85 c0                	test   %eax,%eax
80104aff:	78 39                	js     80104b3a <sys_write+0x6a>
80104b01:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104b04:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80104b0b:	89 44 24 08          	mov    %eax,0x8(%esp)
80104b0f:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104b12:	89 44 24 04          	mov    %eax,0x4(%esp)
80104b16:	e8 65 fb ff ff       	call   80104680 <argptr>
80104b1b:	85 c0                	test   %eax,%eax
80104b1d:	78 1b                	js     80104b3a <sys_write+0x6a>
    return -1;
  return filewrite(f, p, n);
80104b1f:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104b22:	89 44 24 08          	mov    %eax,0x8(%esp)
80104b26:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104b29:	89 44 24 04          	mov    %eax,0x4(%esp)
80104b2d:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104b30:	89 04 24             	mov    %eax,(%esp)
80104b33:	e8 c8 c4 ff ff       	call   80101000 <filewrite>
80104b38:	89 c3                	mov    %eax,%ebx
}
80104b3a:	83 c4 24             	add    $0x24,%esp
80104b3d:	89 d8                	mov    %ebx,%eax
80104b3f:	5b                   	pop    %ebx
80104b40:	5d                   	pop    %ebp
80104b41:	c3                   	ret    
80104b42:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104b50 <sys_close>:

int
sys_close(void)
{
80104b50:	55                   	push   %ebp
80104b51:	89 e5                	mov    %esp,%ebp
80104b53:	83 ec 28             	sub    $0x28,%esp
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
80104b56:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104b59:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104b5c:	e8 2f fe ff ff       	call   80104990 <argfd.constprop.0>
    return -1;
80104b61:	ba ff ff ff ff       	mov    $0xffffffff,%edx
sys_close(void)
{
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
80104b66:	85 c0                	test   %eax,%eax
80104b68:	78 1d                	js     80104b87 <sys_close+0x37>
    return -1;
  myproc()->ofile[fd] = 0;
80104b6a:	e8 c1 eb ff ff       	call   80103730 <myproc>
80104b6f:	8b 55 f0             	mov    -0x10(%ebp),%edx
80104b72:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104b79:	00 
  fileclose(f);
80104b7a:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104b7d:	89 04 24             	mov    %eax,(%esp)
80104b80:	e8 9b c2 ff ff       	call   80100e20 <fileclose>
  return 0;
80104b85:	31 d2                	xor    %edx,%edx
}
80104b87:	89 d0                	mov    %edx,%eax
80104b89:	c9                   	leave  
80104b8a:	c3                   	ret    
80104b8b:	90                   	nop
80104b8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104b90 <sys_fstat>:

int
sys_fstat(void)
{
80104b90:	55                   	push   %ebp
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104b91:	31 c0                	xor    %eax,%eax
  return 0;
}

int
sys_fstat(void)
{
80104b93:	89 e5                	mov    %esp,%ebp
80104b95:	53                   	push   %ebx
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
    return -1;
80104b96:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  return 0;
}

int
sys_fstat(void)
{
80104b9b:	83 ec 24             	sub    $0x24,%esp
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104b9e:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104ba1:	e8 ea fd ff ff       	call   80104990 <argfd.constprop.0>
80104ba6:	85 c0                	test   %eax,%eax
80104ba8:	78 33                	js     80104bdd <sys_fstat+0x4d>
80104baa:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104bad:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
80104bb4:	00 
80104bb5:	89 44 24 04          	mov    %eax,0x4(%esp)
80104bb9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80104bc0:	e8 bb fa ff ff       	call   80104680 <argptr>
80104bc5:	85 c0                	test   %eax,%eax
80104bc7:	78 14                	js     80104bdd <sys_fstat+0x4d>
    return -1;
  return filestat(f, st);
80104bc9:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104bcc:	89 44 24 04          	mov    %eax,0x4(%esp)
80104bd0:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104bd3:	89 04 24             	mov    %eax,(%esp)
80104bd6:	e8 25 c3 ff ff       	call   80100f00 <filestat>
80104bdb:	89 c3                	mov    %eax,%ebx
}
80104bdd:	83 c4 24             	add    $0x24,%esp
80104be0:	89 d8                	mov    %ebx,%eax
80104be2:	5b                   	pop    %ebx
80104be3:	5d                   	pop    %ebp
80104be4:	c3                   	ret    
80104be5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104be9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104bf0 <sys_link>:

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
80104bf0:	55                   	push   %ebp
80104bf1:	89 e5                	mov    %esp,%ebp
80104bf3:	57                   	push   %edi
80104bf4:	56                   	push   %esi
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
    return -1;
80104bf5:	be ff ff ff ff       	mov    $0xffffffff,%esi
}

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
80104bfa:	53                   	push   %ebx
80104bfb:	83 ec 3c             	sub    $0x3c,%esp
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104bfe:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80104c01:	89 44 24 04          	mov    %eax,0x4(%esp)
80104c05:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104c0c:	e8 cf fa ff ff       	call   801046e0 <argstr>
80104c11:	85 c0                	test   %eax,%eax
80104c13:	0f 88 b1 00 00 00    	js     80104cca <sys_link+0xda>
80104c19:	8d 45 e0             	lea    -0x20(%ebp),%eax
80104c1c:	89 44 24 04          	mov    %eax,0x4(%esp)
80104c20:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80104c27:	e8 b4 fa ff ff       	call   801046e0 <argstr>
80104c2c:	85 c0                	test   %eax,%eax
80104c2e:	0f 88 96 00 00 00    	js     80104cca <sys_link+0xda>
    return -1;

  begin_op();
80104c34:	e8 37 df ff ff       	call   80102b70 <begin_op>
  if((ip = namei(old)) == 0){
80104c39:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80104c3c:	89 04 24             	mov    %eax,(%esp)
80104c3f:	e8 2c d3 ff ff       	call   80101f70 <namei>
80104c44:	85 c0                	test   %eax,%eax
80104c46:	89 c3                	mov    %eax,%ebx
80104c48:	0f 84 d2 00 00 00    	je     80104d20 <sys_link+0x130>
    end_op();
    return -1;
  }

  ilock(ip);
80104c4e:	89 04 24             	mov    %eax,(%esp)
80104c51:	e8 4a ca ff ff       	call   801016a0 <ilock>
  if(ip->type == T_DIR){
80104c56:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104c5b:	0f 84 b7 00 00 00    	je     80104d18 <sys_link+0x128>
    iunlockput(ip);
    end_op();
    return -1;
  }

  ip->nlink++;
80104c61:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  iupdate(ip);
  iunlock(ip);

  if((dp = nameiparent(new, name)) == 0)
80104c66:	8d 7d d2             	lea    -0x2e(%ebp),%edi
    end_op();
    return -1;
  }

  ip->nlink++;
  iupdate(ip);
80104c69:	89 1c 24             	mov    %ebx,(%esp)
80104c6c:	e8 6f c9 ff ff       	call   801015e0 <iupdate>
  iunlock(ip);
80104c71:	89 1c 24             	mov    %ebx,(%esp)
80104c74:	e8 07 cb ff ff       	call   80101780 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
80104c79:	8b 45 e0             	mov    -0x20(%ebp),%eax
80104c7c:	89 7c 24 04          	mov    %edi,0x4(%esp)
80104c80:	89 04 24             	mov    %eax,(%esp)
80104c83:	e8 08 d3 ff ff       	call   80101f90 <nameiparent>
80104c88:	85 c0                	test   %eax,%eax
80104c8a:	89 c6                	mov    %eax,%esi
80104c8c:	74 52                	je     80104ce0 <sys_link+0xf0>
    goto bad;
  ilock(dp);
80104c8e:	89 04 24             	mov    %eax,(%esp)
80104c91:	e8 0a ca ff ff       	call   801016a0 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80104c96:	8b 03                	mov    (%ebx),%eax
80104c98:	39 06                	cmp    %eax,(%esi)
80104c9a:	75 3c                	jne    80104cd8 <sys_link+0xe8>
80104c9c:	8b 43 04             	mov    0x4(%ebx),%eax
80104c9f:	89 7c 24 04          	mov    %edi,0x4(%esp)
80104ca3:	89 34 24             	mov    %esi,(%esp)
80104ca6:	89 44 24 08          	mov    %eax,0x8(%esp)
80104caa:	e8 e1 d1 ff ff       	call   80101e90 <dirlink>
80104caf:	85 c0                	test   %eax,%eax
80104cb1:	78 25                	js     80104cd8 <sys_link+0xe8>
    iunlockput(dp);
    goto bad;
  }
  iunlockput(dp);
80104cb3:	89 34 24             	mov    %esi,(%esp)
  iput(ip);

  end_op();

  return 0;
80104cb6:	31 f6                	xor    %esi,%esi
  ilock(dp);
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    iunlockput(dp);
    goto bad;
  }
  iunlockput(dp);
80104cb8:	e8 73 cc ff ff       	call   80101930 <iunlockput>
  iput(ip);
80104cbd:	89 1c 24             	mov    %ebx,(%esp)
80104cc0:	e8 0b cb ff ff       	call   801017d0 <iput>

  end_op();
80104cc5:	e8 16 df ff ff       	call   80102be0 <end_op>
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
}
80104cca:	83 c4 3c             	add    $0x3c,%esp
80104ccd:	89 f0                	mov    %esi,%eax
80104ccf:	5b                   	pop    %ebx
80104cd0:	5e                   	pop    %esi
80104cd1:	5f                   	pop    %edi
80104cd2:	5d                   	pop    %ebp
80104cd3:	c3                   	ret    
80104cd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  if((dp = nameiparent(new, name)) == 0)
    goto bad;
  ilock(dp);
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    iunlockput(dp);
80104cd8:	89 34 24             	mov    %esi,(%esp)
80104cdb:	e8 50 cc ff ff       	call   80101930 <iunlockput>
  end_op();

  return 0;

bad:
  ilock(ip);
80104ce0:	89 1c 24             	mov    %ebx,(%esp)
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
80104ce3:	be ff ff ff ff       	mov    $0xffffffff,%esi
  end_op();

  return 0;

bad:
  ilock(ip);
80104ce8:	e8 b3 c9 ff ff       	call   801016a0 <ilock>
  ip->nlink--;
80104ced:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80104cf2:	89 1c 24             	mov    %ebx,(%esp)
80104cf5:	e8 e6 c8 ff ff       	call   801015e0 <iupdate>
  iunlockput(ip);
80104cfa:	89 1c 24             	mov    %ebx,(%esp)
80104cfd:	e8 2e cc ff ff       	call   80101930 <iunlockput>
  end_op();
80104d02:	e8 d9 de ff ff       	call   80102be0 <end_op>
  return -1;
}
80104d07:	83 c4 3c             	add    $0x3c,%esp
80104d0a:	89 f0                	mov    %esi,%eax
80104d0c:	5b                   	pop    %ebx
80104d0d:	5e                   	pop    %esi
80104d0e:	5f                   	pop    %edi
80104d0f:	5d                   	pop    %ebp
80104d10:	c3                   	ret    
80104d11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
  }

  ilock(ip);
  if(ip->type == T_DIR){
    iunlockput(ip);
80104d18:	89 1c 24             	mov    %ebx,(%esp)
80104d1b:	e8 10 cc ff ff       	call   80101930 <iunlockput>
    end_op();
80104d20:	e8 bb de ff ff       	call   80102be0 <end_op>
    return -1;
80104d25:	eb a3                	jmp    80104cca <sys_link+0xda>
80104d27:	89 f6                	mov    %esi,%esi
80104d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104d30 <sys_unlink>:
}

//PAGEBREAK!
int
sys_unlink(void)
{
80104d30:	55                   	push   %ebp
80104d31:	89 e5                	mov    %esp,%ebp
80104d33:	57                   	push   %edi
80104d34:	56                   	push   %esi
80104d35:	53                   	push   %ebx
80104d36:	83 ec 6c             	sub    $0x6c,%esp
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
80104d39:	8d 45 e0             	lea    -0x20(%ebp),%eax
80104d3c:	89 44 24 04          	mov    %eax,0x4(%esp)
80104d40:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104d47:	e8 94 f9 ff ff       	call   801046e0 <argstr>
80104d4c:	85 c0                	test   %eax,%eax
80104d4e:	0f 88 99 01 00 00    	js     80104eed <sys_unlink+0x1bd>
    return -1;

  begin_op();
80104d54:	e8 17 de ff ff       	call   80102b70 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
80104d59:	8b 45 e0             	mov    -0x20(%ebp),%eax
80104d5c:	8d 5d d2             	lea    -0x2e(%ebp),%ebx
80104d5f:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80104d63:	89 04 24             	mov    %eax,(%esp)
80104d66:	e8 25 d2 ff ff       	call   80101f90 <nameiparent>
80104d6b:	85 c0                	test   %eax,%eax
80104d6d:	89 45 a4             	mov    %eax,-0x5c(%ebp)
80104d70:	0f 84 4d 01 00 00    	je     80104ec3 <sys_unlink+0x193>
    end_op();
    return -1;
  }

  ilock(dp);
80104d76:	8b 45 a4             	mov    -0x5c(%ebp),%eax
80104d79:	89 04 24             	mov    %eax,(%esp)
80104d7c:	e8 1f c9 ff ff       	call   801016a0 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
80104d81:	c7 44 24 04 68 74 10 	movl   $0x80107468,0x4(%esp)
80104d88:	80 
80104d89:	89 1c 24             	mov    %ebx,(%esp)
80104d8c:	e8 6f ce ff ff       	call   80101c00 <namecmp>
80104d91:	85 c0                	test   %eax,%eax
80104d93:	0f 84 1f 01 00 00    	je     80104eb8 <sys_unlink+0x188>
80104d99:	c7 44 24 04 67 74 10 	movl   $0x80107467,0x4(%esp)
80104da0:	80 
80104da1:	89 1c 24             	mov    %ebx,(%esp)
80104da4:	e8 57 ce ff ff       	call   80101c00 <namecmp>
80104da9:	85 c0                	test   %eax,%eax
80104dab:	0f 84 07 01 00 00    	je     80104eb8 <sys_unlink+0x188>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
80104db1:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80104db4:	89 44 24 08          	mov    %eax,0x8(%esp)
80104db8:	8b 45 a4             	mov    -0x5c(%ebp),%eax
80104dbb:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80104dbf:	89 04 24             	mov    %eax,(%esp)
80104dc2:	e8 69 ce ff ff       	call   80101c30 <dirlookup>
80104dc7:	85 c0                	test   %eax,%eax
80104dc9:	89 c6                	mov    %eax,%esi
80104dcb:	0f 84 e7 00 00 00    	je     80104eb8 <sys_unlink+0x188>
    goto bad;
  ilock(ip);
80104dd1:	89 04 24             	mov    %eax,(%esp)
80104dd4:	e8 c7 c8 ff ff       	call   801016a0 <ilock>

  if(ip->nlink < 1)
80104dd9:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
80104dde:	0f 8e 1f 01 00 00    	jle    80104f03 <sys_unlink+0x1d3>
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
80104de4:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80104de9:	74 7d                	je     80104e68 <sys_unlink+0x138>
    iunlockput(ip);
    goto bad;
  }

  memset(&de, 0, sizeof(de));
80104deb:	8d 5d b2             	lea    -0x4e(%ebp),%ebx
80104dee:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
80104df5:	00 
80104df6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80104dfd:	00 
80104dfe:	89 1c 24             	mov    %ebx,(%esp)
80104e01:	e8 3a f5 ff ff       	call   80104340 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80104e06:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80104e09:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80104e10:	00 
80104e11:	89 5c 24 04          	mov    %ebx,0x4(%esp)
80104e15:	89 44 24 08          	mov    %eax,0x8(%esp)
80104e19:	8b 45 a4             	mov    -0x5c(%ebp),%eax
80104e1c:	89 04 24             	mov    %eax,(%esp)
80104e1f:	e8 8c cc ff ff       	call   80101ab0 <writei>
80104e24:	83 f8 10             	cmp    $0x10,%eax
80104e27:	0f 85 e2 00 00 00    	jne    80104f0f <sys_unlink+0x1df>
    panic("unlink: writei");
  if(ip->type == T_DIR){
80104e2d:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80104e32:	0f 84 a0 00 00 00    	je     80104ed8 <sys_unlink+0x1a8>
    dp->nlink--;
    iupdate(dp);
  }
  iunlockput(dp);
80104e38:	8b 45 a4             	mov    -0x5c(%ebp),%eax
80104e3b:	89 04 24             	mov    %eax,(%esp)
80104e3e:	e8 ed ca ff ff       	call   80101930 <iunlockput>

  ip->nlink--;
80104e43:	66 83 6e 56 01       	subw   $0x1,0x56(%esi)
  iupdate(ip);
80104e48:	89 34 24             	mov    %esi,(%esp)
80104e4b:	e8 90 c7 ff ff       	call   801015e0 <iupdate>
  iunlockput(ip);
80104e50:	89 34 24             	mov    %esi,(%esp)
80104e53:	e8 d8 ca ff ff       	call   80101930 <iunlockput>

  end_op();
80104e58:	e8 83 dd ff ff       	call   80102be0 <end_op>

  return 0;
80104e5d:	31 c0                	xor    %eax,%eax

bad:
  iunlockput(dp);
  end_op();
  return -1;
}
80104e5f:	83 c4 6c             	add    $0x6c,%esp
80104e62:	5b                   	pop    %ebx
80104e63:	5e                   	pop    %esi
80104e64:	5f                   	pop    %edi
80104e65:	5d                   	pop    %ebp
80104e66:	c3                   	ret    
80104e67:	90                   	nop
isdirempty(struct inode *dp)
{
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80104e68:	83 7e 58 20          	cmpl   $0x20,0x58(%esi)
80104e6c:	0f 86 79 ff ff ff    	jbe    80104deb <sys_unlink+0xbb>
80104e72:	bb 20 00 00 00       	mov    $0x20,%ebx
80104e77:	8d 7d c2             	lea    -0x3e(%ebp),%edi
80104e7a:	eb 10                	jmp    80104e8c <sys_unlink+0x15c>
80104e7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104e80:	83 c3 10             	add    $0x10,%ebx
80104e83:	3b 5e 58             	cmp    0x58(%esi),%ebx
80104e86:	0f 83 5f ff ff ff    	jae    80104deb <sys_unlink+0xbb>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80104e8c:	c7 44 24 0c 10 00 00 	movl   $0x10,0xc(%esp)
80104e93:	00 
80104e94:	89 5c 24 08          	mov    %ebx,0x8(%esp)
80104e98:	89 7c 24 04          	mov    %edi,0x4(%esp)
80104e9c:	89 34 24             	mov    %esi,(%esp)
80104e9f:	e8 dc ca ff ff       	call   80101980 <readi>
80104ea4:	83 f8 10             	cmp    $0x10,%eax
80104ea7:	75 4e                	jne    80104ef7 <sys_unlink+0x1c7>
      panic("isdirempty: readi");
    if(de.inum != 0)
80104ea9:	66 83 7d c2 00       	cmpw   $0x0,-0x3e(%ebp)
80104eae:	74 d0                	je     80104e80 <sys_unlink+0x150>
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
    iunlockput(ip);
80104eb0:	89 34 24             	mov    %esi,(%esp)
80104eb3:	e8 78 ca ff ff       	call   80101930 <iunlockput>
  end_op();

  return 0;

bad:
  iunlockput(dp);
80104eb8:	8b 45 a4             	mov    -0x5c(%ebp),%eax
80104ebb:	89 04 24             	mov    %eax,(%esp)
80104ebe:	e8 6d ca ff ff       	call   80101930 <iunlockput>
  end_op();
80104ec3:	e8 18 dd ff ff       	call   80102be0 <end_op>
  return -1;
}
80104ec8:	83 c4 6c             	add    $0x6c,%esp
  return 0;

bad:
  iunlockput(dp);
  end_op();
  return -1;
80104ecb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104ed0:	5b                   	pop    %ebx
80104ed1:	5e                   	pop    %esi
80104ed2:	5f                   	pop    %edi
80104ed3:	5d                   	pop    %ebp
80104ed4:	c3                   	ret    
80104ed5:	8d 76 00             	lea    0x0(%esi),%esi

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
80104ed8:	8b 45 a4             	mov    -0x5c(%ebp),%eax
80104edb:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
    iupdate(dp);
80104ee0:	89 04 24             	mov    %eax,(%esp)
80104ee3:	e8 f8 c6 ff ff       	call   801015e0 <iupdate>
80104ee8:	e9 4b ff ff ff       	jmp    80104e38 <sys_unlink+0x108>
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
    return -1;
80104eed:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ef2:	e9 68 ff ff ff       	jmp    80104e5f <sys_unlink+0x12f>
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("isdirempty: readi");
80104ef7:	c7 04 24 98 74 10 80 	movl   $0x80107498,(%esp)
80104efe:	e8 6d b4 ff ff       	call   80100370 <panic>
  if((ip = dirlookup(dp, name, &off)) == 0)
    goto bad;
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
80104f03:	c7 04 24 86 74 10 80 	movl   $0x80107486,(%esp)
80104f0a:	e8 61 b4 ff ff       	call   80100370 <panic>
    goto bad;
  }

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
80104f0f:	c7 04 24 aa 74 10 80 	movl   $0x801074aa,(%esp)
80104f16:	e8 55 b4 ff ff       	call   80100370 <panic>
80104f1b:	90                   	nop
80104f1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104f20 <sys_open>:
  return ip;
}

int
sys_open(void)
{
80104f20:	55                   	push   %ebp
80104f21:	89 e5                	mov    %esp,%ebp
80104f23:	57                   	push   %edi
80104f24:	56                   	push   %esi
80104f25:	53                   	push   %ebx
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
    return -1;
80104f26:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  return ip;
}

int
sys_open(void)
{
80104f2b:	83 ec 2c             	sub    $0x2c,%esp
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80104f2e:	8d 45 e0             	lea    -0x20(%ebp),%eax
80104f31:	89 44 24 04          	mov    %eax,0x4(%esp)
80104f35:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104f3c:	e8 9f f7 ff ff       	call   801046e0 <argstr>
80104f41:	85 c0                	test   %eax,%eax
80104f43:	0f 88 8c 00 00 00    	js     80104fd5 <sys_open+0xb5>
80104f49:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80104f4c:	89 44 24 04          	mov    %eax,0x4(%esp)
80104f50:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80104f57:	e8 e4 f6 ff ff       	call   80104640 <argint>
80104f5c:	85 c0                	test   %eax,%eax
80104f5e:	78 75                	js     80104fd5 <sys_open+0xb5>
    return -1;

  begin_op();
80104f60:	e8 0b dc ff ff       	call   80102b70 <begin_op>

  if(omode & O_CREATE){
80104f65:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80104f69:	75 75                	jne    80104fe0 <sys_open+0xc0>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
80104f6b:	8b 45 e0             	mov    -0x20(%ebp),%eax
80104f6e:	89 04 24             	mov    %eax,(%esp)
80104f71:	e8 fa cf ff ff       	call   80101f70 <namei>
80104f76:	85 c0                	test   %eax,%eax
80104f78:	89 c7                	mov    %eax,%edi
80104f7a:	0f 84 8f 00 00 00    	je     8010500f <sys_open+0xef>
      end_op();
      return -1;
    }
    ilock(ip);
80104f80:	89 04 24             	mov    %eax,(%esp)
80104f83:	e8 18 c7 ff ff       	call   801016a0 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
80104f88:	66 83 7f 50 01       	cmpw   $0x1,0x50(%edi)
80104f8d:	74 71                	je     80105000 <sys_open+0xe0>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
80104f8f:	e8 cc bd ff ff       	call   80100d60 <filealloc>
80104f94:	85 c0                	test   %eax,%eax
80104f96:	89 c6                	mov    %eax,%esi
80104f98:	0f 84 87 00 00 00    	je     80105025 <sys_open+0x105>
80104f9e:	e8 fd f7 ff ff       	call   801047a0 <fdalloc>
80104fa3:	85 c0                	test   %eax,%eax
80104fa5:	89 c3                	mov    %eax,%ebx
80104fa7:	78 6f                	js     80105018 <sys_open+0xf8>
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80104fa9:	89 3c 24             	mov    %edi,(%esp)
80104fac:	e8 cf c7 ff ff       	call   80101780 <iunlock>
  end_op();
80104fb1:	e8 2a dc ff ff       	call   80102be0 <end_op>

  f->type = FD_INODE;
80104fb6:	c7 06 02 00 00 00    	movl   $0x2,(%esi)
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
80104fbc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  }
  iunlock(ip);
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
80104fbf:	89 7e 10             	mov    %edi,0x10(%esi)
  f->off = 0;
80104fc2:	c7 46 14 00 00 00 00 	movl   $0x0,0x14(%esi)
  f->readable = !(omode & O_WRONLY);
80104fc9:	a8 01                	test   $0x1,%al
80104fcb:	0f 94 46 08          	sete   0x8(%esi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80104fcf:	a8 03                	test   $0x3,%al
80104fd1:	0f 95 46 09          	setne  0x9(%esi)
  return fd;
}
80104fd5:	83 c4 2c             	add    $0x2c,%esp
80104fd8:	89 d8                	mov    %ebx,%eax
80104fda:	5b                   	pop    %ebx
80104fdb:	5e                   	pop    %esi
80104fdc:	5f                   	pop    %edi
80104fdd:	5d                   	pop    %ebp
80104fde:	c3                   	ret    
80104fdf:	90                   	nop
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
80104fe0:	8b 45 e0             	mov    -0x20(%ebp),%eax
80104fe3:	31 c9                	xor    %ecx,%ecx
80104fe5:	ba 02 00 00 00       	mov    $0x2,%edx
80104fea:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80104ff1:	e8 ea f7 ff ff       	call   801047e0 <create>
    if(ip == 0){
80104ff6:	85 c0                	test   %eax,%eax
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
80104ff8:	89 c7                	mov    %eax,%edi
    if(ip == 0){
80104ffa:	75 93                	jne    80104f8f <sys_open+0x6f>
80104ffc:	eb 11                	jmp    8010500f <sys_open+0xef>
80104ffe:	66 90                	xchg   %ax,%ax
    if((ip = namei(path)) == 0){
      end_op();
      return -1;
    }
    ilock(ip);
    if(ip->type == T_DIR && omode != O_RDONLY){
80105000:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80105003:	85 f6                	test   %esi,%esi
80105005:	74 88                	je     80104f8f <sys_open+0x6f>
      iunlockput(ip);
80105007:	89 3c 24             	mov    %edi,(%esp)
8010500a:	e8 21 c9 ff ff       	call   80101930 <iunlockput>
      end_op();
8010500f:	e8 cc db ff ff       	call   80102be0 <end_op>
      return -1;
80105014:	eb bf                	jmp    80104fd5 <sys_open+0xb5>
80105016:	66 90                	xchg   %ax,%ax
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
80105018:	89 34 24             	mov    %esi,(%esp)
8010501b:	90                   	nop
8010501c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105020:	e8 fb bd ff ff       	call   80100e20 <fileclose>
    iunlockput(ip);
80105025:	89 3c 24             	mov    %edi,(%esp)
    end_op();
    return -1;
80105028:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
    iunlockput(ip);
8010502d:	e8 fe c8 ff ff       	call   80101930 <iunlockput>
    end_op();
80105032:	e8 a9 db ff ff       	call   80102be0 <end_op>
    return -1;
80105037:	eb 9c                	jmp    80104fd5 <sys_open+0xb5>
80105039:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105040 <sys_mkdir>:
  return fd;
}

int
sys_mkdir(void)
{
80105040:	55                   	push   %ebp
80105041:	89 e5                	mov    %esp,%ebp
80105043:	83 ec 28             	sub    $0x28,%esp
  char *path;
  struct inode *ip;

  begin_op();
80105046:	e8 25 db ff ff       	call   80102b70 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
8010504b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010504e:	89 44 24 04          	mov    %eax,0x4(%esp)
80105052:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105059:	e8 82 f6 ff ff       	call   801046e0 <argstr>
8010505e:	85 c0                	test   %eax,%eax
80105060:	78 2e                	js     80105090 <sys_mkdir+0x50>
80105062:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105065:	31 c9                	xor    %ecx,%ecx
80105067:	ba 01 00 00 00       	mov    $0x1,%edx
8010506c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105073:	e8 68 f7 ff ff       	call   801047e0 <create>
80105078:	85 c0                	test   %eax,%eax
8010507a:	74 14                	je     80105090 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
8010507c:	89 04 24             	mov    %eax,(%esp)
8010507f:	e8 ac c8 ff ff       	call   80101930 <iunlockput>
  end_op();
80105084:	e8 57 db ff ff       	call   80102be0 <end_op>
  return 0;
80105089:	31 c0                	xor    %eax,%eax
}
8010508b:	c9                   	leave  
8010508c:	c3                   	ret    
8010508d:	8d 76 00             	lea    0x0(%esi),%esi
  char *path;
  struct inode *ip;

  begin_op();
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    end_op();
80105090:	e8 4b db ff ff       	call   80102be0 <end_op>
    return -1;
80105095:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
8010509a:	c9                   	leave  
8010509b:	c3                   	ret    
8010509c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801050a0 <sys_mknod>:

int
sys_mknod(void)
{
801050a0:	55                   	push   %ebp
801050a1:	89 e5                	mov    %esp,%ebp
801050a3:	83 ec 28             	sub    $0x28,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
801050a6:	e8 c5 da ff ff       	call   80102b70 <begin_op>
  if((argstr(0, &path)) < 0 ||
801050ab:	8d 45 ec             	lea    -0x14(%ebp),%eax
801050ae:	89 44 24 04          	mov    %eax,0x4(%esp)
801050b2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801050b9:	e8 22 f6 ff ff       	call   801046e0 <argstr>
801050be:	85 c0                	test   %eax,%eax
801050c0:	78 5e                	js     80105120 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
801050c2:	8d 45 f0             	lea    -0x10(%ebp),%eax
801050c5:	89 44 24 04          	mov    %eax,0x4(%esp)
801050c9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801050d0:	e8 6b f5 ff ff       	call   80104640 <argint>
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
801050d5:	85 c0                	test   %eax,%eax
801050d7:	78 47                	js     80105120 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
801050d9:	8d 45 f4             	lea    -0xc(%ebp),%eax
801050dc:	89 44 24 04          	mov    %eax,0x4(%esp)
801050e0:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
801050e7:	e8 54 f5 ff ff       	call   80104640 <argint>
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
801050ec:	85 c0                	test   %eax,%eax
801050ee:	78 30                	js     80105120 <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0){
801050f0:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
801050f4:	ba 03 00 00 00       	mov    $0x3,%edx
     (ip = create(path, T_DEV, major, minor)) == 0){
801050f9:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
801050fd:	89 04 24             	mov    %eax,(%esp)
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
80105100:	8b 45 ec             	mov    -0x14(%ebp),%eax
80105103:	e8 d8 f6 ff ff       	call   801047e0 <create>
80105108:	85 c0                	test   %eax,%eax
8010510a:	74 14                	je     80105120 <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
    return -1;
  }
  iunlockput(ip);
8010510c:	89 04 24             	mov    %eax,(%esp)
8010510f:	e8 1c c8 ff ff       	call   80101930 <iunlockput>
  end_op();
80105114:	e8 c7 da ff ff       	call   80102be0 <end_op>
  return 0;
80105119:	31 c0                	xor    %eax,%eax
}
8010511b:	c9                   	leave  
8010511c:	c3                   	ret    
8010511d:	8d 76 00             	lea    0x0(%esi),%esi
  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
80105120:	e8 bb da ff ff       	call   80102be0 <end_op>
    return -1;
80105125:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
8010512a:	c9                   	leave  
8010512b:	c3                   	ret    
8010512c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105130 <sys_chdir>:

int
sys_chdir(void)
{
80105130:	55                   	push   %ebp
80105131:	89 e5                	mov    %esp,%ebp
80105133:	56                   	push   %esi
80105134:	53                   	push   %ebx
80105135:	83 ec 20             	sub    $0x20,%esp
  char *path;
  struct inode *ip;
  struct proc *curproc = myproc();
80105138:	e8 f3 e5 ff ff       	call   80103730 <myproc>
8010513d:	89 c3                	mov    %eax,%ebx
  
  begin_op();
8010513f:	e8 2c da ff ff       	call   80102b70 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
80105144:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105147:	89 44 24 04          	mov    %eax,0x4(%esp)
8010514b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105152:	e8 89 f5 ff ff       	call   801046e0 <argstr>
80105157:	85 c0                	test   %eax,%eax
80105159:	78 4a                	js     801051a5 <sys_chdir+0x75>
8010515b:	8b 45 f4             	mov    -0xc(%ebp),%eax
8010515e:	89 04 24             	mov    %eax,(%esp)
80105161:	e8 0a ce ff ff       	call   80101f70 <namei>
80105166:	85 c0                	test   %eax,%eax
80105168:	89 c6                	mov    %eax,%esi
8010516a:	74 39                	je     801051a5 <sys_chdir+0x75>
    end_op();
    return -1;
  }
  ilock(ip);
8010516c:	89 04 24             	mov    %eax,(%esp)
8010516f:	e8 2c c5 ff ff       	call   801016a0 <ilock>
  if(ip->type != T_DIR){
80105174:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
    iunlockput(ip);
80105179:	89 34 24             	mov    %esi,(%esp)
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
    end_op();
    return -1;
  }
  ilock(ip);
  if(ip->type != T_DIR){
8010517c:	75 22                	jne    801051a0 <sys_chdir+0x70>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
8010517e:	e8 fd c5 ff ff       	call   80101780 <iunlock>
  iput(curproc->cwd);
80105183:	8b 43 68             	mov    0x68(%ebx),%eax
80105186:	89 04 24             	mov    %eax,(%esp)
80105189:	e8 42 c6 ff ff       	call   801017d0 <iput>
  end_op();
8010518e:	e8 4d da ff ff       	call   80102be0 <end_op>
  curproc->cwd = ip;
  return 0;
80105193:	31 c0                	xor    %eax,%eax
    return -1;
  }
  iunlock(ip);
  iput(curproc->cwd);
  end_op();
  curproc->cwd = ip;
80105195:	89 73 68             	mov    %esi,0x68(%ebx)
  return 0;
}
80105198:	83 c4 20             	add    $0x20,%esp
8010519b:	5b                   	pop    %ebx
8010519c:	5e                   	pop    %esi
8010519d:	5d                   	pop    %ebp
8010519e:	c3                   	ret    
8010519f:	90                   	nop
    end_op();
    return -1;
  }
  ilock(ip);
  if(ip->type != T_DIR){
    iunlockput(ip);
801051a0:	e8 8b c7 ff ff       	call   80101930 <iunlockput>
    end_op();
801051a5:	e8 36 da ff ff       	call   80102be0 <end_op>
  iunlock(ip);
  iput(curproc->cwd);
  end_op();
  curproc->cwd = ip;
  return 0;
}
801051aa:	83 c4 20             	add    $0x20,%esp
  }
  ilock(ip);
  if(ip->type != T_DIR){
    iunlockput(ip);
    end_op();
    return -1;
801051ad:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  iunlock(ip);
  iput(curproc->cwd);
  end_op();
  curproc->cwd = ip;
  return 0;
}
801051b2:	5b                   	pop    %ebx
801051b3:	5e                   	pop    %esi
801051b4:	5d                   	pop    %ebp
801051b5:	c3                   	ret    
801051b6:	8d 76 00             	lea    0x0(%esi),%esi
801051b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801051c0 <sys_exec>:

int
sys_exec(void)
{
801051c0:	55                   	push   %ebp
801051c1:	89 e5                	mov    %esp,%ebp
801051c3:	57                   	push   %edi
801051c4:	56                   	push   %esi
801051c5:	53                   	push   %ebx
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
801051c6:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  return 0;
}

int
sys_exec(void)
{
801051cb:	81 ec ac 00 00 00    	sub    $0xac,%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
801051d1:	8d 45 dc             	lea    -0x24(%ebp),%eax
801051d4:	89 44 24 04          	mov    %eax,0x4(%esp)
801051d8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801051df:	e8 fc f4 ff ff       	call   801046e0 <argstr>
801051e4:	85 c0                	test   %eax,%eax
801051e6:	0f 88 82 00 00 00    	js     8010526e <sys_exec+0xae>
801051ec:	8d 45 e0             	lea    -0x20(%ebp),%eax
801051ef:	89 44 24 04          	mov    %eax,0x4(%esp)
801051f3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801051fa:	e8 41 f4 ff ff       	call   80104640 <argint>
801051ff:	85 c0                	test   %eax,%eax
80105201:	78 6b                	js     8010526e <sys_exec+0xae>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
80105203:	8d bd 5c ff ff ff    	lea    -0xa4(%ebp),%edi
  for(i=0;; i++){
    if(i >= NELEM(argv))
80105209:	31 f6                	xor    %esi,%esi
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
8010520b:	c7 44 24 08 80 00 00 	movl   $0x80,0x8(%esp)
80105212:	00 
  for(i=0;; i++){
80105213:	31 db                	xor    %ebx,%ebx
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
80105215:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
8010521c:	00 
8010521d:	89 3c 24             	mov    %edi,(%esp)
80105220:	e8 1b f1 ff ff       	call   80104340 <memset>
80105225:	8d 76 00             	lea    0x0(%esi),%esi
  for(i=0;; i++){
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
80105228:	8d 45 e4             	lea    -0x1c(%ebp),%eax
8010522b:	89 44 24 04          	mov    %eax,0x4(%esp)
  curproc->cwd = ip;
  return 0;
}

int
sys_exec(void)
8010522f:	8d 04 9d 00 00 00 00 	lea    0x0(,%ebx,4),%eax
  }
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
80105236:	03 45 e0             	add    -0x20(%ebp),%eax
80105239:	89 04 24             	mov    %eax,(%esp)
8010523c:	e8 6f f3 ff ff       	call   801045b0 <fetchint>
80105241:	85 c0                	test   %eax,%eax
80105243:	78 24                	js     80105269 <sys_exec+0xa9>
      return -1;
    if(uarg == 0){
80105245:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80105248:	85 c0                	test   %eax,%eax
8010524a:	74 34                	je     80105280 <sys_exec+0xc0>
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
8010524c:	8d 14 b7             	lea    (%edi,%esi,4),%edx
8010524f:	89 54 24 04          	mov    %edx,0x4(%esp)
80105253:	89 04 24             	mov    %eax,(%esp)
80105256:	e8 85 f3 ff ff       	call   801045e0 <fetchstr>
8010525b:	85 c0                	test   %eax,%eax
8010525d:	78 0a                	js     80105269 <sys_exec+0xa9>

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
8010525f:	83 c3 01             	add    $0x1,%ebx
    if(i >= NELEM(argv))
80105262:	83 fb 20             	cmp    $0x20,%ebx
80105265:	89 de                	mov    %ebx,%esi
80105267:	75 bf                	jne    80105228 <sys_exec+0x68>
    if(uarg == 0){
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
80105269:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  }
  return exec(path, argv);
}
8010526e:	81 c4 ac 00 00 00    	add    $0xac,%esp
80105274:	89 d8                	mov    %ebx,%eax
80105276:	5b                   	pop    %ebx
80105277:	5e                   	pop    %esi
80105278:	5f                   	pop    %edi
80105279:	5d                   	pop    %ebp
8010527a:	c3                   	ret    
8010527b:	90                   	nop
8010527c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
80105280:	8b 45 dc             	mov    -0x24(%ebp),%eax
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
      return -1;
    if(uarg == 0){
      argv[i] = 0;
80105283:	c7 84 9d 5c ff ff ff 	movl   $0x0,-0xa4(%ebp,%ebx,4)
8010528a:	00 00 00 00 
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
8010528e:	89 7c 24 04          	mov    %edi,0x4(%esp)
80105292:	89 04 24             	mov    %eax,(%esp)
80105295:	e8 16 b7 ff ff       	call   801009b0 <exec>
}
8010529a:	81 c4 ac 00 00 00    	add    $0xac,%esp
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
801052a0:	89 c3                	mov    %eax,%ebx
}
801052a2:	89 d8                	mov    %ebx,%eax
801052a4:	5b                   	pop    %ebx
801052a5:	5e                   	pop    %esi
801052a6:	5f                   	pop    %edi
801052a7:	5d                   	pop    %ebp
801052a8:	c3                   	ret    
801052a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801052b0 <sys_pipe>:

int
sys_pipe(void)
{
801052b0:	55                   	push   %ebp
801052b1:	89 e5                	mov    %esp,%ebp
801052b3:	53                   	push   %ebx
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
    return -1;
801052b4:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  return exec(path, argv);
}

int
sys_pipe(void)
{
801052b9:	83 ec 24             	sub    $0x24,%esp
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
801052bc:	8d 45 ec             	lea    -0x14(%ebp),%eax
801052bf:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
801052c6:	00 
801052c7:	89 44 24 04          	mov    %eax,0x4(%esp)
801052cb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801052d2:	e8 a9 f3 ff ff       	call   80104680 <argptr>
801052d7:	85 c0                	test   %eax,%eax
801052d9:	78 3d                	js     80105318 <sys_pipe+0x68>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
801052db:	8d 45 f4             	lea    -0xc(%ebp),%eax
801052de:	89 44 24 04          	mov    %eax,0x4(%esp)
801052e2:	8d 45 f0             	lea    -0x10(%ebp),%eax
801052e5:	89 04 24             	mov    %eax,(%esp)
801052e8:	e8 e3 de ff ff       	call   801031d0 <pipealloc>
801052ed:	85 c0                	test   %eax,%eax
801052ef:	78 27                	js     80105318 <sys_pipe+0x68>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
801052f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
801052f4:	e8 a7 f4 ff ff       	call   801047a0 <fdalloc>
801052f9:	85 c0                	test   %eax,%eax
801052fb:	89 c3                	mov    %eax,%ebx
801052fd:	78 2e                	js     8010532d <sys_pipe+0x7d>
801052ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105302:	e8 99 f4 ff ff       	call   801047a0 <fdalloc>
80105307:	85 c0                	test   %eax,%eax
80105309:	78 15                	js     80105320 <sys_pipe+0x70>
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
8010530b:	8b 55 ec             	mov    -0x14(%ebp),%edx
8010530e:	89 1a                	mov    %ebx,(%edx)
  fd[1] = fd1;
80105310:	8b 55 ec             	mov    -0x14(%ebp),%edx
  return 0;
80105313:	31 db                	xor    %ebx,%ebx
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
  fd[1] = fd1;
80105315:	89 42 04             	mov    %eax,0x4(%edx)
  return 0;
}
80105318:	83 c4 24             	add    $0x24,%esp
8010531b:	89 d8                	mov    %ebx,%eax
8010531d:	5b                   	pop    %ebx
8010531e:	5d                   	pop    %ebp
8010531f:	c3                   	ret    
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      myproc()->ofile[fd0] = 0;
80105320:	e8 0b e4 ff ff       	call   80103730 <myproc>
80105325:	c7 44 98 28 00 00 00 	movl   $0x0,0x28(%eax,%ebx,4)
8010532c:	00 
    fileclose(rf);
8010532d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    fileclose(wf);
    return -1;
80105330:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
80105335:	89 04 24             	mov    %eax,(%esp)
80105338:	e8 e3 ba ff ff       	call   80100e20 <fileclose>
    fileclose(wf);
8010533d:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105340:	89 04 24             	mov    %eax,(%esp)
80105343:	e8 d8 ba ff ff       	call   80100e20 <fileclose>
    return -1;
80105348:	eb ce                	jmp    80105318 <sys_pipe+0x68>
8010534a:	00 00                	add    %al,(%eax)
8010534c:	00 00                	add    %al,(%eax)
	...

80105350 <sys_fork>:
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
80105350:	55                   	push   %ebp
80105351:	89 e5                	mov    %esp,%ebp
  return fork();
}
80105353:	5d                   	pop    %ebp
#include "proc.h"

int
sys_fork(void)
{
  return fork();
80105354:	e9 87 e5 ff ff       	jmp    801038e0 <fork>
80105359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105360 <sys_exit>:
}

int
sys_exit(void)
{
80105360:	55                   	push   %ebp
80105361:	89 e5                	mov    %esp,%ebp
80105363:	83 ec 08             	sub    $0x8,%esp
  exit();
80105366:	e8 c5 e7 ff ff       	call   80103b30 <exit>
  return 0;  // not reached
}
8010536b:	31 c0                	xor    %eax,%eax
8010536d:	c9                   	leave  
8010536e:	c3                   	ret    
8010536f:	90                   	nop

80105370 <sys_wait>:

int
sys_wait(void)
{
80105370:	55                   	push   %ebp
80105371:	89 e5                	mov    %esp,%ebp
  return wait();
}
80105373:	5d                   	pop    %ebp
}

int
sys_wait(void)
{
  return wait();
80105374:	e9 d7 e9 ff ff       	jmp    80103d50 <wait>
80105379:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105380 <sys_kill>:
}

int
sys_kill(void)
{
80105380:	55                   	push   %ebp
80105381:	89 e5                	mov    %esp,%ebp
80105383:	83 ec 28             	sub    $0x28,%esp
  int pid;

  if(argint(0, &pid) < 0)
80105386:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105389:	89 44 24 04          	mov    %eax,0x4(%esp)
8010538d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105394:	e8 a7 f2 ff ff       	call   80104640 <argint>
80105399:	89 c2                	mov    %eax,%edx
    return -1;
8010539b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
801053a0:	85 d2                	test   %edx,%edx
801053a2:	78 0b                	js     801053af <sys_kill+0x2f>
    return -1;
  return kill(pid);
801053a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
801053a7:	89 04 24             	mov    %eax,(%esp)
801053aa:	e8 e1 ea ff ff       	call   80103e90 <kill>
}
801053af:	c9                   	leave  
801053b0:	c3                   	ret    
801053b1:	eb 0d                	jmp    801053c0 <sys_getpid>
801053b3:	90                   	nop
801053b4:	90                   	nop
801053b5:	90                   	nop
801053b6:	90                   	nop
801053b7:	90                   	nop
801053b8:	90                   	nop
801053b9:	90                   	nop
801053ba:	90                   	nop
801053bb:	90                   	nop
801053bc:	90                   	nop
801053bd:	90                   	nop
801053be:	90                   	nop
801053bf:	90                   	nop

801053c0 <sys_getpid>:

int
sys_getpid(void)
{
801053c0:	55                   	push   %ebp
801053c1:	89 e5                	mov    %esp,%ebp
801053c3:	83 ec 08             	sub    $0x8,%esp
  return myproc()->pid;
801053c6:	e8 65 e3 ff ff       	call   80103730 <myproc>
801053cb:	8b 40 10             	mov    0x10(%eax),%eax
}
801053ce:	c9                   	leave  
801053cf:	c3                   	ret    

801053d0 <sys_sbrk>:

int
sys_sbrk(void)
{
801053d0:	55                   	push   %ebp
801053d1:	89 e5                	mov    %esp,%ebp
801053d3:	83 ec 28             	sub    $0x28,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
801053d6:	8d 45 f4             	lea    -0xc(%ebp),%eax
  return myproc()->pid;
}

int
sys_sbrk(void)
{
801053d9:	89 5d f8             	mov    %ebx,-0x8(%ebp)
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
801053dc:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
  return myproc()->pid;
}

int
sys_sbrk(void)
{
801053e1:	89 75 fc             	mov    %esi,-0x4(%ebp)
  int addr;
  int n;

  if(argint(0, &n) < 0)
801053e4:	89 44 24 04          	mov    %eax,0x4(%esp)
801053e8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
801053ef:	e8 4c f2 ff ff       	call   80104640 <argint>
801053f4:	85 c0                	test   %eax,%eax
801053f6:	78 17                	js     8010540f <sys_sbrk+0x3f>
    return -1;
  addr = myproc()->sz;
801053f8:	e8 33 e3 ff ff       	call   80103730 <myproc>
801053fd:	8b 30                	mov    (%eax),%esi
  if(growproc(n) < 0)
801053ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105402:	89 04 24             	mov    %eax,(%esp)
80105405:	e8 56 e4 ff ff       	call   80103860 <growproc>
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
8010540a:	85 c0                	test   %eax,%eax
8010540c:	0f 49 de             	cmovns %esi,%ebx
  if(growproc(n) < 0)
    return -1;
  return addr;
}
8010540f:	89 d8                	mov    %ebx,%eax
80105411:	8b 75 fc             	mov    -0x4(%ebp),%esi
80105414:	8b 5d f8             	mov    -0x8(%ebp),%ebx
80105417:	89 ec                	mov    %ebp,%esp
80105419:	5d                   	pop    %ebp
8010541a:	c3                   	ret    
8010541b:	90                   	nop
8010541c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105420 <sys_sleep>:

int
sys_sleep(void)
{
80105420:	55                   	push   %ebp
80105421:	89 e5                	mov    %esp,%ebp
80105423:	53                   	push   %ebx
80105424:	83 ec 24             	sub    $0x24,%esp
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
80105427:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010542a:	89 44 24 04          	mov    %eax,0x4(%esp)
8010542e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
80105435:	e8 06 f2 ff ff       	call   80104640 <argint>
    return -1;
8010543a:	ba ff ff ff ff       	mov    $0xffffffff,%edx
sys_sleep(void)
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
8010543f:	85 c0                	test   %eax,%eax
80105441:	78 5a                	js     8010549d <sys_sleep+0x7d>
    return -1;
  acquire(&tickslock);
80105443:	c7 04 24 60 4c 11 80 	movl   $0x80114c60,(%esp)
8010544a:	e8 31 ee ff ff       	call   80104280 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
8010544f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
80105452:	8b 1d a0 54 11 80    	mov    0x801154a0,%ebx
  while(ticks - ticks0 < n){
80105458:	85 d2                	test   %edx,%edx
8010545a:	75 24                	jne    80105480 <sys_sleep+0x60>
8010545c:	eb 4a                	jmp    801054a8 <sys_sleep+0x88>
8010545e:	66 90                	xchg   %ax,%ax
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
80105460:	c7 44 24 04 60 4c 11 	movl   $0x80114c60,0x4(%esp)
80105467:	80 
80105468:	c7 04 24 a0 54 11 80 	movl   $0x801154a0,(%esp)
8010546f:	e8 1c e8 ff ff       	call   80103c90 <sleep>

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
80105474:	a1 a0 54 11 80       	mov    0x801154a0,%eax
80105479:	29 d8                	sub    %ebx,%eax
8010547b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
8010547e:	73 28                	jae    801054a8 <sys_sleep+0x88>
    if(myproc()->killed){
80105480:	e8 ab e2 ff ff       	call   80103730 <myproc>
80105485:	8b 40 24             	mov    0x24(%eax),%eax
80105488:	85 c0                	test   %eax,%eax
8010548a:	74 d4                	je     80105460 <sys_sleep+0x40>
      release(&tickslock);
8010548c:	c7 04 24 60 4c 11 80 	movl   $0x80114c60,(%esp)
80105493:	e8 58 ee ff ff       	call   801042f0 <release>
      return -1;
80105498:	ba ff ff ff ff       	mov    $0xffffffff,%edx
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}
8010549d:	83 c4 24             	add    $0x24,%esp
801054a0:	89 d0                	mov    %edx,%eax
801054a2:	5b                   	pop    %ebx
801054a3:	5d                   	pop    %ebp
801054a4:	c3                   	ret    
801054a5:	8d 76 00             	lea    0x0(%esi),%esi
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
801054a8:	c7 04 24 60 4c 11 80 	movl   $0x80114c60,(%esp)
801054af:	e8 3c ee ff ff       	call   801042f0 <release>
  return 0;
}
801054b4:	83 c4 24             	add    $0x24,%esp
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
801054b7:	31 d2                	xor    %edx,%edx
}
801054b9:	89 d0                	mov    %edx,%eax
801054bb:	5b                   	pop    %ebx
801054bc:	5d                   	pop    %ebp
801054bd:	c3                   	ret    
801054be:	66 90                	xchg   %ax,%ax

801054c0 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
801054c0:	55                   	push   %ebp
801054c1:	89 e5                	mov    %esp,%ebp
801054c3:	53                   	push   %ebx
801054c4:	83 ec 14             	sub    $0x14,%esp
  uint xticks;

  acquire(&tickslock);
801054c7:	c7 04 24 60 4c 11 80 	movl   $0x80114c60,(%esp)
801054ce:	e8 ad ed ff ff       	call   80104280 <acquire>
  xticks = ticks;
801054d3:	8b 1d a0 54 11 80    	mov    0x801154a0,%ebx
  release(&tickslock);
801054d9:	c7 04 24 60 4c 11 80 	movl   $0x80114c60,(%esp)
801054e0:	e8 0b ee ff ff       	call   801042f0 <release>
  return xticks;
}
801054e5:	83 c4 14             	add    $0x14,%esp
801054e8:	89 d8                	mov    %ebx,%eax
801054ea:	5b                   	pop    %ebx
801054eb:	5d                   	pop    %ebp
801054ec:	c3                   	ret    
801054ed:	00 00                	add    %al,(%eax)
	...

801054f0 <alltraps>:

  # vectors.S sends all traps here.
.globl alltraps
alltraps:
  # Build trap frame.
  pushl %ds
801054f0:	1e                   	push   %ds
  pushl %es
801054f1:	06                   	push   %es
  pushl %fs
801054f2:	0f a0                	push   %fs
  pushl %gs
801054f4:	0f a8                	push   %gs
  pushal
801054f6:	60                   	pusha  
  
  # Set up data segments.
  movw $(SEG_KDATA<<3), %ax
801054f7:	66 b8 10 00          	mov    $0x10,%ax
  movw %ax, %ds
801054fb:	8e d8                	mov    %eax,%ds
  movw %ax, %es
801054fd:	8e c0                	mov    %eax,%es

  # Call trap(tf), where tf=%esp
  pushl %esp
801054ff:	54                   	push   %esp
  call trap
80105500:	e8 db 00 00 00       	call   801055e0 <trap>
  addl $4, %esp
80105505:	83 c4 04             	add    $0x4,%esp

80105508 <trapret>:

  # Return falls through to trapret...
.globl trapret
trapret:
  popal
80105508:	61                   	popa   
  popl %gs
80105509:	0f a9                	pop    %gs
  popl %fs
8010550b:	0f a1                	pop    %fs
  popl %es
8010550d:	07                   	pop    %es
  popl %ds
8010550e:	1f                   	pop    %ds
  addl $0x8, %esp  # trapno and errcode
8010550f:	83 c4 08             	add    $0x8,%esp
  iret
80105512:	cf                   	iret   
	...

80105520 <tvinit>:
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
80105520:	55                   	push   %ebp
  int i;

  for(i = 0; i < 256; i++)
80105521:	31 c0                	xor    %eax,%eax
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
80105523:	89 e5                	mov    %esp,%ebp
80105525:	ba a0 4c 11 80       	mov    $0x80114ca0,%edx
8010552a:	83 ec 18             	sub    $0x18,%esp
8010552d:	8d 76 00             	lea    0x0(%esi),%esi
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
80105530:	8b 0c 85 08 a0 10 80 	mov    -0x7fef5ff8(,%eax,4),%ecx
80105537:	66 89 0c c5 a0 4c 11 	mov    %cx,-0x7feeb360(,%eax,8)
8010553e:	80 
8010553f:	c1 e9 10             	shr    $0x10,%ecx
80105542:	66 c7 44 c2 02 08 00 	movw   $0x8,0x2(%edx,%eax,8)
80105549:	c6 44 c2 04 00       	movb   $0x0,0x4(%edx,%eax,8)
8010554e:	c6 44 c2 05 8e       	movb   $0x8e,0x5(%edx,%eax,8)
80105553:	66 89 4c c2 06       	mov    %cx,0x6(%edx,%eax,8)
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
80105558:	83 c0 01             	add    $0x1,%eax
8010555b:	3d 00 01 00 00       	cmp    $0x100,%eax
80105560:	75 ce                	jne    80105530 <tvinit+0x10>
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105562:	a1 08 a1 10 80       	mov    0x8010a108,%eax

  initlock(&tickslock, "time");
80105567:	c7 44 24 04 b9 74 10 	movl   $0x801074b9,0x4(%esp)
8010556e:	80 
8010556f:	c7 04 24 60 4c 11 80 	movl   $0x80114c60,(%esp)
{
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105576:	66 c7 05 a2 4e 11 80 	movw   $0x8,0x80114ea2
8010557d:	08 00 
8010557f:	66 a3 a0 4e 11 80    	mov    %ax,0x80114ea0
80105585:	c1 e8 10             	shr    $0x10,%eax
80105588:	c6 05 a4 4e 11 80 00 	movb   $0x0,0x80114ea4
8010558f:	c6 05 a5 4e 11 80 ef 	movb   $0xef,0x80114ea5
80105596:	66 a3 a6 4e 11 80    	mov    %ax,0x80114ea6

  initlock(&tickslock, "time");
8010559c:	e8 6f eb ff ff       	call   80104110 <initlock>
}
801055a1:	c9                   	leave  
801055a2:	c3                   	ret    
801055a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801055a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801055b0 <idtinit>:

void
idtinit(void)
{
801055b0:	55                   	push   %ebp
lidt(struct gatedesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
  pd[1] = (uint)p;
801055b1:	b8 a0 4c 11 80       	mov    $0x80114ca0,%eax
801055b6:	89 e5                	mov    %esp,%ebp
801055b8:	83 ec 10             	sub    $0x10,%esp
static inline void
lidt(struct gatedesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
801055bb:	66 c7 45 fa ff 07    	movw   $0x7ff,-0x6(%ebp)
  pd[1] = (uint)p;
801055c1:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
801055c5:	c1 e8 10             	shr    $0x10,%eax
801055c8:	66 89 45 fe          	mov    %ax,-0x2(%ebp)

  asm volatile("lidt (%0)" : : "r" (pd));
801055cc:	8d 45 fa             	lea    -0x6(%ebp),%eax
801055cf:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
801055d2:	c9                   	leave  
801055d3:	c3                   	ret    
801055d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801055da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801055e0 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
801055e0:	55                   	push   %ebp
801055e1:	89 e5                	mov    %esp,%ebp
801055e3:	83 ec 48             	sub    $0x48,%esp
801055e6:	89 5d f4             	mov    %ebx,-0xc(%ebp)
801055e9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801055ec:	89 75 f8             	mov    %esi,-0x8(%ebp)
801055ef:	89 7d fc             	mov    %edi,-0x4(%ebp)
  if(tf->trapno == T_SYSCALL){
801055f2:	8b 43 30             	mov    0x30(%ebx),%eax
801055f5:	83 f8 40             	cmp    $0x40,%eax
801055f8:	0f 84 d2 01 00 00    	je     801057d0 <trap+0x1f0>
    if(myproc()->killed)
      exit();
    return;
  }

  switch(tf->trapno){
801055fe:	83 e8 20             	sub    $0x20,%eax
80105601:	83 f8 1f             	cmp    $0x1f,%eax
80105604:	0f 86 fe 00 00 00    	jbe    80105708 <trap+0x128>
    lapiceoi();
    break;

  //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
8010560a:	e8 21 e1 ff ff       	call   80103730 <myproc>
8010560f:	85 c0                	test   %eax,%eax
80105611:	0f 84 10 02 00 00    	je     80105827 <trap+0x247>
80105617:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
8010561b:	0f 84 06 02 00 00    	je     80105827 <trap+0x247>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
80105621:	0f 20 d2             	mov    %cr2,%edx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105624:	8b 7b 38             	mov    0x38(%ebx),%edi
80105627:	89 55 dc             	mov    %edx,-0x24(%ebp)
8010562a:	e8 e1 e0 ff ff       	call   80103710 <cpuid>
8010562f:	8b 4b 34             	mov    0x34(%ebx),%ecx
80105632:	89 c6                	mov    %eax,%esi
80105634:	8b 43 30             	mov    0x30(%ebx),%eax
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
80105637:	89 4d d8             	mov    %ecx,-0x28(%ebp)
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
8010563a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
8010563d:	e8 ee e0 ff ff       	call   80103730 <myproc>
80105642:	89 45 e0             	mov    %eax,-0x20(%ebp)
80105645:	e8 e6 e0 ff ff       	call   80103730 <myproc>
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
8010564a:	8b 55 dc             	mov    -0x24(%ebp),%edx
8010564d:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80105650:	89 7c 24 18          	mov    %edi,0x18(%esp)
80105654:	89 74 24 14          	mov    %esi,0x14(%esp)
80105658:	89 54 24 1c          	mov    %edx,0x1c(%esp)
8010565c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010565f:	89 4c 24 10          	mov    %ecx,0x10(%esp)
80105663:	89 54 24 0c          	mov    %edx,0xc(%esp)
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
80105667:	8b 55 e0             	mov    -0x20(%ebp),%edx
8010566a:	83 c2 6c             	add    $0x6c,%edx
8010566d:	89 54 24 08          	mov    %edx,0x8(%esp)
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105671:	8b 40 10             	mov    0x10(%eax),%eax
80105674:	c7 04 24 1c 75 10 80 	movl   $0x8010751c,(%esp)
8010567b:	89 44 24 04          	mov    %eax,0x4(%esp)
8010567f:	e8 cc af ff ff       	call   80100650 <cprintf>
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
            tf->err, cpuid(), tf->eip, rcr2());
    myproc()->killed = 1;
80105684:	e8 a7 e0 ff ff       	call   80103730 <myproc>
80105689:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105690:	e8 9b e0 ff ff       	call   80103730 <myproc>
80105695:	85 c0                	test   %eax,%eax
80105697:	74 1c                	je     801056b5 <trap+0xd5>
80105699:	e8 92 e0 ff ff       	call   80103730 <myproc>
8010569e:	8b 50 24             	mov    0x24(%eax),%edx
801056a1:	85 d2                	test   %edx,%edx
801056a3:	74 10                	je     801056b5 <trap+0xd5>
801056a5:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
801056a9:	83 e0 03             	and    $0x3,%eax
801056ac:	83 f8 03             	cmp    $0x3,%eax
801056af:	0f 84 5b 01 00 00    	je     80105810 <trap+0x230>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
801056b5:	e8 76 e0 ff ff       	call   80103730 <myproc>
801056ba:	85 c0                	test   %eax,%eax
801056bc:	74 11                	je     801056cf <trap+0xef>
801056be:	66 90                	xchg   %ax,%ax
801056c0:	e8 6b e0 ff ff       	call   80103730 <myproc>
801056c5:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
801056c9:	0f 84 e1 00 00 00    	je     801057b0 <trap+0x1d0>
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
801056cf:	e8 5c e0 ff ff       	call   80103730 <myproc>
801056d4:	85 c0                	test   %eax,%eax
801056d6:	74 1c                	je     801056f4 <trap+0x114>
801056d8:	e8 53 e0 ff ff       	call   80103730 <myproc>
801056dd:	8b 40 24             	mov    0x24(%eax),%eax
801056e0:	85 c0                	test   %eax,%eax
801056e2:	74 10                	je     801056f4 <trap+0x114>
801056e4:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
801056e8:	83 e0 03             	and    $0x3,%eax
801056eb:	83 f8 03             	cmp    $0x3,%eax
801056ee:	0f 84 05 01 00 00    	je     801057f9 <trap+0x219>
    exit();
}
801056f4:	8b 5d f4             	mov    -0xc(%ebp),%ebx
801056f7:	8b 75 f8             	mov    -0x8(%ebp),%esi
801056fa:	8b 7d fc             	mov    -0x4(%ebp),%edi
801056fd:	89 ec                	mov    %ebp,%esp
801056ff:	5d                   	pop    %ebp
80105700:	c3                   	ret    
80105701:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(myproc()->killed)
      exit();
    return;
  }

  switch(tf->trapno){
80105708:	ff 24 85 60 75 10 80 	jmp    *-0x7fef8aa0(,%eax,4)
8010570f:	90                   	nop
      release(&tickslock);
    }
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
80105710:	e8 db c9 ff ff       	call   801020f0 <ideintr>
    lapiceoi();
80105715:	e8 f6 cf ff ff       	call   80102710 <lapiceoi>
    break;
8010571a:	e9 71 ff ff ff       	jmp    80105690 <trap+0xb0>
8010571f:	90                   	nop
    uartintr();
    lapiceoi();
    break;
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80105720:	8b 7b 38             	mov    0x38(%ebx),%edi
80105723:	0f b7 73 3c          	movzwl 0x3c(%ebx),%esi
80105727:	e8 e4 df ff ff       	call   80103710 <cpuid>
8010572c:	c7 04 24 c4 74 10 80 	movl   $0x801074c4,(%esp)
80105733:	89 7c 24 0c          	mov    %edi,0xc(%esp)
80105737:	89 74 24 08          	mov    %esi,0x8(%esp)
8010573b:	89 44 24 04          	mov    %eax,0x4(%esp)
8010573f:	e8 0c af ff ff       	call   80100650 <cprintf>
            cpuid(), tf->cs, tf->eip);
    lapiceoi();
80105744:	e8 c7 cf ff ff       	call   80102710 <lapiceoi>
    break;
80105749:	e9 42 ff ff ff       	jmp    80105690 <trap+0xb0>
8010574e:	66 90                	xchg   %ax,%ax
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_COM1:
    uartintr();
80105750:	e8 2b 02 00 00       	call   80105980 <uartintr>
    lapiceoi();
80105755:	e8 b6 cf ff ff       	call   80102710 <lapiceoi>
    break;
8010575a:	e9 31 ff ff ff       	jmp    80105690 <trap+0xb0>
8010575f:	90                   	nop
    break;
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
80105760:	e8 7b ce ff ff       	call   801025e0 <kbdintr>
    lapiceoi();
80105765:	e8 a6 cf ff ff       	call   80102710 <lapiceoi>
    break;
8010576a:	e9 21 ff ff ff       	jmp    80105690 <trap+0xb0>
8010576f:	90                   	nop
    return;
  }

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpuid() == 0){
80105770:	e8 9b df ff ff       	call   80103710 <cpuid>
80105775:	85 c0                	test   %eax,%eax
80105777:	75 9c                	jne    80105715 <trap+0x135>
      acquire(&tickslock);
80105779:	c7 04 24 60 4c 11 80 	movl   $0x80114c60,(%esp)
80105780:	e8 fb ea ff ff       	call   80104280 <acquire>
      ticks++;
80105785:	83 05 a0 54 11 80 01 	addl   $0x1,0x801154a0
      wakeup(&ticks);
8010578c:	c7 04 24 a0 54 11 80 	movl   $0x801154a0,(%esp)
80105793:	e8 98 e6 ff ff       	call   80103e30 <wakeup>
      release(&tickslock);
80105798:	c7 04 24 60 4c 11 80 	movl   $0x80114c60,(%esp)
8010579f:	e8 4c eb ff ff       	call   801042f0 <release>
801057a4:	e9 6c ff ff ff       	jmp    80105715 <trap+0x135>
801057a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
801057b0:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
801057b4:	0f 85 15 ff ff ff    	jne    801056cf <trap+0xef>
801057ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();
801057c0:	e8 8b e4 ff ff       	call   80103c50 <yield>
801057c5:	e9 05 ff ff ff       	jmp    801056cf <trap+0xef>
801057ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(myproc()->killed)
801057d0:	e8 5b df ff ff       	call   80103730 <myproc>
801057d5:	8b 70 24             	mov    0x24(%eax),%esi
801057d8:	85 f6                	test   %esi,%esi
801057da:	75 44                	jne    80105820 <trap+0x240>
      exit();
    myproc()->tf = tf;
801057dc:	e8 4f df ff ff       	call   80103730 <myproc>
801057e1:	89 58 18             	mov    %ebx,0x18(%eax)
    syscall();
801057e4:	e8 37 ef ff ff       	call   80104720 <syscall>
    if(myproc()->killed)
801057e9:	e8 42 df ff ff       	call   80103730 <myproc>
801057ee:	8b 48 24             	mov    0x24(%eax),%ecx
801057f1:	85 c9                	test   %ecx,%ecx
801057f3:	0f 84 fb fe ff ff    	je     801056f4 <trap+0x114>
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
    exit();
}
801057f9:	8b 5d f4             	mov    -0xc(%ebp),%ebx
801057fc:	8b 75 f8             	mov    -0x8(%ebp),%esi
801057ff:	8b 7d fc             	mov    -0x4(%ebp),%edi
80105802:	89 ec                	mov    %ebp,%esp
80105804:	5d                   	pop    %ebp
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
    exit();
80105805:	e9 26 e3 ff ff       	jmp    80103b30 <exit>
8010580a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
    exit();
80105810:	e8 1b e3 ff ff       	call   80103b30 <exit>
80105815:	e9 9b fe ff ff       	jmp    801056b5 <trap+0xd5>
8010581a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(myproc()->killed)
      exit();
80105820:	e8 0b e3 ff ff       	call   80103b30 <exit>
80105825:	eb b5                	jmp    801057dc <trap+0x1fc>
80105827:	0f 20 d7             	mov    %cr2,%edi

  //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
8010582a:	8b 73 38             	mov    0x38(%ebx),%esi
8010582d:	8d 76 00             	lea    0x0(%esi),%esi
80105830:	e8 db de ff ff       	call   80103710 <cpuid>
80105835:	89 7c 24 10          	mov    %edi,0x10(%esp)
80105839:	89 74 24 0c          	mov    %esi,0xc(%esp)
8010583d:	89 44 24 08          	mov    %eax,0x8(%esp)
80105841:	8b 43 30             	mov    0x30(%ebx),%eax
80105844:	c7 04 24 e8 74 10 80 	movl   $0x801074e8,(%esp)
8010584b:	89 44 24 04          	mov    %eax,0x4(%esp)
8010584f:	e8 fc ad ff ff       	call   80100650 <cprintf>
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
80105854:	c7 04 24 be 74 10 80 	movl   $0x801074be,(%esp)
8010585b:	e8 10 ab ff ff       	call   80100370 <panic>

80105860 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
80105860:	a1 a4 a5 10 80       	mov    0x8010a5a4,%eax
    return -1;
80105865:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  outb(COM1+0, c);
}

static int
uartgetc(void)
{
8010586a:	55                   	push   %ebp
8010586b:	89 e5                	mov    %esp,%ebp
  if(!uart)
8010586d:	85 c0                	test   %eax,%eax
8010586f:	74 10                	je     80105881 <uartgetc+0x21>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105871:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105876:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
80105877:	a8 01                	test   $0x1,%al
80105879:	74 06                	je     80105881 <uartgetc+0x21>
8010587b:	b2 f8                	mov    $0xf8,%dl
8010587d:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
8010587e:	0f b6 c8             	movzbl %al,%ecx
}
80105881:	89 c8                	mov    %ecx,%eax
80105883:	5d                   	pop    %ebp
80105884:	c3                   	ret    
80105885:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105889:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105890 <uartputc>:
    uartputc(*p);
}

void
uartputc(int c)
{
80105890:	55                   	push   %ebp
80105891:	89 e5                	mov    %esp,%ebp
80105893:	56                   	push   %esi
80105894:	be fd 03 00 00       	mov    $0x3fd,%esi
80105899:	53                   	push   %ebx
  int i;

  if(!uart)
8010589a:	bb 80 00 00 00       	mov    $0x80,%ebx
    uartputc(*p);
}

void
uartputc(int c)
{
8010589f:	83 ec 10             	sub    $0x10,%esp
  int i;

  if(!uart)
801058a2:	8b 15 a4 a5 10 80    	mov    0x8010a5a4,%edx
801058a8:	85 d2                	test   %edx,%edx
801058aa:	75 15                	jne    801058c1 <uartputc+0x31>
801058ac:	eb 23                	jmp    801058d1 <uartputc+0x41>
801058ae:	66 90                	xchg   %ax,%ax
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
    microdelay(10);
801058b0:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
801058b7:	e8 74 ce ff ff       	call   80102730 <microdelay>
{
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
801058bc:	83 eb 01             	sub    $0x1,%ebx
801058bf:	74 07                	je     801058c8 <uartputc+0x38>
801058c1:	89 f2                	mov    %esi,%edx
801058c3:	ec                   	in     (%dx),%al
801058c4:	a8 20                	test   $0x20,%al
801058c6:	74 e8                	je     801058b0 <uartputc+0x20>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801058c8:	ba f8 03 00 00       	mov    $0x3f8,%edx
801058cd:	8b 45 08             	mov    0x8(%ebp),%eax
801058d0:	ee                   	out    %al,(%dx)
    microdelay(10);
  outb(COM1+0, c);
}
801058d1:	83 c4 10             	add    $0x10,%esp
801058d4:	5b                   	pop    %ebx
801058d5:	5e                   	pop    %esi
801058d6:	5d                   	pop    %ebp
801058d7:	c3                   	ret    
801058d8:	90                   	nop
801058d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801058e0 <uartinit>:

static int uart;    // is there a uart?

void
uartinit(void)
{
801058e0:	55                   	push   %ebp
801058e1:	31 c9                	xor    %ecx,%ecx
801058e3:	89 e5                	mov    %esp,%ebp
801058e5:	89 c8                	mov    %ecx,%eax
801058e7:	57                   	push   %edi
801058e8:	bf fa 03 00 00       	mov    $0x3fa,%edi
801058ed:	56                   	push   %esi
801058ee:	89 fa                	mov    %edi,%edx
801058f0:	53                   	push   %ebx
801058f1:	83 ec 1c             	sub    $0x1c,%esp
801058f4:	ee                   	out    %al,(%dx)
801058f5:	bb fb 03 00 00       	mov    $0x3fb,%ebx
801058fa:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
801058ff:	89 da                	mov    %ebx,%edx
80105901:	ee                   	out    %al,(%dx)
80105902:	b8 0c 00 00 00       	mov    $0xc,%eax
80105907:	b2 f8                	mov    $0xf8,%dl
80105909:	ee                   	out    %al,(%dx)
8010590a:	be f9 03 00 00       	mov    $0x3f9,%esi
8010590f:	89 c8                	mov    %ecx,%eax
80105911:	89 f2                	mov    %esi,%edx
80105913:	ee                   	out    %al,(%dx)
80105914:	b8 03 00 00 00       	mov    $0x3,%eax
80105919:	89 da                	mov    %ebx,%edx
8010591b:	ee                   	out    %al,(%dx)
8010591c:	b2 fc                	mov    $0xfc,%dl
8010591e:	89 c8                	mov    %ecx,%eax
80105920:	ee                   	out    %al,(%dx)
80105921:	b8 01 00 00 00       	mov    $0x1,%eax
80105926:	89 f2                	mov    %esi,%edx
80105928:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105929:	b2 fd                	mov    $0xfd,%dl
8010592b:	ec                   	in     (%dx),%al
  outb(COM1+3, 0x03);    // Lock divisor, 8 data bits.
  outb(COM1+4, 0);
  outb(COM1+1, 0x01);    // Enable receive interrupts.

  // If status is 0xFF, no serial port.
  if(inb(COM1+5) == 0xFF)
8010592c:	3c ff                	cmp    $0xff,%al
8010592e:	74 45                	je     80105975 <uartinit+0x95>
    return;
  uart = 1;
80105930:	c7 05 a4 a5 10 80 01 	movl   $0x1,0x8010a5a4
80105937:	00 00 00 
8010593a:	89 fa                	mov    %edi,%edx
8010593c:	ec                   	in     (%dx),%al
8010593d:	b2 f8                	mov    $0xf8,%dl
8010593f:	ec                   	in     (%dx),%al
  inb(COM1+2);
  inb(COM1+0);
  ioapicenable(IRQ_COM1, 0);

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80105940:	bb e0 75 10 80       	mov    $0x801075e0,%ebx

  // Acknowledge pre-existing interrupt conditions;
  // enable interrupts.
  inb(COM1+2);
  inb(COM1+0);
  ioapicenable(IRQ_COM1, 0);
80105945:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
8010594c:	00 
8010594d:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
80105954:	e8 a7 c9 ff ff       	call   80102300 <ioapicenable>

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80105959:	b8 78 00 00 00       	mov    $0x78,%eax
8010595e:	66 90                	xchg   %ax,%ax
    uartputc(*p);
80105960:	0f be c0             	movsbl %al,%eax
  inb(COM1+2);
  inb(COM1+0);
  ioapicenable(IRQ_COM1, 0);

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80105963:	83 c3 01             	add    $0x1,%ebx
    uartputc(*p);
80105966:	89 04 24             	mov    %eax,(%esp)
80105969:	e8 22 ff ff ff       	call   80105890 <uartputc>
  inb(COM1+2);
  inb(COM1+0);
  ioapicenable(IRQ_COM1, 0);

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
8010596e:	0f b6 03             	movzbl (%ebx),%eax
80105971:	84 c0                	test   %al,%al
80105973:	75 eb                	jne    80105960 <uartinit+0x80>
    uartputc(*p);
}
80105975:	83 c4 1c             	add    $0x1c,%esp
80105978:	5b                   	pop    %ebx
80105979:	5e                   	pop    %esi
8010597a:	5f                   	pop    %edi
8010597b:	5d                   	pop    %ebp
8010597c:	c3                   	ret    
8010597d:	8d 76 00             	lea    0x0(%esi),%esi

80105980 <uartintr>:
  return inb(COM1+0);
}

void
uartintr(void)
{
80105980:	55                   	push   %ebp
80105981:	89 e5                	mov    %esp,%ebp
80105983:	83 ec 18             	sub    $0x18,%esp
  consoleintr(uartgetc);
80105986:	c7 04 24 60 58 10 80 	movl   $0x80105860,(%esp)
8010598d:	e8 2e ae ff ff       	call   801007c0 <consoleintr>
}
80105992:	c9                   	leave  
80105993:	c3                   	ret    

80105994 <vector0>:
# generated by vectors.pl - do not edit
# handlers
.globl alltraps
.globl vector0
vector0:
  pushl $0
80105994:	6a 00                	push   $0x0
  pushl $0
80105996:	6a 00                	push   $0x0
  jmp alltraps
80105998:	e9 53 fb ff ff       	jmp    801054f0 <alltraps>

8010599d <vector1>:
.globl vector1
vector1:
  pushl $0
8010599d:	6a 00                	push   $0x0
  pushl $1
8010599f:	6a 01                	push   $0x1
  jmp alltraps
801059a1:	e9 4a fb ff ff       	jmp    801054f0 <alltraps>

801059a6 <vector2>:
.globl vector2
vector2:
  pushl $0
801059a6:	6a 00                	push   $0x0
  pushl $2
801059a8:	6a 02                	push   $0x2
  jmp alltraps
801059aa:	e9 41 fb ff ff       	jmp    801054f0 <alltraps>

801059af <vector3>:
.globl vector3
vector3:
  pushl $0
801059af:	6a 00                	push   $0x0
  pushl $3
801059b1:	6a 03                	push   $0x3
  jmp alltraps
801059b3:	e9 38 fb ff ff       	jmp    801054f0 <alltraps>

801059b8 <vector4>:
.globl vector4
vector4:
  pushl $0
801059b8:	6a 00                	push   $0x0
  pushl $4
801059ba:	6a 04                	push   $0x4
  jmp alltraps
801059bc:	e9 2f fb ff ff       	jmp    801054f0 <alltraps>

801059c1 <vector5>:
.globl vector5
vector5:
  pushl $0
801059c1:	6a 00                	push   $0x0
  pushl $5
801059c3:	6a 05                	push   $0x5
  jmp alltraps
801059c5:	e9 26 fb ff ff       	jmp    801054f0 <alltraps>

801059ca <vector6>:
.globl vector6
vector6:
  pushl $0
801059ca:	6a 00                	push   $0x0
  pushl $6
801059cc:	6a 06                	push   $0x6
  jmp alltraps
801059ce:	e9 1d fb ff ff       	jmp    801054f0 <alltraps>

801059d3 <vector7>:
.globl vector7
vector7:
  pushl $0
801059d3:	6a 00                	push   $0x0
  pushl $7
801059d5:	6a 07                	push   $0x7
  jmp alltraps
801059d7:	e9 14 fb ff ff       	jmp    801054f0 <alltraps>

801059dc <vector8>:
.globl vector8
vector8:
  pushl $8
801059dc:	6a 08                	push   $0x8
  jmp alltraps
801059de:	e9 0d fb ff ff       	jmp    801054f0 <alltraps>

801059e3 <vector9>:
.globl vector9
vector9:
  pushl $0
801059e3:	6a 00                	push   $0x0
  pushl $9
801059e5:	6a 09                	push   $0x9
  jmp alltraps
801059e7:	e9 04 fb ff ff       	jmp    801054f0 <alltraps>

801059ec <vector10>:
.globl vector10
vector10:
  pushl $10
801059ec:	6a 0a                	push   $0xa
  jmp alltraps
801059ee:	e9 fd fa ff ff       	jmp    801054f0 <alltraps>

801059f3 <vector11>:
.globl vector11
vector11:
  pushl $11
801059f3:	6a 0b                	push   $0xb
  jmp alltraps
801059f5:	e9 f6 fa ff ff       	jmp    801054f0 <alltraps>

801059fa <vector12>:
.globl vector12
vector12:
  pushl $12
801059fa:	6a 0c                	push   $0xc
  jmp alltraps
801059fc:	e9 ef fa ff ff       	jmp    801054f0 <alltraps>

80105a01 <vector13>:
.globl vector13
vector13:
  pushl $13
80105a01:	6a 0d                	push   $0xd
  jmp alltraps
80105a03:	e9 e8 fa ff ff       	jmp    801054f0 <alltraps>

80105a08 <vector14>:
.globl vector14
vector14:
  pushl $14
80105a08:	6a 0e                	push   $0xe
  jmp alltraps
80105a0a:	e9 e1 fa ff ff       	jmp    801054f0 <alltraps>

80105a0f <vector15>:
.globl vector15
vector15:
  pushl $0
80105a0f:	6a 00                	push   $0x0
  pushl $15
80105a11:	6a 0f                	push   $0xf
  jmp alltraps
80105a13:	e9 d8 fa ff ff       	jmp    801054f0 <alltraps>

80105a18 <vector16>:
.globl vector16
vector16:
  pushl $0
80105a18:	6a 00                	push   $0x0
  pushl $16
80105a1a:	6a 10                	push   $0x10
  jmp alltraps
80105a1c:	e9 cf fa ff ff       	jmp    801054f0 <alltraps>

80105a21 <vector17>:
.globl vector17
vector17:
  pushl $17
80105a21:	6a 11                	push   $0x11
  jmp alltraps
80105a23:	e9 c8 fa ff ff       	jmp    801054f0 <alltraps>

80105a28 <vector18>:
.globl vector18
vector18:
  pushl $0
80105a28:	6a 00                	push   $0x0
  pushl $18
80105a2a:	6a 12                	push   $0x12
  jmp alltraps
80105a2c:	e9 bf fa ff ff       	jmp    801054f0 <alltraps>

80105a31 <vector19>:
.globl vector19
vector19:
  pushl $0
80105a31:	6a 00                	push   $0x0
  pushl $19
80105a33:	6a 13                	push   $0x13
  jmp alltraps
80105a35:	e9 b6 fa ff ff       	jmp    801054f0 <alltraps>

80105a3a <vector20>:
.globl vector20
vector20:
  pushl $0
80105a3a:	6a 00                	push   $0x0
  pushl $20
80105a3c:	6a 14                	push   $0x14
  jmp alltraps
80105a3e:	e9 ad fa ff ff       	jmp    801054f0 <alltraps>

80105a43 <vector21>:
.globl vector21
vector21:
  pushl $0
80105a43:	6a 00                	push   $0x0
  pushl $21
80105a45:	6a 15                	push   $0x15
  jmp alltraps
80105a47:	e9 a4 fa ff ff       	jmp    801054f0 <alltraps>

80105a4c <vector22>:
.globl vector22
vector22:
  pushl $0
80105a4c:	6a 00                	push   $0x0
  pushl $22
80105a4e:	6a 16                	push   $0x16
  jmp alltraps
80105a50:	e9 9b fa ff ff       	jmp    801054f0 <alltraps>

80105a55 <vector23>:
.globl vector23
vector23:
  pushl $0
80105a55:	6a 00                	push   $0x0
  pushl $23
80105a57:	6a 17                	push   $0x17
  jmp alltraps
80105a59:	e9 92 fa ff ff       	jmp    801054f0 <alltraps>

80105a5e <vector24>:
.globl vector24
vector24:
  pushl $0
80105a5e:	6a 00                	push   $0x0
  pushl $24
80105a60:	6a 18                	push   $0x18
  jmp alltraps
80105a62:	e9 89 fa ff ff       	jmp    801054f0 <alltraps>

80105a67 <vector25>:
.globl vector25
vector25:
  pushl $0
80105a67:	6a 00                	push   $0x0
  pushl $25
80105a69:	6a 19                	push   $0x19
  jmp alltraps
80105a6b:	e9 80 fa ff ff       	jmp    801054f0 <alltraps>

80105a70 <vector26>:
.globl vector26
vector26:
  pushl $0
80105a70:	6a 00                	push   $0x0
  pushl $26
80105a72:	6a 1a                	push   $0x1a
  jmp alltraps
80105a74:	e9 77 fa ff ff       	jmp    801054f0 <alltraps>

80105a79 <vector27>:
.globl vector27
vector27:
  pushl $0
80105a79:	6a 00                	push   $0x0
  pushl $27
80105a7b:	6a 1b                	push   $0x1b
  jmp alltraps
80105a7d:	e9 6e fa ff ff       	jmp    801054f0 <alltraps>

80105a82 <vector28>:
.globl vector28
vector28:
  pushl $0
80105a82:	6a 00                	push   $0x0
  pushl $28
80105a84:	6a 1c                	push   $0x1c
  jmp alltraps
80105a86:	e9 65 fa ff ff       	jmp    801054f0 <alltraps>

80105a8b <vector29>:
.globl vector29
vector29:
  pushl $0
80105a8b:	6a 00                	push   $0x0
  pushl $29
80105a8d:	6a 1d                	push   $0x1d
  jmp alltraps
80105a8f:	e9 5c fa ff ff       	jmp    801054f0 <alltraps>

80105a94 <vector30>:
.globl vector30
vector30:
  pushl $0
80105a94:	6a 00                	push   $0x0
  pushl $30
80105a96:	6a 1e                	push   $0x1e
  jmp alltraps
80105a98:	e9 53 fa ff ff       	jmp    801054f0 <alltraps>

80105a9d <vector31>:
.globl vector31
vector31:
  pushl $0
80105a9d:	6a 00                	push   $0x0
  pushl $31
80105a9f:	6a 1f                	push   $0x1f
  jmp alltraps
80105aa1:	e9 4a fa ff ff       	jmp    801054f0 <alltraps>

80105aa6 <vector32>:
.globl vector32
vector32:
  pushl $0
80105aa6:	6a 00                	push   $0x0
  pushl $32
80105aa8:	6a 20                	push   $0x20
  jmp alltraps
80105aaa:	e9 41 fa ff ff       	jmp    801054f0 <alltraps>

80105aaf <vector33>:
.globl vector33
vector33:
  pushl $0
80105aaf:	6a 00                	push   $0x0
  pushl $33
80105ab1:	6a 21                	push   $0x21
  jmp alltraps
80105ab3:	e9 38 fa ff ff       	jmp    801054f0 <alltraps>

80105ab8 <vector34>:
.globl vector34
vector34:
  pushl $0
80105ab8:	6a 00                	push   $0x0
  pushl $34
80105aba:	6a 22                	push   $0x22
  jmp alltraps
80105abc:	e9 2f fa ff ff       	jmp    801054f0 <alltraps>

80105ac1 <vector35>:
.globl vector35
vector35:
  pushl $0
80105ac1:	6a 00                	push   $0x0
  pushl $35
80105ac3:	6a 23                	push   $0x23
  jmp alltraps
80105ac5:	e9 26 fa ff ff       	jmp    801054f0 <alltraps>

80105aca <vector36>:
.globl vector36
vector36:
  pushl $0
80105aca:	6a 00                	push   $0x0
  pushl $36
80105acc:	6a 24                	push   $0x24
  jmp alltraps
80105ace:	e9 1d fa ff ff       	jmp    801054f0 <alltraps>

80105ad3 <vector37>:
.globl vector37
vector37:
  pushl $0
80105ad3:	6a 00                	push   $0x0
  pushl $37
80105ad5:	6a 25                	push   $0x25
  jmp alltraps
80105ad7:	e9 14 fa ff ff       	jmp    801054f0 <alltraps>

80105adc <vector38>:
.globl vector38
vector38:
  pushl $0
80105adc:	6a 00                	push   $0x0
  pushl $38
80105ade:	6a 26                	push   $0x26
  jmp alltraps
80105ae0:	e9 0b fa ff ff       	jmp    801054f0 <alltraps>

80105ae5 <vector39>:
.globl vector39
vector39:
  pushl $0
80105ae5:	6a 00                	push   $0x0
  pushl $39
80105ae7:	6a 27                	push   $0x27
  jmp alltraps
80105ae9:	e9 02 fa ff ff       	jmp    801054f0 <alltraps>

80105aee <vector40>:
.globl vector40
vector40:
  pushl $0
80105aee:	6a 00                	push   $0x0
  pushl $40
80105af0:	6a 28                	push   $0x28
  jmp alltraps
80105af2:	e9 f9 f9 ff ff       	jmp    801054f0 <alltraps>

80105af7 <vector41>:
.globl vector41
vector41:
  pushl $0
80105af7:	6a 00                	push   $0x0
  pushl $41
80105af9:	6a 29                	push   $0x29
  jmp alltraps
80105afb:	e9 f0 f9 ff ff       	jmp    801054f0 <alltraps>

80105b00 <vector42>:
.globl vector42
vector42:
  pushl $0
80105b00:	6a 00                	push   $0x0
  pushl $42
80105b02:	6a 2a                	push   $0x2a
  jmp alltraps
80105b04:	e9 e7 f9 ff ff       	jmp    801054f0 <alltraps>

80105b09 <vector43>:
.globl vector43
vector43:
  pushl $0
80105b09:	6a 00                	push   $0x0
  pushl $43
80105b0b:	6a 2b                	push   $0x2b
  jmp alltraps
80105b0d:	e9 de f9 ff ff       	jmp    801054f0 <alltraps>

80105b12 <vector44>:
.globl vector44
vector44:
  pushl $0
80105b12:	6a 00                	push   $0x0
  pushl $44
80105b14:	6a 2c                	push   $0x2c
  jmp alltraps
80105b16:	e9 d5 f9 ff ff       	jmp    801054f0 <alltraps>

80105b1b <vector45>:
.globl vector45
vector45:
  pushl $0
80105b1b:	6a 00                	push   $0x0
  pushl $45
80105b1d:	6a 2d                	push   $0x2d
  jmp alltraps
80105b1f:	e9 cc f9 ff ff       	jmp    801054f0 <alltraps>

80105b24 <vector46>:
.globl vector46
vector46:
  pushl $0
80105b24:	6a 00                	push   $0x0
  pushl $46
80105b26:	6a 2e                	push   $0x2e
  jmp alltraps
80105b28:	e9 c3 f9 ff ff       	jmp    801054f0 <alltraps>

80105b2d <vector47>:
.globl vector47
vector47:
  pushl $0
80105b2d:	6a 00                	push   $0x0
  pushl $47
80105b2f:	6a 2f                	push   $0x2f
  jmp alltraps
80105b31:	e9 ba f9 ff ff       	jmp    801054f0 <alltraps>

80105b36 <vector48>:
.globl vector48
vector48:
  pushl $0
80105b36:	6a 00                	push   $0x0
  pushl $48
80105b38:	6a 30                	push   $0x30
  jmp alltraps
80105b3a:	e9 b1 f9 ff ff       	jmp    801054f0 <alltraps>

80105b3f <vector49>:
.globl vector49
vector49:
  pushl $0
80105b3f:	6a 00                	push   $0x0
  pushl $49
80105b41:	6a 31                	push   $0x31
  jmp alltraps
80105b43:	e9 a8 f9 ff ff       	jmp    801054f0 <alltraps>

80105b48 <vector50>:
.globl vector50
vector50:
  pushl $0
80105b48:	6a 00                	push   $0x0
  pushl $50
80105b4a:	6a 32                	push   $0x32
  jmp alltraps
80105b4c:	e9 9f f9 ff ff       	jmp    801054f0 <alltraps>

80105b51 <vector51>:
.globl vector51
vector51:
  pushl $0
80105b51:	6a 00                	push   $0x0
  pushl $51
80105b53:	6a 33                	push   $0x33
  jmp alltraps
80105b55:	e9 96 f9 ff ff       	jmp    801054f0 <alltraps>

80105b5a <vector52>:
.globl vector52
vector52:
  pushl $0
80105b5a:	6a 00                	push   $0x0
  pushl $52
80105b5c:	6a 34                	push   $0x34
  jmp alltraps
80105b5e:	e9 8d f9 ff ff       	jmp    801054f0 <alltraps>

80105b63 <vector53>:
.globl vector53
vector53:
  pushl $0
80105b63:	6a 00                	push   $0x0
  pushl $53
80105b65:	6a 35                	push   $0x35
  jmp alltraps
80105b67:	e9 84 f9 ff ff       	jmp    801054f0 <alltraps>

80105b6c <vector54>:
.globl vector54
vector54:
  pushl $0
80105b6c:	6a 00                	push   $0x0
  pushl $54
80105b6e:	6a 36                	push   $0x36
  jmp alltraps
80105b70:	e9 7b f9 ff ff       	jmp    801054f0 <alltraps>

80105b75 <vector55>:
.globl vector55
vector55:
  pushl $0
80105b75:	6a 00                	push   $0x0
  pushl $55
80105b77:	6a 37                	push   $0x37
  jmp alltraps
80105b79:	e9 72 f9 ff ff       	jmp    801054f0 <alltraps>

80105b7e <vector56>:
.globl vector56
vector56:
  pushl $0
80105b7e:	6a 00                	push   $0x0
  pushl $56
80105b80:	6a 38                	push   $0x38
  jmp alltraps
80105b82:	e9 69 f9 ff ff       	jmp    801054f0 <alltraps>

80105b87 <vector57>:
.globl vector57
vector57:
  pushl $0
80105b87:	6a 00                	push   $0x0
  pushl $57
80105b89:	6a 39                	push   $0x39
  jmp alltraps
80105b8b:	e9 60 f9 ff ff       	jmp    801054f0 <alltraps>

80105b90 <vector58>:
.globl vector58
vector58:
  pushl $0
80105b90:	6a 00                	push   $0x0
  pushl $58
80105b92:	6a 3a                	push   $0x3a
  jmp alltraps
80105b94:	e9 57 f9 ff ff       	jmp    801054f0 <alltraps>

80105b99 <vector59>:
.globl vector59
vector59:
  pushl $0
80105b99:	6a 00                	push   $0x0
  pushl $59
80105b9b:	6a 3b                	push   $0x3b
  jmp alltraps
80105b9d:	e9 4e f9 ff ff       	jmp    801054f0 <alltraps>

80105ba2 <vector60>:
.globl vector60
vector60:
  pushl $0
80105ba2:	6a 00                	push   $0x0
  pushl $60
80105ba4:	6a 3c                	push   $0x3c
  jmp alltraps
80105ba6:	e9 45 f9 ff ff       	jmp    801054f0 <alltraps>

80105bab <vector61>:
.globl vector61
vector61:
  pushl $0
80105bab:	6a 00                	push   $0x0
  pushl $61
80105bad:	6a 3d                	push   $0x3d
  jmp alltraps
80105baf:	e9 3c f9 ff ff       	jmp    801054f0 <alltraps>

80105bb4 <vector62>:
.globl vector62
vector62:
  pushl $0
80105bb4:	6a 00                	push   $0x0
  pushl $62
80105bb6:	6a 3e                	push   $0x3e
  jmp alltraps
80105bb8:	e9 33 f9 ff ff       	jmp    801054f0 <alltraps>

80105bbd <vector63>:
.globl vector63
vector63:
  pushl $0
80105bbd:	6a 00                	push   $0x0
  pushl $63
80105bbf:	6a 3f                	push   $0x3f
  jmp alltraps
80105bc1:	e9 2a f9 ff ff       	jmp    801054f0 <alltraps>

80105bc6 <vector64>:
.globl vector64
vector64:
  pushl $0
80105bc6:	6a 00                	push   $0x0
  pushl $64
80105bc8:	6a 40                	push   $0x40
  jmp alltraps
80105bca:	e9 21 f9 ff ff       	jmp    801054f0 <alltraps>

80105bcf <vector65>:
.globl vector65
vector65:
  pushl $0
80105bcf:	6a 00                	push   $0x0
  pushl $65
80105bd1:	6a 41                	push   $0x41
  jmp alltraps
80105bd3:	e9 18 f9 ff ff       	jmp    801054f0 <alltraps>

80105bd8 <vector66>:
.globl vector66
vector66:
  pushl $0
80105bd8:	6a 00                	push   $0x0
  pushl $66
80105bda:	6a 42                	push   $0x42
  jmp alltraps
80105bdc:	e9 0f f9 ff ff       	jmp    801054f0 <alltraps>

80105be1 <vector67>:
.globl vector67
vector67:
  pushl $0
80105be1:	6a 00                	push   $0x0
  pushl $67
80105be3:	6a 43                	push   $0x43
  jmp alltraps
80105be5:	e9 06 f9 ff ff       	jmp    801054f0 <alltraps>

80105bea <vector68>:
.globl vector68
vector68:
  pushl $0
80105bea:	6a 00                	push   $0x0
  pushl $68
80105bec:	6a 44                	push   $0x44
  jmp alltraps
80105bee:	e9 fd f8 ff ff       	jmp    801054f0 <alltraps>

80105bf3 <vector69>:
.globl vector69
vector69:
  pushl $0
80105bf3:	6a 00                	push   $0x0
  pushl $69
80105bf5:	6a 45                	push   $0x45
  jmp alltraps
80105bf7:	e9 f4 f8 ff ff       	jmp    801054f0 <alltraps>

80105bfc <vector70>:
.globl vector70
vector70:
  pushl $0
80105bfc:	6a 00                	push   $0x0
  pushl $70
80105bfe:	6a 46                	push   $0x46
  jmp alltraps
80105c00:	e9 eb f8 ff ff       	jmp    801054f0 <alltraps>

80105c05 <vector71>:
.globl vector71
vector71:
  pushl $0
80105c05:	6a 00                	push   $0x0
  pushl $71
80105c07:	6a 47                	push   $0x47
  jmp alltraps
80105c09:	e9 e2 f8 ff ff       	jmp    801054f0 <alltraps>

80105c0e <vector72>:
.globl vector72
vector72:
  pushl $0
80105c0e:	6a 00                	push   $0x0
  pushl $72
80105c10:	6a 48                	push   $0x48
  jmp alltraps
80105c12:	e9 d9 f8 ff ff       	jmp    801054f0 <alltraps>

80105c17 <vector73>:
.globl vector73
vector73:
  pushl $0
80105c17:	6a 00                	push   $0x0
  pushl $73
80105c19:	6a 49                	push   $0x49
  jmp alltraps
80105c1b:	e9 d0 f8 ff ff       	jmp    801054f0 <alltraps>

80105c20 <vector74>:
.globl vector74
vector74:
  pushl $0
80105c20:	6a 00                	push   $0x0
  pushl $74
80105c22:	6a 4a                	push   $0x4a
  jmp alltraps
80105c24:	e9 c7 f8 ff ff       	jmp    801054f0 <alltraps>

80105c29 <vector75>:
.globl vector75
vector75:
  pushl $0
80105c29:	6a 00                	push   $0x0
  pushl $75
80105c2b:	6a 4b                	push   $0x4b
  jmp alltraps
80105c2d:	e9 be f8 ff ff       	jmp    801054f0 <alltraps>

80105c32 <vector76>:
.globl vector76
vector76:
  pushl $0
80105c32:	6a 00                	push   $0x0
  pushl $76
80105c34:	6a 4c                	push   $0x4c
  jmp alltraps
80105c36:	e9 b5 f8 ff ff       	jmp    801054f0 <alltraps>

80105c3b <vector77>:
.globl vector77
vector77:
  pushl $0
80105c3b:	6a 00                	push   $0x0
  pushl $77
80105c3d:	6a 4d                	push   $0x4d
  jmp alltraps
80105c3f:	e9 ac f8 ff ff       	jmp    801054f0 <alltraps>

80105c44 <vector78>:
.globl vector78
vector78:
  pushl $0
80105c44:	6a 00                	push   $0x0
  pushl $78
80105c46:	6a 4e                	push   $0x4e
  jmp alltraps
80105c48:	e9 a3 f8 ff ff       	jmp    801054f0 <alltraps>

80105c4d <vector79>:
.globl vector79
vector79:
  pushl $0
80105c4d:	6a 00                	push   $0x0
  pushl $79
80105c4f:	6a 4f                	push   $0x4f
  jmp alltraps
80105c51:	e9 9a f8 ff ff       	jmp    801054f0 <alltraps>

80105c56 <vector80>:
.globl vector80
vector80:
  pushl $0
80105c56:	6a 00                	push   $0x0
  pushl $80
80105c58:	6a 50                	push   $0x50
  jmp alltraps
80105c5a:	e9 91 f8 ff ff       	jmp    801054f0 <alltraps>

80105c5f <vector81>:
.globl vector81
vector81:
  pushl $0
80105c5f:	6a 00                	push   $0x0
  pushl $81
80105c61:	6a 51                	push   $0x51
  jmp alltraps
80105c63:	e9 88 f8 ff ff       	jmp    801054f0 <alltraps>

80105c68 <vector82>:
.globl vector82
vector82:
  pushl $0
80105c68:	6a 00                	push   $0x0
  pushl $82
80105c6a:	6a 52                	push   $0x52
  jmp alltraps
80105c6c:	e9 7f f8 ff ff       	jmp    801054f0 <alltraps>

80105c71 <vector83>:
.globl vector83
vector83:
  pushl $0
80105c71:	6a 00                	push   $0x0
  pushl $83
80105c73:	6a 53                	push   $0x53
  jmp alltraps
80105c75:	e9 76 f8 ff ff       	jmp    801054f0 <alltraps>

80105c7a <vector84>:
.globl vector84
vector84:
  pushl $0
80105c7a:	6a 00                	push   $0x0
  pushl $84
80105c7c:	6a 54                	push   $0x54
  jmp alltraps
80105c7e:	e9 6d f8 ff ff       	jmp    801054f0 <alltraps>

80105c83 <vector85>:
.globl vector85
vector85:
  pushl $0
80105c83:	6a 00                	push   $0x0
  pushl $85
80105c85:	6a 55                	push   $0x55
  jmp alltraps
80105c87:	e9 64 f8 ff ff       	jmp    801054f0 <alltraps>

80105c8c <vector86>:
.globl vector86
vector86:
  pushl $0
80105c8c:	6a 00                	push   $0x0
  pushl $86
80105c8e:	6a 56                	push   $0x56
  jmp alltraps
80105c90:	e9 5b f8 ff ff       	jmp    801054f0 <alltraps>

80105c95 <vector87>:
.globl vector87
vector87:
  pushl $0
80105c95:	6a 00                	push   $0x0
  pushl $87
80105c97:	6a 57                	push   $0x57
  jmp alltraps
80105c99:	e9 52 f8 ff ff       	jmp    801054f0 <alltraps>

80105c9e <vector88>:
.globl vector88
vector88:
  pushl $0
80105c9e:	6a 00                	push   $0x0
  pushl $88
80105ca0:	6a 58                	push   $0x58
  jmp alltraps
80105ca2:	e9 49 f8 ff ff       	jmp    801054f0 <alltraps>

80105ca7 <vector89>:
.globl vector89
vector89:
  pushl $0
80105ca7:	6a 00                	push   $0x0
  pushl $89
80105ca9:	6a 59                	push   $0x59
  jmp alltraps
80105cab:	e9 40 f8 ff ff       	jmp    801054f0 <alltraps>

80105cb0 <vector90>:
.globl vector90
vector90:
  pushl $0
80105cb0:	6a 00                	push   $0x0
  pushl $90
80105cb2:	6a 5a                	push   $0x5a
  jmp alltraps
80105cb4:	e9 37 f8 ff ff       	jmp    801054f0 <alltraps>

80105cb9 <vector91>:
.globl vector91
vector91:
  pushl $0
80105cb9:	6a 00                	push   $0x0
  pushl $91
80105cbb:	6a 5b                	push   $0x5b
  jmp alltraps
80105cbd:	e9 2e f8 ff ff       	jmp    801054f0 <alltraps>

80105cc2 <vector92>:
.globl vector92
vector92:
  pushl $0
80105cc2:	6a 00                	push   $0x0
  pushl $92
80105cc4:	6a 5c                	push   $0x5c
  jmp alltraps
80105cc6:	e9 25 f8 ff ff       	jmp    801054f0 <alltraps>

80105ccb <vector93>:
.globl vector93
vector93:
  pushl $0
80105ccb:	6a 00                	push   $0x0
  pushl $93
80105ccd:	6a 5d                	push   $0x5d
  jmp alltraps
80105ccf:	e9 1c f8 ff ff       	jmp    801054f0 <alltraps>

80105cd4 <vector94>:
.globl vector94
vector94:
  pushl $0
80105cd4:	6a 00                	push   $0x0
  pushl $94
80105cd6:	6a 5e                	push   $0x5e
  jmp alltraps
80105cd8:	e9 13 f8 ff ff       	jmp    801054f0 <alltraps>

80105cdd <vector95>:
.globl vector95
vector95:
  pushl $0
80105cdd:	6a 00                	push   $0x0
  pushl $95
80105cdf:	6a 5f                	push   $0x5f
  jmp alltraps
80105ce1:	e9 0a f8 ff ff       	jmp    801054f0 <alltraps>

80105ce6 <vector96>:
.globl vector96
vector96:
  pushl $0
80105ce6:	6a 00                	push   $0x0
  pushl $96
80105ce8:	6a 60                	push   $0x60
  jmp alltraps
80105cea:	e9 01 f8 ff ff       	jmp    801054f0 <alltraps>

80105cef <vector97>:
.globl vector97
vector97:
  pushl $0
80105cef:	6a 00                	push   $0x0
  pushl $97
80105cf1:	6a 61                	push   $0x61
  jmp alltraps
80105cf3:	e9 f8 f7 ff ff       	jmp    801054f0 <alltraps>

80105cf8 <vector98>:
.globl vector98
vector98:
  pushl $0
80105cf8:	6a 00                	push   $0x0
  pushl $98
80105cfa:	6a 62                	push   $0x62
  jmp alltraps
80105cfc:	e9 ef f7 ff ff       	jmp    801054f0 <alltraps>

80105d01 <vector99>:
.globl vector99
vector99:
  pushl $0
80105d01:	6a 00                	push   $0x0
  pushl $99
80105d03:	6a 63                	push   $0x63
  jmp alltraps
80105d05:	e9 e6 f7 ff ff       	jmp    801054f0 <alltraps>

80105d0a <vector100>:
.globl vector100
vector100:
  pushl $0
80105d0a:	6a 00                	push   $0x0
  pushl $100
80105d0c:	6a 64                	push   $0x64
  jmp alltraps
80105d0e:	e9 dd f7 ff ff       	jmp    801054f0 <alltraps>

80105d13 <vector101>:
.globl vector101
vector101:
  pushl $0
80105d13:	6a 00                	push   $0x0
  pushl $101
80105d15:	6a 65                	push   $0x65
  jmp alltraps
80105d17:	e9 d4 f7 ff ff       	jmp    801054f0 <alltraps>

80105d1c <vector102>:
.globl vector102
vector102:
  pushl $0
80105d1c:	6a 00                	push   $0x0
  pushl $102
80105d1e:	6a 66                	push   $0x66
  jmp alltraps
80105d20:	e9 cb f7 ff ff       	jmp    801054f0 <alltraps>

80105d25 <vector103>:
.globl vector103
vector103:
  pushl $0
80105d25:	6a 00                	push   $0x0
  pushl $103
80105d27:	6a 67                	push   $0x67
  jmp alltraps
80105d29:	e9 c2 f7 ff ff       	jmp    801054f0 <alltraps>

80105d2e <vector104>:
.globl vector104
vector104:
  pushl $0
80105d2e:	6a 00                	push   $0x0
  pushl $104
80105d30:	6a 68                	push   $0x68
  jmp alltraps
80105d32:	e9 b9 f7 ff ff       	jmp    801054f0 <alltraps>

80105d37 <vector105>:
.globl vector105
vector105:
  pushl $0
80105d37:	6a 00                	push   $0x0
  pushl $105
80105d39:	6a 69                	push   $0x69
  jmp alltraps
80105d3b:	e9 b0 f7 ff ff       	jmp    801054f0 <alltraps>

80105d40 <vector106>:
.globl vector106
vector106:
  pushl $0
80105d40:	6a 00                	push   $0x0
  pushl $106
80105d42:	6a 6a                	push   $0x6a
  jmp alltraps
80105d44:	e9 a7 f7 ff ff       	jmp    801054f0 <alltraps>

80105d49 <vector107>:
.globl vector107
vector107:
  pushl $0
80105d49:	6a 00                	push   $0x0
  pushl $107
80105d4b:	6a 6b                	push   $0x6b
  jmp alltraps
80105d4d:	e9 9e f7 ff ff       	jmp    801054f0 <alltraps>

80105d52 <vector108>:
.globl vector108
vector108:
  pushl $0
80105d52:	6a 00                	push   $0x0
  pushl $108
80105d54:	6a 6c                	push   $0x6c
  jmp alltraps
80105d56:	e9 95 f7 ff ff       	jmp    801054f0 <alltraps>

80105d5b <vector109>:
.globl vector109
vector109:
  pushl $0
80105d5b:	6a 00                	push   $0x0
  pushl $109
80105d5d:	6a 6d                	push   $0x6d
  jmp alltraps
80105d5f:	e9 8c f7 ff ff       	jmp    801054f0 <alltraps>

80105d64 <vector110>:
.globl vector110
vector110:
  pushl $0
80105d64:	6a 00                	push   $0x0
  pushl $110
80105d66:	6a 6e                	push   $0x6e
  jmp alltraps
80105d68:	e9 83 f7 ff ff       	jmp    801054f0 <alltraps>

80105d6d <vector111>:
.globl vector111
vector111:
  pushl $0
80105d6d:	6a 00                	push   $0x0
  pushl $111
80105d6f:	6a 6f                	push   $0x6f
  jmp alltraps
80105d71:	e9 7a f7 ff ff       	jmp    801054f0 <alltraps>

80105d76 <vector112>:
.globl vector112
vector112:
  pushl $0
80105d76:	6a 00                	push   $0x0
  pushl $112
80105d78:	6a 70                	push   $0x70
  jmp alltraps
80105d7a:	e9 71 f7 ff ff       	jmp    801054f0 <alltraps>

80105d7f <vector113>:
.globl vector113
vector113:
  pushl $0
80105d7f:	6a 00                	push   $0x0
  pushl $113
80105d81:	6a 71                	push   $0x71
  jmp alltraps
80105d83:	e9 68 f7 ff ff       	jmp    801054f0 <alltraps>

80105d88 <vector114>:
.globl vector114
vector114:
  pushl $0
80105d88:	6a 00                	push   $0x0
  pushl $114
80105d8a:	6a 72                	push   $0x72
  jmp alltraps
80105d8c:	e9 5f f7 ff ff       	jmp    801054f0 <alltraps>

80105d91 <vector115>:
.globl vector115
vector115:
  pushl $0
80105d91:	6a 00                	push   $0x0
  pushl $115
80105d93:	6a 73                	push   $0x73
  jmp alltraps
80105d95:	e9 56 f7 ff ff       	jmp    801054f0 <alltraps>

80105d9a <vector116>:
.globl vector116
vector116:
  pushl $0
80105d9a:	6a 00                	push   $0x0
  pushl $116
80105d9c:	6a 74                	push   $0x74
  jmp alltraps
80105d9e:	e9 4d f7 ff ff       	jmp    801054f0 <alltraps>

80105da3 <vector117>:
.globl vector117
vector117:
  pushl $0
80105da3:	6a 00                	push   $0x0
  pushl $117
80105da5:	6a 75                	push   $0x75
  jmp alltraps
80105da7:	e9 44 f7 ff ff       	jmp    801054f0 <alltraps>

80105dac <vector118>:
.globl vector118
vector118:
  pushl $0
80105dac:	6a 00                	push   $0x0
  pushl $118
80105dae:	6a 76                	push   $0x76
  jmp alltraps
80105db0:	e9 3b f7 ff ff       	jmp    801054f0 <alltraps>

80105db5 <vector119>:
.globl vector119
vector119:
  pushl $0
80105db5:	6a 00                	push   $0x0
  pushl $119
80105db7:	6a 77                	push   $0x77
  jmp alltraps
80105db9:	e9 32 f7 ff ff       	jmp    801054f0 <alltraps>

80105dbe <vector120>:
.globl vector120
vector120:
  pushl $0
80105dbe:	6a 00                	push   $0x0
  pushl $120
80105dc0:	6a 78                	push   $0x78
  jmp alltraps
80105dc2:	e9 29 f7 ff ff       	jmp    801054f0 <alltraps>

80105dc7 <vector121>:
.globl vector121
vector121:
  pushl $0
80105dc7:	6a 00                	push   $0x0
  pushl $121
80105dc9:	6a 79                	push   $0x79
  jmp alltraps
80105dcb:	e9 20 f7 ff ff       	jmp    801054f0 <alltraps>

80105dd0 <vector122>:
.globl vector122
vector122:
  pushl $0
80105dd0:	6a 00                	push   $0x0
  pushl $122
80105dd2:	6a 7a                	push   $0x7a
  jmp alltraps
80105dd4:	e9 17 f7 ff ff       	jmp    801054f0 <alltraps>

80105dd9 <vector123>:
.globl vector123
vector123:
  pushl $0
80105dd9:	6a 00                	push   $0x0
  pushl $123
80105ddb:	6a 7b                	push   $0x7b
  jmp alltraps
80105ddd:	e9 0e f7 ff ff       	jmp    801054f0 <alltraps>

80105de2 <vector124>:
.globl vector124
vector124:
  pushl $0
80105de2:	6a 00                	push   $0x0
  pushl $124
80105de4:	6a 7c                	push   $0x7c
  jmp alltraps
80105de6:	e9 05 f7 ff ff       	jmp    801054f0 <alltraps>

80105deb <vector125>:
.globl vector125
vector125:
  pushl $0
80105deb:	6a 00                	push   $0x0
  pushl $125
80105ded:	6a 7d                	push   $0x7d
  jmp alltraps
80105def:	e9 fc f6 ff ff       	jmp    801054f0 <alltraps>

80105df4 <vector126>:
.globl vector126
vector126:
  pushl $0
80105df4:	6a 00                	push   $0x0
  pushl $126
80105df6:	6a 7e                	push   $0x7e
  jmp alltraps
80105df8:	e9 f3 f6 ff ff       	jmp    801054f0 <alltraps>

80105dfd <vector127>:
.globl vector127
vector127:
  pushl $0
80105dfd:	6a 00                	push   $0x0
  pushl $127
80105dff:	6a 7f                	push   $0x7f
  jmp alltraps
80105e01:	e9 ea f6 ff ff       	jmp    801054f0 <alltraps>

80105e06 <vector128>:
.globl vector128
vector128:
  pushl $0
80105e06:	6a 00                	push   $0x0
  pushl $128
80105e08:	68 80 00 00 00       	push   $0x80
  jmp alltraps
80105e0d:	e9 de f6 ff ff       	jmp    801054f0 <alltraps>

80105e12 <vector129>:
.globl vector129
vector129:
  pushl $0
80105e12:	6a 00                	push   $0x0
  pushl $129
80105e14:	68 81 00 00 00       	push   $0x81
  jmp alltraps
80105e19:	e9 d2 f6 ff ff       	jmp    801054f0 <alltraps>

80105e1e <vector130>:
.globl vector130
vector130:
  pushl $0
80105e1e:	6a 00                	push   $0x0
  pushl $130
80105e20:	68 82 00 00 00       	push   $0x82
  jmp alltraps
80105e25:	e9 c6 f6 ff ff       	jmp    801054f0 <alltraps>

80105e2a <vector131>:
.globl vector131
vector131:
  pushl $0
80105e2a:	6a 00                	push   $0x0
  pushl $131
80105e2c:	68 83 00 00 00       	push   $0x83
  jmp alltraps
80105e31:	e9 ba f6 ff ff       	jmp    801054f0 <alltraps>

80105e36 <vector132>:
.globl vector132
vector132:
  pushl $0
80105e36:	6a 00                	push   $0x0
  pushl $132
80105e38:	68 84 00 00 00       	push   $0x84
  jmp alltraps
80105e3d:	e9 ae f6 ff ff       	jmp    801054f0 <alltraps>

80105e42 <vector133>:
.globl vector133
vector133:
  pushl $0
80105e42:	6a 00                	push   $0x0
  pushl $133
80105e44:	68 85 00 00 00       	push   $0x85
  jmp alltraps
80105e49:	e9 a2 f6 ff ff       	jmp    801054f0 <alltraps>

80105e4e <vector134>:
.globl vector134
vector134:
  pushl $0
80105e4e:	6a 00                	push   $0x0
  pushl $134
80105e50:	68 86 00 00 00       	push   $0x86
  jmp alltraps
80105e55:	e9 96 f6 ff ff       	jmp    801054f0 <alltraps>

80105e5a <vector135>:
.globl vector135
vector135:
  pushl $0
80105e5a:	6a 00                	push   $0x0
  pushl $135
80105e5c:	68 87 00 00 00       	push   $0x87
  jmp alltraps
80105e61:	e9 8a f6 ff ff       	jmp    801054f0 <alltraps>

80105e66 <vector136>:
.globl vector136
vector136:
  pushl $0
80105e66:	6a 00                	push   $0x0
  pushl $136
80105e68:	68 88 00 00 00       	push   $0x88
  jmp alltraps
80105e6d:	e9 7e f6 ff ff       	jmp    801054f0 <alltraps>

80105e72 <vector137>:
.globl vector137
vector137:
  pushl $0
80105e72:	6a 00                	push   $0x0
  pushl $137
80105e74:	68 89 00 00 00       	push   $0x89
  jmp alltraps
80105e79:	e9 72 f6 ff ff       	jmp    801054f0 <alltraps>

80105e7e <vector138>:
.globl vector138
vector138:
  pushl $0
80105e7e:	6a 00                	push   $0x0
  pushl $138
80105e80:	68 8a 00 00 00       	push   $0x8a
  jmp alltraps
80105e85:	e9 66 f6 ff ff       	jmp    801054f0 <alltraps>

80105e8a <vector139>:
.globl vector139
vector139:
  pushl $0
80105e8a:	6a 00                	push   $0x0
  pushl $139
80105e8c:	68 8b 00 00 00       	push   $0x8b
  jmp alltraps
80105e91:	e9 5a f6 ff ff       	jmp    801054f0 <alltraps>

80105e96 <vector140>:
.globl vector140
vector140:
  pushl $0
80105e96:	6a 00                	push   $0x0
  pushl $140
80105e98:	68 8c 00 00 00       	push   $0x8c
  jmp alltraps
80105e9d:	e9 4e f6 ff ff       	jmp    801054f0 <alltraps>

80105ea2 <vector141>:
.globl vector141
vector141:
  pushl $0
80105ea2:	6a 00                	push   $0x0
  pushl $141
80105ea4:	68 8d 00 00 00       	push   $0x8d
  jmp alltraps
80105ea9:	e9 42 f6 ff ff       	jmp    801054f0 <alltraps>

80105eae <vector142>:
.globl vector142
vector142:
  pushl $0
80105eae:	6a 00                	push   $0x0
  pushl $142
80105eb0:	68 8e 00 00 00       	push   $0x8e
  jmp alltraps
80105eb5:	e9 36 f6 ff ff       	jmp    801054f0 <alltraps>

80105eba <vector143>:
.globl vector143
vector143:
  pushl $0
80105eba:	6a 00                	push   $0x0
  pushl $143
80105ebc:	68 8f 00 00 00       	push   $0x8f
  jmp alltraps
80105ec1:	e9 2a f6 ff ff       	jmp    801054f0 <alltraps>

80105ec6 <vector144>:
.globl vector144
vector144:
  pushl $0
80105ec6:	6a 00                	push   $0x0
  pushl $144
80105ec8:	68 90 00 00 00       	push   $0x90
  jmp alltraps
80105ecd:	e9 1e f6 ff ff       	jmp    801054f0 <alltraps>

80105ed2 <vector145>:
.globl vector145
vector145:
  pushl $0
80105ed2:	6a 00                	push   $0x0
  pushl $145
80105ed4:	68 91 00 00 00       	push   $0x91
  jmp alltraps
80105ed9:	e9 12 f6 ff ff       	jmp    801054f0 <alltraps>

80105ede <vector146>:
.globl vector146
vector146:
  pushl $0
80105ede:	6a 00                	push   $0x0
  pushl $146
80105ee0:	68 92 00 00 00       	push   $0x92
  jmp alltraps
80105ee5:	e9 06 f6 ff ff       	jmp    801054f0 <alltraps>

80105eea <vector147>:
.globl vector147
vector147:
  pushl $0
80105eea:	6a 00                	push   $0x0
  pushl $147
80105eec:	68 93 00 00 00       	push   $0x93
  jmp alltraps
80105ef1:	e9 fa f5 ff ff       	jmp    801054f0 <alltraps>

80105ef6 <vector148>:
.globl vector148
vector148:
  pushl $0
80105ef6:	6a 00                	push   $0x0
  pushl $148
80105ef8:	68 94 00 00 00       	push   $0x94
  jmp alltraps
80105efd:	e9 ee f5 ff ff       	jmp    801054f0 <alltraps>

80105f02 <vector149>:
.globl vector149
vector149:
  pushl $0
80105f02:	6a 00                	push   $0x0
  pushl $149
80105f04:	68 95 00 00 00       	push   $0x95
  jmp alltraps
80105f09:	e9 e2 f5 ff ff       	jmp    801054f0 <alltraps>

80105f0e <vector150>:
.globl vector150
vector150:
  pushl $0
80105f0e:	6a 00                	push   $0x0
  pushl $150
80105f10:	68 96 00 00 00       	push   $0x96
  jmp alltraps
80105f15:	e9 d6 f5 ff ff       	jmp    801054f0 <alltraps>

80105f1a <vector151>:
.globl vector151
vector151:
  pushl $0
80105f1a:	6a 00                	push   $0x0
  pushl $151
80105f1c:	68 97 00 00 00       	push   $0x97
  jmp alltraps
80105f21:	e9 ca f5 ff ff       	jmp    801054f0 <alltraps>

80105f26 <vector152>:
.globl vector152
vector152:
  pushl $0
80105f26:	6a 00                	push   $0x0
  pushl $152
80105f28:	68 98 00 00 00       	push   $0x98
  jmp alltraps
80105f2d:	e9 be f5 ff ff       	jmp    801054f0 <alltraps>

80105f32 <vector153>:
.globl vector153
vector153:
  pushl $0
80105f32:	6a 00                	push   $0x0
  pushl $153
80105f34:	68 99 00 00 00       	push   $0x99
  jmp alltraps
80105f39:	e9 b2 f5 ff ff       	jmp    801054f0 <alltraps>

80105f3e <vector154>:
.globl vector154
vector154:
  pushl $0
80105f3e:	6a 00                	push   $0x0
  pushl $154
80105f40:	68 9a 00 00 00       	push   $0x9a
  jmp alltraps
80105f45:	e9 a6 f5 ff ff       	jmp    801054f0 <alltraps>

80105f4a <vector155>:
.globl vector155
vector155:
  pushl $0
80105f4a:	6a 00                	push   $0x0
  pushl $155
80105f4c:	68 9b 00 00 00       	push   $0x9b
  jmp alltraps
80105f51:	e9 9a f5 ff ff       	jmp    801054f0 <alltraps>

80105f56 <vector156>:
.globl vector156
vector156:
  pushl $0
80105f56:	6a 00                	push   $0x0
  pushl $156
80105f58:	68 9c 00 00 00       	push   $0x9c
  jmp alltraps
80105f5d:	e9 8e f5 ff ff       	jmp    801054f0 <alltraps>

80105f62 <vector157>:
.globl vector157
vector157:
  pushl $0
80105f62:	6a 00                	push   $0x0
  pushl $157
80105f64:	68 9d 00 00 00       	push   $0x9d
  jmp alltraps
80105f69:	e9 82 f5 ff ff       	jmp    801054f0 <alltraps>

80105f6e <vector158>:
.globl vector158
vector158:
  pushl $0
80105f6e:	6a 00                	push   $0x0
  pushl $158
80105f70:	68 9e 00 00 00       	push   $0x9e
  jmp alltraps
80105f75:	e9 76 f5 ff ff       	jmp    801054f0 <alltraps>

80105f7a <vector159>:
.globl vector159
vector159:
  pushl $0
80105f7a:	6a 00                	push   $0x0
  pushl $159
80105f7c:	68 9f 00 00 00       	push   $0x9f
  jmp alltraps
80105f81:	e9 6a f5 ff ff       	jmp    801054f0 <alltraps>

80105f86 <vector160>:
.globl vector160
vector160:
  pushl $0
80105f86:	6a 00                	push   $0x0
  pushl $160
80105f88:	68 a0 00 00 00       	push   $0xa0
  jmp alltraps
80105f8d:	e9 5e f5 ff ff       	jmp    801054f0 <alltraps>

80105f92 <vector161>:
.globl vector161
vector161:
  pushl $0
80105f92:	6a 00                	push   $0x0
  pushl $161
80105f94:	68 a1 00 00 00       	push   $0xa1
  jmp alltraps
80105f99:	e9 52 f5 ff ff       	jmp    801054f0 <alltraps>

80105f9e <vector162>:
.globl vector162
vector162:
  pushl $0
80105f9e:	6a 00                	push   $0x0
  pushl $162
80105fa0:	68 a2 00 00 00       	push   $0xa2
  jmp alltraps
80105fa5:	e9 46 f5 ff ff       	jmp    801054f0 <alltraps>

80105faa <vector163>:
.globl vector163
vector163:
  pushl $0
80105faa:	6a 00                	push   $0x0
  pushl $163
80105fac:	68 a3 00 00 00       	push   $0xa3
  jmp alltraps
80105fb1:	e9 3a f5 ff ff       	jmp    801054f0 <alltraps>

80105fb6 <vector164>:
.globl vector164
vector164:
  pushl $0
80105fb6:	6a 00                	push   $0x0
  pushl $164
80105fb8:	68 a4 00 00 00       	push   $0xa4
  jmp alltraps
80105fbd:	e9 2e f5 ff ff       	jmp    801054f0 <alltraps>

80105fc2 <vector165>:
.globl vector165
vector165:
  pushl $0
80105fc2:	6a 00                	push   $0x0
  pushl $165
80105fc4:	68 a5 00 00 00       	push   $0xa5
  jmp alltraps
80105fc9:	e9 22 f5 ff ff       	jmp    801054f0 <alltraps>

80105fce <vector166>:
.globl vector166
vector166:
  pushl $0
80105fce:	6a 00                	push   $0x0
  pushl $166
80105fd0:	68 a6 00 00 00       	push   $0xa6
  jmp alltraps
80105fd5:	e9 16 f5 ff ff       	jmp    801054f0 <alltraps>

80105fda <vector167>:
.globl vector167
vector167:
  pushl $0
80105fda:	6a 00                	push   $0x0
  pushl $167
80105fdc:	68 a7 00 00 00       	push   $0xa7
  jmp alltraps
80105fe1:	e9 0a f5 ff ff       	jmp    801054f0 <alltraps>

80105fe6 <vector168>:
.globl vector168
vector168:
  pushl $0
80105fe6:	6a 00                	push   $0x0
  pushl $168
80105fe8:	68 a8 00 00 00       	push   $0xa8
  jmp alltraps
80105fed:	e9 fe f4 ff ff       	jmp    801054f0 <alltraps>

80105ff2 <vector169>:
.globl vector169
vector169:
  pushl $0
80105ff2:	6a 00                	push   $0x0
  pushl $169
80105ff4:	68 a9 00 00 00       	push   $0xa9
  jmp alltraps
80105ff9:	e9 f2 f4 ff ff       	jmp    801054f0 <alltraps>

80105ffe <vector170>:
.globl vector170
vector170:
  pushl $0
80105ffe:	6a 00                	push   $0x0
  pushl $170
80106000:	68 aa 00 00 00       	push   $0xaa
  jmp alltraps
80106005:	e9 e6 f4 ff ff       	jmp    801054f0 <alltraps>

8010600a <vector171>:
.globl vector171
vector171:
  pushl $0
8010600a:	6a 00                	push   $0x0
  pushl $171
8010600c:	68 ab 00 00 00       	push   $0xab
  jmp alltraps
80106011:	e9 da f4 ff ff       	jmp    801054f0 <alltraps>

80106016 <vector172>:
.globl vector172
vector172:
  pushl $0
80106016:	6a 00                	push   $0x0
  pushl $172
80106018:	68 ac 00 00 00       	push   $0xac
  jmp alltraps
8010601d:	e9 ce f4 ff ff       	jmp    801054f0 <alltraps>

80106022 <vector173>:
.globl vector173
vector173:
  pushl $0
80106022:	6a 00                	push   $0x0
  pushl $173
80106024:	68 ad 00 00 00       	push   $0xad
  jmp alltraps
80106029:	e9 c2 f4 ff ff       	jmp    801054f0 <alltraps>

8010602e <vector174>:
.globl vector174
vector174:
  pushl $0
8010602e:	6a 00                	push   $0x0
  pushl $174
80106030:	68 ae 00 00 00       	push   $0xae
  jmp alltraps
80106035:	e9 b6 f4 ff ff       	jmp    801054f0 <alltraps>

8010603a <vector175>:
.globl vector175
vector175:
  pushl $0
8010603a:	6a 00                	push   $0x0
  pushl $175
8010603c:	68 af 00 00 00       	push   $0xaf
  jmp alltraps
80106041:	e9 aa f4 ff ff       	jmp    801054f0 <alltraps>

80106046 <vector176>:
.globl vector176
vector176:
  pushl $0
80106046:	6a 00                	push   $0x0
  pushl $176
80106048:	68 b0 00 00 00       	push   $0xb0
  jmp alltraps
8010604d:	e9 9e f4 ff ff       	jmp    801054f0 <alltraps>

80106052 <vector177>:
.globl vector177
vector177:
  pushl $0
80106052:	6a 00                	push   $0x0
  pushl $177
80106054:	68 b1 00 00 00       	push   $0xb1
  jmp alltraps
80106059:	e9 92 f4 ff ff       	jmp    801054f0 <alltraps>

8010605e <vector178>:
.globl vector178
vector178:
  pushl $0
8010605e:	6a 00                	push   $0x0
  pushl $178
80106060:	68 b2 00 00 00       	push   $0xb2
  jmp alltraps
80106065:	e9 86 f4 ff ff       	jmp    801054f0 <alltraps>

8010606a <vector179>:
.globl vector179
vector179:
  pushl $0
8010606a:	6a 00                	push   $0x0
  pushl $179
8010606c:	68 b3 00 00 00       	push   $0xb3
  jmp alltraps
80106071:	e9 7a f4 ff ff       	jmp    801054f0 <alltraps>

80106076 <vector180>:
.globl vector180
vector180:
  pushl $0
80106076:	6a 00                	push   $0x0
  pushl $180
80106078:	68 b4 00 00 00       	push   $0xb4
  jmp alltraps
8010607d:	e9 6e f4 ff ff       	jmp    801054f0 <alltraps>

80106082 <vector181>:
.globl vector181
vector181:
  pushl $0
80106082:	6a 00                	push   $0x0
  pushl $181
80106084:	68 b5 00 00 00       	push   $0xb5
  jmp alltraps
80106089:	e9 62 f4 ff ff       	jmp    801054f0 <alltraps>

8010608e <vector182>:
.globl vector182
vector182:
  pushl $0
8010608e:	6a 00                	push   $0x0
  pushl $182
80106090:	68 b6 00 00 00       	push   $0xb6
  jmp alltraps
80106095:	e9 56 f4 ff ff       	jmp    801054f0 <alltraps>

8010609a <vector183>:
.globl vector183
vector183:
  pushl $0
8010609a:	6a 00                	push   $0x0
  pushl $183
8010609c:	68 b7 00 00 00       	push   $0xb7
  jmp alltraps
801060a1:	e9 4a f4 ff ff       	jmp    801054f0 <alltraps>

801060a6 <vector184>:
.globl vector184
vector184:
  pushl $0
801060a6:	6a 00                	push   $0x0
  pushl $184
801060a8:	68 b8 00 00 00       	push   $0xb8
  jmp alltraps
801060ad:	e9 3e f4 ff ff       	jmp    801054f0 <alltraps>

801060b2 <vector185>:
.globl vector185
vector185:
  pushl $0
801060b2:	6a 00                	push   $0x0
  pushl $185
801060b4:	68 b9 00 00 00       	push   $0xb9
  jmp alltraps
801060b9:	e9 32 f4 ff ff       	jmp    801054f0 <alltraps>

801060be <vector186>:
.globl vector186
vector186:
  pushl $0
801060be:	6a 00                	push   $0x0
  pushl $186
801060c0:	68 ba 00 00 00       	push   $0xba
  jmp alltraps
801060c5:	e9 26 f4 ff ff       	jmp    801054f0 <alltraps>

801060ca <vector187>:
.globl vector187
vector187:
  pushl $0
801060ca:	6a 00                	push   $0x0
  pushl $187
801060cc:	68 bb 00 00 00       	push   $0xbb
  jmp alltraps
801060d1:	e9 1a f4 ff ff       	jmp    801054f0 <alltraps>

801060d6 <vector188>:
.globl vector188
vector188:
  pushl $0
801060d6:	6a 00                	push   $0x0
  pushl $188
801060d8:	68 bc 00 00 00       	push   $0xbc
  jmp alltraps
801060dd:	e9 0e f4 ff ff       	jmp    801054f0 <alltraps>

801060e2 <vector189>:
.globl vector189
vector189:
  pushl $0
801060e2:	6a 00                	push   $0x0
  pushl $189
801060e4:	68 bd 00 00 00       	push   $0xbd
  jmp alltraps
801060e9:	e9 02 f4 ff ff       	jmp    801054f0 <alltraps>

801060ee <vector190>:
.globl vector190
vector190:
  pushl $0
801060ee:	6a 00                	push   $0x0
  pushl $190
801060f0:	68 be 00 00 00       	push   $0xbe
  jmp alltraps
801060f5:	e9 f6 f3 ff ff       	jmp    801054f0 <alltraps>

801060fa <vector191>:
.globl vector191
vector191:
  pushl $0
801060fa:	6a 00                	push   $0x0
  pushl $191
801060fc:	68 bf 00 00 00       	push   $0xbf
  jmp alltraps
80106101:	e9 ea f3 ff ff       	jmp    801054f0 <alltraps>

80106106 <vector192>:
.globl vector192
vector192:
  pushl $0
80106106:	6a 00                	push   $0x0
  pushl $192
80106108:	68 c0 00 00 00       	push   $0xc0
  jmp alltraps
8010610d:	e9 de f3 ff ff       	jmp    801054f0 <alltraps>

80106112 <vector193>:
.globl vector193
vector193:
  pushl $0
80106112:	6a 00                	push   $0x0
  pushl $193
80106114:	68 c1 00 00 00       	push   $0xc1
  jmp alltraps
80106119:	e9 d2 f3 ff ff       	jmp    801054f0 <alltraps>

8010611e <vector194>:
.globl vector194
vector194:
  pushl $0
8010611e:	6a 00                	push   $0x0
  pushl $194
80106120:	68 c2 00 00 00       	push   $0xc2
  jmp alltraps
80106125:	e9 c6 f3 ff ff       	jmp    801054f0 <alltraps>

8010612a <vector195>:
.globl vector195
vector195:
  pushl $0
8010612a:	6a 00                	push   $0x0
  pushl $195
8010612c:	68 c3 00 00 00       	push   $0xc3
  jmp alltraps
80106131:	e9 ba f3 ff ff       	jmp    801054f0 <alltraps>

80106136 <vector196>:
.globl vector196
vector196:
  pushl $0
80106136:	6a 00                	push   $0x0
  pushl $196
80106138:	68 c4 00 00 00       	push   $0xc4
  jmp alltraps
8010613d:	e9 ae f3 ff ff       	jmp    801054f0 <alltraps>

80106142 <vector197>:
.globl vector197
vector197:
  pushl $0
80106142:	6a 00                	push   $0x0
  pushl $197
80106144:	68 c5 00 00 00       	push   $0xc5
  jmp alltraps
80106149:	e9 a2 f3 ff ff       	jmp    801054f0 <alltraps>

8010614e <vector198>:
.globl vector198
vector198:
  pushl $0
8010614e:	6a 00                	push   $0x0
  pushl $198
80106150:	68 c6 00 00 00       	push   $0xc6
  jmp alltraps
80106155:	e9 96 f3 ff ff       	jmp    801054f0 <alltraps>

8010615a <vector199>:
.globl vector199
vector199:
  pushl $0
8010615a:	6a 00                	push   $0x0
  pushl $199
8010615c:	68 c7 00 00 00       	push   $0xc7
  jmp alltraps
80106161:	e9 8a f3 ff ff       	jmp    801054f0 <alltraps>

80106166 <vector200>:
.globl vector200
vector200:
  pushl $0
80106166:	6a 00                	push   $0x0
  pushl $200
80106168:	68 c8 00 00 00       	push   $0xc8
  jmp alltraps
8010616d:	e9 7e f3 ff ff       	jmp    801054f0 <alltraps>

80106172 <vector201>:
.globl vector201
vector201:
  pushl $0
80106172:	6a 00                	push   $0x0
  pushl $201
80106174:	68 c9 00 00 00       	push   $0xc9
  jmp alltraps
80106179:	e9 72 f3 ff ff       	jmp    801054f0 <alltraps>

8010617e <vector202>:
.globl vector202
vector202:
  pushl $0
8010617e:	6a 00                	push   $0x0
  pushl $202
80106180:	68 ca 00 00 00       	push   $0xca
  jmp alltraps
80106185:	e9 66 f3 ff ff       	jmp    801054f0 <alltraps>

8010618a <vector203>:
.globl vector203
vector203:
  pushl $0
8010618a:	6a 00                	push   $0x0
  pushl $203
8010618c:	68 cb 00 00 00       	push   $0xcb
  jmp alltraps
80106191:	e9 5a f3 ff ff       	jmp    801054f0 <alltraps>

80106196 <vector204>:
.globl vector204
vector204:
  pushl $0
80106196:	6a 00                	push   $0x0
  pushl $204
80106198:	68 cc 00 00 00       	push   $0xcc
  jmp alltraps
8010619d:	e9 4e f3 ff ff       	jmp    801054f0 <alltraps>

801061a2 <vector205>:
.globl vector205
vector205:
  pushl $0
801061a2:	6a 00                	push   $0x0
  pushl $205
801061a4:	68 cd 00 00 00       	push   $0xcd
  jmp alltraps
801061a9:	e9 42 f3 ff ff       	jmp    801054f0 <alltraps>

801061ae <vector206>:
.globl vector206
vector206:
  pushl $0
801061ae:	6a 00                	push   $0x0
  pushl $206
801061b0:	68 ce 00 00 00       	push   $0xce
  jmp alltraps
801061b5:	e9 36 f3 ff ff       	jmp    801054f0 <alltraps>

801061ba <vector207>:
.globl vector207
vector207:
  pushl $0
801061ba:	6a 00                	push   $0x0
  pushl $207
801061bc:	68 cf 00 00 00       	push   $0xcf
  jmp alltraps
801061c1:	e9 2a f3 ff ff       	jmp    801054f0 <alltraps>

801061c6 <vector208>:
.globl vector208
vector208:
  pushl $0
801061c6:	6a 00                	push   $0x0
  pushl $208
801061c8:	68 d0 00 00 00       	push   $0xd0
  jmp alltraps
801061cd:	e9 1e f3 ff ff       	jmp    801054f0 <alltraps>

801061d2 <vector209>:
.globl vector209
vector209:
  pushl $0
801061d2:	6a 00                	push   $0x0
  pushl $209
801061d4:	68 d1 00 00 00       	push   $0xd1
  jmp alltraps
801061d9:	e9 12 f3 ff ff       	jmp    801054f0 <alltraps>

801061de <vector210>:
.globl vector210
vector210:
  pushl $0
801061de:	6a 00                	push   $0x0
  pushl $210
801061e0:	68 d2 00 00 00       	push   $0xd2
  jmp alltraps
801061e5:	e9 06 f3 ff ff       	jmp    801054f0 <alltraps>

801061ea <vector211>:
.globl vector211
vector211:
  pushl $0
801061ea:	6a 00                	push   $0x0
  pushl $211
801061ec:	68 d3 00 00 00       	push   $0xd3
  jmp alltraps
801061f1:	e9 fa f2 ff ff       	jmp    801054f0 <alltraps>

801061f6 <vector212>:
.globl vector212
vector212:
  pushl $0
801061f6:	6a 00                	push   $0x0
  pushl $212
801061f8:	68 d4 00 00 00       	push   $0xd4
  jmp alltraps
801061fd:	e9 ee f2 ff ff       	jmp    801054f0 <alltraps>

80106202 <vector213>:
.globl vector213
vector213:
  pushl $0
80106202:	6a 00                	push   $0x0
  pushl $213
80106204:	68 d5 00 00 00       	push   $0xd5
  jmp alltraps
80106209:	e9 e2 f2 ff ff       	jmp    801054f0 <alltraps>

8010620e <vector214>:
.globl vector214
vector214:
  pushl $0
8010620e:	6a 00                	push   $0x0
  pushl $214
80106210:	68 d6 00 00 00       	push   $0xd6
  jmp alltraps
80106215:	e9 d6 f2 ff ff       	jmp    801054f0 <alltraps>

8010621a <vector215>:
.globl vector215
vector215:
  pushl $0
8010621a:	6a 00                	push   $0x0
  pushl $215
8010621c:	68 d7 00 00 00       	push   $0xd7
  jmp alltraps
80106221:	e9 ca f2 ff ff       	jmp    801054f0 <alltraps>

80106226 <vector216>:
.globl vector216
vector216:
  pushl $0
80106226:	6a 00                	push   $0x0
  pushl $216
80106228:	68 d8 00 00 00       	push   $0xd8
  jmp alltraps
8010622d:	e9 be f2 ff ff       	jmp    801054f0 <alltraps>

80106232 <vector217>:
.globl vector217
vector217:
  pushl $0
80106232:	6a 00                	push   $0x0
  pushl $217
80106234:	68 d9 00 00 00       	push   $0xd9
  jmp alltraps
80106239:	e9 b2 f2 ff ff       	jmp    801054f0 <alltraps>

8010623e <vector218>:
.globl vector218
vector218:
  pushl $0
8010623e:	6a 00                	push   $0x0
  pushl $218
80106240:	68 da 00 00 00       	push   $0xda
  jmp alltraps
80106245:	e9 a6 f2 ff ff       	jmp    801054f0 <alltraps>

8010624a <vector219>:
.globl vector219
vector219:
  pushl $0
8010624a:	6a 00                	push   $0x0
  pushl $219
8010624c:	68 db 00 00 00       	push   $0xdb
  jmp alltraps
80106251:	e9 9a f2 ff ff       	jmp    801054f0 <alltraps>

80106256 <vector220>:
.globl vector220
vector220:
  pushl $0
80106256:	6a 00                	push   $0x0
  pushl $220
80106258:	68 dc 00 00 00       	push   $0xdc
  jmp alltraps
8010625d:	e9 8e f2 ff ff       	jmp    801054f0 <alltraps>

80106262 <vector221>:
.globl vector221
vector221:
  pushl $0
80106262:	6a 00                	push   $0x0
  pushl $221
80106264:	68 dd 00 00 00       	push   $0xdd
  jmp alltraps
80106269:	e9 82 f2 ff ff       	jmp    801054f0 <alltraps>

8010626e <vector222>:
.globl vector222
vector222:
  pushl $0
8010626e:	6a 00                	push   $0x0
  pushl $222
80106270:	68 de 00 00 00       	push   $0xde
  jmp alltraps
80106275:	e9 76 f2 ff ff       	jmp    801054f0 <alltraps>

8010627a <vector223>:
.globl vector223
vector223:
  pushl $0
8010627a:	6a 00                	push   $0x0
  pushl $223
8010627c:	68 df 00 00 00       	push   $0xdf
  jmp alltraps
80106281:	e9 6a f2 ff ff       	jmp    801054f0 <alltraps>

80106286 <vector224>:
.globl vector224
vector224:
  pushl $0
80106286:	6a 00                	push   $0x0
  pushl $224
80106288:	68 e0 00 00 00       	push   $0xe0
  jmp alltraps
8010628d:	e9 5e f2 ff ff       	jmp    801054f0 <alltraps>

80106292 <vector225>:
.globl vector225
vector225:
  pushl $0
80106292:	6a 00                	push   $0x0
  pushl $225
80106294:	68 e1 00 00 00       	push   $0xe1
  jmp alltraps
80106299:	e9 52 f2 ff ff       	jmp    801054f0 <alltraps>

8010629e <vector226>:
.globl vector226
vector226:
  pushl $0
8010629e:	6a 00                	push   $0x0
  pushl $226
801062a0:	68 e2 00 00 00       	push   $0xe2
  jmp alltraps
801062a5:	e9 46 f2 ff ff       	jmp    801054f0 <alltraps>

801062aa <vector227>:
.globl vector227
vector227:
  pushl $0
801062aa:	6a 00                	push   $0x0
  pushl $227
801062ac:	68 e3 00 00 00       	push   $0xe3
  jmp alltraps
801062b1:	e9 3a f2 ff ff       	jmp    801054f0 <alltraps>

801062b6 <vector228>:
.globl vector228
vector228:
  pushl $0
801062b6:	6a 00                	push   $0x0
  pushl $228
801062b8:	68 e4 00 00 00       	push   $0xe4
  jmp alltraps
801062bd:	e9 2e f2 ff ff       	jmp    801054f0 <alltraps>

801062c2 <vector229>:
.globl vector229
vector229:
  pushl $0
801062c2:	6a 00                	push   $0x0
  pushl $229
801062c4:	68 e5 00 00 00       	push   $0xe5
  jmp alltraps
801062c9:	e9 22 f2 ff ff       	jmp    801054f0 <alltraps>

801062ce <vector230>:
.globl vector230
vector230:
  pushl $0
801062ce:	6a 00                	push   $0x0
  pushl $230
801062d0:	68 e6 00 00 00       	push   $0xe6
  jmp alltraps
801062d5:	e9 16 f2 ff ff       	jmp    801054f0 <alltraps>

801062da <vector231>:
.globl vector231
vector231:
  pushl $0
801062da:	6a 00                	push   $0x0
  pushl $231
801062dc:	68 e7 00 00 00       	push   $0xe7
  jmp alltraps
801062e1:	e9 0a f2 ff ff       	jmp    801054f0 <alltraps>

801062e6 <vector232>:
.globl vector232
vector232:
  pushl $0
801062e6:	6a 00                	push   $0x0
  pushl $232
801062e8:	68 e8 00 00 00       	push   $0xe8
  jmp alltraps
801062ed:	e9 fe f1 ff ff       	jmp    801054f0 <alltraps>

801062f2 <vector233>:
.globl vector233
vector233:
  pushl $0
801062f2:	6a 00                	push   $0x0
  pushl $233
801062f4:	68 e9 00 00 00       	push   $0xe9
  jmp alltraps
801062f9:	e9 f2 f1 ff ff       	jmp    801054f0 <alltraps>

801062fe <vector234>:
.globl vector234
vector234:
  pushl $0
801062fe:	6a 00                	push   $0x0
  pushl $234
80106300:	68 ea 00 00 00       	push   $0xea
  jmp alltraps
80106305:	e9 e6 f1 ff ff       	jmp    801054f0 <alltraps>

8010630a <vector235>:
.globl vector235
vector235:
  pushl $0
8010630a:	6a 00                	push   $0x0
  pushl $235
8010630c:	68 eb 00 00 00       	push   $0xeb
  jmp alltraps
80106311:	e9 da f1 ff ff       	jmp    801054f0 <alltraps>

80106316 <vector236>:
.globl vector236
vector236:
  pushl $0
80106316:	6a 00                	push   $0x0
  pushl $236
80106318:	68 ec 00 00 00       	push   $0xec
  jmp alltraps
8010631d:	e9 ce f1 ff ff       	jmp    801054f0 <alltraps>

80106322 <vector237>:
.globl vector237
vector237:
  pushl $0
80106322:	6a 00                	push   $0x0
  pushl $237
80106324:	68 ed 00 00 00       	push   $0xed
  jmp alltraps
80106329:	e9 c2 f1 ff ff       	jmp    801054f0 <alltraps>

8010632e <vector238>:
.globl vector238
vector238:
  pushl $0
8010632e:	6a 00                	push   $0x0
  pushl $238
80106330:	68 ee 00 00 00       	push   $0xee
  jmp alltraps
80106335:	e9 b6 f1 ff ff       	jmp    801054f0 <alltraps>

8010633a <vector239>:
.globl vector239
vector239:
  pushl $0
8010633a:	6a 00                	push   $0x0
  pushl $239
8010633c:	68 ef 00 00 00       	push   $0xef
  jmp alltraps
80106341:	e9 aa f1 ff ff       	jmp    801054f0 <alltraps>

80106346 <vector240>:
.globl vector240
vector240:
  pushl $0
80106346:	6a 00                	push   $0x0
  pushl $240
80106348:	68 f0 00 00 00       	push   $0xf0
  jmp alltraps
8010634d:	e9 9e f1 ff ff       	jmp    801054f0 <alltraps>

80106352 <vector241>:
.globl vector241
vector241:
  pushl $0
80106352:	6a 00                	push   $0x0
  pushl $241
80106354:	68 f1 00 00 00       	push   $0xf1
  jmp alltraps
80106359:	e9 92 f1 ff ff       	jmp    801054f0 <alltraps>

8010635e <vector242>:
.globl vector242
vector242:
  pushl $0
8010635e:	6a 00                	push   $0x0
  pushl $242
80106360:	68 f2 00 00 00       	push   $0xf2
  jmp alltraps
80106365:	e9 86 f1 ff ff       	jmp    801054f0 <alltraps>

8010636a <vector243>:
.globl vector243
vector243:
  pushl $0
8010636a:	6a 00                	push   $0x0
  pushl $243
8010636c:	68 f3 00 00 00       	push   $0xf3
  jmp alltraps
80106371:	e9 7a f1 ff ff       	jmp    801054f0 <alltraps>

80106376 <vector244>:
.globl vector244
vector244:
  pushl $0
80106376:	6a 00                	push   $0x0
  pushl $244
80106378:	68 f4 00 00 00       	push   $0xf4
  jmp alltraps
8010637d:	e9 6e f1 ff ff       	jmp    801054f0 <alltraps>

80106382 <vector245>:
.globl vector245
vector245:
  pushl $0
80106382:	6a 00                	push   $0x0
  pushl $245
80106384:	68 f5 00 00 00       	push   $0xf5
  jmp alltraps
80106389:	e9 62 f1 ff ff       	jmp    801054f0 <alltraps>

8010638e <vector246>:
.globl vector246
vector246:
  pushl $0
8010638e:	6a 00                	push   $0x0
  pushl $246
80106390:	68 f6 00 00 00       	push   $0xf6
  jmp alltraps
80106395:	e9 56 f1 ff ff       	jmp    801054f0 <alltraps>

8010639a <vector247>:
.globl vector247
vector247:
  pushl $0
8010639a:	6a 00                	push   $0x0
  pushl $247
8010639c:	68 f7 00 00 00       	push   $0xf7
  jmp alltraps
801063a1:	e9 4a f1 ff ff       	jmp    801054f0 <alltraps>

801063a6 <vector248>:
.globl vector248
vector248:
  pushl $0
801063a6:	6a 00                	push   $0x0
  pushl $248
801063a8:	68 f8 00 00 00       	push   $0xf8
  jmp alltraps
801063ad:	e9 3e f1 ff ff       	jmp    801054f0 <alltraps>

801063b2 <vector249>:
.globl vector249
vector249:
  pushl $0
801063b2:	6a 00                	push   $0x0
  pushl $249
801063b4:	68 f9 00 00 00       	push   $0xf9
  jmp alltraps
801063b9:	e9 32 f1 ff ff       	jmp    801054f0 <alltraps>

801063be <vector250>:
.globl vector250
vector250:
  pushl $0
801063be:	6a 00                	push   $0x0
  pushl $250
801063c0:	68 fa 00 00 00       	push   $0xfa
  jmp alltraps
801063c5:	e9 26 f1 ff ff       	jmp    801054f0 <alltraps>

801063ca <vector251>:
.globl vector251
vector251:
  pushl $0
801063ca:	6a 00                	push   $0x0
  pushl $251
801063cc:	68 fb 00 00 00       	push   $0xfb
  jmp alltraps
801063d1:	e9 1a f1 ff ff       	jmp    801054f0 <alltraps>

801063d6 <vector252>:
.globl vector252
vector252:
  pushl $0
801063d6:	6a 00                	push   $0x0
  pushl $252
801063d8:	68 fc 00 00 00       	push   $0xfc
  jmp alltraps
801063dd:	e9 0e f1 ff ff       	jmp    801054f0 <alltraps>

801063e2 <vector253>:
.globl vector253
vector253:
  pushl $0
801063e2:	6a 00                	push   $0x0
  pushl $253
801063e4:	68 fd 00 00 00       	push   $0xfd
  jmp alltraps
801063e9:	e9 02 f1 ff ff       	jmp    801054f0 <alltraps>

801063ee <vector254>:
.globl vector254
vector254:
  pushl $0
801063ee:	6a 00                	push   $0x0
  pushl $254
801063f0:	68 fe 00 00 00       	push   $0xfe
  jmp alltraps
801063f5:	e9 f6 f0 ff ff       	jmp    801054f0 <alltraps>

801063fa <vector255>:
.globl vector255
vector255:
  pushl $0
801063fa:	6a 00                	push   $0x0
  pushl $255
801063fc:	68 ff 00 00 00       	push   $0xff
  jmp alltraps
80106401:	e9 ea f0 ff ff       	jmp    801054f0 <alltraps>
	...

80106410 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
80106410:	55                   	push   %ebp
80106411:	89 e5                	mov    %esp,%ebp
80106413:	83 ec 38             	sub    $0x38,%esp
80106416:	89 5d f4             	mov    %ebx,-0xc(%ebp)
80106419:	89 d3                	mov    %edx,%ebx
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
8010641b:	c1 ea 16             	shr    $0x16,%edx
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
8010641e:	89 7d fc             	mov    %edi,-0x4(%ebp)
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
80106421:	8d 3c 90             	lea    (%eax,%edx,4),%edi
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
80106424:	89 75 f8             	mov    %esi,-0x8(%ebp)
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
80106427:	8b 37                	mov    (%edi),%esi
80106429:	89 f2                	mov    %esi,%edx
8010642b:	83 e2 01             	and    $0x1,%edx
8010642e:	74 28                	je     80106458 <walkpgdir+0x48>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80106430:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
80106436:	81 c6 00 00 00 80    	add    $0x80000000,%esi
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
8010643c:	c1 eb 0a             	shr    $0xa,%ebx
8010643f:	81 e3 fc 0f 00 00    	and    $0xffc,%ebx
80106445:	8d 04 1e             	lea    (%esi,%ebx,1),%eax
}
80106448:	8b 5d f4             	mov    -0xc(%ebp),%ebx
8010644b:	8b 75 f8             	mov    -0x8(%ebp),%esi
8010644e:	8b 7d fc             	mov    -0x4(%ebp),%edi
80106451:	89 ec                	mov    %ebp,%esp
80106453:	5d                   	pop    %ebp
80106454:	c3                   	ret    
80106455:	8d 76 00             	lea    0x0(%esi),%esi
  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
      return 0;
80106458:	31 c0                	xor    %eax,%eax

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
8010645a:	85 c9                	test   %ecx,%ecx
8010645c:	74 ea                	je     80106448 <walkpgdir+0x38>
8010645e:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80106461:	e8 4a c0 ff ff       	call   801024b0 <kalloc>
      return 0;
80106466:	8b 55 e4             	mov    -0x1c(%ebp),%edx

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80106469:	89 c6                	mov    %eax,%esi
      return 0;
8010646b:	89 d0                	mov    %edx,%eax

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
8010646d:	85 f6                	test   %esi,%esi
8010646f:	74 d7                	je     80106448 <walkpgdir+0x38>
      return 0;
    // Make sure all those PTE_P bits are zero.
    memset(pgtab, 0, PGSIZE);
80106471:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80106478:	00 
80106479:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80106480:	00 
80106481:	89 34 24             	mov    %esi,(%esp)
80106484:	e8 b7 de ff ff       	call   80104340 <memset>
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
80106489:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
8010648f:	83 c8 07             	or     $0x7,%eax
80106492:	89 07                	mov    %eax,(%edi)
80106494:	eb a6                	jmp    8010643c <walkpgdir+0x2c>
80106496:	8d 76 00             	lea    0x0(%esi),%esi
80106499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801064a0 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
801064a0:	55                   	push   %ebp
801064a1:	89 e5                	mov    %esp,%ebp
801064a3:	57                   	push   %edi
801064a4:	56                   	push   %esi
801064a5:	53                   	push   %ebx
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
801064a6:	89 d3                	mov    %edx,%ebx
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
801064a8:	8d 7c 0a ff          	lea    -0x1(%edx,%ecx,1),%edi
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
801064ac:	83 ec 2c             	sub    $0x2c,%esp
801064af:	8b 75 08             	mov    0x8(%ebp),%esi
801064b2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
801064b5:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
801064bb:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
801064c1:	83 4d 0c 01          	orl    $0x1,0xc(%ebp)
801064c5:	eb 1d                	jmp    801064e4 <mappages+0x44>
801064c7:	90                   	nop
  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
801064c8:	f6 00 01             	testb  $0x1,(%eax)
801064cb:	75 45                	jne    80106512 <mappages+0x72>
      panic("remap");
    *pte = pa | perm | PTE_P;
801064cd:	8b 55 0c             	mov    0xc(%ebp),%edx
801064d0:	09 f2                	or     %esi,%edx
    if(a == last)
801064d2:	39 fb                	cmp    %edi,%ebx
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
801064d4:	89 10                	mov    %edx,(%eax)
    if(a == last)
801064d6:	74 30                	je     80106508 <mappages+0x68>
      break;
    a += PGSIZE;
801064d8:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    pa += PGSIZE;
801064de:	81 c6 00 10 00 00    	add    $0x1000,%esi
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
801064e4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801064e7:	b9 01 00 00 00       	mov    $0x1,%ecx
801064ec:	89 da                	mov    %ebx,%edx
801064ee:	e8 1d ff ff ff       	call   80106410 <walkpgdir>
801064f3:	85 c0                	test   %eax,%eax
801064f5:	75 d1                	jne    801064c8 <mappages+0x28>
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
801064f7:	83 c4 2c             	add    $0x2c,%esp

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
801064fa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
801064ff:	5b                   	pop    %ebx
80106500:	5e                   	pop    %esi
80106501:	5f                   	pop    %edi
80106502:	5d                   	pop    %ebp
80106503:	c3                   	ret    
80106504:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106508:	83 c4 2c             	add    $0x2c,%esp
    if(a == last)
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
8010650b:	31 c0                	xor    %eax,%eax
}
8010650d:	5b                   	pop    %ebx
8010650e:	5e                   	pop    %esi
8010650f:	5f                   	pop    %edi
80106510:	5d                   	pop    %ebp
80106511:	c3                   	ret    
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
80106512:	c7 04 24 e8 75 10 80 	movl   $0x801075e8,(%esp)
80106519:	e8 52 9e ff ff       	call   80100370 <panic>
8010651e:	66 90                	xchg   %ax,%ax

80106520 <seginit>:

// Set up CPU's kernel segment descriptors.
// Run once on entry on each CPU.
void
seginit(void)
{
80106520:	55                   	push   %ebp
80106521:	89 e5                	mov    %esp,%ebp
80106523:	83 ec 18             	sub    $0x18,%esp

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpuid()];
80106526:	e8 e5 d1 ff ff       	call   80103710 <cpuid>
8010652b:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
80106531:	05 80 27 11 80       	add    $0x80112780,%eax
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106536:	c6 40 7d 9a          	movb   $0x9a,0x7d(%eax)
8010653a:	c6 40 7e cf          	movb   $0xcf,0x7e(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
8010653e:	c6 80 85 00 00 00 92 	movb   $0x92,0x85(%eax)
80106545:	c6 80 86 00 00 00 cf 	movb   $0xcf,0x86(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
8010654c:	c6 80 8d 00 00 00 fa 	movb   $0xfa,0x8d(%eax)
80106553:	c6 80 8e 00 00 00 cf 	movb   $0xcf,0x8e(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
8010655a:	c6 80 95 00 00 00 f2 	movb   $0xf2,0x95(%eax)
80106561:	c6 80 96 00 00 00 cf 	movb   $0xcf,0x96(%eax)
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpuid()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106568:	66 c7 40 78 ff ff    	movw   $0xffff,0x78(%eax)
8010656e:	66 c7 40 7a 00 00    	movw   $0x0,0x7a(%eax)
80106574:	c6 40 7c 00          	movb   $0x0,0x7c(%eax)
80106578:	c6 40 7f 00          	movb   $0x0,0x7f(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
8010657c:	66 c7 80 80 00 00 00 	movw   $0xffff,0x80(%eax)
80106583:	ff ff 
80106585:	66 c7 80 82 00 00 00 	movw   $0x0,0x82(%eax)
8010658c:	00 00 
8010658e:	c6 80 84 00 00 00 00 	movb   $0x0,0x84(%eax)
80106595:	c6 80 87 00 00 00 00 	movb   $0x0,0x87(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
8010659c:	66 c7 80 88 00 00 00 	movw   $0xffff,0x88(%eax)
801065a3:	ff ff 
801065a5:	66 c7 80 8a 00 00 00 	movw   $0x0,0x8a(%eax)
801065ac:	00 00 
801065ae:	c6 80 8c 00 00 00 00 	movb   $0x0,0x8c(%eax)
801065b5:	c6 80 8f 00 00 00 00 	movb   $0x0,0x8f(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
801065bc:	66 c7 80 90 00 00 00 	movw   $0xffff,0x90(%eax)
801065c3:	ff ff 
801065c5:	66 c7 80 92 00 00 00 	movw   $0x0,0x92(%eax)
801065cc:	00 00 
801065ce:	c6 80 94 00 00 00 00 	movb   $0x0,0x94(%eax)
801065d5:	c6 80 97 00 00 00 00 	movb   $0x0,0x97(%eax)
  lgdt(c->gdt, sizeof(c->gdt));
801065dc:	83 c0 70             	add    $0x70,%eax
static inline void
lgdt(struct segdesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
801065df:	66 c7 45 f2 2f 00    	movw   $0x2f,-0xe(%ebp)
  pd[1] = (uint)p;
801065e5:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
801065e9:	c1 e8 10             	shr    $0x10,%eax
801065ec:	66 89 45 f6          	mov    %ax,-0xa(%ebp)

  asm volatile("lgdt (%0)" : : "r" (pd));
801065f0:	8d 45 f2             	lea    -0xe(%ebp),%eax
801065f3:	0f 01 10             	lgdtl  (%eax)
}
801065f6:	c9                   	leave  
801065f7:	c3                   	ret    
801065f8:	90                   	nop
801065f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106600 <switchkvm>:
// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106600:	a1 a4 54 11 80       	mov    0x801154a4,%eax

// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
80106605:	55                   	push   %ebp
80106606:	89 e5                	mov    %esp,%ebp
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106608:	05 00 00 00 80       	add    $0x80000000,%eax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
8010660d:	0f 22 d8             	mov    %eax,%cr3
}
80106610:	5d                   	pop    %ebp
80106611:	c3                   	ret    
80106612:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106620 <switchuvm>:

// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
80106620:	55                   	push   %ebp
80106621:	89 e5                	mov    %esp,%ebp
80106623:	57                   	push   %edi
80106624:	56                   	push   %esi
80106625:	53                   	push   %ebx
80106626:	83 ec 2c             	sub    $0x2c,%esp
80106629:	8b 75 08             	mov    0x8(%ebp),%esi
  if(p == 0)
8010662c:	85 f6                	test   %esi,%esi
8010662e:	0f 84 c4 00 00 00    	je     801066f8 <switchuvm+0xd8>
    panic("switchuvm: no process");
  if(p->kstack == 0)
80106634:	8b 56 08             	mov    0x8(%esi),%edx
80106637:	85 d2                	test   %edx,%edx
80106639:	0f 84 d1 00 00 00    	je     80106710 <switchuvm+0xf0>
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
8010663f:	8b 46 04             	mov    0x4(%esi),%eax
80106642:	85 c0                	test   %eax,%eax
80106644:	0f 84 ba 00 00 00    	je     80106704 <switchuvm+0xe4>
    panic("switchuvm: no pgdir");

  pushcli();
8010664a:	e8 41 db ff ff       	call   80104190 <pushcli>
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
8010664f:	e8 3c d0 ff ff       	call   80103690 <mycpu>
80106654:	89 c3                	mov    %eax,%ebx
80106656:	e8 35 d0 ff ff       	call   80103690 <mycpu>
8010665b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010665e:	e8 2d d0 ff ff       	call   80103690 <mycpu>
80106663:	89 c7                	mov    %eax,%edi
80106665:	e8 26 d0 ff ff       	call   80103690 <mycpu>
8010666a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010666d:	66 c7 83 98 00 00 00 	movw   $0x67,0x98(%ebx)
80106674:	67 00 
80106676:	c6 83 9d 00 00 00 99 	movb   $0x99,0x9d(%ebx)
8010667d:	c6 83 9e 00 00 00 40 	movb   $0x40,0x9e(%ebx)
80106684:	83 c2 08             	add    $0x8,%edx
80106687:	66 89 93 9a 00 00 00 	mov    %dx,0x9a(%ebx)
8010668e:	8d 57 08             	lea    0x8(%edi),%edx
80106691:	83 c0 08             	add    $0x8,%eax
80106694:	c1 ea 10             	shr    $0x10,%edx
80106697:	c1 e8 18             	shr    $0x18,%eax
8010669a:	88 93 9c 00 00 00    	mov    %dl,0x9c(%ebx)
801066a0:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
                                sizeof(mycpu()->ts)-1, 0);
  mycpu()->gdt[SEG_TSS].s = 0;
801066a6:	e8 e5 cf ff ff       	call   80103690 <mycpu>
801066ab:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
801066b2:	e8 d9 cf ff ff       	call   80103690 <mycpu>
801066b7:	66 c7 40 10 10 00    	movw   $0x10,0x10(%eax)
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
801066bd:	e8 ce cf ff ff       	call   80103690 <mycpu>
801066c2:	8b 56 08             	mov    0x8(%esi),%edx
801066c5:	81 c2 00 10 00 00    	add    $0x1000,%edx
801066cb:	89 50 0c             	mov    %edx,0xc(%eax)
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  mycpu()->ts.iomb = (ushort) 0xFFFF;
801066ce:	e8 bd cf ff ff       	call   80103690 <mycpu>
801066d3:	66 c7 40 6e ff ff    	movw   $0xffff,0x6e(%eax)
}

static inline void
ltr(ushort sel)
{
  asm volatile("ltr %0" : : "r" (sel));
801066d9:	b8 28 00 00 00       	mov    $0x28,%eax
801066de:	0f 00 d8             	ltr    %ax
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
801066e1:	8b 46 04             	mov    0x4(%esi),%eax
801066e4:	05 00 00 00 80       	add    $0x80000000,%eax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
801066e9:	0f 22 d8             	mov    %eax,%cr3
  popcli();
}
801066ec:	83 c4 2c             	add    $0x2c,%esp
801066ef:	5b                   	pop    %ebx
801066f0:	5e                   	pop    %esi
801066f1:	5f                   	pop    %edi
801066f2:	5d                   	pop    %ebp
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  mycpu()->ts.iomb = (ushort) 0xFFFF;
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
  popcli();
801066f3:	e9 d8 da ff ff       	jmp    801041d0 <popcli>
// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
  if(p == 0)
    panic("switchuvm: no process");
801066f8:	c7 04 24 ee 75 10 80 	movl   $0x801075ee,(%esp)
801066ff:	e8 6c 9c ff ff       	call   80100370 <panic>
  if(p->kstack == 0)
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
    panic("switchuvm: no pgdir");
80106704:	c7 04 24 19 76 10 80 	movl   $0x80107619,(%esp)
8010670b:	e8 60 9c ff ff       	call   80100370 <panic>
switchuvm(struct proc *p)
{
  if(p == 0)
    panic("switchuvm: no process");
  if(p->kstack == 0)
    panic("switchuvm: no kstack");
80106710:	c7 04 24 04 76 10 80 	movl   $0x80107604,(%esp)
80106717:	e8 54 9c ff ff       	call   80100370 <panic>
8010671c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106720 <inituvm>:

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
80106720:	55                   	push   %ebp
80106721:	89 e5                	mov    %esp,%ebp
80106723:	83 ec 38             	sub    $0x38,%esp
80106726:	89 75 f8             	mov    %esi,-0x8(%ebp)
80106729:	8b 75 10             	mov    0x10(%ebp),%esi
8010672c:	8b 45 08             	mov    0x8(%ebp),%eax
8010672f:	89 7d fc             	mov    %edi,-0x4(%ebp)
80106732:	8b 7d 0c             	mov    0xc(%ebp),%edi
80106735:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  char *mem;

  if(sz >= PGSIZE)
80106738:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
8010673e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  char *mem;

  if(sz >= PGSIZE)
80106741:	77 59                	ja     8010679c <inituvm+0x7c>
    panic("inituvm: more than a page");
  mem = kalloc();
80106743:	e8 68 bd ff ff       	call   801024b0 <kalloc>
  memset(mem, 0, PGSIZE);
80106748:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
8010674f:	00 
80106750:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80106757:	00 
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
80106758:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
8010675a:	89 04 24             	mov    %eax,(%esp)
8010675d:	e8 de db ff ff       	call   80104340 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
80106762:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106768:	b9 00 10 00 00       	mov    $0x1000,%ecx
8010676d:	89 04 24             	mov    %eax,(%esp)
80106770:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106773:	31 d2                	xor    %edx,%edx
80106775:	c7 44 24 04 06 00 00 	movl   $0x6,0x4(%esp)
8010677c:	00 
8010677d:	e8 1e fd ff ff       	call   801064a0 <mappages>
  memmove(mem, init, sz);
80106782:	89 75 10             	mov    %esi,0x10(%ebp)
}
80106785:	8b 75 f8             	mov    -0x8(%ebp),%esi
  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
  memset(mem, 0, PGSIZE);
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
  memmove(mem, init, sz);
80106788:	89 7d 0c             	mov    %edi,0xc(%ebp)
}
8010678b:	8b 7d fc             	mov    -0x4(%ebp),%edi
  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
  memset(mem, 0, PGSIZE);
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
  memmove(mem, init, sz);
8010678e:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80106791:	8b 5d f4             	mov    -0xc(%ebp),%ebx
80106794:	89 ec                	mov    %ebp,%esp
80106796:	5d                   	pop    %ebp
  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
  memset(mem, 0, PGSIZE);
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
  memmove(mem, init, sz);
80106797:	e9 64 dc ff ff       	jmp    80104400 <memmove>
inituvm(pde_t *pgdir, char *init, uint sz)
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
8010679c:	c7 04 24 2d 76 10 80 	movl   $0x8010762d,(%esp)
801067a3:	e8 c8 9b ff ff       	call   80100370 <panic>
801067a8:	90                   	nop
801067a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801067b0 <loaduvm>:

// Load a program segment into pgdir.  addr must be page-aligned
// and the pages from addr to addr+sz must already be mapped.
int
loaduvm(pde_t *pgdir, char *addr, struct inode *ip, uint offset, uint sz)
{
801067b0:	55                   	push   %ebp
801067b1:	89 e5                	mov    %esp,%ebp
801067b3:	57                   	push   %edi
801067b4:	56                   	push   %esi
801067b5:	53                   	push   %ebx
801067b6:	83 ec 2c             	sub    $0x2c,%esp
801067b9:	8b 7d 0c             	mov    0xc(%ebp),%edi
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
801067bc:	f7 c7 ff 0f 00 00    	test   $0xfff,%edi
801067c2:	0f 85 96 00 00 00    	jne    8010685e <loaduvm+0xae>
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
801067c8:	8b 75 18             	mov    0x18(%ebp),%esi
801067cb:	31 db                	xor    %ebx,%ebx
801067cd:	85 f6                	test   %esi,%esi
801067cf:	75 18                	jne    801067e9 <loaduvm+0x39>
801067d1:	eb 75                	jmp    80106848 <loaduvm+0x98>
801067d3:	90                   	nop
801067d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801067d8:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801067de:	81 ee 00 10 00 00    	sub    $0x1000,%esi
801067e4:	39 5d 18             	cmp    %ebx,0x18(%ebp)
801067e7:	76 5f                	jbe    80106848 <loaduvm+0x98>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
801067e9:	8b 45 08             	mov    0x8(%ebp),%eax
801067ec:	31 c9                	xor    %ecx,%ecx
}

// Load a program segment into pgdir.  addr must be page-aligned
// and the pages from addr to addr+sz must already be mapped.
int
loaduvm(pde_t *pgdir, char *addr, struct inode *ip, uint offset, uint sz)
801067ee:	8d 14 1f             	lea    (%edi,%ebx,1),%edx
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
801067f1:	e8 1a fc ff ff       	call   80106410 <walkpgdir>
801067f6:	85 c0                	test   %eax,%eax
801067f8:	74 58                	je     80106852 <loaduvm+0xa2>
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
801067fa:	8b 00                	mov    (%eax),%eax
    if(sz - i < PGSIZE)
801067fc:	ba 00 10 00 00       	mov    $0x1000,%edx
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106801:	8b 4d 14             	mov    0x14(%ebp),%ecx
  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
80106804:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
80106809:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
8010680f:	0f 46 d6             	cmovbe %esi,%edx
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106812:	05 00 00 00 80       	add    $0x80000000,%eax
80106817:	89 44 24 04          	mov    %eax,0x4(%esp)
8010681b:	8b 45 10             	mov    0x10(%ebp),%eax
8010681e:	01 d9                	add    %ebx,%ecx
80106820:	89 54 24 0c          	mov    %edx,0xc(%esp)
80106824:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80106827:	89 4c 24 08          	mov    %ecx,0x8(%esp)
8010682b:	89 04 24             	mov    %eax,(%esp)
8010682e:	e8 4d b1 ff ff       	call   80101980 <readi>
80106833:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106836:	39 d0                	cmp    %edx,%eax
80106838:	74 9e                	je     801067d8 <loaduvm+0x28>
      return -1;
  }
  return 0;
}
8010683a:	83 c4 2c             	add    $0x2c,%esp
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
8010683d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  return 0;
}
80106842:	5b                   	pop    %ebx
80106843:	5e                   	pop    %esi
80106844:	5f                   	pop    %edi
80106845:	5d                   	pop    %ebp
80106846:	c3                   	ret    
80106847:	90                   	nop
80106848:	83 c4 2c             	add    $0x2c,%esp
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
  }
  return 0;
8010684b:	31 c0                	xor    %eax,%eax
}
8010684d:	5b                   	pop    %ebx
8010684e:	5e                   	pop    %esi
8010684f:	5f                   	pop    %edi
80106850:	5d                   	pop    %ebp
80106851:	c3                   	ret    

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
80106852:	c7 04 24 47 76 10 80 	movl   $0x80107647,(%esp)
80106859:	e8 12 9b ff ff       	call   80100370 <panic>
{
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
8010685e:	c7 04 24 e8 76 10 80 	movl   $0x801076e8,(%esp)
80106865:	e8 06 9b ff ff       	call   80100370 <panic>
8010686a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106870 <deallocuvm>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80106870:	55                   	push   %ebp
80106871:	89 e5                	mov    %esp,%ebp
80106873:	57                   	push   %edi
80106874:	56                   	push   %esi
80106875:	53                   	push   %ebx
80106876:	83 ec 2c             	sub    $0x2c,%esp
80106879:	8b 75 0c             	mov    0xc(%ebp),%esi
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
8010687c:	39 75 10             	cmp    %esi,0x10(%ebp)
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
8010687f:	8b 7d 08             	mov    0x8(%ebp),%edi
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;
80106882:	89 f0                	mov    %esi,%eax
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106884:	73 75                	jae    801068fb <deallocuvm+0x8b>
    return oldsz;

  a = PGROUNDUP(newsz);
80106886:	8b 5d 10             	mov    0x10(%ebp),%ebx
80106889:	81 c3 ff 0f 00 00    	add    $0xfff,%ebx
8010688f:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a  < oldsz; a += PGSIZE){
80106895:	39 de                	cmp    %ebx,%esi
80106897:	77 3a                	ja     801068d3 <deallocuvm+0x63>
80106899:	eb 5d                	jmp    801068f8 <deallocuvm+0x88>
8010689b:	90                   	nop
8010689c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
801068a0:	8b 10                	mov    (%eax),%edx
801068a2:	f6 c2 01             	test   $0x1,%dl
801068a5:	74 22                	je     801068c9 <deallocuvm+0x59>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
801068a7:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
801068ad:	74 54                	je     80106903 <deallocuvm+0x93>
        panic("kfree");
      char *v = P2V(pa);
801068af:	81 c2 00 00 00 80    	add    $0x80000000,%edx
      kfree(v);
801068b5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801068b8:	89 14 24             	mov    %edx,(%esp)
801068bb:	e8 80 ba ff ff       	call   80102340 <kfree>
      *pte = 0;
801068c0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801068c3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
801068c9:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801068cf:	39 de                	cmp    %ebx,%esi
801068d1:	76 25                	jbe    801068f8 <deallocuvm+0x88>
    pte = walkpgdir(pgdir, (char*)a, 0);
801068d3:	31 c9                	xor    %ecx,%ecx
801068d5:	89 da                	mov    %ebx,%edx
801068d7:	89 f8                	mov    %edi,%eax
801068d9:	e8 32 fb ff ff       	call   80106410 <walkpgdir>
    if(!pte)
801068de:	85 c0                	test   %eax,%eax
801068e0:	75 be                	jne    801068a0 <deallocuvm+0x30>
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
801068e2:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
801068e8:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
801068ee:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801068f4:	39 de                	cmp    %ebx,%esi
801068f6:	77 db                	ja     801068d3 <deallocuvm+0x63>
      char *v = P2V(pa);
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
801068f8:	8b 45 10             	mov    0x10(%ebp),%eax
}
801068fb:	83 c4 2c             	add    $0x2c,%esp
801068fe:	5b                   	pop    %ebx
801068ff:	5e                   	pop    %esi
80106900:	5f                   	pop    %edi
80106901:	5d                   	pop    %ebp
80106902:	c3                   	ret    
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
      pa = PTE_ADDR(*pte);
      if(pa == 0)
        panic("kfree");
80106903:	c7 04 24 a6 6f 10 80 	movl   $0x80106fa6,(%esp)
8010690a:	e8 61 9a ff ff       	call   80100370 <panic>
8010690f:	90                   	nop

80106910 <allocuvm>:

// Allocate page tables and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
int
allocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80106910:	55                   	push   %ebp
80106911:	89 e5                	mov    %esp,%ebp
80106913:	57                   	push   %edi
80106914:	56                   	push   %esi
80106915:	53                   	push   %ebx
80106916:	83 ec 2c             	sub    $0x2c,%esp
80106919:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
8010691c:	85 ff                	test   %edi,%edi
8010691e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80106921:	0f 88 c1 00 00 00    	js     801069e8 <allocuvm+0xd8>
    return 0;
  if(newsz < oldsz)
80106927:	8b 45 0c             	mov    0xc(%ebp),%eax
8010692a:	39 c7                	cmp    %eax,%edi
8010692c:	0f 82 a6 00 00 00    	jb     801069d8 <allocuvm+0xc8>
    return oldsz;

  a = PGROUNDUP(oldsz);
80106932:	8b 75 0c             	mov    0xc(%ebp),%esi
80106935:	81 c6 ff 0f 00 00    	add    $0xfff,%esi
8010693b:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
  for(; a < newsz; a += PGSIZE){
80106941:	39 f7                	cmp    %esi,%edi
80106943:	77 51                	ja     80106996 <allocuvm+0x86>
80106945:	e9 91 00 00 00       	jmp    801069db <allocuvm+0xcb>
8010694a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
80106950:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80106957:	00 
80106958:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
8010695f:	00 
80106960:	89 04 24             	mov    %eax,(%esp)
80106963:	e8 d8 d9 ff ff       	call   80104340 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80106968:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
8010696e:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106973:	89 04 24             	mov    %eax,(%esp)
80106976:	8b 45 08             	mov    0x8(%ebp),%eax
80106979:	89 f2                	mov    %esi,%edx
8010697b:	c7 44 24 04 06 00 00 	movl   $0x6,0x4(%esp)
80106982:	00 
80106983:	e8 18 fb ff ff       	call   801064a0 <mappages>
80106988:	85 c0                	test   %eax,%eax
8010698a:	78 74                	js     80106a00 <allocuvm+0xf0>
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
8010698c:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106992:	39 f7                	cmp    %esi,%edi
80106994:	76 45                	jbe    801069db <allocuvm+0xcb>
    mem = kalloc();
80106996:	e8 15 bb ff ff       	call   801024b0 <kalloc>
    if(mem == 0){
8010699b:	85 c0                	test   %eax,%eax
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
8010699d:	89 c3                	mov    %eax,%ebx
    if(mem == 0){
8010699f:	75 af                	jne    80106950 <allocuvm+0x40>
      cprintf("allocuvm out of memory\n");
801069a1:	c7 04 24 65 76 10 80 	movl   $0x80107665,(%esp)
801069a8:	e8 a3 9c ff ff       	call   80100650 <cprintf>
      deallocuvm(pgdir, newsz, oldsz);
801069ad:	8b 45 0c             	mov    0xc(%ebp),%eax
801069b0:	89 7c 24 04          	mov    %edi,0x4(%esp)
801069b4:	89 44 24 08          	mov    %eax,0x8(%esp)
801069b8:	8b 45 08             	mov    0x8(%ebp),%eax
801069bb:	89 04 24             	mov    %eax,(%esp)
801069be:	e8 ad fe ff ff       	call   80106870 <deallocuvm>
      return 0;
801069c3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
      kfree(mem);
      return 0;
    }
  }
  return newsz;
}
801069ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801069cd:	83 c4 2c             	add    $0x2c,%esp
801069d0:	5b                   	pop    %ebx
801069d1:	5e                   	pop    %esi
801069d2:	5f                   	pop    %edi
801069d3:	5d                   	pop    %ebp
801069d4:	c3                   	ret    
801069d5:	8d 76 00             	lea    0x0(%esi),%esi
  uint a;

  if(newsz >= KERNBASE)
    return 0;
  if(newsz < oldsz)
    return oldsz;
801069d8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      kfree(mem);
      return 0;
    }
  }
  return newsz;
}
801069db:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801069de:	83 c4 2c             	add    $0x2c,%esp
801069e1:	5b                   	pop    %ebx
801069e2:	5e                   	pop    %esi
801069e3:	5f                   	pop    %edi
801069e4:	5d                   	pop    %ebp
801069e5:	c3                   	ret    
801069e6:	66 90                	xchg   %ax,%ax
{
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
    return 0;
801069e8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
      kfree(mem);
      return 0;
    }
  }
  return newsz;
}
801069ef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801069f2:	83 c4 2c             	add    $0x2c,%esp
801069f5:	5b                   	pop    %ebx
801069f6:	5e                   	pop    %esi
801069f7:	5f                   	pop    %edi
801069f8:	5d                   	pop    %ebp
801069f9:	c3                   	ret    
801069fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
80106a00:	c7 04 24 7d 76 10 80 	movl   $0x8010767d,(%esp)
80106a07:	e8 44 9c ff ff       	call   80100650 <cprintf>
      deallocuvm(pgdir, newsz, oldsz);
80106a0c:	8b 45 0c             	mov    0xc(%ebp),%eax
80106a0f:	89 7c 24 04          	mov    %edi,0x4(%esp)
80106a13:	89 44 24 08          	mov    %eax,0x8(%esp)
80106a17:	8b 45 08             	mov    0x8(%ebp),%eax
80106a1a:	89 04 24             	mov    %eax,(%esp)
80106a1d:	e8 4e fe ff ff       	call   80106870 <deallocuvm>
      kfree(mem);
80106a22:	89 1c 24             	mov    %ebx,(%esp)
80106a25:	e8 16 b9 ff ff       	call   80102340 <kfree>
      return 0;
80106a2a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    }
  }
  return newsz;
}
80106a31:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106a34:	83 c4 2c             	add    $0x2c,%esp
80106a37:	5b                   	pop    %ebx
80106a38:	5e                   	pop    %esi
80106a39:	5f                   	pop    %edi
80106a3a:	5d                   	pop    %ebp
80106a3b:	c3                   	ret    
80106a3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106a40 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80106a40:	55                   	push   %ebp
80106a41:	89 e5                	mov    %esp,%ebp
80106a43:	56                   	push   %esi
80106a44:	53                   	push   %ebx
80106a45:	83 ec 10             	sub    $0x10,%esp
80106a48:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint i;

  if(pgdir == 0)
80106a4b:	85 db                	test   %ebx,%ebx
80106a4d:	74 5e                	je     80106aad <freevm+0x6d>
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
80106a4f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
80106a56:	00 
  for(i = 0; i < NPDENTRIES; i++){
80106a57:	31 f6                	xor    %esi,%esi
{
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
80106a59:	c7 44 24 04 00 00 00 	movl   $0x80000000,0x4(%esp)
80106a60:	80 
80106a61:	89 1c 24             	mov    %ebx,(%esp)
80106a64:	e8 07 fe ff ff       	call   80106870 <deallocuvm>
80106a69:	eb 10                	jmp    80106a7b <freevm+0x3b>
80106a6b:	90                   	nop
80106a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < NPDENTRIES; i++){
80106a70:	83 c6 01             	add    $0x1,%esi
80106a73:	81 fe 00 04 00 00    	cmp    $0x400,%esi
80106a79:	74 24                	je     80106a9f <freevm+0x5f>
    if(pgdir[i] & PTE_P){
80106a7b:	8b 04 b3             	mov    (%ebx,%esi,4),%eax
80106a7e:	a8 01                	test   $0x1,%al
80106a80:	74 ee                	je     80106a70 <freevm+0x30>
      char * v = P2V(PTE_ADDR(pgdir[i]));
80106a82:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106a87:	83 c6 01             	add    $0x1,%esi
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
80106a8a:	05 00 00 00 80       	add    $0x80000000,%eax
      kfree(v);
80106a8f:	89 04 24             	mov    %eax,(%esp)
80106a92:	e8 a9 b8 ff ff       	call   80102340 <kfree>
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106a97:	81 fe 00 04 00 00    	cmp    $0x400,%esi
80106a9d:	75 dc                	jne    80106a7b <freevm+0x3b>
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
80106a9f:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80106aa2:	83 c4 10             	add    $0x10,%esp
80106aa5:	5b                   	pop    %ebx
80106aa6:	5e                   	pop    %esi
80106aa7:	5d                   	pop    %ebp
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
80106aa8:	e9 93 b8 ff ff       	jmp    80102340 <kfree>
freevm(pde_t *pgdir)
{
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
80106aad:	c7 04 24 99 76 10 80 	movl   $0x80107699,(%esp)
80106ab4:	e8 b7 98 ff ff       	call   80100370 <panic>
80106ab9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106ac0 <setupkvm>:
};

// Set up kernel part of a page table.
pde_t*
setupkvm(void)
{
80106ac0:	55                   	push   %ebp
80106ac1:	89 e5                	mov    %esp,%ebp
80106ac3:	56                   	push   %esi
80106ac4:	53                   	push   %ebx
80106ac5:	83 ec 10             	sub    $0x10,%esp
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
80106ac8:	e8 e3 b9 ff ff       	call   801024b0 <kalloc>
80106acd:	85 c0                	test   %eax,%eax
80106acf:	89 c6                	mov    %eax,%esi
80106ad1:	74 47                	je     80106b1a <setupkvm+0x5a>
    return 0;
  memset(pgdir, 0, PGSIZE);
80106ad3:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80106ada:	00 
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106adb:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
80106ae0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
80106ae7:	00 
80106ae8:	89 04 24             	mov    %eax,(%esp)
80106aeb:	e8 50 d8 ff ff       	call   80104340 <memset>
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
80106af0:	8b 53 0c             	mov    0xc(%ebx),%edx
80106af3:	8b 43 04             	mov    0x4(%ebx),%eax
80106af6:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106af9:	89 54 24 04          	mov    %edx,0x4(%esp)
80106afd:	8b 13                	mov    (%ebx),%edx
80106aff:	89 04 24             	mov    %eax,(%esp)
80106b02:	29 c1                	sub    %eax,%ecx
80106b04:	89 f0                	mov    %esi,%eax
80106b06:	e8 95 f9 ff ff       	call   801064a0 <mappages>
80106b0b:	85 c0                	test   %eax,%eax
80106b0d:	78 19                	js     80106b28 <setupkvm+0x68>
  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106b0f:	83 c3 10             	add    $0x10,%ebx
80106b12:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80106b18:	72 d6                	jb     80106af0 <setupkvm+0x30>
                (uint)k->phys_start, k->perm) < 0) {
      freevm(pgdir);
      return 0;
    }
  return pgdir;
}
80106b1a:	83 c4 10             	add    $0x10,%esp
80106b1d:	89 f0                	mov    %esi,%eax
80106b1f:	5b                   	pop    %ebx
80106b20:	5e                   	pop    %esi
80106b21:	5d                   	pop    %ebp
80106b22:	c3                   	ret    
80106b23:	90                   	nop
80106b24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0) {
      freevm(pgdir);
80106b28:	89 34 24             	mov    %esi,(%esp)
      return 0;
80106b2b:	31 f6                	xor    %esi,%esi
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0) {
      freevm(pgdir);
80106b2d:	e8 0e ff ff ff       	call   80106a40 <freevm>
      return 0;
    }
  return pgdir;
}
80106b32:	83 c4 10             	add    $0x10,%esp
80106b35:	89 f0                	mov    %esi,%eax
80106b37:	5b                   	pop    %ebx
80106b38:	5e                   	pop    %esi
80106b39:	5d                   	pop    %ebp
80106b3a:	c3                   	ret    
80106b3b:	90                   	nop
80106b3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106b40 <kvmalloc>:

// Allocate one page table for the machine for the kernel address
// space for scheduler processes.
void
kvmalloc(void)
{
80106b40:	55                   	push   %ebp
80106b41:	89 e5                	mov    %esp,%ebp
80106b43:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80106b46:	e8 75 ff ff ff       	call   80106ac0 <setupkvm>
80106b4b:	a3 a4 54 11 80       	mov    %eax,0x801154a4
// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
  lcr3(V2P(kpgdir));   // switch to the kernel page table
80106b50:	05 00 00 00 80       	add    $0x80000000,%eax
80106b55:	0f 22 d8             	mov    %eax,%cr3
void
kvmalloc(void)
{
  kpgdir = setupkvm();
  switchkvm();
}
80106b58:	c9                   	leave  
80106b59:	c3                   	ret    
80106b5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106b60 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80106b60:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106b61:	31 c9                	xor    %ecx,%ecx

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80106b63:	89 e5                	mov    %esp,%ebp
80106b65:	83 ec 18             	sub    $0x18,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106b68:	8b 55 0c             	mov    0xc(%ebp),%edx
80106b6b:	8b 45 08             	mov    0x8(%ebp),%eax
80106b6e:	e8 9d f8 ff ff       	call   80106410 <walkpgdir>
  if(pte == 0)
80106b73:	85 c0                	test   %eax,%eax
80106b75:	74 05                	je     80106b7c <clearpteu+0x1c>
    panic("clearpteu");
  *pte &= ~PTE_U;
80106b77:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
80106b7a:	c9                   	leave  
80106b7b:	c3                   	ret    
{
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
  if(pte == 0)
    panic("clearpteu");
80106b7c:	c7 04 24 aa 76 10 80 	movl   $0x801076aa,(%esp)
80106b83:	e8 e8 97 ff ff       	call   80100370 <panic>
80106b88:	90                   	nop
80106b89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106b90 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
80106b90:	55                   	push   %ebp
80106b91:	89 e5                	mov    %esp,%ebp
80106b93:	57                   	push   %edi
80106b94:	56                   	push   %esi
80106b95:	53                   	push   %ebx
80106b96:	83 ec 2c             	sub    $0x2c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
80106b99:	e8 22 ff ff ff       	call   80106ac0 <setupkvm>
80106b9e:	85 c0                	test   %eax,%eax
80106ba0:	89 c7                	mov    %eax,%edi
80106ba2:	0f 84 91 00 00 00    	je     80106c39 <copyuvm+0xa9>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80106ba8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106bab:	85 c9                	test   %ecx,%ecx
80106bad:	0f 84 86 00 00 00    	je     80106c39 <copyuvm+0xa9>
80106bb3:	31 f6                	xor    %esi,%esi
80106bb5:	eb 54                	jmp    80106c0b <copyuvm+0x7b>
80106bb7:	90                   	nop
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106bb8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
80106bbb:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
80106bc2:	00 
80106bc3:	89 1c 24             	mov    %ebx,(%esp)
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106bc6:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
80106bcb:	05 00 00 00 80       	add    $0x80000000,%eax
80106bd0:	89 44 24 04          	mov    %eax,0x4(%esp)
80106bd4:	e8 27 d8 ff ff       	call   80104400 <memmove>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
80106bd9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0) {
80106bdc:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106be1:	89 f2                	mov    %esi,%edx
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
80106be3:	25 ff 0f 00 00       	and    $0xfff,%eax
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0) {
80106be8:	89 44 24 04          	mov    %eax,0x4(%esp)
80106bec:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106bf2:	89 04 24             	mov    %eax,(%esp)
80106bf5:	89 f8                	mov    %edi,%eax
80106bf7:	e8 a4 f8 ff ff       	call   801064a0 <mappages>
80106bfc:	85 c0                	test   %eax,%eax
80106bfe:	78 48                	js     80106c48 <copyuvm+0xb8>
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80106c00:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106c06:	39 75 0c             	cmp    %esi,0xc(%ebp)
80106c09:	76 2e                	jbe    80106c39 <copyuvm+0xa9>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80106c0b:	8b 45 08             	mov    0x8(%ebp),%eax
80106c0e:	31 c9                	xor    %ecx,%ecx
80106c10:	89 f2                	mov    %esi,%edx
80106c12:	e8 f9 f7 ff ff       	call   80106410 <walkpgdir>
80106c17:	85 c0                	test   %eax,%eax
80106c19:	74 43                	je     80106c5e <copyuvm+0xce>
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
80106c1b:	8b 00                	mov    (%eax),%eax
80106c1d:	a8 01                	test   $0x1,%al
80106c1f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106c22:	74 2e                	je     80106c52 <copyuvm+0xc2>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
80106c24:	e8 87 b8 ff ff       	call   801024b0 <kalloc>
80106c29:	85 c0                	test   %eax,%eax
80106c2b:	89 c3                	mov    %eax,%ebx
80106c2d:	75 89                	jne    80106bb8 <copyuvm+0x28>
    }
  }
  return d;

bad:
  freevm(d);
80106c2f:	89 3c 24             	mov    %edi,(%esp)
  return 0;
80106c32:	31 ff                	xor    %edi,%edi
    }
  }
  return d;

bad:
  freevm(d);
80106c34:	e8 07 fe ff ff       	call   80106a40 <freevm>
  return 0;
}
80106c39:	83 c4 2c             	add    $0x2c,%esp
80106c3c:	89 f8                	mov    %edi,%eax
80106c3e:	5b                   	pop    %ebx
80106c3f:	5e                   	pop    %esi
80106c40:	5f                   	pop    %edi
80106c41:	5d                   	pop    %ebp
80106c42:	c3                   	ret    
80106c43:	90                   	nop
80106c44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0) {
      kfree(mem);
80106c48:	89 1c 24             	mov    %ebx,(%esp)
80106c4b:	e8 f0 b6 ff ff       	call   80102340 <kfree>
      goto bad;
80106c50:	eb dd                	jmp    80106c2f <copyuvm+0x9f>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
80106c52:	c7 04 24 ce 76 10 80 	movl   $0x801076ce,(%esp)
80106c59:	e8 12 97 ff ff       	call   80100370 <panic>

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
80106c5e:	c7 04 24 b4 76 10 80 	movl   $0x801076b4,(%esp)
80106c65:	e8 06 97 ff ff       	call   80100370 <panic>
80106c6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106c70 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80106c70:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106c71:	31 c9                	xor    %ecx,%ecx

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80106c73:	89 e5                	mov    %esp,%ebp
80106c75:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106c78:	8b 55 0c             	mov    0xc(%ebp),%edx
80106c7b:	8b 45 08             	mov    0x8(%ebp),%eax
80106c7e:	e8 8d f7 ff ff       	call   80106410 <walkpgdir>
  if((*pte & PTE_P) == 0)
80106c83:	8b 10                	mov    (%eax),%edx
    return 0;
80106c85:	31 c0                	xor    %eax,%eax
uva2ka(pde_t *pgdir, char *uva)
{
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
80106c87:	f6 c2 01             	test   $0x1,%dl
80106c8a:	74 11                	je     80106c9d <uva2ka+0x2d>
    return 0;
  if((*pte & PTE_U) == 0)
80106c8c:	f6 c2 04             	test   $0x4,%dl
80106c8f:	74 0c                	je     80106c9d <uva2ka+0x2d>
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
80106c91:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106c97:	8d 82 00 00 00 80    	lea    -0x80000000(%edx),%eax
}
80106c9d:	c9                   	leave  
80106c9e:	c3                   	ret    
80106c9f:	90                   	nop

80106ca0 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80106ca0:	55                   	push   %ebp
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
80106ca1:	31 c0                	xor    %eax,%eax
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80106ca3:	89 e5                	mov    %esp,%ebp
80106ca5:	57                   	push   %edi
80106ca6:	56                   	push   %esi
80106ca7:	53                   	push   %ebx
80106ca8:	83 ec 2c             	sub    $0x2c,%esp
80106cab:	8b 5d 14             	mov    0x14(%ebp),%ebx
80106cae:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80106cb1:	85 db                	test   %ebx,%ebx
80106cb3:	74 64                	je     80106d19 <copyout+0x79>
80106cb5:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106cb8:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80106cbb:	eb 36                	jmp    80106cf3 <copyout+0x53>
80106cbd:	8d 76 00             	lea    0x0(%esi),%esi
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80106cc0:	89 f7                	mov    %esi,%edi
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
80106cc2:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80106cc5:	29 d7                	sub    %edx,%edi
80106cc7:	81 c7 00 10 00 00    	add    $0x1000,%edi
80106ccd:	39 df                	cmp    %ebx,%edi
80106ccf:	0f 47 fb             	cmova  %ebx,%edi
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
80106cd2:	29 f2                	sub    %esi,%edx
80106cd4:	01 c2                	add    %eax,%edx
80106cd6:	89 14 24             	mov    %edx,(%esp)
80106cd9:	89 7c 24 08          	mov    %edi,0x8(%esp)
80106cdd:	89 4c 24 04          	mov    %ecx,0x4(%esp)
80106ce1:	e8 1a d7 ff ff       	call   80104400 <memmove>
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
80106ce6:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    n = PGSIZE - (va - va0);
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
80106cec:	01 7d e4             	add    %edi,-0x1c(%ebp)
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80106cef:	29 fb                	sub    %edi,%ebx
80106cf1:	74 35                	je     80106d28 <copyout+0x88>
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
80106cf3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
80106cf6:	89 d6                	mov    %edx,%esi
80106cf8:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80106cfe:	89 55 e0             	mov    %edx,-0x20(%ebp)
80106d01:	89 74 24 04          	mov    %esi,0x4(%esp)
80106d05:	89 0c 24             	mov    %ecx,(%esp)
80106d08:	e8 63 ff ff ff       	call   80106c70 <uva2ka>
    if(pa0 == 0)
80106d0d:	8b 55 e0             	mov    -0x20(%ebp),%edx
80106d10:	85 c0                	test   %eax,%eax
80106d12:	75 ac                	jne    80106cc0 <copyout+0x20>
      return -1;
80106d14:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
80106d19:	83 c4 2c             	add    $0x2c,%esp
80106d1c:	5b                   	pop    %ebx
80106d1d:	5e                   	pop    %esi
80106d1e:	5f                   	pop    %edi
80106d1f:	5d                   	pop    %ebp
80106d20:	c3                   	ret    
80106d21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106d28:	83 c4 2c             	add    $0x2c,%esp
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
80106d2b:	31 c0                	xor    %eax,%eax
}
80106d2d:	5b                   	pop    %ebx
80106d2e:	5e                   	pop    %esi
80106d2f:	5f                   	pop    %edi
80106d30:	5d                   	pop    %ebp
80106d31:	c3                   	ret    
