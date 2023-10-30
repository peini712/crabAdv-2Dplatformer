#ifndef GBA_SPRITES_H
#define GBA_SPRITES_H

#include "gba.h"

// Sprite Palette
#define SPRITEPALETTE ((u16 *)0x5000200)

// use bit fields so that it is easier to set one attribute
typedef struct {
  u16 y : 8;       // Bits 0-7: Y coordinate
  u16 mode : 2;    // Bits 8-9: Object mode
  u16 gfx : 2;     // Bits A-B: GFX mode
  u16 mosaic : 1;  // Bit C: Mosaic
  u16 bpp : 1;     // Bit D: Color mode
  u16 shape : 2;   // Bits E-F: Shape
} OBJ_ATTR0;

typedef struct {
  u16 x : 9;         // Bits 0-8: X coordinate
  u16 reserved : 3;  // Bits 9-B: Reserved
  u16 flip : 2;      // Bits C-D: Flip
  u16 size : 2;      // Bits E-F: Size
} OBJ_ATTR1;

typedef struct {
  u16 dummy : 1;     // Bit 0: Always 0
  u16 tileIdX : 4;   // Bits 1-5: Tile ID X
  u16 tileIdY : 5;   // Bits 6-9: Tile ID Y
  u16 priority : 2;  // Bits A-B: Priority
  u16 palette : 4;   // Bits C-F: Palette row
} OBJ_ATTR2;

// Object Attribute Struct
typedef struct {
  OBJ_ATTR0 attr0;
  OBJ_ATTR1 attr1;
  OBJ_ATTR2 attr2;
  u16 fill;
} OBJ_ATTR;


// Object Attribute Memory
#define OAM ((OBJ_ATTR*)(0x7000000))
extern OBJ_ATTR shadowOAM[128];

// Attribute 0
#define ATTR0_Y(y)         ((y) & 0xFF) // Bits 0-7: Y coordinate
#define ATTR0_REGULAR      (0)       // Bits 8-9: Object mode, regular rendering (default)
#define ATTR0_AFFINE       (1)       // Bits 8-9: Object mode, affine rendering
#define ATTR0_HIDE         (2)       // Bits 8-9: Object mode, no rendering (Hidden)
#define ATTR0_DOUBLEAFFINE (3)       // Bits 8-9: Object mode, double affine rendering
#define ATTR0_NOBLEND      (0)       // Bits A-B: GFX, disable alpha blending (default)
#define ATTR0_BLEND        (1)       // Bits A-B: GFX, enable alpha blending
#define ATTR0_WINDOW       (2)       // Bits A-B: GFX, enable object window mode
#define ATTR0_MOSAIC       (1)       // Bit C: Mosaic, enable
#define ATTR0_4BPP         (0)       // Bit D: BPP, 4 (default)
#define ATTR0_8BPP         (1)       // Bit D: BPP, 8
#define ATTR0_SQUARE       (0)       // Bits E-F: Shape, square (default)
#define ATTR0_WIDE         (1)       // Bits E-F: Shape, wide
#define ATTR0_TALL         (2)       // Bits E-F: Shape, tall

// Attribute 1   
#define ATTR1_X(x)    ((x) & 0x1FF) // Bits 0-8: X coordinate
#define ATTR1_HFLIP   (1)       // Bits C-D: Flip, enable horizontal
#define ATTR1_VFLIP   (1)       // Bits C-D: Flip, enable vertical
#define ATTR1_TINY    (0)       // Bits E-F: Size, tiny (default) 
#define ATTR1_SMALL   (1)       // Bits E-F: Size, small
#define ATTR1_MEDIUM  (2)       // Bits E-F: Size, medium
#define ATTR1_LARGE   (3)       // Bits E-F: Size, large

// Attribute 2
#define ATTR2_TILEID(x, y)    (((y) * 64 + (x * 2)) & 0x3FF)  // Bits 0-9: Tile ID
#define ATTR2_PRIORITY(num)   (((num) & 3) << 10)         // Bits A-B: Priority
#define ATTR2_PALROW(y)       (((y) & 0xF) << 12)         // Bits C-F: Palette row (4bpp)

// ----------- Sprite Size Chart --------------
// --------------------------------------------
//        |  TINY  | SMALL | MEDIUM | LARGE  |
// --------------------------------------------
// SQUARE |  8x8   | 16x16 | 32x32  | 64x64  |
// --------------------------------------------
//  WIDE  |  16x8  | 32x8  | 32x16  | 64x32  |
// --------------------------------------------
//  TALL  |  8x16  | 8x32  | 16x32  | 32x64  |
// --------------------------------------------

// Sprite Functions
void hideSprites();

// Julia's recommended generic struct for an animated sprite
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
  s16 enemyLeftBound;  // for enemy: left bound of the enemy's movement
  s16 enemyRightBound;  // for enemy: right bound of the enemy's movement
  s16 enemyWanderTimer;
  s16 enemySpecialTimer;  // for turtle: timer to get out from shell; for bird: timer to attack
  SpriteType_t type : 8;
  u8 timeUntilNextFrame;
  s8 dx;
  s8 dy;
  s8 width;
  s8 height;
  s8 direction;  // 0 for right, 1 for left
  s8 frame;
  s8 numOfFrames;
  s8 hp;
  u8 isAllocated;
  u8 baseTileX;
  u8 baseTileY;
  OBJ_ATTR *oam;
  void (*update_func)(struct _SPRITE *s);
} SPRITE;
#define SPRITE_POOL_SIZE 64
extern SPRITE sprite_pool[SPRITE_POOL_SIZE];

SPRITE *createUI(OBJ_ATTR *oam);
SPRITE *createSprite(SPRITE *prefab);
void recreateSprite(SPRITE *s, SPRITE *prefab);
void freeSprite(SPRITE *s);
void updateSprites();
void clearSprites();

void spriteDraw(SPRITE *s);
unsigned char spriteCollide(SPRITE *a, SPRITE *b);
unsigned char spriteInCamera(SPRITE *s);

#endif