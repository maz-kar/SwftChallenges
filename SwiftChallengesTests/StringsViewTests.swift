//
//  StringsViewTests.swift
//  SwiftChallengesTests
//
//  Created by Maziar Layeghkar on 25.03.24.
//

import XCTest
@testable import SwiftChallenges

final class StringsViewTests: XCTestCase {
    
    var sut: StringsViewModel!
    
    override func setUp() {
        sut = StringsViewModel()
    }
    
    func test_areLettersUniqueWithForLoop_shouldReturnTrue() {
        let input = "AaBbCc"
        let result = sut.areLettersUniqueWithForLoop(input: input)
        
        XCTAssertEqual(result, true)
    }
    
    func test_areLettersUniqueWithForLoop_shouldReturnFalse() {
        let input = "aabcd"
        let result = sut.areLettersUniqueWithForLoop(input: input)
        
        XCTAssertEqual(result, false)
    }
    
    func test_areLettersUniqueWithSet_shouldReturnFalse() {
        let input = "Hello World!"
        let result = sut.areLettersUniqueWithSet(input: input)
        
        XCTAssertEqual(result, false)
    }
    
    func test_isStrPalindrome_shouldReturnTrue() {
        let input = "Rotator"
        let result = sut.isStrPalindrome(input: input)
        
        XCTAssertEqual(result, true)
    }
    
    func test_isStrPalindrome_shouldReturnFalse() {
        let input = "Potato"
        let result = sut.isStrPalindrome(input: input)
        
        XCTAssertEqual(result, false)
    }
    
    func test_strsContainSameChar_shouldReturnTrue() {
        let strOne = "a1 b2"
        let strTwo = "b1 a2"
        let result = sut.strsContainSameChar(strOne: strOne, strTwo: strTwo)
        
        XCTAssertEqual(result, true)
    }
    
    func test_strsContainSameChar_shouldReturnFalse() {
        let strOne = "abc"
        let strTwo = "Abc"
        let result = sut.strsContainSameChar(strOne: strOne, strTwo: strTwo)
        
        XCTAssertEqual(result, false)
    }
    
    func test_fuzzyContainsA_shouldReturnTrue() {
        let str1 = "Hello World"
        let str2 = "Hello"
        
        let result = str1.fuzzyContainsA(str: str2)
        
        XCTAssertEqual(result, true)
    }
    
    func test_fuzzyContainsB_shouldReturnTrue() {
        let str1 = "Hello World"
        let str2 = "Goodbye"
        
        let result = str1.fuzzyContainsB(str: str2)
        
        XCTAssertEqual(result, false)
    }
    
    func test_countTargetedCharWithForLoop_shouldReturnNumberOfOccurance() {
        let result = sut.countTargetedCharWithForLoop(str: "Mississippi", targetedLetter: "p")
        
        XCTAssertEqual(result, 2)
    }
    
    func test_countTargetedCharWithReduce_shouldReturnNumberOfOccurance() {
        let result = sut.countTargetedCharWithReduce(str: "Mississippi", targetedLetter: "q")
        
        XCTAssertEqual(result, 0)
    }
    
    func test_countTargetedCharWithReplacingOccurance_shouldReturnNumberOfOccurance() {
        let result = sut.countTargetedCharWithReduce(str: "Mississippi", targetedLetter: "M")
        
        XCTAssertEqual(result, 1)
    }
    
    func test_countAllLettersInString_shouldReturnADictOfLettersAndCounts() {
        let sortedInput = String("Mississippi".sorted())
        let result = sut.countAllLettersInString(str: sortedInput)
        
        XCTAssertEqual(result, ["i": 4, "M": 1, "p": 2, "s": 4])
    }
    
    func test_removeDuplicateLettersWithFilterAndUpdateValue_shouldReturnStringWithoutDiplication() {
        let input = "Hello"
        let result = sut.removeDuplicateLettersWithFilterAndUpdateValue(input: input)
        
        XCTAssertEqual(result, "Helo")
    }
    
