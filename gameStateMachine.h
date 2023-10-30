#ifndef GAMESTATEMACHINE_H_
#define GAMESTATEMACHINE_H_
extern int seed;

typedef enum { START, GAMEINFO, GAME0, PAUSE, WIN, LOSE } GameState_t;

void stateMachineInit();
void stateMachineLoop();
void setState(GameState_t next_state);


#endif  // GAMESTATEMACHINE_H_
