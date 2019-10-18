#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include "migrate.h"
void print_iteration()
{
	static int i = 0;
	printf("[%d] iteration %d in node %d\n", gettid(), i++, current_nid());
}

int main(int argc, char *argv[])
{
	printf("total_act_nodes: %d\n",total_act_nodes());
	if(!current_nid()) printf("We are in X86, we migrate to ARM \n");
	else{ printf("we are in ARM, we migrate to X86 \n");}
	int i = 0;
	printf("Migration signal\n");
	while(i<=50) {
		print_iteration();
		sleep(1);
		i++;
	}
	return 0;
}
