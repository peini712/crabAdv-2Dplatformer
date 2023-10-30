# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"

# 1 "game.h" 1


# 1 "sprites.h" 1



# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
typedef void (*ihp)(void);






extern volatile unsigned short *videoBuffer;
# 40 "gba.h"
void waitForVBlank();
# 57 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 73 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma;
# 105 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 5 "sprites.h" 2





typedef struct {
  u16 y : 8;
  u16 mode : 2;
  u16 gfx : 2;
  u16 mosaic : 1;
  u16 bpp : 1;
  u16 shape : 2;
} OBJ_ATTR0;

typedef struct {
  u16 x : 9;
  u16 reserved : 3;
  u16 flip : 2;
  u16 size : 2;
} OBJ_ATTR1;

typedef struct {
  u16 dummy : 1;
  u16 tileIdX : 4;
  u16 tileIdY : 5;
  u16 priority : 2;
  u16 palette : 4;
} OBJ_ATTR2;


typedef struct {
  OBJ_ATTR0 attr0;
  OBJ_ATTR1 attr1;
  OBJ_ATTR2 attr2;
  u16 fill;
} OBJ_ATTR;




extern OBJ_ATTR shadowOAM[128];
# 89 "sprites.h"
void hideSprites();


typedef enum {
    SPRITE_UI,
    SPRITE_PLAYER,
    SPRITE_CAR,
    SPRITE_TURTLE,
    SPRITE_SHELL,
    SPRITE_BIRD,
    SPRITE_EGG,
    SPRITE_BULLET,
    SPRITE_DROP,
    SPRITE_DIAMOND,
    SPRITE_OTHER
} SpriteType_t;

typedef struct _SPRITE {
  s16 x;
  s16 y;
  s16 enemyLeftBound;
  s16 enemyRightBound;
  s16 enemyWanderTimer;
  s16 enemySpecialTimer;
  SpriteType_t type : 8;
  u8 timeUntilNextFrame;
  s8 dx;
  s8 dy;
  s8 width;
  s8 height;
  s8 direction;
  s8 frame;
  s8 numOfFrames;
  s8 hp;
  u8 isAllocated;
  u8 baseTileX;
  u8 baseTileY;
  OBJ_ATTR *oam;
  void (*update_func)(struct _SPRITE *s);
} SPRITE;

extern SPRITE sprite_pool[64];

SPRITE *createUI(OBJ_ATTR *oam);
SPRITE *createSprite(SPRITE *prefab);
void recreateSprite(SPRITE *s, SPRITE *prefab);
void freeSprite(SPRITE *s);
void updateSprites();
void clearSprites();

void spriteDraw(SPRITE *s);
unsigned char spriteCollide(SPRITE *a, SPRITE *b);
unsigned char spriteInCamera(SPRITE *s);
# 4 "game.h" 2
# 13 "game.h"
extern int diamondCollected;
extern OBJ_ATTR pf_ui_diamond;




void game0();
void initGame();
void resumeGame();

void cleanGame();
# 3 "game.c" 2
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 1 3
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 2 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 1 3



# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 5 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3
# 6 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3




# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 209 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4

# 209 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 321 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 17 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3

# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 1 3
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 143 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 1 3
# 24 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_types.h" 1 3



# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 5 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_types.h" 2 3


typedef __int64_t _off_t;


typedef __int64_t _fpos_t;


typedef __uint32_t __ino_t;


typedef __uint32_t __dev_t;
# 25 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/lock.h" 1 3




# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 6 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/lock.h" 2 3

typedef int32_t _LOCK_T;

struct __lock_t {
 _LOCK_T lock;
 uint32_t thread_tag;
 uint32_t counter;
};

typedef struct __lock_t _LOCK_RECURSIVE_T;

extern void __libc_lock_init(_LOCK_T *lock);
extern void __libc_lock_init_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_close(_LOCK_T *lock);
extern void __libc_lock_close_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_acquire(_LOCK_T *lock);
extern void __libc_lock_acquire_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_release(_LOCK_T *lock);
extern void __libc_lock_release_recursive(_LOCK_RECURSIVE_T *lock);


extern int __libc_lock_try_acquire(_LOCK_T *lock);
extern int __libc_lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock);
# 26 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3


typedef long __blkcnt_t;



typedef long __blksize_t;



typedef __uint64_t __fsblkcnt_t;



typedef __uint32_t __fsfilcnt_t;
# 50 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef int __pid_t;







typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



typedef __uint32_t __id_t;
# 88 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef __uint32_t __mode_t;





__extension__ typedef long long _off64_t;





typedef _off_t __off_t;


typedef _off64_t __loff_t;


typedef long __key_t;
# 129 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef unsigned int __size_t;
# 145 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef signed int _ssize_t;
# 156 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef _ssize_t __ssize_t;


# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 350 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;






typedef unsigned long __clock_t;






typedef __int_least64_t __time_t;





typedef unsigned long __clockid_t;


typedef unsigned long __timer_t;


typedef __uint8_t __sa_family_t;



typedef __uint32_t __socklen_t;


typedef int __nl_item;
typedef unsigned short __nlink_t;
typedef long __suseconds_t;
typedef unsigned long __useconds_t;




typedef char * __va_list;
# 16 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3






typedef unsigned long __ULong;
# 38 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent;

struct __locale_t;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 93 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 117 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 181 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (*_read) (struct _reent *, void *,
        char *, int);
  int (*_write) (struct _reent *, void *,
         const char *,
         int);
  _fpos_t (*_seek) (struct _reent *, void *, _fpos_t, int);
  int (*_close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 287 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 319 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 610 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];


  int _unspecified_locale_info;
  struct __locale_t *_locale;

  int __sdidinit;

  void (*__cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;



  struct _atexit *_atexit;
  struct _atexit _atexit0;



  void (**(_sig_func))(int);




  struct _glue __sglue;

  __FILE __sf[3];

  void *deviceData;
};
# 817 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);





  struct _reent * __getreent (void);
# 19 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 1 3
# 47 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 48 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/stdlib.h" 1 3
# 21 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 33 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3


typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;


typedef struct
{
  long long int quot;
  long long int rem;
} lldiv_t;




typedef int (*__compar_fn_t) (const void *, const void *);







int __locale_mb_cur_max (void);



void abort (void) __attribute__ ((__noreturn__));
int abs (int);





int atexit (void (*__func)(void));
double atof (const char *__nptr);



int atoi (const char *__nptr);
int _atoi_r (struct _reent *, const char *__nptr);
long atol (const char *__nptr);
long _atol_r (struct _reent *, const char *__nptr);
void * bsearch (const void *__key,
         const void *__base,
         size_t __nmemb,
         size_t __size,
         __compar_fn_t _compar);
void *calloc(size_t, size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__))
      __attribute__((__alloc_size__(1, 2))) ;
div_t div (int __numer, int __denom);
void exit (int __status) __attribute__ ((__noreturn__));
void free (void *) ;
char * getenv (const char *__string);
char * _getenv_r (struct _reent *, const char *__string);
char * _findenv (const char *, int *);
char * _findenv_r (struct _reent *, const char *, int *);




long labs (long);
ldiv_t ldiv (long __numer, long __denom);
void *malloc(size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(1))) ;
int mblen (const char *, size_t);
int _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int mbtowc (wchar_t *restrict, const char *restrict, size_t);
int _mbtowc_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
int wctomb (char *, wchar_t);
int _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t mbstowcs (wchar_t *restrict, const char *restrict, size_t);
size_t _mbstowcs_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
size_t wcstombs (char *restrict, const wchar_t *restrict, size_t);
size_t _wcstombs_r (struct _reent *, char *restrict, const wchar_t *restrict, size_t, _mbstate_t *);
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * _mkdtemp_r (struct _reent *, char *);
int _mkostemp_r (struct _reent *, char *, int);
int _mkostemps_r (struct _reent *, char *, int, int);
int _mkstemp_r (struct _reent *, char *);
int _mkstemps_r (struct _reent *, char *, int);
char * _mktemp_r (struct _reent *, char *) __attribute__ ((__deprecated__("the use of `mktemp' is dangerous; use `mkstemp' instead")));
void qsort (void *__base, size_t __nmemb, size_t __size, __compar_fn_t _compar);
int rand (void);
void *realloc(void *, size_t) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(2))) ;
# 156 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
void srand (unsigned __seed);
double strtod (const char *restrict __n, char **restrict __end_PTR);
double _strtod_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR);

float strtof (const char *restrict __n, char **restrict __end_PTR);







long strtol (const char *restrict __n, char **restrict __end_PTR, int __base);
long _strtol_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long strtoul (const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long _strtoul_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
# 188 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
int system (const char *__string);
# 199 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
void _Exit (int __status) __attribute__ ((__noreturn__));




int _putenv_r (struct _reent *, char *__string);
void * _reallocf_r (struct _reent *, void *, size_t);



int _setenv_r (struct _reent *, const char *__string, const char *__value, int __overwrite);
# 221 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * __itoa (int, char *, int);
char * __utoa (unsigned, char *, int);
# 260 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
long long atoll (const char *__nptr);

long long _atoll_r (struct _reent *, const char *__nptr);

long long llabs (long long);
lldiv_t lldiv (long long __numer, long long __denom);
long long strtoll (const char *restrict __n, char **restrict __end_PTR, int __base);

long long _strtoll_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long strtoull (const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long _strtoull_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);
# 281 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
int _unsetenv_r (struct _reent *, const char *__string);







char * _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);

