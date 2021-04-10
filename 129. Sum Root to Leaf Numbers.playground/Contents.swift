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
    var sum: Int = 0

    func sumNumbers(_ root: TreeNode?) -> Int {
        self.sumOfLeaf(root, "")

        return self.sum
    }

    func sumOfLeaf(_ node: TreeNode?, _ number: String) -> Bool {
        guard let node = node else { return true }

        let currentNumber = number + String(node.val)
        let left = self.sumOfLeaf(node.left, currentNumber)
        let right = self.sumOfLeaf(node.right, currentNumber)

        if left && right {
            self.sum += Int(currentNumber)!
        }

        return false
    }
}
