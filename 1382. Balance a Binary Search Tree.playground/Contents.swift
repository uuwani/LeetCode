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
    func balanceBST(_ root: TreeNode?) -> TreeNode? {
        let total = self.search(root, [])
        
        return build(total, 0, total.count - 1)
    }

    func search(_ node: TreeNode?, _ total: [Int]) -> [Int] {
        guard let node = node else { return total }

        let left = self.search(node.left, total)
        let current = left + [node.val]
        let right = self.search(node.right, current)

        return right
    }

    func build(_ values: [Int], _ start: Int, _ end: Int) -> TreeNode? {
        guard start <= end else { return nil }

        let center = start + (end - start) / 2
        let node = TreeNode(values[center])

        node.left = build(values, start, center - 1)
        node.right = build(values, center + 1, end)

        return node
    }
}
