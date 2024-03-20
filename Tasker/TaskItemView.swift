//
//  TaskItemView.swift
//  Tasker
//
//  Created by Prateek Sujaina on 14/03/24.
//

import SwiftUI

struct TaskItemView: View {
    let item: TaskModel
    
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
                Text(item.desc)
                    .font(.subheadline)
                    .lineLimit(2)
                Spacer()
            }
                
        }
    }
}
