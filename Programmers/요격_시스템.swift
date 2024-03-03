import Foundation

func solution(_ targets:[[Int]]) -> Int {
    var targets = targets
    targets.sort { $0[0] < $1[0] }
    var result = 1
    var s = targets[0][0]
    var e = targets[0][1]
    for target in targets {
        if target[0] >= s && target[1] <= e { // 완전히 범위에 들어감
            s = target[0]
            e = target[1]
        } else if target[0] < e && target[1] >= e { // 시작점은 범위에 속하고 끝점은 범위를 벗어남
            s = target[0]
        } else { // 완전히 범위를 벗어남
            result += 1;
            s = target[0]
            e = target[1]
        }
    }
    return result
}

/* 오답 코드 */
// import Foundation

// func solution(_ targets:[[Int]]) -> Int {
//     var targets = targets
//     var dict = [Int: Int]()
//     var result = 0
    
//     for target in targets {
//         for i in target[0]..<target[1] {
//             if dict[i] == nil {
//                 dict[i] = 1
//             } else {
//                 dict[i] = dict[i]! + 1
//             }
//         }
//     }
    
//     while true {
//         let max = dict.max { $0.1 < $1.1 }
//         if max!.value == 0 {
//             return result
//         }
//         result += 1

//         for target in targets {
//             if max!.key >= target[0] && max!.key < target[1] {
//                 for i in target[0]..<target[1] {
//                     dict[i]! -= 1
//                 }
//                 targets.remove(at: targets.firstIndex(of: target)!)
//             }
//         } 
//     }
// }
