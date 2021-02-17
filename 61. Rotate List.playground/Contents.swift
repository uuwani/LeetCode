class Solution {
    var head: ListNode?

    var tail: ListNode?

    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        var current: ListNode? = head
        var count = 1
        while current?.next != nil {
            count += 1
            current = current?.next
        }
        self.tail = current

        let position = k % count == 0 ? count : k % count
        var index = count

        current = head
        var prev: ListNode?
        while index > position {
            prev = current
            current = current?.next
            index -= 1
        }

        if prev != nil {
            prev?.next = nil
        }

        var newHead = current

        if head === newHead {
            
        } else if tail === newHead {
            newHead?.next = head
        } else {
            tail?.next = head
        }

        return newHead
    }
}
