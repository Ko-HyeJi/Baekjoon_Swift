for i in 1...Int(readLine()!)! {
  print("Case #\(i): \(readLine()!.split(separator: " ").map { Int($0)! }.reduce(0) { $0 + $1 })")
}