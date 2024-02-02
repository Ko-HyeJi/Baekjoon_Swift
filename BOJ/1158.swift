let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let k = input[1]
var arr = [Int](1...n)
var result = "<"
var idx = -1

while arr.count != 1 {
  for _ in 0..<k {
    if idx < arr.count - 1 {
      idx += 1
    } else  {
      idx = 0
    }
  } 
  result += (String(arr.remove(at: idx)) + ", ")
  idx -= 1
}
result += (String(arr[0]) + ">")

print(result)