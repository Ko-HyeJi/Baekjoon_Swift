// 테스트 1~18 통과, 19~26 실패(시간 초과)

import Foundation

func solution(_ dice:[[Int]]) -> [Int] {
    let n = dice.count
    var cases: (A: [[Int]], B: [[Int]]) = ([], [])
    var max = 0
    var answer = [Int]()
    
    combination(n, 0, [], &cases)
    
    let caseNum = cases.A.count
    for i in 0..<caseNum {
        var arrA = [[Int]](), arrB = [[Int]]()
        for idx in cases.A[i] { arrA.append(dice[idx]) }
        for idx in cases.B[i] { arrB.append(dice[idx]) }
        var A = [Int](), B = [Int]()
        rollDice(&A, arrA)
        rollDice(&B, arrB)
        A = A.sorted()
        B = B.sorted()
        
        var idxA = 0, idxB = 0
        var sum = 0
        
        while idxA < A.count && idxB < B.count {
            if A[idxA] > B[idxB] {
                idxB += 1
            } else {
                sum += idxB
                idxA += 1
            }        
        }
        
        if idxB == B.count {
            sum += idxB * (A.count - idxA)
        }
        
        if sum > max {
            max = sum
            answer = cases.A[i]
        }
    }
    
    return answer.map { $0 + 1 }
}

func combination(_ cnt: Int, _ idx: Int, _ selected: [Int], _ cases: inout (A: [[Int]], B: [[Int]])) {
    if selected.count == cnt / 2 {
        cases.A.append(selected)
        cases.B.append((0..<cnt).filter { !selected.contains($0) })
        return
    }
    for i in idx..<cnt {
        if !selected.contains(i) {
            combination(cnt, i, selected + [i], &cases)
        }
    }
}

func rollDice(_ sumArr: inout [Int], _ arrays: [[Int]], _ currentArrayIndex: Int = 0, _ currentCombination: [Int] = []) {
    if currentArrayIndex == arrays.count {
        sumArr.append(currentCombination.reduce(0) { $0 + $1 })
        return
    }
    for number in arrays[currentArrayIndex] {
        rollDice(&sumArr, arrays, currentArrayIndex + 1, currentCombination + [number])
    }
}
