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
    let dash = "-"

    func recoverFromPreorder(_ S: String) -> TreeNode? {
        var array = Array(S).map { String($0) }
        array.reverse()

        return self.recover(&array, 0).node
    }

    func recover(_ array: inout [String], _ level: Int) -> (node: TreeNode?, level: Int) {
        guard !array.isEmpty else { return (nil, level) }

        var numberText = ""
        while !array.isEmpty && array.last != self.dash {
            numberText += array.popLast()!
        }

        let number = Int(numberText)!
        let node = TreeNode(number)

        var dashCount = 0
        while array.last == self.dash {
            array.popLast()
            dashCount += 1
        }

        if dashCount > level {
            var element = recover(&array, level + 1)
            node.left = element.node

            guard !(element.level <= level) else { return (node, element.level) }

            element = recover(&array, level + 1)
            node.right = element.node

            return (node, element.level)
            
        } else {
            return (node, dashCount)
        }
    }
}
