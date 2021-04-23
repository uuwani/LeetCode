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
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        _ = self.search(root, 0)

        return root
    }

    func search(_ node: TreeNode?, _ sum: Int) -> Int {
        guard let node = node else { return sum }

        let right = self.search(node.right, sum)
        node.val = right + node.val
        let left = self.search(node.left, node.val)

        return left
    }
}
