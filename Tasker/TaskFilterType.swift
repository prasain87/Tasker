//
//  TaskFilterType.swift
//  Tasker
//
//  Created by Prateek Sujaina on 20/03/24.
//

import Foundation

enum TaskFilterType: String, CaseIterable {
    case all = "All"
    case todo = "To Do"
    case inProgress = "In Progress"
    case done = "Done"
}

extension TaskFilterType: Identifiable {
    var id: String { rawValue }
}

extension TaskFilterType {
    var taskStatus: Set<TaskStatus> {
        switch self {
        case .all:
            Set([.todo, .inProgress, .done])
        case .todo:
            Set([.todo])
        case .inProgress:
            Set([.inProgress])
        case .done:
            Set([.done])
        }
    }
}
