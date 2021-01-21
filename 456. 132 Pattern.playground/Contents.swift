class Solution {
    func find132pattern(_ nums: [Int]) -> Bool {
        guard nums.count >= 3 else { return false }
        var stack: [(second: Int, third: Int)] = []
        var thirdSet: Set<Int> = []

        let first = nums.first

        for secondIndex in 1..<nums.count - 1 {
            let second = nums[secondIndex]
            for thirdIndex in secondIndex + 1..<nums.count {
                let third = nums[thirdIndex]

                if thirdSet.contains(third) {
                   continue
                }
                thirdSet.insert(third)
                if first! < third && third < second {
                    return true
                } else {
                    for item in stack {
                        if item.second < third && third < item.third {
                            return true
                        }
                    }

                    if second < third && third - second > 1 {
                        stack.append((second, third))
                        stack.sort { (first, second) -> Bool in
                            first.third > second.third
                        }
                    }
                }
            }
            thirdSet.removeAll()
            stack.removeAll()
        }
        
        return false
    }
}

struct Information: Hashable {
    let second: Int

    let third: Int
}

let solution = Solution()
solution.find132pattern([26,26,26,26,36,36,36,36,36,36,36,16,16,16,16,16,16])
//solution.find132pattern([1,2,3,4])
//solution.find132pattern([-1,3,2,0])
//Fail
