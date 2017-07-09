#include<iostream>
using namespace std;
 
int main()
{
    long long int i,x,a,t;
    cin>>t;
    while(t--)
    { cin>>a;
    x=0,i=5;
   while(i<=a)
    {x=x+a/i;
        i=i*5;
    }
       cout<<x<<endl;
    }
    return 0;
}
