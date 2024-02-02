var alpha1 = [Int](repeating: 0, count: 26)
var alpha2 = [Int](repeating: 0, count: 26)
readLine()!.forEach { alpha1[Int($0.asciiValue!) - 97] += 1 }
readLine()!.forEach { alpha2[Int($0.asciiValue!) - 97] += 1 }

var cnt = 0
for i in 0..<26 {
  cnt += abs(alpha1[i] - alpha2[i])
}

print(cnt)