void * _malloc_r (struct _reent *, size_t) ;
void * _calloc_r (struct _reent *, size_t, size_t) ;
void _free_r (struct _reent *, void *) ;
void * _realloc_r (struct _reent *, void *, size_t) ;
void _mstats_r (struct _reent *, char *);

int _system_r (struct _reent *, const char *);

void __eprintf (const char *, const char *, unsigned int, const char *);
# 319 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
extern long double _strtold_r (struct _reent *, const char *restrict, char **restrict);

extern long double strtold (const char *restrict, char **restrict);
# 336 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3

# 4 "game.c" 2
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/string.h" 1 3
# 17 "/opt/devkitpro/devkitARM/arm-none-eabi/include/string.h" 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 18 "/opt/devkitpro/devkitARM/arm-none-eabi/include/string.h" 2 3
# 27 "/opt/devkitpro/devkitARM/arm-none-eabi/include/string.h" 3


void * memchr (const void *, int, size_t);
int memcmp (const void *, const void *, size_t);
void * memcpy (void *restrict, const void *restrict, size_t);
void * memmove (void *, const void *, size_t);
void * memset (void *, int, size_t);
char *strcat (char *restrict, const char *restrict);
char *strchr (const char *, int);
int strcmp (const char *, const char *);
int strcoll (const char *, const char *);
char *strcpy (char *restrict, const char *restrict);
size_t strcspn (const char *, const char *);
char *strerror (int);
size_t strlen (const char *);
char *strncat (char *restrict, const char *restrict, size_t);
int strncmp (const char *, const char *, size_t);
char *strncpy (char *restrict, const char *restrict, size_t);
char *strpbrk (const char *, const char *);
char *strrchr (const char *, int);
size_t strspn (const char *, const char *);
char *strstr (const char *, const char *);

char *strtok (char *restrict, const char *restrict);

size_t strxfrm (char *restrict, const char *restrict, size_t);
# 86 "/opt/devkitpro/devkitARM/arm-none-eabi/include/string.h" 3
char *_strdup_r (struct _reent *, const char *);



char *_strndup_r (struct _reent *, const char *, size_t);
# 112 "/opt/devkitpro/devkitARM/arm-none-eabi/include/string.h" 3
char * _strerror_r (struct _reent *, int, int, int *);
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/string.h" 3
char *strsignal (int __signo);
# 175 "/opt/devkitpro/devkitARM/arm-none-eabi/include/string.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/string.h" 1 3
# 176 "/opt/devkitpro/devkitARM/arm-none-eabi/include/string.h" 2 3


# 5 "game.c" 2
# 1 "assets/audio/crabAttackSound.h" 1



# 3 "assets/audio/crabAttackSound.h"
extern const unsigned int crabAttackSound_sampleRate;
extern const unsigned int crabAttackSound_length;
extern const signed char crabAttackSound_data[];
# 6 "game.c" 2
# 1 "assets/audio/level0_bgm.h" 1


extern const unsigned int level0_bgm_sampleRate;
extern const unsigned int level0_bgm_length;
extern const signed char level0_bgm_data[];
# 7 "game.c" 2
# 1 "assets/audio/level1_bgm.h" 1


extern const unsigned int level1_bgm_sampleRate;
extern const unsigned int level1_bgm_length;
extern const signed char level1_bgm_data[];
# 8 "game.c" 2
# 1 "assets/gameInfoPage.h" 1
# 22 "assets/gameInfoPage.h"
extern const unsigned short gameInfoPageTiles[6816];


extern const unsigned short gameInfoPageMap[1024];


extern const unsigned short gameInfoPagePal[256];
# 9 "game.c" 2
# 1 "assets/level0Intro.h" 1
# 22 "assets/level0Intro.h"
extern const unsigned short level0IntroTiles[14784];


extern const unsigned short level0IntroMap[1024];


extern const unsigned short level0IntroPal[256];
# 10 "game.c" 2
# 1 "assets/level0_frontlayer.h" 1
# 22 "assets/level0_frontlayer.h"
extern const unsigned short level0_frontlayerTiles[1216];


extern const unsigned short level0_frontlayerMap[1024];


extern const unsigned short level0_frontlayerPal[256];
# 11 "game.c" 2
# 1 "assets/level0background.h" 1
# 22 "assets/level0background.h"
extern const unsigned short level0backgroundTiles[9408];


extern const unsigned short level0backgroundMap[4096];


extern const unsigned short level0backgroundPal[256];
# 12 "game.c" 2
# 1 "assets/level0collisionmap.h" 1
# 21 "assets/level0collisionmap.h"
extern const unsigned short level0collisionmapBitmap[131072];


