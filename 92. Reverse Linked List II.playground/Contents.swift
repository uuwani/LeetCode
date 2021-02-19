public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        var nearNode: ListNode?
        var farNode: ListNode? = head
        var current: ListNode? = head
        var farNodeNext: ListNode?
        var index = 1

        while index != n {
            farNode = farNode?.next
            index += 1
        }

        index = 1

        while index != n {
            let next = current?.next
            index += 1

            if index == m {
                nearNode = next
                current?.next = farNode
                farNodeNext = farNode?.next
                farNode?.next = next?.next
            }

            if index == n {
                nearNode?.next = farNodeNext
                print(nearNode)
                current?.next = nearNode
                break
            }

            current = next
        }

        return head
    }
}
