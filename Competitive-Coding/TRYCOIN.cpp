#include<iostream>
using namespace std;
 
int main()
{
	int t;
	cin>>t;
	while(t--)
	{
		long long n,c=1,count=0;
		cin>>n;
		for(int i=0;i<n;i=i+c)
		{
			count++;
			c++;
		}
		cout<<count<<endl;
	}
	
	return 0;
}
