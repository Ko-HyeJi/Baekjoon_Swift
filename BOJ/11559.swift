//
//  BOJ
//  11559
//  Puyo Puyo
//

func find(_ color: Character, _ stack: [(Int, Int)], _ visited: inout [[Bool]], _ selected: inout [(Int, Int)]) {
  var stack = stack
  var record = [(Int, Int)]()
  var count = 0
  
  while !stack.isEmpty {
    count += 1
    let cur = stack.popLast()!
    record.append(cur)
    let i = cur.0, j = cur.1

    if i > 0 && !visited[i - 1][j] && board[i - 1][j] == color {
      visited[i - 1][j] = true
      stack.append((i - 1, j))
    }
    if i + 1 < h && !visited[i + 1][j] && board[i + 1][j] == color {
      visited[i + 1][j] = true
      stack.append((i + 1, j))
    }
    if j > 0 && !visited[i][j - 1] && board[i][j - 1] == color {
      visited[i][j - 1] = true
      stack.append((i, j - 1))
    }
    if j + 1 < w && !visited[i][j + 1] && board[i][j + 1] == color {
      visited[i][j + 1] = true
      stack.append((i, j + 1))
    }
  }

  if count >= 4 {
    selected += record
  }
}

func bomb(_ selected: inout [(Int, Int)]) {
  selected.forEach {
    board[$0.0][$0.1] = "."
  }

  for i in (0..<h - 1).reversed() {
    for j in (0..<w).reversed() {
      if board[i][j] != "." && board[i + 1][j] == "." {
        var n = 0
        while i + 2 + n < h && board[i + 2 + n][j] == "." {
          n += 1
        }
        board[i + 1 + n][j] = board[i][j]
        board[i][j] = "."
      }
    }
  }
}

var answer = 0
var board = [[Character]]()
var w = 6, h = 12
for _ in 0..<12 {
  board.append(Array(readLine()!))
}

while true {
  var visited = [[Bool]]()
  for _ in 0..<h {
    visited.append([Bool](repeating: false, count: w))
  }
  var selected = [(Int, Int)]()

  for i in 0..<h {
    for j in 0..<w {
      if board[i][j] != "." && !visited[i][j] {
        visited[i][j] = true
        find(board[i][j], [(i, j)], &visited, &selected)
      }
    }
  }

  if selected.isEmpty {
    break
  } else {
    answer += 1
  }

  bomb(&selected)
}

print(answer)