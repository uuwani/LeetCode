public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        let head: ListNode? = ListNode()
        var lists = lists.compactMap { $0 }
        var next = head
        lists.sort(by: { $0.val > $1.val })


        while !lists.isEmpty {
            let last = lists.popLast()!
            next?.next = last
            next = last
            
            if last.next != nil {
                if lists.count > 0 {
                    let index = search(lists, last.next!)
                    if index == -1 {
                        lists.append(last.next!)
                    } else {
                        lists.insert(last.next!, at: index)
                    }
                } else {
                    lists.append(last.next!)
                }
            }
        }

        return head?.next
    }

    func search(_ lists: [ListNode?], _ node: ListNode) -> Int {
        let index = lists.firstIndex { (listNode) -> Bool in
            listNode!.val <= node.val
        }

        guard index != nil else { return -1 }
        return index!
    }
}
