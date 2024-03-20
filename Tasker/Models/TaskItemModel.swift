//
//  TaskModel.swift
//  Tasker
//
//  Created by Prateek Sujaina on 14/03/24.
//

import Foundation

struct TaskItemModel: Identifiable, Codable {
    let id: String    
    var title: String
    var description: String
    var status: TaskStatus
    
    init(title: String, desc: String, status: TaskStatus) {
        self.id = UUID().uuidString
        self.title = title
        self.description = desc
        self.status = status
    }
    
    mutating func update(
        title: String,
        description: String,
        status: TaskStatus
    ) {
        self.title = title
        self.description = description
        self.status = status
    }
}

extension TaskItemModel: Hashable {
    static func == (lhs: TaskItemModel, rhs: TaskItemModel) -> Bool {
        return lhs.id == rhs.id
        && lhs.id == rhs.id
        && lhs.title == rhs.title
        && lhs.description == rhs.description
        && lhs.status == rhs.status
    }
}

enum TaskStatus: String, CaseIterable, Codable {
    case todo = "To Do"
    case inProgress = "In Progress"
    case done = "Done"
}

extension TaskStatus: Identifiable {
    var id: String {
        rawValue
    }
}
