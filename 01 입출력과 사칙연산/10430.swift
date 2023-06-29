/* 나머지 */

var strArr:Array = readLine()!.split(separator: " ")
let A:Int = Int(strArr[0])!
let B:Int = Int(strArr[1])!
let C:Int = Int(strArr[2])!

print((A+B)%C)
print(((A%C) + (B%C))%C)
print((A*B)%C)
print(((A%C) * (B%C))%C)