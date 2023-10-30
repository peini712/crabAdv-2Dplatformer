// This file is related to the game content
#include "game.h"
#include <stdlib.h>
#include <string.h>
#include "assets/audio/crabAttackSound.h"
#include "assets/audio/level0_bgm.h"
#include "assets/audio/level1_bgm.h"
#include "assets/gameInfoPage.h"
#include "assets/level0Intro.h"
#include "assets/level0_frontlayer.h"
#include "assets/level0background.h"
#include "assets/level0collisionmap.h"
#include "assets/level1Intro.h"
#include "assets/level1background.h"
#include "assets/level1collisionmap.h"
#include "assets/losePage.h"
#include "assets/pausePage.h"
#include "assets/spritesheet.h"
#include "assets/winPage.h"
#include "camera.h"
#include "gameStateMachine.h"
#include "gba.h"
#include "mode0.h"
#include "print.h"
#include "sound.h"
#include "sprites.h"
#include "terrain.h"

// prefabs
typedef struct {
  SPRITE sprite;
  OBJ_ATTR oam;
} PREFAB;

PREFAB pf_player;
PREFAB pf_smallCar;
PREFAB pf_bigCar;
PREFAB pf_enemyBird;
PREFAB pf_birdEgg;
PREFAB pf_enemyTurtle;
PREFAB pf_turtleShell;
PREFAB pf_blueWater;
PREFAB pf_greyWater;
PREFAB pf_chest;
PREFAB pf_diamond;
OBJ_ATTR pf_ui_diamond;
OBJ_ATTR pf_ui_heart;
OBJ_ATTR pf_ui_drop;

// player
SPRITE *player;
int playerGravity;
int jumpCounter;  // =0: not jumping, >0: jumping, value is remain frames

// drops
int dropCollected;
int diamondCollected;

#define BG_SB_BEGIN 11

int level;

// UI
SPRITE *ui_hearts[5];
SPRITE *ui_drops[8];

int frameElapsed;
int invincibleCounter;

u8 cheatEnabled;
u8 showingManual;

// forward declarations
static void initPrefabs();
static void carMoveLeft(SPRITE *car);
static void updatePlayer(SPRITE *car);
static void draw();
static SPRITE *createRandomCar();
static SPRITE *createCreature(PREFAB *prefab, s16 x, s16 y);
static SPRITE *createEnemy(SpriteType_t type, int x, int y);
static void initScene0();
static void initScene1();
static void updateCollectible(SPRITE *drop);
static void checkCollideDamage(SPRITE *player);
static void showManual();
void game0() {
  if (showingManual) {
    showManual();
    return;
  }
  frameElapsed++;
  if (invincibleCounter > 0) {
    invincibleCounter--;
  }
  if (BUTTON_PRESSED(BUTTON_START)) {
    mgba_printf("pause");
    setState(PAUSE);
  }
  if (BUTTON_PRESSED(BUTTON_B)) {
    cheatEnabled = !cheatEnabled;
  }
  updateSprites();
  checkCollideDamage(player);
  draw();
  if (level == 0) {
    if (player->x > LEVEL0_MAPWIDTH - player->width - 16) {
      level = 1;
      showingManual = 1;
      initScene1();
      return;
    }
    if (frameElapsed % 180 == 0 && player->x < LEVEL0_MAPWIDTH - 128) {
      createRandomCar();  // cars will self destroy when out of screen, no need to hold them
    }
  } else {
    // right down corner
    if (player->x > LEVEL1_MAPWIDTH - player->width - 32 && player->y > LEVEL1_MAPHEIGHT - 128) {
      mgba_printf("win");
      setState(WIN);
    }
  }
}

