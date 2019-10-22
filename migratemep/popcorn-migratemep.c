#define _GNU_SOURCE
#include <pthread.h>

#include <stdio.h>
#include <unistd.h>

#include "migrate.h"

#define N 30

void migrateme(int i)
{
	printf("[%d,%d] iteration %d, node id %d\n",
		getpid(), gettid(), i, current_nid());
}

void *thread(void *arg)
{
	int i;
	for (i=0; i<N; i++) {
	        migrateme(i);
		sleep(1);
	}

	return NULL;
}

int main(void)
{	
	pthread_t pthread;

	if (pthread_create(&pthread, NULL, thread, 0) != 0) {
		perror("pthread_create");
		return 1;
	}

	printf("main, node id %d\n", current_nid());

	if (pthread_join(pthread, NULL) != 0) {
		perror("pthread_join");
		return 1;
	}
	
	return 0;
}
