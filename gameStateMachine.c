#include "gameStateMachine.h"
#include <stdlib.h>
#include "assets/audio/instructionPage.h"
#include "assets/audio/loseSound.h"
#include "assets/audio/menu_song.h"
#include "assets/audio/win.h"
#include "assets/gameInfoPage.h"
#include "assets/level0background.h"
#include "assets/level0collisionmap.h"
#include "assets/losePage.h"
#include "assets/pausePage.h"
#include "assets/spritesheet.h"
#include "assets/welcome.h"
#include "assets/winPage.h"
#include "game.h"
#include "gba.h"
#include "mode0.h"
#include "print.h"
#include "sound.h"
#include "sprites.h"

#define true 1
#define false 0
#define bool char
#undef mgba_printf

// buttons
unsigned short oldButtons;
unsigned short buttons;

int seed;
GameState_t previous_state;
GameState_t state;
bool state_changed;

// timer for bg switch
int bgState;
int bgTimer;

void stateMachineInit() {
  previous_state = START;
  setState(START);
  bgState = 1;
  bgTimer = 0;
}

void setState(GameState_t next_state) {
  mgba_printf("state changed: from %d to %d", state, next_state);
  previous_state = state;
  state = next_state;
  state_changed = true;
}

void start() {
  hideSprites();

  if (bgTimer == 60) {
    if (bgState == 0) {
      REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(22) | BG_SIZE_SMALL | BG_8BPP | (3);
      bgState = 1;
    } else {
      REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(23) | BG_SIZE_SMALL | BG_8BPP | (3);
      bgState = 0;
    }

    bgTimer = 0;
  }

  REG_BG1HOFF = seed % 256;
  REG_BG2HOFF = 256 - (seed % 256);
  if (seed % 60 == 0) {
    OAM[0].attr0.bpp = ATTR0_8BPP;
    OAM[0].attr0.shape = ATTR0_SQUARE;
    OAM[0].attr0.y = 72;
    OAM[0].attr1.x = 112;

    OAM[0].attr1.size = ATTR1_SMALL;
    OAM[0].attr0.mode = ATTR0_REGULAR;
    OAM[0].attr2.tileIdY = 0;
    OAM[0].attr2.tileIdX = 0;
    OAM[0].attr2.tileIdY = ((seed / 60) % 4) * 2;
  }
  // State transitions
  if (BUTTON_PRESSED(BUTTON_SELECT)) {
    setState(GAMEINFO);
  }
  if (BUTTON_PRESSED(BUTTON_START)) {
    setState(GAME0);
  }
  // Change framerate to 60 fps
  bgTimer++;
  seed++;
}

void gameInfo() {
  if (BUTTON_PRESSED(BUTTON_START)) {
    setState(START);
  }
}

void pause() {
  if (BUTTON_PRESSED(BUTTON_START)) {
    setState(GAME0);
    unpauseSounds();
  }
  if (BUTTON_PRESSED(BUTTON_SELECT)) {  // return to welcome page （回主界面）
    setState(START);
  }
}

void win() {
  if (BUTTON_PRESSED(BUTTON_START)) {
    setState(START);
  }
}

void lose() {
  win();
}

void goToStart() {
  REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(1) | BG_ENABLE(2) | SPRITE_ENABLE;
  // Loading welcome page background into appropriate place in memory
  REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(22) | BG_SIZE_SMALL | BG_8BPP | (3);
  REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(20) | BG_SIZE_SMALL | BG_8BPP | (2);
  REG_BG2CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(21) | BG_SIZE_SMALL | BG_8BPP | (2);
  DMANow(3, welcomePal, PALETTE, 256);
  DMANow(3, welcomeTiles, &CHARBLOCK[0], welcomeTilesLen / 2);
  DMANow(3, welcomeMap, &SCREENBLOCK[20], welcomeMapLen / 2);
  DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
  DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
  // hide sprites again
  hideSprites();
  DMANow(3, shadowOAM, OAM, 512);
  playSoundA(menu_song_data, menu_song_length, 1);
}

