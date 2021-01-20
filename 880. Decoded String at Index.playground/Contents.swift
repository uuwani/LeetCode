class Solution {
    func decodeAtIndex(_ S: String, _ K: Int) -> String {
        // 숫자랑 문자를 구별해야함.
        var totalWord: [String] = []
        var stack: [String] = []
        var number: [String] = []
        var answer: String = ""
        let limit = 10

        // a --> 97 asciiValue
        // z --> 122 asciiValue

        for item in Array(S) {
            if 97 <= item.asciiValue! && 122 >= item.asciiValue! {
                if !number.isEmpty {
                    for item in number {
                        if Int(item)! * (stack.count + totalWord.count) > K {
                            totalWord += stack
                            let count = totalWord.count % K
                            
                            answer = count == 0 ? totalWord.last! : totalWord[count - 1]
                            return answer
                        }

                        var temp = totalWord + stack
                        for _ in 1..<Int(item)! {
                            totalWord += temp
                        }
                    }

//                    if repeatNumber! * totalWord.count > K {
//                        let count = totalWord.count % K
//
//                        answer = count == 0 ? totalWord.last! : totalWord[count - 1]
//                        return answer
//                    }

                    

                    stack.removeAll()
                    number.removeAll()
                }
                stack.append(String(item))
                // 이거는 문자.
            } else {
                number.append(String(item))
                if number.count > limit {
                    break
                }
                // 이거는 숫자.
            }
        }

        if !number.isEmpty {
            
            let repeatNumber = Int(number.joined())
            totalWord += stack
            print(totalWord)

            if repeatNumber! * totalWord.count > K {
                let count = K % totalWord.count
                answer = count == 0 ? totalWord.last! : totalWord[count - 1]
            }
        }

        return answer
    }
}

/*"leet2code3"
 10*/

let solution = Solution()
print(solution.decodeAtIndex("leet2code3", 10))
