var left = readLine()!
var right = ""
let n = Int(readLine()!)!

for _ in 0..<n {
  let cmd = readLine()!
  switch cmd {
  case "L":
    if !left.isEmpty {
      right.append(left.removeLast())
    }
  case "D":
    if !right.isEmpty {
      left.append(right.removeLast())
    }
  case "B":
    if !left.isEmpty {
      left.removeLast()
    }
  default:
    left.append(cmd.last!)
  }
}

print(left + right.reversed())
