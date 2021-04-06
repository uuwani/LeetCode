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


class BSTIterator {
    var nodes: [Int] = []

    init(_ root: TreeNode?) {
        var queue: [TreeNode] = []
        queue.append(root!)

        while !queue.isEmpty {
            let node = queue.removeFirst()
            self.nodes.append(node.val)

            if let left = node.left {
                queue.append(left)
            }

            if let right = node.right {
                queue.append(right)
            }
        }
        nodes.sort(by: >)
    }
    
    func next() -> Int {
        return self.nodes.popLast()!
    }
    
    func hasNext() -> Bool {
        return !self.nodes.isEmpty
    }
}
