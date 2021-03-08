class Solution {
    var minLength: Int!

    var number: Int!

    func shortestSubarray(_ A: [Int], _ K: Int) -> Int {
        self.minLength = A.count + 1
        self.number = K
        var queue: [Int] = []
        var head: ListNode = ListNode()
        var current: ListNode? = head

        for element in A {
            current?.next = ListNode(element)
            current = current?.next
        }

        check(head.next!.val, 1, head.next!)
        
        return self.minLength == A.count + 1 ? -1 : self.minLength
    }

    func check(_ sum: Int, _ length: Int, _ current: ListNode) {
        // K을 넘으면 바로 아웃. --> K를 넘더라도 나중에 다시 회복될 여지가 있긴함 이건 우짬?
        // 최상위 min값을 넘어도 아웃. --> 이건 더이상 볼 필요 없음.
        // 아웃되면 -1을 뱉어내고 퇴장.
        // 우짜지???

        if length >= self.minLength {
            guard let next = current.next else { return }
            check(next.val, 1, next)

        } else {
            if sum >= number {
                self.minLength = self.minLength > length ? length : self.minLength
            }
            guard let next = current.next else { return }
            check(sum + next.val, length + 1, next)
            check(next.val, 1, next)
        }

        return
    }

    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
}


// 가장 원시적인 방법을 먼저 생각해보자.
// 거기서 가지를 쳐낼 수 있는 방법을 생각해보자.
// 가장 짧은, 비어있지 않은 연속된 subarray A
// 다 더했을 때, 제일 작은
// 연속된.
// 가장 짧은 어떻게든 버리는게 이득
// k보다 sum이 작다면? -- queue에 보관. sum +=
// k보다 sum이 크다면? -- 정답이 될 가능성이 떨어짐. 가능성이 있기때문에 유지해야함. 버리면 안됨.
// k와 sum이 일치한다면? -- queue
// 길이는 queue의 count로 계산
// 영향력의 길이가 너무 길다.


// 어디서부터 시작하느냐에 따라서 다양한 경우의 수가 나옴.
// 2 -1 2 1 -4
// 어떻게 생각해? 이거 맞나?
// 2라는 숫자가 저걸 생각할 수 있어야하는데 잘 모르겠다.
// 3을 넘으면 나오면 됨.
// 없으면 -1을 배출하면 됨.
