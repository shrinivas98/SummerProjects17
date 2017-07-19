#include <bits/stdc++.h>
using namespace std;

void dfs(vector<int> *g, int n, int v) {

	vector<bool> ch(n, false);

	stack<int> s;

	s.push(v);

	while(!s.empty()) {
		v = s.top();
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
		g[p].push_back(t);
	}
	dfs(g, n, 1);
}
