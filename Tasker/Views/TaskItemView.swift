//
//  TaskItemView.swift
//  Tasker
//
//  Created by Prateek Sujaina on 14/03/24.
//

import SwiftUI

struct TaskItemView: View {
    @Binding var item: TaskItemModel
    
    var body: some View {
        VStack {
            HStack {
                Text(item.title)
                    .font(.title2)
                Spacer()
                Text(item.status.rawValue)
                    .font(.caption2)
            }
            HStack {
                Text(item.description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
                Spacer()
            }
                
        }
    }
}
