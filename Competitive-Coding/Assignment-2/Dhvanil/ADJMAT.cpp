#include<bits/stdc++.h>
using namespace std;

int main(){
	int n,m;
	cin >> n >> m;
  int adj[10][10];
		for(int i = 1; i<=n; i++){
		for(int j = 1; j<=n; j++)
			adj[i][j] = 0;
	}
	for(int i = 0; i<m;i++){
		int a,b;
		cin >> a >> b;
		adj[a][b]=adj[b][a]=1;
  }
	for(int i = 1; i<=n; i++){
		for(int j=1; j<=n; j++)
			cout << adj[i][j] << " ";
		  cout << "\n";
	}
	return 0;
}
