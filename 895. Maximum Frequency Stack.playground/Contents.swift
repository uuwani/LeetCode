class FreqStack {
    var stackDictionary: [Int:Int] = [:]

    var stack: [Int] = []
    
    init() {
        
    }
    
    func push(_ x: Int) {
        if let value = self.stackDictionary[x] {
            self.stackDictionary[x] = value + 1
        } else {
            self.stackDictionary[x] = 1
        }
        self.stack.append(x)
        // 스택에 추가.
        // 딕셔너리에 보관.
        // 같은 빈도수를 가졌을때 어떤식으로 처리하지?
        // 빈도수가 동일할 때 보장을 안해줌.
    }
    
    func pop() -> Int {

        let max = stackDictionary.max { (lhs, rhs) -> Bool in
            return lhs.value < rhs.value
        }

        if let maxNumber = max {
            let filteredDictionary = stackDictionary.filter { $0.value == maxNumber.value }
            filteredDictionary.keys
            var count = self.stack.count // index
            while count > 0 {
                count -= 1
                if filteredDictionary.keys.contains(self.stack[count]) {
                    break
                }
            }
            
            let popNumber = self.stack[count]
            self.stack.remove(at: count)
            if let value = self.stackDictionary[popNumber] {
                self.stackDictionary[popNumber] = value - 1
            }

            return popNumber
            
        } else {
            fatalError()
        }
    }
}

let obj = FreqStack()
obj.push(1)
obj.push(2)
obj.push(3)
obj.push(4)
obj.push(3)
obj.push(4)
obj.push(2)
obj.push(2)
obj.pop()
obj.pop()
obj.pop()
obj.pop()
obj.pop()
obj.pop()
obj.pop()
