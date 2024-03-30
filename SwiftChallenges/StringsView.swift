//
//  StringsView.swift
//  SwiftChallenges
//
//  Created by Maziar Layeghkar on 25.03.24.
//

import SwiftUI

class StringsViewModel: ObservableObject {
    
    func areLettersUniqueA(input: String) -> Bool { //AaBbCc -> true, Hello, world -> false
        var usedLetters: [Character] = []
        
        for char in input {
            if usedLetters.contains(String(char)) {
                return false
            }
            usedLetters.append(char)
        }
        return true
    }
    
    func areLettersUniqueB(input: String) -> Bool {
        return input.count == Set(input).count
    }
    
    func isStrPalindrome(input: String) -> Bool {
        return String(input.reversed()).lowercased() == input.lowercased()
    }
    
    func strsContainSameChar(strOne: String, strTwo: String) -> Bool { //a1 b2 ” and “b1 a2 -> true
        return strOne.sorted() == strTwo.sorted()
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
            Text("areLettersUniqueA: \(vm.areLettersUniqueA(input: "AaBbCc").description)")
            Text("areLettersUniqueB: \(vm.areLettersUniqueB(input: "Hello World!").description)")
            Text("isStrPalindrome: \(vm.isStrPalindrome(input: "Rotator"))")
            Text("strsContainSameChar: \(vm.strsContainSameChar(strOne: "a1 b2", strTwo: "b1 a2"))")
            Text("fuzzyContainsA: \("Hello World".fuzzyContainsA(str: "Hello").description)")
            Text("fuzzyContainsB: \("Hello World".fuzzyContainsB(str: "Goodbye").description)")

        }
    }
}

#Preview {
    StringsView()
}