extern const unsigned short level0collisionmapPal[256];
# 13 "game.c" 2
# 1 "assets/level1Intro.h" 1
# 22 "assets/level1Intro.h"
extern const unsigned short level1IntroTiles[17664];


extern const unsigned short level1IntroMap[1024];


extern const unsigned short level1IntroPal[256];
# 14 "game.c" 2
# 1 "assets/level1background.h" 1
# 22 "assets/level1background.h"
extern const unsigned short level1backgroundTiles[9792];


extern const unsigned short level1backgroundMap[8192];


extern const unsigned short level1backgroundPal[256];
# 15 "game.c" 2
# 1 "assets/level1collisionmap.h" 1
# 21 "assets/level1collisionmap.h"
extern const unsigned short level1collisionmapBitmap[262144];


extern const unsigned short level1collisionmapPal[256];
# 16 "game.c" 2
# 1 "assets/losePage.h" 1
# 22 "assets/losePage.h"
extern const unsigned short losePageTiles[7136];


extern const unsigned short losePageMap[1024];


extern const unsigned short losePagePal[256];
# 17 "game.c" 2
# 1 "assets/pausePage.h" 1
# 22 "assets/pausePage.h"
extern const unsigned short pausePageTiles[12928];


extern const unsigned short pausePageMap[1024];


extern const unsigned short pausePagePal[256];
# 18 "game.c" 2
# 1 "assets/spritesheet.h" 1
# 21 "assets/spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 19 "game.c" 2
# 1 "assets/winPage.h" 1
# 22 "assets/winPage.h"
extern const unsigned short winPageTiles[13440];


extern const unsigned short winPageMap[1024];


extern const unsigned short winPagePal[256];
# 20 "game.c" 2
# 1 "camera.h" 1




extern unsigned short hOff;
extern unsigned short vOff;
# 21 "game.c" 2
# 1 "gameStateMachine.h" 1


extern int seed;

typedef enum { START, GAMEINFO, GAME0, PAUSE, WIN, LOSE } GameState_t;

void stateMachineInit();
void stateMachineLoop();
void setState(GameState_t next_state);
# 22 "game.c" 2

# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct { u16 tileData[16]; } TILE;
typedef TILE charblock[512];



typedef struct {
 u16 tilemap[1024];
} screenblock;
# 24 "game.c" 2
# 1 "print.h" 1
# 35 "print.h"
uint8_t mgba_open(void);
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
void mgba_close(void);
# 25 "game.c" 2
# 1 "sound.h" 1



void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void pauseSounds();
void unpauseSounds();
void stopSounds();
# 49 "sound.h"
typedef struct{
    const signed char* data;
    int dataLength;
    int isPlaying;
    int looping;
    int durationInVBlanks;
    int vBlankCount;
} SOUND;

extern SOUND soundA;
extern SOUND soundB;
# 127 "sound.h"
enum {
  REST = 0,
  NOTE_C2 =44,
  NOTE_CS2 =157,
  NOTE_D2 =263,
  NOTE_DS2 =363,
  NOTE_E2 =457,
  NOTE_F2 =547,
  NOTE_FS2 =631,
  NOTE_G2 =711,
  NOTE_GS2 =786,
  NOTE_A2 =856,
  NOTE_AS2 =923,
  NOTE_B2 =986,
  NOTE_C3 =1046,
  NOTE_CS3 =1102,
  NOTE_D3 =1155,
  NOTE_DS3 =1205,
  NOTE_E3 =1253,
  NOTE_F3 =1297,
  NOTE_FS3 =1339,
  NOTE_G3 =1379,
  NOTE_GS3 =1417,
  NOTE_A3 =1452,
  NOTE_AS3 =1486,
  NOTE_B3 =1517,
  NOTE_C4 =1547,
  NOTE_CS4 =1575,
  NOTE_D4 =1602,
  NOTE_DS4 =1627,
  NOTE_E4 =1650,
  NOTE_F4 =1673,
  NOTE_FS4 =1694,
  NOTE_G4 =1714,
  NOTE_GS4 =1732,
  NOTE_A4 =1750,
  NOTE_AS4 =1767,
  NOTE_B4 =1783,
  NOTE_C5 =1798,
  NOTE_CS5 =1812,
  NOTE_D5 =1825,
  NOTE_DS5 =1837,
  NOTE_E5 =1849,
  NOTE_F5 =1860,
  NOTE_FS5 =1871,
  NOTE_G5 =1881,
  NOTE_GS5 =1890,
  NOTE_A5 =1899,
  NOTE_AS5 =1907,
  NOTE_B5 =1915,
  NOTE_C6 =1923,
  NOTE_CS6 =1930,
  NOTE_D6 =1936,
  NOTE_DS6 =1943,
  NOTE_E6 =1949,
  NOTE_F6 =1954,
  NOTE_FS6 =1959,
  NOTE_G6 =1964,
  NOTE_GS6 =1969,
  NOTE_A6 =1974,
  NOTE_AS6 =1978,
  NOTE_B6 =1982,
  NOTE_C7 =1985,
  NOTE_CS7 =1989,
  NOTE_D7 =1992,
  NOTE_DS7 =1995,
  NOTE_E7 =1998,
  NOTE_F7 =2001,
  NOTE_FS7 =2004,
  NOTE_G7 =2006,
  NOTE_GS7 =2009,
  NOTE_A7 =2011,
  NOTE_AS7 =2013,
  NOTE_B7 =2015,
  NOTE_C8 =2017
};
# 26 "game.c" 2

