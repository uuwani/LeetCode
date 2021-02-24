public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

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
    var head: ListNode?

    func isSubPath(_ head: ListNode?, _ root: TreeNode?) -> Bool {
        self.head = head

        return recursive(head, root)
    }

    func recursive(_ head: ListNode?, _ root: TreeNode?) -> Bool {
        guard let head = head else { return true }
        guard let root = root else { return false }

        if head.val == root.val {
            if self.head!.val == root.val {
                if recursive(self.head?.next, root.left) {
                    return true
                } else {
                    return recursive(self.head?.next, root.right)
                }
            } else {
               if recursive(head.next, root.left) {
                   return true
               } else {
                   return recursive(head.next, root.right)
               }
            }
        } else {
            if self.head!.val == root.val {
               if recursive(self.head?.next, root.left) {
                    return true
                } else {
                   return recursive(self.head?.next, root.right)
                }
            } else {
                if recursive(self.head, root.left) {
                    return true
                } else {
                   return recursive(self.head, root.right)
                }
            }
        }
    }
}
//
