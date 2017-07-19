#include<stdio.h>
#include<algorithm>
using namespace std;
int main()
{
int t,q;
scanf("%d",&t);
for(q=1;q<=t;q++)
{
 int n,k,i;
 scanf("%d%d",&n,&k);
int a[n];
for(i=0;i<n;i++)
scanf("%d",&a[i]);
sort(a,a+n);
long long int sum1=0,sum2=0;
if(k<n/2||k==n/2){
for(i=0;i<k;i++)
sum1+=a[i];
for(i=k;i<n;i++)
sum2+=a[i];
printf("%lld\n",abs(sum2-sum1));
}
else
{  reverse(a,a+n);
   for(i=0;i<k;i++)
sum1+=a[i];
for(i=k;i<n;i++)
sum2+=a[i];
printf("%lld\n",abs(sum2-sum1));
}
}
return 0;
}
