#include "wtime.h"
#include <stdlib.h>
#include <stdio.h>
/*  Prototype  */
void wtime( double * );


/*****************************************************************/
/******         E  L  A  P  S  E  D  _  T  I  M  E          ******/
/*****************************************************************/
static double elapsed_time( void )
{
    double t;

    wtime( &t );
    printf("print elapsed_time\n");
    printf("t_int:%f\n",t);
printf("t_float:%f\n",t);
    return( t );
}


static double start[64], elapsed[64];

/*****************************************************************/
/******            T  I  M  E  R  _  C  L  E  A  R          ******/
/*****************************************************************/
void timer_clear( int n )
{
    elapsed[n] = 0.0;
}


/*****************************************************************/
/******            T  I  M  E  R  _  S  T  A  R  T          ******/
/*****************************************************************/
void timer_start( int n )
{
    start[n] = elapsed_time();
}


/*****************************************************************/
/******            T  I  M  E  R  _  S  T  O  P             ******/
/*****************************************************************/
void timer_stop( int n )
{
    double t, now;

    now = elapsed_time();
    printf("now: %f\n",now);
    t = now - start[n];
    printf("t: %f\n",t);
    elapsed[n] += t;
    printf("time_stop is: %f\n", elapsed[n]);
}


/*****************************************************************/
/******            T  I  M  E  R  _  R  E  A  D             ******/
/*****************************************************************/
double timer_read( int n )
{
    printf("time_read is: %f\n", elapsed[n]);
    return( elapsed[n] );
}

