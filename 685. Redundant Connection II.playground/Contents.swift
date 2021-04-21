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
    func findRedundantDirectedConnection(_ edges: [[Int]]) -> [Int] {
        var childs: Set<Int> = []
        var parents: Set<Int> = []
        var result: [Int] = []

        for element in edges {
            let parent = element[0]
            let child = element[1]
            parents.insert(parent)
            result = childs.insert(child).inserted ? result : element
        }

        print(result)
        if result.isEmpty {
            var index = edges.count - 1
            while index >= 0 {
                let child = edges[index][1]
                let parent = edges[index][0]
                if parents.contains(child) && childs.contains(child) && parents.contains(parent) && childs.contains(parent) {
                    result = edges[index]
                    break
                }
                index -= 1
            }
        }

        return result
    }
}
