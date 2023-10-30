#include "sprites.h"
#include "camera.h"

// Hides all sprites in the shadowOAM; Must DMA the shadowOAM into the OAM after calling this function
void hideSprites() {
  for (int i = 0; i < 128; i++) {
    shadowOAM[i].attr0.mode = ATTR0_HIDE;
  }
}

SPRITE sprite_pool[SPRITE_POOL_SIZE];
// shadowOAM
OBJ_ATTR shadowOAM[128];

SPRITE *createSprite(SPRITE *prefab) {
  for (int i = 0; i < SPRITE_POOL_SIZE; i++) {
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
  for (int i = 0; i < SPRITE_POOL_SIZE; i++) {
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
  s->oam->attr0.mode = ATTR0_HIDE;
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
    s->timeUntilNextFrame = 15;  // 4fps
  }
  s->oam->attr2.tileIdY = s->baseTileY + s->frame * (s->height) / 8;
}

void updateSprites() {
  for (int i = 0; i < SPRITE_POOL_SIZE; i++) {
    SPRITE *s = &sprite_pool[i];
    if (s->isAllocated && s->update_func) {
      s->update_func(s);
    }
    if (s->isAllocated && s->type != SPRITE_UI) {
      spriteAnimation(s);
      spriteDraw(s);
    }
  }
  DMANow(3, shadowOAM, OAM, 128 * sizeof(OBJ_ATTR) / sizeof(u16));
}

void clearSprites() {
  for (int i = 0; i < SPRITE_POOL_SIZE; i++) {
    if (sprite_pool[i].isAllocated) {
      freeSprite(&sprite_pool[i]);
    }
  }
}

unsigned char spriteInCamera(SPRITE *s) {
  return (s->x + s->width > hOff && s->x < hOff + SCREENWIDTH && s->y + s->height > vOff && s->y < vOff + SCREENHEIGHT);
}

unsigned char spriteCollide(SPRITE *a, SPRITE *b) {
  return collision(a->x, a->y, a->width, a->height, b->x, b->y, b->width, b->height);
}

void spriteDraw(SPRITE *s) {
  if (!s->isAllocated) {
    return;
  }
  // deal with sprite out of camera
  if (!spriteInCamera(s)) {
    s->oam->attr0.mode = ATTR0_HIDE;
    return;
  }

  s->oam->attr0.mode = ATTR0_REGULAR;

  int viewX = s->x - hOff;
  int viewY = s->y - vOff;

  // deal with partial sprite
  if (viewX < 0 && viewX + s->width > 0) {
    viewX += ATTR1_X(0xffff);
  }
  if (viewY < 0 && viewY + s->height > 0) {
    viewY += ATTR0_Y(0xffff);
  }
  s->oam->attr0.y = viewY;
  s->oam->attr1.x = viewX;
}
