class Solution {
    func removeDuplicateLetters(_ s: String) -> String {
        var wordSet: Set<String> = []
        var alphabetSet: Set<String> = []
        let array = Array(s)
        wordSet.insert(String(array[0]))
        alphabetSet.insert(String(array[0]))

        for index in 1..<s.count {
            let newAlphabet = String(array[index])
            if alphabetSet.insert(newAlphabet).inserted {
                // 새로운 알파벳은 마지막번째 추가해서 리턴시킴
                let array = wordSet.map { (word) -> String in
                    var newWord = word
                    newWord.append(newAlphabet)
                    return newWord
                }
                
                wordSet.removeAll()
                array.forEach { (element) in
                    wordSet.insert(element)
                }
            } else {
                var tempArray: [String] = []
                wordSet.forEach { (word) in
                    var newWord = word
                    let index = word.firstIndex(of: array[index])!
                    newWord.remove(at: index)
                    newWord.append(newAlphabet)
                    tempArray.append(newWord)
                }
                
                tempArray.forEach { (word) in
                    wordSet.insert(word)
                }
                // 존재한다면 기존의 것 + 중복된 부분 제외하고 맨 뒤에 추가된 단어를 set에 추가.
            }
        }
        
        return wordSet.min()!
    }
}

let solution = Solution()
let text = "bcabc"
let result = solution.removeDuplicateLetters(text)
print(result)
