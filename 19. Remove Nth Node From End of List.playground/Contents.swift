class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard head != nil else { return  nil } // head가 존재하지 않을때
        guard n >= 0 else { return head }

        var count = 1
        var current = head
        while current!.next != nil {
            current = current!.next
            count += 1
        }

        let index = count - n // index니깐 0 부터임.
        count = 0
        guard count != index else {
            if head!.next != nil {
                head!.val = head!.next!.val
                head!.next = head!.next!.next
                return head
            } else {
                return nil
            }
        }

        var prev: ListNode?
        current = head
        var next = head!.next

        while count != index {
            prev = current
            current = next
            next = next!.next
            count += 1
        }

        if next == nil {
            prev!.next = nil
        } else {
            prev!.next = next
        }

        return head
    }
}


public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 