static void initUI() {
  mgba_printf("initUI");
  // create UI elements
  for (int i = 0; i < 5; i++) {
    ui_hearts[i] = createUI(&pf_ui_heart);
    // 4px from right, 8px width, 2px gap.
    ui_hearts[i]->oam->attr1.x = SCREENWIDTH - 4 - (i + 1) * (8 + 2);
    // 4px from top.
    ui_hearts[i]->oam->attr0.y = 4;
  }
  for (int i = 0; i < 8; i++) {
    ui_drops[i] = createUI(&pf_ui_drop);
    // 4px from left, 8px width, 2px gap.
    ui_drops[i]->oam->attr1.x = 4 + i * (8 + 2);
    // 4px from top.
    ui_drops[i]->oam->attr0.y = 4;
  }
}

static void updateUI() {
  mgba_printf("updateUI");
  for (int i = 0; i < player->hp; i++) {
    ui_hearts[i]->oam->attr0.mode = ATTR0_REGULAR;
  }
  for (int i = player->hp; i < 5; i++) {
    ui_hearts[i]->oam->attr0.mode = ATTR0_HIDE;
  }

  if (dropCollected > 8) {
    dropCollected = 8;
  }
  for (int i = 0; i < dropCollected; i++) {
    ui_drops[i]->oam->attr0.mode = ATTR0_REGULAR;
  }
  for (int i = dropCollected; i < 8; i++) {
    ui_drops[i]->oam->attr0.mode = ATTR0_HIDE;
  }
}

static void initScene0() {
  mgba_printf("initScene0");
  level = 0;
  mapWidth = LEVEL0_MAPWIDTH;
  mapHeight = LEVEL0_MAPHEIGHT;
  mapCollisionBitmap = (u8 *)level0collisionmapBitmap;
  resumeGame();

  clearSprites();
  initUI();

  // create game objects
  player = createCreature(&pf_player, 16, LEVEL0_HORIZION_Y - pf_player.sprite.height);
  int drop_y = LEVEL0_HORIZION_Y - pf_blueWater.sprite.height;
  createCreature(&pf_blueWater, rand() % (LEVEL0_MAPWIDTH - 64), drop_y);
  createCreature(&pf_blueWater, rand() % (LEVEL0_MAPWIDTH - 64), drop_y);
  // drop3 always appear on the rightmost 1/5 of map
  createCreature(&pf_blueWater, LEVEL0_MAPWIDTH / 5 * 4 + rand() % (LEVEL0_MAPWIDTH / 5 - 64), drop_y);
  updateUI();
  playSoundA(level0_bgm_data, level0_bgm_length, 1);
}

static void initScene1() {
  mgba_printf("initScene1");
  level = 1;
  mapWidth = LEVEL1_MAPWIDTH;
  mapHeight = LEVEL1_MAPHEIGHT;
  mapCollisionBitmap = (u8 *)level1collisionmapBitmap;
  resumeGame();

  clearSprites();
  initUI();

  player = createCreature(&pf_player, 16, 450);

  createEnemy(SPRITE_TURTLE, 320, 310);
  createEnemy(SPRITE_TURTLE, 600, 200);
  createEnemy(SPRITE_TURTLE, 192, 450)->enemyLeftBound = 176;
  createEnemy(SPRITE_TURTLE, 360, 90);
  createEnemy(SPRITE_TURTLE, 714, 128);
  createEnemy(SPRITE_TURTLE, 32, 240);
  createEnemy(SPRITE_TURTLE, 875, 440);
  createEnemy(SPRITE_BIRD, 30, 310);
  createEnemy(SPRITE_BIRD, 560, 250);
  createCreature(&pf_blueWater, 112, 402);
  createCreature(&pf_blueWater, 272, 326);
  createCreature(&pf_blueWater, 600, 190);
  createCreature(&pf_chest, 768, 280);
  createCreature(&pf_chest, 580, 430);
  createCreature(&pf_chest, 830, 115);
  updateUI();
  playSoundA(level1_bgm_data, level1_bgm_length, 1);
}

