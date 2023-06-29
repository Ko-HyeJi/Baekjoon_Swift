/* 두 수 비교하기 */

let arr:Array = readLine()!.split(separator: " ")
let num1:Int = Int(arr[0])!
let num2:Int = Int(arr[1])!

if (num1 > num2) {
  print(">")
} else if (num1 < num2) {
  print("<")
} else {
  print("==")
}