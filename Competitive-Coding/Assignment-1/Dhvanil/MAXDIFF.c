#include <stdio.h>
#include<stdlib.h>
void merge(int *a, int l, int m, int r);
void mergesort(int *a, int l, int r);
int abs(int a);
int main(){
  int tc=0;
  scanf("%d",&tc);
 
  while (tc--) {
   int t=1;
   int x=1;
	 int i, j, k, l;
	 int *n;
   scanf("%d%d",&t,&x);
	 n = (int *)malloc(t*sizeof(int));
	 for (i=0;i<t;i++){
		 scanf("%d",n+i);
	}
	mergesort(n,0,t-1);
//from here//
int sum,sum1,sum2;
sum=sum1=sum2=0;
  for(i=0;i<t;i++)
  sum=sum+n[i];
  for(i=0;i<x;i++)
  sum1=sum1+n[i];
  for(i=t-1;i>t-x-1;i--)
  sum2=sum2+n[i];
 
  int sum11=sum-sum1;
  int sum22=sum-sum2;
 
  if(abs(sum1-sum11)>=abs(sum2-sum22))
  printf("%d\n",abs(sum1-sum11));
  else
  printf("%d\n",abs(sum2-sum22));
 
 
 
//to here//
	free(n);
}
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
int abs(int a)
{
  if(a>=0)
  return a;
  return -a;
}