func combination(_ M: Int, _ N: Int) -> Int {
  var result = 1
  for i in 0..<N {
    result *= M - i
    result /= i + 1
  }
  return result
}

var output = ""

for _ in 0..<Int(readLine()!)! {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  output += "\(combination(input[1], input[0]))\n"
}

print(output)
