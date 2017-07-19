#include<stdio.h>
int main()
{  long int t,k;
   scanf("%ld",&t);
for(k=1;k<=t;k++){
  long int n;
  scanf("%ld",&n);
  long int a[n];
  long int i;
  for(i=0;i<n;i++)
  scanf("%ld",&a[i]);
  long int j;
  for(i=0;i<2;i++)
  for(j=i+1;j<n;j++)
  {   if(a[i]>a[j])
      { a[i]=a[i]^a[j];
       a[j]=a[i]^a[j];
       a[i]=a[i]^a[j];
      }

  }

 printf("%ld\n",a[0]+a[1]);
}
return 0;
}
