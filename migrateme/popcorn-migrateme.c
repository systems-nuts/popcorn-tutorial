#include <stdio.h>
#include <unistd.h>

#include "migrate.h"

#define N 30

void migrateme(int i)
{
	printf("[%d,%d] iteration %d, node id %d\n", 
		getpid(), gettid(), i, current_nid());
}

int main(int argc, char *argv[])
{
	int i;
	for (i=0; i<N; i++) {
		migrateme(i);
		sleep(1);
	}

	return 0;
}
