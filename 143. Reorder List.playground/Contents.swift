public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}



class Solution {
    func reorderList(_ head: ListNode?) {
        // var reverseHead: ListNode?
        var current: ListNode? = head
        var fastNode: ListNode? = head
        var slowNode: ListNode? = head

        // current?.next = head?.next?.next
        // current = current?.next
        // current?.next = head?.next?.next?.next?.next
        // print(slowNode?.next?.val)
        // print(fastNode?.next?.val)
        // print(current?.next?.val)
        // print(current?.next?.next?.val)

        while true {
            if fastNode?.next == nil || fastNode?.next === current {
                slowNode = slowNode?.next
                current?.next = fastNode
                fastNode = slowNode
                current = current?.next
                // fastNode 원점.
                // current = current?.next
                print(slowNode?.val)
                print(fastNode?.val)
                print(current?.val)
                // current?.next = slowNode
                // current?.next?.next = slowNode
                if slowNode?.next == nil { break }
                print("hello")
                
                // current?.next = slowNode
                // current = current?.next
                // current?.next = slowNode
                // slow = slow?.next
                // print(slowNode?.next?.val)
                // current?.next = slowNode?.next
                
            } else {
                fastNode = fastNode?.next
            }
        }
        

    }
}
