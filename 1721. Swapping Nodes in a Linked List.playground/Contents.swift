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
    var firstNode: ListNode?
    var secondNode: ListNode?

    func swapNodes(_ head: ListNode?, _ k: Int) -> ListNode? {
        recursive(head, 1)
    }

    func recursive(_ current: ListNode?, _ index: Int) -> Int {
        guard let current = current else { return index }

        let index = recursive(current.next, index + 1)
        index

    }
}