void initGame() {
  // Load spritesheet to CHARBLOCK
  // Load spritesheet palette
  showingManual = 1;
  level = 0;
  invincibleCounter = 0;
  diamondCollected = 0;
  cheatEnabled = 0;
  hideSprites();
  DMANow(3, shadowOAM, OAM, 512);
  REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;

  mgba_open();
  initPrefabs();

  DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
  DMANow(3, spritesheetPal, SPRITEPALETTE, 256);

  initScene0();

  // Initializing hOff and vOff to center bottom of map
  hOff = 10;
  vOff = 30;
  dropCollected = 0;
  frameElapsed = 0;
  playerGravity = 2;
  updateUI();
}

void resumeGame() {
  REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
  DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
  DMANow(3, spritesheetPal, SPRITEPALETTE, 256);

  memset(&CHARBLOCK[3][510], 0xf0, sizeof(TILE));
  if (level == 0) {
    REG_DISPCTL = REG_DISPCTL | BG_ENABLE(1);
    DMANow(3, level0backgroundPal, PALETTE, 256);
    DMANow(3, level0backgroundTiles, &CHARBLOCK[0], level0backgroundTilesLen / 2);
    DMANow(3, level0backgroundMap, &SCREENBLOCK[BG_SB_BEGIN], level0backgroundMapLen / 2);

    // load front layer, but we need to change the palette
    for (int i = 0; i < level0_frontlayerTilesLen; i++) {
      char *tile = &((char *)(&CHARBLOCK[3]))[i];
      char *src = &((char *)(level0_frontlayerTiles))[i];
      if (*src != 0) {
        *tile = *src + 128;
      } else {
        *tile = *src;
      }
    }
    for (int i = 0; i < 128; i++) {
      PALETTE[128 + i] = level0_frontlayerPal[i];
    }
    DMANow(3, level0_frontlayerMap, &SCREENBLOCK[BG_SB_BEGIN + 10], level0_frontlayerMapLen / 2);
  } else {
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(BG_SB_BEGIN) | BG_8BPP | BG_SIZE_LARGE;

    DMANow(3, level1backgroundPal, PALETTE, 256);
    DMANow(3, level1backgroundTiles, &CHARBLOCK[0], level1backgroundTilesLen / 2);

    const int offset_per_sb = sizeof(screenblock) / sizeof(u16);
    // left
    DMANow(3, level1backgroundMap + offset_per_sb * 0, &SCREENBLOCK[BG_SB_BEGIN + 0], sizeof(screenblock) / 2);
    DMANow(3, level1backgroundMap + offset_per_sb * 1, &SCREENBLOCK[BG_SB_BEGIN + 1], sizeof(screenblock) / 2);
    DMANow(3, level1backgroundMap + offset_per_sb * 4, &SCREENBLOCK[BG_SB_BEGIN + 2], sizeof(screenblock) / 2);
    DMANow(3, level1backgroundMap + offset_per_sb * 5, &SCREENBLOCK[BG_SB_BEGIN + 3], sizeof(screenblock) / 2);

    // middle
    DMANow(3, level1backgroundMap + offset_per_sb * 1, &SCREENBLOCK[BG_SB_BEGIN + 4], sizeof(screenblock) / 2);
    DMANow(3, level1backgroundMap + offset_per_sb * 2, &SCREENBLOCK[BG_SB_BEGIN + 5], sizeof(screenblock) / 2);
    DMANow(3, level1backgroundMap + offset_per_sb * 5, &SCREENBLOCK[BG_SB_BEGIN + 6], sizeof(screenblock) / 2);
    DMANow(3, level1backgroundMap + offset_per_sb * 6, &SCREENBLOCK[BG_SB_BEGIN + 7], sizeof(screenblock) / 2);

    // right
    DMANow(3, level1backgroundMap + offset_per_sb * 2, &SCREENBLOCK[BG_SB_BEGIN + 8], sizeof(screenblock) / 2);
    DMANow(3, level1backgroundMap + offset_per_sb * 3, &SCREENBLOCK[BG_SB_BEGIN + 9], sizeof(screenblock) / 2);
    DMANow(3, level1backgroundMap + offset_per_sb * 6, &SCREENBLOCK[BG_SB_BEGIN + 10], sizeof(screenblock) / 2);
    DMANow(3, level1backgroundMap + offset_per_sb * 7, &SCREENBLOCK[BG_SB_BEGIN + 11], sizeof(screenblock) / 2);
  }
  updateUI();
  unpauseSounds();
}

