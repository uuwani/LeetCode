class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return nil } // head가 존재하지 않는다면?
        guard head!.next != nil else { return head! } // next가 존재하지 않는다면?

        var current: ListNode? = head!
        var next: ListNode? = head!.next
        var prev: ListNode?
        var newHead: ListNode?
        var isDeleteMode = false


        while(next != nil) {
            if current!.val == next!.val {
                isDeleteMode = true
            } else {
                if isDeleteMode {
                    if prev != nil {
                        prev!.next = next
                    } else {
                        newHead = next
                    }
                    isDeleteMode = false
                } else {
                    prev = current
                }
            }
            current = next
            next = current!.next
        }

        if isDeleteMode {
            if prev != nil {
                prev!.next = nil
            } else {
                return nil
            }
        }

        return newHead != nil ? newHead : head
    }
}

public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }
