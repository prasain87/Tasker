//
//  TaskModel.swift
//  Tasker
//
//  Created by Prateek Sujaina on 14/03/24.
//

import Foundation

struct TaskModel: Identifiable {
    let id: String = UUID().uuidString
    
    let title: String
    let desc: String
    let status: TaskStatus
}

extension TaskModel: Hashable {}

enum TaskStatus: String {
    case todo = "To Do"
    case inProgress = "In Progress"
    case done = "Done"
}
