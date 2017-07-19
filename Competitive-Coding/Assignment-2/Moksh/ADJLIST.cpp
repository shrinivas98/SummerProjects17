#include <iostream>
#include <vector>
using namespace std;

int main() {
	int m, n, t, p;
	cin>>n>>m;
	vector<int> g[n];
	for (int i = 0; i < m; ++i)
	{
		cin>>t>>p;
		g[t-1].push_back(p);
		g[p-1].push_back(t);
	}

	for(int i = 0; i < n; i++) {
		for(int j = 0; j < g[i].size(); j++) {
			cout<<g[i][j]<<" ";
		}
		cout<<"\n";
	}
}