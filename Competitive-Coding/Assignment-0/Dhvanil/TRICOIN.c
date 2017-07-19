    #include<stdio.h>
    int main()
    {
    	int n;
    	scanf("%d",&n);
    	int a[n];
    	int i;
    	for(i=0;i<n;i++)
    	{
    		scanf("%d",&a[i]);
    	}
    	
    	int s[100000];
    	s[0]=0;
    	for(i=1;i<100000;i++)
    		s[i]=s[i-1]+i;
    	int j;
    	for(i=0;i<n;i++)
    		for(j=0;j<100000;j++)
    			if(a[i]<s[j])
    			{
    				printf("%d\n",j-1);
    				break;
    			}
    			return 0;
    } 