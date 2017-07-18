#include <iostream>
using namespace std;
 
int main(){
  	// your code goes here
	long int t;
	cin>>t;
	
	long int *a=new long int[1000000+1];
	
	for(long int k=0;k<1000001;k++)
	{
	    a[k]=-1;
	}
	
	for(long int i=0;i<t;i++)
	{
	   long int num;
	   cin>>num;
	   a[num]=a[num]+1;
	}
	
	for(long int j=0;j<1000001;j++)
	{
	    if(a[j]!=(-1))
	    {
	    long int times=a[j];
	    for(long int iter=0;iter<=times;iter++)
	    {
	    cout<<j<<endl;
	    }
	    }
	}
}
