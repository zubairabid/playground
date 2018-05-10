#include <iostream>
#include <vector>

static const int64_t MAX_N = 100000;

std::vector<int64_t> adj[MAX_N];
bool visited[MAX_N];

bool dfs(int64_t, int64_t);

int main() {
  int64_t num, dest, temp;
  std::cin >> num >> dest;

  for (int i = 1; i < num; i++) {
    std::cin >> temp;
    adj[i].push_back(i + temp);
  }

  std::cout << (dfs(1, dest) ? "YES" : "NO") << "\n";

}

bool dfs(int64_t vertex, int64_t dest) {
  visited[vertex] = true;
  bool state = false;

  for(int i = 0; i < adj[vertex].size(); i++) {
    if (!visited[ adj[vertex][i] ])
      state = (state || dfs(adj[vertex][i], dest));
  }

  return (vertex == dest || state);
}