void cleanGame() {
  clearSprites();
  REG_DISPCTL = MODE(0);
  REG_BG0VOFF = 0;
  REG_BG0HOFF = 0;
  REG_BG1VOFF = 0;
  REG_BG1HOFF = 0;
}

static SPRITE *createRandomCar() {
  PREFAB *pf = rand() % 5 == 4 ? &pf_bigCar : &pf_smallCar;
  SPRITE *car = createCreature(pf, LEVEL0_MAPWIDTH - pf->sprite.width, LEVEL0_HORIZION_Y - pf->sprite.height);
  if (pf == &pf_smallCar) {
    car->baseTileX += rand() % 4 * 2;  // random choose a color
  }
  return car;
}

static SPRITE *createEnemy(SpriteType_t type, int x, int y) {
  SPRITE *pf = type == SPRITE_TURTLE ? &pf_enemyTurtle.sprite : &pf_enemyBird.sprite;
  SPRITE *enemy = createSprite(pf);
  enemy->x = x;
  enemy->y = y;

  return enemy;
}

static u8 damage(SPRITE *unit) {
  if (unit->type == SPRITE_PLAYER) {
    mgba_printf("invincibleCounter: %d", invincibleCounter);
    if (invincibleCounter > 0) {
      return 0;
    }
    invincibleCounter = 60;
  }
  unit->hp--;
  if (unit->hp < 0) {
    unit->hp = 0;
  }
  if (unit->hp == 0) {
    if (unit->type == SPRITE_PLAYER) {
      // game over
      mgba_printf("game over");
      setState(LOSE);
    } else if (unit->type == SPRITE_TURTLE) {
      // turtle becomes shell
      unit->type = SPRITE_SHELL;
      unit->baseTileX = 12;
      unit->baseTileY = 0;
      unit->numOfFrames = 1;
      unit->frame = 0;
      unit->direction = 0;
      unit->update_func = updateCollectible;
    } else {
      freeSprite(unit);
    }
  }
  updateUI();
  return 1;
}

static void checkCollideDamage(SPRITE *player) {
  for (int i = 0; i < SPRITE_POOL_SIZE; i++) {
    SPRITE *enemy = &sprite_pool[i];
    if (!enemy->isAllocated) {
      continue;
    }
    if (enemy->type == SPRITE_TURTLE || enemy->type == SPRITE_CAR || enemy->type == SPRITE_BIRD ||
        enemy->type == SPRITE_EGG) {
      if (spriteCollide(player, enemy)) {
        mgba_printf("collide with enemy %d", i);
        if (damage(player)) {
          mgba_printf("player damaged");
          // damage(enemy);
        }
      }
    }
  }
}

inline void showManual() {
  hideSprites();
  REG_DISPCTL = MODE(0) | BG_ENABLE(0);
  REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(20) | BG_8BPP | BG_SIZE_SMALL;
  REG_BG0HOFF = 0;
  REG_BG0VOFF = 0;
  if (level == 0) {
    DMANow(3, level0IntroPal, PALETTE, 256);
    DMANow(3, level0IntroTiles, &CHARBLOCK[0], level0IntroTilesLen / 2);
    DMANow(3, level0IntroMap, &SCREENBLOCK[20], level0IntroMapLen / 2);
  } else {
    DMANow(3, level1IntroPal, PALETTE, 256);
    DMANow(3, level1IntroTiles, &CHARBLOCK[0], level1IntroTilesLen / 2);
    DMANow(3, level1IntroMap, &SCREENBLOCK[20], level1IntroMapLen / 2);
  }

  if (BUTTON_PRESSED(BUTTON_START)) {
    showingManual = 0;
    resumeGame();
  }
}

