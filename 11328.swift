// import Foundation

let N = Int(readLine()!)!

for _ in 0..<N {
  // let pair = readLine()!.components(separatedBy: " ")
  let pair = readLine()!.split(separator: " ").map { String($0) }
  var alpha1 = [Int](repeating: 0, count: 26)
  var alpha2 = [Int](repeating: 0, count: 26)

  pair[0].forEach { alpha1[Int($0.asciiValue!) - 97] += 1 }
  pair[1].forEach { alpha2[Int($0.asciiValue!) - 97] += 1 }

  print(alpha1 == alpha2 ? "Possible" : "Impossible")
}