    func test_condenseWhitespaceWithRegularExpression_shoultReturnOneWhitespace() {
        let input = "   a   b    c"
        let result = sut.condenseWhitespaceWithRegularExpression(input: input)
        
        XCTAssertEqual(result, " a b c")
        
    }
    
    func test_condenseWhitespaceWithForLoop_shoultReturnOneWhitespace() {
        let input = "   a   b    c"
        let result = sut.condenseWhitespaceWithForLoop(input: input)
        
        XCTAssertEqual(result, " a b c")
        
    }
    
    func test_stringRotated_shouldReturnTrue() {
        let input = "abcde"
        let result = sut.stringRotated(str: input, rotatedStr: "cdeab")
        
        XCTAssertTrue(result)
    }
    
    func test_stringRotated_shouldReturnFalse() {
        let input = "abcde"
        let result = sut.stringRotated(str: input, rotatedStr: "edab")
        
        XCTAssertFalse(result)
    }
    
    func test_findPangrams_shouldReturnTrue() {
        let input = "The quick brown fox jumps over the lazy dog"
        let result = sut.findPangrams(str: input)
        
        XCTAssertTrue(result)
    }
    
    func test_findPangrams_shouldReturnFalse() {
        let input = "The quick brown fox jumped over the lazy dog"
        let result = sut.findPangrams(str: input)
        
        XCTAssertFalse(result)
    }
    
    func test_vowelsAndConsonantsWithForLoop_shouldReturnCounts() {
        let input = "Mississippi"
        let vowelsResult = sut.vowelsAndConsonantsWithForLoop(input: input).vowels
        let consonantsResult = sut.vowelsAndConsonantsWithForLoop(input: input).consonants
        
        XCTAssertEqual((vowelsResult), 4)
        XCTAssertEqual((consonantsResult), 7)
    }
    
    func test_vowelsAndConsonantsWithCharacterSet_shouldReturnZero() {
        let input = "!? "
        let vowelsResult = sut.vowelsAndConsonantsWithCharacterSet(input: input).vowels
        let consonantsResult = sut.vowelsAndConsonantsWithCharacterSet(input: input).consonants
        
        XCTAssertEqual((vowelsResult), 0)
        XCTAssertEqual((consonantsResult), 0)
    }
    
    func test_threeDifferentLetters_shouldReturnTrue() {
        let strOne = "Clamp"
        let strTwo = "grams"
        
        let result = sut.threeDifferentLetters(strOne: strOne, strTwo: strTwo)
        XCTAssertTrue(result)
    }
    
    func test_threeDifferentLetters_shouldReturnFalse() {
        let strOne = "Clamp"
        let strTwo = "maple"
        
        let result = sut.threeDifferentLetters(strOne: strOne, strTwo: strTwo)
        XCTAssertFalse(result)
    }
    
    func test_threeDifferentLetters_givenUnequalStrings_shouldReturnFalse() {
        let strOne = "Clamp"
        let strTwo = "clam"
        
        let result = sut.threeDifferentLetters(strOne: strOne, strTwo: strTwo)
        XCTAssertFalse(result)
    }
    
    func test_longestPrefix_shouldReturnCommonPrefix() {
        let input = "flip flop flap"
        let result = sut.longestPrefix(input: input)
        
        XCTAssertEqual(result, "fl")
    }
    
    func test_longestPrefix_givenSameInput_shouldReturnWholeInput() {
        let input = "flip flip"
        let result = sut.longestPrefix(input: input)
        
        XCTAssertEqual(result, "flip")
    }
    
    func test_existsHigher_givenHigherthanNumber_shouldReturnTrue() {
        let userArr: [Int] = [2,4,6]
        let userNumber = 5
        
        let output = sut.existsHigher(arr: userArr, number: userNumber)
        
        XCTAssertTrue(output)
    }
    
    func test_existsHigher_givenLowerthanNumber_shouldReturnFalse() {
        let userArr: [Int] = [2,4]
        let userNumber = 5
        
        let output = sut.existsHigher(arr: userArr, number: userNumber)
        
        XCTAssertFalse(output)
    }
    
