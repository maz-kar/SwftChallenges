//
//  LeetChallengesView.swift
//  SwiftChallenges
//
//  Created by Maziar Layeghkar on 17.09.24.
//

import SwiftUI

struct LeetChallengesView: View {
    @ObservedObject private var vm = LeetChallengesViewModel()
    
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
            .navigationTitle("Swift Challenges")
        }
    }
    
    private func tasks() -> [String] {
        return [
            "highestScore. Output: \(vm.highestScore(of: ["Alice": 85, "Bob": 92, "Charlie": 92, "Diana": 88]))",
        ]
    }
}

class LeetChallengesViewModel: ObservableObject {
    func highestScore(of students: [String:Int]) -> [String] {
        var result: [String] = []
        guard let maxVal = students.values.max() else { return result}
        
        for (key, value) in students {
            if value == maxVal {
                result.append(key)
            }
        }
        return result
    }
}

#Preview {
    LeetChallengesView()
}
