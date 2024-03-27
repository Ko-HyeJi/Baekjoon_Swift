let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0], d = input[1], k = input[2], c = input[3]

var belt = [Int]()
for _ in 0..<N {
  belt.append(Int(readLine()!)!)
}

var result = 0
for pos in 0..<N {
  var check = [Int](repeating: 0, count: d + 1)
  var duplicate = 0
  var coupon = 1
  for idx in pos..<pos + k {
    if check[belt[idx % N]] == 1 {
      duplicate += 1
    } else {
      check[belt[idx % N]] = 1
    }
    if belt[idx % N] == c {
      coupon = 0
    }
  }

  result = max(result, k - duplicate + coupon)
}

print(result)