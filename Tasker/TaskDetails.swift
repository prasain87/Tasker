//
//  TaskDetails.swift
//  Tasker
//
//  Created by Prateek Sujaina on 14/03/24.
//

import SwiftUI

struct TaskDetails: View {
    let taskModel: TaskModel
    
    var body: some View {
        VStack {
            Text(taskModel.title)
            Text(taskModel.desc)
            Text(taskModel.title)
        }
    }
}