    func test_existsHigher_givenEmptyArr_shouldReturnFalse() {
        let userArr: [Int] = []
        let userNumber = 5
        
        let output = sut.existsHigher(arr: userArr, number: userNumber)
        
        XCTAssertFalse(output)
    }
    
    func test_reverse_givenWordWithLessThan5Char_shouldReturnTheWordItself() {
        let userInput = "This is a big dog."
        
        let output = sut.reverse(input: userInput)
        
        XCTAssertEqual(output, "This is a big dog. ")
    }
    
    func test_reverse_givenWordWithBiggerThanOrEqaul5Char_shouldReturnTheReversedWord() {
        let userInput = "This is a typical sentence."
        
        let output = sut.reverse(input: userInput)
        
        XCTAssertEqual(output, "This is a lacipyt .ecnetnes ")
    }
    
    func test_reverseWithMap_givenWordWithLessThan5Char_shouldReturnTheWordItself() {
        let userInput = "This is a big dog."
        
        let output = sut.reverseWithMap(input: userInput)
        
        XCTAssertEqual(output, "This is a big dog.")
    }
    
    func test_reverseWithMap_givenWordWithBiggerThanOrEqaul5Char_shouldReturnTheReversedWord() {
        let userInput = "This is a typical sentence."
        
        let output = sut.reverseWithMap(input: userInput)
        
        XCTAssertEqual(output, "This is a lacipyt .ecnetnes")
    }
    
    func test_stepsToConvert_GivenAllLowerCase_shouldReturn0() {
        let userInput = "aba"
        
        let output = sut.stepsToConvert(input: userInput)
        
        XCTAssertEqual(output, 0)
    }
    
    func test_stepsToConvert_GivenMoreUpperLetters_shouldReturnFewerLowerLetterCount() {
        let userInput = "abCBA"
        
        let output = sut.stepsToConvert(input: userInput)
        
        XCTAssertEqual(output, 2)
    }
    
    func test_stepsToConvertWithFilter_GivenAllLowerCase_shouldReturn0() {
        let userInput = "aba"
        
        let output = sut.stepsToConvertWithFilter(userInput)
        
        XCTAssertEqual(output, 0)
    }
    
    func test_stepsToConvertWithFilter_GivenMoreUpperLetters_shouldReturnFewerLowerLetterCount() {
        let userInput = "abCBA"
        
        let output = sut.stepsToConvert(input: userInput)
        
        XCTAssertEqual(output, 2)
    }
    
    func test_retrieveSubReddit_shouldReturnTheSubredditNameInTheURL() {
        let subredditURL = "https://www.reddit.com/r/relationships/"
        
        let output = sut.retrieveSubReddit(input: subredditURL)
        
        XCTAssertEqual(output, "relationships")
    }
    
    func test_canCapture_givenIdenticalRow_shouldReturnTrue() {
        let userInput = ["A8", "E8"]
        
        let output = sut.canCapture(input: userInput)
        
        XCTAssertTrue(output)
    }
    
    func test_canCapture_givenNonIdenticalRow_shouldReturnFalse() {
        let userInput = ["B5", "E8"]
        
        let output = sut.canCapture(input: userInput)
        
        XCTAssertFalse(output)
    }
    
    func test_hammingDistance_givenFullyOppositeStrings_shouldReturnNonZero() {
        let strOne = "abcde"
        let strTwo = "bcdef"
        
        let output = sut.hammingDistance(strOne: strOne, strTwo: strTwo)
        
        XCTAssertGreaterThan(output, 0)
    }
    
    func test_hammingDistance_givenFullyIdenticalStrings_shouldReturnZero() {
        let strOne = "abcde"
        let strTwo = "abcde"
        
        let output = sut.hammingDistance(strOne: strOne, strTwo: strTwo)
        
        XCTAssertEqual(output, 0)
    }
    
}

