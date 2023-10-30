#include "sound.h"
#include "gba.h"
#include "print.h"

SOUND soundA;
SOUND soundB;
void setupInterrupts();

void setupSounds() {
  REG_SOUNDCNT_X = SND_ENABLED;

  REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 | DSA_OUTPUT_RATIO_100 | DSA_OUTPUT_TO_BOTH | DSA_TIMER0 | DSA_FIFO_RESET |
                   DSB_OUTPUT_RATIO_100 | DSB_OUTPUT_TO_BOTH | DSB_TIMER1 | DSB_FIFO_RESET;

  REG_SOUNDCNT_L = DMG_VOL_LEFT(5) | DMG_VOL_RIGHT(5) | DMG_SND1_LEFT | DMG_SND1_RIGHT | DMG_SND2_LEFT |
                   DMG_SND2_RIGHT | DMG_SND3_LEFT | DMG_SND3_RIGHT | DMG_SND4_LEFT | DMG_SND4_RIGHT;
  // REG_SOUNDCNT_H = DMG_MASTER_VOL(2);
  setupInterrupts();
}

// TODO 1.0: Complete this function
void playSoundA(const signed char *data, int dataLength, int looping) {
  // Set DMA channel to 1
  dma[1].cnt = 0;

  DMANow(1, data, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

  // Set up timer 0
  REG_TM0CNT = 0;
  int cyclesPerSample = PROCESSOR_CYCLES_PER_SECOND / SOUND_FREQ;
  REG_TM0D = 65536 - cyclesPerSample;
  REG_TM0CNT = TIMER_ON;
  // Initialize struct members of soundA
  soundA.data = data;
  soundA.dataLength = dataLength;
  soundA.durationInVBlanks = SOUND_FREQ;
  soundA.isPlaying = 1;
  soundA.looping = looping;
  soundA.durationInVBlanks = ((VBLANK_FREQ * dataLength) / SOUND_FREQ);
  soundA.vBlankCount = 0;
}

// TODO 1.1: Complete this function
void playSoundB(const signed char *data, int dataLength, int looping) {
  // Set DMA channel to 2
  // Set up timer 1
  // Initialize struct members of soundB
  dma[2].cnt = 0;
  int cyclesPerSample = PROCESSOR_CYCLES_PER_SECOND / SOUND_FREQ;
  DMANow(2, data, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);
  REG_TM1CNT = 0;
  REG_TM1D = 65536 - cyclesPerSample;
  REG_TM1CNT = TIMER_ON;
  soundB.data = data;
  soundB.dataLength = dataLength;
  soundB.durationInVBlanks = SOUND_FREQ;
  soundB.isPlaying = 1;
  soundB.looping = looping;
  soundB.durationInVBlanks = ((VBLANK_FREQ * dataLength) / SOUND_FREQ);
  soundB.vBlankCount = 0;
}

// TODO 5.0: Complete this function
void pauseSounds() {
  soundA.isPlaying = 0;
  REG_TM0CNT = 0;
  soundB.isPlaying = 0;
  REG_TM1CNT = 0;
}

// TODO 5.1: Complete this function
void unpauseSounds() {
  soundA.isPlaying = 1;
  REG_TM0CNT = TIMER_ON;
  soundB.isPlaying = 1;
  REG_TM1CNT = TIMER_ON;
}

// TODO 5.2: Complete this function
void stopSounds() {
  soundA.isPlaying = 0;
  REG_TM0CNT = 0;
  soundB.isPlaying = 0;
  REG_TM1CNT = 0;
  dma[1].cnt = 0;
  dma[2].cnt = 0;
}
void interruptHandler();
void setupInterrupts() {
  REG_IME = 0;

  REG_IE = IRQ_VBLANK | IRQ_TIMER(2) | IRQ_TIMER(3);
  REG_DISPSTAT = DISPSTAT_VBLANK_IRQ;

  REG_INTERRUPT = &interruptHandler;

  REG_IME = 1;
}

void interruptHandler() {
  REG_IME = 0;

  if (REG_IF & IRQ_VBLANK) {
    // TODO 2.0: Handle soundA
    if (soundA.isPlaying) {
      soundA.vBlankCount++;
      if (soundA.vBlankCount > soundA.durationInVBlanks) {
        // case1:
        if (soundA.looping) {
          playSoundA(soundA.data, soundA.dataLength, soundA.looping);
        }
        // case2:
        else {
          soundA.isPlaying = 0;
          dma[1].cnt = 0;
          REG_TM0CNT = 0;
        }
      }
    }

    // TODO 2.1: Handle soundB
    if (soundB.isPlaying) {
      soundB.vBlankCount++;
      if (soundB.vBlankCount > soundB.durationInVBlanks) {
        if (soundB.looping) {
          playSoundB(soundB.data, soundB.dataLength, soundB.looping);
        } else {
          soundB.isPlaying = 0;
          dma[2].cnt = 0;
          REG_TM1CNT = 0;
        }
      }
    }
  }

  if (REG_IF & IRQ_TIMER(2)) {
    // second = (second + 1) % 60;
  }

  if (REG_IF & IRQ_TIMER(3)) {
    // minute = (minute + 1) % 100;
  }

  REG_IF = REG_IF;
  REG_IME = 1;
}