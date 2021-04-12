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
    var paths: Int = 0

    var targetSum: Int = 0

    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
        self.targetSum = targetSum
        self.search(root, [], 0)

        return self.paths
    }

    func search(_ node: TreeNode?, _ search: [Int], _ sum: Int) {
        guard let node = node else { return }

        var new = [node.val] + search
        var newSum = node.val + sum

        self.search(node.left, new, newSum)
        self.search(node.right, new, newSum)

        while !new.isEmpty {
            if newSum == self.targetSum {
                self.paths += 1
            }

            let last = new.popLast()!
            newSum -= last
        }
    }
}
