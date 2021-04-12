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
    var result: [Int] = []

    func smallestFromLeaf(_ root: TreeNode?) -> String {
        guard let root = root else { return "" }

        self.search(root, [])

        var answer = ""
        while !self.result.isEmpty {
            let last = self.result.popLast()!
            answer += String(UnicodeScalar(last + 97)!)
        }
        return answer
    }

    func search(_ node: TreeNode?, _ current: [Int]) -> Bool {
        guard let node = node else { return true }

        let new = current + [node.val]
        let left = self.search(node.left, new)
        let right = self.search(node.right, new)

        if left && right {
            self.compare(new)
        }

        return false
    }

    func compare(_ current: [Int]) {
        guard !result.isEmpty else {
            self.result = current
            return
        }

        var result = self.result
        var tempCurrent = current

        while !result.isEmpty && !tempCurrent.isEmpty {
            let resultLast = result.popLast()!
            let currentLast = tempCurrent.popLast()!

            if resultLast != currentLast {
                if resultLast > currentLast {
                    self.result = current
                }
                return
            }
        }

        if self.result.count > current.count {
            self.result = current
        }
    }
}
