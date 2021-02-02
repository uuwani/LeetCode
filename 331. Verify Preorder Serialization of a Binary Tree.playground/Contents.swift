class Solution {
    func isValidSerialization(_ preorder: String) -> Bool {
        var stack: [Int] = []
        let list = preorder.split(separator: ",")
        var nowDone: Bool = false

        if list.count == 1 && list.first! == "#" { return true }

        for element in list {
            if nowDone == true { return false }
            let text = String(element)

            if stack.count > 0 {
                let count = stack.popLast()!
                if count - 1 != 0 {
                    stack.append(count - 1)
                } else {
                    if stack.count == 0 && text == "#" {
                        nowDone = true
                    }
                }
            } else {
                if text == "#" {
                    return false
                }
            }

            if text != "#" {
                stack.append(2)
            }
        }

        return stack.isEmpty
    }
}

let solution = Solution()
solution.isValidSerialization("9,3,4,#,#,1,#,#,#,2,#,6,#,#")


