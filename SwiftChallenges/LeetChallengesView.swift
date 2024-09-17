//
//  LeetChallengesView.swift
//  SwiftChallenges
//
//  Created by Maziar Layeghkar on 17.09.24.
//

import SwiftUI

struct LeetChallengesView: View {
    @StateObject private var vm = LeetChallengesViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(tasks(), id: \.self) { task in
                            Text(task)
                                .padding([.top, .bottom], 1)
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
            "TwoSum \n Inp: nums = [2,7,11], target = 9. Out: [0,1] \n \(vm.twoSum([2,7,11], 9))",
        
        ]
    }
}

class LeetChallengesViewModel: ObservableObject {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
            return [2,7]
    }
}

#Preview {
    LeetChallengesView()
}
