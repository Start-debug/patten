#ifndef __dbg_h__
#define __dbg_h__

#ifdef NDEBUG
#define debug(M, ...)
#else
#define debug(M, ...) fprintf(stderr, "DEBUG %s:%d: "M"\n", __FILE__, __LINE__, ##__VA_ARGS__)
#endif

#define clean_errno() 
