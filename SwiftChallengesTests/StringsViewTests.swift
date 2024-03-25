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
    
    func test_areLettersUniqueA_ShouldReturnTrue() {
        let input = "AaBbCc"
        let result = sut.areLettersUniqueA(input: input)
        
        XCTAssertEqual(result, true)
    }
    
    func test_areLettersUniqueB_ShouldReturnFalse() {
        let input = "Hello World!"
        let result = sut.areLettersUniqueB(input: input)
        
        XCTAssertEqual(result, false)
    }
}

