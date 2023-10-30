#ifndef GAME_H_
#define GAME_H_
#include "sprites.h"
//（level0, level1 的背景图长宽）

#define LEVEL0_MAPWIDTH 1024
#define LEVEL0_MAPHEIGHT 256
#define LEVEL0_HORIZION_Y 120

#define LEVEL1_MAPWIDTH 1024
#define LEVEL1_MAPHEIGHT 512
//macros for the game
extern int diamondCollected;
extern OBJ_ATTR pf_ui_diamond;


//function prototypes

void game0();
void initGame();
void resumeGame();

void cleanGame();

//variables


#endif  // GAME_H_
