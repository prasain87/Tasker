//
//  TaskDetails.swift
//  Tasker
//
//  Created by Prateek Sujaina on 14/03/24.
//

import SwiftUI

struct TaskDetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let model: TaskDetailsVM
    var taskModel: TaskItemModel
    @State private var title: String
    @State private var desc: String
    @State private var selectedStatus: TaskStatus
    
    init(taskModel: TaskItemModel, model: TaskDetailsVM) {
        self.taskModel = taskModel
        self.model = model
        _title = State(initialValue: taskModel.title)
        _desc = State(initialValue: taskModel.description)
        _selectedStatus = State(initialValue: taskModel.status)
    }
        
    var body: some View {
        VStack {
            TaskTitleTextField(title: $title)
            EditTaskStatusView(selectedStatus: $selectedStatus)
            TaskDescriptionView(desc: $desc)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    update()
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Save").bold()
                }
            }
        }
        .padding(10)
    }
    
    func update() {
        model.updateTask(id: taskModel.id, title: title, description: desc, status: selectedStatus)
    }
}