static void updatePlayer(SPRITE *player) {
  // Unless a button is pressed, the player is not moving
  u8 isMoving = 0;

  // Pre-calculated locations on the sprite
  int leftX = player->x;
  int rightX = player->x + player->width - 1;
  // int topY = player->y;
  int bottomY = player->y + player->height - 1;

  if (BUTTON_PRESSED(BUTTON_UP) && (!isNotTerrain(leftX, bottomY + 1) || !isNotTerrain(rightX, bottomY + 1))) {
    jumpCounter = 10;  // jump for 10 frames
  }

  if (BUTTON_HELD(BUTTON_UP)) {  // hold up to jump higher
    if (jumpCounter > 0) {
      if (frameElapsed % 2 == 0) {
        jumpCounter++;
      }
    }
  }
  u8 isJumping = jumpCounter > 0;
  if (jumpCounter > 0) {
    jumpCounter -= 1;
    isMoving = 1;
    int jumpSpeed = player->dy;

    // simulate a decreasing jump speed
    if (jumpCounter >= 8) {
      jumpSpeed *= 5;
    } else {
      jumpSpeed = (float)jumpSpeed * (1.f + ((float)jumpCounter / 2));
    }
    if (!spriteTryMove(player, 0, -jumpSpeed)) {
      jumpCounter = 0;
      mgba_printf("ouch! crashed into the ceiling");
    }
  } else {
    spriteTryMove(player, 0, playerGravity);
  }

  if (BUTTON_HELD(BUTTON_LEFT)) {
    isMoving = 1;
    player->direction = 1;
    spriteTryMove(player, -player->dx, 0);
  }
  if (BUTTON_HELD(BUTTON_RIGHT)) {
    isMoving = 1;
    player->direction = 0;
    spriteTryMove(player, player->dx, 0);
  }

  player->baseTileY = isJumping ? 8 : 0;
  if (!isMoving && !isJumping) {
    player->frame = 0;
    player->timeUntilNextFrame = 10;
  }

  // Center screen on player as much as possible without wrapping
  if (player->x < SCREENWIDTH / 2) {
    hOff = 0;
  } else if (player->x > mapWidth - SCREENWIDTH / 2) {
    hOff = mapWidth - SCREENWIDTH;
  } else {
    hOff = player->x - SCREENWIDTH / 2;
  }

  if (player->y < SCREENHEIGHT / 2) {
    vOff = 0;
  } else if (player->y > mapHeight - SCREENHEIGHT / 2) {
    vOff = mapHeight - SCREENHEIGHT;
  } else {
    vOff = player->y - SCREENHEIGHT / 2;
  }

  // deal with shoot
  if (level == 1 && BUTTON_PRESSED(BUTTON_A)) {
    if (dropCollected > 0) {
      mgba_printf("fire!");
      // create a bullet
      SPRITE *bullet = createSprite(&pf_greyWater.sprite);
      bullet->x = player->x + player->width;
      bullet->y = player->y + player->height / 2;
      bullet->direction = player->direction;
      dropCollected--;
      dropCollected = dropCollected < 0 ? 0 : dropCollected;
      updateUI();
      playSoundB(crabAttackSound_data, crabAttackSound_length, 0);
    }
  }
}

static void carMoveLeft(SPRITE *car) {
  if (car->x > 0) {
    car->x -= car->dx;
  }
  if (car->x <= 0) {
    freeSprite(car);
    return;
  }
}

