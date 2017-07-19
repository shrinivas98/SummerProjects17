#include<bits/stdc++.h>

using namespace std;

int main(){
  int n,m;
  cin>>n>>m;
  vector<int>a[n+1];

  while(m--){
    int c,d;
    cin>>c>>d;
    a[c].push_back(d);
    a[d].push_back(c);
  }

    for(int j=1;j<=n;j++){
    for(int i=0;i<a[j].size();i++){
    cout<<a[j][i]<<" ";
    }
   cout<<"\n";
  }

}
