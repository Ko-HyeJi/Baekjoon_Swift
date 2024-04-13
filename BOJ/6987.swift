//
//	BOJ
//	6987
//	월드컵
//

func solution(_ cnt: Int, _ board: [Int], _ input: [Int]) {
	if cnt == 15 {
		if board == input {
			answer[idx] = 1
		}
	} else {
		var board = board
		let team1 = matches[cnt].0, team2 = matches[cnt].1
		if board[team1 * 3 + 0] < input[team1 * 3 + 0] && board[team2 * 3 + 2] < input[team2 * 3 + 2] {
			board[team1 * 3 + 0] += 1
			board[team2 * 3 + 2] += 1
			solution(cnt + 1, board, input)
			board[team1 * 3 + 0] -= 1
			board[team2 * 3 + 2] -= 1
		}
		if board[team1 * 3 + 1] < input[team1 * 3 + 1] && board[team2 * 3 + 1] < input[team2 * 3 + 1] {
			board[team1 * 3 + 1] += 1
			board[team2 * 3 + 1] += 1
			solution(cnt + 1, board, input)
			board[team1 * 3 + 1] -= 1
			board[team2 * 3 + 1] -= 1
		}
		if board[team1 * 3 + 2] < input[team1 * 3 + 2] && board[team2 * 3 + 0] < input[team2 * 3 + 0] {
			board[team1 * 3 + 2] += 1
			board[team2 * 3 + 0] += 1
			solution(cnt + 1, board, input)
			board[team1 * 3 + 2] -= 1
			board[team2 * 3 + 0] -= 1
		}
	}
}

var matches = [(Int, Int)]()
for i in 0..<6 {
	for j in i + 1..<6 {
		matches.append((i, j))
	}
}

var idx = 0
var answer = [Int](repeating: 0, count: 4)
while idx < 4 {
	let input = readLine()!.split(separator: " ").map { Int($0)! }
	solution(0, [Int](repeating: 0, count: 18), input)
	idx += 1
}

answer.forEach { print($0, terminator: " ") }
