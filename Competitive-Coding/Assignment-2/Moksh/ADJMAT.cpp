#include <iostream>

using namespace std;

//The adjacency matrix: If adj[i][j] = 1, then vertices i and j are connected by an edge, otherwise they are not.
int adj[101][101];

int main(){
	int n,m;
	cin >> n >> m;
	//Initialize the adjacency matrix with all zeros, just in case.
	for(int i = 1; i<=n; i++){
		for(int j = 1; j<=1; j++)
			adj[i][j] = 0;
	}
	for(int i = 0; i<m; i++){
		//Add an edge
		int a,b;
		cin >> a >> b;
		adj[a][b] = 1;
		//For one-way edges remove the following line
		adj[b][a] = 1;
	}
	//Print the adjacency matrix
	for(int i = 1; i<=n; i++){
		for(int j=1; j<=n; j++)
			cout << adj[i][j] << " ";
		cout << "\n";
	}
	return 0;
}