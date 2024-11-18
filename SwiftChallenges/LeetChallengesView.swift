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
            "filteredCounties. Output: \(vm.filteredCounties(by: ["USA": 331, "India": 1393, "Germany": 83, "Japan": 126, "Mexico": 128], threshold: 300))"
            
        ]
    }
}

class LeetChallengesViewModel: ObservableObject {
    /*
     Write a Swift function that takes a dictionary of students and their scores, where the key is a student's name (String) and the value is their score (Int). The function should:

     Return the name of the student with the highest score.
     If there are multiple students with the same highest score, return all their names as a list.
     */
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
    
    
    /*
     Write a Swift function that takes a dictionary where the keys are country names (String) and the values are their populations (Int). The function should:

     Filter the dictionary to include only countries with populations greater than 50 million.
     Return a new dictionary containing the filtered results, sorted by population in descending order.
     */
    
    func filteredCounties(by population: [String:Int], threshold: Int) -> [String:Int] {
        return Dictionary(
            uniqueKeysWithValues: population
                .filter { $0.value > threshold }
                .sorted { $0.value > $1.value }
        )
    }
}

#Preview {
    LeetChallengesView()
}
