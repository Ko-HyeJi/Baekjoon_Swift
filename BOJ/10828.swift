let n = Int(readLine()!)!
var arr = [Int]()

for _ in 0..<n {
  let cmd = readLine()!
  switch cmd {
  case "pop":
    print(arr.isEmpty ? -1 : arr.removeLast())
  case "size":
    print(arr.count)
  case "empty":
    print(arr.isEmpty ? 1 : 0)
  case "top":
    print(arr.isEmpty ? -1 : arr.last!)
  default:
    let value = Int(cmd.split(separator: " ")[1])!
    arr.append(value)
  }
}