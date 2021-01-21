class Solution {
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        let resultS = getText(S)
        let resultT = getText(T)

        return resultS == resultT
    }

    func getText(_ text: String) -> String {
        var stack = Stack()

        for character in text {
            switch character {
            case "#":
                stack.pop()
            default:
                stack.push(element: character)
            }
        }

        return stack.description
    }
}

struct Stack {
    private var storage: [String.Element] = []

    mutating func push(element: String.Element) {
        self.storage.append(element)
    }

    mutating func pop() -> String.Element? {
        self.storage.popLast()
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        storage.map { "\($0)" }.reversed().joined()
    }
}

// Input: S = "ab##", T = "c#d#"
// Input: S = "a##c", T = "#a#c"
// Input: S = "a#c", T = "b"

let solution = Solution()
solution.backspaceCompare("ab#c", "ad#c")
solution.backspaceCompare("a##c", "#a#c")
solution.backspaceCompare("a#c", "b")

//Success

