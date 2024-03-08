let times = readLine()!.split(separator: " ").map { String($0) }
var enter = Set<String>()
var leave = Set<String>()

while let input = readLine()?.split(separator: " ") {
  let time = String(input[0])
  let nick = String(input[1])

  if time <= times[0] {
    enter.insert(nick)
  } else if time >= times[1] && time <= times[2] {
    if enter.contains(nick) {
      leave.insert(nick)
    }
  }
}

print(leave.count)
