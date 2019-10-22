#define _GNU_SOURCE
#include <pthread.h>

#include <stdio.h>
#include <unistd.h>

#include "migrate.h"

void *thread(void *arg)
{
        printf("thread, node id %d\n", current_nid());

        migrate((current_nid() ? 0 : 1), 0, 0);

        printf("thread, node id %d\n", current_nid());

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