# 1 "terrain.h" 1

extern int mapHeight;
extern int mapWidth;
extern unsigned char * mapCollisionBitmap;

u8 isNotTerrain(int x, int y);

u8 isTerrain(int x, int y);

unsigned char collideTerrain(struct _SPRITE *sprite, int mapWidth, int mapHeight);

int spriteTryMove(struct _SPRITE *s, int dx, int dy);
# 28 "game.c" 2


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


SPRITE *player;
int playerGravity;
int jumpCounter;


int dropCollected;
int diamondCollected;



int level;


SPRITE *ui_hearts[5];
SPRITE *ui_drops[8];

int frameElapsed;
int invincibleCounter;

u8 cheatEnabled;
u8 showingManual;


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
  if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
    ;
    setState(PAUSE);
  }
  if ((!(~(oldButtons) & ((1<<1))) && (~(buttons) & ((1<<1))))) {
    cheatEnabled = !cheatEnabled;
  }
  updateSprites();
  checkCollideDamage(player);
  draw();
  if (level == 0) {
    if (player->x > 1024 - player->width - 16) {
      level = 1;
      showingManual = 1;
      initScene1();
      return;
    }
    if (frameElapsed % 180 == 0 && player->x < 1024 - 128) {
      createRandomCar();
    }
  } else {

    if (player->x > 1024 - player->width - 32 && player->y > 512 - 128) {
      ;
      setState(WIN);
    }
  }
}

static void initUI() {
  ;

  for (int i = 0; i < 5; i++) {
    ui_hearts[i] = createUI(&pf_ui_heart);

    ui_hearts[i]->oam->attr1.x = 240 - 4 - (i + 1) * (8 + 2);

    ui_hearts[i]->oam->attr0.y = 4;
  }
  for (int i = 0; i < 8; i++) {
    ui_drops[i] = createUI(&pf_ui_drop);

    ui_drops[i]->oam->attr1.x = 4 + i * (8 + 2);

    ui_drops[i]->oam->attr0.y = 4;
  }
}

static void updateUI() {
  ;
  for (int i = 0; i < player->hp; i++) {
    ui_hearts[i]->oam->attr0.mode = (0);
  }
  for (int i = player->hp; i < 5; i++) {
    ui_hearts[i]->oam->attr0.mode = (2);
  }

  if (dropCollected > 8) {
    dropCollected = 8;
  }
  for (int i = 0; i < dropCollected; i++) {
    ui_drops[i]->oam->attr0.mode = (0);
  }
  for (int i = dropCollected; i < 8; i++) {
    ui_drops[i]->oam->attr0.mode = (2);
  }
}

static void initScene0() {
  ;
  level = 0;
  mapWidth = 1024;
  mapHeight = 256;
  mapCollisionBitmap = (u8 *)level0collisionmapBitmap;
  resumeGame();

  clearSprites();
  initUI();


  player = createCreature(&pf_player, 16, 120 - pf_player.sprite.height);
  int drop_y = 120 - pf_blueWater.sprite.height;
  createCreature(&pf_blueWater, rand() % (1024 - 64), drop_y);
  createCreature(&pf_blueWater, rand() % (1024 - 64), drop_y);

  createCreature(&pf_blueWater, 1024 / 5 * 4 + rand() % (1024 / 5 - 64), drop_y);
  updateUI();
  playSoundA(level0_bgm_data, level0_bgm_length, 1);
}

static void initScene1() {
  ;
  level = 1;
  mapWidth = 1024;
  mapHeight = 512;
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


  showingManual = 1;
  level = 0;
  invincibleCounter = 0;
  diamondCollected = 0;
  cheatEnabled = 0;
  hideSprites();
  DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
  (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);

  mgba_open();
  initPrefabs();

  DMANow(3, spritesheetTiles, &((charblock *)0x06000000)[4], 32768 / 2);
  DMANow(3, spritesheetPal, ((u16 *)0x5000200), 256);

  initScene0();


  hOff = 10;
  vOff = 30;
  dropCollected = 0;
  frameElapsed = 0;
  playerGravity = 2;
  updateUI();
}

