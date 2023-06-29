/* 오븐 시계 */

var time:Array = readLine()!.split(separator: " ")
var cook:Int = Int(readLine()!)!

var bf_time:Int = Int(time[0])! * 60 + Int(time[1])!
var af_time:Int = bf_time + cook

var h:Int = af_time / 60
if (h >= 24) {
    h -= 24
}
var m:Int = af_time % 60

print(h, m)