#include "gba.h"
#include "print.h"
#include "sprites.h"
int mapHeight;
int mapWidth;
unsigned char *mapCollisionBitmap;

u8 isNotTerrain(int x, int y) {
  return (mapCollisionBitmap)[x + mapWidth * y];
}

u8 isTerrain(int x, int y) {
  return !isNotTerrain(x, y);
}

// 4O(n) collision detection on 4 borders
unsigned char collideTerrain(SPRITE *sprite, int mapWidth, int mapHeight) {
  int x = sprite->x;
  int y = sprite->y;
  int width = sprite->width;
  int height = sprite->height;
  if (x < 0 || y < 0 || x + width > mapWidth || y + height > mapHeight) {
    return 1;
  }

  // check 4 borders
  // for (int i = 0; i < width; i++) {
  //   // top
  //   if (isNotTerrain(x + i, y) == 0) {
  //     return 1;
  //   }
  //   // bottom
  //   if (isNotTerrain(x + i, y + height - 1) == 0) {
  //     return 1;
  //   }
  // }

  for (int i = 0; i < height; i++) {
    // left
    if (isNotTerrain(x, y + i) == 0) {
      return 1;
    }
    // right
    if (isNotTerrain(x + width - 1, y + i) == 0) {
      return 1;
    }
  }
  return 0;
}

#define ABS(val) ((val) < 0 ? -(val) : (val))
int spriteTryMove(SPRITE *s, int dx, int dy) {
  // only deal with one direction
  if (dx != 0) {
    dy = 0;
    int myX = dx > 0 ? s->x + s->width - 1 : s->x;
    if (myX + dx < 0 || myX + dx >= mapWidth) {
      dx = dx > 0 ? mapWidth - myX - 1 : -myX;
    }
    u8 success = 1;
    // find dx
    int delta = 0;
    while (ABS(delta) < ABS(dx)) {
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

    // find dy
    int delta = 0;
    while (ABS(delta) < ABS(dy)) {
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