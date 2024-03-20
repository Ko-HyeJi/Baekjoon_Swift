/* DFS */
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1], v = input[2]
var graph = Array(repeating: Array(repeating: false, count: n), count: n)
var visited = [Bool](repeating: false, count: n)
var result = ""

for _ in 0..<m {
  let line = readLine()!.split(separator: " ").map { Int($0)! - 1 }
  graph[line[0]][line[1]] = true
  graph[line[1]][line[0]] = true
}

func dfs(_ idx: Int) {
  visited[idx] = true
  result += "\(idx + 1) "
  for i in 0..<n {
    if !visited[i] && graph[idx][i] {
      dfs(i)
    }
  }
}

dfs(v - 1)
print(result)

/* BFS */
visited = [Bool](repeating: false, count: n)
result = ""

var queue = [v - 1]
visited[v - 1] = true

while !queue.isEmpty {
  let idx = queue.removeFirst()
  result += "\(idx + 1) "
  for i in 0..<n {
    if !visited[i] && graph[idx][i] == true {
      visited[i] = true
      queue.append(i)
    }
  }
}

print(result)