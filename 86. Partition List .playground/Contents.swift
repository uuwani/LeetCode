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
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var current: ListNode? = head
        var firstTail: ListNode? = ListNode()
        var lastTail: ListNode?

        while current != nil {
            // print(current!.val)
            let next = current?.next
            if current!.val < x {
                print(current!.val)
                firstTail?.next = current
                firstTail = firstTail?.next
                firstTail?.next = lastTail
            } else {
                print(current!.val)
                if lastTail != nil {
                    lastTail?.next = current
                    lastTail = lastTail?.next
                } else {
                    lastTail = current
                    firstTail?.next = lastTail
                }
            }

            current = next
        }

        current = head

        while current != nil {
            print(current!.val)
            current = current?.next
        }

        return nil
    }
}

// 나보다 작은거는 전부다 나 아래로 단 순서를 지켜서.
// 나보다 큰건 최초 순서를 지켜서
// 나보다 작은애들 모아놓는 리스트
// 나보다 큰애들 모아놓는 리스트 이렇게 두개 만들어서 연결하면 될듯?
//
