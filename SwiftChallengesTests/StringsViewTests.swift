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
    
    func test_areLettersUniqueA_shouldReturnTrue() {
        let input = "AaBbCc"
        let result = sut.areLettersUniqueA(input: input)
        
        XCTAssertEqual(result, true)
    }
    
    func test_areLettersUniqueB_shouldReturnFalse() {
        let input = "Hello World!"
        let result = sut.areLettersUniqueB(input: input)
        
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
    
    
}

