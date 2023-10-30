
//{{BLOCK(gameInfoPage)

//======================================================================
//
//	gameInfoPage, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 426 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 13632 + 2048 = 16192
//
//	Time-stamp: 2023-04-25, 16:00:58
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEINFOPAGE_H
#define GRIT_GAMEINFOPAGE_H

#define gameInfoPageTilesLen 13632
extern const unsigned short gameInfoPageTiles[6816];

#define gameInfoPageMapLen 2048
extern const unsigned short gameInfoPageMap[1024];

#define gameInfoPagePalLen 512
extern const unsigned short gameInfoPagePal[256];

#endif // GRIT_GAMEINFOPAGE_H

//}}BLOCK(gameInfoPage)
