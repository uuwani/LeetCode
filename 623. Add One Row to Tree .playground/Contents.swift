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
    var value: Int = 0

    func addOneRow(_ root: TreeNode?, _ val: Int, _ depth: Int) -> TreeNode? {
        self.value = val

        if depth > 1 {
            self.searchTree(root!, depth - 1)

            return root
        } else {
            return TreeNode(val, root, nil)
        }
    }

    func searchTree(_ node: TreeNode, _ depth: Int) {
        guard depth != 1 else {
                let leftNewNode = TreeNode(self.value)
                leftNewNode.left = node.left
                node.left = leftNewNode

                let rightNewNode = TreeNode(self.value)
                rightNewNode.right = node.right
                node.right = rightNewNode

            return
        }


        if let leftNode = node.left {
            self.searchTree(leftNode, depth - 1)
        }

        if let rightNode = node.right {
            self.searchTree(rightNode, depth - 1)
        }

        return
    }
}
