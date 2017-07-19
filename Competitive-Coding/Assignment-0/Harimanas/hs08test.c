#include<stdio.h>
int main()
{
 int w;
 float a;
 scanf("%d%f",&w,&a);
 if(w%5!=0)
 printf("%.2f",a);
 else{

    if(w+0.5>a)
    printf("%.2f",a);
    else
    printf("%.2f",a-w-0.5);
    }

return 0;
}
