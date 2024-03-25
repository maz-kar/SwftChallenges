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
    
    
}

struct StringsView: View {
    @StateObject private var vm = StringsViewModel()
    
    var body: some View {
        VStack(spacing: 10) {
            Text("areLettersUniqueA: \(vm.areLettersUniqueA(input: "AaBbCc").description)")
            
            Text("areLettersUniqueB: \(vm.areLettersUniqueB(input: "Hello World!").description)")
        }
    }
}

#Preview {
    StringsView()
}
