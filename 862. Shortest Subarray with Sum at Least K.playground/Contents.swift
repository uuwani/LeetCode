class Solution {
    var minLength: Int!

    var number: Int!

    func shortestSubarray(_ A: [Int], _ K: Int) -> Int {
        self.minLength = A.count + 1
        self.number = K
        var stack: [Int] = []
        var notZero = 0
        var isNotZero = false

        for element in A {
            notZero += element
            notZero = notZero > 0 ? notZero : 0
            if notZero > 0 {
                stack.append(element)
            } else {
                stack = []
            }

            if notZero >= self.number {
                if isNotZero {
                    print("hhhhellllo", element)
                    let (newStack, sum) = check(notZero, stack)
                    stack = newStack
                    notZero = sum
                    print(stack, notZero)
                } else {
                    print("Hey", element)
                    let (newStack, sum) = check1(stack)
                    stack = newStack
                    notZero = sum
                    print(stack, notZero)
                }
                isNotZero = true
            } else {
                isNotZero = false
            }
        }
        
        return self.minLength == A.count + 1 ? -1 : self.minLength
    }

    func check(_ notZero: Int, _ stack: [Int]) -> ([Int], Int) {
        var stack = stack
        var sum = notZero

        while !stack.isEmpty {
            let first = stack.first!
            if sum - first < self.number {
                break
            }
            sum -= first
            stack.removeFirst()
        }

        if stack.count < self.minLength {
            self.minLength = stack.count
        }

        return (stack, sum)
    }

    func check1(_ stack: [Int]) -> ([Int], Int) {
        var stack = stack
        var length = 0
        var result: [Int] = []
        var sum = 0
        while !stack.isEmpty {
            let last = stack.popLast()!
            result.append(last)
            sum += last
            length += 1
            if sum >= self.number {
                if length < self.minLength {
                    self.minLength = length
                }
                break
            }
        }

        return (result.reversed(), sum)
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
