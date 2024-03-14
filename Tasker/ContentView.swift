//
//  ContentView.swift
//  Tasker
//
//  Created by Prateek Sujaina on 14/03/24.
//

import SwiftUI

struct ContentView: View {
    var taskList: [TaskModel] = [
        TaskModel(title: "Task1", desc: "sdfasdfasdf", status: .todo),
        TaskModel(title: "Task2", desc: "sdfasdfasdf", status: .todo),
        TaskModel(title: "Task3", desc: "sdfasdfasdf", status: .todo),
        TaskModel(title: "Task4", desc: "sdfasdfasdf", status: .todo)
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
