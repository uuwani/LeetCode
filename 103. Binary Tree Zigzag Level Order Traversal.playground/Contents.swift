public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }

        var result: [[Int]] = []
        var queue: [(level: Int, node: TreeNode)] = [(0, root)]
        var stack: [Int] = []
        var prevLevel: Int = -1

        while !queue.isEmpty {
            let element = queue.popLast()!
            let node = element.node
            let level = element.level

            if prevLevel != level {
                result.append(level % 2 == 0 ? stack.reversed() : stack)
                stack = []
            }
            stack.append(node.val)

            prevLevel = level

            if let left = node.left {
                queue.insert((level + 1, left), at: 0)
            }

            if let right = node.right {
                queue.insert((level + 1, right), at: 0)
            }
        }

        result.append(result.count % 2 == 0 ? stack.reversed() : stack)
        result.removeFirst()
        return result
    }
}
