public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        guard let slow = head else { return nil }
        guard let fast = head?.next else { return slow }

        let next = fast.next

        fast.next = slow
        slow.next = nil

        let newNode = swapPairs(next)
        return merge(fast, newNode)
    }

    func merge(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        l1?.next?.next = l2
        return l1
    }
}


let head = ListNode()
let solution = Solution()
solution.swapPairs(head)
