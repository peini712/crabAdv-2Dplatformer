# 1 "gameStateMachine.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "gameStateMachine.c"
# 1 "gameStateMachine.h" 1


extern int seed;

typedef enum { START, GAMEINFO, GAME0, PAUSE, WIN, LOSE } GameState_t;

void stateMachineInit();
void stateMachineLoop();
void setState(GameState_t next_state);
# 2 "gameStateMachine.c" 2
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

# 3 "gameStateMachine.c" 2
# 1 "assets/audio/instructionPage.h" 1



# 3 "assets/audio/instructionPage.h"
extern const unsigned int instructionPage_sampleRate;
extern const unsigned int instructionPage_length;
extern const signed char instructionPage_data[];
# 4 "gameStateMachine.c" 2
# 1 "assets/audio/loseSound.h" 1


extern const unsigned int loseSound_sampleRate;
extern const unsigned int loseSound_length;
extern const signed char loseSound_data[];
# 5 "gameStateMachine.c" 2
# 1 "assets/audio/menu_song.h" 1


extern const unsigned int menu_song_sampleRate;
extern const unsigned int menu_song_length;
extern const signed char menu_song_data[];
# 6 "gameStateMachine.c" 2
# 1 "assets/audio/win.h" 1


extern const unsigned int win_sampleRate;
extern const unsigned int win_length;
extern const signed char win_data[];
# 7 "gameStateMachine.c" 2
# 1 "assets/gameInfoPage.h" 1
# 22 "assets/gameInfoPage.h"
extern const unsigned short gameInfoPageTiles[6816];


extern const unsigned short gameInfoPageMap[1024];


extern const unsigned short gameInfoPagePal[256];
# 8 "gameStateMachine.c" 2
# 1 "assets/level0background.h" 1
# 22 "assets/level0background.h"
extern const unsigned short level0backgroundTiles[9408];


extern const unsigned short level0backgroundMap[4096];


extern const unsigned short level0backgroundPal[256];
# 9 "gameStateMachine.c" 2
# 1 "assets/level0collisionmap.h" 1
# 21 "assets/level0collisionmap.h"
extern const unsigned short level0collisionmapBitmap[131072];


extern const unsigned short level0collisionmapPal[256];
# 10 "gameStateMachine.c" 2
# 1 "assets/losePage.h" 1
# 22 "assets/losePage.h"
extern const unsigned short losePageTiles[7136];


extern const unsigned short losePageMap[1024];


extern const unsigned short losePagePal[256];
# 11 "gameStateMachine.c" 2
# 1 "assets/pausePage.h" 1
# 22 "assets/pausePage.h"
extern const unsigned short pausePageTiles[12928];


extern const unsigned short pausePageMap[1024];


extern const unsigned short pausePagePal[256];
# 12 "gameStateMachine.c" 2
# 1 "assets/spritesheet.h" 1
# 21 "assets/spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 13 "gameStateMachine.c" 2
# 1 "assets/welcome.h" 1
# 23 "assets/welcome.h"
extern const unsigned int welcomeTiles[7568];


extern const unsigned short welcomeMap[4096];


extern const unsigned short welcomePal[256];
# 14 "gameStateMachine.c" 2
# 1 "assets/winPage.h" 1
# 22 "assets/winPage.h"
extern const unsigned short winPageTiles[13440];


extern const unsigned short winPageMap[1024];


extern const unsigned short winPagePal[256];
# 15 "gameStateMachine.c" 2
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
# 16 "gameStateMachine.c" 2

# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct { u16 tileData[16]; } TILE;
typedef TILE charblock[512];



typedef struct {
 u16 tilemap[1024];
} screenblock;
# 18 "gameStateMachine.c" 2
# 1 "print.h" 1
# 35 "print.h"
uint8_t mgba_open(void);
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
void mgba_close(void);
# 19 "gameStateMachine.c" 2
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
# 20 "gameStateMachine.c" 2
# 28 "gameStateMachine.c"
unsigned short oldButtons;
unsigned short buttons;

int seed;
GameState_t previous_state;
GameState_t state;
char state_changed;


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
  state_changed = 1;
}

