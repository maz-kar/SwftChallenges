//
//  StringsView.swift
//  SwiftChallenges
//
//  Created by Maziar Layeghkar on 25.03.24.
//

import SwiftUI

class StringsViewModel: ObservableObject {
    
    func areLettersUniqueWithForLoop(input: String) -> Bool {
        var usedLetters: [Character] = []
        
        for char in input {
            if usedLetters.contains(String(char)) {
                return false
            }
            usedLetters.append(char)
        }
        return true
    }
    
    func areLettersUniqueWithSet(input: String) -> Bool {
        return input.count == Set(input).count
    }
    
    func isStrPalindrome(input: String) -> Bool {
        return String(input.reversed()).lowercased() == input.lowercased()
    }
    
    func strsContainSameChar(strOne: String, strTwo: String) -> Bool {
        return strOne.sorted() == strTwo.sorted()
    }
    
    func countTargetedCharWithForLoop(str: String, targetedLetter: Character) -> Int {
        var result = 0
        
        for char in str {
            if char == targetedLetter {
                result += 1
            }
        }
        return result
    }
    
    func countTargetedCharWithReduce(str: String, targetedLetter: Character) -> Int {
        return str.reduce(0) { count, letter in //initialResult will be passed to nextPartialResult for the 1st time closure is executed
            letter == targetedLetter ? count + 1 : count
        }
    }
    
    func countTargetedCharWithReplacingOccurance(str: String, targetedLetter: Character) -> Int {
        let modifiedStr = str.replacingOccurrences(of: String(targetedLetter), with: "")
        return str.count - modifiedStr.count
    }
    
    func countAllLettersInString(str: String) -> [Character: Int] {
        return str.reduce(into: [:]) { count, letter in //Closure will loop through the str until the last letter
            count[letter, default: 0] += 1
        }
    }
    
    func removeDuplicateLettersWithFilterAndUpdateValue(input: String) -> String {
        var used = [Character: Bool]()
        
        let result = input.filter {
            used.updateValue(true, forKey: $0) == nil //so complex to be used here
        }
        
        return result
    }
    
    func condenseWhitespaceWithRegularExpression(input: String) -> String { //“a[space][space][space]b[space][space][space]c” --> “a[space]b[space]c”.
        return input.replacingOccurrences(of: " +", with: " ", options: .regularExpression, range: nil)
    }
    
    func condenseWhitespaceWithForLoop(input: String) -> String {
        var seenSpace = false
        var result = ""
        
        for letter in input { //“a[space][space][space]b[space][space][space]c”
            if String(letter) == " " {
                if seenSpace { continue } //continue to the next letter
                seenSpace = true
            } else {
                seenSpace = false
            }
            result.append(letter)
        }
        return result
    }

    func stringRotated(str: String, rotatedStr: String) -> Bool { //abcde & deabc -> true
        guard str.count == rotatedStr.count else { return false }
        let combined = str + str //abcdeabcde
        return combined.range(of: rotatedStr) != nil //or use contain
    }
    
    func findPangrams(str: String) -> Bool {
        let modifiedStr = Set(str.lowercased())
        let result = modifiedStr.filter { $0 >= "a" && $0 <= "z" }
        return result.count == 26
    }
    
    func vowelsAndConsonantsWithForLoop(input: String) -> (vowels: Int, consonants: Int) {
        let vowels = "aeiou"
        let consonants = "bcdfghjklmnpqrstuvwxyz"
        
        var vowelsCount = 0
        var consonantsCount = 0
        
        for char in input.lowercased() {
            if vowels.contains(char) {
                vowelsCount += 1
            } else if consonants.contains(char) {
                consonantsCount += 1
            }
        }
        return (vowelsCount, consonantsCount)
    }
    
    func vowelsAndConsonantsWithCharacterSet(input: String) -> (vowels: Int, consonants: Int) {
        let vowels = CharacterSet(charactersIn: "aeiou")
        let consonants = CharacterSet(charactersIn: "bcdfghjklmnpqrstuvwxyz")
        
        var vowelsCount = 0
        var consonantsCount = 0
        
        for letter in input.lowercased() {
            let stringLetter = String(letter)
            if stringLetter.rangeOfCharacter(from: vowels) != nil {
                vowelsCount += 1
            } else if stringLetter.rangeOfCharacter(from: consonants) != nil {
                consonantsCount += 1
            }
        }
        return (vowelsCount, consonantsCount)
    }
    
