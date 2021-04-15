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
    var max: Int = 0

    func maxProduct(_ root: TreeNode?) -> Int {
        let sum = self.totalSum(root)
        self.calculate(root, sum)

        return self.max % (1000000000 + 7)
    }

    func calculate(_ node: TreeNode?, _ total: Int) -> Int {
        guard let node = node else { return 0 }

        let value = self.calculate(node.left, total) + self.calculate(node.right, total) + node.val
        self.max = self.max < value * (total - value) ? value * (total - value) : max

        return value
    }

    func totalSum(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }

        return node.val + self.totalSum(node.left) + self.totalSum(node.right)
    }
}
