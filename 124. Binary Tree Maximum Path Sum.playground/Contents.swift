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
    var tempMax = Int.min

    func maxPathSum(_ root: TreeNode?) -> Int {
        let _ = self.findMax(root)

        return tempMax
    }

    func findMax(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }

        let leftPath = findMax(node.left) + node.val
        let rightPath = findMax(node.right) + node.val
        let path = leftPath + rightPath - node.val

        let nextPath = max(leftPath, rightPath, node.val)
        self.tempMax = max(self.tempMax, path, nextPath)
        
        return nextPath
    }
}
