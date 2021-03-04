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
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var queue: [TreeNode] = [root]
        var tempQueue: [TreeNode] = []
        var result: [Int] = [root.val]

        while true {
            if queue.isEmpty {
                if tempQueue.isEmpty {
                    break
                } else {
                    let lastNode = tempQueue.last!
                    result.append(lastNode.val)

                    queue = queue + tempQueue
                    tempQueue = []
                }
            } else {
                let treeNode = queue.removeFirst()
                if let left = treeNode.left { tempQueue.append(left)}
                if let right = treeNode.right { tempQueue.append(right)}
            }
        }

        return result
    }
}