void resumeGame() {
  (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);
  DMANow(3, spritesheetTiles, &((charblock *)0x06000000)[4], 32768 / 2);
  DMANow(3, spritesheetPal, ((u16 *)0x5000200), 256);

  memset(&((charblock *)0x06000000)[3][510], 0xf0, sizeof(TILE));
  if (level == 0) {
    (*(volatile unsigned short *)0x4000000) = (*(volatile unsigned short *)0x4000000) | (1 << (8 + (1 % 4)));
    DMANow(3, level0backgroundPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, level0backgroundTiles, &((charblock *)0x06000000)[0], 18816 / 2);
    DMANow(3, level0backgroundMap, &((screenblock *)0x6000000)[11], 8192 / 2);


    for (int i = 0; i < 2432; i++) {
      char *tile = &((char *)(&((charblock *)0x06000000)[3]))[i];
      char *src = &((char *)(level0_frontlayerTiles))[i];
      if (*src != 0) {
        *tile = *src + 128;
      } else {
        *tile = *src;
      }
    }
    for (int i = 0; i < 128; i++) {
      ((unsigned short *)0x5000000)[128 + i] = level0_frontlayerPal[i];
    }
    DMANow(3, level0_frontlayerMap, &((screenblock *)0x6000000)[11 + 10], 2048 / 2);
  } else {
    (*(volatile unsigned short*)0x4000008) = ((0) << 2) | ((11) << 8) | (1 << 7) | (3 << 14);

    DMANow(3, level1backgroundPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, level1backgroundTiles, &((charblock *)0x06000000)[0], 19584 / 2);

    const int offset_per_sb = sizeof(screenblock) / sizeof(u16);

    DMANow(3, level1backgroundMap + offset_per_sb * 0, &((screenblock *)0x6000000)[11 + 0], sizeof(screenblock) / 2);
    DMANow(3, level1backgroundMap + offset_per_sb * 1, &((screenblock *)0x6000000)[11 + 1], sizeof(screenblock) / 2);
    DMANow(3, level1backgroundMap + offset_per_sb * 4, &((screenblock *)0x6000000)[11 + 2], sizeof(screenblock) / 2);
    DMANow(3, level1backgroundMap + offset_per_sb * 5, &((screenblock *)0x6000000)[11 + 3], sizeof(screenblock) / 2);


    DMANow(3, level1backgroundMap + offset_per_sb * 1, &((screenblock *)0x6000000)[11 + 4], sizeof(screenblock) / 2);
    DMANow(3, level1backgroundMap + offset_per_sb * 2, &((screenblock *)0x6000000)[11 + 5], sizeof(screenblock) / 2);
    DMANow(3, level1backgroundMap + offset_per_sb * 5, &((screenblock *)0x6000000)[11 + 6], sizeof(screenblock) / 2);
    DMANow(3, level1backgroundMap + offset_per_sb * 6, &((screenblock *)0x6000000)[11 + 7], sizeof(screenblock) / 2);


    DMANow(3, level1backgroundMap + offset_per_sb * 2, &((screenblock *)0x6000000)[11 + 8], sizeof(screenblock) / 2);
    DMANow(3, level1backgroundMap + offset_per_sb * 3, &((screenblock *)0x6000000)[11 + 9], sizeof(screenblock) / 2);
    DMANow(3, level1backgroundMap + offset_per_sb * 6, &((screenblock *)0x6000000)[11 + 10], sizeof(screenblock) / 2);
    DMANow(3, level1backgroundMap + offset_per_sb * 7, &((screenblock *)0x6000000)[11 + 11], sizeof(screenblock) / 2);
  }
  updateUI();
  unpauseSounds();
}

void cleanGame() {
  clearSprites();
  (*(volatile unsigned short *)0x4000000) = ((0) & 7);
  (*(volatile unsigned short *)0x04000012) = 0;
  (*(volatile unsigned short *)0x04000010) = 0;
  (*(volatile unsigned short *)0x04000016) = 0;
  (*(volatile unsigned short *)0x04000014) = 0;
}

