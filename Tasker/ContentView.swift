//
//  ContentView.swift
//  Tasker
//
//  Created by Prateek Sujaina on 14/03/24.
//

import SwiftUI

struct ContentView: View {
    let taskList: [TaskItemModel]
    
    @State private var selectedFilter: TaskFilterType = .all
    @State private var isPresented = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationStack {
            Picker("Filter", selection: $selectedFilter) {
                ForEach(TaskFilterType.allCases) { flavor in
                    Text(flavor.rawValue).tag(flavor)
                }
            }
            .pickerStyle(.segmented)
            .padding([.leading, .trailing], 10)
            
            let filteredTaskList = taskList.filter({ selectedFilter.taskStatus.contains($0.status) })
            
            List(filteredTaskList) { item in
                NavigationLink(value: item) {
                    TaskItemView(item: item)
                }
            }
            .navigationDestination(for: TaskItemModel.self) { item in
                TaskDetailsView(taskModel: item)
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
                        TaskDetailsView(taskModel: nil)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView(taskList: [])
}
