/* 주사위 세개 */

var input:Array = readLine()!.split(separator: " ")
var intArr:Array = [Int(input[0])!, Int(input[1])!, Int(input[2])!]

if ((intArr[0] == intArr[1]) &&  (intArr[0] == intArr[2])) {
    print(10000 + intArr[0] * 1000)
} else if ((intArr[0] == intArr[1]) || (intArr[0] == intArr[2]) || (intArr[1] == intArr[2])) {
    intArr.sort()
    print(1000 + intArr[1] * 100)
} else {
    intArr.sort()
    print(intArr[2] * 100)
}