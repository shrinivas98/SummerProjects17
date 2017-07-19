#include<bits/stdc++.h>
using namespace std;
int main()
{  int n,m,i,j;
    cin>>n>>m;
    vector<int>v[n+1];
    vector<int>::iterator itr;
    for(int k=1;k<=m;k++)
    {   cin>>i>>j;
        v[i].push_back(j);
        v[j].push_back(i);
    }
    for(i=1;i<=n;i++)
    {    cout<<i<<" ";
        for(itr=v[i].begin();itr!=v[i].end();itr++)
        cout<<*itr<<" ";
        cout<<endl;
    }
return 0;
}
