class Solution {
    func simplifyPath(_ path: String) -> String {
        // . 현재 디렉토리
        // .. 한 레벨 위로
        // 항상 / 로 시작해야하고 두개의 디렉토리 네임 사이 /는 오직 하나만 존재해야함
        // 마지막 디렉토리 네임 뒤에는 /가 존재하면 안됨.
        // .이 나오면 .은 무시한다
        // ..이 나오면 stack의 최상단을 버린다.
        // /이 나오면 stack을 평가한다.
        // path가 틀릴 경우는 생각하지 않음.

        var output: [String.Element] = []
        let slash: String.Element = "/"
        let period: String.Element = "."

        for element in path {
            print(output)
            var periodCount = 0
            if element == slash {
                if let last = output.last, last == slash {
                    output.popLast()
                } else if let last = output.last, last == period {
                    while let last = output.last, last != slash {
                        output.popLast()
                        periodCount += 1
                    }

                    if periodCount == 2 {
                        output.popLast()
                        while let last = output.last, last != slash {
                            output.popLast()
                        }
                        output.popLast()
                    } else if periodCount == 3 {
                        output.append(period)
                        output.append(period)
                        output.append(period)
                    } else {
                        output.popLast()
                    }
                }
            }
            output.append(element)
        }

        if let last = output.last, last == period {
            var periodCount = 0
            print(output)
            while let last = output.last, last != slash {
                output.popLast()
                periodCount += 1
            }
            if periodCount == 2 {
                output.popLast()
                while let last = output.last, last != slash {
                    output.popLast()
                }
            } else if periodCount == 3 {
                output.append(period)
                output.append(period)
                output.append(period)
            }
        }

        
        if let last = output.last {
            if last == slash && output.count != 1 {
                output.popLast()
            }
        } else {
            output.append(slash)
        }

        return output.map { String($0) }.joined()
    }
}

let soultion = Solution()
let result = soultion.simplifyPath("/a/./b/../../c/")
print(result)


class Solution_2 {
    func simplifyPath(_ path: String) -> String {
        // . 현재 디렉토리
        // .. 한 레벨 위로
        // 항상 / 로 시작해야하고 두개의 디렉토리 네임 사이 /는 오직 하나만 존재해야함
        // 마지막 디렉토리 네임 뒤에는 /가 존재하면 안됨.
        // .이 나오면 .은 무시한다
        // ..이 나오면 stack의 최상단을 버린다.
        // /이 나오면 stack을 평가한다.
        // path가 틀릴 경우는 생각하지 않음.

        var output: [String.Element] = []
        let slash: String.Element = "/"
        let period: String.Element = "."

        for element in path {
            print(output)
            var periodCount = 0
            if element == slash {
                if let last = output.last, last == slash {
                    output.popLast()
                } else if let last = output.last, last == period {
                    while let last = output.last, last != slash {
                        output.popLast()
                        periodCount += 1
                    }

                    if periodCount == 2 {
                        output.popLast()
                        while let last = output.last, last != slash {
                            output.popLast()
                        }
                        output.popLast()
                    } else if periodCount == 3 {
                        output.append(period)
                        output.append(period)
                        output.append(period)
                    } else {
                        output.popLast()
                    }
                }
            }
            output.append(element)
        }

        if let last = output.last, last == period {
            var periodCount = 0
            print(output)
            while let last = output.last, last != slash {
                output.popLast()
                periodCount += 1
            }
            if periodCount == 2 {
                output.popLast()
                while let last = output.last, last != slash {
                    output.popLast()
                }
            } else if periodCount == 3 {
                output.append(period)
                output.append(period)
                output.append(period)
            }
        }

        
        if let last = output.last {
            if last == slash && output.count != 1 {
                output.popLast()
            }
        } else {
            output.append(slash)
        }

        return output.map { String($0) }.joined()
    }
}
