class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

        var l1: ListNode? = l1
        var l2: ListNode? = l2

        var node: ListNode? = ListNode()
        var headNode = node
        var digit = 0

        while l1 != nil || l2 != nil || digit > 0 {
            let result = (l1?.val ?? 0 ) + (l2?.val ?? 0 ) + digit
            let value = result % 10
            digit = result / 10
            
            node?.next = ListNode(value)
            node = node?.next

            l1 = l1?.next
            l2 = l2?.next
        }

        return headNode?.next
    }
}
