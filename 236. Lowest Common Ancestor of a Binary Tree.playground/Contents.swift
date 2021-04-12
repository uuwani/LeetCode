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
    var result: TreeNode?

    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        _ = search(root, p, q)
        return result
    }

    func search(_ node: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> (p: TreeNode?, q: TreeNode?) {
        guard !(p == nil && q == nil) else { return (nil, nil) }
        guard let node = node else { return (p, q) }

        let newP = p == nil ? nil : (node.val == p!.val ? nil : p)
        let newQ = q == nil ? nil : (node.val == q!.val ? nil : q)

        let left = self.search(node.left, newP, newQ)
        if left.p == nil && left.q == nil && p != nil && q != nil {
            self.result = self.result == nil ? node : self.result
            return (nil, nil)
        }
        
        let right = self.search(node.right, left.p, left.q)
        if right.p == nil && right.q == nil && p != nil && q != nil {
            self.result = self.result == nil ? node : self.result
            return (nil, nil)
        }

        return (right.p, right.q)
    }
}
