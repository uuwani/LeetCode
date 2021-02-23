public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var current = l1
        var l1Count = 0
        var l2Count = 0

        while current != nil {
            l1Count += 1
            current = current?.next
        }

        current = l2
        while current != nil {
            l2Count += 1
            current = current?.next
        }
        let newHead = ListNode()
        let list = l1Count >= l2Count ? add((l1, l1Count), (l2, l2Count)) : add((l2, l2Count), (l1, l1Count))

        if list!.val >= 10 {
            list!.val = list!.val - 10
            newHead.val = 1
            newHead.next = list
            return newHead
        }

        return list
    }

    func add(_ l1: (list: ListNode?, count: Int), _ l2: (list: ListNode?, count: Int)) -> ListNode? {
        guard l1.list != nil && l2.list != nil else { return ListNode() }

        if l1.count == l2.count {
            let list = add((l1.list?.next, l1.count - 1), (l2.list?.next, l2.count - 1))!
            let result = l1.list!.val + l2.list!.val + list.val / 10

            if list.val >= 10 {
                list.val = list.val - 10
            }
            l1.list!.val = result
            return l1.list
        } else {
            let list = add((l1.list?.next, l1.count - 1), (l2.list, l2.count))!
            let result = l1.list!.val + list.val / 10

            if list.val >= 10 {
                list.val = list.val - 10
            }
            l1.list!.val = result
            return l1.list
        }
    }
}