void start() {
  hideSprites();

  if (bgTimer == 60) {
    if (bgState == 0) {
      (*(volatile unsigned short*)0x4000008) = ((0) << 2) | ((22) << 8) | (0 << 14) | (1 << 7) | (3);
      bgState = 1;
    } else {
      (*(volatile unsigned short*)0x4000008) = ((0) << 2) | ((23) << 8) | (0 << 14) | (1 << 7) | (3);
      bgState = 0;
    }

    bgTimer = 0;
  }

  (*(volatile unsigned short *)0x04000014) = seed % 256;
  (*(volatile unsigned short *)0x04000018) = 256 - (seed % 256);
  if (seed % 60 == 0) {
    ((OBJ_ATTR*)(0x7000000))[0].attr0.bpp = (1);
    ((OBJ_ATTR*)(0x7000000))[0].attr0.shape = (0);
    ((OBJ_ATTR*)(0x7000000))[0].attr0.y = 72;
    ((OBJ_ATTR*)(0x7000000))[0].attr1.x = 112;

    ((OBJ_ATTR*)(0x7000000))[0].attr1.size = (1);
    ((OBJ_ATTR*)(0x7000000))[0].attr0.mode = (0);
    ((OBJ_ATTR*)(0x7000000))[0].attr2.tileIdY = 0;
    ((OBJ_ATTR*)(0x7000000))[0].attr2.tileIdX = 0;
    ((OBJ_ATTR*)(0x7000000))[0].attr2.tileIdY = ((seed / 60) % 4) * 2;
  }

  if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))) {
    setState(GAMEINFO);
  }
  if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
    setState(GAME0);
  }

  bgTimer++;
  seed++;
}

void gameInfo() {
  if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
    setState(START);
  }
}

void pause() {
  if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
    setState(GAME0);
    unpauseSounds();
  }
  if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))) {
    setState(START);
  }
}

void win() {
  if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
    setState(START);
  }
}

void lose() {
  win();
}

void goToStart() {
  (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << (8 + (1 % 4))) | (1 << (8 + (2 % 4))) | (1 << 12);

  (*(volatile unsigned short*)0x4000008) = ((0) << 2) | ((22) << 8) | (0 << 14) | (1 << 7) | (3);
  (*(volatile unsigned short*)0x400000A) = ((0) << 2) | ((20) << 8) | (0 << 14) | (1 << 7) | (2);
  (*(volatile unsigned short*)0x400000C) = ((0) << 2) | ((21) << 8) | (0 << 14) | (1 << 7) | (2);
  DMANow(3, welcomePal, ((unsigned short *)0x5000000), 256);
  DMANow(3, welcomeTiles, &((charblock *)0x06000000)[0], 30272 / 2);
  DMANow(3, welcomeMap, &((screenblock *)0x6000000)[20], 8192 / 2);
  DMANow(3, spritesheetTiles, &((charblock *)0x06000000)[4], 32768 / 2);
  DMANow(3, spritesheetPal, ((u16 *)0x5000200), 256);

  hideSprites();
  DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
  playSoundA(menu_song_data, menu_song_length, 1);
}

void goToGameInfo() {
  (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4)));
  (*(volatile unsigned short*)0x4000008) = ((0) << 2) | ((20) << 8) | (0 << 7) | (0 << 14);
  hideSprites();
  DMANow(3, gameInfoPagePal, ((unsigned short *)0x5000000), 256);
  DMANow(3, gameInfoPageTiles, &((charblock *)0x06000000)[0], 13632 / 2);
  DMANow(3, gameInfoPageMap, &((screenblock *)0x6000000)[20], 2048 / 2);
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
  (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4)));
  (*(volatile unsigned short*)0x4000008) = ((0) << 2) | ((20) << 8) | (1 << 7) | (0 << 14);

  DMANow(3, pausePagePal, ((unsigned short *)0x5000000), 256);
  DMANow(3, pausePageTiles, &((charblock *)0x06000000)[0], 25856 / 2);
  DMANow(3, pausePageMap, &((screenblock *)0x6000000)[20], 2048 / 2);

  (*(volatile unsigned short *)0x04000010) = 0;
  (*(volatile unsigned short *)0x04000012) = 0;

  hideSprites();
  DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}

void goToWin() {
  (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);
  (*(volatile unsigned short*)0x4000008) = ((0) << 2) | ((20) << 8) | (1 << 7) | (0 << 14);

  DMANow(3, winPagePal, ((unsigned short *)0x5000000), 256);
  DMANow(3, winPageTiles, &((charblock *)0x06000000)[0], 26880 / 2);
  DMANow(3, winPageMap, &((screenblock *)0x6000000)[20], 2048 / 2);

  (*(volatile unsigned short *)0x04000010) = 0;
  (*(volatile unsigned short *)0x04000012) = 0;

  clearSprites();
  DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
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
  (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4)));
  (*(volatile unsigned short*)0x4000008) = ((0) << 2) | ((20) << 8) | (1 << 7) | (0 << 14);

  DMANow(3, losePagePal, ((unsigned short *)0x5000000), 256);
  DMANow(3, losePageTiles, &((charblock *)0x06000000)[0], 14272 / 2);
  DMANow(3, losePageMap, &((screenblock *)0x6000000)[20], 2048 / 2);

  (*(volatile unsigned short *)0x04000010) = 0;
  (*(volatile unsigned short *)0x04000012) = 0;

  hideSprites();
  DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
  playSoundA(loseSound_data, loseSound_length, 0);
}

void stateMachineLoop() {
  oldButtons = buttons;
  buttons = (*(volatile unsigned short *)0x04000130);
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
    state_changed = 0;
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
