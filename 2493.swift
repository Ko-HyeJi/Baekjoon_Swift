// 시간 초과

let n = Int(readLine()!)!
var stack = readLine()!.split(separator: " ").map { Int($0)! }
var result = [Int](repeating: 0, count: n)

for i in (0..<n).reversed() {
  let cur = stack.removeLast()
  for j in (0..<stack.count).reversed() {
    if stack[j] > cur {
      result[i] = j + 1
      break
    }
  }
}

result.forEach { print($0, terminator: " ") }