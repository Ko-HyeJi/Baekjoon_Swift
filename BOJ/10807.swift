import Foundation

let N = Int(readLine()!)!
// var arr = readLine()!.components(separatedBy: " ").map { Int($0) } 
var arr = readLine()!.split(separator: " ").map { Int(String($0)) }
let v = Int(readLine()!)!

arr = arr.filter { $0 == v }
print(arr.count)