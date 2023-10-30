/*Last Update: May 3, 2023
Welcome to Crab Adventure ;)
Updates from last version: 
1. Adding game cheat while DMA the Palette at Runtime
   p.s. Press BUTTON_B to start the game cheat, it is a position bar at the bottom of the screen in red,
   You will know how far you are away from the end of the game.
   Feel free to use the game cheat at any level and time to know your curr location in the 
   map so you won't get lost in the huge map.
2. Adding more seperately moving layers (now in welcome page and level1)
3. Finalizing arts
4. Adding 2 more intro pages before each level
5. Remake the instruction screen, pause screen, and end screen.
6. Adding the diamond record to the win page (you will see different numbers of diamonds in the win page if you play0-3). 
7. Adding digital sounds when crab collected diamonds/water.
8. Updates the collisionmap to fix some errors.
9. Adding more enemies to the empty platforms, making the game harder.
*/

#include <stdlib.h>
#include "game.h"
#include "gameStateMachine.h"
#include "gba.h"
#include "mode0.h"
#include "print.h"
#include "sound.h"
#include "sprites.h"

void initialize();

int main() {
  initialize();

  while (1) {
    stateMachineLoop();
  }
}

// setting up GBA
void initialize() {
  REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
  REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(24) | BG_SIZE_SMALL | BG_4BPP;  

  // hide sprite
  hideSprites();
  DMANow(3, shadowOAM, OAM, 512);

  setupSounds();
  stateMachineInit();
}
