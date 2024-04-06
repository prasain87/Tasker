//
//  NewTaskView.swift
//  Tasker
//
//  Created by Prateek Sujaina on 20/03/24.
//

import SwiftUI

struct NewTaskView: View {
    
    let model: NewTaskVM
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
                    model.addNewTask(title: title, description: desc)
                    self.presentationMode.wrappedValue.dismiss()
                }
                .disabled(title.isEmpty || desc.isEmpty)
                .bold()
            }
            
            TaskTitleTextField(title: $title)
            TaskDescriptionView(desc: $desc)
        }
        .padding(10)
    }
}

