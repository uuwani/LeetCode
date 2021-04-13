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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        let root = TreeNode(preorder.first)

        var inorderDic: [Int:Int] = [:]
        inodrer.enumerated().forEach { (index, value)
            inorderDic[value] = index
        }

        var prevPosition: Int = inorderDic[root.val]!
        var currentNode = root
        var index = 1
        while index < preorder.count {
            
            let current = preorder[index]
            let position = inorderDic[current]!
            

            index += 1
        }

        return root
    }
}
