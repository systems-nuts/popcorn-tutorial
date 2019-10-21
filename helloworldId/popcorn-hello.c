#include <stdio.h>
#include <unistd.h>

#include "migrate.h"

#define N 4

int main(int argc, char *argv[])
{
	int i;

	printf("[%d,%d] hello, world (node %d)\n", 
		getpid(), gettid(), current_nid());

	for (i=0; i<N; i++) {
		migrate((current_nid() ? 0 : 1), 0, 0);
		printf("[%d,%d] hello, world (node %d)\n",
			getpid(), gettid(), current_nid());	
	}

	return 0;
}