static void updateCollectible(SPRITE *item) {
  if (spriteCollide(item, player)) {
    freeSprite(item);

    REG_SND2CNT = DMG_ENV_VOL(5) | DMG_STEP_TIME(7);
    REG_SND2FREQ = NOTE_G6 | SND_RESET;
    int bonus = 0;
    if (item->type == SPRITE_DROP) {
      bonus = 1;
    } else if (item->type == SPRITE_SHELL) {
      bonus = 3;
    } else if (item->type == SPRITE_DIAMOND) {
      diamondCollected++;
#undef mgba_printf
      mgba_printf("diamond collected: %d", diamondCollected);
    }
    dropCollected += bonus;  // drop for 1, shell for 3
    updateUI();
  }
}

static void updateEgg(SPRITE *egg) {
  // drop on gravity
  egg->y += egg->dy;
  if (!isNotTerrain(egg->x, egg->y + egg->height)) {  // hit the ground
    freeSprite(egg);
    return;
  }
}

static void updateEnemy(SPRITE *enemy) {
  // deal shell awakening
  // UPDATE: NO, shell will never awake
  if (enemy->type == SPRITE_TURTLE) {
    while (isNotTerrain(enemy->x + enemy->width / 2, enemy->y + enemy->height)) {
      // push turtle to the ground
      enemy->y++;
    }
  }

  enemy->enemyWanderTimer--;
  // if enemy is at the edge of the world, or if it has been wandering for a while, turn around
  char hitEdge = enemy->x <= 0 || enemy->x <= enemy->enemyLeftBound || enemy->x + enemy->width >= mapWidth ||
                 enemy->x >= enemy->enemyRightBound;
  // check if hits terrain
  if (collideTerrain(enemy, LEVEL1_MAPWIDTH, LEVEL1_MAPHEIGHT)) {
    hitEdge = 1;
  }

  // if enemy is a turtle, check if it reaches the edge of a platform
  if (enemy->type == SPRITE_TURTLE) {
    if (enemy->direction == 0) {
      // check right
      hitEdge = hitEdge || isNotTerrain(enemy->x + enemy->width + 1, enemy->y + enemy->height + 1);
    } else {
      // check left
      hitEdge = hitEdge || isNotTerrain(enemy->x - 1, enemy->y + enemy->height + 1);
    }
  }
  if (enemy->enemyWanderTimer <= 0 || hitEdge) {
    enemy->enemyWanderTimer = 300;
    if (hitEdge) {
      enemy->direction = enemy->direction == 0 ? 1 : 0;
    } else {
      enemy->direction = rand() % 2;
    }
  }
  enemy->x += enemy->direction == 0 ? enemy->dx : -enemy->dx;

  // deal brid bombing
  if (enemy->type == SPRITE_BIRD) {
    enemy->enemySpecialTimer--;
    if (enemy->enemySpecialTimer <= 0) {
      SPRITE *egg = createSprite(&pf_birdEgg.sprite);
      egg->x = enemy->x + enemy->width / 2;
      egg->y = enemy->y + enemy->height / 2;
      enemy->enemySpecialTimer = 120;
    }
  }
}

static void updateBullet(SPRITE *bullet) {
  if (bullet->direction == 0) {
    bullet->x += bullet->dx;
  } else {
    bullet->x -= bullet->dx;
  }

  if (bullet->x < 0 || bullet->x > LEVEL1_MAPWIDTH) {
    freeSprite(bullet);
    return;
  }

  // iterate sprite_pool
  for (int i = 0; i < SPRITE_POOL_SIZE; i++) {
    SPRITE *sprite = &sprite_pool[i];
    if (sprite->isAllocated &&
        (sprite->type == SPRITE_TURTLE || sprite->type == SPRITE_BIRD || sprite->type == SPRITE_CAR)) {
      if (spriteCollide(bullet, sprite)) {
        damage(bullet);
        damage(sprite);
      }
    }
  }
}

static void updateChest(SPRITE *chest) {
  if (spriteCollide(chest, player)) {
    createCreature(&pf_diamond, chest->x, chest->y - 24);
    freeSprite(chest);
  }
}

