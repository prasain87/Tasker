//
//  NewTaskView.swift
//  Tasker
//
//  Created by Prateek Sujaina on 20/03/24.
//

import SwiftUI

struct NewTaskView: View {
    
    @State private var title: String = ""
    @State private var desc: String = ""
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            HStack {
                Button("Cancel", role: .cancel) {
                    self.presentationMode.wrappedValue.dismiss()
                }
                Spacer()
                Text("New Task").font(.title3).bold()
                Spacer()
                Button("Create") {
                    guard !title.isEmpty && !desc.isEmpty else {
                        return
                    }
                    TaskModel.shared.addNewTask(task: TaskItemModel(title: title, desc: desc, status: .todo))
                    self.presentationMode.wrappedValue.dismiss()
                }
                .bold()
            }
            
            TextField("Title", text: $title)
                .textFieldStyle(.roundedBorder)
            TextEditor(text: $desc)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    .gray.opacity(0.3),
                    in: RoundedRectangle(cornerSize: CGSize(width: 5, height: 5))
                        .stroke(lineWidth: 1)
                )
        }
        .padding(10)
    }
}

