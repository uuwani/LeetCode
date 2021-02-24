public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    var standard: Int!

    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        guard head != nil else { return nil }

        var current = head
        var number = 0
        while current != nil {
            current = current?.next
            number += 1
        }
        print("총 수: \(number)")

        return recursive(head, number)
    }

    func recursive(_ head: ListNode?, _ number: Int) -> (TreeNode?) {
        if number == 1 {
            // print("마지막: \(head!.val)")
            return TreeNode(head!.val)
        }
        if number == 2 {
            // print("마지막 둘: \(head!.val), \(head!.next!.val)")
            let root = TreeNode(head!.next!.val)
            root.left = TreeNode(head!.val)
            return root
        }

        var candidate: TreeNode? // 후보 루트
        let standard = (number / 2) + (number % 2) // 기준
        var index = 1 // 인덱스 계산
        var current = head
        var second: ListNode? // 해더

        while true {
            let next = current?.next
            if standard - 1 == index {
                // print("standard: \(standard)")
                current?.next = nil
                candidate = TreeNode(next!.val)
                second = next?.next
                break
            }
            
            current = next
            index += 1
        }

        candidate!.left = recursive(head, index)
        candidate!.right = recursive(second, number - index - 1)
        return candidate
    }
}
// 오름차순으로 정렬된 노드를 제공
// 몇개인지 파악이 안됨.
// 숫자의 폭으로는 확인 불가.
