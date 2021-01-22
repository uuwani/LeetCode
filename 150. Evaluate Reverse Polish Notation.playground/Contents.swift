class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack: [Int] = []

        for element in tokens {
            if let number = Int(String(element)) {
                stack.append(number)
            } else {
                let second = stack.popLast()!
                let first = stack.popLast()!
                
                switch element {
                case "+":
                    stack.append(first + second)
                case "-":
                    stack.append(first - second)
                case "*":
                    stack.append(first * second)
                case "/":
                    stack.append(first / second)
                default:
                    break
                }
            }
        }

        return stack.popLast()!
    }
}
