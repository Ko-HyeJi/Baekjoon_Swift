/* 알람 시계 */

var time:Array = readLine()!.split(separator: " ")
var h:Int = Int(time[0])!
var m:Int = Int(time[1])!

if (m >= 45) {
   m -= 45 
} else {
    m += 15
    if (h != 0) {
        h -= 1
    } else {
        h = 23
    }
}

print(h, m)