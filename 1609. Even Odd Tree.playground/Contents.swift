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
    func isEvenOddTree(_ root: TreeNode?) -> Bool {
        guard let root = root else { return false }

        var queue: [(level: Int, node: TreeNode)] = []
        queue.append((0, root))
        var prevValue = 0
        var prevLevel = -1
        var result: Bool = true

        while !queue.isEmpty {
            let element = queue.popLast()!
            prevValue = prevLevel == element.level ? prevValue : 0
            prevLevel = element.level

            let value = element.node.val
            switch element.level % 2 {
                case 0:
                if value % 2 == 0  || (prevValue != 0 && prevValue >= value) { return false }
                case 1:
                if value % 2 == 1 || (prevValue != 0 && prevValue <= value) { return false }
                default:
                break
            }

            prevValue = value

            if let left = element.node.left {
                queue.insert((element.level + 1, left), at:0)
            }

            if let right = element.node.right {
                queue.insert((element.level + 1, right), at:0)
            }
        }

        return true
    }
}