static void drawBar() {
  float finish_percent = (float)player->x / (float)mapWidth;
  int bar_width = finish_percent * SCREENWIDTH;

  TILE *bar_full_tile = &CHARBLOCK[3][250 * 2];
  TILE *bar_half_tile = &CHARBLOCK[3][251 * 2];
  memset(bar_full_tile->tileData, 0xf0, 2 * sizeof(TILE));  // a 8bpp tile ocupies 2 TILE objects
  memset(bar_half_tile->tileData, 0x00, 2 * sizeof(TILE));  // a 8bpp tile ocupies 2 TILE objects
  for (int i = 0; i < bar_width % 8; i++) {
    for (int j = 0; j < 8; j++) {
      ((char *)bar_half_tile->tileData)[i + j * 8] = 0xf0;
    }
  }

  PALETTE[0xf0] = RGB(255, 128, 0);
  REG_DISPCTL = REG_DISPCTL | BG_ENABLE(2);
  REG_BG2CNT = BG_CHARBLOCK(3) | BG_SCREENBLOCK(BG_SB_BEGIN - 1) | BG_8BPP | BG_SIZE_SMALL | 1;
  REG_BG2VOFF = 0;
  REG_BG2HOFF = 0;
  screenblock *bar_screenblock = &SCREENBLOCK[BG_SB_BEGIN - 1];
  memset(bar_screenblock, 0x00, sizeof(screenblock));
  for (int i = 0; i < bar_width / 8; i++) {
    bar_screenblock->tilemap[32 * 19 + i] = 250;
  }
  bar_screenblock->tilemap[32 * 19 + bar_width / 8] = 251;
}

static void draw() {
  DMANow(3, shadowOAM, OAM, 128 * 4);

  int bg_page = hOff / 256;  // each screenblock is 256 pixels wide
  bg_page = bg_page > 2 ? 2 : bg_page;
  // shift the background
  if (level == 0) {
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(BG_SB_BEGIN + bg_page) | BG_8BPP | BG_SIZE_WIDE | 3;
    REG_BG0CNT = BG_CHARBLOCK(3) | BG_SCREENBLOCK(BG_SB_BEGIN + 10) | BG_8BPP | BG_SIZE_SMALL | 2;
    REG_BG0VOFF = vOff + 72;
    REG_BG0HOFF = 256 - (hOff % 256);  // 256 is the width of foreground
    REG_BG1HOFF = hOff - bg_page * 256;
    REG_BG1VOFF = vOff;
    REG_DISPCTL = REG_DISPCTL | BG_ENABLE(1) | BG_ENABLE(0);
  } else {
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(BG_SB_BEGIN + bg_page * 4) | BG_8BPP | BG_SIZE_LARGE | 3;
    REG_DISPCTL = REG_DISPCTL & (~BG_ENABLE(1));
    REG_BG0HOFF = hOff - bg_page * 256;
    REG_BG0VOFF = vOff;
  }
  if (cheatEnabled) {
    drawBar();
  } else {
    REG_DISPCTL = REG_DISPCTL & (~BG_ENABLE(2));
  }
}

static SPRITE *createCreature(PREFAB *prefab, s16 x, s16 y) {
  mgba_printf("create creature at %d, %d", x, y);
  SPRITE *sprite = createSprite(&prefab->sprite);
  sprite->x = x;
  sprite->y = y;
  return sprite;
}

