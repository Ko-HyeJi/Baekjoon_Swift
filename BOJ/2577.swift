var n: Int = 1
var arr: Array = [Int](repeating: 0, count: 10)

for _ in 0..<3 {
  n *= Int(readLine()!)!
}

while n > 10 {
  arr[n % 10] += 1
  n /= 10
}
arr[n] += 1

for i in arr {
  print(i)
}