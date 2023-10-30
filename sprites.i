# 1 "sprites.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "sprites.c"
# 1 "sprites.h" 1



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
# 5 "sprites.h" 2





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
# 2 "sprites.c" 2
# 1 "camera.h" 1




extern unsigned short hOff;
extern unsigned short vOff;
# 3 "sprites.c" 2


void hideSprites() {
  for (int i = 0; i < 128; i++) {
    shadowOAM[i].attr0.mode = (2);
  }
}

SPRITE sprite_pool[64];

OBJ_ATTR shadowOAM[128];

SPRITE *createSprite(SPRITE *prefab) {
  for (int i = 0; i < 64; i++) {
    if (!sprite_pool[i].isAllocated) {
      sprite_pool[i] = *prefab;
      sprite_pool[i].isAllocated = 1;
      sprite_pool[i].oam = &shadowOAM[i];
      *sprite_pool[i].oam = *prefab->oam;
      return &sprite_pool[i];
    }
  }
  return 0;
}

SPRITE *createUI(OBJ_ATTR *oam) {
  for (int i = 0; i < 64; i++) {
    if (!sprite_pool[i].isAllocated) {
      sprite_pool[i].isAllocated = 1;
      sprite_pool[i].type = SPRITE_UI;
      sprite_pool[i].oam = &shadowOAM[i];
      *sprite_pool[i].oam = *oam;
      return &sprite_pool[i];
    }
  }
  return 0;
}

void recreateSprite(SPRITE *s, SPRITE *prefab) {
  *s = *prefab;
  s->isAllocated = 1;
  s->oam = &shadowOAM[s - sprite_pool];
  *s->oam = *prefab->oam;
}

void freeSprite(SPRITE *s) {
  s->isAllocated = 0;
  s->oam->attr0.mode = (2);
  s->oam = 0;
}

static void spriteAnimation(SPRITE *s) {
  s->oam->attr2.tileIdX = s->baseTileX + s->direction * (s->width) / 8;
  if (s->numOfFrames <= 1) {
    s->oam->attr2.tileIdY = s->baseTileY;
    return;
  }

  s->timeUntilNextFrame--;
  if (s->timeUntilNextFrame <= 0) {
    s->frame++;
    s->frame = s->frame % s->numOfFrames;
    s->timeUntilNextFrame = 15;
  }
  s->oam->attr2.tileIdY = s->baseTileY + s->frame * (s->height) / 8;
}

void updateSprites() {
  for (int i = 0; i < 64; i++) {
    SPRITE *s = &sprite_pool[i];
    if (s->isAllocated && s->update_func) {
      s->update_func(s);
    }
    if (s->isAllocated && s->type != SPRITE_UI) {
      spriteAnimation(s);
      spriteDraw(s);
    }
  }
  DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * sizeof(OBJ_ATTR) / sizeof(u16));
}

void clearSprites() {
  for (int i = 0; i < 64; i++) {
    if (sprite_pool[i].isAllocated) {
      freeSprite(&sprite_pool[i]);
    }
  }
}

unsigned char spriteInCamera(SPRITE *s) {
  return (s->x + s->width > hOff && s->x < hOff + 240 && s->y + s->height > vOff && s->y < vOff + 160);
}

unsigned char spriteCollide(SPRITE *a, SPRITE *b) {
  return collision(a->x, a->y, a->width, a->height, b->x, b->y, b->width, b->height);
}

void spriteDraw(SPRITE *s) {
  if (!s->isAllocated) {
    return;
  }

  if (!spriteInCamera(s)) {
    s->oam->attr0.mode = (2);
    return;
  }

  s->oam->attr0.mode = (0);

  int viewX = s->x - hOff;
  int viewY = s->y - vOff;


  if (viewX < 0 && viewX + s->width > 0) {
    viewX += ((0xffff) & 0x1FF);
  }
  if (viewY < 0 && viewY + s->height > 0) {
    viewY += ((0xffff) & 0xFF);
  }
  s->oam->attr0.y = viewY;
  s->oam->attr1.x = viewX;
}
