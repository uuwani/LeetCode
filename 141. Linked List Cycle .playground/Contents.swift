
public class ListNode {
    public var val: Int
    public var next: ListNode?

    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
 

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var current: ListNode? = head
        var prev: ListNode?

        while current != nil {
            let next = current?.next
            current?.next = prev
            prev = current
            current = next

            if current === head {
                return true
            }
        }

        return false
    }
}

