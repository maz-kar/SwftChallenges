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
        
        for letter in input {
            if !usedLetters.contains(letter) {
                usedLetters.append(letter)
            }
            else {
                return false
            }
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
    
    func countTargetedCharWithReduce(str: String, targetedLetter: Character) -> Int { //MARK: find more reduce
        return str.reduce(0) { count, letter in
            //initialResult will be passed to nextPartialResult for the 1st time closure is executed. Remember PartialResult means it can be changed, like the count which can be incremented.
            letter == targetedLetter ? count + 1 : count
        }
    }
    
    func countTargetedCharWithReplacingOccurance(str: String, targetedLetter: String) -> Int { //MARK: find more replacingOccurrences
        let result = str.replacingOccurrences(of: targetedLetter, with: "", options: .caseInsensitive)
        //replacingOccurrences will take targettedLetter out which later by count and subtraction can be our answer
        return str.count - result.count
    }
    
    func countAllLettersInString(str: String) -> [Character: Int] { //MARK: This is the exp of documentation
        return str.reduce(into: [:]) { count, letter in //Closure will loop through the str until the last letter
            count[letter, default: 0] += 1
        }
    }
    
    func removeDuplicateLetterForLoop(input: String) -> String {
        var result = ""
        for letter in input {
            if !result.contains(letter.description) {
                result.append(letter.description)
            }
        }
        return result
    }
    
    func removeDuplicateLettersWithFilterAndUpdateValue(input: String) -> String { //MARK: can also be easily done with set
        var used = [Character: Bool]()
        //Hello
        let result = input.filter { //This will return self or in this case string
            used.updateValue(true, forKey: $0) == nil //This line checks if true,H is not in used / true,H in used is NIL, if so, returns true which means for the filter to keep the H. if case of 2nd l, true, l is !nil and then it returns false to filter which means not keeping the 2nd l.
        }
        
        return result
    }
    
    func condenseWhitespaceWithRegularExpression(input: String) -> String { //“a    b   c” --> “a b c”
        return input.replacingOccurrences(of: " +", with: " ", options: .regularExpression, range: nil)
        //It also works with:(of: " +", with: " ", options: .regularExpression)
    }
    
    func condenseWhitespaceWithForLoop(input: String) -> String { //MARK: Good practice for flag
        var seenSpace = false
        var result = ""
        
        for letter in input {
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
        return combined.range(of: rotatedStr) != nil //or use contain. if !=nil it means combine exist in the range of rotated. if == nil, means does not exist
    }
    
    func findPangrams(str: String) -> Bool { //MARK: Good filter practice
        let modifiedStr = Set(str.lowercased())
        let result = modifiedStr.filter { $0 >= "a" && $0 <= "z" }
        return result.count == 26
    }
    
    func vowelsAndConsonantsWithForLoop(input: String) -> (vowels: Int, consonants: Int) { //MARK: note this kinda return type
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
            if stringLetter.rangeOfCharacter(from: vowels) != nil { //MARK: Add this rangeOfCharacter to HACKS
                vowelsCount += 1
            } else if stringLetter.rangeOfCharacter(from: consonants) != nil {
                consonantsCount += 1
            }
        }
        return (vowelsCount, consonantsCount)
    }
    
    func threeDifferentLetters(strOne: String, strTwo: String) -> Bool { //MARK: 1st check letter count of strings, then letter differences based on index
        let arrStrOne = Array(strOne.lowercased()) //MARK: in order to use index, make them Array
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
    
    func longestPrefix(input: String) -> String { //MARK: challenging exp
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
    
    //Write a function that returns true if there exists at least one number that is larger than or equal to n.
    func existsHigher(arr: [Int], number: Int) -> Bool {
        arr.contains { $0 > number }
    }
    
    //Write a function that takes a string of one or more words as an argument and returns the same string, but with all five or more letter words reversed. Strings passed in will consist of only letters and spaces. Spaces will be included only when more than one word is present.
    func reverse(input: String) -> String {
        let words = input.components(separatedBy: " ")
        var result = ""
        
        for word in words {
            if word.count >= 5 {
                let reversedPart = String(word.reversed() + " ")
                result.append(reversedPart)
            } else {
                result.append(word + " ")
            }
        }
        return result
    }
    
    func reverseWithMap(input: String) -> String {
        let words = input.components(separatedBy: " ")
        return words.map { $0.count >= 5 ? String($0.reversed()) : $0 }.joined(separator: " ")
    }
    
    //Return the smallest number of steps it takes to convert a string entirely into uppercase or entirely into lower case, whichever takes the fewest number of steps. A step consists of changing one character from lower to upper case, or vice versa.
    func stepsToConvert(input: String) -> Int {
        var lowerContainer = ""
        var upperContainer = ""
        
        for letter in input {
            if letter.isLowercase {
                lowerContainer.append(letter)
            } else {
                upperContainer.append(letter)
            }
        }
        if lowerContainer.count > upperContainer.count {
            return upperContainer.count
        } else {
            return lowerContainer.count
        }
    }
    
    func stepsToConvertWithFilter(_ str: String) -> Int {
        return min(str.filter { $0.lowercased() == String($0) }.count, str.filter { $0.uppercased() == String($0) }.count)
    }
    
    //Create a function to extract the name of the subreddit from its URL.
    func retrieveSubReddit(input: String) -> String {
        return String(input.split(separator: "/").last!)
    }
    
    //Write a function that returns true if two rooks can attack each other, and false otherwise.
    func canCapture(input: [String]) -> Bool {
        return input[0].first == input[1].first || input[0].last == input[1].last
    }
    
    //Create a function that computes the hamming distance between two strings.
    func hammingDistance(strOne: String, strTwo: String) -> Int {
        return zip(strOne, strTwo).filter{ $0 != $1 }.count
    }
    
    //Create a function that takes an initial word and extracts any words that start with the same letters as the initial word.
    func littleDictionary(initialWord: String, words: [String]) -> [String] {
        return words.filter { $0.contains(initialWord) }
    }
    
    func reverse(_ str: String) -> String {
        return String(str.reversed())
    }
    
    //Create a function that takes an array of numbers and returns the second largest number.
    
    
}

extension String {
    func fuzzyContainsA(str: String) -> Bool {
        return self.uppercased().range(of: str.uppercased()) != nil
    }
    
    func fuzzyContainsB(str: String) -> Bool {
        return (self.range(of: str, options: .caseInsensitive) != nil) //MARK: means A and a will be different for it?
    }
}

struct StringsView: View {
    @StateObject private var vm = StringsViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("areLettersUniqueWithForLoop: \(vm.areLettersUniqueWithForLoop(input: "AaBbCc"))")
                Text("areLettersUniqueWithSet: \(vm.areLettersUniqueWithSet(input: "Hello World!"))")
                Text("isStrPalindrome: \(vm.isStrPalindrome(input: "Rotator"))")
                Text("strsContainSameChar: \(vm.strsContainSameChar(strOne: "a1 b2", strTwo: "b1 a2"))")
                Text("fuzzyContainsA: \("Hello World".fuzzyContainsA(str: "Hello").description)")
                Text("fuzzyContainsB: \("Hello World".fuzzyContainsB(str: "Goodbye").description)")
                Text("countTargetedCharWithForLoop: \(vm.countTargetedCharWithForLoop(str: "Mississippi", targetedLetter: "p"))")
                Text("countTargetedCharWithReduce: \(vm.countTargetedCharWithReduce(str: "Mississippi", targetedLetter: "s"))")
                Text("countTargetedCharWithReplacingOccurance: \(vm.countTargetedCharWithReplacingOccurance(str: "Mississippim", targetedLetter: "M"))")
                Text("countAllLettersInString: \(vm.countAllLettersInString(str: "Mississippi"))")
                Text("removeDuplicateLettersWithUpdateValue: \(vm.removeDuplicateLettersWithFilterAndUpdateValue(input: "Hello"))")
                Text("removeDuplicateLetterForLoop: \(vm.removeDuplicateLetterForLoop(input: "apple"))")
                Text("condenseWhitespaceWithRegularExpression: \(vm.condenseWhitespaceWithRegularExpression(input: "   a   b    c"))")
                Text("condenseWhitespaceWithForLoop: \(vm.condenseWhitespaceWithForLoop(input: "   a   b    c"))")
                Text("stringRotated: \(vm.stringRotated(str: "abcde", rotatedStr: "deabc"))")
                Text("findPangrams: \(vm.findPangrams(str: "The quick brown fox jumps over the lazy dog"))")
                Text("vow&ConsonWithForLoop: \(vm.vowelsAndConsonantsWithForLoop(input: "Mississippi"))")
                Text("vow&ConsonWithCharacterSet: \(vm.vowelsAndConsonantsWithCharacterSet(input: "Mississippi"))")
                Text("threeDiffenetLetter: \(vm.threeDifferentLetters(strOne: "clamp", strTwo: "maple"))")
                Text("longestPrefix: \(vm.longestPrefix(input: "flip flap flop"))")
                Text("existsHigher: \(vm.existsHigher(arr: [2,4,6], number: 5))")
                Text("reverse: \(vm.reverse(input: "This is a typical sentence."))")
                Text("reverseWithMap: \(vm.reverseWithMap(input: "This is a typical sentence."))")
                Text("stepsToConvert: \(vm.stepsToConvert(input: "abC"))")
                Text("stepsToConvertWithFilter: \(vm.stepsToConvertWithFilter("abC"))")
                Text("retrieveSubReddit: \(vm.retrieveSubReddit(input: "https://www.reddit.com/r/funny/"))")
                Text("canCapture: \(vm.canCapture(input: ["A8", "E8"]))")
                Text("hammingDistance: \(vm.hammingDistance(strOne: "abcde", strTwo: "bcdef"))")
                Text("littleDictionary: \(vm.littleDictionary(initialWord: "tri", words: ["triplet", "tries", "trip", "piano", "tree"]))")
                Text("reverse: \(vm.reverse("Edabit is really helpful!"))")

                
            }
        }
    }
}

#Preview {
    StringsView()
}
