class Solution {
    func sumOfDistancesInTree(_ N: Int, _ edges: [[Int]]) -> [Int] {
        var result: [Int] = []
        var dic = edges.reduce([Int: Set<Int>]()) { (dic, element) -> [Int: Set<Int>] in
            var dic = dic
            if var set = dic[element[0]] {
                set.insert(element[1])
                dic[element[0]] = set
            } else {
                let set: Set = [element[1]]
                dic[element[0]] = set
            }

            if var set = dic[element[1]] {
                set.insert(element[0])
                dic[element[1]] = set
            } else {
                let set: Set = [element[0]]
                dic[element[1]] = set
            }

            return dic
        }

        print(dic)

        return result
    }
}
