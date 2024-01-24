var alpha = [Int](repeating: 0, count: 26)
var word = readLine()!

for char in word {
  alpha[Int(char.asciiValue!) - 97] += 1
}

for num in alpha {
  print(num, terminator: " ")
}
