public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func splitListToParts(_ root: ListNode?, _ k: Int) -> [ListNode?] {
        var current = root
        var count: Int = 0
        var list: [Int] = []

        while current != nil {
            current = current?.next
            count += 1
        }

        let base = count / k
        var plus = count % k

        count = 0
        while count < k {
            list.append(base + (plus > 0 ? 1 : 0))
            plus -= 1
            count += 1
        }

        current = root
        let result = list.map { number -> ListNode? in
            var index = 0
            var head = current
            while number != 0 {
                let next = current?.next
                index += 1
                if index == number {
                    current?.next = nil
                    current = next
                    break
                }
                current = next
            }
            
            return head
        }

        return result
    }
}

