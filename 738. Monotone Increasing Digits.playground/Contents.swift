class Solution {
    func monotoneIncreasingDigits(_ N: Int) -> Int {
        var valid = true
        var resultNumber = N

        while valid {
            let number = String(resultNumber)
            var digit: Int = 1
            var oldValue: Character = number.first!
            valid = false

            for (index, digitNumber) in number.enumerated() {
                if index < number.count && oldValue <= digitNumber {
                    oldValue = digitNumber
                } else {
                    for _ in 0..<number.count - index {
                        digit *= 10
                    }
                    valid = true
                    resultNumber = digit == 1 ? N : (N / digit) * digit - 1
                    break
                }
            }
        }
        return resultNumber
    }
}

let solution = Solution()
let result = solution.monotoneIncreasingDigits(4554333333451312314)
//Success

