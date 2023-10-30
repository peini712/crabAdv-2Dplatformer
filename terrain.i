# 1 "terrain.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "terrain.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
typedef void (*ihp)(void);






extern volatile unsigned short *videoBuffer;
# 40 "gba.h"
void waitForVBlank();
# 57 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 73 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma;
# 105 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 2 "terrain.c" 2
# 1 "print.h" 1
# 25 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 26 "print.h" 2
# 35 "print.h"

# 35 "print.h"
uint8_t mgba_open(void);
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
void mgba_close(void);
# 3 "terrain.c" 2
# 1 "sprites.h" 1
# 10 "sprites.h"
typedef struct {
  u16 y : 8;
  u16 mode : 2;
  u16 gfx : 2;
  u16 mosaic : 1;
  u16 bpp : 1;
  u16 shape : 2;
} OBJ_ATTR0;

typedef struct {
  u16 x : 9;
  u16 reserved : 3;
  u16 flip : 2;
  u16 size : 2;
} OBJ_ATTR1;

typedef struct {
  u16 dummy : 1;
  u16 tileIdX : 4;
  u16 tileIdY : 5;
  u16 priority : 2;
  u16 palette : 4;
} OBJ_ATTR2;


typedef struct {
  OBJ_ATTR0 attr0;
  OBJ_ATTR1 attr1;
  OBJ_ATTR2 attr2;
  u16 fill;
} OBJ_ATTR;




extern OBJ_ATTR shadowOAM[128];
# 89 "sprites.h"
void hideSprites();


typedef enum {
    SPRITE_UI,
    SPRITE_PLAYER,
    SPRITE_CAR,
    SPRITE_TURTLE,
    SPRITE_SHELL,
    SPRITE_BIRD,
    SPRITE_EGG,
    SPRITE_BULLET,
    SPRITE_DROP,
    SPRITE_DIAMOND,
    SPRITE_OTHER
} SpriteType_t;

typedef struct _SPRITE {
  s16 x;
  s16 y;
  s16 enemyLeftBound;
  s16 enemyRightBound;
  s16 enemyWanderTimer;
  s16 enemySpecialTimer;
  SpriteType_t type : 8;
  u8 timeUntilNextFrame;
  s8 dx;
  s8 dy;
  s8 width;
  s8 height;
  s8 direction;
  s8 frame;
  s8 numOfFrames;
  s8 hp;
  u8 isAllocated;
  u8 baseTileX;
  u8 baseTileY;
  OBJ_ATTR *oam;
  void (*update_func)(struct _SPRITE *s);
} SPRITE;

extern SPRITE sprite_pool[64];

SPRITE *createUI(OBJ_ATTR *oam);
SPRITE *createSprite(SPRITE *prefab);
void recreateSprite(SPRITE *s, SPRITE *prefab);
void freeSprite(SPRITE *s);
void updateSprites();
void clearSprites();

void spriteDraw(SPRITE *s);
unsigned char spriteCollide(SPRITE *a, SPRITE *b);
unsigned char spriteInCamera(SPRITE *s);
# 4 "terrain.c" 2
int mapHeight;
int mapWidth;
unsigned char *mapCollisionBitmap;

u8 isNotTerrain(int x, int y) {
  return (mapCollisionBitmap)[x + mapWidth * y];
}

u8 isTerrain(int x, int y) {
  return !isNotTerrain(x, y);
}


unsigned char collideTerrain(SPRITE *sprite, int mapWidth, int mapHeight) {
  int x = sprite->x;
  int y = sprite->y;
  int width = sprite->width;
  int height = sprite->height;
  if (x < 0 || y < 0 || x + width > mapWidth || y + height > mapHeight) {
    return 1;
  }
# 38 "terrain.c"
  for (int i = 0; i < height; i++) {

    if (isNotTerrain(x, y + i) == 0) {
      return 1;
    }

    if (isNotTerrain(x + width - 1, y + i) == 0) {
      return 1;
    }
  }
  return 0;
}


int spriteTryMove(SPRITE *s, int dx, int dy) {

  if (dx != 0) {
    dy = 0;
    int myX = dx > 0 ? s->x + s->width - 1 : s->x;
    if (myX + dx < 0 || myX + dx >= mapWidth) {
      dx = dx > 0 ? mapWidth - myX - 1 : -myX;
    }
    u8 success = 1;

    int delta = 0;
    while (((delta) < 0 ? -(delta) : (delta)) < ((dx) < 0 ? -(dx) : (dx))) {
      success = 1;
      for (int i = 0; i < s->height; i++) {
        if (isTerrain(myX + delta, s->y + i)) {
          success = 0;
          break;
        }
      }
      if (!success) {
        if (dx > 0) {
          delta--;
        } else {
          delta++;
        }
        break;
      }
      if (dx > 0) {
        delta++;
      } else {
        delta--;
      }
    }
    s->x += delta;
    return delta;
  }

  if (dy != 0) {
    dx = 0;
    int myY = dy > 0 ? s->y + s->height - 1 : s->y;
    if (myY + dy < 0 || myY + dy >= mapHeight) {
      dy = dy > 0 ? mapHeight - myY - 1 : -myY;
    }
    u8 success = 1;


    int delta = 0;
    while (((delta) < 0 ? -(delta) : (delta)) < ((dy) < 0 ? -(dy) : (dy))) {
      success = 1;
      for (int i = 0; i < s->width; i++) {
        if (!isNotTerrain(s->x + i, myY + delta)) {
          success = 0;
          break;
        }
      }
      if (!success) {
        if (dy > 0) {
          delta--;
        } else {
          delta++;
        }
        break;
      }
      if (dy > 0) {
        delta++;
      } else {
        delta--;
      }
    }
    s->y += delta;
    return delta;
  }

  return 0;
}
