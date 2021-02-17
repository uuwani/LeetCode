class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard k != 1 else  { return head }

        var tempHead: ListNode? = head
        var tempTail: ListNode? = head
        var newHead: ListNode?

        var prev: ListNode?
        var current = tempHead
        var index = 1

        while tempTail != nil || tempHead != nil {
            if index == k {
                if current?.val == tempTail?.val {
                    print("head 1")
                    print(tempHead?.val)
                    print(tempTail?.next?.val)
                    tempHead?.next = tempTail?.next
                    
                    current?.next = prev // tempTail 변함.
                    if newHead == nil { newHead = current }

                    prev = nil
                    current = tempHead?.next
                    tempTail = tempHead
                    index = 1
                    
                } else {
                    print("head 2")
                    let next = current?.next
                    current?.next = prev
                    prev = current
                    current = next
                }
            } else {
                print("tail")
                tempTail = tempTail?.next
                if tempTail == nil && index < k {
                    break
                }
                index += 1
            }
        }
        return newHead
    }
}
