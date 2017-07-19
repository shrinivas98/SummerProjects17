#include<bits/stdc++.h>
using namespace std;

int main(){
  int nodes,edges;
  cin>>nodes;
  cin>>edges;

  std::vector<int>v[10];

  for(int i=1;i<=edges;i++)
  {
    int x,y;
    cin>>x;
    cin>>y;
    v[x].push_back(y);
    v[y].push_back(x);
  }

bool visit[11];
for(int i=0;i<11;i++)
visit[i]=false;

stack<int>s;

s.push(1);
visit[0]=true;
visit[1]=true;

while(!(s.empty()))
{
  int t=s.top();
  cout << t<<" ";
  s.pop();

  for(int i=0;i<v[t].size();i++)
  {
    if(visit[v[t][i]]==false)
    {
      visit[v[t][i]]=true;
      s.push(v[t][i]);
    }
  }
}







  return 0;
}
