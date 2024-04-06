//
//  ContentView.swift
//  Tasker
//
//  Created by Prateek Sujaina on 14/03/24.
//

import SwiftUI

struct ContentView: View {
    var model: TaskModel
    
    @State private var isPresented = false    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationStack {
            TaskFilterView(model: model)
                .padding([.leading, .trailing], 10)
            
            TaskListView(model: model)
            .navigationDestination(for: TaskItemModel.self) { item in
                TaskDetailsView(taskModel: item, model: model)
            }
            .navigationTitle(Text("Tasker"))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isPresented.toggle()
                    } label: {
                        Label("", systemImage: "plus.square.fill")
                            .font(.largeTitle)
                            .shadow(radius: 5)
                    }
                    .sheet(isPresented: $isPresented) {
                        NewTaskView(model: model)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView(model: TaskModel())
}
