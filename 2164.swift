// 시간 초과

var queue = [Int]((1...Int(readLine()!)!).reversed())

while queue.count != 1 {
  queue.removeLast()
  queue.insert(queue.removeLast(), at: Int)
}

print(queue[0])