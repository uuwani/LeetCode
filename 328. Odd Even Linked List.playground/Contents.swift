public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {

        let result = odd(head)

        var current = result.lhs
        while current?.next != nil {
            current = current?.next
        }
        current?.next = result.rhs

        return result.lhs
    }

    func odd(_ head: ListNode?) -> (lhs: ListNode?, rhs: ListNode?) {
        guard let slow = head else { return (nil, nil) }
        guard let fast = head?.next else { return (slow, nil) }

        let next = head?.next?.next

        let result = odd(next)
        slow.next = result.lhs
        fast.next = result.rhs

        return (slow, fast)
    }
}

class Solution2 {
    func oddEvenList(_ head: ListNode?) -> ListNode? {

        let evenHead = head?.next
        var odd = head
        var even = head?.next

        while even?.next != nil {
            odd?.next = even?.next
            odd = odd?.next
            even?.next = odd?.next
            even = even?.next
        }

        odd?.next = evenHead

        return head
    }
}
