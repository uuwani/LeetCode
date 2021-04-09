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
    var lastNode: TreeNode?

    func flatten(_ root: TreeNode?) {
        self.search(root)
    }

    func search(_ node: TreeNode?) -> (node: TreeNode?, last: TreeNode?) {
        guard let node = node else { return (nil, nil) }

        let result = self.search(node.left)
        let leftNode = result.node
        let last = result.last
        let rightNode = self.search(node.right).node
    }
}
