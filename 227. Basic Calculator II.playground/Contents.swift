class Solution {
    func calculate(_ s: String) -> Int {
        var stack: [String] = []
        var wait: String?
        var number = ""
        let s2 = s + "!"

        for element in s2 {
            let text = String(element)
            // print(stack)
            if text == " " { continue }

            if Int(text) != nil {
                // 숫자인 경우
                number = number + text
            } else {
                // 숫자가 아닌 경우
                // 합쳐진 수를 먼저 스택에 넣기.
                // print(number)
                var newNumber: String?

                if wait != nil {
                    // print(wait)
                    if wait == "*" {
                        newNumber = String(Int(stack.popLast()!)! * Int(number)!)
                    } else {
                        newNumber = String(Int(stack.popLast()!)! / Int(number)!)
                    }
                    wait = nil
                }

                // 1 * 2 * 3
                // print(text, newNumber, number)
                
                if newNumber != nil {
                    stack.append(newNumber!)
                } else {
                    stack.append(number)
                }

                number = ""

                if text == "*" || text == "/" {
                    wait = text
                } else if text == "!" {
                    break
                } else {
                    stack.append(text)
                }
            }
        }

        wait = nil
        // print(stack)
        
        let first = stack.first!
        var result = Int(first)!
        for index in 1..<stack.count {
            let element = stack[index]
            if Int(element) != nil {
                if wait != nil {
                    // print(element, wait, result)
                    if wait == "+" {
                        result = result + Int(element)!
                    } else {
                        result = result - Int(element)!
                    }
                    wait = nil
                }
            } else {
                wait = element
            }
        }
        return result
    }
}
