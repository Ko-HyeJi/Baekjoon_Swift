/* 영수증 */

let totalPrice:Int = Int(readLine()!)!
let n:Int = Int(readLine()!)!

var curPrice:Int = 0
for _ in 1 ... n {
    let arr:Array = readLine()!.split(separator: " ")
    curPrice += Int(arr[0])! * Int(arr[1])!
}
if (totalPrice == curPrice) {
    print("Yes")
} else {
    print("No")
}
