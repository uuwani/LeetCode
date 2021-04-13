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
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        
        return self.search(root, [], targetSum)
    }

    func search(_ node: TreeNode?, _ path: [Int], _ last: Int) -> [[Int]] {
        guard let node = node else { return [] }
        guard !(node.left == nil && node.right == nil) else {
            return last - node.val == 0 ? [path + [node.val]] : []
        }

        let leftPath = self.search(node.left, path + [node.val], last - node.val)
        let rightPath = self.search(node.right, path + [node.val], last - node.val)

        return leftPath + rightPath
    }
}
