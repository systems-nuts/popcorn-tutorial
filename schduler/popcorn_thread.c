#include <pthread.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include "migrate.h"
#include <malloc.h>
pthread_mutex_t mutex;
static int  answer = 0;

int prime_sum(int index, int range)
{
	int i,j,sign = 1,tem = 0;
	for(i = index; i<index + 100000; i++)
        {
                for(j = 2; j< i; j++){
                        if (i % j ==0){ break; sign = 0;}}
                if (sign != 0 && j==i) {tem ++; }
                sign = 1;
        }
	return tem;
}



void *thr_fn(void *arg)
{
	printf("start [%d] [%d]\n",getpid(),gettid());
	int index = *(int*) arg;
	int range = 100000, tem = 0;
 	tem = prime_sum(index, range);
	printf("finish [%d]\n",gettid());
	if (pthread_mutex_lock(&mutex) != 0) printf("lock error!\n");
        answer += tem;
        printf("pid[%d] tid[%d] sum of %d to %d is %d\n",getpid(),gettid(),index,index+range,tem);
        pthread_mutex_unlock(&mutex);
}
int main(void)
{
	printf(":?\n");	
        int num_thread = 4, err, i;
	pthread_t *pt = (pthread_t *)malloc(sizeof(pthread_t) * num_thread);
	if (pthread_mutex_init(&mutex, NULL) != 0){
                free(pt);
		printf("I am fucked!\n");
                return 1;
        }
	int index[4] = {0,100000,200000,300000};
        for(i = 0;i < 4; i++) {
		err = pthread_create(&pt[i], NULL, thr_fn, &index[i]);
		if (err != 0){
		printf("can't create thread: %s\n", strerror(err));
		exit(0);}
	}
	for (i = 0; i < 4; i++)	pthread_join(pt[i], NULL);
	pthread_mutex_destroy(&mutex);
	printf("the answer is %d", answer);
	free(pt);
        return 0;
}
