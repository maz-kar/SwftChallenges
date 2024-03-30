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
    
    
}

