var arr = [Int](repeating: 0, count: 10)
var num = readLine()!

for char in num {
  arr[char.wholeNumberValue!] += 1
}

arr[6] = (arr[6] + arr[9]) / 2 + (arr[6] + arr[9]) % 2
arr[9] = 0
print(arr.max()!)