let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
let x = Int(readLine()!)!

var start = 0, end = n - 1, cnt = 0

while start < end {
  let num = arr[start] + arr[end]
  if num < x {
    start += 1
  } else if num > x {
    end -= 1
  } else {
    start += 1
    end -= 1
    cnt += 1
  }
}

print(cnt)
