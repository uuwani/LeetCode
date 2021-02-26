public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func nextLargerNodes(_ head: ListNode?) -> [Int] {

        recursive(head)

        var current = head
        var result: [Int] = []
        while current != nil {
            result.append(current!.val)
            current = current?.next
        }

        return result
    }

    func recursive(_ head: ListNode?) -> [Int] {
        guard let head = head else { return [0] }

        var stack = recursive(head.next)

        if head.val < stack.last! {
            let last = stack.last!
            stack.append(head.val)
            head.val = last
        } else {
            while let last = stack.last, last <= head.val {
                stack.popLast()
            }

            if !stack.isEmpty {
                let last = stack.last!
                stack.append(head.val)
                head.val = last
            } else {
                stack.append(head.val)
                head.val = 0
            }
        }

        return stack
    }
}
