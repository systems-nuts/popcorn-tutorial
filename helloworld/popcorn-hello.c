#include <stdio.h>
#include <unistd.h>
#include <string.h>
#define _SIG_MIGRATION=1
void print_iteration()
{
	static int i = 0;
	printf("[%d] iteration %d\n", gettid(), i++);

}

int main(int argc, char *argv[])
{
	printf("total_act_nodes: %d\n",total_act_nodes());
	if(!current_nid()) printf("we are in X86, we migrate to ARM \n");
	else{ printf("we are in ARM, we migrate to X86 \n");}
	int arch = current_nid();
	int i = 0;
	while(i < 50) {
		print_iteration();
		sleep(1);
		i++;
	}
	return 0;
}
