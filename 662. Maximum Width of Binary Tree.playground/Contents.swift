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
    var maxLength: Int = 0

    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var queue: [(node: TreeNode, number: Int)] = [(root, 1)]

        self.search(queue)

        return maxLength
    }

    func search(_ queue: [(node: TreeNode, number: Int)]) {
        guard !queue.isEmpty else { return }

        let first = queue.first!
        let last = queue.last!

        let currentLength = (first.number == last.number ? 1 : last.number &- first.number + 1)
        self.maxLength = (self.maxLength < currentLength ? currentLength : self.maxLength)

        var temp: [(node: TreeNode, number: Int)] = []
        queue.forEach {
            let number = $0.number

            if let left = $0.node.left {
                temp.append((left, number &* 2))
            }

            if let right = $0.node.right {
                temp.append((right, number &* 2 + 1))
            }
        }

        self.search(temp)
    }
}
