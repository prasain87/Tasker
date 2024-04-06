//
//  TaskListView.swift
//  Tasker
//
//  Created by Prateek Sujaina on 05/04/24.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var model: TaskModel
    
    var body: some View {
        List {
            ForEach($model.taskList) { $item in
                NavigationLink(value: item) {
                    TaskItemView(item: $item)
                }
            }
            .onDelete(perform: model.delete)
        }
    }
}
