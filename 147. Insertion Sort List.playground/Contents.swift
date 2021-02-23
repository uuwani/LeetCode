public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        var current = head
        let newHead: ListNode? = ListNode()

        while current != nil {
            let next = current?.next

            var prev = newHead
            while prev?.next != nil && prev!.next!.val < current!.val {
                prev = prev?.next
            }
            current?.next = prev?.next
            prev?.next = current

            current = next
        }

        return newHead?.next
    }
}
