// On-disk file system format.
// Both the kernel and user programs use this header file.


#define ROOTINO 1  // root i-number
#define BSIZE 512  // block size

// Disk layout:
// [ boot block | super block | log | inode blocks |
//                                          free bit map | data blocks]
//
// Blockgroup layout:
// [ superblock | bit map | inode blocks | data blocks ]
// mkfs computes the super block and builds an initial file system. The
// super block describes the disk layout:
struct superblock {
  uint size;          // Size of file system image (blocks)
  uint nlog;          // Number of log blocks
  uint logstart;      // Block number of first log block

  uint bgninodes;     // Number of inode blocks per blockgroup
  uint bgnblocks;     // Number of data blocks per blockgroup

  uint bgsize;        // Size of blockgroup image (blocks)
  uint nbgroups;      // Number of blockgroups;
  uint bgstart;       // First block number of first blockgroup
  uint bgistart;      // Block number of first inode block in first blockgroup
  uint bgmapstart;    // Block number of first free map block in blockgroup
};

#define NDIRECT 12
#define NINDIRECT (BSIZE / sizeof(uint))
#define MAXFILE (NDIRECT + NINDIRECT)

// On-disk inode structure
struct dinode {
  short type;           // File type
  short major;          // Major device number (T_DEV only)
  short minor;          // Minor device number (T_DEV only)
  short nlink;          // Number of links to inode in file system
  uint size;            // Size of file (bytes)
  uint addrs[NDIRECT+1];   // Data block addresses
};

// Inodes per block.
#define IPB           (BSIZE / sizeof(struct dinode))

// Block containing inode i
#define IBLOCK(i, sb)     ((i) / IPB + sb.inodestart)

// Block number of inode i in blockgroup
#define IBLOCKGROUP(i,sb)     ((i) / IPB + sb.bginodestart)

// Bitmap bits per block
#define BPB           (BSIZE*8)

// Block of free map containing bit for block b
#define BBLOCK(b, sb) (b/BPB + sb.bmapstart)

// Block number of block b in blockgroup
#define BBLOCKGROUP(b, sb)  (b/BPB + sb.bgmapstart)

// Directory is a file containing a sequence of dirent structures.
#define DIRSIZ 126

struct dirent {
  ushort inum;
  char name[DIRSIZ];
};



// struct dirent {
//   ushort inum;
//   char name[DIRSIZ];
// };

