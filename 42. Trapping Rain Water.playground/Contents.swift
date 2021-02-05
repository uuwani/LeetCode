class Solution {
    func trap(_ height: [Int]) -> Int {
        guard !height.isEmpty else { return 0 }
        
        let index = height.firstIndex { $0 != 0 }
        guard let firstIndex = index else { return 0 }

        var max: (height: Int, index: Int) = (height[firstIndex], firstIndex)
        var output: Int = 0
        
        while(max.index < height.count && max.height > 0) {
            var stack: [Int] = []
            for index in (max.index + 1)..<height.count {
                if max.height <= height[index] {
                    while !stack.isEmpty {
                        output = output + (max.height - stack.popLast()!)
                    }
                    max = (height[index], index)
                } else {
                    stack.append(height[index])
                }
            }
            max = (max.height - 1, max.index)
        }

        return output
    }
}

let solution = Solution()
solution.trap([0,1,0,2,1,0,1,3,2,1,2,1])
