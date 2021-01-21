class Solution {
    func sumSubarrayMins(_ arr: [Int]) -> Int {
        let moduloNumber = 1000000000 + 7
        var mininumSum = 0

        var resultArray: [Element] = []
        var stack: [Element] = [Element(number: arr[0], count: 1)]
        var oldElement: Element = Element(number: 0, count: 0)


        for index in 1..<arr.count {
            var element = Element(number: arr[index], count: 1)
            
            while var last = stack.last {
                if last.number >= element.number {
                    stack.popLast()
                    
                    last.outValue = last.count * oldElement.count + last.count
                    last.count = last.count + oldElement.count

                    if stack.isEmpty {
                        element.count = element.count + last.count
                    }

                    resultArray.append(last)
                    oldElement = last
                } else {
                    element.count = element.count + oldElement.count
                    break
                }
            }
            
            stack.append(element)
            oldElement = Element(number: 0, count: 0)
        }

        oldElement = Element(number: 0, count: 0)
        while !stack.isEmpty {
            var last = stack.popLast()!

            last.outValue = oldElement.count * last.count + last.count
            last.count = last.count + oldElement.count
            
            oldElement = last
            resultArray.append(last)
            
        }

        for item in resultArray {
            mininumSum += (item.outValue * item.number)
        }
        
        return mininumSum % moduloNumber
     }
}

struct Element {
    let number: Int

    var count: Int

    var outValue: Int = 0
}

let solution = Solution()
print(solution.sumSubarrayMins([36,84,26,57,2,75,34,5,29,25]))

//MARK: - Version1

class Solution2 {
    func sumSubarrayMins(_ arr: [Int]) -> Int {
        let moduloNumber = 1000000000 + 7
        var mininumSum = 0
        var newArray = arr

        while !newArray.isEmpty {
            var oldValue: Int?
            var tempArray: [Int] = []
            for index in 0..<newArray.count {
                mininumSum += newArray[index]
                if index < newArray.count - 1 {
                    let mininum = min(newArray[index], newArray[index + 1])
                    mininumSum += mininum

                    if let value = oldValue {
                        tempArray.append(value >= mininum ? mininum : value)
                    }
                    oldValue = mininum
                }
            }
            newArray = tempArray
        }

        return mininumSum % moduloNumber
    }
}

//MARK: - Version2

class Solution3 {
    func sumSubarrayMins(_ arr: [Int]) -> Int {
        let moduloNumber = 1000000000 + 7
        var mininumSum = 0
        var newArray = arr

        while !newArray.isEmpty {
            var tempArray: [Int] = []
            for index in 0..<newArray.count {
                mininumSum += newArray[index]
                if index < newArray.count - 1 {
                    let mininum = min(newArray[index], newArray[index + 1])
                    tempArray.append(mininum)
                }
            }
            newArray = tempArray
        }

        return mininumSum % moduloNumber
    }
}

