    #include<stdio.h>
    int main()
    {
    	int a=0;
    	scanf("%d",&a);
    	int count=0;
    	long int n;
    	int b[a];
    	int i;
    	for(i=0;i<a;i++)
    		scanf("%d",&b[i]);
    	for(i=0;i<a;i++)
    	{
    		count=0;
    		
    		int x;
    		 for (x=5;b[i]/x>=1;x*=5)
              count += b[i]/x;
    			printf("%d\n",count);
    	}
    return 0;	
    } 