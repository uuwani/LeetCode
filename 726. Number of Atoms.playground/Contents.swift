class Solution {
    var number: String

    var name: String

    var stack: [Atom]

    var timeToClose: Bool

    init() {
        self.number = ""
        self.name = ""
        self.stack = []
        self.timeToClose = false
    }

    func countOfAtoms(_ formula: String) -> String {
        var dictionary: [String: Int] = [:]

        for character in formula {
            let asciiValue = character.asciiValue!

            if asciiValue >= 48 && asciiValue <= 57 {
                self.number += String(character)

            } else if asciiValue >= 65 && asciiValue <= 90 {
                self.mainLogic()

                self.name += String(character)
            } else if asciiValue >= 97 && asciiValue <= 122 {
                self.name += String(character)

            } else if asciiValue == 40 {
                self.mainLogic()
                
                let atom = Atom(name: String(character), number: 0)
                stack.append(atom)
            } else {
                self.mainLogic()

                timeToClose = true
            }
        }
        
        self.mainLogic()

        while !stack.isEmpty {
            let last = stack.popLast()!
            dictionary[last.name] = (dictionary[last.name] == nil ? 0 : dictionary[last.name]!) + last.number
        }

        var result: [String] = []
        for element in dictionary {
            let newElement = element.key + (element.value == 1 ? "" : String(element.value))
            result.append(newElement)
        }

        result.sort()
        
        return result.joined()
    }

    func setAtom() -> Atom {

        let number = self.number == "" ? 1 : Int(self.number)!
        let atom = Atom(name: self.name, number: number)

        self.name = ""
        self.number = ""

        return atom
    }

    func mainLogic() {
        if self.timeToClose {
            let closeNumber = self.number == "" ? 1 : Int(self.number)!
            var tempStack: [Atom] = []
            while let last = self.stack.last, last.name != "(" {
                self.stack.popLast()
                tempStack.append(Atom(name: last.name, number: last.number * closeNumber))
            }
            self.stack.popLast()
            self.stack += tempStack
            self.timeToClose = false
            self.number = ""
            self.name = ""
        } else {
            if self.name != "" {
                let atom = self.setAtom()
                self.stack.append(atom)
            }
        }
    }
}

struct Atom {
    let name: String

    let number: Int
}

let solution = Solution()
print(solution.countOfAtoms("(H)"))
