/* A+B - 3 */

let n:Int = Int(readLine()!)!

for _ in 1 ... n {
    let arr = readLine()!.split(separator: " ")
    print(Int(arr[0])! + Int(arr[1])!)
}