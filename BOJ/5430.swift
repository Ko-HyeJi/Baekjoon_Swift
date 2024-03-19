for _ in 0..<Int(readLine()!)! {
  let p = readLine()!
  let n = Int(readLine()!)!
  var input = readLine()!
  input.removeFirst()
  input.removeLast()
  let arr = input.split(separator: ",").map { String($0) }
  var rev = false
  var err = false
  var head = 0
  var tail = n

  for cmd in p {
    if cmd == "R" {
      rev.toggle()
    } else {
      if head == tail {
        err = true
        break
      }
      if rev {
        tail -= 1
      } else {
        head += 1
      }
    }
  }

  if err {
    print("error")
  } else {
    if head == tail {
      print("[]")
    } else {
      var result = "["
      if rev {
        for i in stride(from: tail - 1, to: head, by: -1) {
          result += "\(arr[i]),"
        }
        result += "\(arr[head])]"
      } else {
        for i in head..<tail - 1 {
          result += "\(arr[i]),"
        }
        result += "\(arr[tail - 1])]"
      }
      print(result)
    }
  }
}
