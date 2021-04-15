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
    func isValidBST(_ root: TreeNode?) -> Bool {
        var array: [Int] = []
        return search(root, &array)
    }

    func search(_ node: TreeNode?, _ numbers: inout [Int]) -> Bool {
        guard let node = node else { return true }

        guard self.search(node.left, &numbers) else { return false }
        if let last = numbers.last, last >= node.val {
            return false
        }
        numbers.append(node.val)
        guard self.search(node.right, &numbers) else { return false }

        return true
    }
}
