#include<iostream>
//#include<vector>
#include<bits/stdc++.h>
using namespace std;
int main()
{
int n,i,j,m;
cin>>n>>m;
vector<int> a[n+1];
for(i=0;i<m;i++)
{
int b,c;
cin>>b>>c;
a[b].push_back(c);
a[c].push_back(b);
}
for(i=1;i<=n;i++)
{int k=0,n1=a[i].size();
std::sort(a[i].begin(),a[i].end());
for(j=1;j<=n;j++)
{
if(a[i][k]==j && k<n1)
{
cout<<"1"<<" ";
k++;
}
else
cout<<"0"<<" ";
}
cout<<"\n";
}
return 0;
}

