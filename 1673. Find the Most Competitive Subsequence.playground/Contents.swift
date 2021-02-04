class Solution {
    func mostCompetitive(_ nums: [Int], _ k: Int) -> [Int] {
        var stack: [Int] = []

        for index in 0..<nums.count {
            while let lastNumber = stack.last, lastNumber > nums[index] {
                if stack.count + (nums.count - 1 - index) < k { break }
                stack.popLast()
            }

            stack.append(nums[index])
        }

        while stack.count != k {
            stack.popLast()
        }

        return stack
    }
}
