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
    
    
}

