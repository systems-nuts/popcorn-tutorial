#include "wtime.h"
#include <stdio.h>
#include <time.h>
#ifndef DOS
#include <sys/time.h>
#endif

void wtime(double *t)
{
  static int sec = -1;
  struct timeval tv;
  gettimeofday(&tv, (void *)0);
  if (sec < 0) sec = tv.tv_sec;
  *t = (tv.tv_sec - sec) + 0.000001*tv.tv_usec;
}

    