static SPRITE *createRandomCar() {
  PREFAB *pf = rand() % 5 == 4 ? &pf_bigCar : &pf_smallCar;
  SPRITE *car = createCreature(pf, 1024 - pf->sprite.width, 120 - pf->sprite.height);
  if (pf == &pf_smallCar) {
    car->baseTileX += rand() % 4 * 2;
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
    ;
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

      ;
      setState(LOSE);
    } else if (unit->type == SPRITE_TURTLE) {

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
  for (int i = 0; i < 64; i++) {
    SPRITE *enemy = &sprite_pool[i];
    if (!enemy->isAllocated) {
      continue;
    }
    if (enemy->type == SPRITE_TURTLE || enemy->type == SPRITE_CAR || enemy->type == SPRITE_BIRD ||
        enemy->type == SPRITE_EGG) {
      if (spriteCollide(player, enemy)) {
        ;
        if (damage(player)) {
          ;

        }
      }
    }
  }
}

inline void showManual() {
  hideSprites();
  (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4)));
  (*(volatile unsigned short*)0x4000008) = ((0) << 2) | ((20) << 8) | (1 << 7) | (0 << 14);
  (*(volatile unsigned short *)0x04000010) = 0;
  (*(volatile unsigned short *)0x04000012) = 0;
  if (level == 0) {
    DMANow(3, level0IntroPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, level0IntroTiles, &((charblock *)0x06000000)[0], 29568 / 2);
    DMANow(3, level0IntroMap, &((screenblock *)0x6000000)[20], 2048 / 2);
  } else {
    DMANow(3, level1IntroPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, level1IntroTiles, &((charblock *)0x06000000)[0], 35328 / 2);
    DMANow(3, level1IntroMap, &((screenblock *)0x6000000)[20], 2048 / 2);
  }

  if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
    showingManual = 0;
    resumeGame();
  }
}

static void updatePlayer(SPRITE *player) {

  u8 isMoving = 0;


  int leftX = player->x;
  int rightX = player->x + player->width - 1;

  int bottomY = player->y + player->height - 1;

  if ((!(~(oldButtons) & ((1<<6))) && (~(buttons) & ((1<<6)))) && (!isNotTerrain(leftX, bottomY + 1) || !isNotTerrain(rightX, bottomY + 1))) {
    jumpCounter = 10;
  }

  if ((~(buttons) & ((1<<6)))) {
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


    if (jumpCounter >= 8) {
      jumpSpeed *= 5;
    } else {
      jumpSpeed = (float)jumpSpeed * (1.f + ((float)jumpCounter / 2));
    }
    if (!spriteTryMove(player, 0, -jumpSpeed)) {
      jumpCounter = 0;
      ;
    }
  } else {
    spriteTryMove(player, 0, playerGravity);
  }

  if ((~(buttons) & ((1<<5)))) {
    isMoving = 1;
    player->direction = 1;
    spriteTryMove(player, -player->dx, 0);
  }
  if ((~(buttons) & ((1<<4)))) {
    isMoving = 1;
    player->direction = 0;
    spriteTryMove(player, player->dx, 0);
  }

  player->baseTileY = isJumping ? 8 : 0;
  if (!isMoving && !isJumping) {
    player->frame = 0;
    player->timeUntilNextFrame = 10;
  }


  if (player->x < 240 / 2) {
    hOff = 0;
  } else if (player->x > mapWidth - 240 / 2) {
    hOff = mapWidth - 240;
  } else {
    hOff = player->x - 240 / 2;
  }

  if (player->y < 160 / 2) {
    vOff = 0;
  } else if (player->y > mapHeight - 160 / 2) {
    vOff = mapHeight - 160;
  } else {
    vOff = player->y - 160 / 2;
  }


  if (level == 1 && (!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0))))) {
    if (dropCollected > 0) {
      ;

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

    *(volatile u16*)0x04000068 = (((5) & 15) << 12) | (((7) & 7) << 8);
    *(volatile u16*)0x0400006C = NOTE_G6 | (1<<15);
    int bonus = 0;
    if (item->type == SPRITE_DROP) {
      bonus = 1;
    } else if (item->type == SPRITE_SHELL) {
      bonus = 3;
    } else if (item->type == SPRITE_DIAMOND) {
      diamondCollected++;

      mgba_printf("diamond collected: %d", diamondCollected);
    }
    dropCollected += bonus;
    updateUI();
  }
}

static void updateEgg(SPRITE *egg) {

  egg->y += egg->dy;
  if (!isNotTerrain(egg->x, egg->y + egg->height)) {
    freeSprite(egg);
    return;
  }
}

