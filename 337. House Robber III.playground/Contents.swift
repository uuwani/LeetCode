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
    func rob(_ root: TreeNode?) -> Int {
        self.search(root, true, 0).money
    }

    func search(_ node: TreeNode?, _ canRob: Bool, _ parentValue: Int) -> (money: Int, canRob: Bool) {
        guard let node = node else { return (0, true) }
        guard !(node.left == nil && node.right == nil) else {
            // print("hey",canRob, node.val)
            return (canRob ? node.val : 0, !canRob)
        }

        var total = parentValue
        if let left = node.left {
            total += left.val
        }

        if let right = node.right {
            total += right.val
        }

        var isRobbing = canRob ? (node.val > total ? true : false) : false
        // print(isRobbing, node.val)
        // print("------left, right 전-------")
        let left = self.search(node.left, !isRobbing, node.val)
        let right = self.search(node.right, !isRobbing, node.val)
        isRobbing = left.canRob && right.canRob
        // print(isRobbing, node.val)

        return (left.money + right.money + (isRobbing ? node.val : 0), !isRobbing)
    }
}
