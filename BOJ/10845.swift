let n = Int(readLine()!)!
var queue = [Int]()
var result = ""

for _ in 0..<n {
  let input = readLine()!
  switch input {
  case "pop":
    if !queue.isEmpty {
      result += "\(queue.removeFirst())\n"
    } else {
      result += "-1\n"
    }
  case "size":
    result += "\(queue.count)\n"
  case "empty":
    result += "\(queue.isEmpty ? 1 : 0)\n"
  case "front":
    if !queue.isEmpty {
      result += "\(queue.first!)\n"
    } else {
      result += "-1\n"
    }
  case "back":
    if !queue.isEmpty {
      result += "\(queue.last!)\n"
    } else {
      result += "-1\n"
    }    
  default:
    queue.append(Int(input.split(separator: " ")[1])!)
  }
}

print(result)