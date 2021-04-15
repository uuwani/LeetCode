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

    func longestUnivaluePath(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        let rootMax = self.search(root, root.val) - 1
        self.max = self.max < rootMax ? rootMax : self.max

        return self.max
    }

    func search(_ node: TreeNode?, _ previous: Int) -> Int {
        guard let node = node else { return 0 }

        let leftValue = search(node.left, node.val)
        let rightValue = search(node.right, node.val)
        let childValue = leftValue + rightValue

        self.max = self.max < childValue ? childValue : self.max

        return node.val == previous ? max(leftValue, rightValue) + 1 : 0
    }
}
