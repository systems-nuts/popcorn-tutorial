#define _GNU_SOURCE
#include <pthread.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include "migrate.h"
pthread_t ntid;
void printids(const char *s)
{
	pid_t pid;
	pthread_t tid;
	pid = getpid();
	tid = pthread_self();
	printf("%s pid: [%u] tid: [%u] (0x%x)\n", s,
	(unsigned int)pid, (unsigned int)tid, (unsigned int)tid);
} 
void *thr_fn(void *arg)
{
	int arch = *(int*) arg;
	printf("Current node: %d\n",arch);
	printids("thread on local node");
	migrate(!arch, NULL, NULL);
	sleep(1);
	printids("thread on remote node");
	sleep(1);
	printids("thread on remote node");
	migrate(arch, NULL, NULL);
	printids("thread on local node");
	return((void *)0);
}
int main(void)
{	
	int err;
	int arch = current_nid();
	err = pthread_create(&ntid, NULL, thr_fn, &arch);
	if (err != 0)
	printf("can't create thread: %s\n", strerror(err));
	sleep(1);
	printf("Process [%d] on node %d\n",getpid(),arch);
	sleep(1);
	printf("Process [%d] on node %d\n",getpid(),arch);
	if(pthread_join(ntid,NULL)==0) 
	exit(0);
	else
	return -1;
}
