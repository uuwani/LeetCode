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
    var value: Int!

    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard let root = root else { return nil }

        self.value = key
        let element = self.searchValue(root)
        if element.isFind {
            return element.node
        }

        return root
    }

    func searchValue(_ node: TreeNode?) -> (isFind: Bool, node: TreeNode?) {
        guard let node = node else { return (false, nil) }
        guard node.val != self.value else {
            if let rightNode = node.right {
                if let left = rightNode.left {
                    let lastNode = self.lastLeftNode(left)
                    lastNode.left = node.left
                } else {
                    rightNode.left = node.left
                }

                return (true, rightNode)
            } else if let leftNode = node.left {
                return (true, leftNode)
            } else {
                return (true, nil)
            }
        }

        let leftElement = self.searchValue(node.left)
        if leftElement.isFind {
            node.left = leftElement.node
        }
        
        let rightElement = self.searchValue(node.right)
        if rightElement.isFind {
            node.right = rightElement.node
        }

        return (false, nil)
    }

    func lastLeftNode(_ node: TreeNode) -> TreeNode {
        guard node.left != nil else {
            return node
        }

        let lastNode = self.lastLeftNode(node.left!)
        return lastNode
    }
}
