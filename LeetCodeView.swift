//
//  LeetCodeView.swift
//  SwiftChallenges
//
//  Created by Maziar Layeghkar on 11.11.24.
//

import SwiftUI

struct LeetCodeView: View {
    private var vm = LeetCodeViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(tasks(), id: \.self) { task in
                            Text(task)
                        }
                        .lineLimit(3)
                        .minimumScaleFactor(0.5)
                        .frame(maxWidth: .infinity)
                        .frame(height: 70)
                        .background(Color.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Leet code problems")
        }
    }
    
    private func tasks() -> [String] {
        return [
            "isPalindrome. Output: \(vm.isPalindrome())",
        ]
    }
}

@Observable
class LeetCodeViewModel {
    func isPalindrome() -> Bool {
        return true
    }
}

#Preview {
    LeetCodeView()
}
