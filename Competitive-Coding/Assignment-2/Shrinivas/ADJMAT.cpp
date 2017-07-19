#include<iostream>

using namespace std;
int a[101][101];
int main()
{
int i,j,n,m;
cin>>n>>m;
for(i=1;i<=n;i++)
a[i][1]=0;
for(i=0;i<m;i++)
{
int b,c;
cin>>b>>c;
a[b][c]=1;
a[c][b]=1;
}
for(i=1;i<=n;i++)
{
for(j=1;j<=n;j++)
cout<<a[i][j]<<" ";
cout<<"\n";
}
return 0;
}



