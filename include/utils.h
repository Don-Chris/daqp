#ifndef DAQP_UTILS_H
# define DAQP_UTILS_H
#include "daqp.h"
// Utils for transforming QP to LDP
int update_ldp(const int mask, Workspace *work);
int update_Rinv(Workspace *work);
void update_M(Workspace *work);
void update_v(c_float *f, Workspace *work);
void update_d(Workspace *work);
//
// Utils for profiling
#ifdef _WIN32
#include <windows.h>
typedef struct{ 
  LARGE_INTEGER start;
  LARGE_INTEGER stop;
}DAQPtimer;
#else // not _WIN32 
#include <time.h>
typedef struct{ 
  struct timespec start;
  struct timespec stop;
}DAQPtimer;
#endif // _WIN32


void tic(DAQPtimer *timer);
void toc(DAQPtimer *timer);
double get_time(DAQPtimer *timer);

#endif //ifndef DAQP_UTILS_H
