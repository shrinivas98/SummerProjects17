        #include <stdio.h>    
        int main()
        {int x;
         float y;
          scanf("%d%f",&x,&y);
          if((y>=(x+0.50))&&(x%5==0))
          y=y-x-0.50;
          printf("%.2f",y);
          return 0;
        }    