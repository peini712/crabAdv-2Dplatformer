
//{{BLOCK(pausePage)

//======================================================================
//
//	pausePage, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 404 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 25856 + 2048 = 28416
//
//	Time-stamp: 2023-04-29, 15:37:03
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.6
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSEPAGE_H
#define GRIT_PAUSEPAGE_H

#define pausePageTilesLen 25856
extern const unsigned short pausePageTiles[12928];

#define pausePageMapLen 2048
extern const unsigned short pausePageMap[1024];

#define pausePagePalLen 512
extern const unsigned short pausePagePal[256];

#endif // GRIT_PAUSEPAGE_H

//}}BLOCK(pausePage)
