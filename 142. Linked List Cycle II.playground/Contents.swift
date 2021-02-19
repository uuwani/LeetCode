
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        
    }
}
 

class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return }

        var current: ListNode? = head
        var prev: ListNode?
        var result: ListNode?
        var newHead: ListNode = ListNode(head?.val)
        var reverseNode: ListNode? = newHead


        while true {
            let next = current?.next

            reverseNode?.next = prev
            prev = current
            current = next

            if current === head { break }
            if current == nil { break }
        }

        print(head?.next?.next?.val)

        print(prev?.val)
        return prev
    }
}

// list내부의 전체 수 알 수 없음.
// 이걸 아는 방법은 처음부터 끝까지 도달하는 것.
// 싸이클. 그러면 끝이 없다는것.
// 같은것이 나오는걸 판단해서 나오면 cycle이 있다고 생각해야함.
// index
