//
//  ContentView.swift
//  Tasker
//
//  Created by Prateek Sujaina on 14/03/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model: TaskModel
    
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
            
            List {
                ForEach(
                    $model.taskList.filter({ selectedFilter.taskStatus.contains($0.status.wrappedValue) })
                ) { $item in
                    NavigationLink(value: item) {
                        TaskItemView(item: $item)
                    }
                }
                .onDelete(perform: delete)
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
                        NewTaskView()
                    }
                }
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        let filteredList = model.taskList.filter({ selectedFilter.taskStatus.contains($0.status) })
        let taskIdSet = Set<String>(offsets.map({ filteredList[$0].id }))
        model.taskList.removeAll(where: { taskIdSet.contains($0.id) })
    }
}

#Preview {
    ContentView(model: TaskModel.shared)
}
