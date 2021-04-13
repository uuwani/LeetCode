public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}
 
class Solution {
    func connect(_ root: Node?) -> Node? {
        guard let root = root else { return nil }

        var queue: [(level: Int, node: Node)] = [(0, root)]
        var prev: (level: Int, node: Node) = (-1, Node(-1))

        while !queue.isEmpty {
            let element = queue.popLast()!
            let node = element.node
            let level = element.level

            prev.node.next = prev.level == level ? node : nil
            prev = element

            if let left = node.left {
                queue.insert((level + 1, left), at: 0)
            }

            if let right = node.right {
                queue.insert((level + 1, right), at: 0)
            }
        }

        return root
    }
}

class Solution_ {
    func connect(_ root: Node?) -> Node? {

        var firstNode: Node? = root

        while firstNode != nil {
            var current: Node? = firstNode
            firstNode = nil

            var lastNode: Node? = nil
            while current != nil {
                let leftNode = current?.left
                let rightNode = current?.right

                if firstNode == nil {
                    firstNode = leftNode != nil ? leftNode : rightNode
                }

                lastNode?.next = leftNode != nil ? leftNode : rightNode
                leftNode?.next = rightNode
                let tempNode = rightNode != nil ? rightNode : leftNode
                lastNode = tempNode == nil ? lastNode : tempNode
                
                current = current?.next
            }
        }

        return root
    }
}
