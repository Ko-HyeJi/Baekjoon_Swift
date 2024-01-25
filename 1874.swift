let n = Int(readLine()!)!
var stack1 = [Int]()
var stack2 = [Int]()
var result = ""

for _ in 0..<n {
  stack1.append(Int(readLine()!)!)
}
stack1.reverse()

for i in 1...n {
  stack2.append(i)
  result += "+\n"
  while !stack1.isEmpty && !stack2.isEmpty && (stack1.last! == stack2.last!) {
    result += "-\n"
    stack1.removeLast()
    stack2.removeLast()
  }
}

if !stack2.isEmpty {
  result = "NO"
}
print(result)