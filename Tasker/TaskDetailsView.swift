//
//  TaskDetails.swift
//  Tasker
//
//  Created by Prateek Sujaina on 14/03/24.
//

import SwiftUI

struct TaskDetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var taskModel: TaskItemModel
    @State private var title: String
    @State private var desc: String
    @State private var selectedStatus: TaskStatus

    
    init(taskModel: TaskItemModel) {
        self.taskModel = taskModel
        _title = State(initialValue: taskModel.title)
        _desc = State(initialValue: taskModel.description)
        _selectedStatus = State(initialValue: taskModel.status)
    }
        
    var body: some View {
        VStack {
            TextField("Title", text: $title)
                .textFieldStyle(.roundedBorder)
            Picker("Status", selection: $selectedStatus) {
                ForEach(TaskStatus.allCases) { status in
                    Text(status.rawValue).tag(status)
                }
            }
            .pickerStyle(.palette)

            HStack {
                Text("Description")
                    .foregroundStyle(.secondary)
                Spacer()
            }
                .padding(.top, 5)
            TextEditor(text: $desc)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    .gray.opacity(0.3),
                    in: RoundedRectangle(cornerSize: CGSize(width: 5, height: 5))
                        .stroke(lineWidth: 1)
                )
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
//        self.taskModel.title = title
//        self.taskModel.description = desc
//        self.taskModel.status = selectedStatus
        TaskModel.shared.updateTask(id: taskModel.id, title: title, description: desc, status: selectedStatus)
    }
}
