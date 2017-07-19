#include<stdio.h>
#include<math.h>
int main()
{ long long int n;
int t,j;
  scanf("%d",&t);
for(j=1;j<=t;j++)
{
  scanf("%d",&n);
long long int i;
double r=sqrt(2*n);
for(i=r-1;;i++)
{
 if( i*(i+1)/2 ==n)
 { printf("%lld\n",i);
    break;
 }
else if(i*(i+1)/2>n)
{
   printf("%lld\n",i-1);
break;


}

}

}

return 0;
}
