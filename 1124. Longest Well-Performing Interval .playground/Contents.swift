class Solution {
    func longestWPI(_ hours: [Int]) -> Int {
        var newHours: [Int] = []
        
        let myHours = hours.map { (item) -> Bool in
            return item > 8 ? true : false
        }
        
        guard !myHours.isEmpty else { return 0 }

        var oldValue = myHours.first!
        var number = oldValue ? 1 : -1
        let isFirstValueTrue = oldValue
        for index in 1..<myHours.count {
            let newValue = myHours[index]
            if oldValue != newValue {
                newHours.append(number)
                number = 0
            }
            number = number + (newValue ? 1 : -1)
            oldValue = myHours[index]
        }
        newHours.append(number)

        print(newHours)

        // isFirstValueTrue == true --> 시작이 + 짝수 단위로 계산
        // isFirstValueTrue == false --> 시작이 - 홀수 단위
        
        var maxLength = 0
        var totalLength = 0
        var calculate = 0

        for (index,item) in newHours.enumerated() {
            if isFirstValueTrue && index % 2 == 0 {
                
            } else if !isFirstValueTrue && index % 2 != 0 {
                
            }
        }

        return maxLength
    }
}

let solution = Solution()
print(solution.longestWPI([6,6,6,9,6,6,6,6,9,9,9,9,6,6,6,6,6,9]))

//Fail
