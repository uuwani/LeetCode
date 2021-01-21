class Solution {
    func maxNumber(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [Int] {
        var count = (nums1.count + nums2.count) - k

        var stack_1: [Int] = []
        var stack_2: [Int] = []

        var temp_nums1 = nums1
        var temp_nums2 = nums2

        while count > 0 {
            let tempLast1 = temp_nums1.popLast()
            let tempLast2 = temp_nums2.popLast()

            if tempLast1 == nil && tempLast2 == nil { break }

            if let stackLast1 = stack_1.last {
                if tempLast1! > stackLast1 {
                    stack_1.append(tempLast1!)
                } else {
                    count -= 1
                }
            }

            if let stackLast2 = stack_2.last {
                if tempLast2! > stackLast2 {
                    stack_2.append(tempLast2!)
                } else {
                    count -= 1
                }
            }
        }

        while let number = temp_nums1.popLast() {
            stack_1.append(number)
        }

        while let number = temp_nums2.popLast() {
            temp_nums2.append(number)
        }

        return []
    }
}

var nums1 = [3, 4, 6, 5]
var nums2 = [9, 1, 2, 5, 8, 3]
var k = 5

let solution = Solution()
print(solution.maxNumber(nums1, nums2, k))
//Fail

