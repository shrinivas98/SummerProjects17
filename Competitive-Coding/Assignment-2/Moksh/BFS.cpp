#include <bits/stdc++.h>
using namespace std;

void bfs(vector<int> *g, int n, int v) {

	vector<bool> ch(n, false);

	queue<int> s;

	s.push(v);

	while(!s.empty()) {
		v = s.front();
		s.pop();

		if(!ch[v]) {
			cout<<v<<" ";
			ch[v] = true;
		}

		for (int i = 0; i < g[v].size(); ++i)
			if(!ch[g[v][i]])
				s.push(g[v][i]);
	}
	cout<<"\n";
}

int main() {
	int m, n, t, p;
	cin>>n>>m;
	vector<int> g[n+1];
	for (int i = 0; i < m; ++i)
	{
		cin>>t>>p;
		g[t].push_back(p);
	}
	bfs(g, n, 1);
}