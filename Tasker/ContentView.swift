//
//  ContentView.swift
//  Tasker
//
//  Created by Prateek Sujaina on 14/03/24.
//

import SwiftUI

struct ContentView: View {
    var taskList: [TaskModel] = [
        TaskModel(title: "Task1", desc: "Dynamic Programming is mainly an optimization over plain recursion. Wherever we see a recursive solution that has repeated calls for the same inputs, we can optimize it using Dynamic Programming. The idea is to simply store the results of subproblems so that we do not have to re-compute them when needed later. This simple optimization reduces time complexities from exponential to polynomial.", status: .todo),
        TaskModel(title: "Task2", desc: "Dynamic Programming (DP) is defined as a technique that solves some particular type of problems in Polynomial Time.", status: .todo),
        TaskModel(title: "Task3", desc: "Dynamic Programming (DP) is defined as a technique that solves.", status: .todo),
        TaskModel(title: "Task4", desc: "Dynamic Programming (DP) is defined as a technique that solves some particular type of problems in Polynomial Time.", status: .todo)
    ]
    
    var body: some View {
        NavigationStack {
            List(taskList) { item in
                NavigationLink(value: item) {
                    TaskItemView(item: item)
                }
            }
            .navigationDestination(for: TaskModel.self) { item in
                TaskDetails(taskModel: item)
            }
            .navigationTitle(Text("Tasker"))
        }
    }
}

#Preview {
    ContentView()
}
