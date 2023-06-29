/* 곱셈 */

var num1:Int = Int(readLine()!)!
var num2:Int = Int(readLine()!)!
print(num1 * (num2 % 10))
print(num1 * ((num2 % 100) / 10))
print(num1 * (num2 / 100))
print(num1 * num2)