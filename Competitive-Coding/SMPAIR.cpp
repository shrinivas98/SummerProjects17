    #include <iostream>
    #include<algorithm>
    using namespace std;
     
    int main() 
    {
    	long long int t,n,a[100000],i;
    	cin>>t;
    	while(t--)
    	{
    		cin>>n;
    		for(i=0;i<n;i++)
    		{
    			cin>>a[i];
    		}
    		sort(a,a+n);
    		cout<<a[0]+a[1]<<endl;
    	}
    	return 0;
    } 
