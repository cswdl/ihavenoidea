typedef char byte;
typedef unsigned short word;
typedef unsigned long dword;

#define SZ(x) (sizeof(x)/sizeof(x[0]))


// misc out (3c2h) value for various modes

#define R_COM  0x63 // "common" bits

#define R_W256 0x00
#define R_W320 0x00
#define R_W360 0x04
#define R_W376 0x04
#define R_W400 0x04

#define R_H200 0x00
#define R_H224 0x80
#define R_H240 0x80
#define R_H256 0x80
#define R_H270 0x80
#define R_H300 0x80
#define R_H360 0x00
#define R_H400 0x00
#define R_H480 0x80
#define R_H564 0x80
#define R_H600 0x80

void outw(unsigned short port, unsigned short value);
void outb(unsigned short port, unsigned char value);
void uint8_t inb(unsigned short port);

static const byte hor_regs[];
static const byte width_256[];
static const byte width_320[];
static const byte width_360[];
static const byte width_376[];
static const byte width_400[];

static const byte ver_regs[];

static const byte height_200[];
static const byte height_224[];
static const byte height_240[];
static const byte height_256[];
static const byte height_270[];
static const byte height_300[];
static const byte height_360[];
static const byte height_400[];
static const byte height_480[];
static const byte height_564[];
static const byte height_600[];
int init_graph_vga(int width, int height,int chain4);
