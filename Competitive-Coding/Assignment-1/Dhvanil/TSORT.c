#include <stdio.h>
 
void merge(int *a, int l, int m, int r);
void mergesort(int *a, int l, int r);
 
int main(){
	int t=1;
	int i, j, k, l;
	int *n;
	scanf("%d", &t);
	n = (int *)malloc(t*sizeof(int));
	for (i = 0; i < t; i++){
		scanf("%d", n+i);
	}
	mergesort(n, 0, t - 1);
	for (i = 0; i < t; i++){
		printf("%d\n", *(n+i));
	}
	free(n);
	return 0;
}
 
void merge(int *a, int l, int m, int r){
	int i, j, k;
	int len1 = m - l + 1;
	int len2 = r - m;
	int *a1;
	a1 = (int *)malloc(len1*sizeof(int));
	int *a2;
	a2 = (int *)malloc(len2*sizeof(int));
	for (i = 0; i < len1; i++){
		*(a1 + i) = *(a+l + i);
	}
	for (i = 0; i < len2; i++){
		*(a2 + i) = *(a+m + 1 + i);
	}
	i = 0;
	j = 0;
	k = l;
	while (i < len1 && j < len2){
		if (*(a1 + i) <= *(a2 + j)){
			*(a + k) = *(a1 + i);
			i++;
		}
		else{
			*(a + k) = *(a2 + j);
			j++;
		}
		k++;
	}
	while (i < len1){
		*(a + k) = *(a1 + i);
		i++;
		k++;
	}
	while (j < len2){
		*(a + k) = *(a2 + j);
		j++;
		k++;
	}
	free(a1);
	free(a2);
}
 
void mergesort(int *a, int l, int r){
	if (l < r){
		int m = l + ((r-l) / 2);
		mergesort(a, l, m);
		mergesort(a, m + 1, r);
		merge(a, l, m, r);
	}
} 