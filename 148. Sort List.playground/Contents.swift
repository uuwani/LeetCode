/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        var current: ListNode? = head?.next
        var newHead = head
        newHead?.next = nil
        var newTail = newHead

        while current != nil {
            // print(newHead?.val)
            // print(newHead?.next?.val)
            // print(newHead?.next?.next?.val)
            // print(newHead?.next?.next?.next?.val)
            // print(newHead?.next?.next?.next?.next?.val)
            // print("---------------------------")

            let next = current?.next
            if newHead!.val >= current!.val {
                // print("head")
                current?.next = newHead
                // newHead?.next = nil
                newHead = current
                current = next
            } else {
                if newTail!.val <= current!.val {
                    // print("tail")
                    newTail?.next = current
                    newTail = current
                    newTail?.next = nil
                } else {
                   // print("insert")
                    var node = newHead
                    var prev: ListNode?

                    while node != nil && node!.val < current!.val {
                        prev = node
                        node = node?.next
                    }
                    current?.next = node
                    prev?.next = current
                }
                current = next
            }
        }

        // print("--------끝------------")
        // current = newHead
        // while current != nil {
        //     print(current!.val)
        //     current = current?.next
        // }

        return newHead
    }
}

// sort 해야하네?
