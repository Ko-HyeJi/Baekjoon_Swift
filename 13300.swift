var pair = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = pair[0]
let K = pair[1]

var arr = [Int](repeating: 0, count: 12)
for _ in 0..<N {
  pair = readLine()!.split(separator: " ").map { Int(String($0))! }
  if pair[0] == 0 {
    arr[pair[1] - 1] += 1
  } else  {
    arr[pair[1] + 5] += 1
  }
}

print(arr.map { ($0 % K == 0) ? ($0 / K) : ($0 / K + 1) }.reduce(0) { $0  + $1 })