class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        let list = Array(num).map { "\($0)" }
        var stack = Storage(storage: list)
        var selectedNumber = stack.count - k
        var results: String = ""

        guard num.count != k else { return "0" }

        while selectedNumber != 0 {
            let index = stack.count - selectedNumber
            
            let result = stack.compare(to: index)
            selectedNumber -= 1
            if results.isEmpty && result == "0" {
                continue
            } else {
                results += result
            }
        }

        return results.isEmpty ? "0" : results
    }
}

struct Storage {
    private var storage: [String]

    init(storage: [String]) {
        self.storage = storage
    }

    mutating func compare(to index: Int) -> String {
        let list: [String] = self.storage
        
        let min = list[0...index].min()
        let minIndex = list.firstIndex(of: min!)
        self.storage = Array(list[minIndex! + 1..<count])

        return min!
    }

    var count: Int {
        self.storage.count
    }
}

// End
