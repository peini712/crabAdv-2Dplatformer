
//{{BLOCK(winPage)

//======================================================================
//
//	winPage, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 420 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 26880 + 2048 = 29440
//
//	Time-stamp: 2023-04-29, 15:37:13
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.6
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WINPAGE_H
#define GRIT_WINPAGE_H

#define winPageTilesLen 26880
extern const unsigned short winPageTiles[13440];

#define winPageMapLen 2048
extern const unsigned short winPageMap[1024];

#define winPagePalLen 512
extern const unsigned short winPagePal[256];

#endif // GRIT_WINPAGE_H

//}}BLOCK(winPage)
