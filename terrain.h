#include "gba.h"
extern int mapHeight;
extern int mapWidth;
extern unsigned char * mapCollisionBitmap;

u8 isNotTerrain(int x, int y);

u8 isTerrain(int x, int y);

unsigned char collideTerrain(struct _SPRITE *sprite, int mapWidth, int mapHeight);

int spriteTryMove(struct _SPRITE *s, int dx, int dy);
