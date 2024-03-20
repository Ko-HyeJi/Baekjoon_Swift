/*
타켓 넘버

문제 설명
  n개의 음이 아닌 정수들이 있습니다. 
  이 정수들을 순서를 바꾸지 않고 적절히 더하거나 빼서 타겟 넘버를 만들려고 합니다. 
  예를 들어 [1, 1, 1, 1, 1]로 숫자 3을 만들려면 다음 다섯 방법을 쓸 수 있습니다.
    -1+1+1+1+1 = 3
    +1-1+1+1+1 = 3
    +1+1-1+1+1 = 3
    +1+1+1-1+1 = 3
    +1+1+1+1-1 = 3
  사용할 수 있는 숫자가 담긴 배열 numbers, 타겟 넘버 target이 매개변수로 주어질 때 숫자를 적절히 더하고 빼서 타겟 넘버를 만드는 방법의 수를 return 하도록 solution 함수를 작성해주세요.

제한사항
  주어지는 숫자의 개수는 2개 이상 20개 이하입니다.
  각 숫자는 1 이상 50 이하인 자연수입니다.
  타겟 넘버는 1 이상 1000 이하인 자연수입니다.

입출력 예
  numbers	         target  return
  [1, 1, 1, 1, 1]  3       5
  [4, 1, 2, 1]	   4       2
*/

import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
	let n = numbers.count
	var operations = [Bool](repeating: false, count: n)
	var count = 0

	func recursion(_ idx: Int) {
		if idx < n {
			operations[idx] = true
			recursion(idx + 1)
			operations[idx] = false
			recursion(idx + 1)
		} else {
			var result = 0
			for i in 0..<n {
				if operations[i] {
					result += numbers[i]
				} else {
					result -= numbers[i]
				}
			}
			if result == target {
				count += 1
			}
		}
	}
	
	recursion(0)
	return count
}

print(solution([1, 1, 1, 1, 1], 3)) // 5
print(solution([4, 1, 2, 1], 4)) // 2

// 테스트 1 〉	통과 (976.00ms, 16.4MB)
// 테스트 2 〉	통과 (739.95ms, 16.3MB)
// 테스트 3 〉	통과 (0.69ms, 16.5MB)
// 테스트 4 〉	통과 (2.52ms, 16.3MB)
// 테스트 5 〉	통과 (25.69ms, 16.3MB)
// 테스트 6 〉	통과 (0.80ms, 16.5MB)
// 테스트 7 〉	통과 (0.59ms, 16.3MB)
// 테스트 8 〉	통과 (4.29ms, 16.3MB)
