class Solution {
    func minInsertions(_ s: String) -> Int {
        var stack: [Int] = []
        var totalCount = 0

        for element in s {
            if element == "(" {
                if let last = stack.last, last == 1 {
                    totalCount += stack.popLast()!
                }
                stack.append(2)
            } else {
                if stack.count > 0 {
                    let count = stack.popLast()!
                    if count - 1 != 0 {
                        stack.append(count - 1)
                    }
                } else {
                    totalCount += 1
                    stack.append(1)
                }
            }
        }

        let remain = stack.reduce(0, +)

        return totalCount + remain
    }
}

let solution = Solution()
solution.minInsertions("(()))(()))))")
