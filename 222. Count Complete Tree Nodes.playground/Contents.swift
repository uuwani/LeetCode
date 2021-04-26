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
    func countNodes(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        return self.countNodes(root.left) + self.countNodes(root.right) + 1
    }
}

class Solution1 {
    func countNodes(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        var queue: [TreeNode] = []
        var total: Int = 0

        queue.append(root)

        while !queue.isEmpty {
            let last = queue.popLast()!

            total += 1

            if let left = last.left {
                queue.insert(left, at: 0)
            }

            if let right = last.right {
                queue.insert(right, at: 0)
            }
        }

        return total
    }
}
