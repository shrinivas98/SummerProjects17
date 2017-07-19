#include<bits/stdc++.h>
using namespace std;
int main()
{   int n,m,i,j,x,y;
    cin>>n;
    cin>>m;
    vector<int>v[n+1];
    for(int k=1;k<=m;k++)
      {   cin>>x;
          cin>>y;
          v[x].push_back(y);
          v[y].push_back(x);
      }
    queue<int> q;
    bool visited[n];
     for(i=0;i<n;i++)
     visited[i]=false;
      q.push(0);
      visited[0]=true;
     while(!(q.empty()))
     {
          int t=q.front();
          cout<<t<<" ";
             q.pop();

          for(i=0;i<v[t].size();i++)
          {
              if(visited[v[t][i]]==false)
            {
               visited[v[t][i]]=true;
                q.push(v[t][i]);
            }

           }
    }
return 0;
}
