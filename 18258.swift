// 시간 초과

import Foundation

let file = FileIO()
let n = file.readInt()
var queue = [Int]()
var result = ""

for _ in 0..<n {
  let input = file.readString()
  switch input {
  case "pop":
    if !queue.isEmpty {
      result += "\(queue.removeFirst())\n"
    } else {
      result += "-1\n"
    }
  case "size":
    result += "\(queue.count)\n"
  case "empty":
    result += "\(queue.isEmpty ? 1 : 0)\n"
  case "front":
    if let front = queue.first {
      result += "\(front)\n"
    } else {
      result += "-1\n"
    }
  case "back":
    if let back = queue.last {
      result += "\(back)\n"
    } else {
      result += "-1\n"
    }
  default:
    queue.append(Int(input.split(separator: " ")[1])!)
  }
}

print(result)

final class FileIO {
  private let buffer:[UInt8]
  private var index: Int = 0
  
  init(fileHandle: FileHandle = FileHandle.standardInput) {
    
    buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
  }
  
  @inline(__always) private func read() -> UInt8 {
    defer { index += 1 }
    
    return buffer[index]
  }
  
  @inline(__always) func readInt() -> Int {
    var sum = 0
    var now = read()
    var isPositive = true
    
    while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시
    if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
    while now >= 48, now <= 57 {
      sum = sum * 10 + Int(now-48)
      now = read()
    }
    
    return sum * (isPositive ? 1:-1)
  }
  
  @inline(__always) func readString() -> String {
    var now = read()
    
    while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
    
    let beginIndex = index-1
    
    while now != 10,
          now != 32,
          now != 0 { now = read() }
    
    return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
  }
  
  @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
    var now = read()
    
    while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
    
    let beginIndex = index-1
    
    while now != 10,
          now != 32,
          now != 0 { now = read() }
    
    return Array(buffer[beginIndex..<(index-1)])
  }
}
