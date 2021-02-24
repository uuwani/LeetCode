public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func numComponents(_ head: ListNode?, _ G: [Int]) -> Int {
        var dictionary: [Int: Int] = [:]
        G.forEach { dictionary[$0] = $0 }

        var current = head
        var count = 0
        var isContinuous = false

        while current != nil {
            if let number = dictionary[current!.val] {
                isContinuous = true
            } else {
                count = isContinuous ? count + 1 : count
                isContinuous = false
            }

            current = current?.next
        }

        count = isContinuous ? count + 1 : count

        return count
    }
}
