let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0], M = input[1]
var answer = [String]()

func backtrack(_ arr: [Int]) {
  if arr.count == M {
    answer.append(arr.reduce("") { String($0) + String($1) + " " })
  }

  for i in 1...N {
    if !arr.contains(i) {
      backtrack(arr + [i])
    }
  }
}

backtrack([])
answer.forEach { print($0) }