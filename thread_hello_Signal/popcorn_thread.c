#define _GNU_SOURCE
#include <pthread.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include "migrate.h"
pthread_t ntid;
void printids()
{
	printf("Thread Id: [%d] \n", gettid());
} 
void *thr_fn(void *arg)
{
	int i = 0;
	while(i<=50)
	{
		printf("Node[%d]",current_nid());
		printids();
		sleep(1);
		i++;
	}
	return((void *)0);
}
int main(void)
{	
	int err;
	int arch = current_nid();
	err = pthread_create(&ntid, NULL, thr_fn, &arch);
	if (err != 0)
	printf("can't create thread: %s\n", strerror(err));
	int i = 0;
        while(i<=4)
        {
		printf("<<<<<<<<<<<Node[%d] <<<host>>> Process[%d]>>>>>>>>>>>>>>\n",arch,getpid());
                sleep(10);
		i++;
        } 
 	if(pthread_join(ntid,NULL)==0) 
	exit(0);
	else
	return -1;
}