static void initOnePrefab(PREFAB *prefab,
                          SpriteType_t type,
                          s8 width,
                          s8 height,
                          s8 numOfFrames,
                          s8 dx,
                          s8 dy,
                          void (*update_func)(SPRITE *),
                          u16 baseTileX,
                          u16 baseTileY) {
  prefab->sprite.type = type;
  prefab->sprite.width = width;
  prefab->sprite.height = height;
  prefab->sprite.x = 0;
  prefab->sprite.y = 0;
  prefab->sprite.hp = -1;
  prefab->sprite.numOfFrames = numOfFrames;
  prefab->sprite.direction = 0;
  prefab->sprite.frame = 0;
  prefab->sprite.timeUntilNextFrame = 30;
  prefab->sprite.dx = dx;
  prefab->sprite.dy = dy;
  prefab->sprite.enemyLeftBound = 0;
  prefab->sprite.enemyRightBound = 32767;
  prefab->sprite.update_func = update_func;
  prefab->sprite.oam = &prefab->oam;
  prefab->sprite.baseTileX = baseTileX;
  prefab->sprite.baseTileY = baseTileY;
  prefab->oam.attr0.bpp = ATTR0_8BPP;
  if (width == 16 && height == 16) {
    prefab->oam.attr0.shape = ATTR0_SQUARE;
    prefab->oam.attr1.size = ATTR1_SMALL;
  } else if (width == 32 && height == 16) {
    prefab->oam.attr0.shape = ATTR0_WIDE;
    prefab->oam.attr1.size = ATTR1_MEDIUM;
  } else if (width == 8 && height == 8) {
    prefab->oam.attr0.shape = ATTR0_SQUARE;
    prefab->oam.attr1.size = ATTR1_TINY;
  }
  prefab->oam.attr0.mode = ATTR0_REGULAR;
  prefab->oam.attr2.tileIdY = baseTileY;
  prefab->oam.attr2.tileIdX = baseTileX;
}

static void initPrefabs() {
  // Initializing pf_player sprite
  initOnePrefab(&pf_player, SPRITE_PLAYER, 16, 16, 4, 1, 1, updatePlayer, 0, 0);
  pf_player.sprite.hp = 5;
  initOnePrefab(&pf_smallCar, SPRITE_CAR, 16, 16, 1, 3, 0, carMoveLeft, 4, 8);
  pf_smallCar.sprite.hp = 1;
  initOnePrefab(&pf_bigCar, SPRITE_CAR, 32, 16, 1, 3, 0, carMoveLeft, 12, 8);
  pf_bigCar.sprite.hp = 1;
  initOnePrefab(&pf_blueWater, SPRITE_DROP, 8, 8, 1, 0, 0, updateCollectible, 4, 10);
  pf_blueWater.sprite.hp = -99;
  initOnePrefab(&pf_greyWater, SPRITE_BULLET, 8, 8, 1, 8, 0, updateBullet, 4, 11);
  pf_greyWater.sprite.hp = 1;
  initOnePrefab(&pf_enemyTurtle, SPRITE_TURTLE, 16, 16, 4, 1, 0, updateEnemy, 8, 0);
  pf_enemyTurtle.sprite.hp = 2;
  initOnePrefab(&pf_enemyBird, SPRITE_BIRD, 32, 16, 4, 2, 0, updateEnemy, 0, 16);
  pf_enemyBird.sprite.hp = 1;
  initOnePrefab(&pf_birdEgg, SPRITE_EGG, 8, 8, 1, 0, 3, updateEgg, 4, 11);
  pf_birdEgg.sprite.hp = 1;
  initOnePrefab(&pf_chest, SPRITE_OTHER, 16, 16, 1, 0, 0, updateChest, 6, 10);
  initOnePrefab(&pf_diamond, SPRITE_DIAMOND, 16, 16, 2, 0, 0, updateCollectible, 8, 10);

  pf_ui_heart.attr0.mode = ATTR0_REGULAR;
  pf_ui_heart.attr0.bpp = ATTR0_8BPP;
  pf_ui_heart.attr0.shape = ATTR0_SQUARE;
  pf_ui_heart.attr0.y = 4;
  pf_ui_heart.attr1.size = ATTR1_TINY;
  pf_ui_heart.attr1.x = 0;
  pf_ui_heart.attr2.palette = ATTR2_PALROW(0);
  pf_ui_heart.attr2.tileIdX = 5;
  pf_ui_heart.attr2.tileIdY = 10;

  pf_ui_drop = pf_blueWater.oam;
  pf_ui_drop.attr0.y = 4;

  pf_ui_diamond = pf_diamond.oam;
}