static void updateEnemy(SPRITE *enemy) {


  if (enemy->type == SPRITE_TURTLE) {
    while (isNotTerrain(enemy->x + enemy->width / 2, enemy->y + enemy->height)) {

      enemy->y++;
    }
  }

  enemy->enemyWanderTimer--;

  char hitEdge = enemy->x <= 0 || enemy->x <= enemy->enemyLeftBound || enemy->x + enemy->width >= mapWidth ||
                 enemy->x >= enemy->enemyRightBound;

  if (collideTerrain(enemy, 1024, 512)) {
    hitEdge = 1;
  }


  if (enemy->type == SPRITE_TURTLE) {
    if (enemy->direction == 0) {

      hitEdge = hitEdge || isNotTerrain(enemy->x + enemy->width + 1, enemy->y + enemy->height + 1);
    } else {

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

  if (bullet->x < 0 || bullet->x > 1024) {
    freeSprite(bullet);
    return;
  }


  for (int i = 0; i < 64; i++) {
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
  int bar_width = finish_percent * 240;

  TILE *bar_full_tile = &((charblock *)0x06000000)[3][250 * 2];
  TILE *bar_half_tile = &((charblock *)0x06000000)[3][251 * 2];
  memset(bar_full_tile->tileData, 0xf0, 2 * sizeof(TILE));
  memset(bar_half_tile->tileData, 0x00, 2 * sizeof(TILE));
  for (int i = 0; i < bar_width % 8; i++) {
    for (int j = 0; j < 8; j++) {
      ((char *)bar_half_tile->tileData)[i + j * 8] = 0xf0;
    }
  }

  ((unsigned short *)0x5000000)[0xf0] = (((255) & 31) | ((128) & 31) << 5 | ((0) & 31) << 10);
  (*(volatile unsigned short *)0x4000000) = (*(volatile unsigned short *)0x4000000) | (1 << (8 + (2 % 4)));
  (*(volatile unsigned short*)0x400000C) = ((3) << 2) | ((11 - 1) << 8) | (1 << 7) | (0 << 14) | 1;
  (*(volatile unsigned short *)0x0400001A) = 0;
  (*(volatile unsigned short *)0x04000018) = 0;
  screenblock *bar_screenblock = &((screenblock *)0x6000000)[11 - 1];
  memset(bar_screenblock, 0x00, sizeof(screenblock));
  for (int i = 0; i < bar_width / 8; i++) {
    bar_screenblock->tilemap[32 * 19 + i] = 250;
  }
  bar_screenblock->tilemap[32 * 19 + bar_width / 8] = 251;
}

static void draw() {
  DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

  int bg_page = hOff / 256;
  bg_page = bg_page > 2 ? 2 : bg_page;

  if (level == 0) {
    (*(volatile unsigned short*)0x400000A) = ((0) << 2) | ((11 + bg_page) << 8) | (1 << 7) | (1 << 14) | 3;
    (*(volatile unsigned short*)0x4000008) = ((3) << 2) | ((11 + 10) << 8) | (1 << 7) | (0 << 14) | 2;
    (*(volatile unsigned short *)0x04000012) = vOff + 72;
    (*(volatile unsigned short *)0x04000010) = 256 - (hOff % 256);
    (*(volatile unsigned short *)0x04000014) = hOff - bg_page * 256;
    (*(volatile unsigned short *)0x04000016) = vOff;
    (*(volatile unsigned short *)0x4000000) = (*(volatile unsigned short *)0x4000000) | (1 << (8 + (1 % 4))) | (1 << (8 + (0 % 4)));
  } else {
    (*(volatile unsigned short*)0x4000008) = ((0) << 2) | ((11 + bg_page * 4) << 8) | (1 << 7) | (3 << 14) | 3;
    (*(volatile unsigned short *)0x4000000) = (*(volatile unsigned short *)0x4000000) & (~(1 << (8 + (1 % 4))));
    (*(volatile unsigned short *)0x04000010) = hOff - bg_page * 256;
    (*(volatile unsigned short *)0x04000012) = vOff;
  }
  if (cheatEnabled) {
    drawBar();
  } else {
    (*(volatile unsigned short *)0x4000000) = (*(volatile unsigned short *)0x4000000) & (~(1 << (8 + (2 % 4))));
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
  prefab->oam.attr0.bpp = (1);
  if (width == 16 && height == 16) {
    prefab->oam.attr0.shape = (0);
    prefab->oam.attr1.size = (1);
  } else if (width == 32 && height == 16) {
    prefab->oam.attr0.shape = (1);
    prefab->oam.attr1.size = (2);
  } else if (width == 8 && height == 8) {
    prefab->oam.attr0.shape = (0);
    prefab->oam.attr1.size = (0);
  }
  prefab->oam.attr0.mode = (0);
  prefab->oam.attr2.tileIdY = baseTileY;
  prefab->oam.attr2.tileIdX = baseTileX;
}

static void initPrefabs() {

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

  pf_ui_heart.attr0.mode = (0);
  pf_ui_heart.attr0.bpp = (1);
  pf_ui_heart.attr0.shape = (0);
  pf_ui_heart.attr0.y = 4;
  pf_ui_heart.attr1.size = (0);
  pf_ui_heart.attr1.x = 0;
  pf_ui_heart.attr2.palette = (((0) & 0xF) << 12);
  pf_ui_heart.attr2.tileIdX = 5;
  pf_ui_heart.attr2.tileIdY = 10;

  pf_ui_drop = pf_blueWater.oam;
  pf_ui_drop.attr0.y = 4;

  pf_ui_diamond = pf_diamond.oam;
}
