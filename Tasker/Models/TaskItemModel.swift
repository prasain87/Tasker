//
//  TaskModel.swift
//  Tasker
//
//  Created by Prateek Sujaina on 14/03/24.
//

import Foundation

struct TaskItemModel: Identifiable {
    let id: String = UUID().uuidString
    
    let title: String
    let desc: String
    let status: TaskStatus
    
    init(title: String, desc: String, status: TaskStatus) {
        self.title = title
        self.desc = desc
        self.status = status
    }
}

extension TaskItemModel: Hashable {}

enum TaskStatus: String, CaseIterable {
    case todo = "To Do"
    case inProgress = "In Progress"
    case done = "Done"
}

extension TaskStatus: Identifiable {
    var id: String {
        rawValue
    }
}
