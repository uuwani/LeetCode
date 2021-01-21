import UIKit

var str = "Hello, playground"

var array: [String] = []
array.joined()


let squareBracketOpen: String.Element = "["
let squareBracketClose: String.Element = "]"
let comma: String.Element = ","

var number: [String] = []
let s = "[324]"
for item in s {
    if item == squareBracketOpen {
        print("squareBracketOpen")
    }
}
