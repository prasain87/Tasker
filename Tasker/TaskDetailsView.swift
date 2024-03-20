//
//  TaskDetails.swift
//  Tasker
//
//  Created by Prateek Sujaina on 14/03/24.
//

import SwiftUI

struct TaskDetailsView: View {
    let taskModel: TaskItemModel?
    
    @State private var title: String = ""
    @State private var desc: String = ""
    @State private var selectedStatus: TaskStatus = .todo
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            if taskModel == nil {
                HStack {
                    Button("Cancel", role: .cancel) {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    Spacer()
                    Text("New Task").font(.title3).bold()
                    Spacer()
                    Button("Create") {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    .bold()
                }
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
            
//            if taskModel != nil {
//                Picker("Status", selection: $selectedStatus) {
//                    ForEach(TaskStatus.allCases) { status in
//                        Text(status.rawValue).tag(status)
//                    }
//                }
//                .pickerStyle(.segmented)
//                .padding([.leading, .trailing], 10)
//            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Save").bold()
                }
            }
        }
        .padding(10)
    }
}