    func threeDifferentLetters(strOne: String, strTwo: String) -> Bool {
        let arrStrOne = Array(strOne.lowercased())
        let arrStrTwo = Array(strTwo.lowercased())
        
        var countDifferences = 0
        
        guard arrStrOne.count == arrStrTwo.count else { return false }
        for (index, letter) in arrStrOne.enumerated() {
            if arrStrTwo[index] != letter {
                countDifferences += 1
            }
        }
        return countDifferences > 3 ? false : true
    }
    
    func longestPrefix(input: String) -> String {
        let parts = input.components(separatedBy: " ")
        guard let firstPart = parts.first else { return "" }
        var currentPrefix = ""
        var bestPrefix = ""
        
        for letter in firstPart {
            currentPrefix.append(letter)
            for word in parts {
                if !word.hasPrefix(currentPrefix) {
                    return bestPrefix
                }
            }
            bestPrefix = currentPrefix
        }
        return bestPrefix
    }
}

extension String {
    func fuzzyContainsA(str: String) -> Bool {
        return self.uppercased().range(of: str.uppercased()) != nil
    }
    
    func fuzzyContainsB(str: String) -> Bool {
        return (self.range(of: str, options: .caseInsensitive) != nil)
    }
}

struct StringsView: View {
    @StateObject private var vm = StringsViewModel()
    
    var body: some View {
        VStack(spacing: 10) {
            Text("areLettersUniqueWithForLoop: \(vm.areLettersUniqueWithForLoop(input: "AaBbCc"))")
            Text("areLettersUniqueWithSet: \(vm.areLettersUniqueWithSet(input: "Hello World!"))")
            Text("isStrPalindrome: \(vm.isStrPalindrome(input: "Rotator"))")
            Text("strsContainSameChar: \(vm.strsContainSameChar(strOne: "a1 b2", strTwo: "b1 a2"))")
            Text("fuzzyContainsA: \("Hello World".fuzzyContainsA(str: "Hello").description)")
            Text("fuzzyContainsB: \("Hello World".fuzzyContainsB(str: "Goodbye").description)")
            Text("countTargetedCharWithForLoop: \(vm.countTargetedCharWithForLoop(str: "Mississippi", targetedLetter: "p"))")
            Text("countTargetedCharWithReduce: \(vm.countTargetedCharWithReduce(str: "Mississippi", targetedLetter: "s"))")
            Text("countTargetedCharWithReplacingOccurance: \(vm.countTargetedCharWithReplacingOccurance(str: "Mississippi", targetedLetter: "M"))")
            Text("countAllLettersInString: \(vm.countAllLettersInString(str: "Mississippi"))")
            Text("removeDuplicateLettersWithUpdateValue: \(vm.removeDuplicateLettersWithFilterAndUpdateValue(input: "Hello"))")
            Text("condenseWhitespaceWithRegularExpression: \(vm.condenseWhitespaceWithRegularExpression(input: "   a   b    c"))")
            Text("condenseWhitespaceWithForLoop: \(vm.condenseWhitespaceWithForLoop(input: "   a   b    c"))")
            Text("stringRotated: \(vm.stringRotated(str: "abcde", rotatedStr: "deabc"))")
            Text("findPangrams: \(vm.findPangrams(str: "The quick brown fox jumps over the lazy dog"))")
            Text("vowels&ConsonantsWithForLoop: \(vm.vowelsAndConsonantsWithForLoop(input: "Mississippi"))")
            Text("vowels&ConsonantsWithCharacterSet: \(vm.vowelsAndConsonantsWithCharacterSet(input: "Mississippi"))")
            Text("threeDiffenetLetter: \(vm.threeDifferentLetters(strOne: "clamp", strTwo: "maple"))")
            Text("longestPrefix: \(vm.longestPrefix(input: "flip flap flop"))")
        }
    }
}

#Preview {
    StringsView()
}
