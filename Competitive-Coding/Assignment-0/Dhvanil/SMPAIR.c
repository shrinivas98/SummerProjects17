    #include <stdio.h>
     
    int main()
    {
    	int i, j, t, n, k, min;
    	scanf("%d", &t);
    	while(t--)
    	{
    		scanf("%d", &n);
    		int x[n];
    		for(i = 0; i<n; i++)
    		{
    			scanf("%d", &x[i]);
    		}
    		min = x[0] + x[1];
    		for(i = 0; i<n; i++)
    		{
    			for(j = i+1; j<n; j++)
    			{
    				if(x[i] + x[j] < min)
    				{
    					min = x[i] + x[j];
    				}
    			}
    		}
     
    		printf("%d\n", min);
    	}
    	return 0;
    }