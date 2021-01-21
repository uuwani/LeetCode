/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public func isInteger() -> Bool
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     public func getInteger() -> Int
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public func setInteger(value: Int)
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public func add(elem: NestedInteger)
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     public func getList() -> [NestedInteger]
 * }
 */
class Solution {
    func deserialize(_ s: String) -> NestedInteger {
        // square brackets
        var stack: [NestedInteger] = []
        let squareBracketOpen: String.Element = "["
        let squareBracketClose: String.Element = "]"
        let comma: String.Element = ","
        var nestedInteger: NestedInteger = NestedInteger()
        var number: [String] = []

        for element in s {
            if element == squareBracketOpen {
                // [ 이거 나왔을 때 새로운 NestedInteger를 만들고 이전 NestedInteger를 넣는다.
                stack.append(nestedInteger)
                // print(nestedInteger.getInteger())
                nestedInteger = NestedInteger()
                // print(nestedInteger.getInteger())
                // print(stack.last!.getInteger())
                
                
                // if let tempNestedInteger = nestedInteger {
                //     stack.append(tempNestedInteger)
                //     nestedInteger = NestedInteger()
                // } else {
                //     nestedInteger = NestedInteger()
                // }
                
            } else if element == comma {
                // ,가 나왔을 때 숫자를 종료한다.
                let newNumber = number.joined()
                // print(newNumber)
                number = []
                nestedInteger.setInteger(Int(newNumber)!)
            } else if element == squareBracketClose {
                // ]가 나왔을 때 NestedInteger를 stack에 넣지 않고 stack의 상위 NestedInteger에 추가한다.
                if !number.isEmpty {
                    let newNumber = number.joined()
                    number = []
                    nestedInteger.setInteger(Int(newNumber)!)
                }
                
                
                if let last = stack.last {
                    // print(nestedInteger.isInteger())
                    // print(nestedInteger.getList())
                    let tempNestedInteger = stack.popLast()!
                    let value = tempNestedInteger.getInteger()
                    print(tempNestedInteger.getInteger())
                    print(nestedInteger.getInteger())
                    tempNestedInteger.add(nestedInteger)
                    tempNestedInteger.setInteger(value)
                    print(tempNestedInteger.getInteger())
                    print(tempNestedInteger.getList()[0].getInteger())
                    nestedInteger = tempNestedInteger
                }
            } else {
                // 숫자가 나왔을 때,
                // number.append(String(element))

                number.append(String(element))
                
                
                // if let nestedInteger = nestedInteger {
                //     number.append(String(element))
                // } else {
                //     nestedInteger = NestedInteger()
                //     number.append(String(element))
                // }
            }
        }

        if !number.isEmpty {
            print("!number.isEmpty")
            let newNumber = number.joined()
            nestedInteger.setInteger(Int(newNumber)!)
        }
        print("--------------------------")
        print(nestedInteger.getInteger())
        

        // nestedInteger = NestedInteger()
        // nestedInteger.setInteger(23)
        return nestedInteger
    }
}
