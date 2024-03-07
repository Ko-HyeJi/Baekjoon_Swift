let n = Int(readLine()!)!
let h = readLine()!.split(separator: " ").map{ Int($0)! }.sorted()
print(h[(n - 1) / 2])