/*
소수 찾기

문제 설명
  한자리 숫자가 적힌 종이 조각이 흩어져있습니다. 흩어진 종이 조각을 붙여 소수를 몇 개 만들 수 있는지 알아내려 합니다.
  각 종이 조각에 적힌 숫자가 적힌 문자열 numbers가 주어졌을 때, 종이 조각으로 만들 수 있는 소수가 몇 개인지 return 하도록 solution 함수를 완성해주세요.

제한사항
  numbers는 길이 1 이상 7 이하인 문자열입니다.
  numbers는 0~9까지 숫자만으로 이루어져 있습니다.
  "013"은 0, 1, 3 숫자가 적힌 종이 조각이 흩어져있다는 의미입니다.

입출력 예
  numbers  return
  "17"	   3
  "011"	   2
*/

import Foundation

var permutations = Set<Int>.init()

func isPrimeNumber(of num: Int) -> Bool {
    if num < 2 {
        return false
    }

    for i in 2..<num {
        if num % i == 0 {
            return false
        }
    }
    return true
}

func permutation(_ target: [String], _ r: Int) {
    var check = [Bool](repeating: false, count: target.count)
    
    func permute(_ arr: [String]) {
        if arr.count == r {
            permutations.insert(Int(arr.reduce("") { $0 + $1 })!)
            return
        }
        
        let length = target.count
        for i in 0..<length {
            if check[i] == true {
                continue
            } else {
                check[i] = true
                permute(arr + [target[i]])
                check[i] = false
            }
        }
    }

    permute([])
}

func solution(_ numbers:String) -> Int {
    permutations = []
    let numArr: [String] = Array(numbers).map { String($0) }

    let length = numArr.count
    for r in 1...length {
        permutation(numArr, r)
    }

    return ((permutations.filter { isPrimeNumber(of: $0) }).count)
}

print(solution("17")) // 3
print(solution("011")) // 2