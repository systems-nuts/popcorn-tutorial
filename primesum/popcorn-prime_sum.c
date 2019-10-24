#define _GNU_SOURCE
#include <pthread.h>
#include <stdio.h>
#include <unistd.h>
#include <malloc.h>
#include "migrate.h"

#define MAX 400000
#define N 4

static pthread_mutex_t sum_mutex;
static int sum = 0;

int is_prime (unsigned int n)
{ 
	int i;
	if (n <= 1)
		return 1;
	for (i = 2; i < n; i++)
		if (n%i == 0)
			return 0;
	return 1;
}

int prime_sum(int index, int range)
{
	int i, cnt =0, nid =current_nid();

        printf("[%d,%d] thread index %d, range %d (node %d)\n",
		 getpid(), gettid(), index, range, nid);
	for(i = index; i < (index + range); i++) {
		int cnid = current_nid();
		if (cnid != nid) {
			printf("[%d,%d] thread index %d, range %d (node %d)\n",
		                 getpid(), gettid(), index, range, cnid);
			nid = cnid;
		}
		if (is_prime(i))
			cnt++;
	}
      
	printf("[%d,%d] thread index %d, sum %d (node %d)\n",
		getpid(), gettid(), index, cnt, nid);
	return cnt;
}

void *thread(void *arg)
{
	int index = *(int*) arg;
	int cnt = 0;
	
 	cnt = prime_sum(index, (MAX/N));

	pthread_mutex_lock(&sum_mutex);
        sum += cnt;
        pthread_mutex_unlock(&sum_mutex);

	return NULL;
}

int main(void)
{
        int err, i, ret=0;

	int *index = (int *)malloc(sizeof(int) * N);
	pthread_t *pt = (pthread_t *)malloc(sizeof(pthread_t) * N);

	if (pthread_mutex_init(&sum_mutex, NULL) != 0) {
		perror("pthread_mutex_init");
		ret = 1;
		goto error_exit;
        }

        for (i = 0; i < N; i++) {
		index[i] = (MAX/N) * i;

		err = pthread_create(&(pt[i]), NULL, thread, &(index[i]));
		if (err != 0){
			perror("pthread_create");
			ret = 1;
			goto error_exit1;
		}
	}
	for (i = 0; i < N; i++)
		pthread_join(pt[i], NULL);

        printf("sum is %d\n", sum);

error_exit1:
	pthread_mutex_destroy(&sum_mutex);
error_exit:
	free(pt);
	free(index);
        return 0;
}
