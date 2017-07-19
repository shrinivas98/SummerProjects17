#include<stdio.h>
#include<math.h>

int main()
{
int k;
int n,j,l;
scanf("%d",&l);
for(j=1;j<=l;j++)
{  scanf("%d",&n);
k=log(n)/log(5);
int sum=0,i;
for(i=1;i<=k;i++)
{

sum+= n/(int)(pow(5,i));
}
printf("%d\n",sum);
}


return 0;










}
