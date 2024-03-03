_ = readLine()!
let trees = readLine()!.split(separator: " ").map { Int($0)! }
print(solution(trees))

func solution(_ trees: [Int]) -> String {
  let sum = trees.reduce(0) { $0 + $1 }
  if sum % 3 != 0 {
    return "NO"
  } else {
    var count = sum / 3
    for tree in trees {
      count -= tree / 2
      if count <= 0 {
        return "YES"
      }
    }
    return "NO"
  }
}