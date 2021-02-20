
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    var newHead: ListNode?

    func removeZeroSumSublists(_ head: ListNode?) -> ListNode? {
        var current: ListNode? = head
        var prev: ListNode?
        var tempCurrent: ListNode?
        var number: Int = 0
        var needReverse: Int = 0

        while current != nil {
            let next = current?.next

            if current!.val <= 0 { needReverse += 1 }

            if needReverse > 0 {
                current?.next = prev
                number = 0
                tempCurrent = current

                while current != nil {
                    number = number - current!.val
                    if number == 0 {
                        prev = current?.next
                        current = next
                        needReverse -= 1
                        break
                    }
                    current = current?.next
                }

                if number != 0 {
                    prev = tempCurrent
                    current = next
                }
            } else {
                current?.next = prev
                prev = current
                current = next
            }
        }
        
        current = prev
        prev = nil

        while current != nil {
            let next = current?.next
            current?.next = prev
            prev = current
            current = next
        }

        return prev
    }

}
