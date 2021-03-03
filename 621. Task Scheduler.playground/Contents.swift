class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var queue: [Int] = []

        prev = tasks[0]
        for index in 1..<tasks.count {
            var current = tasks[index]

            if current == prev {
                queue.append(n)
            } else {
                let value = queue.removeFirst()
                queue.append(value - 1)
            }

            prev = current
        }
    }
}

// n이 주어지면 같은 테스크 사이에서 그 시간만큼은 쉬어야함.
// 어렵네
// 같은 것끼리는 간격을 유지한다. n만큼
// BBB --> + n + n 같은 것이 안나오면 + n
// BA ---> + (n - 1)

// BA 1 BA 1 BA
