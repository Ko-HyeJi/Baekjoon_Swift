var N = Int(readLine()!)!
var originBoard = [[Int]]()
var checkBoard = [[Int]]()
for _ in 0..<N {
  originBoard.append(readLine()!.split(separator: " ").map { Int($0)! })
  checkBoard.append([Int](repeating: -1, count: N))
}
var answer = 0

recursion(0, [])
print(answer)

func recursion(_ count: Int, _ move: [String]) {
  if count == 5 {
    game(move)
  } else {
    ["U", "D", "L", "R"].forEach {
      var move = move
      move.append($0)
      recursion(count + 1, move)
    }
  }
}

func game(_ move: [String]) {
  var board = originBoard
  var check = checkBoard
  
  for idx in 0..<5 {
    switch move[idx] {
    case "U": up(idx)
    case "D": down(idx)
    case "L": left(idx)
    default: right(idx)
    }
  }

  for i in 0..<N {
    for j in 0..<N {
      answer = max(answer, board[i][j])
    }
  }

  func up(_ idx: Int) {
    for i in 1..<N {
      for j in 0..<N {
        var x = i
        let y = j
        if board[x][y] != 0 {
          while x > 0 && board[x - 1][y] == 0 {
            board[x - 1][y] = board[x][y]
            board[x][y] = 0
            x -= 1
          }

          if x > 0 && board[x][y] == board[x - 1][y] && check[x - 1][y] != idx {
            board[x - 1][y] *= 2
            check[x - 1][y] = idx
            board[x][y] = 0
          }
        }
      }
    }
  }

  func down(_ idx: Int) {
    for i in 0..<N {
      for j in 0..<N {
        var x = N - i - 2
        let y = j
        if x > -1 && board[x][y] != 0 {
          while x + 1 < N && board[x + 1][y] == 0 {
            board[x + 1][y] = board[x][y]
            board[x][y] = 0
            x += 1
          }
          if x + 1 < N && board[x][y] == board[x + 1][y] && check[x + 1][y] != idx {
            board[x + 1][y] *= 2
            check[x + 1][y] = idx
            board[x][y] = 0
          }
        }
      }
    }
  }

  func left(_ idx: Int) {
    for i in 0..<N {
      for j in 1..<N {
        let x = i
        var y = j
        if board[x][y] != 0 {
          while y > 0 && board[x][y - 1] == 0 {
            board[x][y - 1] = board[x][y]
            board[x][y] = 0
            y -= 1
          }
          if y > 0 && board[x][y] == board[x][y - 1] && check[x][y - 1] != idx {
            board[x][y - 1] *= 2
            check[x][y - 1] = idx
            board[x][y] = 0
          }
        }
      }
    }
  }

  func right(_ idx: Int) {
    for i in 0..<N {
      for j in 0..<N {
        let x = i
        var y = N - j - 2
        if y > -1 && board[x][y] != 0 {
          while y + 1 < N && board[x][y + 1] == 0 {
            board[x][y + 1] = board[x][y]
            board[x][y] = 0
            y += 1
          }
          if y + 1 < N && board[x][y] == board[x][y + 1] && check[x][y + 1] != idx {
            board[x][y + 1] *= 2
            check[x][y + 1] = idx
            board[x][y] = 0
          }
        }
      }
    }
  }
}

/* test case */
// case 1
// 4
// 0 0 2 0
// 0 0 0 0
// 2 0 0 0
// 0 0 0 0
// 
// case 2
// 4 2 0 0
// 0 0 0 0
// 0 0 0 0
// 2 0 0 0
// 
// case 3
// 2 0 2 8
// 0 0 2 2
// 0 0 0 0
// 0 0 0 0
// 
// case 5
// 4
// 2 4 16 8
// 8 4 0 0
// 16 8 2 0
// 2 8 2 0
// 
// case 6
// 4
// 2 4 8 2
// 2 4 0 0
// 2 0 0 0
// 2 0 2 0
// 
// case 7
// 4
// 2 0 0 0
// 2 2 0 0
// 2 0 0 0
// 0 0 0 0
