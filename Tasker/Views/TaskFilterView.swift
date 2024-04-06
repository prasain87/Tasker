//
//  TaskFilterView.swift
//  Tasker
//
//  Created by Prateek Sujaina on 05/04/24.
//

import SwiftUI

struct TaskFilterView: View {
    let model: TaskModel
    @State private var selectedFilter: TaskFilterType = .all
    
    var body: some View {
        Picker("Filter", selection: $selectedFilter) {
            ForEach(TaskFilterType.allCases) { flavor in
                Text(flavor.rawValue).tag(flavor)
            }
        }
        .pickerStyle(.segmented)
        .onChange(of: selectedFilter) {
            model.applyFilter(status: selectedFilter)
        }
    }
}
