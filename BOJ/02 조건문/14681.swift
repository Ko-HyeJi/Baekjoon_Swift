/* 사분면 고르기 */

let x:Int = Int(readLine()!)!
let y:Int = Int(readLine()!)!

if (x >= 0 && y >= 0) {
    print("1")
} else if (x < 0 && y >= 0) {
    print("2")
} else if (x < 0 && y < 0) {
    print("3")
} else {
    print("4")
}