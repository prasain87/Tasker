//
//  TaskStatus.swift
//  Tasker
//
//  Created by Prateek Sujaina on 05/04/24.
//

import Foundation

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
