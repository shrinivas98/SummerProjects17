#include<iostream>
using namespace std;
int main()
{  int n,m;
    cin>>n>>m;
    int i,j;
    int a[n+1][n+1];
for(int i=0;i<=n;i++)
for(int j=0;j<=n;j++)
a[i][j]=0;

for(int k=1;k<=m;k++)
{   cin>>i>>j;
    a[i][j]=1;
    a[j][i]=1;
}
for(i=1;i<=n;i++)
{for(j=1;j<=n;j++)
cout<<a[i][j]<<" ";
cout<<endl;
}
return 0;
}
