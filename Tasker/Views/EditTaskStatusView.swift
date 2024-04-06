//
//  EditTaskStatusView.swift
//  Tasker
//
//  Created by Prateek Sujaina on 06/04/24.
//

import SwiftUI

struct EditTaskStatusView: View {
    
    @Binding var selectedStatus: TaskStatus
    
    var body: some View {
        HStack {
            Text("Status")
                .font(.title3)
                .foregroundStyle(.secondary)
            Spacer()
        }
        Picker("Status", selection: $selectedStatus) {
            ForEach(TaskStatus.allCases) { status in
                Text(status.rawValue).tag(status)
            }
        }
        .pickerStyle(.palette)
    }
}