void goToGameInfo() {
  REG_DISPCTL = MODE(0) | BG_ENABLE(0);
  REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(20) | BG_4BPP | BG_SIZE_SMALL;
  hideSprites();
  DMANow(3, gameInfoPagePal, PALETTE, 256);
  DMANow(3, gameInfoPageTiles, &CHARBLOCK[0], gameInfoPageTilesLen / 2);
  DMANow(3, gameInfoPageMap, &SCREENBLOCK[20], gameInfoPageMapLen / 2);
}

void goToGame0(GameState_t previous_state) {
  hideSprites();
  if (previous_state == PAUSE) {
    resumeGame();
  } else {
    mgba_printf("seed is %d", seed);
    srand(seed);
    initGame();
  }
}

void goToPause() {
  REG_DISPCTL = MODE(0) | BG_ENABLE(0);
  REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(20) | BG_8BPP | BG_SIZE_SMALL;

  DMANow(3, pausePagePal, PALETTE, 256);
  DMANow(3, pausePageTiles, &CHARBLOCK[0], pausePageTilesLen / 2);
  DMANow(3, pausePageMap, &SCREENBLOCK[20], pausePageMapLen / 2);

  REG_BG0HOFF = 0;
  REG_BG0VOFF = 0;

  hideSprites();
  DMANow(3, shadowOAM, OAM, 512);
}

void goToWin() {
  REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
  REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(20) | BG_8BPP | BG_SIZE_SMALL;

  DMANow(3, winPagePal, PALETTE, 256);
  DMANow(3, winPageTiles, &CHARBLOCK[0], winPageTilesLen / 2);
  DMANow(3, winPageMap, &SCREENBLOCK[20], winPageMapLen / 2);

  REG_BG0HOFF = 0;
  REG_BG0VOFF = 0;

  clearSprites();
  DMANow(3, shadowOAM, OAM, 512);
  playSoundA(win_data, win_length, 1);
  mgba_printf("diamond collected: %d", diamondCollected);
  for (int i = 0; i < diamondCollected; i++) {
    SPRITE *s = createUI(&pf_ui_diamond);
    s->oam->attr0.y = 96;
    s->oam->attr1.x = 60 + i * 16;
    mgba_printf("diamond %p, x: %d", s->oam, s->oam->attr1.x);
  }
  updateSprites();
}

void goToLose() {
  REG_DISPCTL = MODE(0) | BG_ENABLE(0);
  REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(20) | BG_8BPP | BG_SIZE_SMALL;

  DMANow(3, losePagePal, PALETTE, 256);
  DMANow(3, losePageTiles, &CHARBLOCK[0], losePageTilesLen / 2);
  DMANow(3, losePageMap, &SCREENBLOCK[20], losePageMapLen / 2);

  REG_BG0HOFF = 0;
  REG_BG0VOFF = 0;

  hideSprites();
  DMANow(3, shadowOAM, OAM, 512);
  playSoundA(loseSound_data, loseSound_length, 0);
}

void stateMachineLoop() {
  oldButtons = buttons;
  buttons = REG_BUTTONS;
  if (state_changed) {
    pauseSounds();

    if (previous_state == GAME0 && state != PAUSE) {
      cleanGame();
    }
    switch (state) {
      case START:
        goToStart();
        break;
      case GAMEINFO:
        goToGameInfo();
        break;
      case GAME0:
        goToGame0(previous_state);
        break;
      case PAUSE:
        goToPause();
        break;
      case WIN:
        goToWin();
        break;
      case LOSE:
        goToLose();
        break;
    }
    state_changed = false;
  }
  switch (state) {
    case START:
      start();
      break;
    case GAMEINFO:
      gameInfo();
      break;
    case GAME0:
      game0();
      break;
    case PAUSE:
      pause();
      break;
    case WIN:
      win();
      break;
    case LOSE:
      lose();
      break;
  }
  waitForVBlank();
}
